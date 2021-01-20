Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8512FD3FC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07B6183F;
	Wed, 20 Jan 2021 16:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07B6183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611156712;
	bh=TFTvblpmLiqLY7zoVTb78sIYPkXW4J2LIe8g6XhccIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njIg/4+EVee7YVGrIaJof8izc/iFbpCy/ETf3R3MuFnJRgBKpehavbmI1iMnFAu2x
	 QDo3r1080BAnlshOa1cwqXM8TyD+yJYI1tZLvcpHoZwwiNliLYzB7RYA1Gx7lTe1gH
	 9EY2pOLVFKLAZAuLtUhHPB8pp3rfgeaNUAFxlBn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D61F804C3;
	Wed, 20 Jan 2021 16:29:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAEBDF80164; Wed, 20 Jan 2021 16:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EAF1F8016E
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAF1F8016E
IronPort-SDR: APZvtU+URO9BRjpRki10gP6ixzsAyLG9qKZQ/rVGeT0xOqNN5w6t/9q+7nv0Kma9Ss912h8vLi
 2zViYlRCLmfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197850642"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="197850642"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 07:29:00 -0800
IronPort-SDR: w7/dnVJbqfJsUnPtlDfMzh9BZejrqsycvBJt2a6KaEzt7P20uVoCC3/qgpRU1wf2Qvb269xlhs
 buxqzAzHdatA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="354347848"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga006.jf.intel.com with ESMTP; 20 Jan 2021 07:28:58 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/5] ASoC: topology: KUnit: Add KUnit tests passing various
 arguments to snd_soc_tplg_component_load
Date: Wed, 20 Jan 2021 16:28:44 +0100
Message-Id: <20210120152846.1703655-4-amadeuszx.slawinski@linux.intel.com>
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

Start with adding cases for passing various arguments to
snd_soc_tplg_component_load as it is part of exposed topology API.

First test case adds test passing NULL component as argument.
Following one adds test case for passing NULL ops as argument.
Finally add test case passing NULL fw as argument.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/Kconfig             |  17 ++
 sound/soc/Makefile            |   5 +
 sound/soc/soc-topology-test.c | 303 ++++++++++++++++++++++++++++++++++
 3 files changed, 325 insertions(+)
 create mode 100644 sound/soc/soc-topology-test.c

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 47da9ce17693..010328069256 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -37,6 +37,23 @@ config SND_SOC_COMPRESS
 config SND_SOC_TOPOLOGY
 	bool
 
+config SND_SOC_TOPOLOGY_KUNIT_TESTS
+	tristate "KUnit tests for SoC topology"
+	depends on KUNIT
+	depends on SND_SOC_TOPOLOGY
+	default KUNIT_ALL_TESTS
+	help
+	  If you want to perform tests on ALSA SoC topology support say Y here.
+
+	  This builds a module which can be later manually loaded to run KUNIT
+	  test cases against soc-topology.c API. This should be primarily used
+	  by developers to test their changes to ASoC.
+
+	  Do note that it creates fake playback devices which do not interact
+	  well with userspace. When running tests one may want to disable
+	  userspace applications such as pulseaudio, to prevent unnecessary
+	  problems.
+
 config SND_SOC_ACPI
 	tristate
 
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 508dbaa1814e..c93affe81094 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -7,6 +7,11 @@ ifneq ($(CONFIG_SND_SOC_TOPOLOGY),)
 snd-soc-core-objs += soc-topology.o
 endif
 
+ifneq ($(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TESTS),)
+# snd-soc-test-objs := soc-topology-test.o
+obj-$(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TESTS) := soc-topology-test.o
+endif
+
 ifneq ($(CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM),)
 snd-soc-core-objs += soc-generic-dmaengine-pcm.o
 endif
diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
new file mode 100644
index 000000000000..7276ed95d83d
--- /dev/null
+++ b/sound/soc/soc-topology-test.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-topology-test.c  --  ALSA SoC Topology Kernel Unit Tests
+ *
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/firmware.h>
+#include <linux/random.h>
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/soc-topology.h>
+#include <kunit/test.h>
+
+/* ===== HELPER FUNCTIONS =================================================== */
+
+/*
+ * snd_soc_component needs device to operate on (primarily for prints), create
+ * fake one, as we don't register with PCI or anything else
+ * device_driver name is used in some of the prints (fmt_single_name) so
+ * we also mock up minimal one
+ */
+static struct device *test_dev;
+
+static struct device_driver test_drv = {
+	.name = "sound-soc-topology-test-driver",
+};
+
+static int snd_soc_tplg_test_init(struct kunit *test)
+{
+	test_dev = root_device_register("sound-soc-topology-test");
+	test_dev = get_device(test_dev);
+	if (!test_dev)
+		return -ENODEV;
+
+	test_dev->driver = &test_drv;
+
+	return 0;
+}
+
+static void snd_soc_tplg_test_exit(struct kunit *test)
+{
+	put_device(test_dev);
+	root_device_unregister(test_dev);
+}
+
+/*
+ * helper struct we use when registering component, as we load topology during
+ * component probe, we need to pass struct kunit somehow to probe function, so
+ * we can report test result
+ */
+struct kunit_soc_component {
+	struct kunit *kunit;
+	int expect; /* what result we expect when loading topology */
+	struct snd_soc_component comp;
+	struct snd_soc_card card;
+	struct firmware fw;
+};
+
+static int d_probe(struct snd_soc_component *component)
+{
+	struct kunit_soc_component *kunit_comp =
+			container_of(component, struct kunit_soc_component, comp);
+	int ret;
+
+	ret = snd_soc_tplg_component_load(component, NULL, &kunit_comp->fw);
+	KUNIT_EXPECT_EQ_MSG(kunit_comp->kunit, kunit_comp->expect, ret,
+			    "Failed topology load");
+
+	return 0;
+}
+
+static void d_remove(struct snd_soc_component *component)
+{
+	struct kunit_soc_component *kunit_comp =
+			container_of(component, struct kunit_soc_component, comp);
+	int ret;
+
+	ret = snd_soc_tplg_component_remove(component);
+	KUNIT_EXPECT_EQ(kunit_comp->kunit, 0, ret);
+}
+
+/*
+ * ASoC minimal boiler plate
+ */
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("sound-soc-topology-test")));
+
+static struct snd_soc_dai_link kunit_dai_links[] = {
+	{
+		.name = "KUNIT Audio Port",
+		.id = 0,
+		.stream_name = "Audio Playback/Capture",
+		.nonatomic = 1,
+		.dynamic = 1,
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dummy, dummy, platform),
+	},
+};
+
+static const struct snd_soc_component_driver test_component = {
+	.name = "sound-soc-topology-test",
+	.probe = d_probe,
+	.remove = d_remove,
+	.non_legacy_dai_naming = 1,
+};
+
+/* ===== TEST CASES ========================================================= */
+
+// TEST CASE
+// Test passing NULL component as parameter to snd_soc_tplg_component_load
+
+/*
+ * need to override generic probe function with one using NULL when calling
+ * topology load during component initialization, we don't need .remove
+ * handler as load should fail
+ */
+static int d_probe_null_comp(struct snd_soc_component *component)
+{
+	struct kunit_soc_component *kunit_comp =
+			container_of(component, struct kunit_soc_component, comp);
+	int ret;
+
+	/* instead of passing component pointer as first argument, pass NULL here */
+	ret = snd_soc_tplg_component_load(NULL, NULL, &kunit_comp->fw);
+	KUNIT_EXPECT_EQ_MSG(kunit_comp->kunit, kunit_comp->expect, ret,
+			    "Failed topology load");
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver test_component_null_comp = {
+	.name = "sound-soc-topology-test",
+	.probe = d_probe_null_comp,
+	.non_legacy_dai_naming = 1,
+};
+
+static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
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
+	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_comp, test_dev);
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
+// Test passing NULL ops as parameter to snd_soc_tplg_component_load
+
+/*
+ * NULL ops is default case, we pass empty topology (fw), so we don't have
+ * anything to parse and just do nothing, which results in return 0; from
+ * calling soc_tplg_dapm_complete in soc_tplg_process_headers
+ */
+static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = 0; /* expect success */
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
+// Test passing NULL fw as parameter to snd_soc_tplg_component_load
+
+/*
+ * need to override generic probe function with one using NULL pointer to fw
+ * when calling topology load during component initialization, we don't need
+ * .remove handler as load should fail
+ */
+static int d_probe_null_fw(struct snd_soc_component *component)
+{
+	struct kunit_soc_component *kunit_comp =
+			container_of(component, struct kunit_soc_component, comp);
+	int ret;
+
+	/* instead of passing fw pointer as third argument, pass NULL here */
+	ret = snd_soc_tplg_component_load(component, NULL, NULL);
+	KUNIT_EXPECT_EQ_MSG(kunit_comp->kunit, kunit_comp->expect, ret,
+			    "Failed topology load");
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver test_component_null_fw = {
+	.name = "sound-soc-topology-test",
+	.probe = d_probe_null_fw,
+	.non_legacy_dai_naming = 1,
+};
+
+static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
+{
+	struct kunit_soc_component *kunit_comp;
+	int ret;
+
+	/* prepare */
+	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
+	kunit_comp->kunit = test;
+	kunit_comp->expect = -EINVAL; /* expect failure */
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
+	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_fw, test_dev);
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
+/* ===== KUNIT MODULE DEFINITIONS =========================================== */
+
+static struct kunit_case snd_soc_tplg_test_cases[] = {
+	KUNIT_CASE(snd_soc_tplg_test_load_with_null_comp),
+	KUNIT_CASE(snd_soc_tplg_test_load_with_null_ops),
+	KUNIT_CASE(snd_soc_tplg_test_load_with_null_fw),
+	{}
+};
+
+static struct kunit_suite snd_soc_tplg_test_suite = {
+	.name = "snd_soc_tplg_test",
+	.init = snd_soc_tplg_test_init,
+	.exit = snd_soc_tplg_test_exit,
+	.test_cases = snd_soc_tplg_test_cases,
+};
+
+kunit_test_suites(&snd_soc_tplg_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

