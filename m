Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB024D01
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 12:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7011D166A;
	Tue, 21 May 2019 12:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7011D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558435258;
	bh=QIXoo3JuxZSdgOyDDAcWhaeEzNYB8OpWzYGH9fl5FQg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUurpwQQlxmuJIqF7g1IQivI4aSKqI0sWhv4Gd/gyPN8Nz/xZ5nGj0bmQ4DflF41D
	 7N8KSeCtwptKahMwDxHr3AMuogx/s08wi39xhqHxVZ8svUUyQ0L3YhlSmea7j+ZdwJ
	 8xL/chshkhzEnTpbpTX0q8pIZ5YfKgoU7BxfaXBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA9CF89737;
	Tue, 21 May 2019 12:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 779C7F8972A; Tue, 21 May 2019 12:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_64,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AD56F89715
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 12:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD56F89715
Received: by mail-ed1-f67.google.com with SMTP id w11so28617079edl.5
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 03:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=8RfPufMa3HqwhdEyx05OxfiupMkKyekwoF0H9MJSyDg=;
 b=RwUwA7ntDFMODq5VXYvIgNQBnl8zOdgHsyjpt7229XsTw8oJGHyjEtNVqXoJYgwpr2
 AHO9U3Hsk0su0ADXC9qUMIEcYzeJBgyCCmXiUTnWYySL/JCY37mjn+ldm/OkOcV0kEC4
 uNlvVpGAeRh3jKu9IIJBpvLGapy9k8qpSIKHN+rThR/+SJNIU4BhFWJYYEiTBbHLBkvt
 V56kNY71jDYpGX39tPreAInnbwn8WLnkbtCpSCVRqUR4oAc/8OvaI//ZU8lTcAparCie
 qFWmw1dVRFDXgqjRRSKOU/dtiiINpQidFEIi+xCWrW6Sa8QWqhm29vbsVXyOxqAwjOeT
 2aiA==
X-Gm-Message-State: APjAAAW5dqxh3ZnHTYxpyaY/17OHtGtNOpYNAlu52Lc9A/q77PJ8fSxA
 XP7c1KJwgvMJBg/mrzX5PoMInLNvqoIb3bCeBWZnwRUT1O/B/ucJAvbkF4rq7kQVu3Kze6Xu7Mi
 RLfGofgkBIUiMgx8=
X-Google-Smtp-Source: APXvYqzvSL/hShohKCzVE7yqXSTyYlRnEwlsVmuEB6NTByIayC3kwlFUvM+IPASXPZk8yT2yog7+ag==
X-Received: by 2002:a17:906:eca3:: with SMTP id
 qh3mr31146094ejb.139.1558434999212; 
 Tue, 21 May 2019 03:36:39 -0700 (PDT)
Received: from localhost ([194.105.145.90])
 by smtp.gmail.com with ESMTPSA id g11sm6207876eda.42.2019.05.21.03.36.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 03:36:38 -0700 (PDT)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 May 2019 13:36:17 +0300
Message-Id: <20190521103619.4707-5-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [alsa-devel] [PATCH v1 4/6] ASoC: sgtl5000: Fix charge pump source
	assignment
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

If VDDA != VDDIO and any of them is greater than 3.1V, charge pump
source can be assigned automatically.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
index e813a37910af..ee1e4bf61322 100644
--- sound/soc/codecs/sgtl5000.c
+++ sound/soc/codecs/sgtl5000.c
@@ -1174,12 +1174,16 @@ static int sgtl5000_set_power_regs(struct snd_soc_component *component)
 					SGTL5000_INT_OSC_EN);
 		/* Enable VDDC charge pump */
 		ana_pwr |= SGTL5000_VDDC_CHRGPMP_POWERUP;
-	} else if (vddio >= 3100 && vdda >= 3100) {
+	} else {
 		ana_pwr &= ~SGTL5000_VDDC_CHRGPMP_POWERUP;
-		/* VDDC use VDDIO rail */
-		lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
-		lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
-			    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		/* if vddio == vdda the source of charge pump should be
+		 * assigned manually to VDDIO
+		 */
+		if (vddio == vdda) {
+			lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
+			lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
+				    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		}
 	}
 
 	snd_soc_component_write(component, SGTL5000_CHIP_LINREG_CTRL, lreg_ctrl);
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
