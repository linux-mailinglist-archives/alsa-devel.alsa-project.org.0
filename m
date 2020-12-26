Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AA2E2F2D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:39:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7015317FB;
	Sat, 26 Dec 2020 22:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7015317FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018755;
	bh=27rvBlhhf4w5Z4DFjh0Aw5x9G+07Kx0Kfl8tROdKzDs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqiBsqR/Ca0l1v+189uuJkCDNXP4mtcgfkckSeTNkTDyQwv7mGPnOCZBb1oM1pUvl
	 1AJFQRivAYy14kovBKtR6CD+fPfsFt/xi08qD74X3oQpucbZ23fz6p1IlqDhLhI8tQ
	 pm4pUdvC14Y4lWE7Z36boy/Ztv4HV1/zC3ytoNVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4996EF804CB;
	Sat, 26 Dec 2020 22:36:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 889ACF804B3; Sat, 26 Dec 2020 22:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5233F80128
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5233F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JFvya+xm"
Received: by mail-pl1-x631.google.com with SMTP id b8so3826218plx.0
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jq/6tcPUBYiBTQ1rQtKYROKYlBauXerKjDz6CDptgY4=;
 b=JFvya+xm3qQmXYghULp4U5s/nX4LO3xghoCTk+WaacwS3tPmhdH+rrzsgzo3Fet/5Y
 mxq+OHbmlkg+MxT3d17Adr15h22+lZn9sZ+zgy3Gqv4qOo4vM7xp4aivL+Cg9n6dOCM6
 B/GXe1ac1h63rBukBLbVvzyKIJjaJ+A2w1lQ0hhW3MhEgfnn0BgXv9bS+t2abnfcHwQB
 bt7/HTpPJDkwE1mRWR0nHT9QXlTLSs//17CUmbwTjIi5B1A2tSP7Auz/oCR1+1q8jpLz
 24bza3W6WMcOH0/Prp8OwgvJwncZOA0qfB+SFi6wT6IkjosN1/rQErynFF20/27Kvr99
 GWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jq/6tcPUBYiBTQ1rQtKYROKYlBauXerKjDz6CDptgY4=;
 b=hSWZO3Q4nI1v7hZ4AwLHAg411EB9kAZDsV9PsrvXNWAxps1xhLJQYTXEGJO6ZbFv2f
 HDQDJMHbbiRXdZyMjfTXCoubOo5uSN0Unoisf0J7ra4wnd3yYbojMYiL+rWSZs97IZbh
 8HP+HNZNpt+WkgE7k3xyVN5m0cWDHc1eC4c7esG7tsY5FI0zBaHcUkODUau/XS1mUm0D
 Rtr5SQEO+nkoYAF/n7uNmt0CgoxsOI6Qf/R6FePMl1bUl64FiMGoeCOkrJ8Cl3qbB6s5
 rPdpXuFFXJ3rNTqM7siNlxOsaZ795PxnmwfIs6l47sF8n7oWhDj/qD70TOSZXbTAk6IG
 5GwA==
X-Gm-Message-State: AOAM532StHzB50klRpSMFU+3bAUKKMK/P7hIXjEHodZFk+0m1wPaNZNw
 mOgsrE0vI8yBEW3uRVPUSOG+G3qMmSGLag==
X-Google-Smtp-Source: ABdhPJyIlUWgoSSbjnbYGX4KJNUB6q07xNBwc8IjQIvh3xwkEpEJNrFoEd7nbExiXBjc+INjR6lv+w==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr13911651pjf.206.1609018590658; 
 Sat, 26 Dec 2020 13:36:30 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:30 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 4/9] confmisc: fix memory leak in snd_func_concat
Date: Sat, 26 Dec 2020 14:35:42 -0700
Message-Id: <20201226213547.175071-5-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2.368.ge46b91665e.dirty
In-Reply-To: <20201226213547.175071-1-alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 src/confmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/confmisc.c b/src/confmisc.c
index eb8218c1..aece39c3 100644
--- a/src/confmisc.c
+++ b/src/confmisc.c
@@ -440,8 +440,8 @@ int snd_func_concat(snd_config_t **dst, snd_config_t *root, snd_config_t *src,
 	err = snd_config_get_id(src, &id);
 	if (err >= 0)
 		err = snd_config_imake_string(dst, id, res);
-	free(res);
       __error:
+	free(res);
 	return err;
 }
 #ifndef DOC_HIDDEN
-- 
2.29.2.368.ge46b91665e.dirty

