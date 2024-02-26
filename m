Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71397868102
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 20:29:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA89B846;
	Mon, 26 Feb 2024 20:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA89B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708975789;
	bh=w09eVwNl/udBZSm14ewjIAURwXfKkMekAoVbB7ELkK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MenlmgTb/Gjb0Ks0GsKKuEtD+kTfmUgo+LPWPYv/+9feMSKBkQme8KCvWhaSTBemV
	 841rRlwTa9nSM1MN0woB/cH8k33RwV2POZ309iJB/b0SVeKygiuSRiPH69DJVkdS5o
	 eFx3mQvqbS5QV93S3bd/rpTo17STDd5dHRFvo7LM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B77AF805C3; Mon, 26 Feb 2024 20:28:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E671F805C6;
	Mon, 26 Feb 2024 20:28:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AB40F80246; Mon, 26 Feb 2024 20:28:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C144EF800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 20:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C144EF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XDn2P28F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7406ECE0451;
	Mon, 26 Feb 2024 19:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AB5C43390;
	Mon, 26 Feb 2024 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975704;
	bh=w09eVwNl/udBZSm14ewjIAURwXfKkMekAoVbB7ELkK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XDn2P28FvP1BUb8/iHdXPrLLEU/UcXEvXdDNNArcIcqJZmopOzPChOLnkKiKAUbz+
	 CEO/zV216e0VjFSo1EC1Rr1j1BQwwcmRzHnCSefgLLFUvsFX93B7tWb2h5owJ7cvzP
	 C5fIRWg6+iD1/GsiKk6BG3mPMXvi42pwxqZoV/C6QUwMODC2pEdR5WfKDUD3VkgWHU
	 YvWaPutNbMJ/zAab0RAZp8eczvG8dfWNQ3srVwb92OgjuNdZNzoLm6YKSFVUgPQaOO
	 eOUaH8+EmPDYO8gVQK7cxttQtpmXlit5AvbP8uGv0FX4g74BbZBBj+7nIbCRiMI6ij
	 pQV0W0w4n4olw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/6] ASoC: meson: axg fixes and clean-up
Message-Id: <170897570345.121037.4947854271427341182.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:28:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: PXUXYBQXJJG7RYVAMYQTDSTTQIEMFLRZ
X-Message-ID-Hash: PXUXYBQXJJG7RYVAMYQTDSTTQIEMFLRZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXUXYBQXJJG7RYVAMYQTDSTTQIEMFLRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 18:51:06 +0100, Jerome Brunet wrote:
> This are various fixes and clean up gathered while working on Amlogic audio
> support. These help better handle higher and unusual clock configuration
> for TDM, SPDIF or PDM.
> 
> Jerome Brunet (6):
>   ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
>   ASoC: meson: axg-tdm-interface: add frame rate constraint
>   ASoC: meson: axg-tdm-interface: update error format error traces
>   ASoC: meson: axg-spdifin: use max width for rate detection
>   ASoC: meson: axg-fifo: take continuous rates
>   ASoC: meson: axg-fifo: use FIELD helpers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
      commit: e3741a8d28a1137f8b19ae6f3d6e3be69a454a0a
[2/6] ASoC: meson: axg-tdm-interface: add frame rate constraint
      commit: 59c6a3a43b221cc2a211181b1298e43b2c2df782
[3/6] ASoC: meson: axg-tdm-interface: update error format error traces
      commit: 48bbec092e4cf2fe1d3f81a889ec176e83aee695
[4/6] ASoC: meson: axg-spdifin: use max width for rate detection
      commit: a2417b6c0f9c3cc914c88face9abd6e9b9d76c00
[5/6] ASoC: meson: axg-fifo: take continuous rates
      commit: 8b410b3c46128f1eee78f1182731b84d9d2e79ef
[6/6] ASoC: meson: axg-fifo: use FIELD helpers
      (no commit info)

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

