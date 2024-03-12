Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96449879A60
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 18:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FC6F53;
	Tue, 12 Mar 2024 18:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FC6F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710263496;
	bh=b4CGYyV6H0a8CZ9PDg43UgcxxQo7epOIcKkB3Z+8OrQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vCo6OyatoSKD4XElDkOjmFYJw0tBh2j37/E+CXwUVwXBkwzvvCQqBc7F8FL8ATPTj
	 +nL4OZk9h9R6Z2vDNP5nu8MAVpH7KdvRj9QUTDuaZ/+UTF104HW/+ceNuXiO0+8BmA
	 kAc8upTU9At9ltjTeA/vaqPoB9uBq9DUR0yVF5JY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FDC0F80587; Tue, 12 Mar 2024 18:11:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC3CDF80579;
	Tue, 12 Mar 2024 18:11:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B269F8028D; Tue, 12 Mar 2024 18:10:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C50FF800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 18:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C50FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uVNYlL2G
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33e92b3b5c9so2935332f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Mar 2024 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710263453;
 x=1710868253; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kedMR37YPDPlsEfMRj5mdnPqWnjFh+suhNRGVJF/T6E=;
        b=uVNYlL2GxSRtzqbUix+YylSzn23VTrh3PqJo5gGfeU6Bu1tpRpPZ7J5KZ9R8FFysjT
         N0UFRcbm3Fu0C2bygmXO1o7JVa80mQb9asMjdq7ufnuydEi3DiD2UMTtkr6SD5MzDnnT
         lCuFd43plCWJXg/v/6XeZLzUjbMy7TqMW8mzjdiwbEV+meh+UAFN09H7e7lVMdJ9vPbS
         PuBAm6C82inQqo9gxoA+ugjcbrdhwpUWhs3jd5rmyqhPkmzGWnwh7Q9+3VYSoa8ALHI/
         roDpHYMP0dCG3IfTuU3Wq0JgyuLsWQxNBkizePB6HLzVNAlG8ecewptNVrU+hyUhyMMH
         rbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263453; x=1710868253;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kedMR37YPDPlsEfMRj5mdnPqWnjFh+suhNRGVJF/T6E=;
        b=vnUxDnRntc8GxaLQyXDDEAdyI4rHWj83iKKv3lf92WnRfHFyCyZiqe6ABIqOiMIhfG
         AkSb/2aXt/Yp3jQAKwL0co9VjmtobQk4sXIolE9vjjlbwIe9LHtYKZ++d6tlmVln85Us
         EfuL4OYclcxygIWBlGFH7MRSyyE1mvs9Bwji3FEzWrsE3GcDe/X0r7hApG3zQBi2LkOP
         Awae3s/aOrpHxWZz6+5VTupz64jm7yEfGbP3Mn+ardGOhFuaUP4Nb0VGMDjDdQtk8Qm4
         fq4eZn1aMVR3lHERkIp8M471M8Fhyc2Rw0BCuAedWIAB5No23kM/9nLalKh7wY+OGzHO
         Q3mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWATzNylOQW4HqDiyGagfa1A9NSCwXNCJwykpH83BJWjsdvALH/FwyizU0fha5v59LlFdbVAui7RiYm02irddB0TUu2OMrMQZUBABE=
X-Gm-Message-State: AOJu0YzVCdam3mT2gMyltEZCFPtkgGDqq/A8x0sPMh7LO/KHSSRmISf9
	ah9gyUnyHar05fxoOkx29p4F2qLS9MhHaXac0y6o8ISlA9n0Mz/tiMOCmPUnZef/0nbMydpuY5K
	d
X-Google-Smtp-Source: 
 AGHT+IHRsWaKFE7WsFa8j5+Rh+xMT4T6zAID5V3p6aN0dHDcm3x+mt+R2RJMgYs5YTlQcps+fSIZoA==
X-Received: by 2002:adf:f38a:0:b0:33e:5737:ae63 with SMTP id
 m10-20020adff38a000000b0033e5737ae63mr45287wro.66.1710263452633;
        Tue, 12 Mar 2024 10:10:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af7b:cf60:208b:83f4])
        by smtp.gmail.com with ESMTPSA id
 bv10-20020a0560001f0a00b0033e033898c5sm9554413wrb.20.2024.03.12.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:10:52 -0700 (PDT)
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
 <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
 <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
 <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
 <1jo7bje6da.fsf@starbuckisacylon.baylibre.com>
 <b9de4fd1-ef4a-4c30-b3cf-e36931be90f1@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map
 more generic
Date: Tue, 12 Mar 2024 18:09:27 +0100
In-reply-to: <b9de4fd1-ef4a-4c30-b3cf-e36931be90f1@sirena.org.uk>
Message-ID: <1jjzm7e5pg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: NMTPSMMDP7QSOXZK2IYZAMEABPLIXZH6
X-Message-ID-Hash: NMTPSMMDP7QSOXZK2IYZAMEABPLIXZH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMTPSMMDP7QSOXZK2IYZAMEABPLIXZH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 12 Mar 2024 at 17:06, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Tue, Mar 12, 2024 at 05:29:25PM +0100, Jerome Brunet wrote:
>
>> Mark, I suspect the boards you have (like the libretech Alta/Solitude or
>> the kvim3 maybe) will show the same thing.
>
> I don't have the kvim3 but I can try with the other two (modulo pain
> with u-boot), it'll be tomorrow now though.

Submitting u-boot mainline support for these is on my TODO list :/
I'll try to speed this up as well

>
>> I can't really test right now, sorry.
>> I can check and test further later this week.
>
> Ack - so long as someone looks into it.
>
> [[End of PGP Signed Part]]


-- 
Jerome
