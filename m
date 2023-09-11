Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55F79B6CD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712721285;
	Tue, 12 Sep 2023 02:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712721285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477154;
	bh=poTnKEe6IplQsM0sZiVOzS9IQ55fPQI6l6cswfygPgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SpuPsRCmfIZcsKVSS0SgZ9UgEylsKvYTu43FkrovSbHbxkaiPzUL9pxBSX0FK7cjW
	 FOwDCoCAX3PqjVBzzcyeH0kGnkkkjT9gKy7UzmlR41A6/v5jh87PkqzX8w5+i72bC2
	 /Vu0AfQBHjIDcXJd5TT64f97tyjlAImmdWXUopik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B4FF80642; Tue, 12 Sep 2023 01:57:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CBBEF80616;
	Tue, 12 Sep 2023 01:57:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54718F8060D; Tue, 12 Sep 2023 01:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5757FF805B2
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5757FF805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oTBDoyVl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B73AB81A21;
	Mon, 11 Sep 2023 23:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722E2C193E8;
	Mon, 11 Sep 2023 23:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476650;
	bh=poTnKEe6IplQsM0sZiVOzS9IQ55fPQI6l6cswfygPgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oTBDoyVlmbPiUNJ5ie97Fq3Gib2HBmv+d0kujDh4uPlOPe692KleQ9SwBDkaHgj5z
	 OmWIxkph0P1waxpMohJwZvPPmz+IcUhjVyV7jcVNbOqMBhz7iV8Ia8i3aSMFSKwlIa
	 NaaqySAI52ke7326cToF0GGbo72iRkGp8mEDfeeGUpokzcu1sScO2/tBYrCNvuzcMw
	 t2GHgJx6uf3LWU0UwznApIAWRPRQv8p4a04Z/fN2okpQn+oBVzGn6JXisAlEYLcOat
	 mgx0wcUhEpfLHUvMbJkQ7aM28L5avt7HmgZKkXDZLbPZ/nLbIPgz2CGj5VhcQsVG1C
	 82ReO3EcZdpVA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
References: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: ak4642: Simplify probe()
Message-Id: <169447664816.2387538.7019264836970248142.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ELM3BSCFJ23SEXEYEHKPCX42ATHG6D2V
X-Message-ID-Hash: ELM3BSCFJ23SEXEYEHKPCX42ATHG6D2V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELM3BSCFJ23SEXEYEHKPCX42ATHG6D2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 19:00:03 +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data() and replace
> dev_err()->dev_err_probe().
> 
> While at it, drop local variable np and use dev_fwnode() instead and
> remove comma in the terminator entry.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4642: Simplify probe()
      commit: d9e6a80a2c7bea4cc2edc87fa43b876a64b13074

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

