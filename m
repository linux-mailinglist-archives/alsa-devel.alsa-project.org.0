Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A422255E81
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 18:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C085518CA;
	Fri, 28 Aug 2020 18:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C085518CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598630709;
	bh=34AztJuKEiX/5z+vXP6aicAAjoSricXKar1XdieHfHY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzN3GfeqTQLh0lUDYGpAwK/wjsfdLQny3LzqSEU1gL2yzBwfIi9Epos03SZlevVvk
	 iDG2PtVM17uDX/ApoMSGt+Xm5XYTWQNuuvGQD/YUwcGyaclR2W3e1scbbbDwf2yYNK
	 avnGA5Kc+VSMr02Tw0ZUZKUB4T5vBvhqcgnBo4nE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7140F80143;
	Fri, 28 Aug 2020 18:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71A40F80118; Fri, 28 Aug 2020 18:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C409FF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 18:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C409FF80118
IronPort-SDR: kWC5hJZ5kUPYNfMnjTBCY5FJtR8H2Wwuqkh/1AI2qq4Z9i84o0rZLsVrZpeg3RNdt/5JUIMEsp
 J6SQ8DNifSPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="218243798"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
 d="scan'208,223";a="218243798"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:03:11 -0700
IronPort-SDR: W3KWLNyPJ76Hv/aa83oxabJIlMh0kpUCgj3wKuGh3wYIZ4mtkEoP4s0aIsakp3CGe0N51NFS2D
 f1UnO/OkUhBQ==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
 d="scan'208,223";a="374103471"
Received: from nyriley-mobl1.amr.corp.intel.com (HELO [10.212.51.95])
 ([10.212.51.95])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:03:10 -0700
Subject: Re: [PATCH 1/9] soundwire: define and use addr bit masks
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200828072101.3781956-1-vkoul@kernel.org>
 <20200828072101.3781956-2-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ae0f448-afb8-bcd6-b494-a7014ed88c11@linux.intel.com>
Date: Fri, 28 Aug 2020 11:03:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828072101.3781956-2-vkoul@kernel.org>
Content-Type: multipart/mixed; boundary="------------6E7563E7AF02904EDBA1AA4B"
Content-Language: en-US
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This is a multi-part message in MIME format.
--------------6E7563E7AF02904EDBA1AA4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinod,
This change to use FIELD_PREP/GET looks good, the code is indeed a lot 
clearer, but ...

> +#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, addr)
> +#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, addr)
> +#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, addr)
> +#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, addr)
> +#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, addr)
> +#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, addr)

...our CI stopped on a compilation error with these macros. You will 
need the patch1 attached.

Patch 9 also introduces conflicts with the multi-link code (fix in 
patch2), so would you mind if we go first with the multi-link code, or 
defer patch9 for now?

Our validation for CML w/ RT700 is at:
https://github.com/thesofproject/linux/pull/2404

We will also test on machines that are not in the CI farm and provide 
feedback.

Thanks
-Pierre


--------------6E7563E7AF02904EDBA1AA4B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fixup-soundwire-define-and-use-addr-bit-masks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-fixup-soundwire-define-and-use-addr-bit-masks.patch"

From 3aba5a7229c904664dacf1843f2e925585d4bd3e Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 28 Aug 2020 10:45:22 -0500
Subject: [PATCH 1/2] fixup! soundwire: define and use addr bit masks

s/addr/adr

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 892bf4718bc3..ebfabab63ec9 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -472,12 +472,12 @@ struct sdw_slave_id {
 #define SDW_PART_ID_MASK	GENMASK(23, 8)
 #define SDW_CLASS_ID_MASK	GENMASK(7, 0)
 
-#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, addr)
-#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, addr)
-#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, addr)
-#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, addr)
-#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, addr)
-#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, addr)
+#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, adr)
+#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, adr)
+#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, adr)
+#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, adr)
+#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, adr)
+#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, adr)
 
 /**
  * struct sdw_slave_intr_status - Slave interrupt status
-- 
2.25.1


--------------6E7563E7AF02904EDBA1AA4B
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-soundwire-intel-use-FIELD_PREP-macro.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-soundwire-intel-use-FIELD_PREP-macro.patch"

From f0280ed5dbe284df628e58c5afa1e61452cd5cb8 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 28 Aug 2020 10:51:52 -0500
Subject: [PATCH 2/2] soundwire: intel: use FIELD_PREP macro

Follow upstream changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 566c7a99a5c1..20f111ce8a7a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -381,10 +381,11 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 		link_control = intel_readl(shim, SDW_SHIM_LCTL);
 
 		/* only power-up enabled links */
-		spa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
-		cpa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
+		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK,
+				      sdw->link_res->link_mask);
+		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK,
+				      sdw->link_res->link_mask);
+
 
 		link_control |=  spa_mask;
 
@@ -555,10 +556,11 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 		link_control = intel_readl(shim, SDW_SHIM_LCTL);
 
 		/* only power-down enabled links */
-		spa_mask = (~sdw->link_res->link_mask) <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
-		cpa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
+		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK,
+				      ~sdw->link_res->link_mask);
+
+		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK,
+				      sdw->link_res->link_mask);
 
 		link_control &=  spa_mask;
 
-- 
2.25.1


--------------6E7563E7AF02904EDBA1AA4B--
