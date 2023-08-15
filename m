Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EB77CCF1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 14:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041D4832;
	Tue, 15 Aug 2023 14:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041D4832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692103900;
	bh=mCDefCoSl2juPKC9ahyWIbMy6EQMPzAZLu1oxaVBTwg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WZu1vgiENxDvdXmZ0hdpbz+qK383XzOv32CTxJVTCT5gjACfiUICVRd6crBqhaHDt
	 6bld11tuL8ekPfSRDCalmlvIN20dpCGMEz9Ld4yQqNfGGh3dD8tz/RME+/1f45hglU
	 XIfQyaH0QL52FAqdre8NO7rvekaCGQN7BlF+Ztz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57A0F80557; Tue, 15 Aug 2023 14:49:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B91FF80027;
	Tue, 15 Aug 2023 14:49:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD43DF801EB; Tue, 15 Aug 2023 14:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9CB6F8016D
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 14:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9CB6F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VJsqiNUX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37FC59WG010995;
	Tue, 15 Aug 2023 07:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=7cFx1ctLJ56NlPPqEsUOtWiqLtYmd8Fn1JuskYJ9KW8=; b=
	VJsqiNUXm8I+Q34IiPjo7JVgRke65CZnvS3oSoldbb/YZiLu6I0EPvIommTiMhEU
	QOusKe186ApqjdNMXXmGj8OgwjjmJRJn/wZ6wonPyUH/L0m0Mwf/vEEWulqd58d5
	WevD8LrtZgexWKDgYYw9nNeYaRCsD9mEUuVRvEMj6lbQVYQmlBdQcZm3tf2xbRuB
	bUlBgHo4ZWAyI+x/dTrwbmsJtgItWPwNFqRHmxMi8LlF9VuM2BSWdqbj8jIiC2vu
	KHivnV1Ysa/FsDhMMaUrE7himOv7kwCaZmx+vLjwi4N59PrPj42so2sO5vwmZCy+
	wn+dpptUN3O8rij1WJigng==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3se6uhjxk4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 07:48:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 15 Aug
 2023 13:48:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 15 Aug 2023 13:48:29 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A9BD215B4;
	Tue, 15 Aug 2023 12:48:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs35l56: Don't overwrite a patched firmware
Date: Tue, 15 Aug 2023 13:48:26 +0100
Message-ID: <20230815124826.5447-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815124826.5447-1-rf@opensource.cirrus.com>
References: <20230815124826.5447-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zcxfjfH8LkAVNrQA1ohl-2m3-2gfwBEB
X-Proofpoint-ORIG-GUID: zcxfjfH8LkAVNrQA1ohl-2m3-2gfwBEB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EGR4XZFLZEAHXL5IODRKZHK3JSWMS4M2
X-Message-ID-Hash: EGR4XZFLZEAHXL5IODRKZHK3JSWMS4M2
X-MailFrom: prvs=3591ab1424=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGR4XZFLZEAHXL5IODRKZHK3JSWMS4M2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Only attempt to download wmfw/bin files to a non-secured part if
it reports FIRMWARE_MISSING. If FIRMWARE_MISSING is false the
firmware has already been patched and overwriting the patch could
corrupt the running firmware.

For a secured part the wmfw/bin can be downloaded even if
FIRMWARE_MISSING is false, because they will only patch tunings.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 98cfcae554af..3a9ec8724cc1 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -665,8 +665,17 @@ static void cs35l56_secure_patch(struct cs35l56_private *cs35l56)
 
 static void cs35l56_patch(struct cs35l56_private *cs35l56)
 {
+	unsigned int firmware_missing;
 	int ret;
 
+	ret = regmap_read(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS, &firmware_missing);
+	if (ret) {
+		dev_err(cs35l56->base.dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
+		return;
+	}
+
+	firmware_missing &= CS35L56_FIRMWARE_MISSING;
+
 	/*
 	 * Disable SoundWire interrupts to prevent race with IRQ work.
 	 * Setting sdw_irq_no_unmask prevents the handler re-enabling
@@ -685,8 +694,12 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 	if (ret)
 		goto err;
 
-	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
-	ret = wm_adsp_power_up(&cs35l56->dsp, true);
+	/*
+	 * Use wm_adsp to load and apply the firmware patch and coefficient files,
+	 * but only if firmware is missing. If firmware is already patched just
+	 * power-up wm_adsp without downloading firmware.
+	 */
+	ret = wm_adsp_power_up(&cs35l56->dsp, !!firmware_missing);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
 		goto err;
-- 
2.30.2

