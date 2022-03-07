Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD24D061C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:14:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826271753;
	Mon,  7 Mar 2022 19:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826271753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676884;
	bh=UVmT4vGTjHXhvY2uwKjrUYIq7VIV4m+y5CyPjaSCAus=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GAZeDkNpFOvaFKLlrlJ/jgoX5fWw+Abrbpd79QBAtk7SpSC/OvvkZKV6/R82EOgap
	 BmDo0kuz6PX1ZpLBDwm5/TVMDywJMm4G9cYr3L1ZBW3gGo57ToRdy/ism0YRDAZcu6
	 lvkGjgnzykA/h7D0nC+FJlIENCBUOmu5+fxhda+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0536F8053E;
	Mon,  7 Mar 2022 19:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4EDF80516; Mon,  7 Mar 2022 19:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54BA8F80515
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BA8F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ce7FlvYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676694; x=1678212694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVmT4vGTjHXhvY2uwKjrUYIq7VIV4m+y5CyPjaSCAus=;
 b=ce7FlvYFDcNChWEhIDxwDmJVVW76edf193PO/9e9e+zcUa0iRGWBPkZq
 V29OAPuLVKyIt+GEahmBih3RLlgI6+w2klyqqv1bbCk7CzICyw96QfS3B
 YUQKenhWvc6bgK2YPvgO/5NPG5qHPdkmZU7vtcM4+WK67tkXYB5riBDNS
 5EB0s3s2hkeL3/S0OkZRuS5L7ef4gnRu+ki9nfk7FxFBq/gUfpWwacqd9
 YGg+ujqS2e/gjO+eQOUbOcXla9H+x9TL+IsFRRX7Sqh370S5t9dYTaIGq
 TlR36+F5WcO2jkCbgXOlMHlibKhAgWlMR0L/ENkRgiAkA8O6DaiNLNPuU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401325"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401325"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146671"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/18] ASoC: SOF: topology: expose some get_token ops
Date: Mon,  7 Mar 2022 10:11:02 -0800
Message-Id: <20220307181111.49392-10-ranjani.sridharan@linux.intel.com>
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

