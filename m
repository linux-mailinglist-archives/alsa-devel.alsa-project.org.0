Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363F522100
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 18:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1F71921;
	Tue, 10 May 2022 18:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1F71921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652199527;
	bh=DkA7E8H+Q3Q5xt43U43baOuMqVZ0rI0i8MA64asRsHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWuhoLQ3Rx7jg6D93OvSUxS1lDsI6F7WFIkssyyr7PUjs7vWytDTKJyGihi7ELqMU
	 SGTTl7mcHhE7km8igi0iJXRVoROTIevAj2nlMtWJwWu1aePXy7SYfZaHJOgT6O0ldf
	 lFQFouhFa6TdHNEqtwdgItSr7q/Vp6EsEeMnkVOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C809F80508;
	Tue, 10 May 2022 18:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A633F80508; Tue, 10 May 2022 18:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22BD2F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 18:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22BD2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lujU0anK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A5TVph021012;
 Tue, 10 May 2022 11:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MAF4HrjBnpXjwWhSzT2Z6EFEzR5KeFyp/09dN8HFm18=;
 b=lujU0anKAJesYNHZ4SGqbWzKAImsZeHwIZNEJjlKEUyBRDKztCxzTwOy7wtUy2gIAEq4
 96ze3xk8zfxCJG4UpWY4fDinoCcDQ5y2Z9XuGFnydqctRgGwICB2nrVVoBbCaajNYkKI
 gI53ijTdfZGHfkX7OAzWTrsfJwRdY3mSduYO8icbO73yYxt49hf+LPWR73Nt0OtLzHHH
 +Q3Z2mgRTQlEABDGJrIh+ODbpSlOZMLlssecjxwyOpHlUIEkTR7yI4Ne038tzIOgHvzM
 HZ/ujx24eh26fEBoXnusJEdiGYQHwdMavTHu8wNSmz2uQOWVfZUhryfdSdtfUStMgl+P kA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nvk88-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 May 2022 11:17:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 17:17:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 10 May 2022 17:17:07 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.24])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E42AB10;
 Tue, 10 May 2022 16:17:07 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/3] ALSA: hda/cs8409: Add Speaker Playback Switch for
 Warlock
Date: Tue, 10 May 2022 17:17:01 +0100
Message-ID: <20220510161701.851260-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510161701.851260-1-sbinding@opensource.cirrus.com>
References: <20220510161701.851260-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8FixfZNXj90yNy0dxbUA2yYotHVd0tk1
X-Proofpoint-GUID: 8FixfZNXj90yNy0dxbUA2yYotHVd0tk1
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

Add support for a Speaker Playback Switch, which disables
the Amp connected to cs8409. The Switch is not added
automatically because cs8409 does not have an output amp
for the speaker NID.

Note: This switch uses a different GPIO to Cyborg/Odin variants

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 2 ++
 sound/pci/hda/patch_cs8409.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index f682769667e3..95b33a983e9e 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -1167,10 +1167,12 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		case CS8409_WARLOCK_MLK:
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
+			spec->speaker_pdn_gpio = CS8409_WARLOCK_SPEAKER_PDN;
 			break;
 		default:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
 				CS42L42_FULL_SCALE_VOL_MINUS6DB;
+			spec->speaker_pdn_gpio = CS8409_WARLOCK_SPEAKER_PDN;
 			break;
 		}
 
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 630a7a2de51f..260388a6256c 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -239,6 +239,7 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_RESET			GENMASK(5, 5) /* CS8409_GPIO5 */
 #define CS8409_CS42L42_INT			GENMASK(4, 4) /* CS8409_GPIO4 */
 #define CS8409_CYBORG_SPEAKER_PDN		GENMASK(2, 2) /* CS8409_GPIO2 */
+#define CS8409_WARLOCK_SPEAKER_PDN		GENMASK(1, 1) /* CS8409_GPIO1 */
 #define CS8409_CS42L42_HP_PIN_NID		CS8409_PIN_ASP1_TRANSMITTER_A
 #define CS8409_CS42L42_SPK_PIN_NID		CS8409_PIN_ASP2_TRANSMITTER_A
 #define CS8409_CS42L42_AMIC_PIN_NID		CS8409_PIN_ASP1_RECEIVER_A
-- 
2.25.1

