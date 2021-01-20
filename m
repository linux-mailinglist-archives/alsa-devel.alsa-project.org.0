Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40752FD3FD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:32:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A4C01877;
	Wed, 20 Jan 2021 16:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A4C01877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611156731;
	bh=CpWAjl5IBC7T//I2ugJNwoa48B0Zoswqh+BXFoKWrIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfdgQq2NwrKWV9SPi5zmwCiOH1/rYr2cec8eZIaeEjG7H1Js/yYCshOAIEohQc5az
	 illphwp+wsTVOA8THuNhiep/kWYx2C+49MYx4Kbnwhsvn0FkkKpE5W14XARy7TFkLs
	 0suIfuDnXT8VX30ZYoACbQzOy9M7rZA1+ULo4h2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B01F804CC;
	Wed, 20 Jan 2021 16:29:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31183F80166; Wed, 20 Jan 2021 16:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 362D8F8019D
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 362D8F8019D
IronPort-SDR: jpb4r5XSKDR0nazDFLkjEHSRcFv2BroHkW+esT9oJHeljYMe7UeXXdZCHOfmEOrgcej/OhUtJW
 bwcHeq2LGRNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197850650"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="197850650"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 07:29:02 -0800
IronPort-SDR: QZD+pi8iSoc4Nl5uwiVDRudNk5lNeAdf9exA9VsTnHsVbnTUwPNXvrIh+zKRIu1CiVfewniCj2
 lB9p7AEE128g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="354347862"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga006.jf.intel.com with ESMTP; 20 Jan 2021 07:29:00 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/5] ASoC: topology: KUnit: Add KUnit tests passing empty
 topology with variants to snd_soc_tplg_component_load
Date: Wed, 20 Jan 2021 16:28:45 +0100
Message-Id: <20210120152846.1703655-5-amadeuszx.slawinski@linux.intel.com>
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

Add "empty" topology template and tests for parsing it. Also adds few
variants with bad magic numbers.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology-test.c | 311 +++++++++++++++++++++++++++++++++-
 1 file changed, 310 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 7276ed95d83d..bae40c111f9b 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/firmware.h>
-#include <linux/random.h>
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/soc-topology.h>
@@ -108,6 +107,37 @@ static const struct snd_soc_component_driver test_component = {
 	.non_legacy_dai_naming = 1,
 };
 
+/* ===== TOPOLOGY TEMPLATES ================================================= */
+
+// Structural representation of topology which can be generated with:
+// $ touch empty
+// $ alsatplg -c empty -o empty.tplg
+// $ xxd -i empty.tplg
+
+struct tplg_tmpl_001 {
+	struct snd_soc_tplg_hdr header;
+	struct snd_soc_tplg_manifest manifest;
+} __packed;
+
+static struct tplg_tmpl_001 tplg_tmpl_empty = {
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
+
+	.manifest = {
+		.size = sizeof(struct snd_soc_tplg_manifest),
+		/* rest of fields is 0 */
+	},
+};
+
 /* ===== TEST CASES ========================================================= */
 
 // TEST CASE
@@ -282,12 +312,291 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	snd_soc_unregister_component(test_dev);
 }
 
+// TEST CASE
+// Test passing "empty" topology file
+static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	struct tplg_tmpl_001 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = 0; /* expect success */
+
+	size = sizeof(tplg_tmpl_empty);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_empty, sizeof(tplg_tmpl_empty));
+
+	kunit_comp->fw.data = (u8 *)data;
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
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	snd_soc_unregister_component(test_dev);
+}
+
+// TEST CASE
+// Test "empty" topology file, but with bad "magic"
+// In theory we could loop through all possible bad values, but it takes too
+// long, so just use SND_SOC_TPLG_MAGIC + 1
+static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	struct tplg_tmpl_001 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
+
+	size = sizeof(tplg_tmpl_empty);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_empty, sizeof(tplg_tmpl_empty));
+	/*
+	 * override abi
+	 * any value != magic number is wrong
+	 */
+	data->header.magic = SND_SOC_TPLG_MAGIC + 1;
+
+	kunit_comp->fw.data = (u8 *)data;
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
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	snd_soc_unregister_component(test_dev);
+}
+
+// TEST CASE
+// Test "empty" topology file, but with bad "abi"
+// In theory we could loop through all possible bad values, but it takes too
+// long, so just use SND_SOC_TPLG_ABI_VERSION + 1
+static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	struct tplg_tmpl_001 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
+
+	size = sizeof(tplg_tmpl_empty);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_empty, sizeof(tplg_tmpl_empty));
+	/*
+	 * override abi
+	 * any value != accepted range is wrong
+	 */
+	data->header.abi = SND_SOC_TPLG_ABI_VERSION + 1;
+
+	kunit_comp->fw.data = (u8 *)data;
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
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	snd_soc_unregister_component(test_dev);
+}
+
+// TEST CASE
+// Test "empty" topology file, but with bad "size"
+// In theory we could loop through all possible bad values, but it takes too
+// long, so just use sizeof(struct snd_soc_tplg_hdr) + 1
+static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	struct tplg_tmpl_001 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
+
+	size = sizeof(tplg_tmpl_empty);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_empty, sizeof(tplg_tmpl_empty));
+	/*
+	 * override size
+	 * any value != struct size is wrong
+	 */
+	data->header.size = sizeof(struct snd_soc_tplg_hdr) + 1;
+
+	kunit_comp->fw.data = (u8 *)data;
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
+	/* cleanup */
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+
+	snd_soc_unregister_component(test_dev);
+}
+
+// TEST CASE
+// Test "empty" topology file, but with bad "payload_size"
+// In theory we could loop through all possible bad values, but it takes too
+// long, so just use the known wrong one
+static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	struct tplg_tmpl_001 *data;
+	int size;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
+
+	size = sizeof(tplg_tmpl_empty);
+	data = kunit_kzalloc(kunit_comp->kunit, size, GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(kunit_comp->kunit, data);
+
+	memcpy(data, &tplg_tmpl_empty, sizeof(tplg_tmpl_empty));
+	/*
+	 * override payload size
+	 * there is only explicit check for 0, so check with it, other values
+	 * are handled by just not reading behind EOF
+	 */
+	data->header.payload_size = 0;
+
+	kunit_comp->fw.data = (u8 *)data;
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
+	/* cleanup */
+	snd_soc_unregister_component(test_dev);
+
+	ret = snd_soc_unregister_card(&kunit_comp->card);
+	KUNIT_EXPECT_EQ(test, 0, ret);
+}
+
 /* ===== KUNIT MODULE DEFINITIONS =========================================== */
 
 static struct kunit_case snd_soc_tplg_test_cases[] = {
 	KUNIT_CASE(snd_soc_tplg_test_load_with_null_comp),
 	KUNIT_CASE(snd_soc_tplg_test_load_with_null_ops),
 	KUNIT_CASE(snd_soc_tplg_test_load_with_null_fw),
+	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg),
+	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_magic),
+	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_abi),
+	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_size),
+	KUNIT_CASE(snd_soc_tplg_test_load_empty_tplg_bad_payload_size),
 	{}
 };
 
-- 
2.25.1

