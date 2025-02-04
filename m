Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35594A37F61
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23DA46028A;
	Mon, 17 Feb 2025 11:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23DA46028A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786911;
	bh=1Ndbk2BaIajsSq6LVjOKCXHTVo6NfBh3Ifl5W7zU9q4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QvSi4jjvmISJ2WFvwP3JjbTqCBX4qrSc/trC6a6MXhRTEe8BxE+qIQ7cXF93UyI5r
	 iqb6uvduMgLDxStgaYGYLmPZb6d+M1v5IcS0LUIlTFt7D5AdYKcUTpB27exV05G9xW
	 KLa0EGPUYQN07Be4166CCS+sZnPT/Dvdj7ZUysPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09BBEF80619; Mon, 17 Feb 2025 11:07:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B4FF80611;
	Mon, 17 Feb 2025 11:07:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A38F80525; Wed,  5 Feb 2025 00:19:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DD5BF801F5
	for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2025 00:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD5BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fXsSkeXF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 514Klioc016339;
	Tue, 4 Feb 2025 17:19:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4rk84s04nJmPDhNfVK0qQcCyoF1+d6Q1J1vzsSv4K4c=; b=
	fXsSkeXFyA3zFwkflPotTk/AvJWBN7rwXu9+spJWWZf3DFgttkG+ZQ16iGddrTJ2
	c9A5rzMb7mh9d6Fg3Bozyr6W4IZ46E1tIuVgmtNOjfTXKLmBCihoYq0xg77UhqrQ
	cbL/8BZ0XOimg6VoGFExUUqYfuLjCpthTjksSa7T8+Lr4x39P2EsJlYVrZSDWe6C
	qhKlBajk1ZgrRO4JBMx40u1aQ4dRhjWXnUQH8tXW6eUugXZL7hWvQqUjQk0+2pup
	5/sz7ahhHNe5KvSyXrA02UCrgP2L6El8Tozj3SfdWuKg/dJolP+3a8y+RU8nhVTJ
	7Mzx1Yk1lWKPXnnPRLAXzw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3spw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:19:43 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:19:41 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:19:36 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5020F820248;
	Tue,  4 Feb 2025 23:19:32 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH RESEND 2/7] firmware: cs_dsp: Check for valid num_regs in
 cs_dsp_wseq_multi_write()
Date: Tue, 4 Feb 2025 17:18:31 -0600
Message-ID: <20250204231835.2000457-3-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a2a08f cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=pYzt1GAZzx6qoJfKPqoA:9 a=zZCYzV9kfG8A:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: QwIhPN2wXpUWh2VjXVyow-eG4EN6tgsG
X-Proofpoint-GUID: QwIhPN2wXpUWh2VjXVyow-eG4EN6tgsG
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=113024ff55=ftreven@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZWDG4KGCMF2FIQNR6K65RPK3CJF6HDBQ
X-Message-ID-Hash: ZWDG4KGCMF2FIQNR6K65RPK3CJF6HDBQ
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWDG4KGCMF2FIQNR6K65RPK3CJF6HDBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If a value of 0 or below is passed into cs_dsp_wseq_multi_write()
the function will never enter its for loop.

Verify that num_regs passed into the function is valid
and throw a user-visible error if not.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 56315b0b5583..aacf6960d1ea 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3743,6 +3743,11 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 {
 	int i, ret;
 
+	if (num_regs <= 0) {
+		cs_dsp_err(dsp, "Invalid number of regs: %d\n", num_regs);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < num_regs; i++) {
 		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
 					reg_seq[i].def, op_code, update);
-- 
2.34.1

