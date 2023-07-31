Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F69769D79
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A751086F;
	Mon, 31 Jul 2023 18:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A751086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822820;
	bh=F027/66LOSCyX4fIfF30zUjYwkx5bzh797Fkq4NM5Hc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QyVpOV9GKiK5PpCs2GakK4AB4NcMyCZG6EA3a2ykBJhTiyhAaXgaPKPglJtTGjkX9
	 3tiZwYvA8gduXhgA0OJRVOPQDos7GZIxdlaTya+t5VpZh64gMBWK3DfrBPZ52ST/ng
	 3MsJkzccvzo4JzA+E72dB29juC4Wmde0Ms6lnLF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FCCBF805B3; Mon, 31 Jul 2023 18:57:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C1D4F805B3;
	Mon, 31 Jul 2023 18:57:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F2BF80568; Mon, 31 Jul 2023 18:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2669DF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2669DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U5vUnEnl
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJQ017071;
	Mon, 31 Jul 2023 11:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=RHyGoQzk1u5genvtgwGtlQ8eSjyHd0Gs4TL3IEXqR+A=; b=
	U5vUnEnlzFelQxYvCphDPRU+MpWHHJHBUlJdiIZ2pV5SukOR1kJsHs7jFzettXd0
	JSXzGjb69lZ1F4B8ry1mCQjUVDa1kOTJNYR/avSjGwbziEXkPxa3+Z8SHgJigucC
	WcMzCVjkINQ6bEYErJXVGoFgNLiNSfr4t2eUA5bC5meCxps3tXPGp7zjp0uAWhjX
	AdNvcJMxNu8UPe/cn7fKI9RAsywS0RNKIybfyytIq4xUFi5xtpkDYaCIilf7fKVj
	i8xknsPGQUF2p4CxxAsk9JRzTQHERSGvcJ72CqAV59TX3y682EPBqbYNL4/gKPPJ
	pZEHXXu/49KRpbEgZKvfWg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:38 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 17:57:33 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07796475;
	Mon, 31 Jul 2023 16:57:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 9/9] ALSA: hda/cs35l56: Reject I2C alias addresses
Date: Mon, 31 Jul 2023 17:57:26 +0100
Message-ID: <20230731165726.7940-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aR0Fv-GAtzh-w4nrEOUP9pw2wCSgsztH
X-Proofpoint-ORIG-GUID: aR0Fv-GAtzh-w4nrEOUP9pw2wCSgsztH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5CDDMVHYIR5ICRXRQ7TBYVYH2ZUABMUM
X-Message-ID-Hash: 5CDDMVHYIR5ICRXRQ7TBYVYH2ZUABMUM
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CDDMVHYIR5ICRXRQ7TBYVYH2ZUABMUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ACPI nodes for CS35L56 can contain an extra I2CSerialBusV2 that
is not a real device, it is an alias address.

This alias address will not be in the cirrus,dev-index array, so reject
any instantions with a device address not found in the array.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 004740509dbd..76b9c685560b 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -852,8 +852,12 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 			break;
 		}
 	}
+	/*
+	 * It's not an error for the ID to be missing: for I2C there can be
+	 * an alias address that is not a real device. So reject silently.
+	 */
 	if (cs35l56->index == -1) {
-		dev_err(cs35l56->base.dev, "No index found in %s\n", property);
+		dev_dbg(cs35l56->base.dev, "No index found in %s\n", property);
 		ret = -ENODEV;
 		goto err;
 	}
@@ -891,7 +895,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 	return 0;
 
 err:
-	dev_err(cs35l56->base.dev, "Failed property %s: %d\n", property, ret);
+	if (ret != -ENODEV)
+		dev_err(cs35l56->base.dev, "Failed property %s: %d\n", property, ret);
 
 	return ret;
 }
@@ -904,10 +909,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
 	ret = cs35l56_hda_read_acpi(cs35l56, id);
-	if (ret) {
-		dev_err_probe(cs35l56->base.dev, ret, "Platform not supported\n");
+	if (ret)
 		goto err;
-	}
 
 	cs35l56->amp_name = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL, "AMP%d",
 					   cs35l56->index + 1);
-- 
2.30.2

