Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E565206F6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A1616E5;
	Mon,  9 May 2022 23:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A1616E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133005;
	bh=Nhn2hyW0IjGuRf8dC16R5DOYwwwXk/LVi7vsba1G0WA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvmtkimIYeFLOnJ+QjFzD0XmOU/5K+C1zu6fqV5KCWOra/ZOsBHsWqXV14ltV0n+r
	 VQ0Gj6TgA70TMdLM+wiOqHMYNdfXIo5z8tuZNn5AlNTnaQe77vwCnKjWxRHVShr1if
	 ctvxuQH8gfc+MY1xlBNXeV6iurBSRXCi3+AAQqpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B03EF80515;
	Mon,  9 May 2022 23:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44BE8F8053B; Mon,  9 May 2022 23:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC67FF8047B
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC67FF8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HJO9SgOK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249KTf3I031853;
 Mon, 9 May 2022 16:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/kuXGXVoUrJ5RtoN4zkmhDFmfSoCd+EVXdvQ993Tilg=;
 b=HJO9SgOKOxC0wNUiGj+JHtCSOaLsOtlq7LNemR/mjuvfsrQyoqRkEC6XG+xoY2fxZh5K
 g7XDXCwe/fa85pRJB6HguwUff1iAI/PiW0SeJ6xVJBjaGPtbBoDZH6TGJ+A7ZpWoWcqY
 VkmFA9Dm4zIkiztQUQW+FbkWCQqYajWKDGItVwVWKoMAmGgAMCgtp8hFe30/GMjYArGV
 WYNPMqpx6r1PwmzhPnB0cH1v6VcZ4oretFL0quoXUuKSG6f8/JHSKvMTacZ7n1vevV4n
 gOP2+nqtT6D1ErJfF+ZNZIryf81Or4xK4fy1kT6KukOKO8rR0WQYvEKIP2PSfAR42pjJ sA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nu87p-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:06 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 11978B10;
 Mon,  9 May 2022 21:47:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 05/26] ALSA: hda: cs35l41: Enable GPIO2 Interrupt for
 CLSA0100 laptops
Date: Mon, 9 May 2022 22:46:42 +0100
Message-ID: <20220509214703.4482-6-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6zWbfpH0mMfQuTrPLKsXa6yZbIbevhWH
X-Proofpoint-GUID: 6zWbfpH0mMfQuTrPLKsXa6yZbIbevhWH
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

CLSA0100 Laptop does not contain configuration inside ACPI,
instead the hardware configuration needs to be hardcoded.
Hardcode GPIO2 Interrupt in the driver for CSLA0100.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index bd52e0c2c772..2608bf4a6851 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -412,6 +412,8 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	cs35l41->hw_cfg.spk_pos = cs35l41->index;
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
 	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
+	hw_cfg->gpio2.func = CS35L41_GPIO2_INT_OPEN_DRAIN;
+	hw_cfg->gpio2.valid = true;
 	cs35l41->hw_cfg.valid = true;
 	put_device(physdev);
 
-- 
2.34.1

