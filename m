Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE32FFDB2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:57:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD98B1AC6;
	Fri, 22 Jan 2021 08:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD98B1AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302242;
	bh=1JPs/nVqktpH7KkfxFt9UUQ1wgVa774m2FBN1CsE6ZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hrn22mF7cn2SRJghzk4cV9PVpGl3HpxL2IA6RhPS8gjkBDk6pBydW1kwhh28ptpps
	 GyBckz9c9QxaXQU2zKX7X2kUzigYQ/ZAzFtKINSBe3qQGwySki9H1v5AZ8Z7BJT9uM
	 ZWYmmH3p7iGggDaS5iiNsjJ/2Wgqv9/F6+Rf6MR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D11F804CC;
	Fri, 22 Jan 2021 08:54:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8100BF8016E; Wed, 20 Jan 2021 15:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7466F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 15:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7466F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I6ffGWbn"
Received: by mail-qk1-x72c.google.com with SMTP id d85so1332490qkg.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 06:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=543Lr3pof4aE25uVa0i2b1KzgsH0okr9Vj0BIuQB2gk=;
 b=I6ffGWbnfeYrENkWRkpycCKc1saqKVxatuaQbs9KjQ0pkAyOJwIsrHIvZxuODF0T1l
 RSlZ4xYyJCAcuvGCvCskT9LMbvamQWlQEAmQqjmng/tvKAOrxlLPllh2gk2lSJcz14I3
 NvTVfHbfywAaSDDV/5MrYVJEyBNrJEbgbAXfiEx8GTRiEmTW0QndY2k7nPyW0ypryyrX
 Y3lyTTCQBW1Q8+VTOSZSkG+8mvGXCBmlPDjpS0MiokSKf8xgb6wsAj3geIZhjzPwFGY9
 6tFjdy11SKuMgSD3MKkmrwI1VlX32n+qDQRAVS7cjd8H30k4FT0rmNJtgs1Erzdo4xuU
 3hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=543Lr3pof4aE25uVa0i2b1KzgsH0okr9Vj0BIuQB2gk=;
 b=Zh0XLB1KbRNZy5PWbZf5HbNFFqPAJA7u+oHD6PNPjUSq2THCK6Viwbs82NuQIXTdS8
 2F2pwo15PW2U7JbSBtD5pU2mDQMMm+bAJ5Sl0ZMHC+nvdTD4C/q/lh8bEGpZx+yXMZWx
 TqIA/zUjsfr9lxQlvY8LDBAs09ujCeujAowu4+/1Xd7JrCsF/MyLeJX2TPQ1AEGaN8rF
 0ysEQN+/h+lqCWOCK9FzS+sKax373QMWlu5U7Tcx4DDLHyXt7h+qMaT2OKoQy3BLkzQm
 cSutd/7WjFinqHggYwKFiiNsUopKFSvm33isrHkP7d5chGBL41I76dmO8UvhN4r4MFlD
 4R1w==
X-Gm-Message-State: AOAM533Imjg9rU4tnndmqrDC4sonHg9hb1EmMD3of5nxnMfF7CW9/aY3
 ZX/d5cN3EKqrLCv1+cU40bg=
X-Google-Smtp-Source: ABdhPJzr2WOF6l9nlEmxubuCtwdecrluMyUvUtVNOgCuQnlEuS+nIzNS1wxU6uE7JokQaGBuqYBnEQ==
X-Received: by 2002:a05:620a:569:: with SMTP id
 p9mr9531370qkp.274.1611153628090; 
 Wed, 20 Jan 2021 06:40:28 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.160])
 by smtp.gmail.com with ESMTPSA id b7sm1236235qtp.54.2021.01.20.06.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:40:27 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] drivers: slimbus: Fix word resposible -> responsible in
 slimbus.h
Date: Wed, 20 Jan 2021 20:10:06 +0530
Message-Id: <20210120144006.3587856-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:40 +0100
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
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

s/resposible/responsible/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/slimbus/slimbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..503e2a0200f5 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -368,7 +368,7 @@ struct slim_stream_runtime {
  * @get_laddr: It is possible that controller needs to set fixed logical
  *	address table and get_laddr can be used in that case so that controller
  *	can do this assignment. Use case is when the master is on the remote
- *	processor side, who is resposible for allocating laddr.
+ *	processor side, who is responsible for allocating laddr.
  * @wakeup: This function pointer implements controller-specific procedure
  *	to wake it up from clock-pause. Framework will call this to bring
  *	the controller out of clock pause.
--
2.30.0

