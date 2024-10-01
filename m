Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAD98C4DA
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A52E6DEC;
	Tue,  1 Oct 2024 19:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A52E6DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805243;
	bh=0SWHZTJdAhiLPUvzHOvSqw2UJF1x1fKsi6AB2LSEXbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LuCzOs67srOHRzARAzaI0xPHxBGwF0CPcYovufRhUrti1OwgkUTAL/bCEm7XuTQJB
	 Yi/CLUeTDSbv66QnpgXCsPnY07fuAByxFpOjoCv2c6BUYiSMQNKGhHh2WE0LEdJFJO
	 OHuxycLh3QqkhCvtJZBXUEPmNU1SQvuMJhqD8Mn4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F8AF805D8; Tue,  1 Oct 2024 19:53:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 590C8F805C5;
	Tue,  1 Oct 2024 19:53:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16F77F80517; Tue,  1 Oct 2024 19:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 488BDF80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 488BDF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n9w/F4MB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B52E5C54D0;
	Tue,  1 Oct 2024 17:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25257C4CEC7;
	Tue,  1 Oct 2024 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805191;
	bh=0SWHZTJdAhiLPUvzHOvSqw2UJF1x1fKsi6AB2LSEXbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n9w/F4MBxMT3GaR/HfURAWq46JlgX1v1M7uYU5mbZ3D7FIHCghINi5crPPvV6F0es
	 KWDaMwFW6fIC1p70XsuT2NNyZRCqeFSWlh0hcRhj4N1T4H9aof5ocoY0vqt6fnnhFo
	 MonrINkC5KlSLWPF1H/a2ZhuqXPVElIlxbr9NwQKgU3YyYP+eLE6X5J5s0cMcrm06r
	 euyyN5DyLE6YTZUVWNXCv34z4pkKr4QcUXvJsFfa2NAjvdTtFMX0p/vonLNRwyV03e
	 N5obilYyO6417ME7c5sZ7jEcQoM981yznLn3hcs9/v6+ptGXc1HEcBTmd1IsI80uex
	 E7H/L5KmBfJpA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240916091056.11910-1-andrei.simion@microchip.com>
References: <20240916091056.11910-1-andrei.simion@microchip.com>
Subject: Re: [PATCH 0/2] Updates for mchp-spdif(tx/rx)
Message-Id: <172780518782.2298697.5345133650915671833.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: CXYTCMMTMIGTB5NOJUQFGLYBBLCPN4GO
X-Message-ID-Hash: CXYTCMMTMIGTB5NOJUQFGLYBBLCPN4GO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXYTCMMTMIGTB5NOJUQFGLYBBLCPN4GO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Sep 2024 12:10:55 +0300, Andrei Simion wrote:
> This patch set includes two updates for the MCHP SPDIF RX and TX drivers.
> The patches remove the interface name from the stream_name, allowing the
> interface name and index to be set in the Device Tree (DT) using the
> sound-name-prefix string property.
> 
> Codrin Ciubotariu (2):
>   ASoC: atmel: mchp-spdiftx: Remove interface name from stream_name
>   ASoC: atmel: mchp-spdifrx: Remove interface name from stream_name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: atmel: mchp-spdiftx: Remove interface name from stream_name
      commit: a6ae5845f0231fb1b3e9bf591b237d99d1a077c0
[2/2] ASoC: atmel: mchp-spdifrx: Remove interface name from stream_name
      commit: 3c44a715e389929b8243d6a0545992d78cff6cba

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

