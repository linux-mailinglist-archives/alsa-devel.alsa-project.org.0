Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F74D1EBA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64975188B;
	Tue,  8 Mar 2022 18:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64975188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760071;
	bh=zfZT1bEyFOqHDUk9jnQgK7s36KF3p/2grk+H+OAhmlw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mT2+7lT2u71UvHhFbFkniQw3BoXoZ2sfwg2ZL2U3uKLCuviYYl3Cb/CxeHq9uQk1j
	 ikwMHhisJmoX31pkP3jAwU3U8IvYmep907IM0+cfSj/F/vfYa9HkPRI2gZKwRGGN+F
	 JWNM8MYysZeP4BGW22hhYNBuyDHdjkUC19dsLorU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2F5F8053C;
	Tue,  8 Mar 2022 18:18:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7133FF8052F; Tue,  8 Mar 2022 18:17:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B40F8026A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B40F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pyVs5+Nt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228FxtbV015166;
 Tue, 8 Mar 2022 11:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=P4ZLX/Bzp11Krwo7AV0L3XdX3Uf4X7Ifm3I4jG3XM3o=;
 b=pyVs5+NteOxyzqNRUMsgyafTThbRZpzNuZfryfvdpdeW+RlUMiDMCptxTAG8AwC5wk/l
 vDmAZNOdu1HO/Amar7TsTOD7WuSh2a7JkLWBXMGFHVYm889Czm63djxoNRQorNkUEqea
 Cx+pI647x1qlp8qWft54NDYzBgnFdtSH8bgUiGvv1MdW2gfrNrxafi1KPlEPzjbQ6zJ/
 KnoXbvmg5/8YQjnMTAxJuUtaTy1dxAM/64ZQ/hoeSxRLA2iXgOyry/3iRqsQxZM3ktif
 wmAvRzoeINfj8RX3cidxkLcoqAXgBB8XeLTlHSlIcLynQNquUQvzjoa2KeCYp2lIcFwg hg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3em55svhnr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Mar 2022 11:17:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 17:17:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 8 Mar 2022 17:17:34 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0ACC2A1;
 Tue,  8 Mar 2022 17:17:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 07/16] hda: cs35l41: Put the device into safe mode for
 external boost
Date: Tue, 8 Mar 2022 17:17:21 +0000
Message-ID: <20220308171730.454587-8-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: j4QxRcgR-bYrtBO1EkmCxetLjMeSDnhV
X-Proofpoint-GUID: j4QxRcgR-bYrtBO1EkmCxetLjMeSDnhV
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

To facilitate the configuration of external boost devices, put all
devices, with or without VSPK switch, into safe mode from the start.
That allows the following parts of the driver to handle all external
boost devices in the same way.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 17660ce71f93..3b9515ed871d 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -109,8 +109,6 @@ static const struct reg_sequence cs35l41_reset_to_safe[] = {
 };
 
 static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_no_bst = {
-	.probe		= cs35l41_reset_to_safe,
-	.num_probe	= ARRAY_SIZE(cs35l41_reset_to_safe),
 	.prepare	= cs35l41_safe_to_active,
 	.num_prepare	= ARRAY_SIZE(cs35l41_safe_to_active),
 	.cleanup	= cs35l41_active_to_safe,
@@ -224,10 +222,15 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 			return ret;
 		break;
 	case CS35L41_EXT_BOOST:
-		cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
-		break;
 	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
+		if (hw_cfg->bst_type == CS35L41_EXT_BOOST)
+			cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
+		else
+			cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
+		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_reset_to_safe,
+					     ARRAY_SIZE(cs35l41_reset_to_safe));
+		if (ret)
+			return ret;
 		break;
 	default:
 		dev_err(cs35l41->dev, "Boost type %d not supported\n", hw_cfg->bst_type);
-- 
2.35.1

