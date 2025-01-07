Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167AA04A71
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2025 20:46:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8899F60395;
	Tue,  7 Jan 2025 20:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8899F60395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736279192;
	bh=sGxi94gfxLGkDJCzrxpR5Orr8qHhvHZdpXkwSMJLyTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmiLqXgD1fe2gPYHqTUdbDIihRAndwDGW8KMhIFcZBknMz4eJr3P0ZV/Mu+AVXFs1
	 2zqTWfKPJCauw8bPAFA4qw3Iocr7mhqlbyS0SfW/K8+cQDCBrjlUSuWBmNFpGqDI9+
	 CqGyje1gSPbpJ2K6okLlA0qv+14kkF0XQQKMkJ9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA21DF805C0; Tue,  7 Jan 2025 20:45:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 916B0F805BE;
	Tue,  7 Jan 2025 20:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4DDF802DB; Tue,  7 Jan 2025 20:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0948F800F3
	for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2025 20:45:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0948F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=evr3v2Be
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 319BBA41CA4;
	Tue,  7 Jan 2025 19:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4C4C4CEE1;
	Tue,  7 Jan 2025 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279150;
	bh=sGxi94gfxLGkDJCzrxpR5Orr8qHhvHZdpXkwSMJLyTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=evr3v2Bej9V1sHBQPxLatwTsxML7LUN+xF5O7wO8Sh2m/2Xxe0G8uaF/XZBU2STL8
	 cbHfstuZqyZYFw8C2ptF1BVyCDze/7hi0hpJQOeD07j0uTbVXLMbJ5qQBM1ORFH/Zo
	 LEnUYqPdPypDFOkUlsTVVg6ub+1SnRejVNOC9M82sCO0SUyFXpjnxlU6cc7edVWm2T
	 VhrvCX99+/jEvvV5CljM9z0AzUVILyue2MG70sbK8nvWFoesW+dBPxMThQC/EbwBg7
	 sScsomYHhlkQ8gpZ5rZMhNazorHBz1OxUaGnVhfaIHQawQVqRajTZ+KYS4xa8ijFdP
	 OFD6b7MV2nuUA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com
In-Reply-To: <20241225094307.3678837-1-derek.fang@realtek.com>
References: <20241225094307.3678837-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: Support the ALC5682I-VE codec
Message-Id: <173627914885.519339.16630973483069812149.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 19:45:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: JYOTXZ24MOMG6OY2YY4OBNXJ7JCDYZ6N
X-Message-ID-Hash: JYOTXZ24MOMG6OY2YY4OBNXJ7JCDYZ6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYOTXZ24MOMG6OY2YY4OBNXJ7JCDYZ6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Dec 2024 17:43:07 +0800, derek.fang@realtek.com wrote:
> The ALC5682I-VD and ALC5682I-VE use the same I2C
> codec driver with different calibration settings.
> This patch aims to handle their differences.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Support the ALC5682I-VE codec
      commit: 5d085b25ae9843b4865360986ab288332bb01e21

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

