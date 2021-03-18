Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA54340889
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 16:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6505716A3;
	Thu, 18 Mar 2021 16:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6505716A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616080562;
	bh=RDUTefOhgWsIpiOxv7kqUxfBXS49FIbq1ZHIWXTp05Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nauoNJFhpVgfgRvcTLz2eE6zBGmUX4v0FRS5k1eOQlvQHPf66LhYzWiaHwpnB93Ar
	 iCc0Rj6r24iRhFpvvg9fG2V63UHCrekFoVjM35pG9nkuGkXvscwpXvQgI4sGROmgD0
	 MjbKg3eHlDoNJ0zThajS9RF9pEABV9Z8Z2jawY5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECECCF80171;
	Thu, 18 Mar 2021 16:13:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B7E4F8032C; Thu, 18 Mar 2021 16:13:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED7BF80171
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 16:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED7BF80171
IronPort-SDR: zPaYaAmSuS5J5e5FLwGrSt3Z5l7RnKkSFml0FpjaAB1ARvlLidk6Wxk1oV8i6kEtLSdhgjzmtU
 FHL1P+3KLTdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209702410"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="209702410"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:13:22 -0700
IronPort-SDR: wruxZErLuv4VgsrUZd/TYeM4LbzfwtLTdDQFHd3iwc67c648wG7yVE2xshxwnBw395w5YTo2v+
 0DVphFAne+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="606207207"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 08:13:21 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ALSA: hda: Change AZX_MAX_BUF_SIZE from 1GB to 4MB
Date: Thu, 18 Mar 2021 16:11:21 +0100
Message-Id: <20210318151122.2493096-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318151122.2493096-1-amadeuszx.slawinski@linux.intel.com>
References: <20210318151122.2493096-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

When SND_HDA_PREALLOC_SIZE is set to 0, applications can request as much
memory as there is allowed. With value of AZX_MAX_BUF_SIZE it is 1GB per
stream, which is not realistic use case. Change it 4MB.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=201251#c322
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hda_register.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 4f987b1f32f7..68d420f3c49d 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -140,8 +140,8 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define BDL_SIZE		4096
 #define AZX_MAX_BDL_ENTRIES	(BDL_SIZE / 16)
 #define AZX_MAX_FRAG		32
-/* max buffer size - no h/w limit, you can increase as you like */
-#define AZX_MAX_BUF_SIZE	(1024*1024*1024)
+/* max buffer size - 4MB limit per stream */
+#define AZX_MAX_BUF_SIZE	(4*1024*1024)
 
 /* RIRB int mask: overrun[2], response[0] */
 #define RIRB_INT_RESPONSE	0x01
-- 
2.25.1

