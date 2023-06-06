Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB008723FBE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 12:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD4683E;
	Tue,  6 Jun 2023 12:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD4683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686047809;
	bh=alKWVgjfq8xrpGOiVAYzllurp6S2uHsXxzt/Ue2nefo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I/t2J7mjio42Xk8ETGoBT2oZ+IPp8IvGJ5+9+DvDm1wO5L/jN2YVylV3fOkl4g9Pp
	 XNU73dRiUuIJFBqGyuCn471L+5CbVgVDZLZ/UyfQYwv6YPm79lpKIruGbyr+PBHilM
	 dJGeBi8sS+VRM69WQcAudlC3ZSoSREiKBCqIHcGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E009F8057A; Tue,  6 Jun 2023 12:35:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B466F80571;
	Tue,  6 Jun 2023 12:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54236F80254; Tue,  6 Jun 2023 12:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92B41F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 12:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B41F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K/jiTA2C
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3565OZKp029668;
	Tue, 6 Jun 2023 05:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AyhWPP1kgYcDXpfUImk0iDeFfbb+pb4A3CvCDnU8C2g=;
 b=K/jiTA2CBi2wOKTjOSv7HS0TE6h7sEgf3FNeKuNdKnDqt49DJj1VnubDc1mfTnLRBMFS
 FG0oZs7nF3QEFg/zO1SFg7aUeQ6gMpUXlVRL/LWHFgV9UrMM6TQe4fjD++Y6orQiKLLb
 3HLgrCsYIGmKH+UGc5Av6rIVqpqSCntU/o7uIsMJS68OpWnylMwCr8LJzKWc4tuHSAjy
 SFZl0qJ0lZt+pUM0XpBBrnvLnHbViiMTfk4pM/NComyrcfvhIlzivLV2xW4eI4vTsAMM
 KE+uNYn0/q9RkIBQRa+yZkjmynW3bgktFnhjzPcZCRN5EJOWUI9nj7Bdy0JwoYccgYyp aw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r01xnaxj3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 05:34:46 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 6 Jun
 2023 11:34:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 6 Jun 2023 11:34:44 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.36])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A65415A4;
	Tue,  6 Jun 2023 10:34:44 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v3 3/3] ALSA: hda/realtek: Delete cs35l41 component master
 during free
Date: Tue, 6 Jun 2023 11:34:36 +0100
Message-ID: <20230606103436.455348-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606103436.455348-1-sbinding@opensource.cirrus.com>
References: <20230606103436.455348-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VI5rgjUz7OKTiLaTImVqJ-67K0d56j5K
X-Proofpoint-GUID: VI5rgjUz7OKTiLaTImVqJ-67K0d56j5K
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TPLAR42WJQV7KWDDKF4ME4X3UJOQWLRH
X-Message-ID-Hash: TPLAR42WJQV7KWDDKF4ME4X3UJOQWLRH
X-MailFrom: prvs=15210a2e6b=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPLAR42WJQV7KWDDKF4ME4X3UJOQWLRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This ensures that the driver is properly cleaned up when freed.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f10790ace5c1d..a0e88fd17aa42 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6757,6 +6757,9 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 		else
 			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
 		break;
+	case HDA_FIXUP_ACT_FREE:
+		component_master_del(dev, &comp_master_ops);
+		break;
 	}
 }
 
-- 
2.34.1

