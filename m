Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9F84719E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 15:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3420683B;
	Fri,  2 Feb 2024 15:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3420683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706882856;
	bh=gtdmlXQY3OLn5YmXJ11GgVRKkjOWqdeb/x02vSADoYY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R8/o7Zba1OPNIoBbpctTZ5XRgLtrlVGPxh3No/2CkylMHTM2U+S6UVzfEqf8cHopp
	 7xF6wF/cXfF72PLPhdi1xML1HauEWbmlqF//m7AM+/HP5100avL7sAgi9l1udjvgGu
	 kspVF0tmp2TzpDlTB0s2+WeLtmCQnBAoJD5/PJU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D38EF805BB; Fri,  2 Feb 2024 15:06:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8700F805D2;
	Fri,  2 Feb 2024 15:06:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11BA5F80563; Fri,  2 Feb 2024 15:06:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80DC9F80548
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 15:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DC9F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NPXOCb/x
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412D1imt023527;
	Fri, 2 Feb 2024 08:06:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=D94M7wag6rI2JZlZhW5IHQRabF0OTS5ObHPiw2v4ju4=; b=
	NPXOCb/xRC1lanpkD+czraqI6eIyNOqfHR19LDQ5hHlgbecTH0KLQHJGkElqTBYZ
	n9AAX72OIt1JJYX32YpVNEnRBH7yWytv3ntv/XMx5Ah05dP/DnDPJgJDXZEndevE
	OFrYurBg7MFTsgpl4D8q4HQXyRyVwwwZhtvjwwGnO5XrkdcYk5BtT76VoRJ2YcIN
	FWwuLYeMsDBDTm45xL/3aTC77Y7B5WfAdBNkTtdgkjpDDVNRkJxzXBfQ4wH3yFyB
	qclsdobd7YUX7nXz3h8DRzpPdG0KaR1mp8SkhDbTjVsa0bqVQP/OrfdMnB2vfSGT
	2ry8fDayJzEQ01VwPWXdlg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AB959820249;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: cs42l43: Shut down jack detection on component
 remove
Date: Fri, 2 Feb 2024 14:06:19 +0000
Message-ID: <20240202140619.1068560-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
References: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7RmGXc7_beYLZp-WSCk9XowgP4aY3W_5
X-Proofpoint-GUID: 7RmGXc7_beYLZp-WSCk9XowgP4aY3W_5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WTCXO67ZTMWIAPU7MRMVQXPLJGXGQWZ3
X-Message-ID-Hash: WTCXO67ZTMWIAPU7MRMVQXPLJGXGQWZ3
X-MailFrom: prvs=9762917273=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTCXO67ZTMWIAPU7MRMVQXPLJGXGQWZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Disable the jack detection and sync in any currently running work when
the component is removed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index c84d5952cdb5..256767ef4c03 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2115,6 +2115,13 @@ static void cs42l43_component_remove(struct snd_soc_component *component)
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
+	cs42l43_set_jack(priv->component, NULL, NULL);
+
+	cancel_delayed_work_sync(&priv->bias_sense_timeout);
+	cancel_delayed_work_sync(&priv->tip_sense_work);
+	cancel_delayed_work_sync(&priv->button_press_work);
+	cancel_work_sync(&priv->button_release_work);
+
 	cancel_work_sync(&priv->hp_ilimit_work);
 	cancel_delayed_work_sync(&priv->hp_ilimit_clear_work);
 
-- 
2.30.2

