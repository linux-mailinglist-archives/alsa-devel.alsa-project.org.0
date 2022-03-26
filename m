Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF2D4E845A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Mar 2022 22:19:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160101651;
	Sat, 26 Mar 2022 22:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160101651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648329547;
	bh=TA0cJsJsntvOhwDRimbS8gmkQGvUYMs2q/tFHwmLzFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HA5lVrJRw+uXC7FWKYRMbkdc3XCd/WuH5idbeKHe8f/IKwovuQ4x4+F+JMG8aE1G7
	 Fxms8h5ojk+viF85n5tbxix0AbE51CkpC6aP7Rd1OIdiPmq7ldgFLZZYwAjrQzNgSY
	 U8M38FuubBbilABdz+q7xZaCVN4YQL/+Syc7CyzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63692F801F5;
	Sat, 26 Mar 2022 22:18:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BE1F8019D; Sat, 26 Mar 2022 22:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90FFDF800AA
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 22:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90FFDF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YRqFWEWA"
Received: by mail-lf1-x12b.google.com with SMTP id t25so18801646lfg.7
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dorKyWKnXy7IlU5rrn/oj/4eomYs0ghYVJYTP+RQhwU=;
 b=YRqFWEWAZ28v076CK4im5SsXJvYcIfTGKam4+0bSK2o/aS6vIDYE9Y18URClNg/GqB
 RCIrT5/7wf+CDsHlQvI4o8cs9ZDgVgyG09UsPOCxV7FV/be8bWIFNAdFHLt232AT/u/R
 9tApWuES+tn6MKrH+Rd0XeuBjp3pfNrH9xiShEbuRChEEcxs22tXOEpjgP9sHh12IhF7
 pyRZ7G5XJCDBc28A619jRNMmcBnapRF4g8eyBhjm8NHdarSvsB1s9EOVtGA7U+e2x7Z+
 SqPOCtfjyDxdl+qszxJZ2uetnejw9VLLWyenYM/+BHW6jmXH/0j8qsRyJ0oRFmob/5Oz
 E37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dorKyWKnXy7IlU5rrn/oj/4eomYs0ghYVJYTP+RQhwU=;
 b=qRcP5pKX8sdCVNCl+/vQ75cADX8mtiFPDOyhjVH6FAnVpZDrbFRLYFlnSW48rVqcYj
 4FuePS/DNkokIjjFr374VywsZoekGeVw1CEKwjmhXoL4ssebA3I/U4sn7VyreKdEOuc4
 JmILc05oKPjqamMKONhWvzby0jvZKyTRywfcSblZ6fJ5W8g5AVeRDTs9jQtysDcfP/2p
 sOhzu8QNmLUjRB2Qhy0QkMAlMt8KhiCa+a/ML5V3LOF4F2hiwnAql+uMyVv3Mhw7YNIM
 wWNVOqmFNY7slcIB7aL04HRailUFoMah7xOlVzzLfQUsSXb4sFBQ67Y0kKbuUWYN2kMn
 LEUg==
X-Gm-Message-State: AOAM530bCrGWRmo5nmrHjnQ55djQu9RUxLUYwohKVxi6DmRCoKQ/D46z
 99uuuSAGeiUJTObYObSlce4=
X-Google-Smtp-Source: ABdhPJwR/+ymjQZpTMAtiHGRcZti14dQruOjPpTxdcJTz7Y/Kj/+bGyN0Cae9N+tEUxHtv4Zv8OG9Q==
X-Received: by 2002:ac2:434a:0:b0:443:e48d:50b7 with SMTP id
 o10-20020ac2434a000000b00443e48d50b7mr13484093lfl.45.1648329472824; 
 Sat, 26 Mar 2022 14:17:52 -0700 (PDT)
Received: from dell.intranet (178235254230.gdansk.vectranet.pl.
 [178.235.254.230]) by smtp.gmail.com with ESMTPSA id
 h8-20020ac25d68000000b00447b5cad2a7sm1174015lft.228.2022.03.26.14.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 14:17:52 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Date: Sat, 26 Mar 2022 22:17:49 +0100
Message-ID: <1810824.tdWV9SEqCh@dell>
In-Reply-To: <20220322190753.GF297526@darkstar.musicnaut.iki.fi>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <20220322163646.GD297526@darkstar.musicnaut.iki.fi>
 <20220322190753.GF297526@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: alsa-devel@alsa-project.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-omap@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Hi Aaro,

Dnia wtorek, 22 marca 2022 20:07:53 CET Aaro Koskinen pisze:
> Hi,
> 
> On Tue, Mar 22, 2022 at 06:36:48PM +0200, Aaro Koskinen wrote:
> > On Mon, Mar 21, 2022 at 10:54:16PM +0100, Janusz Krzysztofik wrote:
> > > In preparation for conversion of OMAP1 clocks to common clock framework,
> > > identify users of those clocks which don't call clk_prepare/unprepare()
> > > and update them to call clk_prepare_enable/clk_disable_unprepare() instead
> > > of just clk_enable/disable(), as required by CCF implementation of clock
> > > API.
> > > 
> > > v2: update still a few more OMAP specific drivers missed in v1,
> > >   - call clk_prepare/unprepare() just after/before clk_get/put() where it
> > >     can make more sense than merging prepare/unprepare with enable/disable.
> > 
> > Something is still broken. When doing kexec (using CCF kernel), the
> > kexec'ed kernel now hangs early (on 770):
> [...]
> > [    0.928863] calling  omap1_init_devices+0x0/0x2c @ 1
> 
> It hangs in omap_sram_reprogram_clock() (<- omap1_select_table_rate()
> <- omap1_clk_late_init()).

I've reviewed my changes but haven't found anything suspicious.  Could you 
please provide:
- dmesg from both cold start and kexec, both non-CCF and CCF version, 
- contents of /sys/kernel/debug/clock/summary (non-CCF) after boot/kexec,
- contents of /sys/kernel/debug/clk/clk_summary (CCF) after boot?

Thanks,
Janusz

> 
> A.
> 




