Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71080975311
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 14:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728D3950;
	Wed, 11 Sep 2024 14:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728D3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726059597;
	bh=8agYiCTVQpE8G2w0lJqMut2X09xN00wnGksfG2F1d4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FfuqDZHQ+Zay8cdnx6b4uhDeUulGNrdrN7duSd5k7MUEGFQ1WoaOSn8LECnvqMePQ
	 JmR4+H7ZI8Acp9egNaDNW5KpAIJE4NBMErRY0DeZx+sfHt4n942iiN7pc6y5yr//aK
	 k4hMXZJEXMFW9eg49knUXMj2DG3apk3EG3N9ukMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39517F805AF; Wed, 11 Sep 2024 14:59:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A4AF80027;
	Wed, 11 Sep 2024 14:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB66F801F5; Wed, 11 Sep 2024 14:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C875DF8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C875DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fHsEyEmp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34950A44C04;
	Wed, 11 Sep 2024 12:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34004C4CEC6;
	Wed, 11 Sep 2024 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726059557;
	bh=8agYiCTVQpE8G2w0lJqMut2X09xN00wnGksfG2F1d4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fHsEyEmpYEKOdHNCIiYXtk6L/dWrBOyXAVzVTycQdaJSjxU2xvvMRgTcDM6t3qZn0
	 OgM3LCIBnjVQNGNxeruc5fA3Vtoq5fuLacPnDQq7ZvLpZcYA+iygsbPpIYvAncl/iF
	 9ECBeseGR+z1o0boswggHuXuyeSc9/ulWOCqLWK0bYGNQyHTm9ZU2jorupbzbvjM7M
	 symiPWLVItoQ3zXHfughfpGYlpO5baQ71WkpjQDMaSBS59o2zzcopOJbB2YR5NjtGT
	 bSTelR4gTefm1OVNtVmmu66UgQUzSFpGOjzT3Pqy7lbIRonB5HL4FK6BViNp9MSqzp
	 AHkmodUGC+1XA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com,
 Syed.SabaKareem@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240911093554.2076872-1-Vijendar.Mukunda@amd.com>
References: <20240911093554.2076872-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: amd: acp: remove MODULE_ALIAS for legacy
 machine driver
Message-Id: <172605955493.57388.7500481938110885017.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 13:59:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 36KMI5TDPW6ZY4X774NFF67VNPPEOXBU
X-Message-ID-Hash: 36KMI5TDPW6ZY4X774NFF67VNPPEOXBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36KMI5TDPW6ZY4X774NFF67VNPPEOXBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 15:05:53 +0530, Vijendar Mukunda wrote:
> As module device table added for AMD legacy machine driver, MODULE_ALIAS
> is not required. Remove MODULE_ALIAS for AMD legacy machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: remove MODULE_ALIAS for legacy machine driver
      commit: bacae49eccb9a3acaf74fc275893abc26c0420b5
[2/2] ASoC: amd: acp: remove MODULE_ALIAS for sof based generic machine driver
      commit: 0b0aa67baa8904e3c1e13be48a2ca125f59ead3d

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

