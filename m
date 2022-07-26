Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD255810DF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B3DE0F;
	Tue, 26 Jul 2022 12:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B3DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658830372;
	bh=BLp2YDVHcxEVuNpLxWvul2XlbAJqidDahY3TVZVf0Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkyoT1GjEPmNC9r8oS2tQ5Xykk/o99LRRGFelMrSTKztpUbdYLtz9rdG59sw2Vo7c
	 1XChwjoiKmJ4uqkpZgTOIgG3P9gmGBs/baQ7X+/8L5MKE+1DDiOgpBClonl+pN+lSB
	 0c/dPGWNVJoTLFIPT5924fcR9k2m1Wz5/BVK3v4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0642F80543;
	Tue, 26 Jul 2022 12:11:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E73C8F8053C; Tue, 26 Jul 2022 12:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD464F804C3
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD464F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UGLMfeTT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q7EUxh002774;
 Tue, 26 Jul 2022 05:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4GMh/xGa5TNYNqY554M0oZkoPr+GvTe1jc7k9ZTapsY=;
 b=UGLMfeTT8FEulZN6LnOr1/UDUVyP1E6xT3wqa5efOyUdmqGWFEgUoC8XifnFuM7VRU3K
 dP1ch53S+dxaV8Jx0747wHV1Viv7ZjGscM4d5qHQ0dj5+0kp7HBMQDPhQO3JoGer+H0h
 fs8SzYh5jkhjGi2PPllpOsdiUUAyyBqWpErMs0Du0/iRp4XaaZZ7CY6xBVo1xFaS60AK
 CDDQPJqY9XeTQ45VCnqojFXdFwK4azp2WkxBjacnVH8IeT8h5doLbF7okQhJ0/uuUvGH
 C0SaKM2VAMl2qA/K20RHbecYbeOybHQWl1r+Qrzi4UJmGbThblB+s+WQYHrJXkhEODw1 fg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1ub6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 05:11:37 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 05:11:35 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 05:11:35 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7CF572D4;
 Tue, 26 Jul 2022 10:11:35 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cameron
 Berkenpas <cam@neo-zeon.de>
Subject: [PATCH 1/2] ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
Date: Tue, 26 Jul 2022 11:11:30 +0100
Message-ID: <20220726101131.68058-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
References: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BEjZCeMFIzD0y-NIhfrXa8Yr4dFiKTo5
X-Proofpoint-ORIG-GUID: BEjZCeMFIzD0y-NIhfrXa8Yr4dFiKTo5
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Follow GPIO1 pattern, use cs35l41 HDA internal define for
IRQ and then translate to ASoC cs35l41 define.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 28798d5c1cf1..48d94c683b75 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1014,6 +1014,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 			break;
 		case CS35L41_INTERRUPT:
 			using_irq = true;
+			hw_cfg->gpio2.func = CS35L41_GPIO2_INT_OPEN_DRAIN;
 			break;
 		default:
 			dev_err(cs35l41->dev, "Invalid GPIO2 function %d\n", hw_cfg->gpio2.func);
@@ -1273,7 +1274,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
 	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
 	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
-	hw_cfg->gpio2.func = CS35L41_GPIO2_INT_OPEN_DRAIN;
+	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
 	hw_cfg->gpio2.valid = true;
 	cs35l41->hw_cfg.valid = true;
 	put_device(physdev);
-- 
2.37.1

