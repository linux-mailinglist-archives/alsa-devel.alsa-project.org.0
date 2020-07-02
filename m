Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC2212D46
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFB6168F;
	Thu,  2 Jul 2020 21:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFB6168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719063;
	bh=8hBFcs5Rc6PhMTs+zTE2ziVxO9A8GNYJBtND5DYUF8k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ni+ddSjR5iO+SKUbOx96cW7+6vCUwLjIfRltw3lsmA2KflheWyNGzECvV5XCHkB0f
	 FCnQ9iOUlnNMmBllVO9vA/beVf29KGgWA2GqamGQIYjOlnzVFnsU8BHTifsE2aa7+z
	 Ne/Xwtdyl6H8/7Yg40P5Kp/VNhrO7cz6+dYPR1YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7F5F80329;
	Thu,  2 Jul 2020 21:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9135EF80306; Thu,  2 Jul 2020 21:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 885BEF800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 885BEF800C1
IronPort-SDR: FSK91FTw59nj8THdf3zAy5ZhNBkzJfse5GOqFIZT1jRqpIyk87G1v/L6YgI37FpJnF1n1IXP0c
 ltS8ULvmSctA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549349"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:23 -0700
IronPort-SDR: f4RmA881acVhkASToaXAYn1bjGO6QuXIXqU4hq1T2tAwxZHIZA2zNXD6LfbIkFAl+hddIlWfZM
 LU73PJWYiuNg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116374"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 09/23] ALSA: pci/ctxfi: fix kernel-doc warnings
Date: Thu,  2 Jul 2020 14:35:50 -0500
Message-Id: <20200702193604.169059-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. The files contain formatting that isn't kernel-doc.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/ctxfi/cthardware.c | 2 +-
 sound/pci/ctxfi/cthw20k1.c   | 2 +-
 sound/pci/ctxfi/cthw20k2.c   | 2 +-
 sound/pci/ctxfi/ctimap.c     | 2 +-
 sound/pci/ctxfi/ctmixer.c    | 2 +-
 sound/pci/ctxfi/ctpcm.c      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ctxfi/cthardware.c b/sound/pci/ctxfi/cthardware.c
index 9b7e63f4a3a7..1d5064486217 100644
--- a/sound/pci/ctxfi/cthardware.c
+++ b/sound/pci/ctxfi/cthardware.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthardware.c
diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 015c0d676897..108ab449c968 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthw20k1.c
diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index ce44cbe6459f..fc1bc18caee9 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthw20k2.c
diff --git a/sound/pci/ctxfi/ctimap.c b/sound/pci/ctxfi/ctimap.c
index eb1825e13fc5..d5a53d2f5f15 100644
--- a/sound/pci/ctxfi/ctimap.c
+++ b/sound/pci/ctxfi/ctimap.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctimap.c
diff --git a/sound/pci/ctxfi/ctmixer.c b/sound/pci/ctxfi/ctmixer.c
index 84514dc90d87..6797fde3d788 100644
--- a/sound/pci/ctxfi/ctmixer.c
+++ b/sound/pci/ctxfi/ctmixer.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctmixer.c
diff --git a/sound/pci/ctxfi/ctpcm.c b/sound/pci/ctxfi/ctpcm.c
index 6ee6a9675ca5..3f48ad0e27e7 100644
--- a/sound/pci/ctxfi/ctpcm.c
+++ b/sound/pci/ctxfi/ctpcm.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctpcm.c
-- 
2.25.1

