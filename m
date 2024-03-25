Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172488AEE7
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 19:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AE614FD;
	Mon, 25 Mar 2024 19:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AE614FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711392635;
	bh=gBX8YfXgY1iMfwDEeoUVHzA6nko45l9jsRdBGQAMaQM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K/rXMSCKpQSs6WtM9MinR6d5JM0/XZaH49DR6dCW+/iVVaxqG8W5NPeIF528FmODR
	 YL2bDnYJ8wZ/y4a6MjHygGWPge7tn9fRDfP4L4q8Nl9QPUoG+e+bDvZStoJ58XHhD2
	 wR5LInZ68gjjYclcuVG3L+TrBgwwzBFGdbXRgEug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33121F80579; Mon, 25 Mar 2024 15:45:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E309F8059F;
	Mon, 25 Mar 2024 15:45:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2447AF802DB; Mon, 25 Mar 2024 15:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28288F80236
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 15:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28288F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VxFmgjjn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P4qktd007553;
	Mon, 25 Mar 2024 09:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=s
	M4jHgZg6/v208T765YpJQoPIlY6ESlG7oOC2AjF6z4=; b=VxFmgjjnmJ9L5nxd2
	it1jI8YbPahhGFRu4ozXJZgI4CRlBkS9s2Wzg+hLHyd8VOu6SVY+VKUNtIT9tzFh
	nqpvsb5pC7U0NfcQu3PLyIMKTqdnWNKw+iF/FXwiY1xTmNntfwEBMYSTZuTPALSa
	RzudieqW9kulq6qp43REUXZbaVLp1FcGQeMOFywQgWnypm5GQgonNQVdPWu27zdu
	wdG59L4sLvIvd6rIecltEhWFsergszbV24nTpd82JxJOYi7kodRcycwEZ4snz45r
	Exu9xAURY+XWVQcPXPoyYI7laj/AUJTIHfokdUhct72+fUrkLXnKhCuAxf2uuvXq
	N7JIA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfybhxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 09:44:53 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 14:44:51 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 14:44:51 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DACA6820244;
	Mon, 25 Mar 2024 14:44:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs-amp-lib: Check for no firmware controls when writing
 calibration
Date: Mon, 25 Mar 2024 14:44:50 +0000
Message-ID: <20240325144450.293630-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GgbbWgh-nZxqA48C84fnxwXmq9jvAe4f
X-Proofpoint-GUID: GgbbWgh-nZxqA48C84fnxwXmq9jvAe4f
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Z4HPIT37D4CINXPY7O5HAO6PKV7U4FJ7
X-Message-ID-Hash: Z4HPIT37D4CINXPY7O5HAO6PKV7U4FJ7
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4HPIT37D4CINXPY7O5HAO6PKV7U4FJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

When a wmfw file has not been loaded the firmware control descriptions
necessary to write a stored calibration are not present. In this case
print a more descriptive error message.

The message is logged at info level because it is not fatal, and does
not necessarily imply that anything is broken.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 01ef4db5407d..287ac01a3873 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -56,6 +56,11 @@ static int _cs_amp_write_cal_coeffs(struct cs_dsp *dsp,
 	dev_dbg(dsp->dev, "Calibration: Ambient=%#x, Status=%#x, CalR=%d\n",
 		data->calAmbient, data->calStatus, data->calR);
 
+	if (list_empty(&dsp->ctl_list)) {
+		dev_info(dsp->dev, "Calibration disabled due to missing firmware controls\n");
+		return -ENOENT;
+	}
+
 	ret = cs_amp_write_cal_coeff(dsp, controls, controls->ambient, data->calAmbient);
 	if (ret)
 		return ret;
-- 
2.39.2

