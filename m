Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E69497C2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 20:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110002BFC;
	Tue,  6 Aug 2024 20:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110002BFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722970489;
	bh=ifBn+eLvRJeozKdAii61GizU/bo+ZkvXBhRT4MugnQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hp3fMEDRgs1sPmns/LAi82rfg0RnNi8afijVIvDUo804WyOXjceCn8GQR4mdEA4+Y
	 Th4rKXBFfur4wvJAVg7QRDaC6TSprxxHtmyVZSa/45gGTzmhHF+b39p2CQSk8rMhh7
	 EGd+iTKA1DQi6S6ghkjd+Vb2dz8MHCqnu8qcI0ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA45F80600; Tue,  6 Aug 2024 20:53:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BEFDF805FA;
	Tue,  6 Aug 2024 20:53:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D8DF8023A; Tue,  6 Aug 2024 20:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 324CAF8023A
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 20:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324CAF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sMKXXOfM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECF866104F;
	Tue,  6 Aug 2024 18:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A1BC4AF0D;
	Tue,  6 Aug 2024 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722969871;
	bh=ifBn+eLvRJeozKdAii61GizU/bo+ZkvXBhRT4MugnQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sMKXXOfMcud+smmnpt7F+tOx7WM8FmdVyGgeB6u/PSXwgfnBy1TObxeBfdCtzVZop
	 NGBRUYiV7DhGaVokYFeO2VUREPM10nSjnh3y0V1KpP8V9COARqw3GP6GL1EZH0eAmK
	 /TTQ/lHQwxZGuuaUaG9NSugGAyyHCuDMux/BA3yt4MsGKQRvlpFv6plZqQ8xQvNedA
	 BBZ/+/cm7wiH6aWPfH1jJ4jxo4N69Tg8zlsSf5CJ5yd0tKVeBfm5W9/DOay+U8tvug
	 JGCHvsGin9hpjBPozRsuf939wWZUYws1OyoLm58zXHY2Xp+wCa5eU9+2coAccg2e0t
	 QcS/jEdP6KLrg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87v80ewmdi.wl-kuninori.morimoto.gx@renesas.com>
References: <87v80ewmdi.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: remove bespoke trigger support
Message-Id: <172296987089.432413.12674692958731080217.b4-ty@kernel.org>
Date: Tue, 06 Aug 2024 19:44:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: SPEQW7EODRAPQWN2C2UT5HR2HWZVXP6N
X-Message-ID-Hash: SPEQW7EODRAPQWN2C2UT5HR2HWZVXP6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPEQW7EODRAPQWN2C2UT5HR2HWZVXP6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Aug 2024 00:00:57 +0000, Kuninori Morimoto wrote:
> Bespoke trigger support was added when Linux v3.5 by this patch.
> 
> 	commit 07bf84aaf736781a283b1bd36eaa911453b14574
> 	("ASoC: dpcm: Add bespoke trigger()")
> 
> test-component driver is using it, but this is because it indicates used
> function for debug/trace purpose. Except test-component driver, bespoke
> trigger has never been used over 10 years in upstream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: remove bespoke trigger support
      commit: 7d2fb3812acde0a76e0d361877e8295db065f9f4

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

