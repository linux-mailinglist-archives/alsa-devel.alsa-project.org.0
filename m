Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EC778A8A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 12:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A214822;
	Fri, 11 Aug 2023 12:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A214822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691748170;
	bh=Q0FeE9mepVvawWUTrmA8FHeBUWLBSzCOoWmLSQVXbQw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t1GG9eQAaG1UPDozaKpoQxNVL0wxOXhx4P4MMIBIDq/5upIHVvpOQ58a1hzo+/B4x
	 NB3oTSfFvxv8aJJmFE9lj7h1STq7M2DTzvJIjCmlBH1F5igUwu0KnVfaO6M574ZqMb
	 SC0iRVDfQxSNMVqAcvteSyMt+eAZitg5Y8lZBTZ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4A6F80552; Fri, 11 Aug 2023 12:01:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 442A6F80134;
	Fri, 11 Aug 2023 12:01:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 657ABF80166; Fri, 11 Aug 2023 12:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F353F80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 12:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F353F80016
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RMfQ03R16zqSfB;
	Fri, 11 Aug 2023 17:58:48 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 18:01:40 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] ASoC: q6dsp: Remove unused declaration
Date: Fri, 11 Aug 2023 18:01:30 +0800
Message-ID: <20230811100130.36664-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Message-ID-Hash: XTNIOWRXMCZHHIQRENPM454EQCZCFR6U
X-Message-ID-Hash: XTNIOWRXMCZHHIQRENPM454EQCZCFR6U
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTNIOWRXMCZHHIQRENPM454EQCZCFR6U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
declared but never implemented these.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 sound/soc/qcom/qdsp6/q6apm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 8ee40732ce9e..f486bd639b9f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -126,7 +126,6 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 				   struct audioreach_module_config *cfg);
 
 /* read/write related */
-int q6apm_send_eos_nowait(struct q6apm_graph *graph);
 int q6apm_read(struct q6apm_graph *graph);
 int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags);
@@ -144,7 +143,6 @@ int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 /* Callback for graph specific */
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
 						    uint32_t mid);
-void q6apm_set_fe_dai_ops(struct snd_soc_dai_driver *dai_drv);
 int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
 
 bool q6apm_is_adsp_ready(void);
-- 
2.34.1

