Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A02596A9D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 09:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 337C6100;
	Wed, 17 Aug 2022 09:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 337C6100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660722620;
	bh=4VUtyrODzyAAr8Mx+uTQQ1ZptgLFQWCLkj3WewHvYtc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VWknhxZ5IwJ5VhZf1Rj2K6Hc3WfFc17hZE14QO8RB5GOfAZQ0pAOUcWLWVFkZABPB
	 QZmV/BhLD3xav7v4ZeXmNfHYBJZeaN/zuuw1AaukmuWUOKO7+81MWw43EhtByAi9mP
	 TKMYFBmIzlpNKfL7LXh/hdYTElxhJyDq0Miodz5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3A4F802D2;
	Wed, 17 Aug 2022 09:49:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA6F0F8025C; Wed, 17 Aug 2022 09:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B5E3F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 09:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B5E3F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fj7UGrTD"
Received: by mail-pg1-x530.google.com with SMTP id bh13so11337236pgb.4
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DNiQd09UafzK11FBkwcs+iSGy+8QGplgYWkm+nS++S0=;
 b=fj7UGrTDJkbe4FoWiYArk+SAIZwBIpOJ3w5z2iz5JNOUtWcHb2r3IvrOOq338ytPo4
 mL9IX54+RP2R5Yrq0rHXROHF39LMDOtiWAx3vrEgr+q8R+Vd7ctvJgALho5IoPZ/PQ6a
 /1bQIoUFBmlFR/5RKc/xOfICfR2SYgfJBw2hFk0qBAU1B2BR6DywKDtUK3zkIjsf6TxK
 G0+JOE1ux1SC+iqIof0qxj+SxF6vafmOVvllp98ElKt/z3eilm9+dGeiAnkkzSIymD2R
 T2icDVH+2Q9u17KY2yi5QZbN0pkGaaTAkz4QOb2upf1r19YyEdz91stc1zCJe1hZj4kQ
 cK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DNiQd09UafzK11FBkwcs+iSGy+8QGplgYWkm+nS++S0=;
 b=GCPz/I1cnCjkNSfyb+CLnXWZrASvIQmBOS+bp7ObMwE7WDv3xC3nhDxk64m43JEmE6
 obqyeT0DpwZme4g20Xyb3FCH4RdLKMz1AOW+2aDgtJtJZZOLLQbDr2ptebUS4zG3bLbb
 4oOKfJAoCNLUI6Sd4r19G3D5nWar0It4nEGlZKCOKhqdbpeEvydsmx2Ko16Q2vxgpPC8
 ajOu0mX/mQuZPRK7CC2yA7bmV4KjnkG0YMQJ6taQbdzWp3p62awrCL/J9cBHWxPa5I3S
 sxMM9BD3GK5NcEnsrk1myetqve8KxxPjlxrrMNdPzGOQQ3SYUIj048+az+tz9Etywy6r
 zXew==
X-Gm-Message-State: ACgBeo2UwcCYxL6pEJebZlcyoafMbhxix4qQcEgFYS/RqWVbfz1ePhbk
 jPez0DWRNApEWLQsNqgDo1A=
X-Google-Smtp-Source: AA6agR4vHtGkmizUZ/tTkNHmlQg+RREpiDotcib74icakxpdWZ1be5OldVWCoVxw1rPgpIsSgCXIvg==
X-Received: by 2002:a63:8b43:0:b0:41c:cb91:2c47 with SMTP id
 j64-20020a638b43000000b0041ccb912c47mr20548848pge.609.1660722549845; 
 Wed, 17 Aug 2022 00:49:09 -0700 (PDT)
Received: from fedora.. ([103.230.104.51]) by smtp.gmail.com with ESMTPSA id
 b14-20020a170902650e00b00172a2a41064sm427208plk.298.2022.08.17.00.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:49:09 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 linux-next] soundwire: intel: Remove unnecessary TODO
Date: Wed, 17 Aug 2022 13:48:59 +0600
Message-Id: <20220817074859.4759-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Khalid Masum <khalid.masum.92@gmail.com>
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

The capabilities enabled for multi-link are required as part of the
programming sequences, even when a stream uses a single link we still
use the syncArm/syncGo sequences. Therefore the TODO is no longer
necessary.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Previous discussions:
- v2 Link: https://lore.kernel.org/lkml/20220816175954.5259-1-khalid.masum.92@gmail.com/
- v1 Link: https://lore.kernel.org/lkml/20220814080416.7531-1-khalid.masum.92@gmail.com/

Changes since v2:
- Update commit title.

Changes since v1:
- Remove the todo, leave rest of the code as is.
- Update commit message.

 drivers/soundwire/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8d4000664fa3..18158825a6d8 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -75,7 +75,6 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	/*
 	 * Initialize multi_link flag
-	 * TODO: populate this flag by reading property from FW node
 	 */
 	bus->multi_link = false;
 	if (bus->ops->read_prop) {
-- 
2.37.1

