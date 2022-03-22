Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126504E429D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BAE171F;
	Tue, 22 Mar 2022 16:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BAE171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647962074;
	bh=60qjusBoApqPICdk214ldFJ+VkkQqdxFr/TXGvSsl+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJPndtt6fqTFDbmfhhUdojFE5kWy5aUu1hh83T2LYBqQ+XhCElepgkRha5sLPoTcI
	 f6oCd3cqc/6jO83Shcq9QlE5P8Mxvvz0ggmg454SBsqT317UftkORUCpz8PZw6zHyW
	 SfWbNnaBiHIGBaeRFLiDrt1E9aQXNtWCQQj/ynJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E5AF80551;
	Tue, 22 Mar 2022 16:10:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53025F8016C; Tue, 22 Mar 2022 08:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 638DCF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 08:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638DCF80116
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-10-12088 (RichMail) with SMTP id 2f38623975122ac-7c828;
 Tue, 22 Mar 2022 15:05:13 +0800 (CST)
X-RM-TRANSID: 2f38623975122ac-7c828
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v3 2/2] Rename tas2764.yaml to tas27xx.yaml
Date: Tue, 22 Mar 2022 15:04:38 +0800
Message-Id: <20220322070438.506-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322070438.506-1-13691752556@139.com>
References: <20220322070438.506-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
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


