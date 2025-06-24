Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC19AE6A25
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jun 2025 17:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6140601A7;
	Tue, 24 Jun 2025 17:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6140601A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750777713;
	bh=lNuGpTglA1xWVARRppW3/GXkc1nKOENfAIdFsAdOPmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aVzIKMsIdMcaLn+kGNZjL/LgQO5J9XgU7qqFywKTPOouRDD4rs2Nkqqo659J4dRb6
	 wFaP3SpbQPFpwi0MFzOSJzfwOvvozpwGtqjqc6LMTkmyBubVKjPVqAxpfwm2fO9B6Q
	 kSTbby4JYsTmPJWcGMiUBZfFoSOvk6Z0fZ00orI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CAE3F805C8; Tue, 24 Jun 2025 17:08:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4199AF805BA;
	Tue, 24 Jun 2025 17:08:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C533F804CF; Tue, 24 Jun 2025 17:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FC56F80087
	for <alsa-devel@alsa-project.org>; Tue, 24 Jun 2025 17:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FC56F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KWkIi62G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAC7660010;
	Tue, 24 Jun 2025 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17997C4CEF0;
	Tue, 24 Jun 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777671;
	bh=lNuGpTglA1xWVARRppW3/GXkc1nKOENfAIdFsAdOPmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KWkIi62GbS4u/xjxNj+cVWe93yKi/Vf8G4EUkXEFzDHMe6s93ri8yBtQp+g3Gg9mS
	 DFfUmjTJstkWXpTOGukBuB/EHsofRX2TQrD59eGuREXQU4BFMo3DGeFyVJ19erS8WA
	 60SesLa9tenv7GhXfcRRX7ejICyXXkK5KDAkTK3bu0JOWk/CdaVSLeuGfnFnHEDK11
	 8MCj8Z40aC/FYbKVmXoiyul3aiNqbqykbeq3wTbYUc6Cbrm2qdcFIOk+UOUlSg6FHq
	 0O1j0Z1jM9Zhh6OMy6VHFGD+UIu4FabsFEOFm85jAwroAJDxRnMsy7mTkAI7st5XXF
	 P/sf6HJhgiaxA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <1b18fcde41c64d6fa85451d523c0434a@realtek.com>
References: <1b18fcde41c64d6fa85451d523c0434a@realtek.com>
Subject: Re: [PATCH] ASoC: rt721-sdca: fix boost gain calculation error
Message-Id: <175077766983.151254.7246369941022166859.b4-ty@kernel.org>
Date: Tue, 24 Jun 2025 16:07:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
Message-ID-Hash: RY5HWY3MGTLCN2SMR3XGMRTLBSL7GI34
X-Message-ID-Hash: RY5HWY3MGTLCN2SMR3XGMRTLBSL7GI34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY5HWY3MGTLCN2SMR3XGMRTLBSL7GI34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Jun 2025 02:59:28 +0000, Jack Yu wrote:
> Fix the boost gain calculation error in rt721_sdca_set_gain_get.
> This patch is specific for "FU33 Boost Volume".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt721-sdca: fix boost gain calculation error
      commit: ff21a6ec0f27c126db0a86d96751bd6e5d1d9874

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

