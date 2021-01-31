Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC9309945
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jan 2021 01:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE5D1763;
	Sun, 31 Jan 2021 01:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE5D1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612052149;
	bh=2Zk5RvqspPd7hFW2Hc9ksc8we6KixQ9Rn/RGzCRjHNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mr8jIidZ+IGKsQC09L+HHhTs3c6gm1g989EN0HTvN05NpcW7htyY5goW0qxFMl3bD
	 9+ZtSg5++ocT1jeKR3JHx8W92AUmx0EsKgBThwe1uEB4u15UAyj9z32GxfDGC3alkH
	 m0npiDTxTP/MByjWyI9e3ley3uhjUHAA0+pd6kgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02278F804C2;
	Sun, 31 Jan 2021 01:13:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19878F8015B; Sun, 31 Jan 2021 01:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B3FF80158
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 01:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B3FF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VG60oQQV"
Received: by mail-lj1-x230.google.com with SMTP id f2so15001077ljp.11
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNULYoCFMxkvIYfnPGwrWYt25AhtkOvu532DvQKjYIE=;
 b=VG60oQQVAtnPDp8YE7K73mpWCbyNFQFLV6fLCs9quGtY+kJB+yHj/ArUzYJT7T2ouB
 JDvO3SjJbgmBZ8gnubAECrtIvksq34OB69sgM3Ha/NL89/BKba0LPfApnzt7IOBUXN1G
 2UYYP4zYoX7CaRziUWviEwen3/sy45iCTDE2qlF6ZM+g/hZgdEhRYOMBZr9U7uCtCQih
 3K4R406nh9cFiT/9/1nIIUdy8SSqF8OHRmBuwdQ7A+ehgL39coJ1DLgwPKKgAIdPeeGy
 +g+RPt0s9Ay4dmdAKkLyWpkDVC1lJ4z8fAFIB1aRDSgoTbGDc7fgEv3IWzmZOBqS24qf
 zaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNULYoCFMxkvIYfnPGwrWYt25AhtkOvu532DvQKjYIE=;
 b=h3WsmmlHGLT22G7zW3iMu8WURCdnmRIOU6qXSv7d1Sc5zjEFxBQEq/uOW7j1sX12nm
 JK7tE3v6O9LX8v+J/ckmOu1wpKrJwharVxujyy5N19XWSbW2iZVybuCQjMDqAnvtWNxa
 uo5vsi6dpQ85GkN1clUXsqKql55D1gJYS4e2h0FuzJcoN4JdW90rB7PBJu6rPvTankZ7
 LX5XphwY49WLBVPiH0oGJympCp+09S4xBf9mqNRhPSmsNpLetrE5IlNQKQw5btbR+2gH
 FbuaKGlk6c2XBuF68hfuqXSJcxUgs7zaV6GaImNOTMBzngnkFteOXtpCfZYwMdBofnu/
 RB9A==
X-Gm-Message-State: AOAM531LvKxaLenbhh2/uyYjv1HOpUEA5ze67HQnZzWdC4X/PWyEBSDM
 zntPapOzw0oqdr7w8VB5bxI=
X-Google-Smtp-Source: ABdhPJwIwCCAqBgXPZ9A9uAUMWI5/ecyMgpwRPG/qFkbheuq32Wzct8Jlte+Q4yIT7dMt69pOf3tJw==
X-Received: by 2002:a2e:99d3:: with SMTP id l19mr6144824ljj.132.1612051969926; 
 Sat, 30 Jan 2021 16:12:49 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id t2sm2503716lfl.141.2021.01.30.16.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 16:12:49 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ALSA: ac97: Constify static struct attribute_group
Date: Sun, 31 Jan 2021 01:12:40 +0100
Message-Id: <20210131001241.2278-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131001241.2278-1-rikard.falkeborn@gmail.com>
References: <20210131001241.2278-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The only usage of ac97_adapter_attr_group is to put its address in an
array of pointers to const attribute_group structs. Make it const to
allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/ac97/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 7985dd8198b6..d9077e91382b 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -273,7 +273,7 @@ static struct attribute *ac97_controller_device_attrs[] = {
 	NULL
 };
 
-static struct attribute_group ac97_adapter_attr_group = {
+static const struct attribute_group ac97_adapter_attr_group = {
 	.name	= "ac97_operations",
 	.attrs	= ac97_controller_device_attrs,
 };
-- 
2.30.0

