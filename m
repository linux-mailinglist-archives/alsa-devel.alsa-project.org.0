Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5B90739C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 15:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C5A84D;
	Thu, 13 Jun 2024 15:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C5A84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718285178;
	bh=otKnNwmTl47Y+PbQBlbwCrWVzfE2P+8LqNZPwfX67D4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HBazdYFXoPmRtHzQBQ0jw/w4Po/xnCw9XZqFH0mj/l5wzA8K8M/7KzUB6CQWP/hhj
	 GAchXh9naITtNoLBuYGBN9+6JDqiT9gF7bLDEcSMHslFRdNpgijc0haBg+s5yOtNGs
	 S/GStvV3ujG58SFgqxaYWxiL248y9/oYqxP9BOMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3EA1F8058C; Thu, 13 Jun 2024 15:25:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A379F805A0;
	Thu, 13 Jun 2024 15:25:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3397F8057A; Thu, 13 Jun 2024 15:25:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35FDAF80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 15:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FDAF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o4Z1i9mg
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45D4sfko018676;
	Thu, 13 Jun 2024 08:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=bb9yvMb9fDm9Pe8Y
	FL1Np+oq8NPrqD6syse4d2JmCE0=; b=o4Z1i9mgK8jBPKUtHNPNfchKEolX6vDS
	Kv58V64gt21MO5Fd6XOnnC3YOC264HWG4f+sOa5yySE8xgXMfZzoZFmI73aueW9a
	TpIzoflSDuiB5TY5JScz9FxB8nw65SAeya2JfDRgaYpXmspFilOwMfM3koa1UgjC
	jfE7aB+RO3mY/3SdABQFq9gWujA2q4gOC+OB2vAGnueeVaU0fHS6LZse6oOsJtKV
	6alLTOx7okBOI4q+8jW85xpLiyVotQvp8+Ri1z/9W4Sroam4yHK1d04bTMvJmTCd
	ybfUsr6/6VMGS1NYLvmN8CSPxjSGrmHf8L64Pj8nIMRagkfdePvazQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8ehbvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:25:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:25:27 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:25:27 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 32276820248;
	Thu, 13 Jun 2024 13:25:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH v2] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI is
 hooked up
Date: Thu, 13 Jun 2024 14:25:27 +0100
Message-ID: <20240613132527.46537-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RXCkLoGtsnwYlYJ9qJ1LyLQ8Yd7zjW6c
X-Proofpoint-GUID: RXCkLoGtsnwYlYJ9qJ1LyLQ8Yd7zjW6c
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BKPFROSX3BOQVOOTJ42UEJHXKGCUPWRI
X-Message-ID-Hash: BKPFROSX3BOQVOOTJ42UEJHXKGCUPWRI
X-MailFrom: prvs=3894fd9157=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKPFROSX3BOQVOOTJ42UEJHXKGCUPWRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
sources should be initialized to disconnected. There aren't currently
any available products using the ASP so this doesn't affect any
existing systems.

The cs35l56 does not have any fixed default for the mixer source
registers. When the cs35l56 boots, its firmware patches these registers
to setup a system-specific routing; this is so that Windows can use
generic SDCA drivers instead of needing knowledge of chip-specific
registers. The setup varies between end-products, which each have
customized firmware, and so the default register state varies between
end-products. It can also change if the firmware on an end-product is
upgraded - for example if a change was needed to the routing for Windows
use-cases. It must be emphasized that the settings applied by the
firmware are not internal magic tuning; they are statically implementing
use-case setup that on Linux would be done via ALSA controls.

The driver is currently syncing the mixer controls with whatever
initial state the firmware wrote to the registers, so that they report
the actual audio routing. But if the ASP DAI is hooked up this can create
a powered-up DAPM graph without anything intentionally setting up a path.
This can lead to parts of the audio system powering up unexpectedly.

For example when cs35l56 is connected to cs42l43 using a codec-codec link,
this can create a complete DAPM graph which then powers-up cs42l43. But
the cs42l43 can only be clocked from its SoundWire bus so this causes a
bunch of errors in the kernel log where cs42l43 is unexpectedly powered-up
without a clock.

If the host is taking ownership of the ASP (either directly or as a
codec-to-codec link) there is no need to keep the mixer settings that the
firmware wrote. The driver has ALSA controls for setting these using
standard Linux mechanisms. So if the machine driver hooks up the ASP the
ASP mixers are initialized to "None" (no input). This prevents unintended
DAPM-graph power-ups, and means the initial state of the mixers is
always going to be None.

Since the initial state of the mixers can vary from system to system and
potentially between firmware upgrades, no use-case manager can currently
assume that cs35l56 has a known initial state. The firmware could just as
easily default them to "None" as to any input source. So defaulting them
to "None" in the driver is not increasing the entropy of the system.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e89027cd40d1..27869e14e9c8 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -215,6 +215,10 @@ static const struct reg_sequence cs35l56_asp1_defaults[] = {
 	REG_SEQ0(CS35L56_ASP1_FRAME_CONTROL5,	0x00020100),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL1,	0x00000018),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL5,	0x00000018),
+	REG_SEQ0(CS35L56_ASP1TX1_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX2_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX3_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX4_INPUT,		0x00000000),
 };
 
 /*
-- 
2.39.2

