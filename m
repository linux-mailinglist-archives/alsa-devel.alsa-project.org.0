Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C597C9F0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267CC857;
	Thu, 19 Sep 2024 15:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267CC857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751807;
	bh=oB0IG1FZpNX8qGHKBepB0vaYITM6YVeiaNw0chda+lY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tHiV0qgKLsN2Qbt1koDbr/cb52hKThrBLiQmhv81JIk6JDzjnnAub8I/QvNz4chJP
	 4qPHEI2S5T49U6RdDqloWARG5q+VoJH1thrN+hgo7lxVAf0kAf+bcM2txxkyjgbkIO
	 e+gdj2Uhq2eFe9DZl6mnP92ztfvLwqgxlLxaDth0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1F9EF80518; Thu, 19 Sep 2024 15:14:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9549F80518;
	Thu, 19 Sep 2024 15:14:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89CC9F8020D; Thu, 19 Sep 2024 09:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07A59F80074
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 09:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A59F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=nnx1t/bc
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48J7wLn0102849;
	Thu, 19 Sep 2024 02:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726732701;
	bh=WBIO8ghc5BO7KnE+trij/v76xdOBbr/wF5H+L5REiYE=;
	h=From:To:CC:Subject:Date;
	b=nnx1t/bcQYPkrA4tunXM4zqVESCEy26aFKQKmlfh8B/axDHTA+l7sQClWczyxdSW5
	 anwzA+Jv1M7nicjfnOIQ+nlF6y1ICSilQLVxtlZtUYcnb/68iCpPnXnk/nrWbDUNKE
	 Hqc4coqdJY1oDhRlqSeKk4RdbaKBC7FD6ir3iTOM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48J7wLmt052629;
	Thu, 19 Sep 2024 02:58:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Sep 2024 02:58:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Sep 2024 02:58:20 -0500
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48J7w8aB122919;
	Thu, 19 Sep 2024 02:58:09 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>, <jim.shil@goertek.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add new quirk for Lenovo Y990 Laptop
Date: Thu, 19 Sep 2024 15:57:43 +0800
Message-ID: <20240919075743.259-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QUW5Q3O2EDEM2ETONMNUKWZLBORY5RRQ
X-Message-ID-Hash: QUW5Q3O2EDEM2ETONMNUKWZLBORY5RRQ
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:14:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUW5Q3O2EDEM2ETONMNUKWZLBORY5RRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new vendor_id and subsystem_id in quirk for Lenovo Y990 Laptop.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 480e82df7a4c..4f69fd30fdce 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10612,6 +10612,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d2, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38d7, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.43.0

