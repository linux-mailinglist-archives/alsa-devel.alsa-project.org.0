Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B95823AD
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 12:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91A51633;
	Wed, 27 Jul 2022 12:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91A51633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658916082;
	bh=BLp2YDVHcxEVuNpLxWvul2XlbAJqidDahY3TVZVf0Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cw8lJp7umTZ1vUBkzXZA/HFyiMfgwMSdC4xCV+dmvOJ2HE/8S2ePs8S/7i9PZBKBN
	 BgCuJkL1SVWw6vc5kZDDZYAz6cCjocT83rhs300GsotahD3G8EMhNUDPxxEdUThj7k
	 dCdS+16kPcpAeUn7WXw4sMq8Yv4dTznDU56+k9CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB60F80544;
	Wed, 27 Jul 2022 11:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209E9F80548; Wed, 27 Jul 2022 11:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C626F8015B
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C626F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XUp2LLOq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4SNEd032560;
 Wed, 27 Jul 2022 04:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4GMh/xGa5TNYNqY554M0oZkoPr+GvTe1jc7k9ZTapsY=;
 b=XUp2LLOqcknXoF0P0iMQBihxtbaw61wYS4emhJx9mhaWQGYQW8n7hQ3h3HAxWIo2xeFP
 PrDZal03qNwFNgKE48Wer4kiaxMNrTfaF70k0yft5w0IH7tpmdCkRAE4LkKOmmvaQiq5
 NAN6yUxiXbM1pp7rfbL7YByKExBYCAonwgUyYn044bs1WI1LNZpB4PW1dgLfvPH2ujIS
 Z9EnWM/15AspyGRvbhX0SJrDBQU/9ElqCE7Om+LCwFVCzimUHWcXBvpIQC2N4GKzXS27
 z8ygA+nFZ/2nIgDaSTPMbWp7WZJoez7ddtezIHySwfeTizUwd/PWW5tQ5oKHVHP12Uav ig== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1vtk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 04:59:30 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 04:59:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Wed, 27 Jul 2022 04:59:28 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 25CCB477;
 Wed, 27 Jul 2022 09:59:28 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Cameron Berkenpas <cam@neo-zeon.de>
Subject: [PATCH v2 1/4] ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
Date: Wed, 27 Jul 2022 10:59:21 +0100
Message-ID: <20220727095924.80884-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
References: <20220727095924.80884-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4fn0EyL3NZu1_JRPPHSh5zWMTgrohK_a
X-Proofpoint-ORIG-GUID: 4fn0EyL3NZu1_JRPPHSh5zWMTgrohK_a
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

