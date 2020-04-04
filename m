Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A435919E9D9
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 10:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9CF1676;
	Sun,  5 Apr 2020 10:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9CF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586074606;
	bh=aWeb5mWYi9FgE3Jwquvui3f8+QwIzOYzET68o4mgwRE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bNUQxKObgsTi4UYTfnaKkrJVS36hE21ICP39ghjXfDISc0T/7/Nr89Vxasz27Z03R
	 Cu4rN1lXjcD6zJfC9rBx2svuEhoJrb0G9zHsVMnrudIoChQ1ch8UdLY5+ybo6Cqcow
	 7RwbqM03gBtpqBLTqMqi6gDvl7+RIlCkT9mSGVbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14039F80121;
	Sun,  5 Apr 2020 10:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE45F80148; Sat,  4 Apr 2020 17:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F3FF80131
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 17:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F3FF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UlsGxS3l"
Received: by mail-wr1-x444.google.com with SMTP id a25so12241071wrd.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Apr 2020 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BF7UW8CK06SE0eBxOhlUCYg5eQ6WTl1tJij/gpor+Lk=;
 b=UlsGxS3liOFJSlyr7GF8lsqrLC75d1vpdraLA86G7MPHMfYEbTTtQgN6CGhaluGbOs
 eHWZwMiF53onIbQNEPRtAZm6C9thuw9qLmo+NsIMI9wdpQ/Rnp0zfztmOVs3+G/rgmah
 vuPQCfBygCPQ/oncThXwQfQmHOxdoRqk2v3V8Fyb5QbzayZPfkr3Zhdie3ao1wz16PSM
 MhMVqj5ONK/nZsvNr+0w2kBC/j8kxf90UuTohbrwGAojuD8u3z4nVVuRPDcAfSzmmD0d
 oWeUH7AoYf/5ZMxhST/QAXFUmAqpCV+qXp8eWOWtfg72z1Ccmo8Hqk/5ZvG+yO8M2NII
 O6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BF7UW8CK06SE0eBxOhlUCYg5eQ6WTl1tJij/gpor+Lk=;
 b=eLMjiC+F4toittSH32tzJsG6jWyT8Xl2lmtES+oZox8eu8rvPAn2zkADjwb/FS58TM
 lrKhG8iNB22CSM5lrvOU7ShoO2cqnA8hofY3w7NLSrNdj4LZIWpl0wPEMqsb9ql63hBy
 J3zLKykpE8SuE/rH9xd9Qj5uNhFETgRC5TZVtlDt+zt/wyMSYyUsNGtF7ERaDEym0b1a
 J9QhkRzQNKrVhcGQAZ6cISfUehXIOvGXDWuuiIIylzHHlgEM0H7d6PUDS14f1rhbQapl
 NjpTReQKLCMgbQXcaGKuD5vKUoFE4A3rzAUFfN6SqUUnqsH8se4TteUxklueZ0zV7XNV
 Om9Q==
X-Gm-Message-State: AGi0PuZ0/9X/c+cXRlS5lDxR8Wi6Lovn7M0YC+OtnUgfuGnwUqZiitb4
 PR9cZZf9FgtllZJ1Trg87VM=
X-Google-Smtp-Source: APiQypKBMaiyw7REJv645zIbS88N35C/tyuH5jaHjiwYNOlhSFZQnv4dNS4RpNaYk+oYgmendtc3Rg==
X-Received: by 2002:adf:f892:: with SMTP id u18mr14375271wrp.367.1586014742353; 
 Sat, 04 Apr 2020 08:39:02 -0700 (PDT)
Received: from pc-emmanuel.ealp-net.at (84-112-96-10.cable.dynamic.surfer.at.
 [84.112.96.10])
 by smtp.gmail.com with ESMTPSA id z21sm189889wml.47.2020.04.04.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 08:39:01 -0700 (PDT)
From: Emmanuel Pescosta <emmanuelpescosta099@gmail.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, crwulff@gmail.com
Subject: [PATCH] ALSA: usb-audio: Add registration quirk for Kingston HyperX
 Cloud Alpha S
Date: Sat,  4 Apr 2020 17:38:43 +0200
Message-Id: <20200404153843.9288-1-emmanuelpescosta099@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 05 Apr 2020 10:15:00 +0200
Cc: emmanuelpescosta099@gmail.com
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

Similar to the Kingston HyperX AMP, the Kingston HyperX Cloud
Alpha S (0951:16d8) uses two interfaces, but only the second
interface contains the capture stream. This patch delays the
registration until the second interface appears.

Signed-off-by: Emmanuel Pescosta <emmanuelpescosta099@gmail.com>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 86f192a3043d..a8ece1701068 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1827,6 +1827,7 @@ struct registration_quirk {
 
 static const struct registration_quirk registration_quirks[] = {
 	REG_QUIRK_ENTRY(0x0951, 0x16d8, 2),	/* Kingston HyperX AMP */
+	REG_QUIRK_ENTRY(0x0951, 0x16ed, 2),	/* Kingston HyperX Cloud Alpha S */
 	{ 0 }					/* terminator */
 };
 
-- 
2.26.0

