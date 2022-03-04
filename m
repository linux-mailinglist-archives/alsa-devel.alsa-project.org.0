Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BE4CDF7C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098041F64;
	Fri,  4 Mar 2022 22:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098041F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427723;
	bh=dlnz41BToMVoyN+d+Plv/ONQL8of7aQtU/btBYSsJE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDV0O3VLBjs3Tso/JqMFTMvxXu9Z4yT6+2ny5EWnNKH69w8HvjS/+yFrEG4+ogfii
	 KrLYZG12A0+bMqp37JQ+zw4L/8FNpx4siPwxkjNSFevEzzXHvLXIb/JabcuEGxbfE5
	 DP2fhqZMfBDaahKiv6HvnNz+HT+H24saEsGo7sSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB3FF80558;
	Fri,  4 Mar 2022 21:58:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1293EF80528; Fri,  4 Mar 2022 21:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D040EF80517
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D040EF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YiovmkA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427472; x=1677963472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlnz41BToMVoyN+d+Plv/ONQL8of7aQtU/btBYSsJE4=;
 b=YiovmkA1K4N+hE3lrOY9Pwti4e0QljDsw36A2U9iJJpAsKlNOX10Gdsc
 mVbvrSuU2dP0e1p1MzQfrbS6SDCRAGTssFrsmmwWEdFQYQSzSv/RHrQGl
 1OgGJkhvhTu69w3OneNLgcjHr3LXq+IAjQZ0rmIUzaLkWuiDX2jQxRErN
 HEc46fEbVKUHXmfaLZ45N5tAJOayETjOy9Jd1r1FuYUP9zPLOY77U0XmJ
 zFypn0A+/Q4NHXuqnMoL4RqXBtVkFDIwepytBT+rL3kPMjyodhTgA9ihJ
 OaHsaJSAT9x0WUcpydMPJAP8p5uA1rLwbJ4KwD4VDP8djou9KKz6HHEWS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492554"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492554"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271298"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: SOF: fix 32 signed bit overflow
Date: Fri,  4 Mar 2022 14:57:31 -0600
Message-Id: <20220304205733.62233-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Liam Girdwood <liam.r.girdwood@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>
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

From: Curtis Malainey <cujomalainey@chromium.org>

Shifting in a signed 32bit container past the signed bit is technically
undefined behaviour. Fix by using unsigned types. Found via cppcheck.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/header.h   | 2 +-
 include/uapi/sound/sof/abi.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index b97a76bcb655..b22e925c70e2 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -31,7 +31,7 @@
 
 /* Global Message - Generic */
 #define SOF_GLB_TYPE_SHIFT			28
-#define SOF_GLB_TYPE_MASK			(0xfL << SOF_GLB_TYPE_SHIFT)
+#define SOF_GLB_TYPE_MASK			(0xfUL << SOF_GLB_TYPE_SHIFT)
 #define SOF_GLB_TYPE(x)				((x) << SOF_GLB_TYPE_SHIFT)
 
 /* Command Message - Generic */
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index f4232d289a22..e052653a6e4c 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -27,7 +27,7 @@
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
 #define SOF_ABI_MINOR 19
-#define SOF_ABI_PATCH 0
+#define SOF_ABI_PATCH 1
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
 #define SOF_ABI_MAJOR_SHIFT	24
-- 
2.30.2

