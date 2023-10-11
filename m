Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B25887C55E4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 15:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC2A16E9;
	Wed, 11 Oct 2023 15:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC2A16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697032216;
	bh=h2Fi2WSzkiMdK824Y4IDRUVFCp8h2KAV7erGcB1p0fs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ogW6Fnf3uw3S7LbrWUBavrpWeixHbhU2vWDbcP8LUacqP3+A/3I3+85phVRYlt1iq
	 NVejA0hfNZHsJ7ZTtr+yApcm+jY9cYJ29qTvAKt98prBZMvn5WQ6M1VZwv47IPAC6P
	 +LhsSnSgWekEkWqhqz3pkozYDRJ4aNLFG087ps9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AB46F802BE; Wed, 11 Oct 2023 15:49:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A46CAF8027B;
	Wed, 11 Oct 2023 15:49:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0A81F802BE; Wed, 11 Oct 2023 15:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABF15F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 15:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF15F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o5bALYg8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39BCWGUf016437;
	Wed, 11 Oct 2023 08:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PODMain02222019; bh=XoD01kMWN4fQN1
	wdVZoXVYabTLtU/S3zUI9m0HUgYB0=; b=o5bALYg81rbqCJxnx1hQfHijMVC8A4
	mi8tdTg9oYwk8Q15IhuK21igirptUF4Y6TsN+VScLoXeVPd+v5Dvhyr7sUekoJZc
	3ijw6MlAAkV0qhDzka5nKA2+CzgJzGyeXFqKbCBSXUlao5EMvWnqRYvSFnBYpw65
	CPF3n4gGLSXNdmWrrcbnzhJNCdk9Zk/gSiWZBhdcUfzSw3SQUASiqoA4YPyRqw/0
	2w5k+QlDq5Qqg8lwtJbV+8lFsDrwzXPEq6CscbOVoWVCVFnpo9HE65pC4yRZHgCK
	4hKUX9+b0Gy8PPtWl4c4K09pZZ3QpqbbcaCT0vVtiWsLkxaN7bPNwPIQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tkhhaku6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 08:48:57 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 11 Oct
 2023 14:48:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 11 Oct 2023 14:48:56 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.230])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CC49746B;
	Wed, 11 Oct 2023 13:48:55 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l42: Fix missing include of gpio/consumer.h
Date: Wed, 11 Oct 2023 14:48:53 +0100
Message-ID: <20231011134853.20059-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _RkLyYYvkM4NTf72gbXnrIdESanvKDDc
X-Proofpoint-GUID: _RkLyYYvkM4NTf72gbXnrIdESanvKDDc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VAVBMJTWNPQVZX2DWESF4DUXOLRQVGOF
X-Message-ID-Hash: VAVBMJTWNPQVZX2DWESF4DUXOLRQVGOF
X-MailFrom: prvs=56482167b5=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAVBMJTWNPQVZX2DWESF4DUXOLRQVGOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The call to gpiod_set_value_cansleep() in cs42l42_sdw_update_status()
needs the header file gpio/consumer.h to be included.

This was introduced by commit 2d066c6a7865 ("ASoC: cs42l42: Avoid stale
SoundWire ATTACH after hard reset")

and caused error:
    sound/soc/codecs/cs42l42-sdw.c:374:4: error: implicit declaration of
    function ‘gpiod_set_value_cansleep’;
    did you mean gpio_set_value_cansleep’?

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2d066c6a7865 ("ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset")
---
 sound/soc/codecs/cs42l42-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 974bae4abfad..94a66a325303 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -6,6 +6,7 @@
 
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-- 
2.30.2

