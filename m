Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB3425460
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23C001666;
	Thu,  7 Oct 2021 15:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23C001666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633613930;
	bh=auvEtx9F+AYIMH1eTdY9ZaKfD6VRvUWvvZHx45g/zJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xa/dH5bfv719JM052At5aqVNRY9B4jJhYFD9W96LTz07O9j2FEfRSneyT62eVffpf
	 akuz89+c/QiVY+cfpSuJGxVd1saTdTkVtF19rYLo4PJLvwyrWQ0T8RHt/7yj5ixyp5
	 RbrqS+Fgk+k2vVhzZyj1CH0X5AdaWdCo++c5l0xQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E2AF800F0;
	Thu,  7 Oct 2021 15:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B78DF804E6; Thu,  7 Oct 2021 15:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E72F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E72F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249567772"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="249567772"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="484523130"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2021 06:36:58 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/3] ASoC: soc-acpi: add comp_ids field for machine driver
 matching
Date: Thu,  7 Oct 2021 21:35:14 +0800
Message-Id: <20211007133516.1464655-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007133516.1464655-1-brent.lu@intel.com>
References: <20211007133516.1464655-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Rander Wang <rander.wang@intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>
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

A machine driver needs to be enumerated by more than one ACPI HID if
it supports second headphone driver (i.e. rt5682 and rt5682s).
However, the id field in snd_soc_acpi_mach structure could contain
only one HID. By adding a 'comp_ids' field which can contain several
HIDs, we can enumerate a machine driver by multiple ACPI HIDs.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 include/sound/soc-acpi.h |  2 ++
 sound/soc/soc-acpi.c     | 24 ++++++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 2f3fa385c092..43cf520f145e 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -129,6 +129,7 @@ struct snd_soc_acpi_link_adr {
  * all firmware/topology related fields.
  *
  * @id: ACPI ID (usually the codec's) used to find a matching machine driver.
+ * @comp_ids: a list of audio codecs also used to find a matching machine driver.
  * @link_mask: describes required board layout, e.g. for SoundWire.
  * @links: array of link _ADR descriptors, null terminated.
  * @drv_name: machine driver name
@@ -146,6 +147,7 @@ struct snd_soc_acpi_link_adr {
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
 	const u8 id[ACPI_ID_LEN];
+	struct snd_soc_acpi_codecs *comp_ids;
 	const u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
 	const char *drv_name;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 395229bf5c51..aca7c2020567 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -8,14 +8,34 @@
 #include <linux/module.h>
 #include <sound/soc-acpi.h>
 
+static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
+{
+	struct snd_soc_acpi_codecs *comp_ids = machine->comp_ids;
+	int i;
+
+	if (machine->id[0]) {
+		if (acpi_dev_present(machine->id, NULL, -1))
+			return true;
+	}
+
+	if (comp_ids) {
+		for (i = 0; i < comp_ids->num_codecs; i++) {
+			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1))
+				return true;
+		}
+	}
+
+	return false;
+}
+
 struct snd_soc_acpi_mach *
 snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
 {
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_acpi_mach *mach_alt;
 
-	for (mach = machines; mach->id[0]; mach++) {
-		if (acpi_dev_present(mach->id, NULL, -1)) {
+	for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {
+		if (snd_soc_acpi_id_present(mach)) {
 			if (mach->machine_quirk) {
 				mach_alt = mach->machine_quirk(mach);
 				if (!mach_alt)
-- 
2.25.1

