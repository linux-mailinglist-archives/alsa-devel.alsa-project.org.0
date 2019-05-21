Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0CE24CFE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 12:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6621672;
	Tue, 21 May 2019 12:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6621672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558435210;
	bh=DZC9hSRob0P0wlHlIo//j4wIJBctiQ9fuG2CowQWXUI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/bSqR0033mrQQ9Tb66bwTmOnE8h+6nbbpDgkcRdXX6io8t/Xfrtlhc3lCUNQc5Gs
	 mgL+AvzJ0KapUknfUpKtRdF3T+HWlezJw5UkM69EA/FUBE4exyEX1Dv6Cvmm+nzY9W
	 V6NVExI0XrYUUxmmDnXFW5oA2dgdAjL5iwMZlUzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0DE3F89734;
	Tue, 21 May 2019 12:36:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A83F89725; Tue, 21 May 2019 12:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_64,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E040AF89709
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 12:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E040AF89709
Received: by mail-ed1-f65.google.com with SMTP id m4so28632914edd.8
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 03:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=iCa3sIkXRS0MUvhZrMU0I1kSnN7S8DExfC/yTx1vxTA=;
 b=jt+nxCO7qy6GGh9Ib9nAMxuqGn2OoYVnzgXFUYftSYntmVpDb9MzesTlmNsu50dBmJ
 nOQY/IveCcxUsJHy4x/y41qjHUAKx7M4exGlAvdUE3b6YSqLP8YRXy9qlWRnAk6pAJdJ
 RY1foHFC/Kg1ur0TGaKMzQZWdUyQjdkw8ivW67F83hX/wfgPuqZX40sNj035VYZgUDSD
 KSuvuwj3zSp1ls7s8ENs9cRcqp+qw4msLvuYJLF0j+27JkVYluTASZduuJTqia2t0VSI
 yXo3VKorxf2gkUwn6ZuAJOXOQkjQLBnYusHxyNPRZYOfOHmf0lfCI3VqMMa99270TZ5x
 FxdA==
X-Gm-Message-State: APjAAAUBmqGXopFt4nKQuEJ8RVjXKX/QAjCnuGvSGmjJ32Yckiq3SXY2
 X4PxtHrITwMaFs0ZuqVuKFQMkPbJUCZ0Mso6kZDL2eyWOqVLVb5b+ZCo2kvz/XHNR7Nc5NLuHNa
 y4R5U5frjfL2eBOg=
X-Google-Smtp-Source: APXvYqxeWQK82QeOi5z+lBMdAAErKeezVrdKlYCVRXGcKGYFNE9+MsqmQD8PS6/9oZTtpGtxLKg45A==
X-Received: by 2002:a17:906:22d8:: with SMTP id
 q24mr62970353eja.261.1558434997802; 
 Tue, 21 May 2019 03:36:37 -0700 (PDT)
Received: from localhost ([194.105.145.90])
 by smtp.gmail.com with ESMTPSA id e43sm6202423edb.38.2019.05.21.03.36.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 03:36:37 -0700 (PDT)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 May 2019 13:36:16 +0300
Message-Id: <20190521103619.4707-4-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [alsa-devel] [PATCH v1 3/6] ASoC: sgtl5000: Fix of unmute outputs
	on probe
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

To enable "zero cross detect" for ADC/HP, change
HP_ZCD_EN/ADC_ZCD_EN bits only instead of writing the whole
CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
index bb58c997c691..e813a37910af 100644
--- sound/soc/codecs/sgtl5000.c
+++ sound/soc/codecs/sgtl5000.c
@@ -1289,6 +1289,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	int ret;
 	u16 reg;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
+	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
 
 	/* power up sgtl5000 */
 	ret = sgtl5000_set_power_regs(component);
@@ -1316,9 +1317,8 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	       0x1f);
 	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH, reg);
 
-	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
-			SGTL5000_HP_ZCD_EN |
-			SGTL5000_ADC_ZCD_EN);
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
+		zcd_mask, zcd_mask);
 
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_MIC_CTRL,
 			SGTL5000_BIAS_R_MASK,
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
