Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5F75072D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:53:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E1A3E7;
	Wed, 12 Jul 2023 13:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E1A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162784;
	bh=6r/DgOfc+fPWaswpFujeoa60A1QNUJjakg+dkHqdXa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mMNphFwXLggkT7AO0GnV0WQSwHqPJ2JCUP7L5dnbL73KJSd9Uc7IkEMyUMr8OpBRh
	 DXhznnXTEXlD+tcXptVXA3w7wDzWrBrBmcQTscezUbVi/ZMEJ0tgew2jOLtALlTbRG
	 jh9wCVpG0h044NxhLSeLuvfO2r8bLb0TCdcPbx1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29BD5F80654; Wed, 12 Jul 2023 13:47:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 588EBF80655;
	Wed, 12 Jul 2023 13:47:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7EEFF8061C; Wed, 12 Jul 2023 13:47:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 599B6F80606
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 599B6F80606
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BEVIh46v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 481C761783;
	Wed, 12 Jul 2023 11:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB098C433CA;
	Wed, 12 Jul 2023 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162450;
	bh=6r/DgOfc+fPWaswpFujeoa60A1QNUJjakg+dkHqdXa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BEVIh46v8Oget9RsMUPh0ntpPkvsno9ldOhV2XgMciCumQQWUqOMwtmBhrSiCIv1Z
	 qmWPC//JJ2EjYb8S4h8kYtBXMPha/HuPWXpe95i11bKBAfBZXX1Mz4PE5W4zzfMeZc
	 egdam3LhUAwGoSUZPITu8gIJ5dxaopvza7Pj/6gQ3WszC87DyBACXzaxWhU1zfUbJS
	 5EK8T1J9hebOinR52VFv/PeQflKDKQEg+wVM+Z0t8Kde0xRE/UsgJ84p5WqygLNkUz
	 G/YL2olurC4EJt+EVD9pwTpdwwyu0kpv17CxrYgojjzjxDfpcNWuvRR7YNTKXqBnME
	 AYJwoxMnteeXQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: vsujithkumar.reddy@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, mastan.katragadda@amd.com,
 arungopal.kondaveeti@amd.com
In-Reply-To: <20230707120730.1948445-1-venkataprasad.potturu@amd.com>
References: <20230707120730.1948445-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 0/4] Add acpi mahine id's for vangogh platform and
Message-Id: <168916244868.46574.10521865724419676060.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: AZSNMQBI5XWC22FH36FINTO7QTZUNPKR
X-Message-ID-Hash: AZSNMQBI5XWC22FH36FINTO7QTZUNPKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZSNMQBI5XWC22FH36FINTO7QTZUNPKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 17:37:26 +0530, Venkata Prasad Potturu wrote:
> This patch series is to add acpi machine id's for vangogh platform
> and add new dmi entries and machine driver support for nau8821 and
> max98388 codecs.
> 
> Venkata Prasad Potturu (4):
>   ASoC: amd: acp: Add machine driver support for nau8821 codec
>   ASoC: amd: acp: Add machine driver support for max98388 codec
>   ASoC: amd: Add acpi machine id's for vangogh platform
>   ASoC: amd: Add new dmi entries to config entry
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: amd: acp: Add machine driver support for nau8821 codec
      commit: 4b526b3278becdf1f2bfd375078f5db469f8a6bb
[2/4] ASoC: amd: acp: Add machine driver support for max98388 codec
      commit: ac91c8c89782d7d0781120a74c9bd939e3ce2831
[3/4] ASoC: amd: Add acpi machine id's for vangogh platform
      commit: ef51cddf014b3e4909e9656025d1f7c2b4cc4117
[4/4] ASoC: amd: Add new dmi entries to config entry
      commit: 197b1f7f0df183db332b6b8851a29c8bc901571d

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

