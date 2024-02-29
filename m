Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0586D09C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 18:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2A6985D;
	Thu, 29 Feb 2024 18:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2A6985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709227676;
	bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qQ8mnoyVV86HhOQv44bw5jCWb6S6AUdjkYGOKKVaVs0zFPZAS44TTCd/5E3jluDaE
	 GQvH6c824vbNjRl8bjznzH0zNO5+rDwcyKqNYQAJZlQ0cIGNQ6xaJw9NzmpExvp/b0
	 auPLCKr8J2atEesTWmY2Cbl3a/mP2L9RXlrKN7VU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D480DF805B0; Thu, 29 Feb 2024 18:27:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB6AF805A0;
	Thu, 29 Feb 2024 18:27:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 180E3F801C0; Thu, 29 Feb 2024 18:27:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2647BF800F0
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 18:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2647BF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gateworks-com.20230601.gappssmtp.com
 header.i=@gateworks-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=EiPxIFz5
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a44665605f3so60349766b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Feb 2024 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1709227631;
 x=1709832431; darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
        b=EiPxIFz5LRtluicvYaii/LA/G5fgW4K+YeqdvsYYNc4LE0v+UNHhK47AGD2+fneuCA
         GzhDLVOSLuc2qmvQvNWqVZQYSUo2c7S2VTbdOblXoQfQaLyH4lZ/aIfhQ/ia5ep6symY
         ruiu5A37+ON/4/BWNINlF1yaSn/MMmN5lZWb9Z/01P/XRt3Z/RJTnQiidi6XpGmBe5D6
         rVQNeoibowJvBxnpwP4hrFDpmHUsfvft/Dn3eIsuJklpD7+/OJ3XEsioM3vz5GS9Ip+D
         Rfhr9UBfjDWdtvbcjlSkyFu6FUoqqd5+0IM3Vp5I+gUjNinekpzEZA0H/cEdE+pDP8gK
         dxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709227631; x=1709832431;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
        b=M5r+6ZQJSDk2UoVFsssN+ENdHH4H2j3tAny08aIlC0EXFaYr9VYP8SI8w019hb4rGw
         qwItBaJel52yHx2mB4mI1fJjEZi5yq2Drd/sMREO9dtWYZsfRy/iZaHfZf6IOZcAK/YN
         qAAtok8tG+KnKqGW+J6kC5NWsHCH/GfoueLtACcJ3fp5hjqgfC7fu+jNjrIeQuDvEd2o
         O5FAv5jTA0C1UgKnBpyF9izwIeRgTYDloYuyydZ0uzgdGLTG1b5+DeZU8iZxBJKn5FAm
         XmC6X0OZxSkxmAyX4yu1q56wjwX1AYggaS98WwMp5ZoCed2mpt/dnZ7JB/TKKius/x5e
         FWPA==
X-Gm-Message-State: AOJu0Yw7nAlLs/XqHye8FsjwJ9UW1VVWN1L7IKDfTpyCMowmNp7DoE2+
	FTCgnttVN5cFLLd/EpvAdO6DSu3W7+HSnj6DqzgIKiob+OmBCTY+f30cPpimeiwij/O82/2hMw7
	zQXoStRG5gsF8CBzadchK44nEpWCXJrRVYvAllg==
X-Google-Smtp-Source: 
 AGHT+IHY+BeReToKKxC+x9eEFVG469n2fNVsygBbwAcPapCF0QV3dnwOTqV/Fu19u/7jKdln3AQTI2lVnWJwQiLIPYs=
X-Received: by 2002:a17:906:5fcc:b0:a43:a4a1:1945 with SMTP id
 k12-20020a1709065fcc00b00a43a4a11945mr2004809ejv.75.1709227630755; Thu, 29
 Feb 2024 09:27:10 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 29 Feb 2024 09:26:59 -0800
Message-ID: 
 <CAJ+vNU3y5pzqeBnr8LHDtJtU7zajfRvP=_WmAhP=cAp_3iGFQQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
To: Sean Anderson <sean.anderson@seco.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, andersson@kernel.org,
 bgoswami@quicinc.com,
	brgl@bgdev.pl, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Device Tree Mailing List <devicetree@vger.kernel.org>,
 konrad.dybcio@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 perex@perex.cz,
	Rob Herring <robh+dt@kernel.org>, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: SFJ7EEZOH5F7OQCOIG7GJT7M4TMNJV37
X-Message-ID-Hash: SFJ7EEZOH5F7OQCOIG7GJT7M4TMNJV37
X-MailFrom: tharvey@gateworks.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFJ7EEZOH5F7OQCOIG7GJT7M4TMNJV37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> On 1/9/24 04:41, Krzysztof Kozlowski wrote:
>
> I think a separate pseudo-device is necessary a generic solution. So I
> guess I will revive my patchset.
>

Sean and Krzysztof,

I see a lot of value in a generic reset-gpio driver that you have both
tried to get accepted in the past. I support boards that have a number
of SPI and I2C devices that often have GPIO resets wired to them that
are pulled in hardware to the in-reset state and find no support in
the various drivers for reset handling. I've often wondered why a
generic gpio reset wasn't supported in the SPI/I2C cores like it is
for some other subsystems.

The approach of a gpios-reset solution makes sense to me.

Will you be submitting a follow-on series to your previous attempts?

Best Regards,

Tim
