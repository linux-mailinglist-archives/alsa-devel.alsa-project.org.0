Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D230C5D2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:33:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD511769;
	Tue,  2 Feb 2021 17:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD511769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612283592;
	bh=Tigbd9EMFHgYm3EJy9XsL4R1+SZCYdst/rkkrpKAgSk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G/wYPnfc5wqOBUVj1Vt/zikZ1WA96S5nLauuhMchWxCKi+Qo7JSILtPgtYKaitWy9
	 AZOVmHCmxfEvkLZv883EOgjFTNu2T4fc95Ot7OU86g6Y8EnM11Skk8KpA9jxlbrizs
	 8etuTuCFySGbIrzvyLcyWethg03OfjlV1L1/U/kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 897C4F8023B;
	Tue,  2 Feb 2021 17:32:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31BC1F8021C; Tue,  2 Feb 2021 17:32:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0BA3F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0BA3F80109
IronPort-SDR: OGRsbvCqZOQI0ho0VSdYx/0CvK11U29L0eEZWWeArLYGIILqHSplo03GiYLScvMnUqHdFN9fth
 sQB+L2qc8hRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="160050015"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="160050015"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:31:50 -0800
IronPort-SDR: /XdimgVO9aXJXecX2Y/9yswZ3Ffs/HaNiWA+pCUghsOg8gd53Y43VHwmwQ4cLfMfCeoUG0w/UM
 PoSb0xp81VOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="355174222"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga007.fm.intel.com with ESMTP; 02 Feb 2021 08:31:47 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: topology: KUnit: Convert from cpu to data format
Date: Tue,  2 Feb 2021 17:31:23 +0100
Message-Id: <20210202163123.3942040-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

When creating topology templates and overriding data in specific test
cases it should be done with cpu_to_le32 macro, so we operate on correct
data on all architectures, as topology parser use le32_to_cpu to parse
data from structures.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology-test.c | 66 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 36e2a3486dbf..ae3968161509 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -121,19 +121,19 @@ struct tplg_tmpl_001 {
 
 static struct tplg_tmpl_001 tplg_tmpl_empty = {
 	.header = {
-		.magic = SND_SOC_TPLG_MAGIC,
-		.abi = 5,
+		.magic = cpu_to_le32(SND_SOC_TPLG_MAGIC),
+		.abi = cpu_to_le32(5),
 		.version = 0,
-		.type = SND_SOC_TPLG_TYPE_MANIFEST,
-		.size = sizeof(struct snd_soc_tplg_hdr),
+		.type = cpu_to_le32(SND_SOC_TPLG_TYPE_MANIFEST),
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_hdr)),
 		.vendor_type = 0,
-		.payload_size = sizeof(struct snd_soc_tplg_manifest),
+		.payload_size = cpu_to_le32(sizeof(struct snd_soc_tplg_manifest)),
 		.index = 0,
-		.count = 1,
+		.count = cpu_to_le32(1),
 	},
 
 	.manifest = {
-		.size = sizeof(struct snd_soc_tplg_manifest),
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_manifest)),
 		/* rest of fields is 0 */
 	},
 };
@@ -149,60 +149,60 @@ struct tplg_tmpl_002 {
 
 static struct tplg_tmpl_002 tplg_tmpl_with_pcm = {
 	.header = {
-		.magic = SND_SOC_TPLG_MAGIC,
-		.abi = 5,
+		.magic = cpu_to_le32(SND_SOC_TPLG_MAGIC),
+		.abi = cpu_to_le32(5),
 		.version = 0,
-		.type = SND_SOC_TPLG_TYPE_MANIFEST,
-		.size = sizeof(struct snd_soc_tplg_hdr),
+		.type = cpu_to_le32(SND_SOC_TPLG_TYPE_MANIFEST),
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_hdr)),
 		.vendor_type = 0,
-		.payload_size = sizeof(struct snd_soc_tplg_manifest),
+		.payload_size = cpu_to_le32(sizeof(struct snd_soc_tplg_manifest)),
 		.index = 0,
-		.count = 1,
+		.count = cpu_to_le32(1),
 	},
 	.manifest = {
-		.size = sizeof(struct snd_soc_tplg_manifest),
-		.pcm_elems = 1,
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_manifest)),
+		.pcm_elems = cpu_to_le32(1),
 		/* rest of fields is 0 */
 	},
 	.pcm_header = {
-		.magic = SND_SOC_TPLG_MAGIC,
-		.abi = 5,
+		.magic = cpu_to_le32(SND_SOC_TPLG_MAGIC),
+		.abi = cpu_to_le32(5),
 		.version = 0,
-		.type = SND_SOC_TPLG_TYPE_PCM,
-		.size = sizeof(struct snd_soc_tplg_hdr),
+		.type = cpu_to_le32(SND_SOC_TPLG_TYPE_PCM),
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_hdr)),
 		.vendor_type = 0,
-		.payload_size = sizeof(struct snd_soc_tplg_pcm),
+		.payload_size = cpu_to_le32(sizeof(struct snd_soc_tplg_pcm)),
 		.index = 0,
-		.count = 1,
+		.count = cpu_to_le32(1),
 	},
 	.pcm = {
-		.size = sizeof(struct snd_soc_tplg_pcm),
+		.size = cpu_to_le32(sizeof(struct snd_soc_tplg_pcm)),
 		.pcm_name = "KUNIT Audio",
 		.dai_name = "kunit-audio-dai",
 		.pcm_id = 0,
 		.dai_id = 0,
-		.playback = 1,
-		.capture = 1,
+		.playback = cpu_to_le32(1),
+		.capture = cpu_to_le32(1),
 		.compress = 0,
 		.stream = {
 			[0] = {
-				.channels = 2,
+				.channels = cpu_to_le32(2),
 			},
 			[1] = {
-				.channels = 2,
+				.channels = cpu_to_le32(2),
 			},
 		},
 		.num_streams = 0,
 		.caps = {
 			[0] = {
 				.name = "kunit-audio-playback",
-				.channels_min = 2,
-				.channels_max = 2,
+				.channels_min = cpu_to_le32(2),
+				.channels_max = cpu_to_le32(2),
 			},
 			[1] = {
 				.name = "kunit-audio-capture",
-				.channels_min = 2,
-				.channels_max = 2,
+				.channels_min = cpu_to_le32(2),
+				.channels_max = cpu_to_le32(2),
 			},
 		},
 		.flag_mask = 0,
@@ -460,7 +460,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	 * override abi
 	 * any value != magic number is wrong
 	 */
-	data->header.magic = SND_SOC_TPLG_MAGIC + 1;
+	data->header.magic = cpu_to_le32(SND_SOC_TPLG_MAGIC + 1);
 
 	kunit_comp->fw.data = (u8 *)data;
 	kunit_comp->fw.size = size;
@@ -516,7 +516,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	 * override abi
 	 * any value != accepted range is wrong
 	 */
-	data->header.abi = SND_SOC_TPLG_ABI_VERSION + 1;
+	data->header.abi = cpu_to_le32(SND_SOC_TPLG_ABI_VERSION + 1);
 
 	kunit_comp->fw.data = (u8 *)data;
 	kunit_comp->fw.size = size;
@@ -572,7 +572,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	 * override size
 	 * any value != struct size is wrong
 	 */
-	data->header.size = sizeof(struct snd_soc_tplg_hdr) + 1;
+	data->header.size = cpu_to_le32(sizeof(struct snd_soc_tplg_hdr) + 1);
 
 	kunit_comp->fw.data = (u8 *)data;
 	kunit_comp->fw.size = size;
-- 
2.25.1

