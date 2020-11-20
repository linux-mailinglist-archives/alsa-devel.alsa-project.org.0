Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6C2BB85A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290B81782;
	Fri, 20 Nov 2020 22:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290B81782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605907925;
	bh=pOuyaDaW7QcHVNiuG61HXZ9kLTRtaijcK5eYNujh0+0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XF/d5ElRDJN0BRSe4f6wkemA9awTPQuIBnNtMPew7NZ3/p5OuZMUxsU1abc0M7PsQ
	 rYFlFbL/mKBPNi5oAdOyHFAZiU5gqefCPq9bWh0Rv9br1YxUHuCwcijBYvAyvsh9ix
	 R1GaMpl2ME1tcLIOLjY93mzdzD7xuP8Xsv+t0k/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC307F804CA;
	Fri, 20 Nov 2020 22:29:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 620AFF804B4; Fri, 20 Nov 2020 22:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97D19F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D19F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z0lJzFhG"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FA9E2242B;
 Fri, 20 Nov 2020 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605907773;
 bh=pOuyaDaW7QcHVNiuG61HXZ9kLTRtaijcK5eYNujh0+0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Z0lJzFhGoK28XF3F6vIVXTBkX2pA3XDHk2xe0o4BhccCxnTJYpu4EEpIbM1F1+Um6
 sIKsikzQvk/ali7PCAkrEak0Xzkjm7w1cgMUh4WbjtohAfbn0OWhCaSzwpQOEH5ryE
 CY4qV+xk8s76Q2apJ+7vFrv+IdG2C+gBW7ITV30E=
Date: Fri, 20 Nov 2020 21:29:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201120123813.14059-1-srinivas.kandagatla@linaro.org>
References: <20201120123813.14059-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: add missing
 MODULE_DEVICE_TABLE
Message-Id: <160590773742.47461.7039529678765787843.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, 20 Nov 2020 12:38:13 +0000, Srinivas Kandagatla wrote:
> Fix module loading due by adding missing MODULE_DEVICE_TABLE.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: add missing MODULE_DEVICE_TABLE
      commit: 2b3f6f4af95594d8e9c137ddc8d6bec61f04dbb5

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
