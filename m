Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99224D1DBF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:49:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780ED1878;
	Tue,  8 Mar 2022 17:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780ED1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758179;
	bh=OdwpZhnkH3fsn24S2qyNFERuNq4To+pJrSgKfRredho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etu4m3WI1C2YfAQ1ajFEct6yDti/45cfKuk3pJM2LYytAI2mi7z+J+VCGuD1TF+4i
	 I9n95nUE28lCZIMnWElFghloaPfbYL6us+0b+9PbE63FuvtvEDG7QObWg2RzAwKdFH
	 LJ2NjCWv56z5FWRmIgFsvmiFndjqsGaiV/Lb/gwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC94EF805A1;
	Tue,  8 Mar 2022 17:44:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8BE8F80544; Tue,  8 Mar 2022 17:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C9FF80529
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C9FF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BVU5Mt3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757855; x=1678293855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdwpZhnkH3fsn24S2qyNFERuNq4To+pJrSgKfRredho=;
 b=BVU5Mt3wU13TO5TAMrdRotkeQYJWu/LVG526GJPIpk8TIhULNQ6MPMRW
 2jayojTsFFF1r6019rrU4nlRY165Y2ubNecmsvxI8zlMTO5fEvyUOAmD8
 uj8vFst5XlLBwAXGyOi2c/iSCjIJMiP0NrlPM6JNScGTI/yGfDDODW4GG
 AqKGrjaiAYu4MsgwaleWVKLBH7cq69SZmAef7zhkVfZL2vuoxHgSBRjBN
 mjXY6Nh6ZruoBieFAzlBMfCnX3alCU95+sRaXFsJg48pKi8cNQ1mbDb+T
 ohh2XoR/O2TLia4edwqXl5B3xi0j9FDnfJ/srXpTzGmrKAUecW4k69Vyc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307228"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307228"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633253"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:55 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/18] ASoC: SOF: topology: Modify the get_token op for
 string tokens
Date: Tue,  8 Mar 2022 08:43:34 -0800
Message-Id: <20220308164344.577647-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Modify the get_token op for string type tokens to pass the string as the
argument instead of a pointer to struct snd_soc_tplg_vendor_string_elem.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 7280e14c13bc..4ba46ea73c8a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -507,28 +507,25 @@ static int get_token_uuid(void *elem, void *object, u32 offset)
 
 static int get_token_comp_format(void *elem, void *object, u32 offset)
 {
-	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
 
-	*val = find_format(velem->string);
+	*val = find_format((const char *)elem);
 	return 0;
 }
 
 static int get_token_dai_type(void *elem, void *object, u32 offset)
 {
-	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
 
-	*val = find_dai(velem->string);
+	*val = find_dai((const char *)elem);
 	return 0;
 }
 
 static int get_token_process_type(void *elem, void *object, u32 offset)
 {
-	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
 
-	*val = find_process(velem->string);
+	*val = find_process((const char *)elem);
 	return 0;
 }
 
@@ -872,8 +869,7 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 				continue;
 
 			/* matched - now load token */
-			tokens[j].get_token(elem, object,
-					    offset + tokens[j].offset);
+			tokens[j].get_token(elem->string, object, offset + tokens[j].offset);
 
 			found++;
 		}
-- 
2.25.1

