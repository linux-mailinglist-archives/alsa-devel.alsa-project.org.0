Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B47D859F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F13BDF9;
	Thu, 26 Oct 2023 17:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F13BDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698332995;
	bh=EPdyWsZRjOzG7RHrq4LSOjsgC2/D7YvZAsL5wLpder8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMhHHn8gxkWF0HuGXh0hZ0YQtnY4ZrR0+NkkE8X9eqHbBUZdiD7VFDh/UBZKfnxP3
	 dTIiH3FzNPwfoA3l6DpSxu1GoYqnIec0Yi9JNHISctG3riBhqzdSBZghChrNzd80yu
	 hmhvSSiBKIPsf0QnCi3Qhy2vGJ+E5V2YMB5utsS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7364F8057A; Thu, 26 Oct 2023 17:09:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B326AF8019B;
	Thu, 26 Oct 2023 17:09:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F7BF8028D; Thu, 26 Oct 2023 17:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97966F8028D
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97966F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y2tQxHdD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39Q5GUrg011654;
	Thu, 26 Oct 2023 10:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=y/+iYEq7Uz9EyfpgC4lWXIhIUHrMcz4eog7gtduIurE=; b=
	Y2tQxHdDaqXmoe9FKYwcQLqkwBNM+NVEnK9gUoMq/ETN2DvzZsr9CQ8n+A6u3aCX
	wsOkXO21KwIsAlL60f1vFpDIvkxI8DA6GtIL6DXKXDaKIV9A5wGVNWn7FZE8KaYh
	+2wVTmiptV7q0qOxZ19mBcxJgf2kLVJb5x9H+qEc4/W4USgOkUHK+oK3wxjL6/CH
	lz161+ZhDMBS07gpwSRd7AD6/5HuD4InZu8dE3oHgz9GAEPPIO/EQ34PliRQwdVd
	CtEX7nedCc7JImkhLHU1foWNI10h0bUUbKOgOgSl9VcOhQKwe/bTV6aR5ab+kFA7
	3tuWIUoLsjzfyL4nYQkDXQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tvc1x94k9-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:06:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 16:06:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 16:06:08 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.177])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E0E5611AA;
	Thu, 26 Oct 2023 15:06:07 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Mark
 Brown" <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/8] ALSA: hda: cs35l41: Assert Reset prior to de-asserting
 in probe and system resume
Date: Thu, 26 Oct 2023 16:05:53 +0100
Message-ID: <20231026150558.2105827-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
References: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NaKD-yWniZCNpH7nPU9j1Sl85JO_MLNV
X-Proofpoint-ORIG-GUID: NaKD-yWniZCNpH7nPU9j1Sl85JO_MLNV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5ZCN5SW4MUWAIUSPEJ2TNPB2RTQHJUCN
X-Message-ID-Hash: 5ZCN5SW4MUWAIUSPEJ2TNPB2RTQHJUCN
X-MailFrom: prvs=56633e4941=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZCN5SW4MUWAIUSPEJ2TNPB2RTQHJUCN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To ensure we are in a known state, exiting from reset at the point of
probe or in system resume, assert reset before we de-assert it.

Since the BIOS may enter into a pre-boot environment to control the
amps (for example for boot beep), we need to ensure we start from a
known, reset state prior to probe or system resume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 919e38213975..1ac721085fb5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -840,6 +840,7 @@ static int cs35l41_system_resume(struct device *dev)
 	}
 
 	if (cs35l41->reset_gpio) {
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
 	}
@@ -1693,6 +1694,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		}
 	}
 	if (cs35l41->reset_gpio) {
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
 	}
-- 
2.34.1

