Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20214605FD
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Nov 2021 12:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 904A11733;
	Sun, 28 Nov 2021 12:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 904A11733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638100663;
	bh=cyJcBUcVhLFNn3pKKdcCEQxDlyFA4R574DQPdCEbyWs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHftRIqn6VWZSW1VmxT0l44fnbiMM70F1qpLYAI+MyvSqh0u8rHR3WOZg69eSX7J3
	 jHEJ0sfLLqZ+OYrjvHhf5itJtzD72/L6qYCPboex9khBcr4B0+7TZFYtfkGwL0Iz3U
	 beTOrnC2uxigOfo9132olKIgbhChGsAyHadF4+K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4011F80290;
	Sun, 28 Nov 2021 12:56:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2964F8028D; Sun, 28 Nov 2021 12:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FA7BF800EE
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 12:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FA7BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gg0ecbHV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ASBmlIa001661;
 Sun, 28 Nov 2021 05:56:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Ki+QojrxDU5JUpAcdyetKCTFr00V0YhLcue4lnkDJsQ=;
 b=gg0ecbHVxCfge1E4sBslc3ZSGhyCTBFrbPEt6HYB8oY2v9iXzQScTNj1Dv1LWENkBZF0
 aeXBmUmmKp/VxmPCbzEyblsfIAC0VlZA59ubv7RfNa0XRdiCWcWTawiPc9qa7d9e4v/u
 RqprHU70IS6Jgem3QD1jCLX0vMvo26sW+XLMSsRqcxOoUOrJ92mtnpymKGKca6IkeP8J
 c3A7LqHz5eNVOZLbQ+5lWK6tKJ+TGA4v2EhPbXOrsKbZ88QizzSENWZquiKVvs2EBabg
 FTAewZPGa/8be4+2rg+9tIEufDREdgDxVKtKDSsTJLfhJhBwBdQ1ioBjPcRaergNOcYf JA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ckjy80v9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 28 Nov 2021 05:56:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 28 Nov
 2021 11:56:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Sun, 28 Nov 2021 11:56:08 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.68])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 37E3F2A9;
 Sun, 28 Nov 2021 11:55:59 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Vitaly Rodionov
 <vitalyr@opensource.cirrus.com>, Lucas Tanure
 <tanureal@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/cs8409: Set PMSG_ON earlier inside cs8409 driver
Date: Sun, 28 Nov 2021 11:55:58 +0000
Message-ID: <20211128115558.71683-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _FR5QcA7hi8KulKl7QlPQ4CygCn93E8L
X-Proofpoint-GUID: _FR5QcA7hi8KulKl7QlPQ4CygCn93E8L
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

For cs8409, it is required to run Jack Detect on resume.
Jack Detect on cs8409+cs42l42 requires an interrupt from
cs42l42 to be sent to cs8409 which is propogated to the driver
via an unsolicited event.
However, the hda_codec drops unsolicited events if the power_state
is not set to PMSG_ON. Which is set at the end of the resume call.
This means there is a race condition between setting power_state
to PMSG_ON and receiving the interrupt.
To solve this, we can add an API to set the power_state earlier
and call that before we start Jack Detect.
This does not cause issues, since we know inside our driver that
we are already initialized, and ready to handle the unsolicited
events.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/hda_local.h    | 8 ++++++++
 sound/pci/hda/patch_cs8409.c | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 4662a47add7e..96f78daf90f0 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -439,6 +439,14 @@ int snd_hda_codec_set_pin_target(struct hda_codec *codec, hda_nid_t nid,
 #define for_each_hda_codec_node(nid, codec) \
 	for ((nid) = (codec)->core.start_nid; (nid) < (codec)->core.end_nid; (nid)++)
 
+/* Set the codec power_state flag to indicate to allow unsol event handling;
+ * see hda_codec_unsol_event() in hda_bind.c.  Calling this might confuse the
+ * state tracking, so use with care.
+ */
+static inline void snd_hda_codec_allow_unsol_events(struct hda_codec *codec) {
+	codec->core.dev.power.power_state = PMSG_ON;
+}
+
 /*
  * get widget capabilities
  */
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 31ff11ab868e..039b9f2f8e94 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -750,6 +750,11 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 	if (cs42l42->full_scale_vol)
 		cs8409_i2c_write(cs42l42, 0x2001, 0x01);
 
+	/* we have to explicitly allow unsol event handling even during the
+	 * resume phase so that the jack event is processed properly
+	 */
+	snd_hda_codec_allow_unsol_events(cs42l42->codec);
+
 	cs42l42_enable_jack_detect(cs42l42);
 }
 
-- 
2.25.1

