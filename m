Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA13373E1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 14:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13841848;
	Thu, 11 Mar 2021 14:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13841848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615469378;
	bh=QK9g48dwFlqu/ghh5jgRcidSrr+VUBNj29OqS7SMOWQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aMVwPZBcEH8PG7cm/jOQ78SegmT/MFRODP2qtSNZhJ0Ecyj2ORlAxkBjfvbJU4zMf
	 8cAIMoNn+EXV+LWgY0YL8XJYWbPYbHGBCzCTALHd7ZvhzrUffj5i9xqse3x1J+vIeo
	 pbDVGO2HDolNcbJemBciGSfKcls31+h0/X7GPNlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1077CF8032D;
	Thu, 11 Mar 2021 14:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46CB0F802E7; Thu, 11 Mar 2021 14:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46914F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 14:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46914F8010D
IronPort-SDR: 7fG/fcRM3CNPILjpvMbFcUKJ3ySR7CfrMe+kZvIBy4J4l5ihFJDLTGsRASGKS2Ho07j+v3rzK+
 bH2Mc4VSNT5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="168582431"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="168582431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 05:27:39 -0800
IronPort-SDR: 1naYdwb6TYKPitpDxqKbwF2YDvxGN9z6QMAgjdE0diAESfqPoGdM/zMGEiPRKfHm9az1jOxr6d
 +opmAkjnee0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="404073379"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2021 05:27:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EB9A92BD; Thu, 11 Mar 2021 15:27:49 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ALSA: hda/realtek: Sort alphanumerically the
 HDA_CODEC_ENTRY() entries.
Date: Thu, 11 Mar 2021 15:27:48 +0200
Message-Id: <20210311132748.81071-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

Sort alphanumerically the HDA_CODEC_ENTRY() entries for better maintenance.
No functional change implied.

Note, that HDA_CODEC_REV_ENTRY() goes after HDA_CODEC_ENTRY() as per
default value in the latter macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/patch_realtek.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d23c8c2e6833..c9e62693db6d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10341,10 +10341,7 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
 	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
-	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
 	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
-	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
-	HDA_CODEC_ENTRY(0x10ec0862, "ALC861-VD", patch_alc861vd),
 	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100002, "ALC662 rev2", patch_alc882),
 	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100101, "ALC662 rev1", patch_alc662),
 	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100300, "ALC662 rev3", patch_alc662),
@@ -10359,16 +10356,19 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
 	HDA_CODEC_ENTRY(0x10ec0701, "ALC701", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0703, "ALC703", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0711, "ALC711", patch_alc269),
+	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
+	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
+	HDA_CODEC_ENTRY(0x10ec0862, "ALC861-VD", patch_alc861vd),
 	HDA_CODEC_ENTRY(0x10ec0867, "ALC891", patch_alc662),
 	HDA_CODEC_ENTRY(0x10ec0880, "ALC880", patch_alc880),
 	HDA_CODEC_ENTRY(0x10ec0882, "ALC882", patch_alc882),
 	HDA_CODEC_ENTRY(0x10ec0883, "ALC883", patch_alc882),
+	HDA_CODEC_ENTRY(0x10ec0885, "ALC885", patch_alc882),
 	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100101, "ALC889A", patch_alc882),
 	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100103, "ALC889A", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0885, "ALC885", patch_alc882),
 	HDA_CODEC_ENTRY(0x10ec0887, "ALC887", patch_alc882),
-	HDA_CODEC_REV_ENTRY(0x10ec0888, 0x100101, "ALC1200", patch_alc882),
 	HDA_CODEC_ENTRY(0x10ec0888, "ALC888", patch_alc882),
+	HDA_CODEC_REV_ENTRY(0x10ec0888, 0x100101, "ALC1200", patch_alc882),
 	HDA_CODEC_ENTRY(0x10ec0889, "ALC889", patch_alc882),
 	HDA_CODEC_ENTRY(0x10ec0892, "ALC892", patch_alc662),
 	HDA_CODEC_ENTRY(0x10ec0897, "ALC897", patch_alc662),
-- 
2.30.1

