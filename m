Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEB7D8593
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599F6A4A;
	Thu, 26 Oct 2023 17:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599F6A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698332884;
	bh=w/WBIzk1c8Px22k6L+s4Kg78OXA0Ud9fG9jpz0Igzac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u6I7AgiiC8oAcUSo8d8iQofzkUbv5nXqUa69b1Z/BoJyedx6lufsQfEq7lU/aSgUE
	 Z08/TbKAVRIzIQ6Fhtye8WMOHQ3WuSGlyqbqNO1mSECnAvhdq+x6ArNSZnwPoILcLz
	 kgKsVL5RqCW4w+cVsJrPo6CKJnuzpDgWy/9tVy6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A09F80568; Thu, 26 Oct 2023 17:06:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16073F80568;
	Thu, 26 Oct 2023 17:06:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B815F8028D; Thu, 26 Oct 2023 17:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A795F8019B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A795F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KvitG4L1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39QF2DtX011762;
	Thu, 26 Oct 2023 10:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=P2RZ5FPl+x4KIbUrLBvQodtbr+Kus6IGLLMqcPJmaeY=; b=
	KvitG4L1GV+7ZfKxNWN2mxEFrAf1OxqyEMvuS2j5d10rTK1ttAjT3if8guwQUEhe
	FkjQtu8KLhfeaxBAgW1FqV9zYmxn7ZB+FLDM+3v9zy9GKFjOUWEGoICZjrS7b/Hn
	upRUgOYVed7K/ng/GW2nEieN/ogKDH5I1jL0ugy4GqZzi2pY9YFerD21lt1j26ci
	ZsIuyd/VlsZy2ObrDfTN3jw9vdDDZx6CUknvTvTDfRqhbsijaW8ZfRo5l9TKWe+n
	ywRvJrvOsDVKU8y3X/4myxbO8iH+727YGY2pYv+/0IXGBnYVuqTXGcav+AvtzN9o
	M8haN7gnf6lXFB2XWkqcbg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tvb2j6tep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:06:11 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 16:06:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 16:06:09 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.177])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 681BF11AA;
	Thu, 26 Oct 2023 15:06:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Mark
 Brown" <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 8/8] ASoC: cs35l41: Detect CSPL errors when sending CSPL
 commands
Date: Thu, 26 Oct 2023 16:05:58 +0100
Message-ID: <20231026150558.2105827-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
References: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2mnMNV1ezLHzUEslcCyFHivS6CNyn6IL
X-Proofpoint-ORIG-GUID: 2mnMNV1ezLHzUEslcCyFHivS6CNyn6IL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ETVRHJ5F3ANXK7UW2SQAWS4FG3Z7BKOL
X-Message-ID-Hash: ETVRHJ5F3ANXK7UW2SQAWS4FG3Z7BKOL
X-MailFrom: prvs=56633e4941=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETVRHJ5F3ANXK7UW2SQAWS4FG3Z7BKOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code checks for the correct state transition after sending
a command. However, it is possible for the message box to return -1,
which indicates an error, if an error has occurred in the firmware.
We can detect if the error has occurred, and return a different error.
In addition, there is no recovering from a CSPL error, so the retry
mechanism is not needed in this case, and we can return immediately.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l41.h        | 2 ++
 sound/soc/codecs/cs35l41-lib.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 80df80fe31e2..043f8ac65dbf 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -816,6 +816,8 @@ struct cs35l41_otp_map_element_t {
 };
 
 enum cs35l41_cspl_mbox_status {
+	CSPL_MBOX_STS_ERROR = U32_MAX,
+	CSPL_MBOX_STS_ERROR2 = 0x00ffffff, // firmware not always sign-extending 24-bit value
 	CSPL_MBOX_STS_RUNNING = 0,
 	CSPL_MBOX_STS_PAUSED = 1,
 	CSPL_MBOX_STS_RDY_FOR_REINIT = 2,
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index ddedb7e63cb6..4569e4f7cf7e 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1474,6 +1474,11 @@ int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			continue;
 		}
 
+		if (sts == CSPL_MBOX_STS_ERROR || sts == CSPL_MBOX_STS_ERROR2) {
+			dev_err(dev, "CSPL Error Detected\n");
+			return -EINVAL;
+		}
+
 		if (!cs35l41_check_cspl_mbox_sts(cmd, sts))
 			dev_dbg(dev, "[%u] cmd %u returned invalid sts %u", i, cmd, sts);
 		else
-- 
2.34.1

