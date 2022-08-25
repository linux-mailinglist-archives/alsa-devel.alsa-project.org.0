Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2325A15B9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 17:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BCBC15E5;
	Thu, 25 Aug 2022 17:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BCBC15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661441355;
	bh=PcjVIAYMkkfsODQkXxJEf6wliajJqMnE/RTILFVmcFo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFa7D5taj9CYfsc5CCiW4MFfnJaB3jei7pnU5j3u5vuwrWUmUgfq2tc+FWHiJoUQj
	 LgVfqQzjY8T6ZCd1naT2nFnCrKkjiY11fuCW4Flo7T3K6P71DxdcGbImqHeDuW7cmq
	 XyP47X4PtMYby5sX/7UvcScuQZsbsSR2CTgg4TLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95BBF80271;
	Thu, 25 Aug 2022 17:28:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1A7BF8025A; Thu, 25 Aug 2022 17:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05FE0F800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 17:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FE0F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r4z1ZEmg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94148B82A1D;
 Thu, 25 Aug 2022 15:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682F0C433B5;
 Thu, 25 Aug 2022 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661441287;
 bh=PcjVIAYMkkfsODQkXxJEf6wliajJqMnE/RTILFVmcFo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r4z1ZEmg3T1Lhyb4jNf0hMpdVrLftix03K4Mpjw/qzMhpGO64vn9Wo4K4kqptcRjf
 f4tc4vdseBnjYiEcWKeIII38wNT2gqCZaSE1wNTHRog4zr3sC7u+mEL0AaRxTqRROv
 d/UD2hRfdK730jyWI5sqgGnx8+5mUyT/W7+sBlgm5USVgJX9Fd/k4a3Brvl3p3RnCQ
 fEGj4ZeSDYd7dZ5X/X0KUl8hfMNXUdf0NB2PHpM8/EY3DpYJeshh2/xz9YxFb9UgEh
 RPWwaGlFv79fx3KqczejL3LPbA6NfQ0KyUOq0wjU+bztkXpA3L8QkIx6i2vWKnvoHS
 xtT/428jcm62A==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, festevam@gmail.com, shengjiu.wang@nxp.com, perex@perex.cz,
 nicoleotsuka@gmail.com, tiwai@suse.com
In-Reply-To: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_aud2htx: register platform component before
 registering cpu dai
Message-Id: <166144128309.526608.9889332004047855940.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 16:28:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 25 Aug 2022 20:27:39 +0800, Shengjiu Wang wrote:
> There is no defer probe when adding platform component to
> snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()
> 
> snd_soc_register_card()
>   -> snd_soc_bind_card()
>     -> snd_soc_add_pcm_runtime()
>       -> adding cpu dai
>       -> adding codec dai
>       -> adding platform component.
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/2] ASoC: fsl_aud2htx: register platform component before registering cpu dai
      commit: ea532c29972df96fda20393d9bf057e898f5e965
[2/2] ASoC: fsl_aud2htx: Add error handler for pm_runtime_enable
      commit: b1cd3fd42db7593a2d24c06f1c53b8c886592080

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
