Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604F7351D3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7999B850;
	Mon, 19 Jun 2023 12:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7999B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687169928;
	bh=2KkWUHZ625w/PEVR+S3+jP7sIsSrnVNvwB2zLhROWGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iD8OZPgOlNwphXdj6CInnz21c3Grs0tJoIfslhnFzvYOCco/q6K0yCg+skK2KUQPF
	 gP96rnnokwwYpPrZXgQcf36LnADuEbKkOYirh3LMI23Lu5KoxjtkqEeZ4X/326P/1l
	 N+msLtOc6Q3G2xmVq8KFBEcAg8+ZaXbq+XYrSc+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60245F80557; Mon, 19 Jun 2023 12:17:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 880FFF80557;
	Mon, 19 Jun 2023 12:17:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C844F80132; Mon, 19 Jun 2023 12:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA2A4F80132
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2A4F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wEV0ue9J
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2339791f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169818; x=1689761818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuQSolMY+GsunpVDUBYRLCP9uTfJjpPU4KcdicPOHq4=;
        b=wEV0ue9J+u2a2HLQ1CP4MMx4oGUdCkt99zwyjc1W2LXUU+UOnfNpWLbPyorE15KNuh
         U8NmkVrj022hXe0Zu+MXJ6IjR0ZDkR4U8Tdz1GjgGdFlq9wM+ChK/oftoibeGpZNb0OY
         SY8NPWh/scWhHbh/m020O0nK5HbJQbsW3lidlAwxPyxIZPAMQgJYwrpFK5YXlN8Ekg52
         H9iq0M+OJeSsxY679hBNisfWGI0R4dDLtvfAHXXne+oGRTUBfhQqitqDPcmdwG3jCoRF
         PkfQi6Qswfa7rC1TNenqhpjjWGoQSO+fM3DvX4B0SS2kSNgRqM9drcAJzS0dtGyIaWGc
         tqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169818; x=1689761818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuQSolMY+GsunpVDUBYRLCP9uTfJjpPU4KcdicPOHq4=;
        b=ByuD82uwLbarxQ+1tbNurVLakctXzYx63k0b2HKcEA7m9e61KSYbUlWmuSWk+cR106
         G1MJlnw1aq2x9O6q9EQutGAZyAbqu13LFbCa+yreRRtD641wIzltiyK3bZZIsD8xdqGd
         PW93/5qdtUG4p+7Q9gQU2++6xWDSUchkXmiN3RMKkLcRfbqCsfWBAX3ysizgjZ6jO5es
         ifnNLyXsGnV6OzvK1Q29N65hRfNMsczGSr8MPYs94NICU5GIlmxMKLbc95nnCnSgGm73
         0WQzFh7GrFAlthufjAxLWd0ZZLlfB5Nkr+ZpUmxPbXN+ofL9rNp90SfJrPzS2Wbwf6Lr
         WV/g==
X-Gm-Message-State: AC+VfDyon9U7vA4Wq7V2/wafAPBSc20He0v7giv0ALZh0zbRLDZtD0IJ
	dB8RoUdvMsFwRSJyxglUnx/09Q==
X-Google-Smtp-Source: 
 ACHHUZ7BIVHsLCveYS2BY00A5DGsfQvOZmnevUwUYrB78+bxfIPEytNYbcdcNJd1tSwKU7IpnCOegw==
X-Received: by 2002:a5d:464e:0:b0:30f:c1d6:61cf with SMTP id
 j14-20020a5d464e000000b0030fc1d661cfmr5503176wrs.51.1687169818587;
        Mon, 19 Jun 2023 03:16:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:16:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 02/11] ASoC: q6dsp: q6apm: add end of stream events
Date: Mon, 19 Jun 2023 11:16:44 +0100
Message-Id: <20230619101653.9750-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZCCLBU6SJZF73632NIY4JVRUPGAXRLZ
X-Message-ID-Hash: PZCCLBU6SJZF73632NIY4JVRUPGAXRLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZCCLBU6SJZF73632NIY4JVRUPGAXRLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

EOS event from dsp is currently not sent to the dai drivers, add the
missing callback.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a7a3f973eb6d..b07fee8ccac1 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -497,6 +497,9 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		}
 		break;
 	case DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED:
+		client_event = APM_CLIENT_EVENT_CMD_EOS_DONE;
+		if (graph->cb)
+			graph->cb(client_event, hdr->token, data->payload, graph->priv);
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
-- 
2.21.0

