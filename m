Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745024D02
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 12:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23691668;
	Tue, 21 May 2019 12:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23691668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558435297;
	bh=kfkzZVKRcYGbsZobuOmDfvaZV/lzsYkl/rnA/0QA2A0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOWsECvC9t4ez1OUZaS9GWxLrparp7JMgs1VloWoSrBFVe4PKaXqz6dds87WXhF9d
	 G0+oWrjiJSjZagjQ5JHGPVGkVx9ewpAlRr9Tyr70GtrTLq3ShM1SRS2VGEyvTS3HFW
	 qc+U4cEqozDPky9DDPFu96yhTygwAL3K9iC1fCeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CF12F8973C;
	Tue, 21 May 2019 12:36:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9CCBF8972D; Tue, 21 May 2019 12:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_64,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB95F89709
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 12:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB95F89709
Received: by mail-ed1-f52.google.com with SMTP id w37so28654684edw.4
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 03:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=WylUw4wo5vM+M15++6VSkI9SZq4ULyzzIp7SQ2Wc8DM=;
 b=tlDcOpuTb4zUGElMzJEz8U4U5qWsbB47+iHfxglp/4EoazJwcYs7bD2OP31Fg93uvq
 Gmygnv4aNeUJ7c9OjbQm+8w8k5s0JGK2DXX9h66Dm5sN+MxNeEkK1EPmRpTh7DTkcQqk
 9C2Q44mRE8gOL7AXx4MDx3z36nk7OD4aRc3zrwWoLlpDGUAH7p/Ne9aoRRVftAw1MDk9
 HGSiNnU/kESuDEGtiSmxej8g9n3dqadbMHUn9mYuADUAtmIe5A+pEQ/RRRDkKJcEIKoA
 QXg+3omNhXFziSOHNueSksRl0s/qleT9G2cTnsK2yG2FoP/3hJ6P8SLKwIda1LOTkye7
 pr7w==
X-Gm-Message-State: APjAAAV1QKKulYdy/scSj68vSv0Sm5e1OrSWoU0OoHXe52oa0UGTzPZW
 annwKCUVx7awSW4VIwQ5buw8taiT4Ieh27n2L93VzlNmWovChS5Mo6CMMPXTzUJpot0qSSCP7QK
 2ZglWlG5xXeEuJM9x/4VC
X-Google-Smtp-Source: APXvYqxSOa2oON0KK+1w6bVqEDQDP5+bCZW1+KQrM92fr0fjjSQ6TMlD8gJY8HRJghhdLjC22eCW/w==
X-Received: by 2002:aa7:d381:: with SMTP id x1mr649159edq.251.1558435000706;
 Tue, 21 May 2019 03:36:40 -0700 (PDT)
Received: from localhost ([194.105.145.90])
 by smtp.gmail.com with ESMTPSA id z10sm6186868edl.35.2019.05.21.03.36.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 03:36:40 -0700 (PDT)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 May 2019 13:36:18 +0300
Message-Id: <20190521103619.4707-6-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [alsa-devel] [PATCH v1 5/6] ASoC: Define a set of DAPM pre/post-up
	events
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

Prepare to use SND_SOC_DAPM_PRE_POST_PMU definition to
reduce coming code size and make it more readable.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 include/sound/soc-dapm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git include/sound/soc-dapm.h include/sound/soc-dapm.h
index c00a0b8ade08..6c6694160130 100644
--- include/sound/soc-dapm.h
+++ include/sound/soc-dapm.h
@@ -353,6 +353,8 @@ struct device;
 #define SND_SOC_DAPM_WILL_PMD   0x80    /* called at start of sequence */
 #define SND_SOC_DAPM_PRE_POST_PMD \
 				(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
+#define SND_SOC_DAPM_PRE_POST_PMU \
+				(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
 
 /* convenience event type detection */
 #define SND_SOC_DAPM_EVENT_ON(e)	\
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
