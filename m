Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD64F5EFE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15590166F;
	Wed,  6 Apr 2022 15:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15590166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251376;
	bh=MNcLTJQNfb4WYM7uCPAcSDmLmnbBJ3NgB+QAaL0IHXg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTzXqLIESVQFIvW5dlu0Y7xcCHi7f0i6ZBYqSt/r0h3NaUUwy2Pb1VLKWPfGJhIFb
	 ODgFIe+l8mChNNuMmM41Dw2y2c4sRhlO3Y0C3AGXWzx8BC0macoQrIWwS3Jwl4aNBH
	 VYPm/b8y+fqv+4FYXkSazfUQJGULf5+Z4Ull7hfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F216F800D1;
	Wed,  6 Apr 2022 15:21:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23180F80161; Wed,  6 Apr 2022 15:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83F5F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83F5F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="eQ8xzLBJ"
Received: from darkstar.musicnaut.iki.fi (85-76-76-218-nat.elisa-mobile.fi
 [85.76.76.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 67FC71B000E0;
 Wed,  6 Apr 2022 16:21:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1649251312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wwR7bU/LqezBbEgTJDf+iEsMymzvGIHgAIteyu5Psh0=;
 b=eQ8xzLBJMgXjtwB7Yzjx/LojJlTidJ/nTLI5pX0s3cY3Zpsn8b7BqqyMs3XT0RDiE5x3gs
 VxYcG9eYTL2ti5Y7V7hFYM+rqV7NikHD3H+p5eERqlQfhhkziGxt5EzkIqEux9pVT/63ct
 9RZefQzE5i14yPjKv+zCKIJs/eTPZg90LntJxUwFkLpuxJfeJHGC27x/eapHvMw+3QBCfO
 gmU++itRdwNwFQooc8+77js9RrGrUrR+mkDgelpwUoV/wq1kCEziaeZMKg/gpUDKVDqGmb
 sdmlvWnhCTYcYS7NFr9PDY7i6KlEk5IH1VV/If5zeEdFsCEIB7hDvyObaWz3Xw==
Date: Wed, 6 Apr 2022 16:21:49 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Message-ID: <20220406132149.GC594699@darkstar.musicnaut.iki.fi>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <20220322163646.GD297526@darkstar.musicnaut.iki.fi>
 <20220322190753.GF297526@darkstar.musicnaut.iki.fi>
 <1810824.tdWV9SEqCh@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1810824.tdWV9SEqCh@dell>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649251312; a=rsa-sha256; cv=none;
 b=G3rkvREcvYSgPILWjB5NXkPEwDB12zuDb/aFmiEvpjUFHoIPAJkYCg4gSvydBuXsCOrASV
 qwVzzbSSEMx9mt98MsnoQGVKzIanrO0nr1oceqozsnLldbYtfYofM5nMCz1ygfNCoiqH+K
 IgUw/j2ZP7FR0vbtq7AE6gODdl7vMQ3Vfs+C4Xr8gfhiKcLrcewjnyFbLJ8VzM6wBTdU7t
 gGydIzbI/MdPmrFnVpcq2dLpYJlLq8V5O5cFhpaQPPezxVpgC6QZLcN3upxt341r2aPWzQ
 DGmnbA4hUe8LZaRUfUkOTNHA0z69SzxLRjRbScNwYpTyKIoK+T6Q5ps5tgqjKw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1649251312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wwR7bU/LqezBbEgTJDf+iEsMymzvGIHgAIteyu5Psh0=;
 b=vWn818AHWtvsq5cDnlrJUnWE79qMNnj8xFj19jFSqwBPLeAtdZ43oHVi70bcMK+nMmLrSK
 egs3u5wrj9LuerZbuMRnIpytvyvxIRPPV7q5I7a2AsQUHhbykzAHVVpq/9fp7ydLJC4BkE
 /j7PyMCSQ8gsrfNhsiwPPt7loNA6QMRRlDk5Z6QZ2s9NdMXLpTvDXdFyETUiIH9yQ6N8ZV
 UA7Ohf8mDgm8uV/Dx1bNcCT7oIamV8mar/PlKoL+fP1XJy/PNu3ZxCz87uc5NkMQwotWIp
 I92ppcKhR83XiGqTSWPAjd1EkDpGjMI2CtDXW+kr0FIUmivOhk5Ny7zCGfDavA==
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

Hi,

On Sat, Mar 26, 2022 at 10:17:49PM +0100, Janusz Krzysztofik wrote:
> Dnia wtorek, 22 marca 2022 20:07:53 CET Aaro Koskinen pisze:
> > On Tue, Mar 22, 2022 at 06:36:48PM +0200, Aaro Koskinen wrote:
> > > Something is still broken. When doing kexec (using CCF kernel), the
> > > kexec'ed kernel now hangs early (on 770):
> > [...]
> > > [    0.928863] calling  omap1_init_devices+0x0/0x2c @ 1
> > 
> > It hangs in omap_sram_reprogram_clock() (<- omap1_select_table_rate()
> > <- omap1_clk_late_init()).
> 
> I've reviewed my changes but haven't found anything suspicious.

The below change is fixing the kexec boot. Based on the comment in the
code, it seems this clock is needed for the SRAM to work.

diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index e33e11f826af..b8b4876ff935 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -285,7 +285,7 @@ static struct omap1_clk tc1_ck = {
  */
 
 static struct omap1_clk tc2_ck = {
-	.hw.init	= CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, 0),
+	.hw.init	= CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, CLK_IS_CRITICAL),
 	.ops		= &clkops_generic,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC2_CK,

A.
