Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696F9258E2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F11F50;
	Wed,  3 Jul 2024 12:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F11F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720003077;
	bh=2Hgb11TSE9fOERRmOGKvCbJsU5ExxL44Ao0bbckq9aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tzr/JFKI9qcqWbKqOmsAla7+r6SW4BlL9DEl8TCcLY58e3hNymJWRTzY7RvZPwVyd
	 RBc5YCrCaIcrVRAYPFjbfILPZ6ObnDvOSFi2leKpM8KOqD8kPlEBmsRwbON/jD5JZ6
	 WuKQ48xuowPzwfDplfgBZXfcn+5j0rteRoteroZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 018FBF805ED; Wed,  3 Jul 2024 12:36:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61B03F80301;
	Wed,  3 Jul 2024 12:36:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12C9F8014C; Wed,  3 Jul 2024 12:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1DC8F80588
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1DC8F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZTazhEE0
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a751ed17b1eso77786266b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001782; x=1720606582;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3joTjD/EvzvybWiPdLIbHTzIsLTnwS1UMLvS3hxDr3Y=;
        b=ZTazhEE0qrjzKbzhYn+8TUdXMDVhQa9kz5jRdT1PkbzIpCPKihF0qIBy5ghTg33w+M
         3bU6hJkzgd0vKkkhaL3r3MN8od5LAvJYZm0XKlMpIUp9X0O4VaXzYQAfmf/xPTU9bmBQ
         O/F4ji63InLu6yRKbnAwBW/To1Y+vQe3EREJ0Iqfo+aP2QRPV0ZVd6HRUMKw+l5XtjO9
         Iutzvk3KjIvLDilzTNypK70DWQHbEFSO6Eh3U7ryeZ26k6Jb1A1IMunnZTQ4JyRYX6dU
         MtHffuK8riMquflTYd9FOvtfDdnNx1oa+yHe+4e6AIwYon/3EuonhFZuDCLRyBr4WvTr
         pnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001782; x=1720606582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3joTjD/EvzvybWiPdLIbHTzIsLTnwS1UMLvS3hxDr3Y=;
        b=P23Yi8Zzprt+wU2Zn7OznqzcaOAwxIF0dWc+Sg38nWJhXb1YWLcyzn0Pg73HfnhbIC
         EfUeimhGh1n6KVUdzvHEa6ccTFs7gxmRe++e7USHJNfExTeSglbLOdv1klfQB+rz3+E3
         nqrirk3ff46S4Dy0D7ZNE9eKp5yyVjPy0aNTkh63qwr1aE21p30NGFSWPmip2qZU0MMv
         xRrcOG6n/a93DMPBYyD/hE5vtycJqoIh/bN7175pe3rBc9KoX7Xj74B9pi0KmtDjqfFg
         n1GrQmUqHoKtnb3gXtTd1jKFDBmyGHWo5fYbjc2tVLcmeTQhpHmvbeJ1AtBHh/Gl1Ozj
         h2kA==
X-Gm-Message-State: AOJu0YxduNNm+0AY6ZeRq0ElODH3W3nMHFHqu0hkdHGHYqzgt3/HpOxj
	gFBfc4vQZqwOfpKulWqPBpY18Bt/7i7FDpGNYHxovJv9xxuZVp60ZBhUGS9M+wU=
X-Google-Smtp-Source: 
 AGHT+IEELsiExLgIL8ViDXZhbHcr5lLNtKgOIwnhglxgd+MvGmadP9WGtD7IcS1FdBHJkN8UmxvuUQ==
X-Received: by 2002:a17:906:3390:b0:a75:1923:eb2e with SMTP id
 a640c23a62f3a-a77a24202d2mr96155166b.14.1720001782114;
        Wed, 03 Jul 2024 03:16:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:16:00 +0200
Subject: [PATCH 8/9] soundwire: cadence: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-8-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2Hgb11TSE9fOERRmOGKvCbJsU5ExxL44Ao0bbckq9aI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSToVO7krJpsryvmNegqDera+Tzu8RsMQNven
 Pl+d2kxioeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk6AAKCRDBN2bmhouD
 10eBD/wOYMaY6NC26kuLeUu0bJQ+sYDgl1g6Q7lkH1bSLC5TO9SnH/0h4y+otOvZV67HNOwAd8N
 cH2zTy/Z2E+pNrHspUPiOSxzg9tDPXMpcdSSnkBvqqine3JZhibf6kXd0c73jtRcTTRleFWfMy6
 J4SOVEjrRO2VSXzv+M3iNRyUC9FU3ObCHmT55JAnRdRSwf5BYLZzD9GqqWtRtfmmAP/rY5CWWRe
 zOEDY+edSJHyVzoANpMEySXRE5xTcQpCs/qSjW/ZXTKfLH4NNKdEgpkfP5XBQD4Q7+PdmM7c6NM
 FGvnKZzzhMQaB8780Awfj0aJnoQePjrz9gVJR7eqyT2OByegp3MjXPEFye5daGwyUs+A3+st2Xe
 s8YO29KiNQUs0XuOXqtCPgQWQaOqeyRuiojdUr9LUk4DtwwAHpctlQzpbCAKcNI+mTLCI05PsQQ
 hgMuEtwxzPRyV/brU8MILtqInRt7H29Rm130MdNAe4ZopUxqoLeuz3m8jtUZ7Ujn3BJWYGpi9P/
 UZfv4ulXMnDaAzhV4NITyL7vL525gjJveZi9/fb0FAFnGHnO1mBVOhAFTZEt8z0+xF15ibZINOr
 Pfp6TunC1dFQJKp7P8LsFxDOoNeVkJJ9nFsFn1ckc9zlLHE1Ev492Zl5aDKlzYbF4nurrDdwhJ6
 /PNP2BP22TZcJaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 5FDJEMOBIZGKUBV6MBPBNAT5QOLXNHL5
X-Message-ID-Hash: 5FDJEMOBIZGKUBV6MBPBNAT5QOLXNHL5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FDJEMOBIZGKUBV6MBPBNAT5QOLXNHL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/cadence_master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 74da99034dab..e0683a5975d1 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -6,6 +6,7 @@
  * Used by Master driver
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
@@ -323,12 +324,11 @@ static ssize_t cdns_sprintf(struct sdw_cdns *cdns,
 static int cdns_reg_show(struct seq_file *s, void *data)
 {
 	struct sdw_cdns *cdns = s->private;
-	char *buf;
 	ssize_t ret;
 	int num_ports;
 	int i, j;
 
-	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	char *buf __free(kfree) = kzalloc(RD_BUF, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -389,7 +389,6 @@ static int cdns_reg_show(struct seq_file *s, void *data)
 		ret += cdns_sprintf(cdns, buf, ret, CDNS_PDI_CONFIG(i));
 
 	seq_printf(s, "%s", buf);
-	kfree(buf);
 
 	return 0;
 }

-- 
2.43.0

