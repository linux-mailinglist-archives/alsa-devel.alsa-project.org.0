Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F3C474A3
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:44:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20FF160228;
	Mon, 10 Nov 2025 15:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20FF160228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785844;
	bh=MhhH9LXJGN4R7Y0FqgVQgQuW98T4GJNZ7YMlyeibkLY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KrxLZWCLzOeMm2nwLFL6pWgb93B2AVLdhhrpCTLl8BdOJfcUsFtGW3gAG0wh0I42O
	 ZGEC8R8c0urMLhi9Nd1f+UPFSQktoMyvs8z/x7VfYestrKiIaAWmXBTmQj5jDRsWws
	 CQDiGHKs59L8Oll4QCs537mYt4UFfMcFTCtF+X9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A479DF8087A; Mon, 10 Nov 2025 15:40:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0651F8085E;
	Mon, 10 Nov 2025 15:40:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AACFBF80254; Fri, 12 Sep 2025 10:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98DADF800E3
	for <alsa-devel@alsa-project.org>; Fri, 12 Sep 2025 10:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DADF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=CwGgNa0P
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C8amE7482229;
	Fri, 12 Sep 2025 03:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757666208;
	bh=9nkN+NI9wrmL/iDvR/+6HKvHtpQGMFSVKg9nB/1kBMA=;
	h=From:To:CC:Subject:Date;
	b=CwGgNa0PSxevp/BewGSp+WT+cY5EAAWrBccQhCXtj+h/jomkBQ30kavdVd+cjkedh
	 +9ZhpwCBpPPMKTMIC8c8vE92dweZcY99h/s5Quky4q2jJNkiFTWe+qVQbjhyxjEnHX
	 XtXL3ZtABkvAfPc/b0nyYCd01pCDptJnK1IL044U=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C8amEi1849751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 03:36:48 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 03:36:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 03:36:47 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C8afm93320658;
	Fri, 12 Sep 2025 03:36:42 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Date: Fri, 12 Sep 2025 14:06:20 +0530
Message-ID: <20250912083624.804-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YF24MOHDCMHTDU2IYOWYPLDKVEBT3YTW
X-Message-ID-Hash: YF24MOHDCMHTDU2IYOWYPLDKVEBT3YTW
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF24MOHDCMHTDU2IYOWYPLDKVEBT3YTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* add error handling in case register read fails
* clamp the values if the register value read is
  out of range

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
--
v5:
 - remove clamp parameter
 - move the boundary check after sign-bit extension
---
 sound/soc/soc-ops.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a629e0eac..03f74c32d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -118,6 +118,7 @@ static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_v
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
+	val = clamp(val, mc->min, mc->max);
 	val -= mc->min;
 
 	if (mc->invert)
@@ -249,9 +250,15 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
-	int val;
+	int val, ret = 0;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
+	val = reg_val;
+	if (val < 0) {
+		ret = val;
+		goto get_volsw_done;
+	}
+
 	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 
 	ucontrol->value.integer.value[0] = val;
@@ -261,13 +268,19 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
+			val = reg_val;
+			if (val < 0) {
+				ret = val;
+				goto get_volsw_done;
+			}
 			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 		}
 
 		ucontrol->value.integer.value[1] = val;
 	}
 
-	return 0;
+get_volsw_done:
+	return ret;
 }
 
 /**
-- 
2.45.2

