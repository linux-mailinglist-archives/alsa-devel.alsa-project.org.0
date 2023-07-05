Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF007484CF
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 15:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546863E8;
	Wed,  5 Jul 2023 15:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546863E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688563187;
	bh=tEO7wCI9WNvGIuDbdYMNGlyUNCel681KJY53a+77+Qg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mv5jx2R/epc66FWyrWyBBcFxTZtPi5l3LYfMDlwQnNg1W7gh4AAmwYMDY3CHzbmsD
	 ISm0UxPOUZ/onmRhNo1OQT5VbLkTwzARPY306sIUnj1JGpLUYWCTBlsACDGRUuxl+/
	 apAhgNBhjRSYas5VlUoXAqnOAx+foeQhZ7tSR6hw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C48FDF80100; Wed,  5 Jul 2023 15:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A163F80124;
	Wed,  5 Jul 2023 15:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F9A4F80125; Wed,  5 Jul 2023 15:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA431F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 15:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA431F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gUabt4/v
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so7546064f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688563126; x=1691155126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqzFoVlqZuDwdBeJJ7onmWROcWP+Ot6gtGdl2eC6RO8=;
        b=gUabt4/ve2Donhp0sXBcgmdz/tHeUFmWmL0Lom+e1nOg5zE4ae1XOMOe0QBwxBO5wI
         1dIMgLF9R77E5ea6KSF5orZpSJOWqmxWemJTRd/bSY7hryxOMsE9QTYddZhrWPBo87D7
         Qkdpcf+FxgdEWTGteSrjaRWK78i8ZViWAzFhdmhmgxc8K90Lhl4YjBHHxsPN8/wIOecn
         gMTsB5Tr2nj9NI0vY/udOBI2380OJuGaWMPfTj+Rx6Y/OSFxx/KxzwRDS/qN/qq3btg7
         8i40il+M5P8Vbwxk8eds3tIaj3H86465/ckbZlOdD1b2nFUbmxK4YCpfak8UfIYySvg2
         oN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688563126; x=1691155126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqzFoVlqZuDwdBeJJ7onmWROcWP+Ot6gtGdl2eC6RO8=;
        b=NCoxLwlscIFII7Jift3O9dFVwBVr8uCnntIVMkJSmibf7VTXQ/mUJ99e1tDy+Yj8um
         Kpw4h5urOnFbWYTxoiN2H0gfWwYrWdr7z5/sZjhtXsewfuZic1lEG66/fU1+MDwQq8iY
         jY6l3w5umNiDqNbRjtXVeV0R5XWVcmemLQ5jY7oS0z0B3tX53vfbOh1+QyczaQq/bTbl
         +5Uqmty0WhR66Fyc2WFzUnb0sSDu20roWP0wNnjW7IvMQbp4jq6qNcFmWyFm0o3krQve
         hJBIuW57M1JJZJzmre59FsKxbaHzucRFTCwF3Ds4I3VSzT0+dRPQ2TaoyCBQI5JAJ4tI
         TDpA==
X-Gm-Message-State: ABy/qLZUguUpnHdR0K8J3s0UKKD1e0dB+H8ExUyv4rfRpO5689oIfgm4
	TNqPzexWfdm59gm94d+XjjfsRQ==
X-Google-Smtp-Source: 
 APBJJlGCd/oXUcfMR2PQ3fB8oIV+msgPR5klhkS/pC3rfwvF4Q+QaZjxFbfcCOSNSN8LYy4lTE1NMg==
X-Received: by 2002:adf:f282:0:b0:313:eb29:4436 with SMTP id
 k2-20020adff282000000b00313eb294436mr13789647wro.67.1688563126524;
        Wed, 05 Jul 2023 06:18:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm31230039wrb.84.2023.07.05.06.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:18:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: qcom: q6apm: do not close GPR port before closing graph
Date: Wed,  5 Jul 2023 14:18:42 +0100
Message-Id: <20230705131842.41584-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPKR2EP52S7NBJTR7OV7HA6LRQIEYP43
X-Message-ID-Hash: OPKR2EP52S7NBJTR7OV7HA6LRQIEYP43
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPKR2EP52S7NBJTR7OV7HA6LRQIEYP43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Closing GPR port before graph close can result in un handled notifications
from DSP, this results in spam of errors from GPR driver as there is no
one to handle these notification at that point in time.

Fix this by closing GPR port after graph close is finished.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 7bfac9492ab5..5d44d07acd69 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -511,6 +511,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 
 	switch (hdr->opcode) {
 	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
+		if (!graph->ar_graph)
+			break;
 		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
 		mutex_lock(&graph->lock);
 		token = hdr->token & APM_WRITE_TOKEN_MASK;
@@ -544,6 +546,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		wake_up(&graph->cmd_wait);
 		break;
 	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
+		if (!graph->ar_graph)
+			break;
 		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
 		mutex_lock(&graph->lock);
 		rd_done = data->payload;
@@ -649,8 +653,9 @@ int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
-	gpr_free_port(graph->port);
+	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
+	gpr_free_port(graph->port);
 	kfree(graph);
 
 	return 0;
-- 
2.25.1

