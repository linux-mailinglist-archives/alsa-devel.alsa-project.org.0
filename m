Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F14E467D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 20:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1712E1767;
	Tue, 22 Mar 2022 20:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1712E1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647976149;
	bh=9mBJfuS3kal7tF/1GOeEYNDJDxJmr4tXuu5mOfEHIlg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBf/FU7E9r8a1Ppn3PQdVW/pTRRFQSIO6VBN1b5BLO1yMUiy5EwO11Qh+JKNj/RpK
	 j/PzVFbrTeulhp8W6sJ3tDCQrw6PxrOg3Qaee9Y2zxyUTEXO+tla4DjmXJlsakkohV
	 4GyDB6bgjPJd/4xq+yRN8fxjRVmVqgLzkXOLBw7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66863F800F5;
	Tue, 22 Mar 2022 20:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA05F8016C; Tue, 22 Mar 2022 20:08:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D552CF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 20:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D552CF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="cX6LmeT3"
Received: from darkstar.musicnaut.iki.fi (85-76-100-34-nat.elisa-mobile.fi
 [85.76.100.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id B3C5F20388;
 Tue, 22 Mar 2022 21:07:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1647976075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9zTS3DT6xcfZw/ju05KElVTkQiN1fQ/ztsa9TbNgG2s=;
 b=cX6LmeT38lN2NaF7Qsx5VX0GwklLy2du9kOpxTh3b4+Qw5wrtoKy5+CaPdFHVPF7PUQJV7
 JP0eZNy7X0Jfbj3WAB5bQXsUGhmUeS+qIfMHxdWpTOM+QUCxar+jfmcf0+g1AFcQ1pCKkA
 q4bRX979489LLYULp2d8EW4EbP4qAGY=
Date: Tue, 22 Mar 2022 21:07:53 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Message-ID: <20220322190753.GF297526@darkstar.musicnaut.iki.fi>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <20220321215416.236250-1-jmkrzyszt@gmail.com>
 <20220322163646.GD297526@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322163646.GD297526@darkstar.musicnaut.iki.fi>
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1647976075; a=rsa-sha256; cv=none;
 b=X6jYN8e4edIdwhVqd08HooVar4l9k4zaeYIbPBffuNKwdkVOZqop0cLduutP177L6DWw1t
 z3md1/KyrpNc4Oj2NmcgYKgqs06xOi37+Q82NbgDQR7qRGbl7dmfLBEOUOb/ZvPz8Q9kzG
 iv9WWWKrxOwoKKPEYH88Tk0Gi1Jit1A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1647976075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9zTS3DT6xcfZw/ju05KElVTkQiN1fQ/ztsa9TbNgG2s=;
 b=uVqGTgouIQJQ2R58scj6U0J2KM/YtrOq4hq0tSnqJjTw6VkH13Shbd3ZumElBWGBl6w/C+
 SIBA6Ck0VAZhNiAy4cgvRL+DdTJJmixLaEk9B9FpqhWM/Nmc5koLsdctAdg9syFOac++N8
 L8McGNzCb7F/2+k2v1U0gta89xs02Sw=
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

On Tue, Mar 22, 2022 at 06:36:48PM +0200, Aaro Koskinen wrote:
> On Mon, Mar 21, 2022 at 10:54:16PM +0100, Janusz Krzysztofik wrote:
> > In preparation for conversion of OMAP1 clocks to common clock framework,
> > identify users of those clocks which don't call clk_prepare/unprepare()
> > and update them to call clk_prepare_enable/clk_disable_unprepare() instead
> > of just clk_enable/disable(), as required by CCF implementation of clock
> > API.
> > 
> > v2: update still a few more OMAP specific drivers missed in v1,
> >   - call clk_prepare/unprepare() just after/before clk_get/put() where it
> >     can make more sense than merging prepare/unprepare with enable/disable.
> 
> Something is still broken. When doing kexec (using CCF kernel), the
> kexec'ed kernel now hangs early (on 770):
[...]
> [    0.928863] calling  omap1_init_devices+0x0/0x2c @ 1

It hangs in omap_sram_reprogram_clock() (<- omap1_select_table_rate()
<- omap1_clk_late_init()).

A.
