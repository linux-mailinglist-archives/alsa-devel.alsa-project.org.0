Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E1867FAF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 19:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5A36828;
	Mon, 26 Feb 2024 19:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5A36828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708971638;
	bh=rFBHf3WhN6KMMNJ9EOPkQZj11qYxQQpZBIeoEU4pQ58=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=le+eYAfVKWAHJiJxru0ctmKQVTxl67jUeKnz57z5txwHwUEXC4Tgil2yOyhrx9tYO
	 4T7ZN9upI5DwkAjAglQMZSUEjnCBgXuZbMoJzjYJhv4ql+AbuBBSQddo0lOcj7SfdT
	 9nbcVxJGg/HiqZ7veu5fDS7nOiwS4kAHRXxIVcvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4421FF80588; Mon, 26 Feb 2024 19:20:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7D8F8047D;
	Mon, 26 Feb 2024 19:20:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF62BF80212; Mon, 26 Feb 2024 19:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8451F800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 19:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8451F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=quIp6Na2
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412a57832fcso8581715e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Feb 2024 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708971592;
 x=1709576392; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYjZkD+0muyfme0ZAvaQZRAnb6hcDJgJvM4YVzcOSBg=;
        b=quIp6Na2ed1/Rj1va6tYMDLHksN8Tek7hc//0dJ+zeDMD7fOhXXUq9GkZZYGTaYY+Z
         fQW65i/Q4NYT62GdzucFkrx1QH8/DV3R1maMriqujqko3SQqx2kbJd7JxYDnyCgd2Soj
         4WDQjT8QvMGMsr6dzCI4twqUzOvF5O4htI8cDWVPVS4ofQWyLJfTU5TLHvbUTh0J1rx8
         7gKMdfx7PtHGWXlObyR8NdgNvrf2+fwkrOCVlCpyYAyi/RLYA/APZfoFND/QXUwMaCqe
         E0iDmLvnc1QXRq1bNH5J9OBhH0tIGWrPcpYeAfPYoLq074v7ZSt4ZvYjenZvyeoijsfh
         TgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708971592; x=1709576392;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYjZkD+0muyfme0ZAvaQZRAnb6hcDJgJvM4YVzcOSBg=;
        b=vSYH8UKp0cnEI6x8kRFQ4Nuc5znH5Jh78U++Et3xz/nkMt+VgStldNXmRp41miTsFA
         lb7HrXa7fZYzIE2sk5z3gTRdjGY+4ippiwNqn/lIOPfLBoF8h5ECulKwrYzKAkKdDONu
         FaKoxxVO2U+S5I0qnQyw6OD9xdtx5ZDVDygXGPAj3F9BQTQDCq2YAcf+l+yiuxpYD0C9
         EFTcvL6sBLLtWx8RqGPpspcs7mghgjoBMDXYEFo19uSgyHS7F07FjJ+eSVZkuVEb2mKU
         groeKZYtdgF/w3sjXZ2L0i+j0dGSQSEOQiYdMEV0a52DINYPuxK/Xw4tqBsciN89JmX8
         76Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPCOt0piRTsS/jhDJ8gIo73Rp1t/KVYdG43c8oI2dH7FylOLU16m5MqnQV5ah+Y/p+8Rx7/3byv6kocDupUWnV3EHpJTULoDC7yZo=
X-Gm-Message-State: AOJu0YwBjA4gZGp6/GM659E99YzJlIyGxEsx531kdkYCSzy/dOp4F7fo
	g0bqd+Uo57IrG1E1aA7I02oNCYDlI3OtobFjnBafTOptOWroVL1qm2rSBGqpmcw=
X-Google-Smtp-Source: 
 AGHT+IHd4q24wEXN+ZHmPow1e3uPSDobPnHsBEDUab3+mDUNHABiOsz6pyHCGDApLnilqTkrgTRdIg==
X-Received: by 2002:a05:600c:4fcb:b0:412:78c8:b31e with SMTP id
 o11-20020a05600c4fcb00b0041278c8b31emr6525048wmq.2.1708971591932;
        Mon, 26 Feb 2024 10:19:51 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b23d:6981:ba6:e52b])
        by smtp.gmail.com with ESMTPSA id
 10-20020a05600c028a00b004122aba0008sm8846662wmk.11.2024.02.26.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 10:19:51 -0800 (PST)
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
 <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Date: Mon, 26 Feb 2024 19:15:41 +0100
In-reply-to: <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
Message-ID: <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4ZJMMJ65OXCSJ4URJ3SODFYQLDEAWS2U
X-Message-ID-Hash: 4ZJMMJ65OXCSJ4URJ3SODFYQLDEAWS2U
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZJMMJ65OXCSJ4URJ3SODFYQLDEAWS2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 26 Feb 2024 at 15:42, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, Feb 23, 2024 at 06:51:12PM +0100, Jerome Brunet wrote:
>
>> Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.
>
> This breaks the build for me:
>
> /build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_f=
ifo_pcm_hw_para
> ms=E2=80=99:
> /build/stage/linux/sound/soc/meson/axg-fifo.c:149:28: error: implicit dec=
laratio
> n of function =E2=80=98FIELD_PREP=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>   149 |                            FIELD_PREP(CTRL0_INT_EN, irq_en));
>       |                            ^~~~~~~~~~
> /build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_f=
ifo_pcm_irq_blo
> ck=E2=80=99:
> /build/stage/linux/sound/soc/meson/axg-fifo.c:207:18: error: implicit dec=
laratio
> n of function =E2=80=98FIELD_GET=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>   207 |         status =3D FIELD_GET(STATUS1_INT_STS, status);
>       |                  ^~~~~~~~~
> cc1: all warnings being treated as errors

Ah, I forgot to include <linux/bitfield.h>. Thanks for letting me know.
I'll fix it

It was fine when I tested with ARCH=3Darm64 and the default defconfig so
most likely it got indirectly included.

Could you tell me which ARCH/defconfig triggered this ?

>
> [[End of PGP Signed Part]]


--=20
Jerome
