Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FFB15FF1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 14:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE89660222;
	Wed, 30 Jul 2025 14:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE89660222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753877173;
	bh=cphQ01oXi2gDkQyo0GXS1R2C6OmqmjfzGSY01/UYKQI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jHeHFMMHkIIptXldXxr6wYevjZKiEsZYjzrtU3k/xafllqwCKv+o8OXQmTtpJTvUG
	 97aGgh+9oD9cDiM+hBZ31M/N7F+irVi6mhcbh+undqgIAc4sXcfnMrUCbArolIQeXB
	 m3kss0RT1x3uv39NdFTdizN8BJizTBADMBdTDy6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58596F805C7; Wed, 30 Jul 2025 14:05:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1744DF805C5;
	Wed, 30 Jul 2025 14:05:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC1F3F80254; Tue, 29 Jul 2025 15:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1149AF80217
	for <alsa-devel@alsa-project.org>; Tue, 29 Jul 2025 15:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1149AF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=X5wory8M
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TD0LpF2967271;
	Tue, 29 Jul 2025 08:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753794021;
	bh=QqAobOTYQe6WECehT+kMwZtUBsShs9456vNKAow6d+s=;
	h=From:To:CC:Subject:Date;
	b=X5wory8MKkZNlFH5Qz6P0+XNppoYf2fOx4mw5r+FuHwwKXUdgtMptafmZELaooWwY
	 ZHfDLKjIto0L8UJI6JGjyZX2PRy2JFhdCUO1snsAmWkEJWEOjIMup8ShTJ/lFwXaFj
	 VMQtLsB8apo2Lgdkso71YNC6ABhwP8K1joi7ctpE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TD0KxX2461250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 08:00:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 08:00:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 08:00:20 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TD0D7t3745895;
	Tue, 29 Jul 2025 08:00:14 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <13916275206@139.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda: Fix the wrong register was used for DVC of
 TAS2770
Date: Tue, 29 Jul 2025 20:59:38 +0800
Message-ID: <20250729125938.54696-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XFE2LMLPIKYXA3VVCRG5OIOTI6GSETSY
X-Message-ID-Hash: XFE2LMLPIKYXA3VVCRG5OIOTI6GSETSY
X-Mailman-Approved-At: Wed, 30 Jul 2025 12:05:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFE2LMLPIKYXA3VVCRG5OIOTI6GSETSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wrong register was used for digital volume control of TAS2770,
The definition was changed, and usage was also updated.

Fixes: ab29b3460c5c ("ALSA: hda: Add TAS2770 support")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2770-tlv.h                    | 4 ++--
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2770-tlv.h b/include/sound/tas2770-tlv.h
index c0bd495b4a07..5518b34abdde 100644
--- a/include/sound/tas2770-tlv.h
+++ b/include/sound/tas2770-tlv.h
@@ -14,10 +14,10 @@
 #ifndef __TAS2770_TLV_H__
 #define __TAS2770_TLV_H__
 
-#define TAS2770_DVC_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x17)
+#define TAS2770_DVC_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x05)
 #define TAS2770_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
 
-static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2770_dvc_tlv, 1650, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2770_dvc_tlv, -1000, 50, 0);
 static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2770_amp_tlv, 1100, 50, 0);
 
 #endif
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index a0b132681804..45ac5e41bd4f 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -260,7 +260,7 @@ static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 		0, 0, 20, 0, tas2781_amp_getvol,
 		tas2781_amp_putvol, tas2770_amp_tlv),
 	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2770_DVC_LEVEL,
-		0, 0, 31, 0, tas2781_amp_getvol,
+		0, 0, 200, 1, tas2781_amp_getvol,
 		tas2781_amp_putvol, tas2770_dvc_tlv),
 };
 
-- 
2.43.0

