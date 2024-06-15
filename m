Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E89099D9
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2024 22:19:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38B6CDF8;
	Sat, 15 Jun 2024 22:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38B6CDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718482747;
	bh=pCrt5S/DSr4PuaTph6fAbVYP8xLs36/o9IobvSvkmWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9lblfihuaFpa73XDoGhDu6aGSvlXniL5xq4MACoTiYT/B7USrZVI97iHjrnBN9sv
	 9TS0dbevYxX/vwM/lOevD/mBHWG4NrhSbgDn2Dg8SS+viSrPttIZIXU16BVTi/ciLM
	 85D5C3su1ae/9azDXAjvYakang2mVVxzJRjt1A44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256DEF805AF; Sat, 15 Jun 2024 22:18:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DBFF805AE;
	Sat, 15 Jun 2024 22:18:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1014F80448; Sat, 15 Jun 2024 22:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24F1FF800FA
	for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2024 22:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F1FF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SyxHC6nz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 627C160BF9;
	Sat, 15 Jun 2024 20:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA92C116B1;
	Sat, 15 Jun 2024 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718482614;
	bh=pCrt5S/DSr4PuaTph6fAbVYP8xLs36/o9IobvSvkmWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SyxHC6nzwAqquEmlQKWKNXLyElDe5jUKPt6chW4nG+46PVMrYoDApoC/kKCDFSnJI
	 fAkn4CBnx5IfRrLOlijGAHhIoru3V+uevAY+7eNz2JS6eu10cbHXldk7ZxVTLAu/Q7
	 TLI2F4j/TZRlJhJoSARBcW1pSo7hyCPHELLfZTOkrn0T7SKL0iGA7LFUF61udFjjk4
	 YIZPNdeLjcgxU6k03a2omJCUTTd0i7+Aki9f5Wtz2y6SWuDPQyMfLWPHXo13Li8zr8
	 mAqS8DoD4tBM+uuQ1Gy8VsXExlDoLKtJJ80z+cGsn1ygLDngoMOCZ11CFvde4qgtce
	 kcjAJpeABYrUQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Banajit Goswami <bgoswami@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
Subject: Re: [PATCH v4 0/3] ASoC: codecs: lpass: add support for v2.5 rx
 macro
Message-Id: <171848261202.320905.12613370824204863532.b4-ty@kernel.org>
Date: Sat, 15 Jun 2024 21:16:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: 4S2N7WCZDVS5LUNYVJISFRGIQIUB6ZRX
X-Message-ID-Hash: 4S2N7WCZDVS5LUNYVJISFRGIQIUB6ZRX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4S2N7WCZDVS5LUNYVJISFRGIQIUB6ZRX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 11:49:30 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to reading codec version and also adds
> support for v2.5 codec version in rx macro.
> 
> LPASS 2.5 and up versions have changes in some of the rx blocks which
> are required to get headset functional correctly.
> 
> Tested this on SM8450, X13s and x1e80100 crd.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: lpass-macro: add helpers to get codec version
      commit: 378918d5918116b95300dd7f03913a1d0841f223
[2/3] ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      commit: dbacef05898d65f586fb9b90ba367e6bf898d68d
[3/3] ASoC: codec: lpass-rx-macro: add support for 2.5 codec version
      commit: 432e5074f805d0f976c7430af376a0dd07f1c6d7

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

