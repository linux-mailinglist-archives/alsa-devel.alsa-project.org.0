Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CD75C852
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE8D1F4;
	Fri, 21 Jul 2023 15:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE8D1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689947472;
	bh=YsQzXX3Iw4UgmsXP3jpsMX5rLlr+D3/qJOyXveoe34g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NIQ66HcAsewoCl+GamxqXkn75gY18la7vVcFg0WVUX0hrq6WX+airEkZxUYNzruqW
	 FHvSpQsVGDRubHZq548LKp0/FqJx85GI5f5gHygsRUjPMpsmyFL/OscVruCDwRVywD
	 JgpRSEMvwsfemDQiTBznZ++FP4aiMsQoG1l6i0aY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 674D9F8032D; Fri, 21 Jul 2023 15:50:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3337F8032D;
	Fri, 21 Jul 2023 15:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B89A7F8047D; Fri, 21 Jul 2023 15:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D70F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D70F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fwELfVEu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3844E61B23;
	Fri, 21 Jul 2023 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93751C433C7;
	Fri, 21 Jul 2023 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689947409;
	bh=YsQzXX3Iw4UgmsXP3jpsMX5rLlr+D3/qJOyXveoe34g=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fwELfVEuxyxClMKPH1dG7QgyZxtfj91aX+6/L5bchj2GmldVYbN7x7mFpfswsmShj
	 jXbi4PsTBDpp2UbuIDZI/xBC0sdllU5uRJFYYfCcC+285Kf3z1cdQjvK0+JqFd/Ahn
	 QUvNmLq31RY5dXM2FyKlujUvMS8D0HWyU3gg1F5RQWZzJGGbXrf+GaPwDUTpRz3oHX
	 OmSJSWrYyu3XEe9zKqo76zZQAUla4vtc94XOqv+nx+7EMxKS/P4y0dfZYO+8JKrm2d
	 RwMtd46frJAfAzBxmGCexFAbsuVESE37SUTG/jsiXFc531gNZSygD7T2dRc2BWJcmC
	 N+p9pM/GFhmlQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1689927842-21165-1-git-send-email-shengjiu.wang@nxp.com>
References: <1689927842-21165-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8960: Add DAC filter characteristics
 selection
Message-Id: <168994740616.98802.14306640760170381648.b4-ty@kernel.org>
Date: Fri, 21 Jul 2023 14:50:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: YOIRTQREIBTWUTAPMUCEVAFDQSXQIVNJ
X-Message-ID-Hash: YOIRTQREIBTWUTAPMUCEVAFDQSXQIVNJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOIRTQREIBTWUTAPMUCEVAFDQSXQIVNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 16:24:02 +0800, Shengjiu Wang wrote:
> Support DAC filter characteristics selection: Normal mode
> and Sloping stopband. Sloping stopband may have
> better frequency response.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8960: Add DAC filter characteristics selection
      commit: 8cf2e3b1961e59dabc75e9e917d58439164a8f84

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

