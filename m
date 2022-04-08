Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A814F97C2
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 16:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1FD1A28;
	Fri,  8 Apr 2022 16:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1FD1A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649427216;
	bh=0q+IaaUoHpY9M31qHkIJPOSI6zMbZOTod5BoLUgD7rE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ceevChPfBi4gnpVHhPbqIvpYRpDZXg2EYD5zyH/izUz7lVKk2AARgaZo3T5J3A4UF
	 eqLK5GxdC/oLaLRZlSnkTmNB8yGPocAhm8E671l5752f1lik7agE7qnKKN8UuMbPYQ
	 TcBKPTdDkZiKDg73yd5KfOoTJ5xAbdna1tJE/NqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D2EEF804B1;
	Fri,  8 Apr 2022 16:12:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17983F80128; Fri,  8 Apr 2022 16:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0FF4F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 16:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0FF4F80128
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[120.231.214.12])
 by rmsmtp-lg-appmail-04-12082 (RichMail) with SMTP id 2f326250428c9b2-6bba5;
 Fri, 08 Apr 2022 22:11:47 +0800 (CST)
X-RM-TRANSID: 2f326250428c9b2-6bba5
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v1 1/2] rename tas2764 to tas27xx
Date: Fri,  8 Apr 2022 22:11:18 +0800
Message-Id: <20220408141119.958-1-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

rename tas2764.yaml to tas27xx.yaml

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 .../devicetree/bindings/sound/{tas2764.yaml => tas27xx.yaml}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/sound/{tas2764.yaml => tas27xx.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/sound/tas2764.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/sound/tas2764.yaml
rename to Documentation/devicetree/bindings/sound/tas27xx.yaml
-- 
2.35.1


