Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0437C79B68D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0638103A;
	Tue, 12 Sep 2023 02:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0638103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477122;
	bh=MSxqurdc8bOtYnK9Km+C7wTUaWO8dsr+XYdswOb0/DU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ou6gxGbtgx2TzF9r37WPaL0VcDpdop7ZL32uSeefyuEJ+APZL89Ig5hZknRkssARN
	 qFSaDCP8/F+GXcm1mKU6PbZcp499kj3uS7sj8VGG9czrVuFgnjY7fRIqqFcTdwvY1t
	 Ve9VdEcF5ixG8/hIlf4bWYOPFSIY6NlTgwbWhXGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48B8CF80608; Tue, 12 Sep 2023 01:57:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F26FF80608;
	Tue, 12 Sep 2023 01:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C5FAF805FF; Tue, 12 Sep 2023 01:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C13BF80564
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C13BF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gonV2JpZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B3841CE19AF;
	Mon, 11 Sep 2023 23:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B0FC116D7;
	Mon, 11 Sep 2023 23:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476648;
	bh=MSxqurdc8bOtYnK9Km+C7wTUaWO8dsr+XYdswOb0/DU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gonV2JpZp5voL21Jh0K0zZxmkJfFJmUQuuyfWMB6CNMVFMNXM6U9wz4JPQ3GQzCS2
	 a2lj78+HQt5bUllt3CXhsTo7goNpftJCvMYcs0Es7epn2j+dRBUb26Ri/zeq73Q8DA
	 mz8vYrUkvjN9UECag70JHQEDfKoiN+TOVBfpPY7ekoQzuF7NeTWrmqN6fl/1Kz/9AX
	 Gyhu1wYy02RTJNOVEVoSc9Bv4GOXtG6AoPaMQLtzBxZK2ts6R52L2j2fiVv4JVS7rZ
	 Hiiobp2e89z5VfVG4uEdzFANrDZbohyEtlSMlQmjNumI9E7sCuJffmRh1XWcFyhA71
	 hTOWWvCLat4oQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
References: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
Message-Id: <169447664471.2387538.2128490633533923133.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: S4X6J6S7RKA6JEBUMAVWXNTGIV4QYHK4
X-Message-ID-Hash: S4X6J6S7RKA6JEBUMAVWXNTGIV4QYHK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4X6J6S7RKA6JEBUMAVWXNTGIV4QYHK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 18:48:56 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table. Also replace
> dev_err()->dev_err_probe() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42xx8-i2c: Simplify probe()
      commit: ad191992330cfeb80ba341d1e75d9fe2719ced68

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

