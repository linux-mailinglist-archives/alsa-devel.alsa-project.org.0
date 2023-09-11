Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7303E79B6F0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A7514F3;
	Tue, 12 Sep 2023 02:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A7514F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477169;
	bh=yezDdDMnUXme+vgUL7Ot3zqUa+TcohvH6piJqWM0UIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XA8phc0j3yLgAV91n2n57/1qvpvfPo9RaiTTIvAsu0vj/ukoZutqv28MaDR8PNCAW
	 lYU7dqiIXFTXtJdSVkOIGtCvlN4orWqImjP1ccwyZz21rs5SMrrInv6LSoO1rLFidB
	 SSJyhYkwYD2pJIaZvKthRSUgLYYFwhnQ8o39sr38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0815F80654; Tue, 12 Sep 2023 01:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF673F80654;
	Tue, 12 Sep 2023 01:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 927EEF80600; Tue, 12 Sep 2023 01:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8EC1F805FF
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8EC1F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IfIlqB6E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D98EB80DAE;
	Mon, 11 Sep 2023 23:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A551C2BCFE;
	Mon, 11 Sep 2023 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476657;
	bh=yezDdDMnUXme+vgUL7Ot3zqUa+TcohvH6piJqWM0UIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IfIlqB6EYCWyXCFurW4QyFPcjPrt8klX/JTocTlFQK2UotbqWoRQnkbALZNtWBsKz
	 S3jIAEM7eXjSfIGX/2rmda7K4rcCc8Ogwh4Gg3+3/s9MmsBwciv5uM3te/Mh6MxPBg
	 Mvjfq9GiDTq3rjUY+LL/lhzbCvbbLLMD1QSBsmvKq5MYH1g3JRSMTemHMEIpIwQo0j
	 CD7iqUxiXcFp7d/qUrC8daCzNTeepxpFuZxzei6mn5GJiVUZcnIrQ3QZ8TE6IBWpd7
	 H0p0ireBrPIFOpRrPSGxysy6p5I+CcJuJKXlDsB1xRD6N26OWkp28PE5LwGED0jbpK
	 nXycV9HqEk/xQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230831194622.87653-1-biju.das.jz@bp.renesas.com>
References: <20230831194622.87653-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/3] Match data improvements for tlv320aic32x4
 driver
Message-Id: <169447665505.2387538.666074818019583223.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ZZ4LEB4DTZC5KZ563V3ZFRMZUWNCGNWP
X-Message-ID-Hash: ZZ4LEB4DTZC5KZ563V3ZFRMZUWNCGNWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZ4LEB4DTZC5KZ563V3ZFRMZUWNCGNWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Aug 2023 20:46:19 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for tlv320aic32x4
> driver.
> 
> This patch series is only compile tested.
> 
> v2->v3:
>  * Added Rb tag from Andy for patch#1 and patch#2
>  * Simplified aic32x4_spi_probe() in patch#3.
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

[1/3] ASoC: codec: tlv320aic32x4: Add enum aic32x4_type to aic32x4_probe()
      commit: cac1636e214930b01b2f8ac9867771486554271a
[2/3] ASoC: tlv320aic32x4-i2c: Simplify probe()
      commit: d44f7bc9d181a2bec0dcff694d00b08c8f99284d
[3/3] ASoC: tlv320aic32x4-spi: Simplify probe()
      commit: c6d86149db94c0289b0e5950fa23c5b19031ab8d

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

