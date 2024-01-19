Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116A8328C4
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7271C3E7;
	Fri, 19 Jan 2024 12:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7271C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663795;
	bh=0kkln628YAeyeIiaw7+CsrRjCRmhC8gmTi38wd51pG4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vaA8Yc6QW3Xpy4PZWncFxyz/Ny9HHkKcXN5pqN9CLgFPIHJmjX97OmyVBerfA+Pj/
	 pzcvJYgelfpPC2m5H0Xcm7kXxOgCzleVgoCcafRWxqLPvsYGGYXs3mMbb9cjtZEzMs
	 UOhc0zw+qOzF9r6iHIGxo8jKkpJk6uHnajHj63BQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 902CDF801F5; Fri, 19 Jan 2024 12:29:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D23F8055C;
	Fri, 19 Jan 2024 12:29:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE758F801F5; Fri, 19 Jan 2024 12:29:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 733EBF8055C
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733EBF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QHzyAbOd
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6d98ce84e18so655394b3a.3
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663747; x=1706268547;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97rAU8khDVn6YQVp1cXPL1aT2RFKxunOpkElXfyzXEU=;
        b=QHzyAbOdM3P9sZkYHDjQrQ8YM19nQdzSE4wMs7p38i3Wge/cpamwYUr2d9sdVhCHzD
         D3ouG9VbpDU83jOaV9yAcUWa1NA/7BzffpF3Av/6uWGGMQFyO751xaGziwUm18IXDPsD
         TflGlaK1tDDSuNB/kFnaqLA1/2VmsI2Jmzs0WGud862vXKERGCsU7VnrtBhaVV5c52N5
         SN+KmIBn+1/Wmzba5lxtQesSAqiVhTMBS2p8Aum2Gcqj8NkkETo2K2nSOjKgyuJFeQ8S
         66mh0X9x/BDtK+RT/8Q1o0t64Mfm46uLc8Nfl8V2uUbEj+/O3US6roCQr/txRQSXtymK
         iohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663747; x=1706268547;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97rAU8khDVn6YQVp1cXPL1aT2RFKxunOpkElXfyzXEU=;
        b=Y6nRTVjXXiu3/JCPTpsqm6jNo461vmCCxt+7HHYiM2fxDVInGpgSuFPA1lgdnjiIIH
         B5MvjhNu5hh3MfQalhqoCAT9BglAF2O7YkaDsqrazhlnteMxpQBPIXV93YAgzIXvdEo2
         pH2mMlNWwV517N1//C0XnCs1qMrCzVev/35oLbnRmqOBdMG9g3MKv3M8fdzTIQI1A5ya
         w86fHTk0QCxdllvYTSsRY9OuigQJZMd679uLUbsFjsIFdVb5SkKrzId8KSDu3VSa7JvS
         0zmH+LBSOxndJ3E+/A2d5OsA3t8T+5KHI4cvgiHA+ATEAhGqplM3hhE8tdLOmftOE87F
         tc7Q==
X-Gm-Message-State: AOJu0YwX9/qjXD/pZI1xOfQ90LKI5cwzuR//QMkc1asS/Ot+AzrAp7vj
	37Kjk+941ChhNBZqFxPe8d8F8vAyDD/iUXnwP70oSs49D50p07GXrdKy2QuUSxfMoT71
X-Google-Smtp-Source: 
 AGHT+IGIXva/NIgvzjNf638RQItyhgc74HMWc6qSnwOZMM1QZTkWRlaMZTZ6Ss1ZCo/cN68heQLOQA==
X-Received: by 2002:a05:6a20:9193:b0:199:c23b:7957 with SMTP id
 v19-20020a056a20919300b00199c23b7957mr2570832pzd.68.1705663746954;
        Fri, 19 Jan 2024 03:29:06 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:06 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 0/5] ASoC: codecs: fix ES8326 performance and pop noise
Date: Fri, 19 Jan 2024 19:28:53 +0800
Message-Id: <20240119112858.2982-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: KBWP3TGEJBWPKRRO7TM4QWL7Q3V5A2QU
X-Message-ID-Hash: KBWP3TGEJBWPKRRO7TM4QWL7Q3V5A2QU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBWP3TGEJBWPKRRO7TM4QWL7Q3V5A2QU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    Hi ,

    5 patches here for the es8326 driver...
    
    We get some issues regarding crosstalk, THD+N performance and pop 
    noise from customer's project.
    Five patches are used to fix these issues. We did tests with the new 
    driver. The test results form test department met our expectations.

    Thanks,
    Michael.

Zhu Ning (5):
  ASoC: codecs: ES8326: improving crosstalk performance
  ASoC: codecs: ES8326: Improving the THD+N performance
  ASoC: codecs: ES8326: Adding new volume kcontrols
  ASoC: codecs: ES8326: Minimize the pop noise on headphone
  ASoC: codecs: ES8326: fix the capture noise issue

 sound/soc/codecs/es8326.c | 216 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/es8326.h |   8 +-
 2 files changed, 175 insertions(+), 49 deletions(-)

-- 
2.17.1

