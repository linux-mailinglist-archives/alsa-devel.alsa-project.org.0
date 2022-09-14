Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA95B7EB5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 03:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C098317DE;
	Wed, 14 Sep 2022 03:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C098317DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663120449;
	bh=Qdp0T3B+AeCaacQUKx7FeLBknvnPbsd5dDR2J42eEPY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DXvXS+UU410gT2MHPq+wfv1YOg8pDcsVi5OuI6ZRlZtVcH1sQ4a2rZvMG/zehbnnx
	 p0yUgOhX+n0L9Uu+xhr1asW0LqmbG0DJhQ7iBus+NNxxBcd4iXpyKQQmVGofOyWCQ6
	 wmfyad7iCBK6x2Zce7xvbhlhMETlDSzt76uIVpL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2329AF8016E;
	Wed, 14 Sep 2022 03:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A10F8014E; Wed, 14 Sep 2022 03:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC959F800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 03:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC959F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Aisj/Dl3"
Received: by mail-pg1-x52e.google.com with SMTP id q9so3856969pgq.8
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 18:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SJ2CP/JNtkfOytiVks1nbSpxqs/NusXfw9ckRl6b8Rk=;
 b=Aisj/Dl35O0fbQh5IUvygt3dd/vR7pgWtW3gAC8ta6ttwufZpaofhguP0YZyTKIm3E
 Gus38C009OMLtvCOEsqGXqtCvba+jdxp+8TqWz2njIl3wHTrsLpOK5hLpdmoAf/sqpwn
 8yf+9lccBd4BGF2eQdsKK9i4X7aMoJ+0FWmYdfx6d1zhhZVGGRln4potgO/Jyi7UnhEX
 xuzgqqnlfa3aKwrgmzK4Pu4Hh+R0qTC+q6dAxPUM5WJ8NpdnsQ4UzGocBQGBL0wn2UNl
 d/wO3rBnD8omM0W5yxVkRNXxAc+qK8mTXTvl9WvllgD3gVxV32RcwtTTbW/udNu4pL3j
 Yalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SJ2CP/JNtkfOytiVks1nbSpxqs/NusXfw9ckRl6b8Rk=;
 b=YOSYN5fc1Djtjtovvz9GVu9NstAZa7uegaWHXrWtDzYNX58Oar2OJk/fwWjg49VEdu
 iyyQDjrSJj9ZE+Ird8qf2nn03nlKIkV/2aN8+Y1hW6IBXyRdjfFQSL1UrZ7/C9aYlR6u
 tCI1vLQAjMSq0rm5ha8VfR0IfUhGqqArw0eM79uJO3EouJ+drxB5rQy91OLGJiVRSjY9
 MsaMnoY30GKi6fwUzqX/Fb9AKQoZS5sv6PilgGsCuatQPjlUetPgB0WfQPmHmf6armvV
 iNl22aqUEMuKB3KW3kgMmWmmQp5+XXPWV2bsSHDUPYw0gCgwizKyvSE7cEuITSvY7GWi
 vbkw==
X-Gm-Message-State: ACgBeo0gjiuBHpJmE28dcq1SUbUsLrZRkPZOfJf+/eZTy7GfKlvEvB4V
 jOWy8OBlF4gD6U2wKpRzSkA=
X-Google-Smtp-Source: AA6agR7THUpng+p5RIJX53wLmw2HPRD7n8GuHhRuJgHiiixQxR+Udu21QejCF72Hk9hhx9cCAp7pjg==
X-Received: by 2002:a65:57c2:0:b0:438:ac40:1460 with SMTP id
 q2-20020a6557c2000000b00438ac401460mr17784668pgr.216.1663120380020; 
 Tue, 13 Sep 2022 18:53:00 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0017544b55277sm4353124pli.126.2022.09.13.18.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 18:52:59 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH linux-next] soundwire: intel: Remove unused parameter ret
Date: Wed, 14 Sep 2022 01:52:56 +0000
Message-Id: <20220914015256.22378-1-cui.jinpeng2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, Zeal Robot <zealci@zte.com.cn>,
 Jinpeng Cui <cui.jinpeng2@zte.com.cn>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

The parameter ret = 0 has not been used.
Return 0 directly instead of returning ret.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 drivers/soundwire/intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index b006ae6efcb0..26fdf3577454 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -395,7 +395,6 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
-	int ret = 0;
 	u16 ioctl = 0, act = 0;
 
 	mutex_lock(sdw->link_res->shim_lock);
@@ -427,7 +426,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 
 	mutex_unlock(sdw->link_res->shim_lock);
 
-	return ret;
+	return 0;
 }
 
 static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
-- 
2.25.1

