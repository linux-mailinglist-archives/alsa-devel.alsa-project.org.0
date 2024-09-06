Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A8977E34
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78564B71;
	Fri, 13 Sep 2024 13:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78564B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225815;
	bh=q9QVcDnUO6ef7BN/o/SJve91/yT+mIjcG2MWVsf/y0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZHZSAY+0Llu/SIEdGCuH07ETknEUS+ZOcy17NNuk97X/gOkMHv5CXgvl6JMKpZ7Eh
	 q8voo1lOm2BC03QXlDq54OGa+0YEBKaa+WYaKnSzviUHEFmm36esz68qcgRCojKPky
	 r7gBGl6BDPVsptAZmoe9/ibHD62Ec8EWEtWmtOBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75226F805E0; Fri, 13 Sep 2024 13:09:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DF4F805DF;
	Fri, 13 Sep 2024 13:09:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2D70F8016C; Fri,  6 Sep 2024 19:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04FE8F80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 19:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FE8F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=BtnSDy4S
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42ca580f4c8so95e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Sep 2024 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725644866; x=1726249666;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQb0TO7993zK5C2BTxU+zoBSpAG4+bl+jhdo5Oy2IvA=;
        b=BtnSDy4SlldsdWabhbCvj789zTAhiKsSJWY6vQzizWrIYzMFVKXGdJ/m7kD3Uw/3Ng
         VLmHD52cSZf8N1EWNsrKy6uROS3BXSLN7z//ZQVTz8WPk8KLE+fBF/kb9FkusYn+P+JG
         Hric/LuVVE/HhXxS15BdvnaATBxC1Q29+vxvLUsbixzHr6lXKvURHomKHiU3TTGPcjam
         UvO3647IcAl42P6PLB9JKtmfKadiuk7DgFZdibJGxuef9gIAYJVfTVJMAIcUE73wMIEm
         SJYCYwPjG82dvr9eCfXWHVDXqrFai5mVLJ6iBX74vU6Dj2O4K5LvFy3COlgbv6gc66wZ
         lEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644866; x=1726249666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQb0TO7993zK5C2BTxU+zoBSpAG4+bl+jhdo5Oy2IvA=;
        b=akvR28iznWV6wV5UWh5DJUSSNcjINyT/VDYydGElh/LUaatMWoFqTfQA7oDUhA4Mhb
         MBgSDTzZIwXdVeGypg/+p+tOOSsAEW+WqhURhachbF+i4WSIMLpSrE//7u+7iXrh/aut
         4hth+Nl5tl8dAjQ4DO7vWVojz/mpm7oB9l/oH/x44wFWOSq4/YkY7ez7wG8fWvcUvqTF
         k32mm1I7xiGSPHY2L/eGPOPEleayXNDVk7uaoYz/tMTmqtAdl+pCNA4U2zn8swBdlW3m
         CnncjO18z+zLnHHjnnuElZf5gTaZT7IJDTom7xibVi8EjUw5JmlXmZpnEvcaSYrogikA
         uPJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwWUT8AfZk/EtCCGkM9J2jM5DtIz5IGOuwmUkuncSh77+KVFreEj6wWKnZTa82oYpNPr/NYY5XvGaS@alsa-project.org
X-Gm-Message-State: AOJu0Yy8Cm0HsDkAuQHRLA5xehaieF0NbS+6FHRB4NOaYjObN2MoAAnk
	+1CUpwTKiiZ5qUbySFpUnGbfOS1kniHOUUTIYLvCA5Uz6GygilvXUlIZLBNu1H3bAgaC1N9zrGx
	h/3oz87BAT2s0EVSScsuqjWC4KOa+IdtnA1M=
X-Gm-Gg: ASbGncvYCJjusZuoG0i1zBaKvTTKF0h/wCQolUcqrwuWHjNkQQkCS5wjSPyr7efr2FZ
	DHQt3IrzTvm9v5agb+7TkWPrUxgGVI+84UIiCUQQd5dNQdtk7tV+71sebWA==
X-Google-Smtp-Source: 
 AGHT+IHaXYesgdTa2zrVDK/ImdruxZNlwcL8CUKuo7JERdYwqfWJo+EeWwoXyZC51s10TKXrHB0roVVVfwWMknj+CZA=
X-Received: by 2002:a05:600c:254:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cacd3ab7cmr25045e9.2.1725644864614; Fri, 06 Sep 2024 10:47:44
 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: 
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:47:08 -0400
Message-ID: 
 <CAFs7P=jtd1caEyQqmw0L-Up_y_Cpv8YX4aO7MOkg8Zm0NKeBsw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
X-MailFrom: joshuapius@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HJVENFBJNAKADIU2XU5TMTLCZRPJSAFQ
X-Message-ID-Hash: HJVENFBJNAKADIU2XU5TMTLCZRPJSAFQ
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:09:29 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJVENFBJNAKADIU2XU5TMTLCZRPJSAFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTowNOKAr1BNIEpvc2h1YSBQaXVzIDxqb3NodWFwaXVz
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+DQo+DQo=
