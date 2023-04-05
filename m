Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A86D7F7F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 16:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99BF1FC;
	Wed,  5 Apr 2023 16:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99BF1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680705035;
	bh=CVDUOz6N1TMc3D11xaKbOxC5GIsfRY1P2HNRuAvNksM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mB4yPwlYmsTtfejVPlllrEAVxd/mhQPzUXxdk6PJv5uIoZRKos/QWf/jv3LDYXDxD
	 pn4hiJABW+YFe+mvSmDsDVTER61Kvfui+LmUocm8rpJ2JCgxCZDQfoq+jL+C0/rOsR
	 T+55Zx3XbdtYK2RCB6cr5rr7l1qH9tclDBEdBVdo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC50F801C0;
	Wed,  5 Apr 2023 16:29:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75928F8024C; Wed,  5 Apr 2023 16:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43E55F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E55F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H4hC3GDa
Received: by mail-ed1-x533.google.com with SMTP id fi11so18075883edb.10
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680704970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bjq5zDxQyCkbnAUsg6zX1gfO+rxaxBPGXjBwDghiQE=;
        b=H4hC3GDaNY44R/lZfk9Ppbm04ZMF5VnKXQo5sU2rs19jEBD1Dyv2ix/zvRT4NLrrsa
         gKUAAoBHb/y2VkC+zquiud4T86UODXw2uIb0xpw9Zk5c5yoHuYbA+VWMH4M3c2Wf27MV
         dlTlbX3nwRy1R8cC+JsuXrmFGrA5+GU5cZejIqv443Ffl6j16h+DEzwiUl9yDIjHpruh
         bDgn2edhzmivIj6V01L+h6g1vaanKpJn4K1aGSYr11MWd2swUep5dbnfXf+vHBsrAuFe
         7GJ8vXWNrep9nDx2niSXc2l7fLZJetgFmGBMctRaVsGSPjanVvi6f9NItyO/YtymZBXj
         dFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Bjq5zDxQyCkbnAUsg6zX1gfO+rxaxBPGXjBwDghiQE=;
        b=B+QKkYMJapQXgoMHf8fu+YP2nurhbTTP7rFLlZ8Wsj9I7a+K5JBD6tWw3YUgSIgJEd
         LMQpJrJiiwW0jWzKMDU1nOfZLNsO0aVjciZ4d4OkBfKG5bgBJhy4TioHGCJhHyd8QxJb
         RkPmv4i4joY5PURpb4nvYBrEd5NUAtWhh9ydCrA6On8Lxx8AoBkDTWz4EMTDZsRxoG5o
         cBspt41qcYZHvayBcnC4CTLF/KMnJ0H1Ou5xA8SpbRcfsyLO9EI/Tl6Wy5glE9ue0qp5
         g/0Q7FSJNJwFk03nZKMyba78ax0Ul/RNQbT22TkCmbctQ6Su2PiX8N6M24SaYz5KYkFv
         dPQw==
X-Gm-Message-State: AAQBX9drNNbzoj9Oyx2BmQXhBRc6+GIeUL8GOZo7+VNqdg2Xr3acERei
	wiDsN6j1QRw9DlNax0JeghwHdA==
X-Google-Smtp-Source: 
 AKy350bdNfN0ijKa36g6weBhlJu2OQB7Xk7REHbQEoBD/66q2jMFOaL9TSIUlG21GWdW2wFWZjG6Qw==
X-Received: by 2002:a17:907:a413:b0:91d:9745:407a with SMTP id
 sg19-20020a170907a41300b0091d9745407amr3450196ejc.14.1680704969847;
        Wed, 05 Apr 2023 07:29:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a1709063c0d00b008b176df2899sm7454367ejg.160.2023.04.05.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:29:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: qcom: Fix enumeration of second device on the bus
Date: Wed,  5 Apr 2023 16:29:26 +0200
Message-Id: <20230405142926.842173-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P6PSILZ2RUZRERA7IJUWPDR7NIUD2RNS
X-Message-ID-Hash: P6PSILZ2RUZRERA7IJUWPDR7NIUD2RNS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6PSILZ2RUZRERA7IJUWPDR7NIUD2RNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Soundwire buses (like &swr0 on Qualcomm HDK8450) have two devices,
which can be brought from powerdown state one after another.  We need to
keep enumerating them on each slave attached interrupt, otherwise only
first will appear.

Cc: <stable@vger.kernel.org>
Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 drivers/soundwire/qcom.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c296e0bf897b..1e5077d91f59 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -587,14 +587,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
 				dev_dbg_ratelimited(swrm->dev, "SWR new slave attached\n");
 				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
-				if (swrm->slave_status == slave_status) {
-					dev_dbg(swrm->dev, "Slave status not changed %x\n",
-						slave_status);
-				} else {
-					qcom_swrm_get_device_status(swrm);
-					qcom_swrm_enumerate(&swrm->bus);
-					sdw_handle_slave_status(&swrm->bus, swrm->status);
-				}
+				qcom_swrm_get_device_status(swrm);
+				qcom_swrm_enumerate(&swrm->bus);
+				sdw_handle_slave_status(&swrm->bus, swrm->status);
 				break;
 			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
 				dev_err_ratelimited(swrm->dev,
-- 
2.34.1

