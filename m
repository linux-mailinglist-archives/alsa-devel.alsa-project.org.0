Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B506118335
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 10:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323E5165F;
	Tue, 10 Dec 2019 10:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323E5165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575969254;
	bh=onjxU1gYxPOoR5ZR9xkpWOZ8sJll4HJgVIkryk45cbw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsFf8/4twXrShEz7LXstODl3ARlQg8sJBWY0KCgsuCmXKacApqsJBvrCtvlQs/p67
	 nh1g9OZtThx19/eTuj5/OwQ64bzhlyH9/Lwp5EAQs1l2tJEq39qTyD/GJq9MPYfho9
	 4eREd4Wisajrb3iyEYlgUhvNRFK+hR78VVMQhv1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DD0F80265;
	Tue, 10 Dec 2019 10:11:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23C3F80252; Tue, 10 Dec 2019 10:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0801F8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 10:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0801F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LX9RKscH"
Received: by mail-pf1-x444.google.com with SMTP id s18so8738688pfd.8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fxz/ONsrqU9P66QbwRL+UbxSqwXSyA4HCqEno4y3b3A=;
 b=LX9RKscHDCBjY60HqM3uqx6NFfisCSukdCEyHhOgNBVOgHhlYTVT5zBkx4SCPsweyX
 SYZSn0M/dJX4OHV8Rcj1lIMvuiTgg5VQbrFR6OtXZqUy8I67vyuQu3KqqD7URsAvIFMJ
 5maza1XagQXHtACV4+Dz8h1HrjUfdA1Cj3Fslg7XY3ZgZjinQxNugDu9/PA9BrDxcZ26
 XN5KWlj0oDw6RWuOCEOJFLTdLFTY1HHFeuDPjdUfhgBUtGxyrn/8Jy/FR+s4OPD/IaGM
 cBXq/Es8506M1XTXGfJjh8mH+jiU8ES2n/zib1HkYkf5YIuQPHUN1s10LW/+xUEkGuyM
 p/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxz/ONsrqU9P66QbwRL+UbxSqwXSyA4HCqEno4y3b3A=;
 b=di43nrXAXKvPsik9Th5738pqEwjVhMpdhCAtkBfWIbg4VFaFfNUHwGQkmBWWdYQFj/
 d2ZlvUCIH9wu/E6uFuJ50tluBhPAjMkOWXwrG3fHlSHrtyU9zi+BGGOecLq0iB7D+t05
 U74Ww/7kaTyo+/8/UwyirhgunU8V/QifsbVJmI7Rjrn2nPRSdgR/950N0vBPyXLv9mky
 a3J9/gIBnAHIyEqdVc9wqToThiKzRB5WJ74vV/8JXVW+3QK9oXOKx8cT0ksQpC/MjWMx
 N4sov1Dno5G7HBCx22O7i6KIZXEWMLDNVQjCyKRH4eT8dpTgg/ennNmKXL/4Ow+/Gnzs
 sfkw==
X-Gm-Message-State: APjAAAVxD8/xA3bpNcB7EqeYz5Y++awfE2ZOdMM82p2KUOZIPv8X1eGd
 ANTWA2dCUm+2+zHq1ztmETOsA38rPFU=
X-Google-Smtp-Source: APXvYqzXPt1mIMkUWG0Q2dt7ouQjjmCUT0KOAmVjplg09OYBfX5bB44SqngMowyhaBvQq2TZcYdg/Q==
X-Received: by 2002:a63:f551:: with SMTP id e17mr23164448pgk.162.1575969051777; 
 Tue, 10 Dec 2019 01:10:51 -0800 (PST)
Received: from localhost.localdomain ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id d14sm2140551pjz.12.2019.12.10.01.10.50
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 01:10:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 01:10:47 -0800
Message-Id: <20191210091047.143081-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210091047.143081-1-rosenp@gmail.com>
References: <20191210091047.143081-1-rosenp@gmail.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 3/3] treewide: Remove extra ; warning
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

Enclosed defines in a do/while loop to silence this.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 src/conf.c            | 20 ++++++++++----------
 src/mixer/simple.c    | 16 ++++++++--------
 src/topology/parser.c |  2 +-
 src/ucm/ucm_subs.c    | 10 ++++++----
 4 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/src/conf.c b/src/conf.c
index e4306504..c26999b0 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -3062,7 +3062,7 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 #ifndef DOC_HIDDEN
 
 #define SND_CONFIG_SEARCH(config, key, result, extra_code) \
-{ \
+do { \
 	snd_config_t *n; \
 	int err; \
 	const char *p; \
@@ -3081,10 +3081,10 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 		} else \
 			return _snd_config_search(config, key, -1, result); \
 	} \
-}
+} while(0)
 
 #define SND_CONFIG_SEARCHA(root, config, key, result, fcn, extra_code) \
-{ \
+do { \
 	snd_config_t *n; \
 	int err; \
 	const char *p; \
@@ -3108,10 +3108,10 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 		} else \
 			return _snd_config_search(config, key, -1, result); \
 	} \
-}
+} while(0)
 
 #define SND_CONFIG_SEARCHV(config, result, fcn) \
-{ \
+do { \
 	snd_config_t *n; \
 	va_list arg; \
 	assert(config); \
@@ -3132,10 +3132,10 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 	if (result) \
 		*result = n; \
 	return 0; \
-}
+} while(0)
 
 #define SND_CONFIG_SEARCHVA(root, config, result, fcn) \
-{ \
+do { \
 	snd_config_t *n; \
 	va_list arg; \
 	assert(config); \
@@ -3156,10 +3156,10 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 	if (result) \
 		*result = n; \
 	return 0; \
-}
+} while(0)
 
 #define SND_CONFIG_SEARCH_ALIAS(config, base, key, result, fcn1, fcn2) \
-{ \
+do { \
 	snd_config_t *res = NULL; \
 	char *old_key; \
 	int err, first = 1, maxloop = 1000; \
@@ -3201,7 +3201,7 @@ int snd_config_save(snd_config_t *config, snd_output_t *out)
 	if (result) \
 		*result = res; \
 	return 0; \
-}
+} while(0)
 
 #endif /* DOC_HIDDEN */
 
diff --git a/src/mixer/simple.c b/src/mixer/simple.c
index 2861d97c..2b9daa6e 100644
--- a/src/mixer/simple.c
+++ b/src/mixer/simple.c
@@ -82,30 +82,30 @@ int snd_mixer_selem_register(snd_mixer_t *mixer,
 #ifndef DOC_HIDDEN
 
 #define CHECK_BASIC(xelem) \
-{ \
+do { \
 	assert(xelem); \
 	assert((xelem)->type == SND_MIXER_ELEM_SIMPLE); \
-}
+} while(0)
 
 #define CHECK_DIR(xelem, xwhat) \
-{ \
+do { \
 	unsigned int xcaps = ((sm_selem_t *)(elem)->private_data)->caps; \
 	if (! (xcaps & (xwhat))) \
 		return -EINVAL; \
-}
+} while(0)
 
 #define CHECK_DIR_CHN(xelem, xwhat, xjoin, xchannel) \
-{ \
+do { \
 	unsigned int xcaps = ((sm_selem_t *)(elem)->private_data)->caps; \
 	if (! (xcaps & (xwhat))) \
 		return -EINVAL; \
 	if (xcaps & (xjoin)) \
 		xchannel = 0; \
-}
+} while(0)
 
-#define CHECK_ENUM(xelem) \
+#define CHECK_ENUM(xelem) do { \
 	if (!(((sm_selem_t *)(elem)->private_data)->caps & (SM_CAP_PENUM|SM_CAP_CENUM))) \
-		return -EINVAL;
+		return -EINVAL; } while(0)
 
 #define COND_CAPS(xelem, what) \
 	!!(((sm_selem_t *)(elem)->private_data)->caps & (what))
diff --git a/src/topology/parser.c b/src/topology/parser.c
index 5940692d..473a65e6 100644
--- a/src/topology/parser.c
+++ b/src/topology/parser.c
@@ -382,7 +382,7 @@ int snd_tplg_add_object(snd_tplg_t *tplg, snd_tplg_obj_template_t *t)
 	default:
 		SNDERR("error: invalid object type %d\n", t->type);
 		return -EINVAL;
-	};
+	}
 }
 
 int snd_tplg_build(snd_tplg_t *tplg, const char *outfile)
diff --git a/src/ucm/ucm_subs.c b/src/ucm/ucm_subs.c
index 90e395f0..5d5fd64e 100644
--- a/src/ucm/ucm_subs.c
+++ b/src/ucm/ucm_subs.c
@@ -146,15 +146,16 @@ static char *rval_sysfs(snd_use_case_mgr_t *uc_mgr ATTRIBUTE_UNUSED, const char
 	return strdup(path);
 }
 
-#define MATCH_VARIABLE(name, id, fcn, empty_ok)				\
+#define MATCH_VARIABLE(name, id, fcn, empty_ok)	do {			\
 	if (strncmp((name), (id), sizeof(id) - 1) == 0) { 		\
 		rval = fcn(uc_mgr);					\
 		idsize = sizeof(id) - 1;				\
 		allow_empty = (empty_ok);				\
 		goto __rval;						\
-	}
+	}								\
+} while(0)
 
-#define MATCH_VARIABLE2(name, id, fcn)					\
+#define MATCH_VARIABLE2(name, id, fcn) do {				\
 	if (strncmp((name), (id), sizeof(id) - 1) == 0) {		\
 		idsize = sizeof(id) - 1;				\
 		tmp = strchr(value + idsize, '}');			\
@@ -170,7 +171,8 @@ static char *rval_sysfs(snd_use_case_mgr_t *uc_mgr ATTRIBUTE_UNUSED, const char
 			rval = fcn(uc_mgr, v2);				\
 			goto __rval;					\
 		}							\
-	}
+	}								\
+} while(0)
 
 int uc_mgr_get_substituted_value(snd_use_case_mgr_t *uc_mgr,
 				 char **_rvalue,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
