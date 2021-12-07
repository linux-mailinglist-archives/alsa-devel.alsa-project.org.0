Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55D46B333
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 07:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752152349;
	Tue,  7 Dec 2021 07:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752152349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638859743;
	bh=p4ZxzOFwVIidvFo6CyDVe08u6SHPIlYryYcvzZr8krU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+EOCU6otl1WdI6KhAknxG/zo9XHzbnUUKWFEKOMET5Wh2MCIYFkBVPgTuwBkt03M
	 S9CZPgZ3xJGCpMJAYParXCFavGfcUS0aPFQiPVm1BNcfzqkq3he2QyLi5XA1W56+U7
	 AM/q4CdsXD4iDCm6sNTALzG/7B6evR47vvzAA/Ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92646F804E4;
	Tue,  7 Dec 2021 07:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37B7F804AE; Tue,  7 Dec 2021 07:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5F096F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 07:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F096F80103
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638859659063849926-webhooks-bot@alsa-project.org>
References: <1638859659063849926-webhooks-bot@alsa-project.org>
Subject: Add support for some non-alphanumeric variable names in the math expr
 evaluator
Message-Id: <20211207064741.F37B7F804AE@alsa1.perex.cz>
Date: Tue,  7 Dec 2021 07:47:41 +0100 (CET)
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

alsa-project/alsa-lib issue #197 was edited from ranj063:

The math expression evaluator expects variable names to only be alpha-numeric. So if I have something like "[$DYNAMIC_PIPELINE + 2]", I get the error:

ALSA lib confeval.c:263:(snd_config_evaluate_string) wrong expression '$[$DYNAMIC_PIPELINE + 2]'
ALSA lib conf.c:5632:(snd_config_expand_custom) Expand error (walk): Invalid argument
Failed to expand pre-processor definitions in input config

Is it possible to add support for some non-alphanumeric characters in the variable names , esp '_'? I tried this change it seems to suffice:
```
diff --git a/src/confeval.c b/src/confeval.c
index a971bf38..7330d67e 100644
--- a/src/confeval.c
+++ b/src/confeval.c
@@ -190,7 +190,7 @@ int _snd_eval_string(snd_config_t **dst, const char *s,
                        } else {
                                e = s + 1;
                                while (*e) {
-                                       if (!isalnum(*e))
+                                       if (!isalnum(*e) && (*e != '_'))
                                                break;
                                        e++;
                                }

```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/197
Repository URL: https://github.com/alsa-project/alsa-lib
