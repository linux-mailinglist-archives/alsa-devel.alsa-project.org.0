Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9706A37F5D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F7B601EA;
	Mon, 17 Feb 2025 11:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F7B601EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786899;
	bh=e2TVzUbRqBCxTVqTlfUdnaIbDJGEbaayIa/i2ReZiNw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a5KEI9AEDzEkgKT5LZWbDi/RHWjJm+RQK2sZiAbdDBHJXwjo5O07zMrHtDlxjeQUT
	 /Cb2EzQNfsXYSQgSkATGqYmpfCisO4B1UJxXTNvuTVvWJkQiSDzTJShrVPRtWOWahK
	 BG1RQqXMCUurkxGm+BIm4pJgkKfSWADycq0sYMZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5D8EF8060A; Mon, 17 Feb 2025 11:07:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 394DAF805FB;
	Mon, 17 Feb 2025 11:07:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC7F8F801F5; Wed,  5 Feb 2025 00:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F15ACF80525
	for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2025 00:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15ACF80525
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qmATbGk+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 514FmWAQ029190;
	Tue, 4 Feb 2025 17:19:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iwVGm2zIZxv30QAxGxxXgudWn5/8W/GZ/AyWJMQKILI=; b=
	qmATbGk+dCT6TqCrWx5EByS1QmaxM3kGEU55NF+y9IWGYnwWQEMQs2tgFUcCs3yv
	C+tFM2hN5y7iGZ++PJH2W75G5CB15cKTXOfuXAFV6/hL57rFoZEWsA5SyxKusTJc
	qXbCkjXLgrMhqIcS18sOghm8ybFO9x6fXdENN/m/AgF2x+X2lUOXVScvmXUvW0QT
	ibznDUU8fwbFUSvNv9mzN+NkEgBxJK3BQnyzl5hukLb5q2BnBbhnMa20+BXmyYRg
	q5yP4TloRtDWsfYzApAi3H2he0ft+zLZ9lL+ihG3v0wv49b2qqQy75K7/THv4E6G
	67XFNc5a8hD6wvXENWUR+A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53pk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:19:32 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:19:29 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:19:24 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7CF3F820248;
	Tue,  4 Feb 2025 23:19:20 +0000 (UTC)
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
Subject: [PATCH RESEND 1/7] firmware: cs_dsp: Fix error checking in
 wseq_write()
Date: Tue, 4 Feb 2025 17:18:30 -0600
Message-ID: <20250204231835.2000457-2-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LLWwZEzpZPzgeIlQ15q6_d9H5f4dIMCe
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a2a084 cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=b0R_zkI-s6yCh7IOb7YA:9
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: LLWwZEzpZPzgeIlQ15q6_d9H5f4dIMCe
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=113024ff55=ftreven@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KI44XNL2CNW6QWQKPQ35WCKREGDXNQNJ
X-Message-ID-Hash: KI44XNL2CNW6QWQKPQ35WCKREGDXNQNJ
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KI44XNL2CNW6QWQKPQ35WCKREGDXNQNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cs_dsp_coeff_write_ctrl() may return a non-zero value (1)
upon success. Change error checking in the write sequencer
code such that it checks for negative errnos rather than
any non-zero value when using this function.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5365e9a43000..56315b0b5583 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3702,7 +3702,7 @@ int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
 					      &op_end->data, sizeof(u32));
-		if (ret)
+		if (ret < 0)
 			goto op_new_free;
 
 		list_add_tail(&op_new->list, &op_end->list);
@@ -3710,7 +3710,7 @@ int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 	ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_new->offset / sizeof(u32),
 				      words, new_op_size);
-	if (ret)
+	if (ret < 0)
 		goto op_new_free;
 
 	return 0;
-- 
2.34.1

