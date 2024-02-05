Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1C84A20C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 19:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 822171F8;
	Mon,  5 Feb 2024 19:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 822171F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707157524;
	bh=g48/g471LD8lkAOaEa25kLlPkxEomPtYRQ8CQIFaNNU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fVhpEYLIOJiIitIf4oZH6VotSBgy7L5xui8jZHgKu6h1OFgUMW24xt0bL6mtwWpxC
	 JBp39kUOeq9qCTB0T1jPFcBvcG4G8bn5Z4w1TMdWNrNoCnx8WyIGyPW2nzvYR9piIJ
	 9DVCM3Kvu2TOwA3vdLH7Z383pfyyHTD1/VFW78So=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55306F805A0; Mon,  5 Feb 2024 19:24:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE2F5F80579;
	Mon,  5 Feb 2024 19:24:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E89D9F801EB; Mon,  5 Feb 2024 19:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9361CF8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 19:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9361CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=juE4zurr
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso736214f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Feb 2024 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707157478; x=1707762278;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/95Us55Ran9Sed3OiAJ4KGme+SBSpnuH92E4Nqcaos=;
        b=juE4zurrcoWSDknkTns8gWF0srETvUh3l53OMcLL0QPlGt/LRQ5CfycsQUaQRik26v
         X3v5T2g9Q6rpCfT38DXRJ5k/p2PjjznL5XgTQV745w3EK8kgsifJ2R6I/W/vklkUsGyS
         JE9GfLZ8csCWz5aYBT5aLQ1sS7AvS1k41MXy5tT7cgI1vQIoaj3SanNWH/PiBrdjGjcx
         AIdUg+gHlaChGVJ9laciWK+6Zr6bc608Dug3BR/ohQEYAh+nrrHE+F3V8L5b73oISw2X
         PZDYCdM9eRexDgLWdqWcJAKT+a+1cIpz1+JsV5Mo1YHFg2+/mBeTpUv9mfy8zV8YN97U
         RyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157478; x=1707762278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/95Us55Ran9Sed3OiAJ4KGme+SBSpnuH92E4Nqcaos=;
        b=svzp/qF/YokSpfp5HQAoOVU6Cl4Ac3CaYTa93DZBt0FNax0Sj5iaRy2+Z/prJJn4xa
         9iYJobi/VZEew4NpMCzqzBzAhkyGf8A3TxYczgWhEEhIATlZVBjYiwRLRcJJrkQoNJrA
         chiK6NYLaCLmBhEBaKprBCoc5pXXfwh4BLKZiHVFZCHwaPBC+wASCRO6pr+kTFhinU8p
         +brExlp/9o+32MXMe9BUGP+3GhYekIU9L6euNBTcpL2O+U1mCbvfultwYi+8lH9nJr6y
         Qlrl2fSTd/oaup2PEmapDDHAWjmsiKwDs2gyh725ag8swVurH/xerEivQzWcQG8ma9mI
         kKVQ==
X-Gm-Message-State: AOJu0YxViJv5SE0OZJB5mG7gc4M0k64H39RqkuO/xQxfMf0/0c8w++5o
	c6Wh9WvC7gUF1gGYSsDER25tg7v2pH656KGEqOM14qGiPiTWKugi
X-Google-Smtp-Source: 
 AGHT+IF77OGreAX5w90BtR2pqO0yqGGkxuQ6y+jep1MAvXY2YZk0hKLE0n4RXjfQHdDHd4k/aXQwdA==
X-Received: by 2002:a5d:6050:0:b0:33b:731:808c with SMTP id
 j16-20020a5d6050000000b0033b0731808cmr221522wrt.13.1707157478289;
        Mon, 05 Feb 2024 10:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWnOAieYCoiWnEigKI0X38acX35XBE44hL8vHMp2X+y/irjbVBWGhtA9P7/GIO85eXKVTpcnrBWjIip5ONXANhrRAhKxs4O0pw4bzlCa8XxPQdRQlsj7aEAZW8EP41rCqAny1rf7s0OTDmkn5nB0wnBf0jsB233ZaSzQn3/VCL/FojfDa+FR/ALAdIoSu3IeZXQqmbcKjyvhcHhGE5c+Z9X5XCnUySw/oFLxEoRJHv/y++PpUckdM10OsPg/AAR4ZA2NAw+zBw9QcHNZ+q+b798lZTtfRxbMvSwFSO1hK+S3Mg=
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a056000110900b0033b43aaac8fsm194797wrw.7.2024.02.05.10.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:24:37 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] soundwire: intel_auxdevice: remove redundant assignment
 to variable link_flags
Date: Mon,  5 Feb 2024 18:24:36 +0000
Message-Id: <20240205182436.1843447-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 36CDARI6O65HQB6MNHOQH6UU4HNUXFYB
X-Message-ID-Hash: 36CDARI6O65HQB6MNHOQH6UU4HNUXFYB
X-MailFrom: colin.i.king@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36CDARI6O65HQB6MNHOQH6UU4HNUXFYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The variable link_flags is being initialized with a value that is never
read, it is being re-assigned later on. The initialization is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/soundwire/intel_auxdevice.c:624:2: warning: Value stored
to 'link_flags' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/soundwire/intel_auxdevice.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 93698532deac..95125cc2fc59 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -621,8 +621,6 @@ static int __maybe_unused intel_resume(struct device *dev)
 		return 0;
 	}
 
-	link_flags = md_flags >> (bus->link_id * 8);
-
 	if (pm_runtime_suspended(dev)) {
 		dev_dbg(dev, "pm_runtime status was suspended, forcing active\n");
 
-- 
2.39.2

