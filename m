Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5810328B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 05:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C1A16A1;
	Wed, 20 Nov 2019 05:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C1A16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574224300;
	bh=T+aEcyVj9BjZcVxPlXw1L4XHVWUMtS2+tLFb0VoUphQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCXgQxXYXvd+QSNfgy8HOxll0wyjKg2TvrddF1FQsaElNZ4WA4T7dPjsYNB7a9hNK
	 QaVmjteVzyXYqVopsoDzSfH/dWqNJYSEokHgS7vmtWvPPdAMWsEx4RDjRaSj2x5guA
	 NFhxyhO5J7OkUDU8BuSOiqYRIdivgTIXsCgPmurY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74564F8014D;
	Wed, 20 Nov 2019 05:29:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A457F8014A; Wed, 20 Nov 2019 05:29:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40014F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 05:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40014F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LBjJhoQv"
Received: by mail-pj1-x1043.google.com with SMTP id f7so3592544pjw.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qtMzY8AGN3QG9aa6nEI7DA8/k3R+/MfhiSaP8tJFdSM=;
 b=LBjJhoQvqDe3OeE9Ca+ISlgmSstriSGyeywxEVSlUkvpRpJf5qcT8ebqtAUi6w5nnL
 TbEDFYL9ZVhSKRJszp1s6PwO4tKNIG8FvUEJ++hIrsPiNiZ6r3bOFX7M2JrbqdQMRMqL
 /tb3HAo75ISkHvCmF7UryBY1ozyRkHzDiOIBBwebxsLY6Qt3TXv/ltugObhCOdJir7Mi
 /ZIPaQxDyjLNGE3izpJ8ImalaHtPzXMqruEG9RpNjbg+vSyVT/UvSuAfoov32KnDwdft
 sF8SOu/sVqREXJGa7T5OqZc5o1zeNyjPMYtnOYjCZEg3J7/TcilPoMTi8nRsh+yqgFJr
 mW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtMzY8AGN3QG9aa6nEI7DA8/k3R+/MfhiSaP8tJFdSM=;
 b=FcwNgvoaZLBctvf8nrU6GHJKGbjr9UG4znPCYyWsA6R6pz/inYpOQVlXUr0t0g5GFQ
 pROkMaIJZYxfOw9YezxqhTRR/4FpGKN9XenGF7bKb/FUp+PG4YdYKm54YFGNFG7cYY20
 Em4by0MfU2nXLPLoib3pwTLg4q04pCBF6wIX+qT4DTFgO8xQNDJAA6GWq6w+1UsjarL5
 cwe5MKlX2tnV7SvCKIu05L2Q9BfEHaV3osbos/xgkE/8OpifpsJHmnKSSOaclZWlZioV
 im1bqm3n8x1+635WLqnDhx9MY+iXxyecDFefPYfDn35HDU+4emgZnW8YdZsz78LWo4Vy
 1Hjw==
X-Gm-Message-State: APjAAAURjVBrwvbEDbHJdnyYUv3Bjq/Y/UAeP9zvtG/qiv8bBDIjJJjH
 htVwacP/4ooZUtwJqm6H6szchtOUjKo=
X-Google-Smtp-Source: APXvYqwHCJXwsaxqRuWx1YhLD39HujaWXpKicK0N3YusJLx6hVmdJxqP5UyIJHhZ2PrCvtpdyvLXXQ==
X-Received: by 2002:a17:90a:bf16:: with SMTP id
 c22mr1396930pjs.83.1574224139301; 
 Tue, 19 Nov 2019 20:28:59 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id a6sm5447285pja.30.2019.11.19.20.28.58
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 20:28:58 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 19 Nov 2019 20:28:54 -0800
Message-Id: <20191120042856.415854-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191120042856.415854-1-rosenp@gmail.com>
References: <20191120042856.415854-1-rosenp@gmail.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 2/4] treewide: Fix wrong formats on 32-bit
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

uint64_t evaluates to unsigned long long on 32-bit, not unsigned long.
Use the proper formats.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 axfer/container.c       | 7 ++++---
 axfer/subcmd-transfer.c | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index 7da97c6..566acd0 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -13,6 +13,7 @@
 #include <errno.h>
 #include <string.h>
 #include <fcntl.h>
+#include <inttypes.h>
 
 static const char *const cntr_type_labels[] = {
 	[CONTAINER_TYPE_PARSER] = "parser",
@@ -356,10 +357,10 @@ int container_context_pre_process(struct container_context *cntr,
 		fprintf(stderr, "  frames/second: %u\n",
 			cntr->frames_per_second);
 		if (cntr->type == CONTAINER_TYPE_PARSER) {
-			fprintf(stderr, "  frames: %lu\n",
+			fprintf(stderr, "  frames: %" PRIu64 "\n",
 				*frame_count);
 		} else {
-			fprintf(stderr, "  max frames: %lu\n",
+			fprintf(stderr, "  max frames: %" PRIu64 "\n",
 				*frame_count);
 		}
 	}
@@ -427,7 +428,7 @@ int container_context_post_process(struct container_context *cntr,
 	assert(frame_count);
 
 	if (cntr->verbose && cntr->handled_byte_count > 0) {
-		fprintf(stderr, "  Handled bytes: %lu\n",
+		fprintf(stderr, "  Handled bytes: %" PRIu64 "\n",
 			cntr->handled_byte_count);
 	}
 
diff --git a/axfer/subcmd-transfer.c b/axfer/subcmd-transfer.c
index 3ca745a..8746e6f 100644
--- a/axfer/subcmd-transfer.c
+++ b/axfer/subcmd-transfer.c
@@ -11,6 +11,7 @@
 #include "misc.h"
 
 #include <signal.h>
+#include <inttypes.h>
 
 struct context {
 	struct xfer_context xfer;
@@ -389,7 +390,8 @@ static int context_process_frames(struct context *ctx,
 
 	if (!ctx->xfer.quiet) {
 		fprintf(stderr,
-			"%s: Expected %lu frames, Actual %lu frames\n",
+			"%s: Expected %" PRIu64 "frames, "
+			"Actual %" PRIu64 "frames\n",
 			snd_pcm_stream_name(direction), expected_frame_count,
 			*actual_frame_count);
 		if (ctx->interrupted) {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
