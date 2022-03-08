Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16464D1DBC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:49:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7110C1852;
	Tue,  8 Mar 2022 17:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7110C1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758145;
	bh=UVmT4vGTjHXhvY2uwKjrUYIq7VIV4m+y5CyPjaSCAus=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=diAOmb00yvmiDE8f4GYgaZoQXOBf/Zbx4lmaNbIe/4PicU7aWtJj5H4Ba/bXPeJ7S
	 hQLWWBBS9a3ZXnGF2GOPRSZaSH5IRi9TDMgPW7KGx+hGX0leN17eSgQfz92MHy7+Ac
	 141SLExwo6o3FT96YKPmW+AcWWy8yL21jqjubX5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0925F80579;
	Tue,  8 Mar 2022 17:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87EBBF8053C; Tue,  8 Mar 2022 17:44:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DA88F80527
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA88F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ffmqEv5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757855; x=1678293855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVmT4vGTjHXhvY2uwKjrUYIq7VIV4m+y5CyPjaSCAus=;
 b=ffmqEv5f4fDJN4HgfntRlBjWtgtPxYcT5qQBJJOoMbp9iDqdzzLK7zuM
 vSUNECvdzDRQRDGzdCztqCKhWXeWImpqQYx0xjEGOyhub+ZOubSM9DsSk
 Jymyn2d802iSovvbSQHyU87uD0I/9rmFaaBV2pAbN/uuIJgITm+lqsAcy
 x/HMQP8Bxe+nEN+2+rMiAktsciKtbjhy/mkvSEgh551JU3flda3XRIb+8
 1CKJodP6iWbgtx8vqE4YbxCeFuEn7jLjvKqbizZFg9iE5eK+n/kU96VoK
 w33xxnjPuopC9OF84GbTdmajwLiEFjMfU1JXd0q2GHnGHX02ZfmZN76n2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307230"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307230"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633259"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:55 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/18] ASoC: SOF: topology: expose some get_token ops
Date: Tue,  8 Mar 2022 08:43:35 -0800
Message-Id: <20220308164344.577647-10-ranjani.sridharan@linux.intel.com>
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

These will be used later on by IPC-specific code.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h |  5 +++++
 sound/soc/sof/topology.c  | 10 +++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f2f32f2065d3..feda5793b589 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -260,4 +260,9 @@ int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev
 			 struct snd_sof_pcm *spcm);
 int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			struct snd_sof_pcm *spcm, int dir, bool free_widget_list);
+int get_token_u32(void *elem, void *object, u32 offset);
+int get_token_u16(void *elem, void *object, u32 offset);
+int get_token_comp_format(void *elem, void *object, u32 offset);
+int get_token_dai_type(void *elem, void *object, u32 offset);
+int get_token_uuid(void *elem, void *object, u32 offset);
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 4ba46ea73c8a..dd1cc6e26686 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -477,7 +477,7 @@ struct sof_topology_token {
 	u32 offset;
 };
 
-static int get_token_u32(void *elem, void *object, u32 offset)
+int get_token_u32(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -486,7 +486,7 @@ static int get_token_u32(void *elem, void *object, u32 offset)
 	return 0;
 }
 
-static int get_token_u16(void *elem, void *object, u32 offset)
+int get_token_u16(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
 	u16 *val = (u16 *)((u8 *)object + offset);
@@ -495,7 +495,7 @@ static int get_token_u16(void *elem, void *object, u32 offset)
 	return 0;
 }
 
-static int get_token_uuid(void *elem, void *object, u32 offset)
+int get_token_uuid(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_uuid_elem *velem = elem;
 	u8 *dst = (u8 *)object + offset;
@@ -505,7 +505,7 @@ static int get_token_uuid(void *elem, void *object, u32 offset)
 	return 0;
 }
 
-static int get_token_comp_format(void *elem, void *object, u32 offset)
+int get_token_comp_format(void *elem, void *object, u32 offset)
 {
 	u32 *val = (u32 *)((u8 *)object + offset);
 
@@ -513,7 +513,7 @@ static int get_token_comp_format(void *elem, void *object, u32 offset)
 	return 0;
 }
 
-static int get_token_dai_type(void *elem, void *object, u32 offset)
+int get_token_dai_type(void *elem, void *object, u32 offset)
 {
 	u32 *val = (u32 *)((u8 *)object + offset);
 
-- 
2.25.1

