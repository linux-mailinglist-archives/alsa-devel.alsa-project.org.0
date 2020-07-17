Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDE223D9B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 16:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6501661;
	Fri, 17 Jul 2020 16:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6501661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594994686;
	bh=Qxbr4PxYaT9eUmn0IERzKm5Rh3i/z+tI5USqgIvyhpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmXbyWhZCIr6kn6H3SSGHx7Mrz26KswGOX4rCb1EIoQlFiQHYX2P0BAU3aCZX0Lx6
	 9lrh5MPFcLoq75k9980ZvcfuESxrz8++2e7Fe/Ne4Ew+9Fr6X6fm0DOj86cMitHJIR
	 92iLl2kPi08eHIVaVdhw5WuE/Re/5PQzA23LyDzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A48F8021D;
	Fri, 17 Jul 2020 16:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB079F80217; Fri, 17 Jul 2020 16:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D092DF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 16:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D092DF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZPiKIxYu"
Received: by mail-lj1-x243.google.com with SMTP id h22so12794670lji.9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/bsgD3P3j6EsO1kg7egbX0HSTZlpCPFUGx7uqzp/WM=;
 b=ZPiKIxYu6el9OMkRWm1O5KwF2UI+R+tjceVg3U43OTBsnnua3Mjk52FiSq/SYVXjC7
 2rsVRAuadZqTH0/rPezlq9eOfCuXRKCHR/hYvFEoEz1VdK7VA6VKAulhB0ISvvyTE5hh
 4sEpDc3mYR4MbmrpP4uw0xB4Evqr/sl0gdEcGz52bjznzQ4Q0aSIhXYWts6p89u86hfy
 7rKHsyXfvNJVWrgsJc47BgHB3z89ti7M0tSrtX/TPA0pTejAytyqq9VlEj3Gd+eC8QR+
 t+/Cf4FnkCAr4DjiIze2k6DYJmvsJPIB1eggFxyZ+37FLAsgLV0rFg6BTz/IwUUcfBXI
 Hsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/bsgD3P3j6EsO1kg7egbX0HSTZlpCPFUGx7uqzp/WM=;
 b=K7+PUezru+EvFsomCj15yCK4wOmgk1zF46dx04ZJ1js2Q83Qyg0E+CPXuLfz/oN5wI
 9U8n8wTzI5+ht/QjL6NVXUvX8SCjSOpfTDI4oWrwZeNuOyaRbdWkJiotwgLb18OQSZ94
 +EcQV1aeo1LWBCNb/TCZxsA8gynUm4k5jGrsR7+qTPFccQv6t1ZU/XowsZkzhVPPUn0Z
 VbV4rjqEo9TOEZ2IR9V4PY+tCuGNyWse00rUdfY6ATEo6MUtVfAi2F+AQC5IpwzlqcTM
 7rIfW0EJoSXuljvyMKIuLdm/xAJBNjYkTD/KpicxK1dZTlwVBBiZOdseAUHYwkV/zHUb
 LzVg==
X-Gm-Message-State: AOAM530T13lxfGrhcXHL5p+1nyQQauMqgv/9rK1hCSA2MvJmeqeMxrZ8
 SQgSiC7COQVVryy4CGl8/6Xeross1Yn+BVP1Olc=
X-Google-Smtp-Source: ABdhPJyKmhYzubnqztgB5tANtY/OPnxkZJ2yr+hpU1UfBtYoF8+lBneqezVlyJkdYuuYgd5Z8TkyBUXWv68PuiGSMFc=
X-Received: by 2002:a2e:850f:: with SMTP id j15mr4856588lji.44.1594994572581; 
 Fri, 17 Jul 2020 07:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
 <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
 <20200717112332.GB4316@sirena.org.uk>
 <CAOMZO5D1BMjNcf-2z11uzCc46yCA2-GTWh+V28Y7WhrSAM_+Cg@mail.gmail.com>
 <CAOMZO5CjMa0JHfSrMdntmj1_gHoZoqsJhdjU8xR9-1LPupcDAw@mail.gmail.com>
In-Reply-To: <CAOMZO5CjMa0JHfSrMdntmj1_gHoZoqsJhdjU8xR9-1LPupcDAw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Jul 2020 11:02:41 -0300
Message-ID: <CAOMZO5BewEhGKbDunxMRxUmk-f6TGgBjFWkEuCD7+g9jsGBk2A@mail.gmail.com>
Subject: Re: wm8962: error at soc_component_read_no_lock
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, Jul 17, 2020 at 10:01 AM Fabio Estevam <festevam@gmail.com> wrote:

> If I move WM8962_ADDITIONAL_CONTROL_4 to the non-volatile region, the
> two errors related to this register are gone:
>
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -149,6 +149,7 @@ static const struct reg_default wm8962_reg[] = {
>         { 38, 0x0008 },   /* R38    - Right input PGA control */
>
>         { 40, 0x0000 },   /* R40    - SPKOUTL volume */
> +       { 48, 0x0000 },   /* R48    - Additional control(4) */
>         { 41, 0x0000 },   /* R41    - SPKOUTR volume */
>
>         { 49, 0x0010 },   /* R49    - Class D Control 1 */
> @@ -790,7 +791,6 @@ static bool wm8962_volatile_register(struct device
> *dev, unsigned int reg)
>         case WM8962_CLOCKING1:
>         case WM8962_SOFTWARE_RESET:
>         case WM8962_THERMAL_SHUTDOWN_STATUS:
> -       case WM8962_ADDITIONAL_CONTROL_4:
>         case WM8962_DC_SERVO_6:
>         case WM8962_INTERRUPT_STATUS_1:
>         case WM8962_INTERRUPT_STATUS_2:
>
> Is this a correct approach?

I have sent a patch that fixes the soc_component_read_no_lock errors
for the GPIO registers.

I can send a formal patch for fixing soc_component_read_no_lock error
WM8962_ADDITIONAL_CONTROL_4 if this proposal looks good.

Thanks
