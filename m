Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A99184DD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 16:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD1CDEE;
	Wed, 26 Jun 2024 16:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD1CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719413551;
	bh=EmrOuKlP9+a0u3gAUhglDb1ETNcSp4UHvd18zX8Qr2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nzBmwSeK/gVpGQWcrnfJvCoeDhPYoSxBAzWlOm/IJupOq2nQ/0AcmT0K7+9C2nhCc
	 9nq3r9cWezILKtZAZKL7Ra66grJI6EV30jOfBvIGWHQMx2twsEcgoWQQnnfa3rGRzX
	 dKL5/sWScmsJ1dU5xKih7nMai9W9a+Wt8AOOZxFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F932F805A9; Wed, 26 Jun 2024 16:52:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7D9F805B0;
	Wed, 26 Jun 2024 16:51:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B82F80423; Wed, 26 Jun 2024 16:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B04BCF8016E
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 16:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B04BCF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KuhA6brg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E856ACE1F77;
	Wed, 26 Jun 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A382FC116B1;
	Wed, 26 Jun 2024 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719413437;
	bh=EmrOuKlP9+a0u3gAUhglDb1ETNcSp4UHvd18zX8Qr2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KuhA6brg0mkyhFFvzx50d8HLTpE7JOOQy4jyRmjs6zpvc9TAx7ecs1jyJ7ETWg+4p
	 EYKWApOos/Wl7UXP2SQ2GtolMlQz8MLWoy8DJzqGziOJbf1ZidsJBB4Lvmp2b25PSJ
	 JcpEvaJpS48/ogK9d+gaokVddQFywHvUX2abaaLs0RKBJQeLBtuTFK/XxDljxTdq6A
	 GJyxB36TkhUk3Qw+1jToIwLNC3rmZibwpHrXlH6JR65g030wHd1+sD4+6dtoauiw/X
	 xi7porStEWnfzGZ/2+b+Y8lqBgFCIVzodxhC9uadGofG/P0aVfzTzOB1e58g/otMn3
	 J3WWXCQ7iE4aQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
References: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: lpass-wsa-macro: Add support for
 newer v2.5 version
Message-Id: <171941343537.1374758.899867570385507706.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 15:50:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: FRURE4YMIMLYBMU55KTWPPYDJBVOAHQU
X-Message-ID-Hash: FRURE4YMIMLYBMU55KTWPPYDJBVOAHQU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRURE4YMIMLYBMU55KTWPPYDJBVOAHQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 18:58:44 +0200, Krzysztof Kozlowski wrote:
> LPASS codec v2.5 and newer have differences in registers which we did
> not implement so far.  Lack of proper support is visible during
> playback: on SoCs with v2.6 (e.g. Qualcomm SM8550) only one speaker
> plays.
> 
> Add missing bits for v2.5 and newer codecs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: lpass-wsa-macro: Drop unused define
      commit: 04f4de6f68eec73595682f32952467591f0cc016
[2/3] ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions
      commit: 5dcf442bbbcada62631f5a376c44ff794596c2f0
[3/3] ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version
      commit: 727de4fbc5466c7150482b532f2b7f7e514134f3

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

