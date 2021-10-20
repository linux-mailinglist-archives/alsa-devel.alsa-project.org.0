Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A2434FAF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3FC168C;
	Wed, 20 Oct 2021 18:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3FC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634745914;
	bh=BT00wpcPWcMl1sOMENTgoHr3mtdLdY7I0MPkf8EDmGc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOK7gS3UQtzDrFDCJLljhxhmwqsgNbcEEVQF0Cq27Q3/rqinbyDnjWPVuLArSKNWs
	 JvOtJxPC7oVhLMqFvtT4ymOkCB0rl+OXQJ9FLvOqYi4vG8pu/3DJkHeTPj+Sh01K2w
	 wMUl2mMkwEtYpinSNF2WonlxV1UIG/lW9M8h2qtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B1AF804CA;
	Wed, 20 Oct 2021 18:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E73F80082; Wed, 20 Oct 2021 18:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC263F800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 18:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC263F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292280181"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="292280181"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="494685380"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga008.jf.intel.com with ESMTP; 20 Oct 2021 08:59:11 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 1/6] ASoC: soc-acpi: add comp_ids field for machine driver
 matching
Date: Wed, 20 Oct 2021 23:57:10 +0800
Message-Id: <20211020155715.2045947-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020155715.2045947-1-brent.lu@intel.com>
References: <20211020155715.2045947-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>, Huajun Li <huajun.li@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
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
 include/sound/soc-acpi.h |  3 +++
 sound/soc/soc-acpi.c     | 24 ++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 2f3fa385c092..31f4c4f9aeea 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -129,6 +129,8 @@ struct snd_soc_acpi_link_adr {
  * all firmware/topology related fields.
  *
  * @id: ACPI ID (usually the codec's) used to find a matching machine driver.
+ * @comp_ids: list of compatible audio codecs using the same machine driver,
+ * firmware and topology
  * @link_mask: describes required board layout, e.g. for SoundWire.
  * @links: array of link _ADR descriptors, null terminated.
  * @drv_name: machine driver name
@@ -146,6 +148,7 @@ struct snd_soc_acpi_link_adr {
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
 	const u8 id[ACPI_ID_LEN];
+	const struct snd_soc_acpi_codecs *comp_ids;
 	const u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
 	const char *drv_name;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 395229bf5c51..2ae99b49d3f5 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -8,14 +8,34 @@
 #include <linux/module.h>
 #include <sound/soc-acpi.h>
 
+static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
+{
+	const struct snd_soc_acpi_codecs *comp_ids = machine->comp_ids;
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

