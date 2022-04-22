Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855A50E1AE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA18117B7;
	Mon, 25 Apr 2022 15:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA18117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893418;
	bh=g2fYQ8tm3COkkq2YncBk1OWp9JnooIBSRa7pFk6sT74=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfyX2Ek37DUsefz9A3WJCzfQYtryDIpgcqdmO3qIwLba/KlgNhyAlXd+ZGE1o2bVJ
	 PnH1BUNs7P2g9kEliJXas9gW0cS974ml7sM1tvLyxd7S8NUdPODt14BPts/G2FHK9o
	 kvbEx3ElxAOw6hKwgKqSjE9d4qJx1cTVwno6OK0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0E8F80529;
	Mon, 25 Apr 2022 15:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9954F80245; Sat, 23 Apr 2022 00:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82988F80134
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 00:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82988F80134
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="I5w/7jih"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A247BB832FD;
 Fri, 22 Apr 2022 22:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DAFC385A0;
 Fri, 22 Apr 2022 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668164;
 bh=g2fYQ8tm3COkkq2YncBk1OWp9JnooIBSRa7pFk6sT74=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=I5w/7jihsVIOHdNHdwHI9q6Q3q06D2FQZAe4ePmHlq8Cs0+yodwYMKr0jIsf2Vkmm
 Jf4ihxuZLcR98Mx65WT9JSPWYOglfKPe7ICt7L5stxHkxWZTFuYftbEYuDFQImqDQn
 1i+XE8YgLYBABhz4eBXxQEp/fhm0JhSPz7ZRey9SAM/nbzy1z3G9zjmZliTmlLW4/P
 nQfGdAYBmW4QdM8ISXR0CmEorTRBisnpTsTmczqmOwHvuhhteA92WCWnF10tTOY9Gq
 nieWy/cGf80AwQf/0pTtF9bdavrHtW13LpQ7tYJ83OLgJECQ5ZBy0rEYe1kJ6zbSf1
 GEx+tSzx5mnrA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419163810.2118169-37-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-37-arnd@kernel.org>
Subject: Re: [PATCH 36/48] cpufreq: pxa3: move clk register access to clk
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Date: Fri, 22 Apr 2022 15:56:02 -0700
User-Agent: alot/0.10
Message-Id: <20220422225604.52DAFC385A0@smtp.kernel.org>
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

Quoting Arnd Bergmann (2022-04-19 09:37:58)
> diff --git a/include/linux/clk/pxa.h b/include/linux/clk/pxa.h
> new file mode 100644
> index 000000000000..e5516c608c99
> --- /dev/null
> +++ b/include/linux/clk/pxa.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifdef CONFIG_PXA3xx
> +extern unsigned        pxa3xx_get_clk_frequency_khz(int);

What is the spacing about here?

> +extern void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg,=
 u32 mask);
> +#else
> +#define pxa3xx_get_clk_frequency_khz(x)                (0)
> +#define pxa3xx_clk_update_accr(disable, enable, xclkcfg, mask) do { } wh=
ile (0)

Why not static inline with types?
