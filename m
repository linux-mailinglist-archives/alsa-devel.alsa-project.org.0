Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A740870F25
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 22:51:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348381CE;
	Mon,  4 Mar 2024 22:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348381CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709589088;
	bh=6pRS3e+gW2skWjL/OeQUng6t3Jb4VlxTINg3kkfgHv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CEmii7oV7+SkrJFnFAF/lDkevzyCT5Sy4zAiSoAAaqocnBBJW/X6BBNUouEk8/KyR
	 7yFatlGTnPiXVXs08wzd+oiZ7xYFpH4ly6PcmYOgdjE9HxBDtnxxXfMaSml84HLcXU
	 IbSXyL+OQmFeicqFxF2ZJFtqql4FDobXvFTF37ko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF32F805A8; Mon,  4 Mar 2024 22:50:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A286FF80580;
	Mon,  4 Mar 2024 22:50:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 647B3F8024E; Mon,  4 Mar 2024 22:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D398F80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 22:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D398F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=B4yjFQYD
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29a940614easo3247709a91.3
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Mar 2024 13:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709589043; x=1710193843;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IadngRhI1ENVldlWZcae+wy9KE6PzrG9wLUF28moGQ=;
        b=B4yjFQYD6J5bMABz2RKyHeXjJMbhLPgDs2MAKzuXyZHTuEZ3h+KNxxerDmULXFg2sR
         U/LWpuUdT+ydE9T44rn3MoARbM0SX64hD0UqmtWZXPcoEf0EqvHlH3nWzKohMJBIDHH5
         RqDg5XR3dmxYUqPGvFvrUruOA/lfufYte5d8hpuxl4AFrhDyr4+P2sJ2V8t0651A0N/n
         OP1ipH+cLKffGbb7n+cy60/wVyHS44DCXux5qeSrsmG0Ys1TRyfjBwoYdtOWs7p5IhpV
         aAYCCVYr25snevPZqZfhmSyCKvTtYbgK6QoEIc76LakUiz93Bk19IUIISg6LGbD2YqJZ
         qoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709589043; x=1710193843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IadngRhI1ENVldlWZcae+wy9KE6PzrG9wLUF28moGQ=;
        b=BsnP+pX/5l9WkxGug6rEyEJrSjlKbjH+fflCGn/vvLmKlqMRpfcKhO8TRrDVgTO+f1
         OSiJlDcegYf3ZlfP3FvZKJPFRdgOvo7sxWrDyU94eyQJLFJSjpcgSYIEresV3XTRJrYB
         CSRbLvVoJKjX7/woDWb8s1cgRXI0Eb2E0TGQYRHh/FYMJY7tpiYPX6XF2vuP633Wh7JX
         R12Dkk0RpoIyB2IFTYwK2Mz+kw4Pqb6DEWa7DZQstjnfLn6KaHHcCCDCmbJV+3xW3oxv
         GaSLoS7itQtqwLnfr2wAJO4ICvdQ5ISn0d4RvKjGznGTFrRihnfCsAlPfs8Kb+LsGnl6
         oZJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyTUU7Y44qtU3MLUpx6KKZs1pPoSuNLx2IxlQD8A7mznMxGo/dxrKEovsblX4/2/4MakTIRKOG4sRFe8HoI2ZJQzBfh1Ov8ICaqBg=
X-Gm-Message-State: AOJu0YzwEcGN+i92YgD/acVASs2aSvWNN+ydZrVGAHr2bslInnDPDy7/
	A1NYAblF1DpWWJrW8gVrMOoo114aCNycpT7GtQTgmVMrzdDBbwmkqsEbKXGCf806ifLW1VzqaUs
	kn+CXsH8Nr9SDTHvk6yxaX5+Pt1T5steedFJm
X-Google-Smtp-Source: 
 AGHT+IHkkShaIeAecDrX/7TrFSYLJzXq7LbG+sUo6sy0jhgKyK1PhgbUlvUbMfI545iqU9Zjx9j7LH5T9wErJDaN7Mg=
X-Received: by 2002:a17:90b:3447:b0:29b:39ec:2cfd with SMTP id
 lj7-20020a17090b344700b0029b39ec2cfdmr4051334pjb.15.1709589042935; Mon, 04
 Mar 2024 13:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20240304211444.1031693-1-cujomalainey@chromium.org>
 <fcd7d8d8-3e71-4c43-b5e8-075369b4b9ec@sirena.org.uk>
In-Reply-To: <fcd7d8d8-3e71-4c43-b5e8-075369b4b9ec@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 4 Mar 2024 13:50:27 -0800
Message-ID: 
 <CAOReqxgDYtsF0RTLnpA5WaFtyf4BYND6a796NomFo1cAsFGJKg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: da7219: read fmw property to get mclk for non-dts
 systems
To: Mark Brown <broonie@kernel.org>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Akshu Agrawal <akshu.agrawal@amd.com>,
 Karthik Ramasubramanian <kramasub@google.com>,
	Support Opensource <support.opensource@diasemi.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IDL772H2DBK65HCD5LASJ2B6SX4PSGWH
X-Message-ID-Hash: IDL772H2DBK65HCD5LASJ2B6SX4PSGWH
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDL772H2DBK65HCD5LASJ2B6SX4PSGWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 4, 2024 at 1:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Mar 04, 2024 at 01:14:43PM -0800, cujomalainey@chromium.org wrote=
:
>
> > Non-dts based systems can use ACPI DSDT to pass on the mclk
> > to da7219.
> > This enables da7219 mclk to be linked to system clock.
> > Enable/Disable of the mclk is already handled in the codec so
> > platform drivers don't have to explicitly do handling of mclk.
>
> ...
>
> > +     device_property_read_string(dev, "dlg,mclk-name", &pdata->mclk_na=
me);
> > +
>
> ...
>
> > -     da7219->mclk =3D clk_get(component->dev, "mclk");
> > +     if (da7219->pdata->mclk_name)
> > +             da7219->mclk =3D clk_get(NULL, da7219->pdata->mclk_name);
> > +     if (!da7219->mclk)
> > +             da7219->mclk =3D clk_get(component->dev, "mclk");
>
> I would never have guessed from the changelog that what this change
> actually does is provide a mechanism for overriding the name we use to
> request the MCLK.  I had thought this was adding clock handling to a
> driver that had none.  The changelog should say what the change is
> doing.


No problem, I can clean it up, I figured a good starting point would
be to just revive the original that was sent in 2018
https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.or=
g/message/26IVUCF7KMKNL7LZWAWWNFF3KB2TURSA/

We have been carrying this in our tree the whole time, just caught it
and figure I would try and get it up stream again

>
>
> Having a firmware property for this is obviously broken for DT systems,
> this should be limited to ACPI systems if it's going to be there at all.
> It would be nicer if it were implementeded by having some ACPI specific
> code link whatever the configured clock name is to "mclk" - I don't know
> if the clock API has an equivalent to regulator_register_supply_alias()
> but that's the sort of thing I'm thinking of.

I will take a look at this, note that it appears the original author
is no longer at AMD as the emails are bouncing.
