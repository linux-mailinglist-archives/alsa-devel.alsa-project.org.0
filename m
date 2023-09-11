Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9C79B719
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF301283;
	Tue, 12 Sep 2023 02:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF301283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477183;
	bh=LeuApLpG3v8SYN8BHFkhSYMJ/eALFnk+G1jkLasFDnM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eUEEx4K5QPoFnOQitcisB/Q5BofMnoVcqBIh6y2TTxJkWiEF2DM+pFG2PktaT/M9c
	 5PUR7nspXtnWKBDtKIDhMx9vXvjwtyg4X8QKxsmWcUUBZqF1+5xs3XkS4krGU0EUyp
	 Qe59ioAFO8AqXRcOu1gUnNksVWU1HfK1ZZmt4tLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D657AF80673; Tue, 12 Sep 2023 01:58:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 793BCF80610;
	Tue, 12 Sep 2023 01:57:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B6FEF8060D; Tue, 12 Sep 2023 01:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CD07F80608
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD07F80608
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QEWWVVng
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 92970CE1915;
	Mon, 11 Sep 2023 23:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A309AC197C4;
	Mon, 11 Sep 2023 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476654;
	bh=LeuApLpG3v8SYN8BHFkhSYMJ/eALFnk+G1jkLasFDnM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEWWVVngtHVHAwR30+E8WivwUqjWkChBZJKrl/XHINMzEFqr7EXO+Xt7imEmwN7wm
	 +sSWtLmIIMAWnjBlZLv0YLOVtFB0d3nm0n3noo+yu3XaXQCCLce+IRQs8SZYgybSRP
	 16pZ7ovq1vukKeYwAdiwMHEAGDRc64iTZtY/rAEETPi69t2mRLAKQ7wpeLgnWzePgP
	 hItJ2WCw11kIGq3VwetC2krMWVmhjggnOUMHpNkRIegP3xuMuDAp9dmnP3GuepYBsR
	 c387xpjWPupQtc5Mbd/GYSIlE+Ni/OoGSY8ExMxxDoMIyZvUKxRzsFc7Sxki/t2EQ9
	 ZbjbUGJ/+Cc0g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] Match data improvements for tlv320aic32x4
 driver
Message-Id: <169447665230.2387538.10106285236700897579.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: FFSJA7ADH3YJ6E434OO2L6W65GA2YHL6
X-Message-ID-Hash: FFSJA7ADH3YJ6E434OO2L6W65GA2YHL6
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFSJA7ADH3YJ6E434OO2L6W65GA2YHL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 20:10:12 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for tlv320aic32x4
> driver.
> 
> This patch series is only compile tested.
> 
> v1->v2:
>  * Created patch#1 for adding enum aic32x4_type to aic32x4_probe() and
>    drop using dev_set_drvdata() from tlv320aic32x4_{i2c,spi} drivers.
>  * Return value of i2c_get_match_data() passed to type paramemter in
>    aic32x4_probe().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codec: tlv320aic32x4: Add enum aic32x4_type to aic32x4_probe()
      commit: cac1636e214930b01b2f8ac9867771486554271a
[2/2] ASoC: tlv320aic32x4-i2c: Simplify probe()
      commit: d44f7bc9d181a2bec0dcff694d00b08c8f99284d

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

