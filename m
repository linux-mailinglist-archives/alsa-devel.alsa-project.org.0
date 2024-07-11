Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E992F11B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2024 23:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB87851;
	Thu, 11 Jul 2024 23:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB87851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720733211;
	bh=3E0gw8xZNZBcKBZ5ftCmrShsMbwKFLPy3qBKIy5L2qw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HD2jBmzDBFGSj9Mvl2CTQPXzVepu9prlltLrtkQUrc9WZD+87kbao3J0+s1facX7p
	 aL7NGyTF9tQXk+4IHmS3XL6yquDVFavlkMYTxw4xDsIAgotBqsDBa2xWTRGR6vN7M2
	 f+nDJpEKrSohp2HNhLJFIH0unyh0Fne4kmnPHbig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B55F5F805AC; Thu, 11 Jul 2024 23:26:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3173F805AA;
	Thu, 11 Jul 2024 23:26:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0272DF801F5; Thu, 11 Jul 2024 23:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2F21F8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 23:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F21F8013D
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6325b04c275so13866657b3.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jul 2024 14:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731947; x=1721336747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k86+4SfRSUfiHslr+mDimkcGpY1JjNeuf0o8H3HX8vw=;
        b=snTwL7kEkajZtJISbdqa+wy7Q2Sz6lR9/dLyd9rvOTgsh8u4RHH984wroCqZf9Mv3P
         G7ouHV6BJc7pQuOBWlIFTd/1hENe3WLuuPlSHBH9Ug6NTHvjdaEqwz1jbzmTqR2X2s8K
         pHsygEyTXVR5SlvupIWGgzLj9Bh2NH840+P+HF9UPzNANgniw3itCxaKmGYpsMEadGY5
         2z7IoMArlWzMdkR8ex7OgxT5g8/ZaMtSwCObTNIXrdT4opLLZoYQ3INjTJTUYbvdOuNH
         Y9L6uJ1IxednKec/w3B8x41T1Hk4oYCJPMTY1xLsoEu81rE04gwZyxPrv9tSpQ6LmYtV
         VdwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN9O4r0LIwg29phjcXhtSMzDiH8jIYHrKV4b2h0UrW7bXZUBVPkvFyamLKBdapUVqXpl6as3lNjC4gfOTA505pzCVUjWL7C3tYyZQ=
X-Gm-Message-State: AOJu0Yx4I/wlRU3ZhUmmb/dSIxpMb5Eqwz2hWoutFRtuEDABHgTAitHw
	dFcv9jxhnWHRN+baayrA8TlAL9DbuJRXV8NKvRJKpK4szyB/ZGtwdX7Ny2cc
X-Google-Smtp-Source: 
 AGHT+IH88rpbrH/2cd384ry/SnrzKFCMhYOdXJaj5TQ2AwdmtOjIHdImg4Ykujmchh31WfK5HJ9J5w==
X-Received: by 2002:a05:690c:f09:b0:61b:349c:817 with SMTP id
 00721157ae682-658eed5d6dcmr116964917b3.12.1720731946919;
        Thu, 11 Jul 2024 14:05:46 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id
 00721157ae682-65bc38ea2b1sm7225917b3.2.2024.07.11.14.05.46
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 14:05:46 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e03a63ec15eso1290814276.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jul 2024 14:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJp9xeqsaWDYXF06C/D4ggWs+uZ3tZyGH6EGK4dVMWS0ilhOj7yRcj4qTqZ+hIvVUmevYlPSFspRQqT300aaipQtR258QqDwg5Rjs=
X-Received: by 2002:a5b:d1:0:b0:e03:aa99:66d2 with SMTP id
 3f1490d57ef6-e041b078519mr10915431276.33.1720731946075;
 Thu, 11 Jul 2024 14:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240711132001.2792-1-baojun.xu@ti.com>
In-Reply-To: <20240711132001.2792-1-baojun.xu@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 23:05:33 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdUw+KEGuAOWApfiLJF6b1M8pkoX+u+Q2dEVMqjV0_K34g@mail.gmail.com>
Message-ID: 
 <CAMuHMdUw+KEGuAOWApfiLJF6b1M8pkoX+u+Q2dEVMqjV0_K34g@mail.gmail.com>
Subject: Re: [PATCH v9] ALSA: hda/tas2781: Add tas2781 hda SPI driver
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, niranjan.hy@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	broonie@kernel.org, soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5YMIL3MUWXWLL5AZMBWB5RWEDW7M7Y5E
X-Message-ID-Hash: 5YMIL3MUWXWLL5AZMBWB5RWEDW7M7Y5E
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YMIL3MUWXWLL5AZMBWB5RWEDW7M7Y5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

On Thu, Jul 11, 2024 at 3:22=E2=80=AFPM Baojun Xu <baojun.xu@ti.com> wrote:
> This patch was used to add TAS2781 devices on SPI support in sound/pci/hd=
a.
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
>     Scope (_SB.PC00.SPI0)
>     {
>         Device (GSPK)
>         {
>             Name (_HID, "TXNW2781")  // _HID: Hardware ID
>             Method (_CRS, 0, NotSerialized)
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     SpiSerialBusV2 (...)
>                     SpiSerialBusV2 (...)
>                 }
>             }
>         }
>     }
>
> And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> added into system as a single SPI device, so TAS2781 SPI driver will
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> The code support Realtek as the primary codec.
>
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> --- /dev/null
> +++ b/sound/pci/hda/tas2781_hda_spi.c

Thanks for your patch!

> +/* fixed m68k compiling issue: mapping table can save code field */
> +static const struct blktyp_devidx_map ppc3_tas2781_mapping_table[] =3D {

> +/* fixed m68k compiling issue: mapping table can save code field */
> +static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
> +       struct tasdev_blk *block)

> +/* Block parser function. */
> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
> +       struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{

> +       /*
> +        * Fixed m68k compiling issue:
> +        * 1. mapping table can save code field.
> +        * 2. storing the dev_idx as a member of block can reduce unneces=
sary
> +        *    time and system resource comsumption of dev_idx mapping eve=
ry
> +        *    time the block data writing to the dsp.
> +        */

Do we really need more copies of this?
See sound/soc/codecs/tas2781-fmwlib.c.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
