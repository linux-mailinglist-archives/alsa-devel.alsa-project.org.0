Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B756729D73
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DCAE89;
	Fri,  9 Jun 2023 16:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DCAE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322526;
	bh=2KkWUHZ625w/PEVR+S3+jP7sIsSrnVNvwB2zLhROWGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SHj4cYNI6/7SroSDBFKVkfeIuWVs5RWr5497F9WJzcPgpnFsfYvxVRWkZIWM88ns8
	 ziZgldpupQ/QLhxfAjbC4ZIexteHIOnYjJzQ6/OXVwMVq9xHRWETt1xKwL7bnldUlu
	 ikGmUoNUWj/xVpOUy8sGcqUeX2ZyJGjOTtSPYIDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10CCBF80199; Fri,  9 Jun 2023 16:54:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCA4F80290;
	Fri,  9 Jun 2023 16:54:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D1CF80558; Fri,  9 Jun 2023 16:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC46BF80549
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC46BF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ONwJl09/
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9b1so19205865e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322460; x=1688914460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuQSolMY+GsunpVDUBYRLCP9uTfJjpPU4KcdicPOHq4=;
        b=ONwJl09/bsLQmdUzwtjnMWbC7fFCwIu40+1GGEzwNKYAYTImxjdf80WVJenHhV6SZE
         l4hyaIQb9uouf0Knk+bgqUpA18RhoQmWzHa7wGTm5DaL1kfmpeIfSfRyW1UzLp3TNe5M
         gND5CHZmr7t5WkwjRCPDvGuC0Edq6WoaG+VBGf4QjCiqRI+E3F9BC/91d2r+CdYGCS6i
         G17IodWT7T+WZtjs6mV8Dg2r0gO3rHNyRe2cAdPYHdyQ2n9s5t89eyCv0FdZ2gTN3MRX
         GqPUaqQnWTqHRyJZ/jEBAx1d8jxCsWZ7kSYgZXoGyrwXvIHOkOCROW+CL57a6XTPXRqX
         l03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322460; x=1688914460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuQSolMY+GsunpVDUBYRLCP9uTfJjpPU4KcdicPOHq4=;
        b=eWMWDRkLcldIPf0RaR+bu/ZUuMiD5HoG6m/w2/X+VM5bu26CaVwJsphvr+reFA8DjG
         M6e4lrK0J38s3HwZmUIZhnG3eyhiyxEtPzFPYYGgSyI8IG/xCz0vcBEpj1ILkqS84FdF
         gXnemwTS1KU9KE0EDbRFXI2c/acN0r9Gcn+be87ZRYprUObxYaeJ7a3ZCsVCpvcHMjnS
         ALnrxg8tuv80g/Im8zN46H+XouOXGAvWkAfYxDiusfGWFxbEg5m4mwFoGLEJIITC7hFl
         yAqj0RcLASNanGBwEQGRK9DY+J4ji7CZJ656teCMwWNn8DBpiWgXuf8gV3djX6+lo3JW
         D1uA==
X-Gm-Message-State: AC+VfDxPBCiRqgctHrkh7lZDSgFfw7jhGfGV3x64IgF7dBloE92cLPsj
	jYqgtn8fmMET/IBU78QxtVVdzA==
X-Google-Smtp-Source: 
 ACHHUZ5jmIwMMsS6bJUifZ1z8l17raD0V7Vbgzz65Isey3BWjeSbT6ZHcqCta3q3QBlg09+h3SCrMw==
X-Received: by 2002:a1c:6a18:0:b0:3f7:e536:8f06 with SMTP id
 f24-20020a1c6a18000000b003f7e5368f06mr1341409wmc.26.1686322460491;
        Fri, 09 Jun 2023 07:54:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:54:16 -0700 (PDT)
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
Subject: [PATCH v2 02/11] ASoC: q6dsp: q6apm: add end of stream events
Date: Fri,  9 Jun 2023 15:53:58 +0100
Message-Id: <20230609145407.18774-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZDCOQ5ENJJPAN6V652RZHRRZ656YWS2
X-Message-ID-Hash: PZDCOQ5ENJJPAN6V652RZHRRZ656YWS2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZDCOQ5ENJJPAN6V652RZHRRZ656YWS2/>
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

