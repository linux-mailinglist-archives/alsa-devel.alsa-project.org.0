Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF01750728
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BD0203;
	Wed, 12 Jul 2023 13:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BD0203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162753;
	bh=fLC48/I8luMg0p8m92E+RBKv4kMxCtVOV08mEiVUYUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pVoxnXlbkWIspmCB69nrP54EuYyGaVfGOuvoE6+qTOuWR6tOezHYyFehjfb/9Jaxo
	 X2kQfpnHyUDNjo3iAMd1uZcQvxvJBC3NfaC82NDI4/ck5wQ8xah/R3YaYkpF7jT8kc
	 m66JcZZXs+8vw0SUmei10y1ZfG09kQeBKL2sPAn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40AEDF80236; Wed, 12 Jul 2023 13:47:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 485BAF80634;
	Wed, 12 Jul 2023 13:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A84A2F8061E; Wed, 12 Jul 2023 13:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7933F80606
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7933F80606
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mh8gdXBl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98944617A1;
	Wed, 12 Jul 2023 11:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6002C433CA;
	Wed, 12 Jul 2023 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162446;
	bh=fLC48/I8luMg0p8m92E+RBKv4kMxCtVOV08mEiVUYUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mh8gdXBlcbxDr9KUKTPxz3cgmut/us2cqM5ScFQAJ6JFXSsmK+Pvp90akHPZE0b50
	 igeRFEHYoasz3gt7mhcyXMdDBYEzzfZz8UehU+TmUxigGT55phsxF2tWr0E8k4s295
	 OOgiuCbuGFCmrEhe9O0NvT9YTC5pwhfAwnq3vLswqGRlvF61XePeNlcgfE1cBQr6sb
	 6OUE6sHRjgRPYT2MQlZCoSk06N6xdvxwauPyOZPOij4NZzzhVflpWXUxktjuIt4fer
	 JqZMv+yQbapzo3zNK3hekeUU9W4yyh9zqpBNWHdrFUIhJO7BFFYOGlcngKou8qKke3
	 fYb3B4ZzeWWhw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 brent.lu@intel.com
In-Reply-To: <20230705042931.24950-1-shumingf@realtek.com>
References: <20230705042931.24950-1-shumingf@realtek.com>
Subject: Re: [PATCH 3/3] ASoC: rt5645: add the system level suspend-resume
 callback
Message-Id: <168916244439.46574.6787645577577124471.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: AP7R4VRFRTW4SVKADSKPCADL2GGNAUAS
X-Message-ID-Hash: AP7R4VRFRTW4SVKADSKPCADL2GGNAUAS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AP7R4VRFRTW4SVKADSKPCADL2GGNAUAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 12:29:31 +0800, shumingf@realtek.com wrote:
> This patch handles the regmap settings and re-detects the jack when the system level
> suspend/resume.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: rt5645: add the system level suspend-resume callback
      commit: c7a0f10b885164e4804dc144c375076c2e0d39f6

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

