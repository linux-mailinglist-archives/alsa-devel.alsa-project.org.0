Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287125377E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A346177A;
	Wed, 26 Aug 2020 20:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A346177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467697;
	bh=87DecFNYsZj2Y0qe3/wAUkcL8s83+5CdPT4RlmHfXDY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7dw1emS6KuorRoz3I23oncw+eKRLMKBPhV0jT44Fprqk6IOC387AweBVDrytkPD4
	 u2WfT4kbzP0eKNw/QyQQtmAuAQy19FEONg0ixGdqLJzA+Gq8EFQIbziicJYqApE+pq
	 Sj+K1slWtUmqfLni3S8smnm1oGmsXZzzpu3o26j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730E0F801D9;
	Wed, 26 Aug 2020 20:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75A1BF80257; Wed, 26 Aug 2020 20:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 703ECF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 703ECF80143
IronPort-SDR: AsfQUZIExtZ5ET5rnXG1pH3M1Q8ceobOqOJv5yWY3DQUNj9pu2Gju657xAUp7Bj22oizHRu8lv
 mNPjIPVuVNIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418611"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:43 -0700
IronPort-SDR: U9E3UC+facEc24j1W57VvO8EDmCywHmIVVryaEnWGU9YldyQfPTSi45OjBmjcYamgxH5b7an/X
 lT+z3hE3G5mw==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347325"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:43 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ALSA: hda: fix VS_LTRC register name
Date: Wed, 26 Aug 2020 11:45:25 -0700
Message-Id: <20200826184532.1612070-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

It should be called VS_LTRP instead.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/hda_register.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 057d2a2d0bd0..4f987b1f32f7 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -119,7 +119,7 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_REG_VS_EM3U			0x103C
 #define AZX_REG_VS_EM4L			0x1040
 #define AZX_REG_VS_EM4U			0x1044
-#define AZX_REG_VS_LTRC			0x1048
+#define AZX_REG_VS_LTRP			0x1048
 #define AZX_REG_VS_D0I3C		0x104A
 #define AZX_REG_VS_PCE			0x104B
 #define AZX_REG_VS_L2MAGC		0x1050
-- 
2.25.1

