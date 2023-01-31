Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBB682F5E
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8D21F3;
	Tue, 31 Jan 2023 15:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8D21F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175696;
	bh=+nA64MgxzhQQwbXmSEB3Z+dMUY9PfDWJ1yhJx9jJczk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MRTW7xvqE1pOTg7u+8UxrwJ+7SNSKv6seBmdOdpe/g0Izc5XLlIGj7Mf/HTgAqrVT
	 DcHmfPDSSqYvx1yixwzh+O0K71MpqjhVpOrH+8dRWXI1Z08Zpe0wvlRtnDKQsc/Gqi
	 ZNmeYA8FSAqEQ6Rc/9Sk7ZGHa/WzjFPLnk+lnQm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29911F80563;
	Tue, 31 Jan 2023 15:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30334F8055C; Tue, 31 Jan 2023 15:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5CBBF80524
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CBBF80524
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rsmeol58
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A038B81D1A;
 Tue, 31 Jan 2023 14:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEB9C4339B;
 Tue, 31 Jan 2023 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175562;
 bh=+nA64MgxzhQQwbXmSEB3Z+dMUY9PfDWJ1yhJx9jJczk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rsmeol586rBjeQoAyYN/rhsYOUwjOV5v4XZV4seMTN1vBIY+FYn+VICpN6eR8lFEY
 V0b9hhKVOx1saRf2PA9IyA6V3ozUPBlihnaD0pHURe1KxJRqK9MIYQUgFy77Mmcv7M
 ygOw9y8dEFYRw9aNP52H9fqhuUYq4ukQ9YF51ow/5tP5CWl5W4wVhYqBIAwBms2q3G
 lBwI8TRk5zR76OmMU/rVHRV7PgJ+HDTSsYdT2KoKixJBV6DKAaMtKkAqwKAksYFzqj
 8BaqYYMQ+mL2kHs7oL3gedrbZZz/+tAbNwz08f1yALDL0wCd0HlMXPiIZSXv435EYl
 J226IAzF7WP4w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230131082107.174739-1-u.kleine-koenig@pengutronix.de>
References: <20230131082107.174739-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: sma1303: Convert to i2c's .probe_new()
Message-Id: <167517556123.691025.7238290799598696877.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Wolfram Sang <wsa@kernel.org>, alsa-devel@alsa-project.org,
 Colin Ian King <colin.i.king@gmail.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 31 Jan 2023 09:21:07 +0100, Uwe Kleine-König wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sma1303: Convert to i2c's .probe_new()
      commit: 30cf002579969120ce926dffa3630afbb2ae899f

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

