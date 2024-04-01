Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A68939EA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AAB3218B;
	Mon,  1 Apr 2024 12:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AAB3218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711965777;
	bh=+iI5RpOodzmJXIcv8TNfNZngHxLuBoKhh3Wx6e3sdys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oDnRweEBRyNSoLgPBRKPDHsWqs8Ol+zfdSU2q2IhM4LcwyoIdSfHhE+uEWwl5IPwb
	 knbooTNwNm2JE0BOScGX3jtWEGplixcAQdoRggPPkMLutkdOd6QWM/CI7e6PnWjm+6
	 72nAosJ2rFV92UXnYO1/8EdWuCqXWAHbepBp0sOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C53F4F80587; Mon,  1 Apr 2024 12:02:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0C8F80570;
	Mon,  1 Apr 2024 12:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AFF6F80238; Mon,  1 Apr 2024 12:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB68EF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB68EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mgLiezN4
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4315mEb2029960;
	Mon, 1 Apr 2024 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=sQ1IUPXI8DEMkqDZPY9mFbPrpEApJsB5PFIBxvjEGNc=; b=
	mgLiezN4B9M97zdJa2B9mJJIlEvdtKAmQvQ25qj9x0iq+Sr2H3eXRhZ0ErK9EDUo
	sxvU5EnRtLh16L9VCgJSLyEbnIC+cGnHWEdMnxwENAd4gniY3rzGhbP/aoOJPaTc
	ZBznDgrJvUOHrWAPMAOKURns0GBqJv8W0rU/3jcxt1VaUMk83pctHMNTnBCFXi2M
	UgHxMt1QVl3D7aB3cBDmf2NJiQIGf9wecNhpYg2gbORMXHL6mGtOTdll6PepU5Xw
	l934i0pbwJbuq4NKDWOAJHIZxlXM08ZnpDkH5BFfRyW3DwWtOdTTB8Q+4RQgccmm
	BOMv5wKrFDNSTj17GWAMxQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x6g4xhtw6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 05:02:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Apr 2024
 11:02:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 1 Apr 2024 11:02:10 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3AFD482026C;
	Mon,  1 Apr 2024 10:02:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 1/3] ALSA: control: Introduce
 snd_ctl_find_id_mixer_locked()
Date: Mon, 1 Apr 2024 10:02:08 +0000
Message-ID: <20240401100210.61277-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240401100210.61277-1-rf@opensource.cirrus.com>
References: <20240401100210.61277-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jYmcIEZ1JebaiO2pZCLbge7bIdn-bFPC
X-Proofpoint-GUID: jYmcIEZ1JebaiO2pZCLbge7bIdn-bFPC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: USVW2N6XMRTN73OQ3UIKZNAOW5SD7YP4
X-Message-ID-Hash: USVW2N6XMRTN73OQ3UIKZNAOW5SD7YP4
X-MailFrom: prvs=1821bd3749=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USVW2N6XMRTN73OQ3UIKZNAOW5SD7YP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds wrapper function snd_ctl_find_id_mixer_locked(). This is
identical to snd_ctl_find_id_mixer() except that it can be called
from code that is already holding controls_rwsem.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/control.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index 9a4f4f7138da..c1659036c4a7 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -167,6 +167,29 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 	return snd_ctl_find_id(card, &id);
 }
 
+/**
+ * snd_ctl_find_id_mixer_locked - find the control instance with the given name string
+ * @card: the card instance
+ * @name: the name string
+ *
+ * Finds the control instance with the given name and
+ * @SNDRV_CTL_ELEM_IFACE_MIXER. Other fields are set to zero.
+ *
+ * This is merely a wrapper to snd_ctl_find_id_locked().
+ * The caller must down card->controls_rwsem before calling this function.
+ *
+ * Return: The pointer of the instance if found, or %NULL if not.
+ */
+static inline struct snd_kcontrol *
+snd_ctl_find_id_mixer_locked(struct snd_card *card, const char *name)
+{
+	struct snd_ctl_elem_id id = {};
+
+	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	strscpy(id.name, name, sizeof(id.name));
+	return snd_ctl_find_id_locked(card, &id);
+}
+
 int snd_ctl_create(struct snd_card *card);
 
 int snd_ctl_register_ioctl(snd_kctl_ioctl_func_t fcn);
-- 
2.39.2

