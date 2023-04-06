Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8DC6D9C44
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF39EF5;
	Thu,  6 Apr 2023 17:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF39EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680794915;
	bh=AuqRvjNPqvniUEkFUbyEempUnjM72En1nZZKKVMc4TM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Al9a17QCOoar23rmy+CcoM7Sj80eArPnM3k1oBQ4KZrnX/byMsBqmGbIoKUgvBL6C
	 le6hWqztOJXHDDbcmV5ruHVCktofBOlzZRA8wWwHmR7ZhiUzc1fjBHy8hkH7dRLVFq
	 iRNoo4Ax8oR+JNejExYSsfka2ygHKeAIICdB+/Ao=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B356F80246;
	Thu,  6 Apr 2023 17:27:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4BE2F80249; Thu,  6 Apr 2023 17:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CD1CF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD1CF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lz1bmfmO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680794858; x=1712330858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AuqRvjNPqvniUEkFUbyEempUnjM72En1nZZKKVMc4TM=;
  b=lz1bmfmOBWqvcOKFsKBFbbZWqVtC3UCJ9O0eYsAqAQT64z6ssuZzFeMK
   yQcOUTmOcQkGZCkGYTet8Cp3Y3cMJ8XHy7thcG/94/2xKYEVj5lMsqRvx
   zCyeJ/9+W5LRQwFrKy7tl5kfuiplbdUnYF8Iitx40qQiX7Jg5RSkmzEQs
   AIB5ZflcwuhGwOWMgwds2JxpVBuXDZ4WYhkD+U8YFnFdAZcUp2dta8TaM
   XOjftX3lq1B5RtREY1LPiyCNMZdKnwgzhZpaAzYuMz0/w41xjEdQDFHXx
   DR2z60b2FOq5pthkJOey9mC6D+7UOzvFWD/4Hg1FVAjW+EGB5CpoD57LM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344522853"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="344522853"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776514233"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="776514233"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:27:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: patch_realtek: add quirk for Asus N7601ZM
Date: Thu,  6 Apr 2023 10:27:25 -0500
Message-Id: <20230406152725.15191-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EI5CYT4TSXI5LEMOFGYTUYW5JLCDQ4PA
X-Message-ID-Hash: EI5CYT4TSXI5LEMOFGYTUYW5JLCDQ4PA
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Erik Brakkee <erik@brakkee.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EI5CYT4TSXI5LEMOFGYTUYW5JLCDQ4PA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pins and verbs needed to enable speakers and jack.

The pins and verbs configurations were identified by snooping the
Windows driver commands, with a nice write-up here:
https://brakkee.org/site/2023/02/07/fixing-sound-on-the-asus-n7601zm/

Reported-by: Erik Brakkee <erik@brakkee.org>
Tested-by: Erik Brakkee <erik@brakkee.org>
Link: https://github.com/thesofproject/linux/issues/4176
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/pci/hda/patch_realtek.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b501f9489fc1..2baeb6efbdc7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6959,6 +6959,8 @@ enum {
 	ALC269_FIXUP_DELL_M101Z,
 	ALC269_FIXUP_SKU_IGNORE,
 	ALC269_FIXUP_ASUS_G73JW,
+	ALC269_FIXUP_ASUS_N7601ZM_PINS,
+	ALC269_FIXUP_ASUS_N7601ZM,
 	ALC269_FIXUP_LENOVO_EAPD,
 	ALC275_FIXUP_SONY_HWEQ,
 	ALC275_FIXUP_SONY_DISABLE_AAMIX,
@@ -7255,6 +7257,29 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
+	[ALC269_FIXUP_ASUS_N7601ZM_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03A11050 },
+			{ 0x1a, 0x03A11C30 },
+			{ 0x21, 0x03211420 },
+			{ }
+		}
+	},
+	[ALC269_FIXUP_ASUS_N7601ZM] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{0x20, AC_VERB_SET_COEF_INDEX, 0x62},
+			{0x20, AC_VERB_SET_PROC_COEF, 0xa007},
+			{0x20, AC_VERB_SET_COEF_INDEX, 0x10},
+			{0x20, AC_VERB_SET_PROC_COEF, 0x8420},
+			{0x20, AC_VERB_SET_COEF_INDEX, 0x0f},
+			{0x20, AC_VERB_SET_PROC_COEF, 0x7774},
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_ASUS_N7601ZM_PINS,
+	},
 	[ALC269_FIXUP_LENOVO_EAPD] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9485,6 +9510,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
+	SND_PCI_QUIRK(0x1043, 0x12a3, "Asus N7691ZM", ALC269_FIXUP_ASUS_N7601ZM),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
-- 
2.37.2

