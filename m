Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD57791B1E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 18:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DC9741;
	Mon,  4 Sep 2023 18:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DC9741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693843623;
	bh=ns2haKoLmYEyDofv3seV9g3dNL5gOXUPZXkAga/JbAw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k9gsXkLzNYCzK6gkyJavrUSvWQldvKKMigf/c9DLeiZsfalkTq9XTrknXozdihU2O
	 lqjjodEkrNyy8HPoL5d46k44T39cH/lffbCNvlQssy/Q2pj36zu5ODbvYwMpYnm34z
	 cZhl4SCYsmtXuljW16Arp5RaZ26iHosa4MRrAPus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29330F80527; Mon,  4 Sep 2023 18:06:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6936F80431;
	Mon,  4 Sep 2023 18:06:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC38F8047D; Mon,  4 Sep 2023 18:03:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BD42F80431
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 18:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD42F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IHyUcogQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 384FucYc024881;
	Mon, 4 Sep 2023 11:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	QlUtlxlF6Opmaia7IykypffgHqprXrCNqsK+uQbJ/s=; b=IHyUcogQrIecMjcoh
	6qgiUO6tB+CvLZrxHdmAp+HQZRKSTk9mnyMkf7XiARpMVBXHnxNFD14k5rk4VuK1
	trljbIAmvhVX2BByW4/0ncPSD6jH21sHfJCQgOZFHdQ/SQNulquvWYMIDxVnSlHb
	bgbiEIzk574SY9vfps4dEK08MHVg58pHd/ZXcQ3AKk8qO9N0PF91zYL48p5ypovD
	9UnQQFQFqFZ6Cna/17nNmjMo8ACr/Uia3umskY+aivDAPPrfZZcUXbLG1u60AJxt
	KdxyOAE7fNhb5aZvtn/AUkula3lQKfb6rrvRfrFqh7twNl4I7SJFvmcoktzH4QJQ
	+10OQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex2h0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 11:00:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 4 Sep
 2023 17:00:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 4 Sep 2023 17:00:50 +0100
Received: from lon-bigdaddy.ad.cirrus.com (EDIN8DL6Q13.ad.cirrus.com
 [198.61.65.94])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D7FC6B06;
	Mon,  4 Sep 2023 16:00:49 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/cirrus: Fix broken audio on hardware with two
 CS42L42 codecs.
Date: Mon, 4 Sep 2023 17:00:33 +0100
Message-ID: <20230904160033.908135-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OV6jqtEfgAPbh_mZXziWqXpPMMNihcyK
X-Proofpoint-GUID: OV6jqtEfgAPbh_mZXziWqXpPMMNihcyK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MNYDVKRKL2TIKYI7ZCFTVRCLCV7VGGTL
X-Message-ID-Hash: MNYDVKRKL2TIKYI7ZCFTVRCLCV7VGGTL
X-MailFrom: prvs=46111fec53=vitalyr@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNYDVKRKL2TIKYI7ZCFTVRCLCV7VGGTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recently in v6.3-rc1 there was a change affecting behaviour of hrtimers
(commit 0c52310f260014d95c1310364379772cb74cf82d) and causing
few issues on platforms with two CS42L42 codecs. Canonical/Dell
has reported an issue with Vostro-3910.
We need to increase this value by 15ms.

Link: https://bugs.launchpad.net/somerville/+bug/2031060
Fixes: 9fb9fa18fb50 (ALSA: hda/cirrus: Add extra 10 ms delay to allow PLL settle and lock.)

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 2 +-
 sound/pci/hda/patch_cs8409.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 0ba1fbcbb21e..627899959ffe 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -888,7 +888,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 
 	/* Initialize CS42L42 companion codec */
 	cs8409_i2c_bulk_write(cs42l42, cs42l42->init_seq, cs42l42->init_seq_num);
-	usleep_range(30000, 35000);
+	msleep(CS42L42_INIT_TIMEOUT_MS);
 
 	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 2a8dfb4ff046..937e9387abdc 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -229,6 +229,7 @@ enum cs8409_coefficient_index_registers {
 #define CS42L42_I2C_SLEEP_US			(2000)
 #define CS42L42_PDN_TIMEOUT_US			(250000)
 #define CS42L42_PDN_SLEEP_US			(2000)
+#define CS42L42_INIT_TIMEOUT_MS			(45)
 #define CS42L42_FULL_SCALE_VOL_MASK		(2)
 #define CS42L42_FULL_SCALE_VOL_0DB		(1)
 #define CS42L42_FULL_SCALE_VOL_MINUS6DB		(0)
-- 
2.34.1

