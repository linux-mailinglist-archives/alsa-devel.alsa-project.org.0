Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195957F0579
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Nov 2023 11:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E69E845;
	Sun, 19 Nov 2023 11:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E69E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700390789;
	bh=LuAH999HjXH3km0oMdV2rCG9vQpGzLaP6SyUnjL6y6A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LfnX3XcdQ1UMUE4vmSIus0O9ubuNCMtgNfB6f8N7GYHfaUY3Ypk0PNP9xhEtF7Vfp
	 mHtm+Th2wCyM7J2+GMCseQbYDA3pBjAYScfECfhcpX2iTjYutWhueGAWcPwiihkLEA
	 kNLfjDg+114JvznXUIcCWW3AMsbe5Amg2+OOI+Mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF228F80549; Sun, 19 Nov 2023 11:45:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 622C8F80246;
	Sun, 19 Nov 2023 11:45:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AF9FF80254; Sun, 19 Nov 2023 11:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4F0AF80093
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 11:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F0AF80093
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso1329906f8f.2
        for <alsa-devel@alsa-project.org>;
 Sun, 19 Nov 2023 02:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700390724; x=1700995524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy7JYUOTRdSJldSNKwdRHiPwhZnAINoOplh1pqVKi5s=;
        b=UD1uJ5iX0IkdV9iqj84AqfTUlmTV2X7OikkxUDf6z7uw9xj1Yw8q2k6szmbVeWnt0K
         /4Th7Zs+8v9g4WXdHz7JhbX0XDLoL1+qTnHBYKsz9npgh4xGlnXXVpoPjjBL//EUvGt/
         0hRjGFiBAtAEXrX1MUB7uV1z6x7oJen3KWC15IK8znn2UwP4fSEuCDs8oW7YZRAjuz3z
         qG19zYVN1q/ODzk0qaW7a4yUveIwr4qKCObEeTPprg0scc1aa1SDxBVwHWdW/p/BK26w
         B3RJ8SuYit79QzmA1MHXW1t7avjhJt0m9kXKAHn6ioKNmkFJrQ5ISJ69SgwH8qq5Xgw7
         5POA==
X-Gm-Message-State: AOJu0YzkspdMxeePbqy36cj61artf3uxGSCf+tszCteE/vmsu2zuVJnE
	r4/h6C+1cBmVFE+NYtm1fA0=
X-Google-Smtp-Source: 
 AGHT+IEC7OHQQ63+OIiNP/Y2msXT2JNv/AQECBNiGuXXWvbCMXs8Ertliu/zFXa6ljnqxG8GsPh0NQ==
X-Received: by 2002:adf:d1c6:0:b0:332:c6be:f327 with SMTP id
 b6-20020adfd1c6000000b00332c6bef327mr127636wrd.61.1700390723581;
        Sun, 19 Nov 2023 02:45:23 -0800 (PST)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id
 az30-20020adfe19e000000b00332c36b6563sm1502211wrb.101.2023.11.19.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:45:22 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH] ASoC: fsl_mqs: Remove duplicate linux/of.h header
Date: Sun, 19 Nov 2023 10:45:14 +0000
Message-ID: <20231119104514.25536-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GN4WMJIQMEDBET3KAIDFITADHT3JFO3Y
X-Message-ID-Hash: GN4WMJIQMEDBET3KAIDFITADHT3JFO3Y
X-MailFrom: tanurelinux@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GN4WMJIQMEDBET3KAIDFITADHT3JFO3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove linux/of.h as is included more than once.
Reported by make includecheck.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 sound/soc/fsl/fsl_mqs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index f2d74ec05cdf..86704ba5f6f0 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -10,7 +10,6 @@
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
-#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/pm.h>
-- 
2.42.1

