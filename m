Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA296C18F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41B9AE8;
	Wed,  4 Sep 2024 16:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41B9AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461982;
	bh=9+Zsq3U+7RUDbpauXfVLl3TJuE2Hu/j2MRyiO5J/M/g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=amWgreBcMzCnVkO3tTciTcwO5G0cxrOOm65ttsu31kKU5FLxAbOlF2Ofwaw5geBiY
	 X4ijW+3XwMUqJWU8Jceoj5xDwjvT84DCF9E3tT+4EMksmNQb65Zk8R7T8CgsnreaDr
	 g1PBfrE65FcXyGznuSrAz5Bb8bDLMdIxhMH7RmVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 228A0F80617; Wed,  4 Sep 2024 16:58:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D327F80632;
	Wed,  4 Sep 2024 16:58:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E522CF80199; Wed,  4 Sep 2024 07:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 192E1F800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 07:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192E1F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F5ii7cvN
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20570b42f24so29132785ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Sep 2024 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725428863; x=1726033663;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPZLARY2mhwLV2+TjRBGHBdo6FGrkaEkzsDd0dO5Ygc=;
        b=F5ii7cvNs2Mo5j8DfM7WDnLGyiTpznCiF5xITwUEKUD5dQwxfkn9VW4oBuAa9GRGOO
         rQz+XeNS51zNBgSlucQFZkNNRliZVzd8rCuX/hJt54LfFD2mhDw8MBk02KAJdmPHn/nr
         anCH2HgXw70AJKKt392+qGk2tTrC7jsrqPrwkTlQ2dZlKCQlezO9qaIzZnRbl5PPAuMj
         ClJ3YZAlYf3VzC0BQjBBGIR+/Q06KHwL3bRuitE3xCJ1udg8sGJnxMWpNWopwP+ENXUM
         w3PCnS8KrwiUnyt4dquRw6Fmh8095tAxhZHkTf6Wq87prVO9Mo7l2TaRPLnmiqysW4k2
         eaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725428863; x=1726033663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPZLARY2mhwLV2+TjRBGHBdo6FGrkaEkzsDd0dO5Ygc=;
        b=OqR6Wwnwsvd/N7NWUvnd9dapc+1mwoclvjuUMBZaiZtTqfGmMOXOqHk660O5BVgtSQ
         nruoTf292roMQuWdwARONd0ME9NyNvXRpjcyGb0Ta+GOvktHqv1k5wLM0XHvMp9mU8hk
         6iUoWT/xBfLN4H/n1dRwr4Rwv1E7XzBZqWVjt77JBM3RFglO6A/LBpI4xwzgP97vV3du
         /TDiYSb2smLgumZCDFzunYQUPhoycLKwt7IAWnlGpH9J242PVNtbd/VlZVkOqTW4EvT9
         tiVVxGX5H8oZAPgXICza8xECG2DKX65UJAKzh2PKXsDl4xHmDgVErbLg0ktCCl35TH15
         Ff+Q==
X-Gm-Message-State: AOJu0YyJP4D0OtUx/RmbXLk9hhuU0VbvE8ls0lGcpVUPOqGblHdcuMbd
	PplvMsWJsy9tvfOVXNnj2U9JzAgxmHKI3YNEnWueWbnlof2hvzd9
X-Google-Smtp-Source: 
 AGHT+IF+Kl9oj/3kcgU89pp4fO+QtscwVY1/SnnNYQ6U/J7Q1U5ipNByGKzJC9sEAPR9TvXFZFxTtg==
X-Received: by 2002:a17:902:eccc:b0:206:b8b7:85f with SMTP id
 d9443c01a7336-206b8b78f2fmr7240825ad.3.1725428863100;
        Tue, 03 Sep 2024 22:47:43 -0700 (PDT)
Received: from fedora.. ([106.219.164.163])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea67bc6sm6536055ad.258.2024.09.03.22.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:47:42 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	andersson@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] soc: qcom: apr: Fix some parenthesis alignment coding style
 issues
Date: Wed,  4 Sep 2024 11:17:35 +0530
Message-ID: <20240904054735.7952-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: riyandhiman14@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QXHGWOOAWJDCAVQPQ3O4EKKMSNJ5N2FA
X-Message-ID-Hash: QXHGWOOAWJDCAVQPQ3O4EKKMSNJ5N2FA
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:58:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXHGWOOAWJDCAVQPQ3O4EKKMSNJ5N2FA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adhere to Linux kernel coding style.

Issue reported by checkpatch:
- CHECK: Alignment should match open parenthesis

It has no functional changes.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/soc/qcom/apr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fbff3a890e2..db1326bdb170 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -88,7 +88,7 @@ void gpr_free_port(gpr_port_t *port)
 EXPORT_SYMBOL_GPL(gpr_free_port);
 
 gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
-				gpr_port_cb cb,	void *priv)
+			   gpr_port_cb cb, void *priv)
 {
 	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
 	gpr_port_t *port;
@@ -159,7 +159,7 @@ static void apr_dev_release(struct device *dev)
 }
 
 static int apr_callback(struct rpmsg_device *rpdev, void *buf,
-				  int len, void *priv, u32 addr)
+			int len, void *priv, u32 addr)
 {
 	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 	struct apr_rx_buf *abuf;
@@ -222,9 +222,9 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 	}
 
 	if (hdr->src_domain >= APR_DOMAIN_MAX ||
-			hdr->dest_domain >= APR_DOMAIN_MAX ||
-			hdr->src_svc >= APR_SVC_MAX ||
-			hdr->dest_svc >= APR_SVC_MAX) {
+	    hdr->dest_domain >= APR_DOMAIN_MAX ||
+	    hdr->src_svc >= APR_SVC_MAX ||
+	    hdr->dest_svc >= APR_SVC_MAX) {
 		dev_err(apr->dev, "APR: Wrong APR header\n");
 		return -EINVAL;
 	}
-- 
2.46.0

