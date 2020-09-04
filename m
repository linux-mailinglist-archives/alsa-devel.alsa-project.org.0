Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42425D9A4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C4B1B01;
	Fri,  4 Sep 2020 15:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C4B1B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226340;
	bh=AkHFJChKrUGtnWhDCtHQtlETr2FNIaKJ0u0ZP56JemM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVzaBLlcOoIdJJE76kj8pDvRFfqu1Vclhm7Nt3XdUgAC3b1ErJyrorABzA684+FRd
	 KISGsonR/a41qyUte5jYgibY6uE7tRQzHzBLiWS0sLVXL1OQ8tOG5ZqjPybqWe1KMM
	 OqPrvZdaVJd9HokXq6e2WWno3BvosBLTI0hfTOSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2204F802DD;
	Fri,  4 Sep 2020 15:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD456F802C4; Fri,  4 Sep 2020 15:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5CAFF80257
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5CAFF80257
IronPort-SDR: yCkUsdYrciiTtOmbzm/7ed5azTIRwKvLpAotSqmHokOmobhl6k1WW3KgoOduZ7w67fqDBS3mRp
 AKsXwsVVl3lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259555"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:35 -0700
IronPort-SDR: LaAFTiBKB8J53UkmeviZhyGiraffwezU+Y0pW/ks8jug6i5Sp62p7EYSwOKpAxXYyjJBlGLPG3
 eZuOmmFU+Jpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416706"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:33 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 03/16] ASoC: SOF: topology: create component extended tokens
Date: Fri,  4 Sep 2020 16:27:31 +0300
Message-Id: <20200904132744.1699575-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add comp_ext_tokens which will be used to parse all extended tokens,
these tokens will be stored it to struct snd_sof_widget.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d47da407a1bd..0ba0c3921cf0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -492,6 +492,16 @@ static int get_token_u16(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
+static int get_token_uuid(void *elem, void *object, u32 offset, u32 size)
+{
+	struct snd_soc_tplg_vendor_uuid_elem *velem = elem;
+	u8 *dst = (u8 *)object + offset;
+
+	memcpy(dst, velem->uuid, UUID_SIZE);
+
+	return 0;
+}
+
 static int get_token_comp_format(void *elem, void *object, u32 offset, u32 size)
 {
 	struct snd_soc_tplg_vendor_string_elem *velem = elem;
@@ -725,6 +735,13 @@ static const struct sof_topology_token core_tokens[] = {
 		offsetof(struct sof_ipc_comp, core), 0},
 };
 
+/* Component extended tokens */
+static const struct sof_topology_token comp_ext_tokens[] = {
+	{SOF_TKN_COMP_UUID,
+		SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
+		offsetof(struct sof_ipc_comp_ext, uuid), 0},
+};
+
 /*
  * DMIC PDM Tokens
  * SOF_TKN_INTEL_DMIC_PDM_CTRL_ID should be the first token
-- 
2.27.0

