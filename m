Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC96E8FF0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89CA7ECF;
	Thu, 20 Apr 2023 12:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89CA7ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985967;
	bh=i5D3ABoYxn9vlmdYv8kaYY/Qr7ojw/0YBJKWr9yoZcs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jKXErvmGmRSmHfteWD3c7lg0Bv8/50MggqtB2GLqiO0eUum/S9kT8AhlArebkAe52
	 daYZ8B1IpdhDcOHUy/dPgNatZdgzzknzjMyFtwm6jnh/6OPHoE8xveu05Qy/nZCrst
	 c/mu7741oGDeXNY4MSTBL2tBe4NA5LaVV/JAJCwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17855F80155;
	Thu, 20 Apr 2023 12:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4642CF8019B; Thu, 20 Apr 2023 12:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E3DDF804FC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E3DDF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PtBULmQb
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-504eccc8fc8so674885a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985789; x=1684577789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeY19byibaKQU5SmsEhk5n4vvprUavR/0B7l0HzeYIU=;
        b=PtBULmQbRQK20LScpRHebHKUZ901DjN1+0eDl2Of/GBmLfksDulveUnoVXib8qy+uD
         QUe+Yb8aMFMzNSO1V+nHCMwhblZ/UApGmT/xVxec0sSS8yLQ3228EM2ky/wV2O6QTinR
         TbER1FHIeDgGvgB9Dpr62VcWaWGuk53+yeNTODNT1OH4iyNVPz6lswqcRoup8QuiJ7h9
         G+ydlD2RLMmNwpNDrzo7jy5U95KruGjzYVechUf+52Nypvhhag90S5KPva7I+4yr5maE
         zHmELbVNzxsf2OI5Q0g2dnKxKMG6T2PDh7Oz/jga08dkZdQFGAPqpSKSwKTmCzYf9sUv
         9KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985789; x=1684577789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeY19byibaKQU5SmsEhk5n4vvprUavR/0B7l0HzeYIU=;
        b=UVG7gumqar+R/lIDZGS1UjOVMUWOLnCoVzoR2++5fjD+hP5JB4sT4+X3LKqivGY9Qz
         nGhL46h/6CpSo0njCR21h0u1GIZYXZzSUU3X6Jqv+2RkluGplVNRlmJPsLBeN1+Ue9wM
         3HMwaj1KQQKgAJ/BFvvd5eEGVMxbUqF8qKpwW78FLMxn5Aj7nS2jzUvHEEupbswQR9Ad
         LABVnU6dDE69BWVNCnGe6JrntrTvC10kSRtB2VAkoeXdGX5fMYVWK7KVGrLpqKFhv5Zv
         PT8aVfsi10VdoZLt4lMkI+SLDcygCpnbNKv0+1/kjJt+mSkcTx8k5zAgWUJyj9wsTdc2
         6Fgg==
X-Gm-Message-State: AAQBX9dnFvItPXHEy3mx7Nzq0gtkmR/A7FggF8+SPJyOfxcUVSCdveuT
	xwAk1+dbMc34bFx06ctbNad45g==
X-Google-Smtp-Source: 
 AKy350ab0FABnbmrq7aa1gl1X9x4VEUtxamldKuTt6enWYqiZCxTZKEHSXUbjkdPzuX8LK1YY94UYQ==
X-Received: by 2002:aa7:d5c1:0:b0:506:8470:c323 with SMTP id
 d1-20020aa7d5c1000000b005068470c323mr1381184eds.24.1681985789356;
        Thu, 20 Apr 2023 03:16:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:28 -0700 (PDT)
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
Subject: [PATCH 5/6] soudnwire: master: protect concurrecnt check for bus->md
Date: Thu, 20 Apr 2023 12:16:16 +0200
Message-Id: <20230420101617.142225-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FXJFBWTADUGQT7KAMYH5K7OBVSF5GNNL
X-Message-ID-Hash: FXJFBWTADUGQT7KAMYH5K7OBVSF5GNNL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXJFBWTADUGQT7KAMYH5K7OBVSF5GNNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Soundwire master controllers might want to check for bus->md
initialization to avoid race between early interrupt and finish of
sdw_bus_master_add()/sdw_master_device_add().  Such early interrupt can
happen if Soundwire devices are not powered off during their probe.

Add a store release barrier, so the Soundwire controllers can safely
check it in concurrent (e.g. in interrupt) way.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 drivers/soundwire/master.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 9b05c9e25ebe..d5bf13e7e602 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -161,7 +161,12 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 	/* add shortcuts to improve code readability/compactness */
 	md->bus = bus;
 	bus->dev = &md->dev;
-	bus->md = md;
+	/*
+	 * Make sure the contents of md is stored before storing bus->md.
+	 * Paired with new slave attached and slave status interrupts
+	 * on the Soundwire master side.
+	 */
+	smp_store_release(&bus->md, md);
 
 	pm_runtime_set_autosuspend_delay(&bus->md->dev, SDW_MASTER_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&bus->md->dev);
-- 
2.34.1

