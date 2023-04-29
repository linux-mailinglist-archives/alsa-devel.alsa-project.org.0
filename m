Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E06F2EE0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371971833;
	Mon,  1 May 2023 08:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371971833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923644;
	bh=WKMTHfHcLKFvphyemMTy+HdsFTXdXr3ManBpJdP3wyE=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T2/0h7hmONaY//yZI4djRITAQy1QeyRTDf8569dNP125PQ5SRiuvSMVdFoSKf0h9q
	 ZFX6uxHHGGA/UY++WebMDWHkClPhGYc5xUpkalanTtXQ8WZBj507GHyBIW6kmPC+y0
	 1GXhwtlC8Lv5KK53+Tc2J0w/vBe+VQYHMzunhawg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90DB6F805D5;
	Mon,  1 May 2023 08:41:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B749CF8025E; Sat, 29 Apr 2023 20:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C53FAF800F8
	for <alsa-devel@alsa-project.org>; Sat, 29 Apr 2023 20:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C53FAF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hLyp1pno
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso175939a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Apr 2023 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682793320; x=1685385320;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7rYf1pcppW1dmA7xaDDSnSaeClQyQafR/qDW52c/qc=;
        b=hLyp1pnoyZeLi+1hDWThkpQhM8rmIOurvq8cVqWP0syV0AQcr07L90zi/CadfwMUFb
         i+r74INt8A0p8GRvjpSKh2X61oRpUPMk662tXt5poPfkwyeZE6f26RIndywLYzPnG17y
         wD902UJXSq5hdlcxe2WUeynrIBOyl6GQxdewbulvk38z8t2c0LH/HKMsRRP14mgmSRdP
         1fAbC4U5XD9XPmk0i3SGrUGMRp32fR7S0VB9zuV1f4ZDUDCjLVEIpuvqT5FnEuEurH/8
         UYP7tFtsTWKCT8YKyGF/2Cla6zGMFaTzrlNGntqATima/6zfEnxHIy1M7wK1hfrenTDS
         r4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682793320; x=1685385320;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7rYf1pcppW1dmA7xaDDSnSaeClQyQafR/qDW52c/qc=;
        b=ey5NPouxw9fm2DmIje5kR9P5Gtqq5TejvPr3IqPvhXHJTPHTENeWOc6k2D7R+xyga3
         BBkZZ+I9zWgkPtW8f/iemNDwt0bgC4Z+377gdOVIl5HSCK1PQVcGvszSMgOyLzS08Nbu
         LOCKeJ88uPXRc6GAv0tz8wsf+r5LyuLt5I/SEavuIznXqcR4mGn549Jl0B94OCdnQVoe
         M6vuyPkvZXkvC4xxx4R0araMSnYURVD7l1autaoQMnzn+mc1ceXsiGUqsm2b0mNNxQGn
         Q32pKMum6VgbauR3Kf2RgmfFRqyf1ZKOMlIbPmOgkNY9KMus39JKhTdR/Oc3sNuNiViv
         rAgQ==
X-Gm-Message-State: AC+VfDyCI5CEo7vuZnssxWv0Z9lPZnBbD/qpyPqJqjOa/dnSm7MvBWLW
	5ZKWlLtDds1eoNOqidUUV4gu86RL/XFsIQ==
X-Google-Smtp-Source: 
 ACHHUZ67o1lpdCt1fLDfXpLlain1qoVxoZQGvqLGHObix2L14wQSd1dYsSPd2fHdTxRP6wSHEB1e6g==
X-Received: by 2002:a05:6402:2788:b0:504:853a:85c0 with SMTP id
 b8-20020a056402278800b00504853a85c0mr8696220ede.0.1682793320537;
        Sat, 29 Apr 2023 11:35:20 -0700 (PDT)
Received: from [192.168.10.15] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 t22-20020a056402021600b00509d1c6dcefsm7815776edv.13.2023.04.29.11.35.19
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Apr 2023 11:35:20 -0700 (PDT)
Message-ID: <26624923-3529-d161-ae62-7e5ece7b0e3f@gmail.com>
Date: Sat, 29 Apr 2023 22:35:19 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Question regarding ALSA modules parameters
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BQJE3IGN3YI23MLML6KBKEYRNYR73WON
X-Message-ID-Hash: BQJE3IGN3YI23MLML6KBKEYRNYR73WON
X-Mailman-Approved-At: Mon, 01 May 2023 06:41:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQJE3IGN3YI23MLML6KBKEYRNYR73WON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello!

I have a question about the typical ALSA driver parameters, and maybe 
someone can answer me. Why it is necessary for ALSA module to have 
"index", "id" and "enable" parameters? They are mentioned as required in 
the "Writing an ALSA driver" and "Advanced Linux Sound Architecture - 
Driver Configuration guide" articles and used in many ALSA drivers, but 
for what purpose?

Kind regards,
Ivan Orlov.
