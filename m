Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 319294D0618
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:13:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696E0172E;
	Mon,  7 Mar 2022 19:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696E0172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676817;
	bh=OdwpZhnkH3fsn24S2qyNFERuNq4To+pJrSgKfRredho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MGrErCdx1FH5kT01ULq5jyl8U4N5ggUHA9OJYx/jD8gX1DIXchxrDKy/9eTbYa5r4
	 HYkYckJB7AW6HwOtBnatC8EqYH0EnB2suC9J9kx1K6XKjpg08tHvx8SeLz+F6s/jiR
	 mTWLdIUqh11TRN6zXMvenSQt4JfQuF4DUHy1SENY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B37AF8052D;
	Mon,  7 Mar 2022 19:11:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53442F80529; Mon,  7 Mar 2022 19:11:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B68C9F802DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68C9F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hefbRIKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676693; x=1678212693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdwpZhnkH3fsn24S2qyNFERuNq4To+pJrSgKfRredho=;
 b=hefbRIKnk9VkHGjLZx7nTI+Fmu7EaMJInqGFJ0Bo0L4hSX+bEU058Awe
 twGeGXcbe7a0Fvenygq4LEpivdKD9RI7fL8iVWJKIlLmmdstLvcokCpCd
 ZO1kl81SANqIOuq7IWuQyPb6iuP6uT5lwNhVPjjlzbkfnfeaDHbpKNMXo
 YKUbdnuEfRzMex6fKQhQX2/UmZDnJLOZuzU4aYmAE/q8LGgAoaTLlK3QN
 B7YKedV3a9QlI6+BiNYWYMAKCaj5+Ri1lbCbrAiyIxiRZe9eEmFrMNTS/
 OBRvjQapnwWU2wKw5+tv/LZxxco0jbQBupsq4cx/hy0rHcDt91nvJUrUl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401321"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401321"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146669"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/18] ASoC: SOF: topology: Modify the get_token op for string
 tokens
Date: Mon,  7 Mar 2022 10:11:01 -0800
Message-Id: <20220307181111.49392-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

