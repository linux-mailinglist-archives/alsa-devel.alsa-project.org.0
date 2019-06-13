Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCD45053
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 01:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55F5184A;
	Fri, 14 Jun 2019 01:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55F5184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560470121;
	bh=VtaM16AZ2XsLuU49uzROGxT5io9WqwX0CwEF7OXx/0Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c3fgGp/0d1E8RJ0MasyhMnLWcl26H8uxBJdfXNtx4SKrY1+VVEifiZhLQOUvgeTnH
	 F9A03pOIZ2UJOdk0SvDnsMuue30oXX4jG590KDUQsRmv5T6dmX3C3f8JOD+22nBD1y
	 O599kLt/Wpm/Mxbxrh3hNLZ30E/D5f0GZGT/IPJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C181F89711;
	Fri, 14 Jun 2019 01:53:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF47F89703; Fri, 14 Jun 2019 01:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 234CDF80791
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 01:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 234CDF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZR2Wh0zA"
Received: by mail-pf1-x442.google.com with SMTP id p184so222499pfp.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzgfRdKzrvRWEDduo5eDlErYQ+U9vO+5gDU2YPpPd1k=;
 b=ZR2Wh0zAMZ0GS3LZcX1vCy0QGo6mwfTNqj/CVA8tOstBkOM3yd3yCyYV+pTSdqVIQG
 3yp11zaCq2FqPPdUexuB2Tlj8jWEr0TrMasjbF1jfmH5liyAJa1Qc6fqmocgkjnZLGFV
 xbWFqDOEUZUn2SjO0B1m+ZwuUdN+h81HJjE3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzgfRdKzrvRWEDduo5eDlErYQ+U9vO+5gDU2YPpPd1k=;
 b=j1vf9vv9mhTOPe+Pf5ycDcPeRFwnrqTQZ7dfYhQNOOP3QRIfHiz3YAv12gjK/nTRVM
 Y4UQslqvWjYY5R4YB6H0OjXGbtvPB1WBKxBdlOEGIh7IE8vP8mTVountfL572M4/g6GW
 OfKf8BuNcqYARY+zxZYvqVtjmyuQwAdmlA1/pfbGMdLK/v62ibvhusErobJPlLGRUEOB
 wBNE9L63HR8bJQ4xJUHj2ZbYtoXB4ETL8EHkh27FyDPF430/y7/hsBMLTiJ4kge+DOaJ
 LKOCn0nC3Cb2PcrojOa663eNbmvS7RfPh5+lCBsnKmOWtRv8iO9ThkRStfkKOKQnHGW/
 h2Qw==
X-Gm-Message-State: APjAAAUsV09x9gpb/h5BvGj4SMmdwnRHLlWxv04cj+ohDFIexsdwaxZt
 HxdcTOMutI7+lgiudiJvIadk6PncWg==
X-Google-Smtp-Source: APXvYqw+RYxwwChioYjTAbIZBoS5StQ3gjTUYu0I8PFqRGTAOULlmb7m6uoz3nCqrJp4VdIdMWGXjA==
X-Received: by 2002:a62:874f:: with SMTP id i76mr12537297pfe.118.1560470008312; 
 Thu, 13 Jun 2019 16:53:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id g71sm878304pgc.41.2019.06.13.16.53.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 16:53:27 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 16:53:09 -0700
Message-Id: <20190613235309.30984-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, Crag Wang <crag.wang@dell.com>,
 Dylan Reid <dgreid@chromium.org>
Subject: [alsa-devel] [PATCH] ucm: Dell WD15 set lineout controls
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

The lineout playback switch should be enabled and disabled when enabling
and disabling the device.

This commit needs to be tested by dell.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Dylan Reid <dgreid@chromium.org>
Cc: Crag Wang <crag.wang@dell.com>
---
 src/conf/ucm/Dell-WD15-Dock/HiFi.conf | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/src/conf/ucm/Dell-WD15-Dock/HiFi.conf b/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
index 1b6bd212..cab13c5d 100644
--- a/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
+++ b/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
@@ -1,3 +1,11 @@
+SectionVerb {
+	EnableSequence [
+		cdev "hw:Dock"
+	]
+	DisableSequence [
+	]
+}
+
 SectionDevice."Headphone" {
 	Comment "Headphone"
 
@@ -14,6 +22,14 @@ SectionDevice."LineOut" {
 		PlaybackChannels "2"
 		PlaybackPCM "hw:Dock,1"
 	}
+	EnableSequence [
+		cdev "hw:Dock"
+		cset "name='Line Playback Switch' on"
+	]
+	DisableSequence [
+		cdev "hw:Dock"
+		cset "name='Line Playback Switch' off"
+	]
 }
 
 SectionDevice."Mic" {
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
