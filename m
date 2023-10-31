Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF467DC95A
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 10:22:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B6F7F1;
	Tue, 31 Oct 2023 10:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B6F7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698744170;
	bh=UguGjFydJ5y2cdHWPVSQSwzr2e7gxGn+i8WAtrXIv9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TqRseBrCx7U4u9GN5Kzx47CRIO83RBhIL1bpqPMtjU5jnoEQDIbYEe0b9TilkYxPz
	 Bxnu4TZeCV/Ac+i37rccePKjo2ngjz5clcWFSdDtjgguicziP1ERONDJ41KXNVy1AV
	 IDdr7eqhvg/ZhYO6Yzoi+btHtPIQGVSqA7vj63f0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9377FF8016D; Tue, 31 Oct 2023 10:21:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5919BF8016D;
	Tue, 31 Oct 2023 10:21:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DC15F8020D; Tue, 31 Oct 2023 10:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03CB1F80152
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 10:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CB1F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KkoLhVsB
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc3bc5df96so17474215ad.2
        for <alsa-devel@alsa-project.org>;
 Tue, 31 Oct 2023 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698744107; x=1699348907;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMhO6AheOkROkYq6bnpauEwzILqH2QfkdFjHkkICoG4=;
        b=KkoLhVsBt7qDJmMiRtRKantVFc49QHeINABYNBngz285OGsTbG1QSTjw940HlKwr07
         sbk//vpJ59Xnr6WPzzQsK8QNLTPDUMrV1JR6uuRrMoOTl6ZQhkOc7G+iJsg3VAlv3V32
         EWb2a+kUyKipRbOu8s+iS/AhbCka/pcHkQY/Sl2sUmOfOvGSTanPiyNCb6pCnYDAmSoN
         oPMN6gHa45T9mJM7/g2zbP8XDjcVA3Wt/Li+kySnEa6LcVleLkMNM6WLlNRAow41OAdO
         2oEF3b/2Z5nTSZRV3FXbA1SHPVVYHHXkPoJAOyJuGOMnP4++JUlAxRzrcPr9UK6ScyEz
         N9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698744107; x=1699348907;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMhO6AheOkROkYq6bnpauEwzILqH2QfkdFjHkkICoG4=;
        b=Bihmos4Z6YzF5KBEWeWDscGo/8AmAS6cJy6Z1GnFLQlASbO1an2Gg3pBZ9ealMqsKW
         1GGJm9mEebBPL8iQx0HVQrmpkrr/yd/NJXwuw+f+m5jEot05QLrYsjEGGt5Mp1qJSgDJ
         kAP85Cr37q3wruH67V8UhrqVMH1Jq9Skzu1rKaznd055A1tE1fsarhPWobrVYBvnQ7gO
         ZWPFmcVjBoosvkasJwF7knVhyGKekrYY+PWRITBniR4Yl5cJsmdU9L0ly9HmGlREfugb
         Tl5l9pDtX17VPdSDw5RKwKbK1wW/vexCxViOb0lMlRFvrI6gD6O1lvMRtv4RfDomtMHC
         Vb7w==
X-Gm-Message-State: AOJu0Yw1YcX9v4nxP/+AgPyim0RmFs84A7D20YPAit8ME09420WWbOvQ
	mA/axzAiNCJdHtKWv4HIUtRyoKB53Vh3aQ==
X-Google-Smtp-Source: 
 AGHT+IERiGpO4kSA5S2FKc953z+x+MahB1iQcURrEnyVMm+ChvIlBZ5bI36twM2wVx2TL+zNR6ypIQ==
X-Received: by 2002:a17:903:41cc:b0:1cc:5dd4:7cf8 with SMTP id
 u12-20020a17090341cc00b001cc5dd47cf8mr3555500ple.27.1698744106938;
        Tue, 31 Oct 2023 02:21:46 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a170902c94600b001b89466a5f4sm880503pla.105.2023.10.31.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:21:46 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 1/3] ASoC: codecs: ES8326: Add chip version flag
Date: Tue, 31 Oct 2023 17:21:42 +0800
Message-Id: <20231031092142.87487-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3efaf177-f9f3-48c7-b5c9-d4530d350c0f@linux.intel.com>
References: <3efaf177-f9f3-48c7-b5c9-d4530d350c0f@linux.intel.com>
Message-ID-Hash: YZVB7GBAHK3YCNNOB7P3UHZUB72E6FK2
X-Message-ID-Hash: YZVB7GBAHK3YCNNOB7P3UHZUB72E6FK2
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZVB7GBAHK3YCNNOB7P3UHZUB72E6FK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > +	{3, 1536, 16000, 24576000, 0x20, 0x02, 0x10, 0x35, 0x8A, 0x1B, 0x1F, 0x3F},
> > +	{3, 1625, 8000, 13000000, 0x0C, 0x18, 0x1F, 0x2D, 0x8A, 0x0A, 0x27, 0x27},
> > +	{3, 1625, 16000, 26000000, 0x0C, 0x18, 0x1F, 0x2D, 0x8A, 0x0A, 0x27, 0x27},
> > +	{3, 2048, 8000, 16384000, 0x60, 0x00, 0x00, 0x35, 0x8A, 0x1B, 0x1F, 0x7F},
> > +	{3, 2304, 8000, 18432000, 0x40, 0x02, 0x10, 0x35, 0x8A, 0x1B, 0x1F, 0x5F},
> > +	{3, 3072, 8000, 24576000, 0x60, 0x02, 0x10, 0x35, 0x8A, 0x1B, 0x1F, 0x7F},
> > +	{3, 3250, 8000, 26000000, 0x0C, 0x18, 0x0F, 0x2D, 0x8A, 0x0A, 0x27, 0x27},
> >   };

> That seems bit confusing, can't you just have something like 
> coeff_div_v0 and coeff_div_v3 and select one depending on target?

Using one clock makes it easier for users to compare the register differences between the two versions of the chip. 
It is also easier for developers to check whether the register changes are correct or not.
