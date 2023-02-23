Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A506A195D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 11:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5779D206;
	Fri, 24 Feb 2023 11:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5779D206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677232933;
	bh=BLFWdNGhpFf3Ri5Wo2KA54/rskQ97JOUIGZnEfrC4Ao=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RRdEYIIjMQ7pL+mAcHu5cWucIeZS0j3ZFV1VnOkFIRJMeNQY4vOgQeIsW8cPbThV6
	 uk3YQUaF7cn4skIXyJ2wMwjYp8p/6MhGTOc9D+Uuycf6lRcV9ExI69UF3POEkWA31X
	 GAhMllMARiZ0NUAj6Q2JqVpgAc0xGBrQIjkvqOtg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 314A5F8014C;
	Fri, 24 Feb 2023 11:00:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A5F8F80496; Thu, 23 Feb 2023 15:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91261F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 15:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91261F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=If+KJkWn
Received: by mail-ed1-x530.google.com with SMTP id eg37so38969438edb.12
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Feb 2023 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677162748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hI9AYfo2vkeh8LJLJ62ywUBp+xjNfPbHlFhXyS9ADk=;
        b=If+KJkWnVnSQ0e8UH/zKyfMnfWUKBrxoVM4ziAgfhk/mNOmXLOc1/UEzg/JFMqgBOL
         V10xZjxKXLIeprGB84JxlkCRFL/5ShOG0RvrJ0zhWNU/aXNhRfZumHAlwX9gQ0/BGdR7
         XjPiDcyb6DJ8eQxzfnTeKgR9ANhASfq2msQfjEa4a9+bLAXB4jXXeXvzOZsPKIm5IHdx
         j21kDf6JyzGvSGHRdHV9P93gWwx3b/wSD6YR/a45nEa7D25Rv1uiXThjkFjxtsL5fNPI
         /KTVKodQmULZRuqyEo2TLQ54+ntTc/Q91Qnu7iDd+CRU9hpOkcv1D6OV/Zh6RKN89tFk
         2MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677162748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hI9AYfo2vkeh8LJLJ62ywUBp+xjNfPbHlFhXyS9ADk=;
        b=Wn/pv6hliTDeaEul8bRxflDPI5uKUd3chNM85PYhPRFsSkaCtf7z2lRWc3uvODYOVN
         6ZvYIQOs3l4tIoJ8rZzLRr3C5uTLkGYcOj4EVpNtnEIgQ4EsSCjF2n83SdU9cirlT2H/
         mcb5VL1hriROInVMRt4BPw/PNODVZHiWmH7hENTMa2b87bTNp0Pa4o7yuUoCULcljF7y
         BYhck/rjJ8r06yHZ7n1gsILBqNQq0vEs91NsRzpT6Y3+DrhNcH8/9PjICBCGUYKrcfEJ
         w0I1TYKOEj0WgYk/xy6MjrOMkMGF16mSCf1a7yFZL7d88FEJKEMhfq2KSPErByhd+774
         medw==
X-Gm-Message-State: AO0yUKX/nQuEXF3eppiyoo56B2HGdy3QEgxECCkb6g4L1ES60BGP9TBE
	+2REe7VC7RuJ9P5VsF9kZtJ6xfun/AwJ5Vvq
X-Google-Smtp-Source: 
 AK7set8VR6mBMUFQbc8DS56GFmWhwsINpNhuXfNnC0hGJEn9VF27jsYJu58HVUwilxFVChJAlMpDvw==
X-Received: by 2002:a05:6402:34d5:b0:4ae:e4d2:174b with SMTP id
 w21-20020a05640234d500b004aee4d2174bmr12747120edc.2.1677162748494;
        Thu, 23 Feb 2023 06:32:28 -0800 (PST)
Received: from mineorpe-virtual-machine.localdomain ([37.252.81.68])
        by smtp.gmail.com with ESMTPSA id
 t29-20020a508d5d000000b004acb696a0f6sm3994603edt.91.2023.02.23.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 06:32:28 -0800 (PST)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org
Subject: [PATCH] Fix snprintf format warnings during 'alsa' kselftest
 compilation
Date: Thu, 23 Feb 2023 17:32:14 +0300
Message-Id: <20230223143214.16564-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PFKGH5ALC5ZJADLYOBJ6DFBS5PB3BZEF
X-Message-ID-Hash: PFKGH5ALC5ZJADLYOBJ6DFBS5PB3BZEF
X-Mailman-Approved-At: Fri, 24 Feb 2023 10:00:07 +0000
CC: Ivan Orlov <ivan.orlov0322@gmail.com>, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFKGH5ALC5ZJADLYOBJ6DFBS5PB3BZEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix 'alsa' kselftest compilation warnings by making snprintf
format correspond the actual parameters types.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 tools/testing/selftests/alsa/pcm-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index f293c7d81009..52b109a162c6 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -318,7 +318,7 @@ static void test_pcm_time1(struct pcm_data *data,
 		goto __close;
 	}
 	if (rchannels != channels) {
-		snprintf(msg, sizeof(msg), "channels unsupported %ld != %ld", channels, rchannels);
+		snprintf(msg, sizeof(msg), "channels unsupported %ld != %u", channels, rchannels);
 		skip = true;
 		goto __close;
 	}
@@ -329,7 +329,7 @@ static void test_pcm_time1(struct pcm_data *data,
 		goto __close;
 	}
 	if (rrate != rate) {
-		snprintf(msg, sizeof(msg), "rate unsupported %ld != %ld", rate, rrate);
+		snprintf(msg, sizeof(msg), "rate unsupported %ld != %u", rate, rrate);
 		skip = true;
 		goto __close;
 	}
@@ -393,24 +393,24 @@ static void test_pcm_time1(struct pcm_data *data,
 			frames = snd_pcm_writei(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "Write failed: expected %d, wrote %li", rate, frames);
+					 "Write failed: expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		} else {
 			frames = snd_pcm_readi(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		}
-- 
2.34.1

