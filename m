Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171A66A516
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 22:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24473A777;
	Fri, 13 Jan 2023 22:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24473A777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673644986;
	bh=lKY3fbYL5J9qgzZsh0gbXS9p+kXHs4ITmBjb/ETsoxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ujn4e6Ks75qu4oKvSX6aYYK6UkAcSWtjW9aCDYwoBRj5zT/JZ/NdyqEAh90mRvI6m
	 +/OnuwN0HD9k+JIIT9ilEBQgt87HEe5pg79RvWEsosd36J4v1DmyFJKOVc9PK1DiXf
	 bUAJhu86JK0lWqzL/bfFwgvOYqCZG51QGEQpeMT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8889DF8016D;
	Fri, 13 Jan 2023 22:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79561F8030F; Fri, 13 Jan 2023 22:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6CDF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 22:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6CDF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VNAQHC0Z
Received: by mail-pl1-x62a.google.com with SMTP id b17so17183153pld.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sa35Rgi5hm13WG7/Y9JLeLbyRTFfrt1VJnvm071o9k8=;
 b=VNAQHC0ZFZybRBjug5ljTtb3JNqoCqZD1Ol05DNVVXVP0AjCUE/6OJpY5Bo79Mo2BB
 CPC4wtSn6WiGtbyEpl8xMZ8fbzWbRFMB12ic4mvRlr+5KClx5diU2O8N2Db88+dMcakK
 DpvzsO0QmScl68fbuJeUqmdkQa5a6BlWqeNz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sa35Rgi5hm13WG7/Y9JLeLbyRTFfrt1VJnvm071o9k8=;
 b=f63mpGbi6ZZtBIIAsfFlaqwguFh6OtraSIs9ubaIWlVRpy7ZIFouaMDXzxwzpqDW++
 58i6CKhm1eujwuqh0GM0brMObjOQQ5dmsIq6nGDg2ZNybSdTwi4EDBD3mtVucu8dZo1o
 Sh8d5qMmRzuPDuA2r/tctWVAgIGzU7aj6BJR8gIl7g70MdnkfLmleIpDtKocg6G+i7DU
 cBggOVT1wUkOhPXk1ghsTsL1cJ4QKZFH7nj/DWkzgDqgXhBqD8y1PLNmprGSRvR6aAtZ
 uQU58A4cI4d/bUMTya0J7p9zUsf+djK6epGGVpysFiOvMaYDQH+CNpn9V1bDc4LFuO4z
 vBZQ==
X-Gm-Message-State: AFqh2kodL9ovKWfzfP+eXUSN6r1YhsEwPdmGklpX91pM3+5lVkoqXkmn
 oQUyE14QT8gFwkTyMkEU//U9qZ5GZgHnmIA=
X-Google-Smtp-Source: AMrXdXufPrdP6LXhSBQr7+AVmZuulhOAJ217NsWPWWCQNLYtZeCN3xffPanhFkUMhEJD+1IXGwugLQ==
X-Received: by 2002:a05:6a20:988a:b0:ad:79bb:7485 with SMTP id
 jk10-20020a056a20988a00b000ad79bb7485mr77584525pzb.11.1673644920772; 
 Fri, 13 Jan 2023 13:22:00 -0800 (PST)
Received: from localhost ([2620:15c:9d:4:2017:603c:987:371b])
 by smtp.gmail.com with UTF8SMTPSA id
 n34-20020a17090a2ca500b00228c8aa7916sm1754998pjd.38.2023.01.13.13.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:22:00 -0800 (PST)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ucm: add existence checks to geti calls
Date: Fri, 13 Jan 2023 13:21:55 -0800
Message-Id: <20230113212155.2108905-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230113185019.1500147-1-cujomalainey@chromium.org>
References: <20230113185019.1500147-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Curtis Malainey <cujomalainey@chromium.org>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Right now in snd_use_case_geti you cannot tell if the item being queried
exists or not when being checked. This also means the only way to check
for the existence of something in the client of the library is to
iterate over the list of mods/devs even if we know exactly the name we
are looking for. We have functions that do exactly this internally so
lets return this information in a logical fashion through geti.

Also clean up some trailing white space nearby.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 src/ucm/main.c | 83 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/src/ucm/main.c b/src/ucm/main.c
index 2ff4d3f3..55867012 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -2414,12 +2414,73 @@ int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
 	return err;
 }
 
+/**
+ * \brief check device status and existance
+ * \param uc_mgr Use case manager
+ * \param str device identifier
+ * \param value Value pointer
+ * \return Zero if success, otherwise a negative error code
+ */
+static long check_device(snd_use_case_mgr_t *uc_mgr,
+		      const char *str,
+		      long *value)
+{
+	struct use_case_device *dev;
+	int err;
+
+	if (!str) {
+		return -EINVAL;
+	}
+	err = device_status(uc_mgr, str);
+	if (err > 0) {
+		*value = err;
+		err = 0;
+	} else if (err < 0) {
+		return err;
+	}
+	dev = find_device(uc_mgr, uc_mgr->active_verb, str, 0);
+	if (!dev) {
+		return -ENOENT;
+	}
+	return 0;
+}
+
+/**
+ * \brief check modifier status and existance
+ * \param uc_mgr Use case manager
+ * \param str modifier identifier
+ * \param value Value pointer
+ * \return Zero if success, otherwise a negative error code
+ */
+static long check_modifier(snd_use_case_mgr_t *uc_mgr,
+		      const char *str,
+		      long *value)
+{
+	struct use_case_modifier *mod;
+	long err;
+
+	if (!str) {
+		return -EINVAL;
+	}
+	err = modifier_status(uc_mgr, str);
+	if (err > 0) {
+		*value = err;
+		return 0;
+	} else if (err < 0) {
+		return err;
+	}
+	mod = find_modifier(uc_mgr, uc_mgr->active_verb, str, 0);
+	if (!mod) {
+		return -ENOENT;
+	}
+	return 0;
+}
 
 /**
  * \brief Get current - integer
  * \param uc_mgr Use case manager
- * \param identifier 
- * \return Value if success, otherwise a negative error code 
+ * \param identifier
+ * \return Value if success, otherwise a negative error code
  */
 int snd_use_case_geti(snd_use_case_mgr_t *uc_mgr,
 		      const char *identifier,
@@ -2443,25 +2504,15 @@ int snd_use_case_geti(snd_use_case_mgr_t *uc_mgr,
 			str = NULL;
 		}
 		if (check_identifier(identifier, "_devstatus")) {
-			if (!str) {
-				err = -EINVAL;
+			err = check_device(uc_mgr, str, value);
+			if (err < 0) {
 				goto __end;
 			}
-			err = device_status(uc_mgr, str);
-			if (err >= 0) {
-				*value = err;
-				err = 0;
-			}
 		} else if (check_identifier(identifier, "_modstatus")) {
-			if (!str) {
-				err = -EINVAL;
+			err = check_modifier(uc_mgr, str, value);
+			if (err < 0) {
 				goto __end;
 			}
-			err = modifier_status(uc_mgr, str);
-			if (err >= 0) {
-				*value = err;
-				err = 0;
-			}
 #if 0
 		/*
 		 * enable this block if the else clause below is expanded to query
-- 
2.39.0.314.g84b9a713c41-goog

