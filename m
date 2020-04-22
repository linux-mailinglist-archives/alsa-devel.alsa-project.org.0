Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2641B4EA1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 22:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12E316A8;
	Wed, 22 Apr 2020 22:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12E316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587588879;
	bh=Ip45XjNU3RfaDdS8GuN5nOdWgVjIUF1z7tcIGoDtEkI=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LAge1++gZEWxy2i0J04FRMXvqFr7L4IPz/vP2C32k+TTyWiCo2pS2DpRjxUt76Jtj
	 ne+bXLhcI6uNn7QgW55E5LSpJ+ZdU5TTygkfGGXG/i5EnfvjXYJ77/bhHDeR8wsJaH
	 uuFUwf59Ep2oFQU4aNcgA0I/NJVx24EhpMocjnjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04898F8020C;
	Wed, 22 Apr 2020 22:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE96F800FF; Wed, 22 Apr 2020 22:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12BFCF800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 22:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12BFCF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a2ofJsV+"
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C637920857;
 Wed, 22 Apr 2020 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587588765;
 bh=Ip45XjNU3RfaDdS8GuN5nOdWgVjIUF1z7tcIGoDtEkI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a2ofJsV+3c30LI/TqgmPbHk3GA/NjMJEhkk+06ZoNpF4jh14gNBBYW82NSJShgwQ3
 HEbAUcdqQ8QbFJZKcDSax3rybD6T4m/T35TlNYigGsqFmJqm1a8+xTgrlNgsVuMBvK
 NNQSHQZ+OCCxlYYi7sEsKemN+ZMz8QTzgYTQETss=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
 <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
From: Stephen Boyd <sboyd@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Date: Wed, 22 Apr 2020 13:52:44 -0700
Message-ID: <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: Matthias Reichl <hias@horus.com>, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Matuschek <daniel@hifiberry.com>, linux-clk@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>
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

Quoting Pierre-Louis Bossart (2020-04-22 02:54:38)
>=20
>=20
> On 4/22/20 4:32 AM, Stephen Boyd wrote:
> > Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
> >> On ACPI platforms the of_ functions are irrelevant, conditionally
> >> compile them out and add devm_clk_hw_register_clkdev() call instead.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.=
com>
> >> ---
> >>   drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifi=
berry-dacpro.c
> >> index bf0616c959da..d01a90fed51b 100644
> >> --- a/drivers/clk/clk-hifiberry-dacpro.c
> >> +++ b/drivers/clk/clk-hifiberry-dacpro.c
> >> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct pla=
tform_device *pdev)
> >>                  return ret;
> >>          }
> >>  =20
> >> +#ifndef CONFIG_ACPI
> >=20
> > Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
>=20
> git grep CONFIG_ACPI shows most of the kernel code uses #if(n)def=20
> CONFIG_ACPI. It's equivalent, it's a boolean.

It's not equivalent. It is a pre-processor directive vs. an if statement
that evaluates to 0 or 1 and lets the compiler see both sides of the
code to check types.
