Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECE2C16A5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 21:40:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619031685;
	Mon, 23 Nov 2020 21:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619031685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606164050;
	bh=tkAsjlRH2HuuhR8vmGPp7i9n4IBY/yYjedNX3O0GBWc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NH4N7nB39P2q6ZGjntWZNxVKzwGbYDmMwMtSu3IOaamx+Uga+h/5JZ4AxvfQ7eR4/
	 fh0lkj6i3MVvCgRDdZhiqJkX8T211qrfkPPx/QTiee0xgdJ/wSaddC642LBJzBdk3P
	 fMKXGeUWDpyNaeVFuDylEBvRsdZEHmc2zMOEIwbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B60F80290;
	Mon, 23 Nov 2020 21:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61BFEF80273; Mon, 23 Nov 2020 21:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89DB4F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 21:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89DB4F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDp47rsT"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D34620721;
 Mon, 23 Nov 2020 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606163943;
 bh=tkAsjlRH2HuuhR8vmGPp7i9n4IBY/yYjedNX3O0GBWc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cDp47rsTXsD0Zxg1b/NsKf4lt7RpderIZ8vEEF8LAZ/nAR/0mX69QF205d2zkKrt6
 3vVajqui2HbJsZC/07W/zA6na//Z6rL/akH9ipLZlV+MubFknfBW9YGRXE7PqxndCU
 BfE02ZLtAdkDwsNlGi5YF4eq580KbUBy4R3Xw/QE=
Date: Mon, 23 Nov 2020 20:38:40 +0000
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, rohitkr@codeaurora.org, plai@codeaurora.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, bgoswami@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, agross@kernel.org, bjorn.andersson@linaro.org
In-Reply-To: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
References: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid
 state
Message-Id: <160616391558.20973.7389509283379786250.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Nov 2020 21:47:53 +0530, Srinivasa Rao Mandadapu wrote:
> Fix enabling BCLK and LRCLK only when LPAIF is invalid state and
> bit clock in enable state.
> In device suspend/resume scenario LPAIF is going to reset state.
> which is causing LRCLK disable and BCLK enable.
> Avoid such inconsitency by removing unnecessary cpu dai prepare API,
> which is doing LRCLK enable, and by maintaining BLCK  state information.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state
      commit: b1824968221ccc498625750d8c49cf0d7d39a4de

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
