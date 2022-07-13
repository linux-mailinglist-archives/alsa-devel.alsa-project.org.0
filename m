Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 354525752F5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CBE18A9;
	Thu, 14 Jul 2022 18:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CBE18A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816741;
	bh=0lMnN8TYh2PQWfbGnXTKoT+meILKEXksSUZFL3FLEF4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CyEJVHsat87swdh0z87xSuAyLPHwhWXRLmL1uo/5iBxpQDnYMv8xne9vv62bE8uam
	 7tTiWmkPiA1hg3UgvGAy1l47c8QhPor3Latyu19NmWt7+nrmaag7ngMMxhcxJ6FKzQ
	 Aww7hVOG8QNoqlxP/YaXJQEfmhoQFBmtboMv37xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E2AF805B0;
	Thu, 14 Jul 2022 18:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 213B2F80249; Wed, 13 Jul 2022 17:20:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D21F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 17:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D21F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UbfTqu9U"
Received: by mail-wm1-x32b.google.com with SMTP id l42so6645676wms.5
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6cQzIVXOIBGsoXiuif7G7saQrxwRpZyrgHwFA3owXw=;
 b=UbfTqu9UK6HYMNNZQE81zT8rSE22hs7tx/XmkR6naxIYHSRGj6AEx6AltM1hsmzR4F
 4bXiETy55+RlwNvk1IjEOCCbrBKWjYwh8FJes5Nj5Gtm0KJ0htpOIJcD7Hqwk2zDs7Iq
 TdthzJ+MRMfxWgMott1HwM2DG2cj/Ltjf6j/wAqI5snSDTfKrvkC9XrwI0qTjTRcvv+c
 5LWJTTUyjFR99MZfzZv0TGCrJP0PiIujZlTZZ4o1r1cfo8P2cE8WuqC3pSDEs4JlOAeL
 YWJ0AJHbxRcc0zRWjx++Lf/SLw0q11YGW/x+ml0SCKTD9TzAh2NljacWhysNuOeW9n9o
 irzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6cQzIVXOIBGsoXiuif7G7saQrxwRpZyrgHwFA3owXw=;
 b=tcUKdguuWbMTU8OS8ozOPin0qTre29PQ004xCpPWmDY6hBFm599a7Q7T7K642Zal6Y
 1Tce6RltPNTc05ck+GZkeVmKI4qweFcKfDk8FeSRu4i4sRwekXlOC2qFwDabtL3xnfqA
 JI0FnBTCCJ604R8wpnbdHcZmPLBCpRkGxQXZdKMqfV+UUm8o5uTcNTbQoIoDDtkcOTU5
 OXQ+fgBy17Yss4H1rwkYEW64Yqf9n1x2GDiA3UM5KC313vJ6ZaljJ937eAxjclYpglO9
 N+UqraHKHtPQr6ZCYNAY1VFsEC0jcaqwXiWxJdmF9w2tSC0RV+CYX67Jk1bA2WY5KTmj
 es4A==
X-Gm-Message-State: AJIora/GyIbYny5EcnRyS6IxTguaurQqpwy8tpT3dvAQ8mHvn5mdngjL
 BgsIMeMCQRFeXIk30BS2NykH8TI9vrM=
X-Google-Smtp-Source: AGRyM1vdjvXKJQAC8aIpaLRCPxjr+/igY107IqJbiR9fjfmShIfWeDr52ubwhRVrPyxEKfoziD1OXw==
X-Received: by 2002:a05:600c:1e20:b0:3a2:e540:17ad with SMTP id
 ay32-20020a05600c1e2000b003a2e54017admr4151536wmb.205.1657725598094; 
 Wed, 13 Jul 2022 08:19:58 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003a2f88b2559sm2329150wmq.44.2022.07.13.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 08:19:57 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Use atomic_try_cmpxchg in ep_state_update
Date: Wed, 13 Jul 2022 17:19:46 +0200
Message-Id: <20220713151946.4743-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: Takashi Iwai <tiwai@suse.de>, Uros Bizjak <ubizjak@gmail.com>
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

Use atomic_try_cmpxchg instead of atomic_cmpxchg (*ptr, old, new) == old in
ep_state_update. x86 CMPXCHG instruction returns success in ZF flag,
so this change saves a compare after cmpxchg (and related move instruction
in front of cmpxchg).

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index f9c921683948..0d7b73bf7945 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -133,7 +133,7 @@ static inline bool ep_state_running(struct snd_usb_endpoint *ep)
 
 static inline bool ep_state_update(struct snd_usb_endpoint *ep, int old, int new)
 {
-	return atomic_cmpxchg(&ep->state, old, new) == old;
+	return atomic_try_cmpxchg(&ep->state, &old, new);
 }
 
 /**
-- 
2.35.3

