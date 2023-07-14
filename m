Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F675415D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 19:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8321AA4C;
	Fri, 14 Jul 2023 19:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8321AA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689357085;
	bh=KNASP/ms719trke+v98OGUgfBB2WZmffsWvxsqtDVQc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Vzp/3CGynnQX6qWwB22vrI0QpyokxxJfelsckc1rlGyCxPRT3USFu/1l2MnosO1mW
	 cqYQJzprZ9rdWGj/ZfysxDUTgApFgoM4f1UxgUsDSQgvfpA7KKDj78yv2tmqJ0lUKp
	 GXNI5myFfeE15AO0OcQ+zncSNRbqH6xsCJBLobIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DA83F800E4; Fri, 14 Jul 2023 19:50:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B654AF80236;
	Fri, 14 Jul 2023 19:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 726CEF80249; Fri, 14 Jul 2023 19:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E266AF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 19:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E266AF800E4
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-345d3c10bdfso9632565ab.2
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jul 2023 10:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357022; x=1691949022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1rucALi6oAv2chldSxXwAIScTfciNmzHu3E9+4nv0w=;
        b=kTo/eU2dRRh+XFP54nBOZxp7/tn6bvLGwEMw6cDuvGxM09wj7WnpEcq2Ib7Z/fAS8i
         osjA2gH9VsKeLf6NhH7r+1snuqvYD0C1ZRK+5PjyJc242xHoUUcVwClzYoieSPiUz3f7
         U7YzF6BlkaGeTDeOk3BGsuOPHWJTPLQh3vd2j5BMK09Ewa7MHIh+uV05uuXsSdS8tkyp
         N9gTA2hhPrP+lEPr015j99G2LMJ2Hl5bcBBHIY95VIkJkKeQiFa3I9UNyGfAQXh658ZM
         Fj1ik/fXosTnIW6rGXSRl4UVBEZgao/BVHVLQxsZKkC13HVW9MRQKPFMfToOlJxoU2yP
         ajdw==
X-Gm-Message-State: ABy/qLZhwRPHVaGZzIBWRyhh1fL5hzIEo1OAlE/LDbD0ocehPBH+hXk0
	WOX8F6he4nIh8OmmTyFvQg==
X-Google-Smtp-Source: 
 APBJJlEx91G3Ibvbj8NwM5kn+7hG/vmpw5UnHj5DwKMzDI0mzZ/2XKJHg12dJh61mT/2CnOPqAy3Uw==
X-Received: by 2002:a92:d28c:0:b0:346:420f:2bb7 with SMTP id
 p12-20020a92d28c000000b00346420f2bb7mr5771848ilp.16.1689357021983;
        Fri, 14 Jul 2023 10:50:21 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 x8-20020a92dc48000000b0034607609251sm2874160ilq.87.2023.07.14.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:21 -0700 (PDT)
Received: (nullmailer pid 4064131 invoked by uid 1000);
	Fri, 14 Jul 2023 17:49:52 -0000
From: Rob Herring <robh@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:49:46 -0600
Message-Id: <20230714174946.4063995-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OSZPMBJYEPJPVYJ27OTCAPR46ZKJQ2MX
X-Message-ID-Hash: OSZPMBJYEPJPVYJ27OTCAPR46ZKJQ2MX
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSZPMBJYEPJPVYJ27OTCAPR46ZKJQ2MX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soundwire/qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 7970fdb27ba0..d178a0dc0918 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -10,7 +10,6 @@
 #include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-- 
2.40.1

