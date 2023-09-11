Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08D79B807
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FFE150B;
	Tue, 12 Sep 2023 02:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FFE150B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477272;
	bh=9OtbIZUFBDxgyKkdw+GLmc+PCE/ZFLEZDyNbZabaVqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=olyrOlkTdKw5t6h0FCvf3Q7zLSlyZzYThH/hJgS09TW/Vx4GyevEi/BxmYdoXkMIC
	 obg/CmWjrnzfb5mqAXe4cs3S9AFMZwaNy/Kx9tIfjLZ7269Cxt8CHwv7p8LGrHeNjz
	 OkCTn2jlZbl++B0RyXIy791CYTOwHioNkD5HkCaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D8F7F806AB; Tue, 12 Sep 2023 01:58:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8521F806A2;
	Tue, 12 Sep 2023 01:58:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1211F8067B; Tue, 12 Sep 2023 01:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA9EEF80618
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9EEF80618
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vMKpS6+P
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C1F1ACE19B0;
	Mon, 11 Sep 2023 23:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F3FC3277C;
	Mon, 11 Sep 2023 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476670;
	bh=9OtbIZUFBDxgyKkdw+GLmc+PCE/ZFLEZDyNbZabaVqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vMKpS6+Pu8B/ZHOewr5w0gXcJNEhTABbIJE36iU/vzxR70DAj8UEZEIyiLzFXfMMa
	 uXy6G/31UvvxAB/XaimBtjUbH/FO07qD8KUOwBsO2V9fzqA/7J/fMD0z9OEJjPoqFN
	 Ql8bSzf45eVy6ptY+N6Ynr96CPWFFA60aP4xu2THa24ZAdevpYXdZiwcW4V+BKeTTA
	 /1Mgs2zO2oMB5C/Aj0pQqz2/mkwwGdy87WQFOUia/GeqRH+A6JJH8N9VhebU+jyV0I
	 RHqgWCIZ8k9MAGvolokKzzmQvEv4Gqywq7T0sYHGZDopn9pCyIRp4vYWdEk+eMv3IQ
	 uwODw1UhMeQFg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230907090910.13546-1-jbrunet@baylibre.com>
References: <20230907090910.13546-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg: extend TDM maximum sample rate to
 384kHz
Message-Id: <169447666857.2387538.11157727345218045709.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: GTXYYLQ4PRGW3E46TCJ6RRBQUXHNGNLO
X-Message-ID-Hash: GTXYYLQ4PRGW3E46TCJ6RRBQUXHNGNLO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
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

On Thu, 07 Sep 2023 11:09:10 +0200, Jerome Brunet wrote:
> The TDM HW on the axg SoC families and derivatives actually supports
> 384kHz sampling rate.
> 
> Update the fifo and tdm interface constraints accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg: extend TDM maximum sample rate to 384kHz
      commit: 43f2d432e47ebf2d7518fdef50d7cc70da376b0e

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

