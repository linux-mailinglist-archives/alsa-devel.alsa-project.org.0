Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE173A246A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 08:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C33A172A;
	Thu, 10 Jun 2021 08:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C33A172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623306146;
	bh=ZCc0McA1OeNylaKYcPQalDnyqRtmeEKzR1Q4SNWsSX0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=REZuVz+RiuY1DbP2rX/s7vd/zsD4jSozHW/dPt4OyzkOJtmpoawrJRJhVZKOrEalq
	 0YZ8LCjZkxK7jHuk/1eAikbAx2fiYxp98n8W8EDLP5XLYPsAf9fsDIBqgOr50Sw/yg
	 01HU6Lcf8W2Mz5rUqAw5ixvAFI9514d3FceRIijo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A01AF80227;
	Thu, 10 Jun 2021 08:20:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E5DCF80218; Thu, 10 Jun 2021 08:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30A0AF80149
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 08:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A0AF80149
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id DA17FBA7F6;
 Thu, 10 Jun 2021 14:20:43 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [113.57.152.160])
 by smtp.263.net (postfix) whith ESMTP id
 P32529T140357287958272S1623306042221794_; 
 Thu, 10 Jun 2021 14:20:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0a0ef2f2f4c7605f7bd6b05bff47d8d4>
X-RL-SENDER: huangjianghui@uniontech.com
X-SENDER: huangjianghui@uniontech.com
X-LOGIN-NAME: huangjianghui@uniontech.com
X-FST-TO: corbet@lwn.net
X-RCPT-COUNT: 7
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: huangjianghui <huangjianghui@uniontech.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Docs: hda: Fix spelling mistakes
Date: Thu, 10 Jun 2021 14:20:36 +0800
Message-Id: <20210610062036.30300-1-huangjianghui@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 huangjianghui <huangjianghui@uniontech.com>
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

correct Reatek to Realtek

Signed-off-by: huangjianghui <huangjianghui@uniontech.com>
---
 Documentation/sound/hd-audio/controls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/hd-audio/controls.rst b/Documentation/sound/hd-audio/controls.rst
index f2ebc4f79b44..dbe6483f4ff4 100644
--- a/Documentation/sound/hd-audio/controls.rst
+++ b/Documentation/sound/hd-audio/controls.rst
@@ -102,7 +102,7 @@ Conexant codecs
 ---------------
 
 Auto-Mute Mode
-  See Reatek codecs.
+  See Realtek codecs.
 
 
 Analog codecs
-- 
2.20.1



