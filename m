Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FFE79B607
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38629EAD;
	Tue, 12 Sep 2023 02:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38629EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477074;
	bh=9snFwBbBoXitUM3dr7LW8n+9wzN0NmBcRWUrdshcpEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=txHF8MMfxaZcgmDyG0iyxrz/qV8RNCZdYKZkBo515OYDGPlO0kUBMi769mwLIHrsU
	 pBUt/rFuTgYPznI32J4qvwEqPCvq8FSVxvsuyEfnSTR03cs7ohEo6j+WrjYG6tg4Te
	 GlPQBTAYJnSQOGvl4NGUL0EE47d9ci5BCKYoOCOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F326BF805C1; Tue, 12 Sep 2023 01:57:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB52F805C9;
	Tue, 12 Sep 2023 01:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FF0F8057B; Tue, 12 Sep 2023 01:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8E40F80549
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E40F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LWv6YbI5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7E345CE19AF;
	Mon, 11 Sep 2023 23:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48232C116CB;
	Mon, 11 Sep 2023 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476634;
	bh=9snFwBbBoXitUM3dr7LW8n+9wzN0NmBcRWUrdshcpEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LWv6YbI5tJ9QV/UPRJJ2tAq2HBTzDY9ZA4hwVpuwhTVcBOFy/c8TWp1TrHkgyZoPM
	 /scG2uInKBC/1a/nNu+1Ju0AiiySR4Bq2o13qQCGydygCtpE2tPhgKBQQ/DhEwL6Ul
	 kS+TkvPFMesybu4JUZFr84FWH28SgtUadrvzvj/bYOzro79lFvYR08wQh6Go0F422Q
	 rYodtKmhHz7WyhsSoiRIcq/AjQ25Ug8BpLNPHSGclJm9WI3xlztOblC1jb1zie/HeL
	 iPPpnJwz0CoHaXROGopWa6lhzh4pcwxIYkQTru7kFNUNr5qHqDzLNW6HffVXq/QLC9
	 knG9pkKNHYvVg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
References: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: wm8580: Simplify probe()
Message-Id: <169447663194.2387538.5757531864571268154.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: JKZOFXE42J6GZHEWEFAN7NZ23I4DO6OI
X-Message-ID-Hash: JKZOFXE42J6GZHEWEFAN7NZ23I4DO6OI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKZOFXE42J6GZHEWEFAN7NZ23I4DO6OI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 27 Aug 2023 11:21:14 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8580: Simplify probe()
      commit: 26eacb98ca7dd3ba5a6845028a13d13a7f03123f

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

