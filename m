Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14F96BA02
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 13:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1546A4A;
	Wed,  4 Sep 2024 13:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1546A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725448648;
	bh=Jj1AXLFWSFwa1lBfs7Lb7kO6lWhFqV1keaN9te6tQp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s55+9Q+qvV4YmS+jO1r5J6cmj86GFu5rxGU/BzufqMrclVAYkC6sNRhgLlf+KtiO5
	 uZLEvWon+KYkgVu++H5h3uT+iOIRBYq9zjy+NE8uNdpstFqP053wiPGYJ8dEE2QRVW
	 LWsOBKBiGIwxKa0dj5pOxF3wmdDdF7fkl+ipwFSc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B81F804FC; Wed,  4 Sep 2024 13:16:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC18AF80527;
	Wed,  4 Sep 2024 13:16:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE01CF80199; Wed,  4 Sep 2024 13:16:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088ABF80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 13:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088ABF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hurlg39V
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D12D5C10CC;
	Wed,  4 Sep 2024 11:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3372BC4CEC6;
	Wed,  4 Sep 2024 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725448608;
	bh=Jj1AXLFWSFwa1lBfs7Lb7kO6lWhFqV1keaN9te6tQp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hurlg39VIY6As49UIQruIlCvYCA0ZI5dx8lTHkg7Q/VsKS38UaQnopdJn7YQYFLvc
	 fhygxGgV7hqhUWKaPia/zXgF6DvaXmp98Ifs44gcOXZ+MSO2Nrt310Fi3WYDHIL/tx
	 GmdlP1VX34bXU1I5bFDy2oDzG0icsCZ0t+RlixXSpbTALuDe0jbM3yXzwH7NBVwya2
	 7EE5R6ayuRLpU4lNNBMf3ybFLHF3cQbo+DK2hVYEHEK89Tau9YC7JtaLbaUtiuksmH
	 C/FCSzFTjN9uBcZfaDNBasYdxFwca1cdrcLv2YL4Zc7EtgmkjxE4P3AwFHzFW0wCtt
	 hN7y80EU5G3hA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 00/12] Add i2s/tdm support for acp7.0 and acp7.1
 platforms
Message-Id: <172544860692.19172.9426313558794623698.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 12:16:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: JJLAW5F5MMQXX3WWGYJ4KNCA2ZFZXGDO
X-Message-ID-Hash: JJLAW5F5MMQXX3WWGYJ4KNCA2ZFZXGDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJLAW5F5MMQXX3WWGYJ4KNCA2ZFZXGDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Sep 2024 17:04:15 +0530, Venkata Prasad Potturu wrote:
> 1. Refactor acp generic driver to support all platforms.
> 2. Add i2s/tdm and support for acp7.0  and acp7.1 platforms.
> 
> Venkata Prasad Potturu (12):
>   ASoC: amd: acp: Refactor TDM slots selction based on acp revision id
>   ASoC: amd: acp: Refactor I2S dai driver
>   ASoC: amd: acp: Update pcm hardware capabilities for acp6.3 platform
>   ASoC: amd: acp: Add I2S TDM support for acp6.3 platform
>   ASoC: amd: acp: Update pcm hardware capabilities for acp7.0 platform
>   ASoC: amd: acp: Add I2S master clock generation support for acp7.0
>     platform
>   ASoC: amd: acp: Set i2s clock for acp7.0 platform
>   ASoC: amd: acp: Modify max channels and sample rate support for acp70
>     dai driver
>   ASoC: amd: acp: Add I2S TDM support for acp7.0 platform
>   ASoC: amd: acp: Add pte configuration for ACP7.0 platform
>   ASoC: amd: acp: Add i2s  master clock generation support for acp7.1
>     platform
>   ASoC: amd: acp: Add I2S TDM support for acp7.1 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: amd: acp: Refactor TDM slots selction based on acp revision id
        commit: cd60dec8994cf0626faf80a67be9350ae335f7e9
[02/12] ASoC: amd: acp: Refactor I2S dai driver
        commit: 093184a3fe443f31a13ffa5d8d6d29ae68a4335d
[03/12] ASoC: amd: acp: Update pcm hardware capabilities for acp6.3 platform
        commit: 973e9edea93943924638040f9c6eb849163bd421
[04/12] ASoC: amd: acp: Add I2S TDM support for acp6.3 platform
        commit: 13aeb56e6dacaa392cde42df86096dfdbeef5ac4
[05/12] ASoC: amd: acp: Update pcm hardware capabilities for acp7.0 platform
        commit: 7a040cc5579708a327b2d82caa26ab9a02623343
[06/12] ASoC: amd: acp: Add I2S master clock generation support for acp7.0 platform
        commit: fb2eaec6a38d853437c4a83b0c7168ef77536094
[07/12] ASoC: amd: acp: Set i2s clock for acp7.0 platform
        commit: 13073ed06a9f0234033d31e0ccba1e3167d500a3
[08/12] ASoC: amd: acp: Modify max channels and sample rate support for acp70 dai driver
        commit: b24df4fa40cc236ccea3de74d9cdb25c2906013b
[09/12] ASoC: amd: acp: Add I2S TDM support for acp7.0 platform
        commit: b80d5a0c875fa0a708be24260d8f160d31273b1b
[10/12] ASoC: amd: acp: Add pte configuration for ACP7.0 platform
        commit: f6f7d25b11033bdbf25d800572c003fced21a035
[11/12] ASoC: amd: acp: Add i2s master clock generation support for acp7.1 platform
        commit: 1150c18ba35376518b6ed9af3e96c671336fa5c7
[12/12] ASoC: amd: acp: Add I2S TDM support for acp7.1 platform
        commit: 3f600592fa0ca1599326e20aa22e845de5fc8ac5

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

