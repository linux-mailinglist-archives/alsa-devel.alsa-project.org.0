Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369C83A24D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 07:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F06C846;
	Wed, 24 Jan 2024 07:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F06C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706079055;
	bh=9ROslYJ2bqvuSwMRa9U3j/58U90wj+HMnKZ0258k0KQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KE6t6MnNTGlRhhLl5cV9VuhFak23zL3AOg61UQpKDbkY7HCH/M76Rr3iVbs5as6DW
	 ko9fdwSTZhE8zW7XnSpB2MmH4TXq5jbt3pqwtnVtKMCEclqFTwdpW19Y8OeIikCAyB
	 HQ1znF9JeH/IsddqZl15fKvR6I+y0BA3KwKaB94A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18E5FF8055C; Wed, 24 Jan 2024 07:50:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A18AF8055C;
	Wed, 24 Jan 2024 07:50:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C22F8028D; Wed, 24 Jan 2024 07:48:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABB35F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 07:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB35F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PXc/0Pyj
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ca29c131ebso3679908a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 22:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706078893; x=1706683693;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfDbLdX2GozLFqJizf3b4RCoulWCoI6SGrCtOXsLFb8=;
        b=PXc/0PyjxNGYgYObHhMFtt7P3/vAnhiSoKhePhJhdZdpGDsaBZn60bVBUlv7aUSCrj
         MViM/YreeaLkzaKRm7qNAHpOBmtZ+si/FmiJbWdtIJNQB1N6O1/yqmH0Z5jqlsvkrGdD
         KQ4xx8mUIkflemI/r0iiLXsbj5g9z8T17SkhW+xXAdwfc/rkU0/tfXhD+8+f/riaIFs6
         D3FBHQzepgDCUhSX7opev8rVLq/3c6nQHEVHnXziryvs9oFmKjvkD6rrqm2BtwsM3LJS
         MWJw3kzu/5yh7KPm0pOvL/3Ivp1jrriuBgNFYoXU5cK5/ziLMpxJ3Y2nVBhbPiH7qMe6
         kJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706078893; x=1706683693;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfDbLdX2GozLFqJizf3b4RCoulWCoI6SGrCtOXsLFb8=;
        b=TOwwHkGutOxzvT1U1uGUjd0yD2pyGYnAmMswYjREa4OV4L54QIo8yg6LXSskmeaVrn
         FELHI+MhCugqvAXWZxI/msZlZwcQp0QbI3mFNa0t2tGrqa6Kbd8nXsZESuCZOTtjQULu
         190cY36spMgQ0TtYPmrJlsMms2nHriTscyNA9uqoXcTUyWWaeAaBbmh/APbnqliXXJTw
         q3GcFlwH8ppcQ6S23f2wBrITAwMLBYgv2mFzxwWFFRxcbTyh5r9Xw/8wMNCsb8GXet4j
         hu7g/Hvi3TlUGywnKV+CKDXhl801VWxrgbAs4M44I6idKuQt82jT9rscVwznSJo7H46v
         O+/w==
X-Gm-Message-State: AOJu0Ywq9Lp1KltIxFkluV4PUnp/0pCW5QRVb8z9rngILyvfrfoo6UL9
	T69AnPmXG0/0v3MCo5KhkbwhWT5q2MQA3rP70JqgHYWVxKJK2zcyepda5PQyqodYeg==
X-Google-Smtp-Source: 
 AGHT+IHe4b7rNx7OnH+c7FqBpEUFtiK9/8eeGTzJXJrylF7wCYknSWUAkfeqXEqm13IJhwTcPSEGPw==
X-Received: by 2002:a05:6a20:8e09:b0:19c:56cf:1cea with SMTP id
 y9-20020a056a208e0900b0019c56cf1ceamr511630pzj.91.1706078892995;
        Tue, 23 Jan 2024 22:48:12 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a056a000bd800b006dda00f224asm534926pfu.166.2024.01.23.22.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 22:48:12 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 0/1] ASoC: codecs: Adding new volume kcontrols
Date: Wed, 24 Jan 2024 14:48:05 +0800
Message-Id: <20240124064806.30511-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: RC2CZOIBIFMQJGJSI4RRLU2XYR2K36UO
X-Message-ID-Hash: RC2CZOIBIFMQJGJSI4RRLU2XYR2K36UO
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RC2CZOIBIFMQJGJSI4RRLU2XYR2K36UO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi ,

    a patch here for the es8326 driver...
    
    We add a new volume control.We compiled the new version patch in 
    for-next branch. We did test with the new driver in machine. 
    The test result met our expectations.

Thanks,
Michael.

Zhu Ning (1):
  ASoC: codecs: ES8326: Adding new volume kcontrols

 sound/soc/codecs/es8326.c | 92 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/es8326.h |  5 ++-
 2 files changed, 95 insertions(+), 2 deletions(-)

-- 
2.17.1

