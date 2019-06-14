Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8E45119
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 03:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3EA1851;
	Fri, 14 Jun 2019 03:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3EA1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560475065;
	bh=RG8u+AEBr7/ixWJi8Jg6zGm7J0wD5JT/5i/FeZAGcOo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=As0AfpN/di7LItxJ1PK7PtS8sa/I8AcNW7rQC/V7V1l2u/92/X1hyGPhjxwwAWXgv
	 SwPFsEFBksDUDO/nXE9zSBAe5IOUDga7JSko4FObwXwPA298g6hDGGHBXDreVCPsle
	 YVF8cVT26U9Ye5TmzghP4fEgkbihsa1Wf6nTqXWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B846F8970F;
	Fri, 14 Jun 2019 03:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F39EF89703; Fri, 14 Jun 2019 03:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD71F8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 03:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD71F8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L4zXcNlw"
Received: by mail-pl1-x642.google.com with SMTP id a93so263253pla.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 18:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A5UM5bucRn/Tvx21/M4vc9khDISAfR62KkRAVRbXIxw=;
 b=L4zXcNlwAHYv9XuYuEwSaEUAN+5JlSWPODMAShxI9B4r7PJsCOJHV4jEJQc0pLmpXQ
 X5U24EKzRk3i4b/YJXo6tj+oZQUE0IKkSGjZKEowZjtZnwEm11DO+W0AIrVfUGoXm+i9
 zeZn2p20Mb1/+DZY5Cecrtnc5y063rifCPhD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A5UM5bucRn/Tvx21/M4vc9khDISAfR62KkRAVRbXIxw=;
 b=tF9vVwMaQ/bXvX4GTg5BYSNZrinyNxBDQcoyQk1Ww/Ex8xJfp522a0aRCtXOzIZm3R
 HUJlT5yXQOjoyrKvquwO6WYEMLhdBwBnochqZTXevRbMcLx0EuSM1KF8nzHm1YFr5JUM
 mFR1erJIfh9u4uvelTaEkaVSWoKKmb2KIO5x98VgZisJS4U3j+Bl3JaDo8DeUdM3ntB0
 MGadvy994oGdIHyjO9nnqdwFMfc7O9/0ZeQIHLErijE037Iqnen3sk5HDU/rEAr1R8ES
 tCgel0w8QqkRX7S9b8deT/9ut322ifaAWWum5R9TrzsYwEf37j/8f9Qs9L0OL+hoL8R+
 atlw==
X-Gm-Message-State: APjAAAXEDMBd3zunc4lerLB/b3czo/GmZx7rg4l+bCYeMqDHOm2RN/j4
 WBl6CKuUsx+dlCtuk1/PdAoimJMuyA==
X-Google-Smtp-Source: APXvYqx5u2DWKavPxzHOGyrazONZmx+kAjjelwzJK7ar2nbAbqpSjuirjXGU2iwEK062wKmAecP74Q==
X-Received: by 2002:a17:902:205:: with SMTP id
 5mr84770616plc.165.1560474952768; 
 Thu, 13 Jun 2019 18:15:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id o20sm857401pgj.70.2019.06.13.18.15.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 18:15:52 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 18:15:31 -0700
Message-Id: <20190614011530.33465-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613235309.30984-1-cujomalainey@chromium.org>
References: <20190613235309.30984-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, Crag Wang <crag.wang@dell.com>,
 Dylan Reid <dgreid@chromium.org>
Subject: [alsa-devel] [PATCH v2] ucm: Dell WD15 set lineout controls
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
 src/conf/ucm/Dell-WD15-Dock/HiFi.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/conf/ucm/Dell-WD15-Dock/HiFi.conf b/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
index 1b6bd212..8e8c0140 100644
--- a/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
+++ b/src/conf/ucm/Dell-WD15-Dock/HiFi.conf
@@ -14,6 +14,14 @@ SectionDevice."LineOut" {
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
