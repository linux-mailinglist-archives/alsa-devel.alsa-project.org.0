Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB092A7B0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 18:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2732846;
	Mon,  8 Jul 2024 18:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2732846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720457862;
	bh=PCa8npqHnUycecA44yDRVAfSZz/Tb4vjGe8JijsOnOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jFvMNv1nG4PPanyv9typddNzphzgd1PSYUcqyaDxCGVTLpEIiBanR7+7s4w0R8KRI
	 yqiFCIlYWDXzKaNC5KH1muqS1w4xarYbHbwCF6TBK35cgE/fHu1f63KUeRaOnhPBYG
	 DvKW3p8dPPghwQESImMntGWRIDKWVzBat1DqJkEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAC0DF805B4; Mon,  8 Jul 2024 18:57:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 678ADF8019B;
	Mon,  8 Jul 2024 18:57:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E91CF801F5; Mon,  8 Jul 2024 18:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B538CF80074
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 18:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B538CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SnHGlxpY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F57DCE0E27;
	Mon,  8 Jul 2024 16:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA8DC116B1;
	Mon,  8 Jul 2024 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720457811;
	bh=PCa8npqHnUycecA44yDRVAfSZz/Tb4vjGe8JijsOnOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SnHGlxpYtJAMCJb2Mc3uz23Aj1k/oCplSoxg9sQQu6Xj3E7TDjH3hIuJPa/5yGJSr
	 ciiLoxdUu0r0CEESsCO40md/UqWZO4CUTd5/Chmr4GvYUtoOhbA1OQ0XZPcN2BKkPw
	 R7w6RZSEd7G926ka3nsy1n7mU9pD4xOGHgEyYhXYYNWORwbAGigbvW8g8eMSIe5XhI
	 3DK6d84LLd4ZvNISXHDWoNixDkLVxt/3CeF+OXdM8pybihmpTB02vB1aI2vHj3ObeS
	 IR0/RgnsuN8yvtQQrMevtLmjFeQ7/rSVL9e8dRliq6udtq1FLxBa5HqmaiI/vjGgqT
	 Pwyo+wkV06IsA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
Subject: Re: [PATCH 00/11] ASoC: Simplify code with cleanup.h
Message-Id: <172045780936.93798.11339150703981455652.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 17:56:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: Q4MFB3U62SCAX7TXMNCH7XRGJIHKUZIS
X-Message-ID-Hash: Q4MFB3U62SCAX7TXMNCH7XRGJIHKUZIS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4MFB3U62SCAX7TXMNCH7XRGJIHKUZIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jul 2024 14:10:54 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling
> (simpler error paths) and make the code a bit smaller.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_add_dapms() with cleanup.h
        commit: 408e49381750ca22fc584a37636f5035d2cd4c25
[02/11] ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_probe() with cleanup.h
        commit: f9cbfb66127bfc2a47dece3dfcdab2b79ab06c50
[03/11] ASoC: codecs: wcd9335: Simplify with cleanup.h
        commit: 6344ab5d0826640799e0c054ed4c0846b3f87ccb
[04/11] ASoC: codecs: wcd934x: Simplify with cleanup.h
        commit: 56d426f5525d1ad919e20663ad01a58238652df7
[05/11] ASoC: simple-card-utils: Simplify with cleanup.h
        commit: 6440e7b2a058c50a05ebcc58f35693c50522fc1a
[06/11] ASoC: audio-graph-card: Use cleanup.h instead of devm_kfree()
        commit: 5725c16af2678d334de0bcb85b42cfa50b32e04c
[07/11] ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
        commit: b39f7713ece62b2b0a3cfad7a75a0eb0ab71aa4e
[08/11] ASoC: simple-card: Use cleanup.h instead of devm_kfree()
        commit: 7d996c8a5fea700e816379e57f4983e2611519a0
[09/11] ASoC: ops: Simplify with cleanup.h
        commit: 1a7b846818210cbdf8994bfee1340c09342a5b3b
[10/11] ASoC: dapm: Simplify dapm_cnew_widget() with cleanup.h
        commit: 5b3cc85673bcc7bb961a3a6fa229cbc4fe0441ac
[11/11] ASoC: dapm: Simplify snd_soc_dai_link_event_pre_pmu() with cleanup.h
        commit: 522133d4401010d936b0588a5a975c2c965cb88e

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

