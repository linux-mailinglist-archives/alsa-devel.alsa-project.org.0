Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255450E1AF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E290B1785;
	Mon, 25 Apr 2022 15:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E290B1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893434;
	bh=75MjpNBFgPBBs/emeCkhjLel+t8PPVsxFTXQq2hBCKk=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9x13HNKn4kejLlEZVHsPw+J9daRyBFnhyYrtd8rgXxothKBVgOj7laeoSc1DLBpS
	 nSOoq/5kyiPNJNuw8lSpWOAroTLviDYcI6xU9C+m9XK7J3o05+KjtP/lv7rM6p/27z
	 wYjrh1T/8fyNs9vY0eiO/zpKzQmQtW+GO5HWVBOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15693F80533;
	Mon, 25 Apr 2022 15:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0420F80245; Sat, 23 Apr 2022 00:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA033F80125
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 00:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA033F80125
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="g/QW+a2G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8D7CB8327C;
 Fri, 22 Apr 2022 22:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AA8C385A4;
 Fri, 22 Apr 2022 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668265;
 bh=75MjpNBFgPBBs/emeCkhjLel+t8PPVsxFTXQq2hBCKk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=g/QW+a2GOBE1soHbImaHItjuBaPtHqq1YJ1tR9FgrubXMsr1IxNAoB869MTaiquJy
 je+bRQ99B11eRYZhHi6I07GE7t+AB2idXITMEaKPumhH2cquFUCO7dumAvjZsIDjDR
 LNAZCk6LzAbjfD51jNXIILyW1TwVFch3nYUXhltbsLHPKNoAkTrG6/rSPf/xj7UGzi
 Ib2rbtAJ+sjU5etcq5ez8Z9Uk9EmuGs61b7o/e8ZWkd2kT59IkZbgnqiTor7iwCkVe
 SnERbrkeq5ti4nn8I/Ae4srlV0GT8BTGG27eEBhqeXCmrT4LL+eziz5mvC4m8ldq7e
 67uQrCgdvjvIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419163810.2118169-38-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-38-arnd@kernel.org>
Subject: Re: [PATCH 37/48] ARM: pxa: move smemc register access from clk to
 platform
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Date: Fri, 22 Apr 2022 15:57:43 -0700
User-Agent: alot/0.10
Message-Id: <20220422225745.64AA8C385A4@smtp.kernel.org>
X-Mailman-Approved-At: Mon, 25 Apr 2022 15:27:43 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>, ux-mtd@lists.infradead.org,
 "Rafael J.Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Sergey Lapin <slapin@ossfans.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, lin@alsa-project.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Quoting Arnd Bergmann (2022-04-19 09:37:59)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The get_sdram_rows() and get_memclkdiv() helpers need smemc
> register that are separate from the clk registers, move
> them out of the clk driver, and use an extern declaration
> instead.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Link: https://lore.kernel.org/lkml/87pnielzo4.fsf@belgarion.home/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
