Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516FE6E8FF1
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99AD9EE2;
	Thu, 20 Apr 2023 12:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99AD9EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985974;
	bh=PVPNQel4N9VzoSkBVR+6Pghc5HaknxNBVu8OTF/9Nls=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQRQ4SD7Zp+EL8Z+BbbQYk+SJRKpv/A6EZTv6aGI1xOmEatkmH8kplmrgYGtwntCd
	 4+v73AAbLXWdybUHtBo9D7+8hR1xhxYpMEcUYY7GLE11699DLkHJrO4WlDm85E/qnK
	 YMJuIMqpjF5ZFaNwXkQo1QZvSbUlVamd7tuXu9SU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C959CF80528;
	Thu, 20 Apr 2023 12:18:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 122FEF8019B; Thu, 20 Apr 2023 12:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF7BDF80155
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF7BDF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=juzJCbCa
Received: by mail-ej1-x630.google.com with SMTP id fy21so5091567ejb.9
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985788; x=1684577788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpQ/uiByxTl/QsWgu3jLMFo8/XrWsnc9Emr/ALFnhD8=;
        b=juzJCbCax+ZR55BV6ouJGNxhZQJBPU711okungZ3pQNmrEoyR931ePxvgdve2wtYmq
         Jo5yCuc760ZT0EihcZnOIQnIn3t5owUZbfZlJQvJ800CK8ZC8LgUFBpb7r64R9csuHyE
         47001kvZkfIJ65ZMSPl3gZ6yt9wUk3el6rMgTE9m+u3TbK3BPfozq/QsmkrWWGrwLR6i
         M4527XvDh3F7Xg2XNVSTDm4k3vyt478WcvpP7rVYUjZqTRacJ9b6O+lOW6x4AQDWIt7w
         /ufw/IvoZ3WEhYODyW4+IpRx+3EuZaHv4yPAUx2uQlg7SE+LNLdfiLgpGO05csGzezRR
         4a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985788; x=1684577788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpQ/uiByxTl/QsWgu3jLMFo8/XrWsnc9Emr/ALFnhD8=;
        b=PSY4A+J9m6l3l0WNSvZAuZhJOSGqyM0zaOJn+9uJKJH/CiDF393epH+SHycXURiVQ8
         3RFemOtA5arubyGCNVNU4liQ/07Oh+E2YMwh2nDr6edHp+WnHY6LayUTLCAUazTAGwMa
         CvW2rL2tm7WcGRbTYVsy+MQVuGRMF3bdMalaI+cjcMyT5BpE4fBWCruHqDTN8ErIvLEt
         udbN2mVNoXjLa0RevkaZfprQSg4oP2SU1rfN+Ln0cJEcqirGuPX0rjL4ye5Gx0KIh7Oh
         XlhStLvljxl8MgYq3GdhrJThwaBly6e2fJEG4UkMDduuqXpUajX3mRgZcciAkKMHm/mP
         Nnyw==
X-Gm-Message-State: AAQBX9fMsU/7T4x4HAIkcuwCeJZ9sfIttH1fwuKilHNUytrFwiwlakBh
	G85amBuHGa1yQSngukNsskHJzm5CISPUM0hY3K2E2Q==
X-Google-Smtp-Source: 
 AKy350aJoXHpvCCTWt/My96Kx7KquB21h2WQBonG6sOA+uTsE5mM4HqBnVFra41oLy4Ah/SCA9aJ4A==
X-Received: by 2002:a17:906:4f17:b0:933:3a22:8513 with SMTP id
 t23-20020a1709064f1700b009333a228513mr1129561eju.53.1681985787930;
        Thu, 20 Apr 2023 03:16:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/6] soundwire: qcom: drop unused struct qcom_swrm_ctrl
 members
Date: Thu, 20 Apr 2023 12:16:15 +0200
Message-Id: <20230420101617.142225-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M3JTVCLRPAT2IDSHL6S5E43JMF2H5AIZ
X-Message-ID-Hash: M3JTVCLRPAT2IDSHL6S5E43JMF2H5AIZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3JTVCLRPAT2IDSHL6S5E43JMF2H5AIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop unused members from the driver state container: struct qcom_swrm_ctrl.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 drivers/soundwire/qcom.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fae8640b142b..679990dc3cc4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -187,12 +187,9 @@ struct qcom_swrm_ctrl {
 #endif
 	struct completion broadcast;
 	struct completion enumeration;
-	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
-	u8 wr_cmd_id;
-	u8 rd_cmd_id;
 	int irq;
 	unsigned int version;
 	int wake_irq;
-- 
2.34.1

