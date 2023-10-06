Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E77BB613
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 13:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745AC1D9;
	Fri,  6 Oct 2023 13:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745AC1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696590779;
	bh=/ZeLXjYF+qO09y8SwXVPJfeFgZDGpuzd6RCcyJidjjM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jA6MTRyBEMVaC1Ks9xPornXFdz2TWmuT+GDscffhwUyADnwwIhUO1ct9W/OukopY7
	 /k1irKGH+UgT6zlMLT62W/Xc6GDGWVUp6YhxA/5rhkHQX3BEI/FZXfuK3TDJ25s3eM
	 KP7wVJxuI+aNvwFJ/UFW06fWStwFGU86tenpnUJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B93A7F80578; Fri,  6 Oct 2023 13:11:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC44F80587;
	Fri,  6 Oct 2023 13:11:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D10FF80589; Fri,  6 Oct 2023 13:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D533FF80549
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D533FF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PddZTK8F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 396An4mF006823;
	Fri, 6 Oct 2023 06:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=n31ClrR7pAHjPb9Ka48kOGEYMP6+xN1DN1qSQpeBfl4=; b=
	PddZTK8FflKwXLmBVeQPRdvarSPJ9RBGhnLcI5SzrrPi0E24dDEzzyAfPDK9LISE
	Al23Ti7d7cwhyXuQFs/t+Gcii4M6O+GiPmXpPkSobjjcFe8Ctd4+Li23xg1B78Lu
	AFxhbwd/APlNDs3RjehEOqdofA66GlHbqfgoQjkjNEPzVNfP05z7rgxCZzIm5I5b
	PQFXufE06gveYUDJ9eapfS1vHt6DWz4b9NU7dfn9KHEq1dVTWk9NqHlDUSFFgXpw
	q6hwmWJ+3KpxUfn5/W36P6zrfyHeV1GVoPthFvXrnEVj4m4Hz7oEzUIGLwA1iAwi
	ZIR3xdfflOEoQ+LKmY/ZnQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k812p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 06:10:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 12:10:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 6 Oct 2023 12:10:43 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6AE18357D;
	Fri,  6 Oct 2023 11:10:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 4/4] ASoC: cs35l56: Enable low-power hibernation mode on SPI
Date: Fri, 6 Oct 2023 12:10:39 +0100
Message-ID: <20231006111039.101914-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006111039.101914-1-rf@opensource.cirrus.com>
References: <20231006111039.101914-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: t_TLtslMzrYc01xR3S83o8_ipRHwwlvM
X-Proofpoint-ORIG-GUID: t_TLtslMzrYc01xR3S83o8_ipRHwwlvM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PHZELWFFU66KOGUR2WFQCLXYUMNTTIWI
X-Message-ID-Hash: PHZELWFFU66KOGUR2WFQCLXYUMNTTIWI
X-MailFrom: prvs=5643372036=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHZELWFFU66KOGUR2WFQCLXYUMNTTIWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hibernation can be enabled on SPI-connected devices now that
the hibernate and wake sequences have been updated to work
with wake-on-MOSI.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 768ffe8213dc..b07b798b0b45 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -32,6 +32,7 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 	}
 
 	cs35l56->base.dev = &spi->dev;
+	cs35l56->base.can_hibernate = true;
 
 	ret = cs35l56_common_probe(cs35l56);
 	if (ret != 0)
-- 
2.30.2

