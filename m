Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D74752B99
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 22:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343029F6;
	Thu, 13 Jul 2023 22:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343029F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689279958;
	bh=T8j9XsRb+sN8cakqsJAbgzkC0Px4c+lkSL6k2EsHI8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cNuRjdADwbRulg4b4oYn0CR4z2g+wpbJLPVjWTmk2rTiJHHmmOBJXPpMQkvyAzXKt
	 Gt0itdgkvd2XWHF2/r7w62TGP/npiPXNSiKKQMUe3NpBsUd5a9di7Moa3aTq4Ni4MB
	 Wh1hDiH6yKzaPzWYNu1fOL6hpONf5AXS0d9TtGGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C864F80535; Thu, 13 Jul 2023 22:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F91F80236;
	Thu, 13 Jul 2023 22:24:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 484F9F8027B; Thu, 13 Jul 2023 22:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A70A9F80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 22:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70A9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZA1B2uDz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8100F61B57;
	Thu, 13 Jul 2023 20:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE76C433C7;
	Thu, 13 Jul 2023 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689279866;
	bh=T8j9XsRb+sN8cakqsJAbgzkC0Px4c+lkSL6k2EsHI8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZA1B2uDzFuAvq9ZAM4gBj0l+RIA5kIf4h948c2BPQALy0Yvakwu4nfbq8kZtUVL4b
	 Q5FZdVWDRaYz+FMZEkvIc+BiyBaKUn3PCZEy2k++SjySWyZiR8b7R9mO8Eh+d6hnFk
	 N/Mfk4FhIgpxPRXq0RitQm846lMOmGXa6HXlFyntibnJUg9cP5CPoCIW4JUYSS6ObP
	 pXOA0B+uIWsocHWl3TMgwrkJdGUrLU91AOJ5e9BUX9aJdlXVfvgcyhQD5RVeCG6SsF
	 jDcMr7lq6mh7OQQP2E34J6qRFKgpVzrIECMHwPxEyEVmby96p8ofA/D/KPmIaKFflT
	 ZpHsEGa3cY9nw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
Subject: Re: [PATCH 00/10] ASoC: ad: Update Analog Devices drivers to maple
 tree register cache
Message-Id: <168927986520.272917.957670510176248765.b4-ty@kernel.org>
Date: Thu, 13 Jul 2023 21:24:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: VWZ3AJ6OKB2HCUYXF4D2GMO2G7RJAKO2
X-Message-ID-Hash: VWZ3AJ6OKB2HCUYXF4D2GMO2G7RJAKO2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWZ3AJ6OKB2HCUYXF4D2GMO2G7RJAKO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 00:13:49 +0100, Mark Brown wrote:
> The maple tree register cache has now got to feature parity with the
> rbtree cache, there are some different tradeoffs made and it should be a
> better choice for most modern systems.  Convert the Analog Devices
> drivers to use the more modern data structure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: ad1836: Update to use maple tree register cache
        commit: 52beea42d825321a7ded656f14f5672b290dbd16
[02/10] ASoC: ad1980: Update to use maple tree register cache
        commit: 625ea9e6d5c4509634b49a8e7436ea3248220e9e
[03/10] ASoC: adau1372: Update to use maple tree register cache
        commit: b7fea0e30fbdc4c5cba6edbf5e5b8aabd0a5660a
[04/10] ASoC: adau1373: Update to use maple tree register cache
        commit: da27e493ce9394134deecfbecfd46c8836141191
[05/10] ASoC: adau1701: Update to use maple tree register cache
        commit: e0e3bb187bfba6ec2a0bd1b7d36fdacb6a8e3010
[06/10] ASoC: adau1761: Update to use maple tree register cache
        commit: 97e3b4845d389c8e309e13445bc02ad01fdbda7a
[07/10] ASoC: adau1781: Update to use maple tree register cache
        commit: 3841ff1bacccc253c48c2c4a2c5e087dfae4b51e
[08/10] ASoC: adau1977: Update to use maple tree register cache
        commit: a0a4cef897b550cf4beaf3fcb1742c3dc895f5f8
[09/10] ASoC: adau7118: Update to use maple tree register cache
        commit: c05c32dd82a602e5b75c3e473e55e7b6325a1967
[10/10] ASoC: adav80x: Update to use maple tree register cache
        commit: 07e835e35b5dc7e1906e2dbd6d72cb9336846ba6

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

