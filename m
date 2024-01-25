Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032A383C3DE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 14:40:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F0A844;
	Thu, 25 Jan 2024 14:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F0A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706190007;
	bh=0tuy6GEVRrKQ5bot/Lr2qtgg/AXUvX/ywKsN+q6SiW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgd5kEP/i1DB9QbcGulHFarvjQS9k6gRMjVr1CJnUXRoD14IL7f7IWpnexKuvfE20
	 63eah13VQsEF/o+BP9Fa7hSEmZqZmh72DHRLxFDdPueMrwnFGJMi4Puj+ioyElfI/H
	 Aa0d6ZE97W3hO3dlxfmLADJPemeg0VGFlWb1Gu5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0004DF8056F; Thu, 25 Jan 2024 14:39:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42984F80571;
	Thu, 25 Jan 2024 14:39:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F1C8F8028D; Thu, 25 Jan 2024 14:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEAD9F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 14:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEAD9F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pslgSeKk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4591662208;
	Thu, 25 Jan 2024 13:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622BDC433C7;
	Thu, 25 Jan 2024 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706189957;
	bh=0tuy6GEVRrKQ5bot/Lr2qtgg/AXUvX/ywKsN+q6SiW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pslgSeKkPKyQXkgrur55XxvFR3e3YeMy5/Dobj9fNsOzDGAzXXCXlDQ1CyGbHhvwA
	 A5OBa4tWwRq3iBA4WA7UL7/RK8qaubOoapdRTTmgY209U/EviVlEXJuW+hUgh4jLPp
	 NHfa/sp79nD6A48lB+SuifrT+PJcA+a/PtU3ptq6AZKAJ6GZf67PSacgjmJAtbMWpG
	 NAsOA66PIKhOk0bSQtsTBZSqXF5x+MdfgbK3OVuuMViotAscC92amXq88qkyzmIrYu
	 5x+VO5kIaGRaf7TL0WjVBMyoPZpOzOsNFLPEF55nRKgs+b2px62x6uda7893sLm8/W
	 mIP/1Zn26ljTQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com,
 zhangyi@everest-semi.com
In-Reply-To: <20240124064806.30511-1-zhuning0077@gmail.com>
References: <20240124064806.30511-1-zhuning0077@gmail.com>
Subject: Re: [PATCH 0/1] ASoC: codecs: Adding new volume kcontrols
Message-Id: <170618995612.31781.16854568323682735164.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:39:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: ZE3GUDTMJS34HYB3POS346B5IN3JTR5O
X-Message-ID-Hash: ZE3GUDTMJS34HYB3POS346B5IN3JTR5O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZE3GUDTMJS34HYB3POS346B5IN3JTR5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 14:48:05 +0800, Zhu Ning wrote:
>     a patch here for the es8326 driver...
> 
>     We add a new volume control.We compiled the new version patch in
>     for-next branch. We did test with the new driver in machine.
>     The test result met our expectations.
> 
> Thanks,
> Michael.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Adding new volume kcontrols
      commit: 966323dd9a65dde599f59176280468a0cb04c875

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

