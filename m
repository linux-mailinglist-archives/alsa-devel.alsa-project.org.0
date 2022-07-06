Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF242568768
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B0EA16F3;
	Wed,  6 Jul 2022 13:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B0EA16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108549;
	bh=X6gV7qcpoldUW0X/zLIOxmQwvsTDnn/XfYDWUERJDe0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q44Ex6YI3y3yIQinAzjziaYwAHQwQEm5A/8VocduXcQTxNqB2IrCrhmkK4WkQli09
	 A9E6RZD6GAAE/Fh7ZLjArPTVtyzW3+IsDQYAWAW9P/eEihUfuGFQqbbTkl5aIGrCM2
	 L096b9DX9wPC5f4/oxQI77qcVcNFc2YuIUU/fwZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160B1F80568;
	Wed,  6 Jul 2022 13:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4425F8055A; Wed,  6 Jul 2022 13:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0FBF80553
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0FBF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SHO8rESg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108371; x=1688644371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X6gV7qcpoldUW0X/zLIOxmQwvsTDnn/XfYDWUERJDe0=;
 b=SHO8rESgKytKGgv1U/5RN4lKAE3PeVV+8s2PZpMU8jwr/0RdjvG1zkPF
 TwenMhbGFkzQT/pDJ2Vi7P5oQfnmVPqa13tC6rY8RpZKUL2QOg47yr+oI
 C7tBvo5KK4PTTVl5lOPZeK4LtSXbM2LPj6NnTq0cx+H+XYKP8U38qY76T
 EpQ/foObr6otRq9g7hpYYtnToNQQxxmk1fIbYLg4T5ZI680sPUO0gpmyw
 3ZnorvmbkR/bpnlpjM8HdFFlf+BtVjLwYOUlbCXgjft/yzDf3TNC/vZWA
 Qnn7Xu3BMHA4IkC9NAAem+QMRFsLz46iXn9ppCbjOPnnJPNJIczjhMuKn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042658"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042658"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136316"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 8/9] ALSA: hda: Remove unused macro definition
Date: Wed,  6 Jul 2022 14:02:29 +0200
Message-Id: <20220706120230.427296-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

It is not used anywhere in the file, so there is no need to keep it.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/ext/hdac_ext_controller.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index b072392725c7..a42f66f561f5 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -14,13 +14,6 @@
 #include <sound/hda_register.h>
 #include <sound/hdaudio_ext.h>
 
-/*
- * maximum HDAC capablities we should parse to avoid endless looping:
- * currently we have 4 extended caps, so this is future proof for now.
- * extend when this limit is seen meeting in real HW
- */
-#define HDAC_MAX_CAPS 10
-
 /*
  * processing pipe helpers - these helpers are useful for dealing with HDA
  * new capability of processing pipelines
-- 
2.25.1

