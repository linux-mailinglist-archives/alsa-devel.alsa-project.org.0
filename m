Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58EA8A9F29
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF65C1939;
	Thu, 18 Apr 2024 17:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF65C1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455605;
	bh=1I+k1C6YL3NgWZs2rJjCaajJuVIulYenNNvjUcgaP4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eB4ufVtX7pNIonpEggsBPvWzTtm4XHMXRdYH/ZOtXhlkQ94Ae6T0OHYBmMQQD9W+e
	 rfFxpZN6Vpo9t4cbz/hNE02zvBylHhae8idZ893pTXOj0Y3VsufcykEVNyVxztJMIX
	 ePVoU1hH/uHA+zRvjdP5i+T17xuO6iuTiFJHIlOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F28F89754; Thu, 18 Apr 2024 17:47:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87039F89770;
	Thu, 18 Apr 2024 17:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 774CCF8026D; Sat, 13 Apr 2024 08:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6040AF800C9
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 08:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6040AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=postmarketos.org header.i=@postmarketos.org
 header.a=rsa-sha256 header.s=key1 header.b=QQOM8PXq
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1712990566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YqqeOyiGrV8oFKHRZ+mFzcuczR3R+aCyjCSPhTMm31s=;
	b=QQOM8PXqIHLaSwjDv6OAKfVEAI6G7796mSoVOHawE34M91pd0UEemuZw7RI9/ehLBwhsH8
	OqdeeMRgknPK9UFIdTwNMz3931PxePT776hH+BlTJ99lwrULI2S88KWjFWqMTfgAnUPshc
	Nw4qlFLUJFkyFzk3elPzvCLR6xKMhtJABRvPtG/q5n0A161z65QCxTfhhwQOhoQLnwH0Gd
	UO4wcRqRDUb9PBQe3uotTiBeeRWkUWo2eJ/ZnZ0WopjeFuKhnu9eDLJSntbUckfHNCUBRb
	YojEx1qicRrRikSbfeERilShZkrtR+rg3ylIqI1BwvY3qc9bFapk1CUT5D2BYA==
From: Anton Bambura <jenneron@postmarketos.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and below
Date: Sat, 13 Apr 2024 09:42:24 +0300
Message-ID: <20240413064225.39643-2-jenneron@postmarketos.org>
In-Reply-To: <20240413064225.39643-1-jenneron@postmarketos.org>
References: <20240413064225.39643-1-jenneron@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: jenneron@postmarketos.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4JVZB63DJJO6WHFFGQJ2YDNTDCKW3VD6
X-Message-ID-Hash: 4JVZB63DJJO6WHFFGQJ2YDNTDCKW3VD6
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JVZB63DJJO6WHFFGQJ2YDNTDCKW3VD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch returns back the behavior of disabling stop clock on soundwire
1.3.0 and below which seems to have been altered by accident which
results in broken audio on sdm845 + wcd9340. For example, on AYN Odin and
Lenovo Yoga C630 devices.

Fixes: 4830bfa2c812 ("soundwire: qcom: set clk stop need reset flag at runtime")
Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1e2d6c98186..bc03484a28e8 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -628,6 +628,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 			}
 		}
 
+		if (ctrl->version <= SWRM_VERSION_1_3_0)
+			ctrl->clock_stop_not_supported = true;
+
 		if (!found) {
 			qcom_swrm_set_slave_dev_num(bus, NULL, i);
 			sdw_slave_add(bus, &id, NULL);
-- 
2.43.0

