Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69E2FD3FE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23089180E;
	Wed, 20 Jan 2021 16:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23089180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611156750;
	bh=cdyZrLjbOTcM2ixeXChdZyTgIK/Ub9fVaoL8sT6zGkI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOjozbVrRftAGucTEsgDr8balWltXoM19LbojlST7gHFB0I4JX04639iIlqT0fzlh
	 MPaKD4YNpv5so5DsDRmBxagP8E0d3DByRPIkbHqZTtjLNXT5fVjOCsZyMmXwzJXKqU
	 ZxVjQLQQNh2V2nRBw3EY/BsY1vP7fHOk7QE3tmYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58993F804DF;
	Wed, 20 Jan 2021 16:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 389CAF80137; Wed, 20 Jan 2021 16:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1912CF80227
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1912CF80227
IronPort-SDR: TzBYevkC43Ck/Fxz31Ibc0hdYGotIvLDnTPWsO2hoNZQ+WMhtq99dtVXeSmanAPxXnMMJ4nuTf
 Z/SMGcgggGsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197850652"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="197850652"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 07:29:04 -0800
IronPort-SDR: 0/TV83LUMw9eay8XhUq8P2a08W0Y/OFoa/tvXPGn+nxF8Vrk6Slw6VFgPlbV4KcFok36xbvIzD
 l/hyFkVx6w5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="354347873"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga006.jf.intel.com with ESMTP; 20 Jan 2021 07:29:02 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/5] ASoC: topology: KUnit: Add KUnit tests passing topology
 with PCM to snd_soc_tplg_component_load
Date: Wed, 20 Jan 2021 16:28:46 +0100
Message-Id: <20210120152846.1703655-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
References: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

In order to ensure correct behaviour of topology API, add unit tests
exercising topology functionality.

Add topology containing PCM template and tests for parsing it. Also
adds test cases simulating modules reloads in case of separate drivers
for card and component.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology-test.c | 231 ++++++++++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index bae40c111f9b..36e2a3486dbf 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -138,6 +138,79 @@ static struct tplg_tmpl_001 tplg_tmpl_empty = {
 	},
 };
 
+// Structural representation of topology containing SectionPCM
+
+struct tplg_tmpl_002 {
+	struct snd_soc_tplg_hdr header;
+	struct snd_soc_tplg_manifest manifest;
+	struct snd_soc_tplg_hdr pcm_header;
+	struct snd_soc_tplg_pcm pcm;
+} __packed;
+
+static struct tplg_tmpl_002 tplg_tmpl_with_pcm = {
+	.header = {
+		.magic = SND_SOC_TPLG_MAGIC,
+		.abi = 5,
+		.version = 0,
+		.type = SND_SOC_TPLG_TYPE_MANIFEST,
+		.size = sizeof(struct snd_soc_tplg_hdr),
+		.vendor_type = 0,
+		.payload_size = sizeof(struct snd_soc_tplg_manifest),
+		.index = 0,
+		.count = 1,
+	},
+	.manifest = {
+		.size = sizeof(struct snd_soc_tplg_manifest),
+		.pcm_elems = 1,
+		/* rest of fields is 0 */
+	},
+	.pcm_header = {
+		.magic = SND_SOC_TPLG_MAGIC,
+		.abi = 5,
+		.version = 0,
+		.type = SND_SOC_TPLG_TYPE_PCM,
+		.size = sizeof(struct snd_soc_tplg_hdr),
+		.vendor_type = 0,
+		.payload_size = sizeof(struct snd_soc_tplg_pcm),
+		.index = 0,
+		.count = 1,
+	},
+	.pcm = {
+		.size = sizeof(struct snd_soc_tplg_pcm),
+		.pcm_name = "KUNIT Audio",
+		.dai_name = "kunit-audio-dai",
+		.pcm_id = 0,
+		.dai_id = 0,
+		.playback = 1,
+		.capture = 1,
+		.compress = 0,
+		.stream = {
+			[0] = {
+				.channels = 2,
+			},
+			[1] = {
+				.channels = 2,
+			},
+		},
+		.num_streams = 0,
+		.caps = {
+			[0] = {
+				.name = "kunit-audio-playback",
+				.channels_min = 2,
+				.channels_max = 2,
+			},
+			[1] = {
+				.name = "kunit-audio-capture",
+				.channels_min = 2,
+				.channels_max = 2,
+			},
+		},
+		.flag_mask = 0,
+		.flags = 0,
+		.priv = { 0 },
+	},
+};
+
 /* ===== TEST CASES ========================================================= */
 
 // TEST CASE
@@ -586,6 +659,161 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, 0, ret);
 }
 
+// TEST CASE
+// Test passing topology file with PCM definition
+static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	u8 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = 0; /* expect success */
+
+	size = sizeof(tplg_tmpl_with_pcm);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_with_pcm, sizeof(tplg_tmpl_with_pcm));
+
+	kunit_comp->fw.data = data;
+	kunit_comp->fw.size = size;
+
+	kunit_comp->card.dev = test_dev,
+	kunit_comp->card.name = "kunit-card",
+	kunit_comp->card.owner = THIS_MODULE,
+	kunit_comp->card.dai_link = kunit_dai_links,
+	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links),
+	kunit_comp->card.fully_routed = true,
+
+	/* run test */
+	ret = snd_soc_register_card(&kunit_comp->card);
+	if (ret != 0 && ret != -EPROBE_DEFER)
+		KUNIT_FAIL(test, "Failed to register card");
+
+	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	snd_soc_unregister_component(test_dev);
+
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+}
+
+// TEST CASE
+// Test passing topology file with PCM definition
+// with component reload
+static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	u8 *data;
+	int size;
+	int ret;
+	int i;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = 0; /* expect success */
+
+	size = sizeof(tplg_tmpl_with_pcm);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_with_pcm, sizeof(tplg_tmpl_with_pcm));
+
+	kunit_comp->fw.data = data;
+	kunit_comp->fw.size = size;
+
+	kunit_comp->card.dev = test_dev,
+	kunit_comp->card.name = "kunit-card",
+	kunit_comp->card.owner = THIS_MODULE,
+	kunit_comp->card.dai_link = kunit_dai_links,
+	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links),
+	kunit_comp->card.fully_routed = true,
+
+	/* run test */
+	ret = snd_soc_register_card(&kunit_comp->card);
+	if (ret != 0 && ret != -EPROBE_DEFER)
+		KUNIT_FAIL(test, "Failed to register card");
+
+	for (i = 0; i < 100; i++) {
+		ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
+		KUNIT_EXPECT_EQ(test, 0, ret);
+
+		ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+		KUNIT_EXPECT_EQ(test, 0, ret);
+
+		snd_soc_unregister_component(test_dev);
+	}
+
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+}
+
+// TEST CASE
+// Test passing topology file with PCM definition
+// with card reload
+static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	u8 *data;
+	int size;
+	int ret;
+	int i;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = 0; /* expect success */
+
+	size = sizeof(tplg_tmpl_with_pcm);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_with_pcm, sizeof(tplg_tmpl_with_pcm));
+
+	kunit_comp->fw.data = data;
+	kunit_comp->fw.size = size;
+
+	kunit_comp->card.dev = test_dev,
+	kunit_comp->card.name = "kunit-card",
+	kunit_comp->card.owner = THIS_MODULE,
+	kunit_comp->card.dai_link = kunit_dai_links,
+	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links),
+	kunit_comp->card.fully_routed = true,
+
+	/* run test */
+	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	for (i = 0; i < 100; i++) {
+		ret = snd_soc_register_card(&kunit_comp->card);
+		if (ret != 0 && ret != -EPROBE_DEFER)
+			KUNIT_FAIL(test, "Failed to register card");
+
+		ret = snd_soc_unregister_card(&kunit_comp->card);
+		KUNIT_EXPECT_EQ(test, 0, ret);
+	}
+
+	/* cleanup */
+	snd_soc_unregister_component(test_dev);
+}
+
 /* ===== KUNIT MODULE DEFINITIONS =========================================== */
 
 static struct kunit_case snd_soc_tplg_test_cases[] = {
@@ -597,6 +825,9 @@ static struct kunit_case snd_soc_tplg_test_cases[] = {
 	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_abi),
 	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_size),
 	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_payload_size),
+	KUNIT_CASE(snd_soc_tplg_test_load_pcm_tplg),
+	KUNIT_CASE(snd_soc_tplg_test_load_pcm_tplg_reload_comp),
+	KUNIT_CASE(snd_soc_tplg_test_load_pcm_tplg_reload_card),
 	{}
 };
 
-- 
2.25.1

