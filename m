Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D345576FFF2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 14:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55B36C0;
	Fri,  4 Aug 2023 14:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55B36C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691150794;
	bh=/3l+NjXIbbuC0DxQ/dtsQSzNW40dtr7StE61YsTd3g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4POoApy/npWw0GkTMbx700ThQvGY6dwqIxB2aCYvEzsrG288E3Jesn3nxnsv3R7P
	 OrT95jNnsI/MQYbzSuBP0MlEZTYZ2KSMVH24SQHqkKCFw8E+kVp/nMBaphmNP3WnWY
	 PKPsrLuynB53XTxSR0z0bxP7yy8MFdHkjKLFyVB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5B4BF805AE; Fri,  4 Aug 2023 14:04:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2665CF805A8;
	Fri,  4 Aug 2023 14:04:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7657F8025A; Fri,  4 Aug 2023 13:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A930F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A930F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=sb2OsCJg
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c4e426714so54858166b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691147295; x=1691752095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIJ0wZyKm1oHflFxZiewsCGjiwbu4yH0OOsxMNtlRQA=;
        b=sb2OsCJg8rCGJP8ARVMIpqDdFxuEh/lmMRim5Tgv0J7OpP61Zf/j6HcfRydESLJ8kp
         O5KcX23un2JKdBMXiJVRyPBq2l7pFFBEii1FNpA5/6PuUSIJLYOunL+8cxF1H+rcx1Sq
         WhryHozOCkNhQKCMpNlz93T28ixJu02X94LB8/VF/cAv8zZShlRk9/vT4w5y2F38xktU
         eeEGRMzoL4yDny6/fIzJQKewUy7PrBDOdyjkjujfrb0Yr/recHXCPQa2TktcE28y5iW3
         MJP3FfG/XM6tYdlm/oLtv6DMEEIagQSh2zgM/SNOQwZIG6rVPWrirP9w0VSu5561y9Y5
         wUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691147295; x=1691752095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIJ0wZyKm1oHflFxZiewsCGjiwbu4yH0OOsxMNtlRQA=;
        b=Iy2rbaAK4+3ImQAwwPM8vAhge6zOavXvvWo059h+L5tGFXFqQzPIvbIVsRdHxMIe15
         0XEmBSs6MJXEvU51maV5a94YrRofMD2MXjuZ/d2VyZMtEvNL0vqlzM2GYMGLFl/GmAkF
         Qw5/bp5PU+oc047D67vcykZKGb3S8FmFv3agXbpt13aovBlOqeK0370qEGbTIWqoWdCq
         I4FMQHOj9UuZisRKpz+9D3wkZsqv1HPENKIJlKE1jEGoDXkwkP/SfRdinfE833YLJtIh
         HcYJRUiUpYpVK3SCnc5kLeu7PlvLskyu9sWvVEum9M/Z6TlupVk701s3RRDTKLz8mqUc
         CfCw==
X-Gm-Message-State: AOJu0Yw+GPlb939KsChfFyxU6kkXmuieYhFvEmj9bx1BALczMi8Y1lyn
	elIUoQ3aXipQBLfFqtxscKI=
X-Google-Smtp-Source: 
 APBJJlFn3bAfpeUS7bFYzuP6M36OObpUhU8sV+Ubp+nPBglgSjjoO/M81TcUo5jlFHzdz8R+3q9F4g==
X-Received: by 2002:a17:906:51d6:b0:99c:5711:3187 with SMTP id
 v22-20020a17090651d600b0099c57113187mr4463468ejk.6.1691147295122;
        Fri, 04 Aug 2023 04:08:15 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 bn10-20020a170906c0ca00b00992b0745548sm1149478ejb.152.2023.08.04.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 04:08:14 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: pcmtest: Remove redundant definitions
Date: Fri,  4 Aug 2023 15:07:40 +0400
Message-Id: <20230804110740.9867-2-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804110740.9867-1-ivan.orlov0322@gmail.com>
References: <20230804110740.9867-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZOOF7GS456RP7ELLAUSMFHZOHEST47IL
X-Message-ID-Hash: ZOOF7GS456RP7ELLAUSMFHZOHEST47IL
X-Mailman-Approved-At: Fri, 04 Aug 2023 12:04:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOOF7GS456RP7ELLAUSMFHZOHEST47IL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove redundant definitions of DEVNAME and CARD_NAME, as they're not
useful. The former is not used anywhere, and the latter is used only
in module parameters descriptions.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Split changes in the patch into two different patches

 sound/drivers/pcmtest.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index dc7c9c758537..7f170429eb8f 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -41,8 +41,6 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 
-#define DEVNAME "pcmtestd"
-#define CARD_NAME "pcm-test-card"
 #define TIMER_PER_SEC 5
 #define TIMER_INTERVAL (HZ / TIMER_PER_SEC)
 #define DELAY_JIFFIES HZ
@@ -74,11 +72,11 @@ static u8 ioctl_reset_test;
 static struct dentry *driver_debug_dir;
 
 module_param(index, int, 0444);
-MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard");
+MODULE_PARM_DESC(index, "Index value for pcmtest soundcard");
 module_param(id, charp, 0444);
-MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard");
+MODULE_PARM_DESC(id, "ID string for pcmtest soundcard");
 module_param(enable, bool, 0444);
-MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
+MODULE_PARM_DESC(enable, "Enable pcmtest soundcard.");
 module_param(fill_mode, short, 0600);
 MODULE_PARM_DESC(fill_mode, "Buffer fill mode: rand(0) or pattern(1)");
 module_param(inject_delay, int, 0600);
-- 
2.34.1

