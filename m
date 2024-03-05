Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89726872A6F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 23:49:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E255F83E;
	Tue,  5 Mar 2024 23:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E255F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709678966;
	bh=HUHDM5iMrcHxB07d6MyhkGBbGKplRI/4qQajGbTH7L4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KzvtZJXf3fseRs7QJNnQxO4j6eO9+b8ebODtbG27S2qBgrd2SqkkfTHoGjBVCrvt5
	 lIixU5KeqzRxKsGCEMuhp+K8DB6IuimaV1X8fh/nCHbyL3K9fiwW8AC6j78Kl5kP6u
	 9JIwofymWfogjY5yUffzTVX2aTpiZgVb16NLwdrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2A7F80589; Tue,  5 Mar 2024 23:48:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AD18F805A0;
	Tue,  5 Mar 2024 23:48:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9FA5F8024E; Tue,  5 Mar 2024 23:48:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B45CF80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 23:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B45CF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=CgXas6oU
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5dbcfa0eb5dso5743289a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Mar 2024 14:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709678917; x=1710283717;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUHDM5iMrcHxB07d6MyhkGBbGKplRI/4qQajGbTH7L4=;
        b=CgXas6oUg7QCqzYh2yDh0z/EaZzbHpPACe5NC7X+PmPGImhIj/whxdPuy7cVbZrPmS
         IyjRh1q4YBtbUVyaH1d4k4fcAVqGEYYXIavhyU7lq6YQr7H/pd4Fg3PTLxeIhRmzQgVJ
         D/vOpGQ9lZnLHgrEAQPqgguje1vp0VZAqTHiZ6voVb/RgDswJ1Q6k2KkvCH5w/y/SAyo
         wy7hZYcpA3jSTNHfHGFnay+BoD0oJijlQCyQ1SGkSbJyXnoN7tQ1bJOakO3GDyqdHiKJ
         HZmFUiKDtDr9IuoLXJg8YBQbYgqraPJxhesiQNAGlnqKyOsvsbagF8MqyyLD3iHiweK/
         KarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709678917; x=1710283717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUHDM5iMrcHxB07d6MyhkGBbGKplRI/4qQajGbTH7L4=;
        b=GSx3yCL0X0Nf+iUNwQAbB6SIWtpKRT8O5JEwLhYj6a7RNVijFfY8o8qEzzewY9Z6YU
         iHCYTu1DFtwKANmBBS2tnJNsgNifsF4j5HTG0Nr9OeXUI9wvrpMnTYIHo1ufLkGWpH8m
         7do1K9rFjdOKR5tiNcom0d/8czFbx5/7ALj/DYO0irGEzhG3Rd9isHKeRGY92sAL7m41
         J8yVLMhmXZy8ZDtA9IzJ0JlxChZvT4xBl7X/tCoq7g6IqyDs6srK6jmxnXTp883kWmBj
         /xocVSYX3KWHG2NCrcJZfskzhqZ6ATCgaFozH7oN1EbGbW1JFAkeoyocObz6/94vbESg
         pWTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDZR8WpM9n+AnGtcHZ4eqb9yStF3k5kRonStflmZsNaHelWb+fW9aj5zvowL7Ub3Dvt9bh6nYyQ7rVEarmxvEqhBsWsDmK9MIIJk=
X-Gm-Message-State: AOJu0YzYiLLVl/sj7y2mzY9rIuFxxov1Xo7u2ml737LyGDV9sV6dMpB0
	JF2KquBudAtzJdwkzufdigPHny3nt6KaTsNcWdXZd0Dg8ELC1DU91tOUYNftOIWgokCm5NS2Brg
	co7NMeiNbgIY6Ar6MdyLj5zZQJKSLw0r9Pn9e
X-Google-Smtp-Source: 
 AGHT+IFaHhlWhOurXDBDbDEr7UjOI7cp8PF453n0K/2DbfGGivGwjf3ppGtBmzz3+OTEcefDsJSNvPrayuXz4nrHT6I=
X-Received: by 2002:a17:90a:98f:b0:29b:2d0f:a94 with SMTP id
 15-20020a17090a098f00b0029b2d0f0a94mr10297398pjo.0.1709678916526; Tue, 05 Mar
 2024 14:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20240304211444.1031693-1-cujomalainey@chromium.org>
 <fcd7d8d8-3e71-4c43-b5e8-075369b4b9ec@sirena.org.uk>
 <CAOReqxgDYtsF0RTLnpA5WaFtyf4BYND6a796NomFo1cAsFGJKg@mail.gmail.com>
In-Reply-To: 
 <CAOReqxgDYtsF0RTLnpA5WaFtyf4BYND6a796NomFo1cAsFGJKg@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 5 Mar 2024 14:48:22 -0800
Message-ID: 
 <CAOReqxiE0zO7pxUJTbydY8NoEvdQbcqGe4MtYy1NqfzRptMyAw@mail.gmail.com>
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
Message-ID-Hash: VBGYEJMUAHP3R7FSJFCKXEEPVN6IHBPH
X-Message-ID-Hash: VBGYEJMUAHP3R7FSJFCKXEEPVN6IHBPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBGYEJMUAHP3R7FSJFCKXEEPVN6IHBPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 4, 2024 at 1:50=E2=80=AFPM Curtis Malainey <cujomalainey@google=
.com> wrote:
>
> On Mon, Mar 4, 2024 at 1:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > On Mon, Mar 04, 2024 at 01:14:43PM -0800, cujomalainey@chromium.org wro=
te:
> >
>
>
> No problem, I can clean it up, I figured a good starting point would
> be to just revive the original that was sent in 2018
> https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.=
org/message/26IVUCF7KMKNL7LZWAWWNFF3KB2TURSA/
>
> We have been carrying this in our tree the whole time, just caught it
> and figure I would try and get it up stream again

So after a bunch of debugging on our 5.10 kernel it actually appears
this property is useless and the system is already attaching the mclk
under the clock defined in the property. Maybe someone pushed a
coreboot update to fix this later which rendered this patch useless?

>
> >
> >
> > Having a firmware property for this is obviously broken for DT systems,
> > this should be limited to ACPI systems if it's going to be there at all=
.
> > It would be nicer if it were implementeded by having some ACPI specific
> > code link whatever the configured clock name is to "mclk" - I don't kno=
w
> > if the clock API has an equivalent to regulator_register_supply_alias()
> > but that's the sort of thing I'm thinking of.
>
> I will take a look at this, note that it appears the original author
> is no longer at AMD as the emails are bouncing.

To answer this for the sake of sharing knowledge, there is a clk_add_alias =
API.
