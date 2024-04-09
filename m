Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E789E5A5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 00:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272F72BD0;
	Wed, 10 Apr 2024 00:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272F72BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712701619;
	bh=8cZekgTFyTNmCQ5JQgsxxvVJ96RimfnYW8ek5fsuDyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qZS+yh+09em+zOgWv1FeJx0bNqnTvjiAwC2sj7Sd53/aXJ4uAEv9ZrXTDSNnNzUDG
	 kqCSUaDV6636MWVeODIDZ+LBz5A08gWUS5LCtTuo476hBUoPKXYS0CL1PY3cckQqxk
	 FN/IA0qdOqTmamSH4PMZImkG1+eqkyb1KLnLM1CE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8D5F805B6; Wed, 10 Apr 2024 00:26:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C593BF805B6;
	Wed, 10 Apr 2024 00:26:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87C7FF8026D; Wed, 10 Apr 2024 00:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5CC5F80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 00:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CC5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GmGbF3ub
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E0E6CE2444;
	Tue,  9 Apr 2024 22:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1574C433C7;
	Tue,  9 Apr 2024 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712701560;
	bh=8cZekgTFyTNmCQ5JQgsxxvVJ96RimfnYW8ek5fsuDyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GmGbF3ubyfK4yd1taUBHeFeXGmDUQVta/AYhOOdarPuonHU8F9Knt2np/egqHooW0
	 NThz/Pmni6b1APouzSbzllB+pgYhXmUpw4oTlAoKlW5TWuk3x5C4jH+7MYxUa9Q6ZE
	 ybahsMuPP0aUJoYM/qNRqWZvx0Kux4ClM/Da2YkCbNI4jlsQ8OBvZqHQk3wbzZdRtQ
	 Ka5GOplG9aJKfYuzqOwLArKeH+6SSXpRMtsbpgUQ/HwJp0LgVliRWg2bZFFL3RHGqD
	 HQaBBuBveZbv1ufDlWI/l66OkGE/wXpbUEPS2nuY9EOBNfRPxcfRkghyAzwsSX0kVl
	 PzVteM1Ffqu7g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <6a9b1d1fb2ea4f04b2157799f04053b1@realtek.com>
References: <6a9b1d1fb2ea4f04b2157799f04053b1@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt722-sdca: modify channel number to support
 4 channels
Message-Id: <171270155851.193711.18007434817178178019.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 23:25:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: QOAF5JPQR6IEHULUTR2T4E44JFYFIEU2
X-Message-ID-Hash: QOAF5JPQR6IEHULUTR2T4E44JFYFIEU2
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Apr 2024 06:47:43 +0000, Jack Yu wrote:
> Channel numbers of dmic supports 4 channels, modify channels_max
> regarding to this issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt722-sdca: modify channel number to support 4 channels
      commit: cb9946971d7cb717b726710e1a9fa4ded00b9135

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

