Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B47EF343
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 14:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10AA82A;
	Fri, 17 Nov 2023 14:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10AA82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700226190;
	bh=ilzCvDRWKBaUshyMxCaBCS7lC9T9px0LA5QKy+dQu6o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HD0BJ/IUH0eLKkUBUk7BE1iuvSXc/em660XyJjqWGS34CdxqD10jM1PQlwGd9grfh
	 oJPkd0K0h29jbFYLbjrUCTpQUvAtsBfYLikCWPLn9JqgbDVQJvafTQf/X6h0zAOMsd
	 yZ1Jqrq+URReSxLTH7Jz/boeZer6p4S5hZzSajK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A51F0F802E8; Fri, 17 Nov 2023 14:01:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF760F80166;
	Fri, 17 Nov 2023 14:01:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9CCFF801D5; Thu, 16 Nov 2023 23:01:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE922F80166;
	Thu, 16 Nov 2023 23:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE922F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PZkFoebx
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507cee17b00so1743384e87.2;
        Thu, 16 Nov 2023 14:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700172087; x=1700776887;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9DU8iPPpztG+f77WtVDbQ5xkLxfUk+3E8kOK2eG+Q=;
        b=PZkFoebxlvEEipxN3CrGgWIvqle3eDpaWXoR1/FFR0jsiI4bE7LrFfSP0pCpwfzB8F
         KvmP8Bs+u752JTKgEZMC0PV/2C+Pm19YG0QePIJwy7LEIAElPJMS1Z9cSfy/j1hHKl7V
         tgd/3rmUkUN5vzFwXPP4Pxa1UQzXbiQ+ADuz6yBxKdslzYAHeBOFDXmaoKRuz2RkjRFq
         P/adc/89e96eZA+c7F+L5iC5qa4UXcaB0E7vSPjGSisdOekToxZnpSEBLv1BmyFH/GMm
         c1br2R8x2is/Y0qmLq0C6G2czvSbQzY0DjEwejTKGZm++ywPmY/XZH4o7Q0SLAiCk8fH
         cbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700172087; x=1700776887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y9DU8iPPpztG+f77WtVDbQ5xkLxfUk+3E8kOK2eG+Q=;
        b=AoXSiDLq4kJ1k93AsiAbjCXb/hzeFujlnmW+UxWBKhQUFMSfn053HOBfJTVq1674/9
         +VdEqorA4QcXAhGpQbrCwUN44zeu+573bCxAI3QUXYRObKOF48lK9qtJHuZ8BXop3doD
         F6RtEeE6wj0TY7Hcnt2cfZ6HvJZN1SWwKBLvafoTmcD8NTuxRUf2vZfNUBoklCU1aZAw
         ODc6F+gqyqdVD1Up3PUoF7uEJMqU7lh8VKXRsBkvFQAJXXdZcQXdiaZ5F8ygaBVjpnta
         N+37XOs/Lrfgisb8IjiQ0HqDkScJ9dIWLNlULAoFMEUyR+tUoUme+HmzA6QuJHLvol/1
         Xg+g==
X-Gm-Message-State: AOJu0Yxwn2rm6pc3ol7vO07EvzSzUaCY8cLExhVwo//v5KvhRlG654bU
	71pKjt+zv8++axr4go6iRlU=
X-Google-Smtp-Source: 
 AGHT+IGcXXb7T8Tz0qn0ou4E7i88L65qNLWRa2dAPZ2Mgj7FwbqtHwDnrjIBT2bigz6SfJllA9JVBA==
X-Received: by 2002:a05:6512:234c:b0:500:7685:83d with SMTP id
 p12-20020a056512234c00b005007685083dmr17360520lfu.48.1700172087214;
        Thu, 16 Nov 2023 14:01:27 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl.
 [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id
 v15-20020a056512348f00b005079a61a182sm29431lfr.143.2023.11.16.14.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:01:26 -0800 (PST)
From: Kamil Duljas <kamil.duljas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
Date: Thu, 16 Nov 2023 23:01:03 +0100
Message-ID: <20231116220102.2097-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G2XMY5UXFYGNCVLPBUEEMUPH3UCO2BZW
X-Message-ID-Hash: G2XMY5UXFYGNCVLPBUEEMUPH3UCO2BZW
X-Mailman-Approved-At: Fri, 17 Nov 2023 13:01:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2XMY5UXFYGNCVLPBUEEMUPH3UCO2BZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

trace_filter_parse() allocs memory for *out and when
-ENOMEM is returned, caller function, dfsentry_trace_filter_write()
trying to freed this memory.

After this patch, the memory is freed in trace_filter_parse()
before -EINVAL returned. In caller function removed kfree(elms)
from error label

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/sof/ipc3-dtrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 0dca139322f3..93b189c2d2ee 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -137,6 +137,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
 			dev_err(sdev->dev,
 				"Parsing filter entry '%s' failed with %d\n",
 				entry, entry_len);
+			kfree(*out);
 			return -EINVAL;
 		}
 	}
@@ -208,13 +209,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
+			kfree(elems);
 			goto error;
 		}
 	}
 	ret = count;
 error:
 	kfree(string);
-	kfree(elems);
 	return ret;
 }
 
-- 
2.42.0.windows.2

