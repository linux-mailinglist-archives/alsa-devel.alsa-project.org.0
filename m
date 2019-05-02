Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E8117D4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6B217B1;
	Thu,  2 May 2019 13:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6B217B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795008;
	bh=lyo1Spgk7RAemDjfCkEqM5aRBF/rgTjpmVrUsV97uKY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gCzKoJbxiyxddAsfZQ6eF3HF1eY+/wr8XEM6CUB4Qnzx+1kqevXPqpD/jBX10M86W
	 dpHw+cV74wdNVxiWZYoRNWOWugsqU9K4d81g0c/rVe698aNIvkVwkdwD/H7jbsA3Jr
	 5t089Es6iJb/NOpX3g/tfKR0wUOyR/agrZb0sxog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB48F89726;
	Thu,  2 May 2019 13:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08A2CF896C7; Thu,  2 May 2019 13:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8036BF896AA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8036BF896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZlGWY5wN"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D379B20B7C;
 Thu,  2 May 2019 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794817;
 bh=iS2hVzhzVR6TtoehIvAQ1KUG3qW3EM01lIsvom4urUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZlGWY5wNdju3H0I1w5Do4lMDwj/Mwtahm8fQhOkTIz1odNZdbGrzbBQkG6K/Y56vL
 liu1tAeBBZodrxBR2wIrFeXivaOZCog3zZ2Vs4syaAl3c7l7myhH+mDOGCVxDam4Gi
 ++wwYFriMSqiYQfOE4rdRWwdlXYlEKspXM5Kr/j0=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:18 +0530
Message-Id: <20190502105930.9889-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 02/14] soundwire: fix SPDX license for header
	files
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

Some more headers had C++ style SDPX line, fix that and change copyright
so that it is consistent with rest of the code in subsystem

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw.h           | 4 ++--
 include/linux/soundwire/sdw_registers.h | 4 ++--
 include/linux/soundwire/sdw_type.h      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index df313913e856..d9102af5e26c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1,5 +1,5 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-// Copyright(c) 2015-17 Intel Corporation.
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SOUNDWIRE_H
 #define __SOUNDWIRE_H
diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index df472b1ab410..e75b2e3cf93d 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -1,5 +1,5 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-// Copyright(c) 2015-17 Intel Corporation.
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SDW_REGISTERS_H
 #define __SDW_REGISTERS_H
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index 9fd553e553e9..b7e198a035c9 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -1,5 +1,5 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright(c) 2015-17 Intel Corporation.
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SOUNDWIRE_TYPES_H
 #define __SOUNDWIRE_TYPES_H
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
