Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DAE7C9938
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Oct 2023 15:47:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620AE868;
	Sun, 15 Oct 2023 15:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620AE868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697377642;
	bh=QP+XkK0m9P2yYvBKdtljbcAXsrYp/xyq9j9O8Q02ItU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h39TUDiYbyUwZoJeAMh/B00cxXTJUYPFBczFD6n4u+GzYZdJCIA1pnkKARahsJCoK
	 j8UYwHtP5fNH/Jur3onqWnZzJDEd0pE9jdZSWfyfeXblTTJDkTXLzduttPzEGCvLvp
	 5Z+RVgQnjdFsOArJbnj2u83IBgHXCeDd5c+dFvBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D08DEF8057B; Sun, 15 Oct 2023 15:45:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43FC6F80571;
	Sun, 15 Oct 2023 15:45:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13CABF8027B; Sat, 14 Oct 2023 19:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de
 [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19D76F802E8
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 19:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D76F802E8
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id 874741C0728;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
Received: from fluffy-mammal.fritz.box
 (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
	by srv01.abscue.de (Postfix) with ESMTPSA id 2BA9F1C072A;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Date: Sat, 14 Oct 2023 19:26:22 +0200
Message-Id: <20231014172624.75301-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231014172624.75301-1-otto.pflueger@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SL43QPUIXMBWXKC2MYYCHR3BJQANE2WI
X-Message-ID-Hash: SL43QPUIXMBWXKC2MYYCHR3BJQANE2WI
X-Mailman-Approved-At: Sun, 15 Oct 2023 13:43:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SL43QPUIXMBWXKC2MYYCHR3BJQANE2WI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a q6core_get_adsp_version() function that returns the version of the
ADSP firmware (2.6, 2.7 or 2.8), also known as the AVS version (see [1]
in downstream kernel).

Some APIs differ between these versions, e.g. the AFE clock APIs.

[1]: https://github.com/msm8916-mainline/linux-downstream/blob/LA.BR.1.2.9.1_rb1.5/sound/soc/msm/qdsp6v2/q6core.c#L193

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6core.c | 61 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6core.h |  9 ++++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 49cfb32cd209..ea6232645c80 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -20,6 +20,9 @@
 #define AVCS_CMDRSP_ADSP_EVENT_GET_STATE	0x0001290D
 #define AVCS_GET_VERSIONS       0x00012905
 #define AVCS_GET_VERSIONS_RSP   0x00012906
+#define AVCS_CMDRSP_Q6_ID_2_6	0x00040000
+#define AVCS_CMDRSP_Q6_ID_2_7	0x00040001
+#define AVCS_CMDRSP_Q6_ID_2_8	0x00040002
 #define AVCS_CMD_GET_FWK_VERSION	0x001292c
 #define AVCS_CMDRSP_GET_FWK_VERSION	0x001292d
 
@@ -63,6 +66,7 @@ struct q6core {
 	bool get_state_supported;
 	bool get_version_supported;
 	bool is_version_requested;
+	enum q6core_version adsp_version;
 };
 
 static struct q6core *g_core;
@@ -108,6 +112,14 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 		if (!core->fwk_version)
 			return -ENOMEM;
 
+		/*
+		 * Since GET_VERSIONS is not called when GET_FWK_VERSION
+		 * is successful and these commands may return completely
+		 * different versions, assume that the version is 2.8 here.
+		 * Older versions do not support GET_FWK_VERSION and we do
+		 * not care if the version is newer than 2.8.
+		 */
+		core->adsp_version = Q6_ADSP_VERSION_2_8;
 		core->fwk_version_supported = true;
 		core->resp_received = true;
 
@@ -115,6 +127,7 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 	}
 	case AVCS_GET_VERSIONS_RSP: {
 		struct avcs_cmdrsp_get_version *v;
+		int i;
 
 		v = data->payload;
 
@@ -125,6 +138,28 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 		if (!core->svc_version)
 			return -ENOMEM;
 
+		for (i = 0; i < g_core->svc_version->num_services; i++) {
+			struct avcs_svc_info *info;
+
+			info = &g_core->svc_version->svc_api_info[i];
+			if (info->service_id != APR_SVC_ADSP_CORE)
+				continue;
+
+			switch (info->version) {
+			case AVCS_CMDRSP_Q6_ID_2_6:
+				core->adsp_version = Q6_ADSP_VERSION_2_6;
+				break;
+			case AVCS_CMDRSP_Q6_ID_2_7:
+				core->adsp_version = Q6_ADSP_VERSION_2_7;
+				break;
+			case AVCS_CMDRSP_Q6_ID_2_8:
+				core->adsp_version = Q6_ADSP_VERSION_2_8;
+				break;
+			}
+
+			break;
+		}
+
 		core->get_version_supported = true;
 		core->resp_received = true;
 
@@ -293,6 +328,31 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 }
 EXPORT_SYMBOL_GPL(q6core_get_svc_api_info);
 
+/**
+ * q6core_get_adsp_version() - Get the core version number.
+ *
+ * Return: version code or Q6_ADSP_VERSION_UNKNOWN on failure
+ */
+enum q6core_version q6core_get_adsp_version(void)
+{
+	int ret;
+
+	if (!g_core)
+		return Q6_ADSP_VERSION_UNKNOWN;
+
+	mutex_lock(&g_core->lock);
+	if (!g_core->is_version_requested) {
+		if (q6core_get_fwk_versions(g_core) == -ENOTSUPP)
+			q6core_get_svc_versions(g_core);
+		g_core->is_version_requested = true;
+	}
+	ret = g_core->adsp_version;
+	mutex_unlock(&g_core->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(q6core_get_adsp_version);
+
 /**
  * q6core_is_adsp_ready() - Get status of adsp
  *
@@ -334,6 +394,7 @@ static int q6core_probe(struct apr_device *adev)
 	dev_set_drvdata(&adev->dev, g_core);
 
 	mutex_init(&g_core->lock);
+	g_core->adsp_version = Q6_ADSP_VERSION_UNKNOWN;
 	g_core->adev = adev;
 	init_waitqueue_head(&g_core->wait);
 	return 0;
diff --git a/sound/soc/qcom/qdsp6/q6core.h b/sound/soc/qcom/qdsp6/q6core.h
index 4105b1d730be..472e06bf8efc 100644
--- a/sound/soc/qcom/qdsp6/q6core.h
+++ b/sound/soc/qcom/qdsp6/q6core.h
@@ -9,7 +9,16 @@ struct q6core_svc_api_info {
 	uint32_t api_branch_version;
 };
 
+/* Versions must be in order! */
+enum q6core_version {
+	Q6_ADSP_VERSION_UNKNOWN,
+	Q6_ADSP_VERSION_2_6,
+	Q6_ADSP_VERSION_2_7,
+	Q6_ADSP_VERSION_2_8,
+};
+
 bool q6core_is_adsp_ready(void);
+enum q6core_version q6core_get_adsp_version(void);
 int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo);
 
 #endif /* __Q6CORE_H__ */
-- 
2.39.2
