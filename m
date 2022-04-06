Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77D4F6963
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 20:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF54B16D3;
	Wed,  6 Apr 2022 20:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF54B16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649270966;
	bh=umZEOWhcBvWWeZqMlPAvg3j1YLv61/lIneQw4hJljAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5WMSdKVwZl8348fdmmYH5x2a10XJrjFEK6G2nO9kypxfnrnelLbTaKFG9ef+6bMP
	 CIsXqjlNpz8+QHKPlZWBInYlc/ytxffKjc/vjkGbKLukMqDsVWg6E54YEcWhn/5l0/
	 dYqQioe85Y5GujbYjzCLkIvWO7D25YaoVDWOFpi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6302CF8019B;
	Wed,  6 Apr 2022 20:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13F73F80161; Wed,  6 Apr 2022 20:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F205F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 20:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F205F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AdiupK0f"
Received: by mail-lf1-x135.google.com with SMTP id z12so5636303lfu.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9395K+P3ckPAEpp0VngX/lMlS/mSO7/OiLA6T9rii8=;
 b=AdiupK0f5tH3mzh81yMw74TNiqYSKhpRq5BV6vNWimIJM65sCmwtO0VGTLEIQSkjg/
 xHomBGdi80pYAOjj2DuUq1oWwtOlgDYUspbmgS50UQ2XpWmFvFb64rmVAjIspPHu8v/N
 raKCDBS81RRn+l35CiP8V9s15SZMqyc+I6CC6eNFaX7SY9jCEODu+ODqKQrEXvDnNfW9
 06BmSYAMjoFA6bYLj+hs4lTp1VvofM5xzi/2yOrMuJgyl5vhhS2Qt0VQ3ZrZxNRi+m2Y
 ZVJqXmFHD7We6zWDIH1c5jJ/5vx6iC0vE5/vmSAzew0dRX0CYnl+53PUQ+FMuZ066+V3
 5MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9395K+P3ckPAEpp0VngX/lMlS/mSO7/OiLA6T9rii8=;
 b=az2IiOccIUdnYQIhD/03GmJxIFbgK6cQG53jCVaetgC9ze3icKk63Ub3QLZZwAtTf4
 x4/QsdQyl4elSYwNvhpDGKHAGqJQTfVxFviHOS8Vb0q+6T2KOh282O4R7hSwx4974pxS
 F1vOMW2+uKQH2kBiHPIM+YFRFlBuLkiqunezQBFXBF/buekEXUK3VPEbtNNcmcA4+t95
 HIcA+98WN534dbDku7fVFyuJJOaRnKtO2Fo30otVK8Khesf1eBeB2QoQLApRDLbXTdYV
 RZeg6YN76jL8ISsFONOzePmsW3R0y17qis/LklC6PeJORN3BsNHAWhgRVhLPCSy7ALnt
 lc9w==
X-Gm-Message-State: AOAM532Xa+FDU+85m9I/ER6G59QKZJUvk+lDSwrvnDdvOwPJDzOjKZ93
 t4IDShqaQL76LFGdsPLsvnE=
X-Google-Smtp-Source: ABdhPJzNADicM+sXa4roBFQ7B2f4eH3VnwkH5xkwOrMbesUL+8GJo8yXhHvLj4BO2Bo5WHfPEDGStA==
X-Received: by 2002:a05:6512:39c1:b0:44a:e25d:47fd with SMTP id
 k1-20020a05651239c100b0044ae25d47fdmr6907751lfu.580.1649270897430; 
 Wed, 06 Apr 2022 11:48:17 -0700 (PDT)
Received: from dell.intranet (93-181-165-181.internetia.net.pl.
 [93.181.165.181]) by smtp.gmail.com with ESMTPSA id
 e14-20020a19500e000000b0044a16931c7csm1912219lfb.97.2022.04.06.11.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:48:16 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Date: Wed, 06 Apr 2022 20:48:14 +0200
Message-ID: <1888452.PYKUYFuaPT@dell>
In-Reply-To: <20220406132149.GC594699@darkstar.musicnaut.iki.fi>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <1810824.tdWV9SEqCh@dell> <20220406132149.GC594699@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dnia =C5=9Broda, 6 kwietnia 2022 15:21:49 CEST Aaro Koskinen pisze:
> Hi,
>=20
> On Sat, Mar 26, 2022 at 10:17:49PM +0100, Janusz Krzysztofik wrote:
> > Dnia wtorek, 22 marca 2022 20:07:53 CET Aaro Koskinen pisze:
> > > On Tue, Mar 22, 2022 at 06:36:48PM +0200, Aaro Koskinen wrote:
> > > > Something is still broken. When doing kexec (using CCF kernel), the
> > > > kexec'ed kernel now hangs early (on 770):
> > > [...]
> > > > [    0.928863] calling  omap1_init_devices+0x0/0x2c @ 1
> > >=20
> > > It hangs in omap_sram_reprogram_clock() (<- omap1_select_table_rate()
> > > <- omap1_clk_late_init()).
> >=20
> > I've reviewed my changes but haven't found anything suspicious.
>=20
> The below change is fixing the kexec boot. Based on the comment in the
> code, it seems this clock is needed for the SRAM to work.
>=20
> diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock=
_data.c
> index e33e11f826af..b8b4876ff935 100644
> --- a/arch/arm/mach-omap1/clock_data.c
> +++ b/arch/arm/mach-omap1/clock_data.c
> @@ -285,7 +285,7 @@ static struct omap1_clk tc1_ck =3D {
>   */
> =20
>  static struct omap1_clk tc2_ck =3D {
> -	.hw.init	=3D CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, 0),
> +	.hw.init	=3D CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, CLK_IS=
_CRITICAL),
>  	.ops		=3D &clkops_generic,
>  	.enable_reg	=3D OMAP1_IO_ADDRESS(ARM_IDLECT3),
>  	.enable_bit	=3D EN_TC2_CK,
>=20
> A.
>=20

Thank you Aaro.  Will you submit this as a separate fix, or should I submit=
=20
v2 of my patch 4/4 with your fix included?

Thanks,
Janusz



