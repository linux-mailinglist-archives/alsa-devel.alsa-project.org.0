Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5586B82735
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Sep 2025 02:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16223601F1;
	Thu, 18 Sep 2025 02:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16223601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758156843;
	bh=+FBmA4lDJDSUDdoIV2K0GjrQwG2LERKThN5In0vWyh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=smyQpE/N46nOnlHAY5YIKTXXXwqeW/iFF2Gk2tnpOF4UEYkT3MTm2BouRyhbD/Clk
	 +PU/O2Ssd4OUy9hWf7BgwyXZ2OseMa7P31YZ+ABzRBN3AeDQ1n4ELS1+/3JdrXYGhl
	 aN2iR4j9WanP0fOXdyNNbHihXCwoXjD9r9YloHhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A640F805C2; Thu, 18 Sep 2025 02:53:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7648EF805C6;
	Thu, 18 Sep 2025 02:53:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D33CF80185; Thu, 18 Sep 2025 02:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E207BF80153
	for <alsa-devel@alsa-project.org>; Thu, 18 Sep 2025 02:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E207BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C+1lyL5F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7741439A4;
	Thu, 18 Sep 2025 00:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE03C4CEF5;
	Thu, 18 Sep 2025 00:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758156747;
	bh=+FBmA4lDJDSUDdoIV2K0GjrQwG2LERKThN5In0vWyh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C+1lyL5F6d5y8GLG7XYaZhgcHbjeoVVR8NHTe9u3ZVIpU9UXibD+9OFo5pqg+sd0n
	 Qj7/FHqhl3kaAgRI0fnrjZDIMDjZ8Wp4Gz7jTtcNO5w/PD+qP5zUdoVFCfb+79cJ6R
	 l8/pAhCDAS2hH3Es6Sb0GUTROlsrsIVSEv8O2Tb6+nlrHa2mM8aKDU9JhaKlOxlIhQ
	 1g+Ud1/NS+UJ08DzCw60sW8lW1LwrLdKIAQJpblK/rYGfL5YDHvdQvutXZd/+3xE+J
	 hWjvV01mmr/UR/spA73bKTIsTxfzojwUx0Z9NuzJhHJpCjC+Ry+0Qk04jMoNI1e1zt
	 l3EkHd2FEqQQQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <766cd1d2dd7a403ba65bb4cc44845f71@realtek.com>
References: <766cd1d2dd7a403ba65bb4cc44845f71@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Adjust SAR ADC button mode to fix noise
 issue
Message-Id: <175815674591.268333.2624904445631478642.b4-ty@kernel.org>
Date: Thu, 18 Sep 2025 01:52:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
Message-ID-Hash: QM74LZKADEYWWGUAL35Y6RZCJL5LZ3SS
X-Message-ID-Hash: QM74LZKADEYWWGUAL35Y6RZCJL5LZ3SS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QM74LZKADEYWWGUAL35Y6RZCJL5LZ3SS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Sep 2025 08:11:43 +0000, Jack Yu wrote:
> Adjust register settings for SAR adc button detection mode
> to fix noise issue in headset.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue
      commit: 1dd28fd86c3fa4e395031dd6f2ba920242107010

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

