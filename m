Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80B2B550E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:34:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A85EF1755;
	Tue, 17 Nov 2020 00:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A85EF1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569687;
	bh=IydiCbo8tDV2y2wade3NokSL+pzfPQAOkBc2FrMvzb4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBz1i6FetVbqaw7qJViQmW+P6+ZmhcnQqSO+PqxQdytco95tLF/tFRGiHhcqH0RFV
	 B8PsmX8Gmy5aIX4WMErYuKrkPzhIiPVNy1CyhJzBEwLODxLmBz11CLHbM3RVAZe+k+
	 aFFnjBivs2/8o8EqKd50uhvQiOjY6YSPJxxn7eYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA49F800D8;
	Tue, 17 Nov 2020 00:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D757AF8010A; Tue, 17 Nov 2020 00:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39AA4F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39AA4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xj/UEouX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8492221F8;
 Mon, 16 Nov 2020 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569584;
 bh=IydiCbo8tDV2y2wade3NokSL+pzfPQAOkBc2FrMvzb4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Xj/UEouX9p5sOji8xwirF6rTa/3aEKnFVRg41Hb8L+qDTNeNLANGOq7JttrzWgPiz
 qkFUbhRSe+TpwARJi9r7jx1++Zsd38juqSk8+Zgaua6jrhphLoh8/qaUytMiG7Aj0f
 XeibkFxX3vpUSZb3dlaGygzbElxZQrn7qTorVhFw=
Date: Mon, 16 Nov 2020 23:32:45 +0000
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, bgoswami@codeaurora.org, rohitkr@codeaurora.org,
 robh+dt@kernel.org, perex@perex.cz, plai@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, tiwai@suse.com
In-Reply-To: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
References: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Add 32 bit format support for
 capture
Message-Id: <160556956527.29683.2982806188163092654.b4-ty@kernel.org>
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

On Mon, 16 Nov 2020 13:19:15 +0530, Srinivasa Rao Mandadapu wrote:
> Add 32 bit format support for capture in lpass-sc7180
> snd_soc_dai_driver capabilities. Need to add contstraints
> in machine driver so that only specific format allowed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Add 32 bit format support for capture
      commit: 313ebec48dedcac351557b5a84b8b2239951c238

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
