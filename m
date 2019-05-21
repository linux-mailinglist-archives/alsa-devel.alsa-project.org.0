Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A433524CF6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 12:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8601671;
	Tue, 21 May 2019 12:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8601671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558435141;
	bh=1b/P5t1dUCRkhCIXBqyHBAqvD0+bXzvsm4MaSVu7OnA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ik/DzIQd2YcOGBAALmWFvgBUhQ2qfncyunp9BwI9xPM0OaINbwpVTp0ilW8ENgoRP
	 oG18LNWuQzegjMf9MBLsXkUtPcrly/ciMxRlfgR7QKoYrao/JJE68+wqNOkCtJgOY2
	 vRgrrEzi/ThjRtT4M4QihZzMhdtqt94vkSEO4zl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B127FF89728;
	Tue, 21 May 2019 12:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BED6F806E7; Tue, 21 May 2019 12:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_64, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E65F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 12:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E65F806E7
Received: by mail-ed1-f68.google.com with SMTP id p27so28699478eda.1
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 03:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=g5+rFA36lwuazIudpaXXvHQFCY1jZEBw2F/UUKE3ovM=;
 b=JQqX+V2edjlPxJM5P0ytqg90RAW84ObPHpEf5x+HUa5SMzFQYeiEDzCZ/6VQbr4C7X
 QimzWbgYRJ6gL1D4vp6EkctMy2hyiiMCVUe5pP4BgB9PE56NF/lPO9ipx4THXVtU2z5y
 nKxv5sv/Dg7HTyvZkzXnQJr1RDNCqmeHZN3qMaAC29DWY0lGsK8kWFe1b5n1M7EPL6Cv
 CioNJMefJ8oMNNRQLaagH9GzuS7iwLLODw95v8mqqovd6osZa6mnfipBppptkDkdSSDr
 b4frwVe3sBTZ6ETpjYHaGcWQ5oeBA4rF98cJDA0JOQ6a7zMo8NLV2P/Q7Uq67VSbGBbj
 0JNQ==
X-Gm-Message-State: APjAAAUWBluQQddcbjQPXhuuug4jyAjb7CDIXhLpSOJRNj15aFkY7Qtx
 6K49aiVJuKpGXC/47OxWEG9sgSOiPANXNbipZT66hm8b6ylGxxR3+bC8tH/meO2mmKI1bJlUkNQ
 nThoIfwEuu4tRIgk=
X-Google-Smtp-Source: APXvYqxl2DSayF5AxGHApfnVwCqMXNZzKr/pm83PpOr142/+wqSpO8m+LjGWdsy0o8mJwheCqi8M9g==
X-Received: by 2002:a50:a5fb:: with SMTP id b56mr81501952edc.262.1558434993795; 
 Tue, 21 May 2019 03:36:33 -0700 (PDT)
Received: from localhost ([194.105.145.90])
 by smtp.gmail.com with ESMTPSA id c49sm6303644eda.58.2019.05.21.03.36.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 03:36:33 -0700 (PDT)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 May 2019 13:36:14 +0300
Message-Id: <20190521103619.4707-2-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [alsa-devel] [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG
	Ramp Control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
correct definition makes device probing code more clear.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 2 +-
 sound/soc/codecs/sgtl5000.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
index a6a4748c97f9..5e49523ee0b6 100644
--- sound/soc/codecs/sgtl5000.c
+++ sound/soc/codecs/sgtl5000.c
@@ -1296,7 +1296,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 
 	/* enable small pop, introduce 400ms delay in turning off */
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_REF_CTRL,
-				SGTL5000_SMALL_POP, 1);
+				SGTL5000_SMALL_POP, SGTL5000_SMALL_POP);
 
 	/* disable short cut detector */
 	snd_soc_component_write(component, SGTL5000_CHIP_SHORT_CTRL, 0);
diff --git sound/soc/codecs/sgtl5000.h sound/soc/codecs/sgtl5000.h
index 18cae08bbd3a..a4bf4bca95bf 100644
--- sound/soc/codecs/sgtl5000.h
+++ sound/soc/codecs/sgtl5000.h
@@ -273,7 +273,7 @@
 #define SGTL5000_BIAS_CTRL_MASK			0x000e
 #define SGTL5000_BIAS_CTRL_SHIFT		1
 #define SGTL5000_BIAS_CTRL_WIDTH		3
-#define SGTL5000_SMALL_POP			1
+#define SGTL5000_SMALL_POP			0x0001
 
 /*
  * SGTL5000_CHIP_MIC_CTRL
-- 
2.20.1


-- 

Ciklum refers to one or more of Ciklum Group Holdings LTD. and its 
subsidiaries and affiliates each of which is a legally separate entity. 
Ciklum LLC is a limited liability company registered in Ukraine under 
EDRPOU code 31902643, with its registered address at 12 Amosova St., 03680, 
Kyiv, Ukraine.



The contents of this e-mail (including any attachments) 
are confidential and may be legally privileged. If you are not the intended 
recipient of this e-mail, please notify the sender immediately and then 
delete it (including any attachments) from all your systems. Any 
unauthorised use, reproduction, distribution, disclosure and/or 
modification of this message and/or its contents are strictly prohibited. 
We cannot guarantee that this e-mail is secure or error-free. Ciklum cannot 
be held liable for any loss or damage caused by software viruses or 
resulting from any use of or reliance on this email by anyone, other than 
the intended addressee to the extent agreed in a contract for the matter to 
which this email relates (if any). Messages sent to and from Ciklum may be 
monitored; by replying to this e-mail you give your consent to such 
monitoring.  Notice: we do not accept service by e-mail of court 
proceedings, other processes or formal notices of any kind without specific 
prior written agreement. This email does not constitute a binding offer or 
acceptance for Ciklum unless so set forth in a separate document.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
