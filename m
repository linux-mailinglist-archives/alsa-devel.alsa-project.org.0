Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0434620FA4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C38B83A;
	Tue,  8 Nov 2022 12:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C38B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667908690;
	bh=GHzB7qQl6Hb1nijNzHTsDJ9L+DMaQ43TYbdl7UnJBZk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MSD3pSWUxf7d4tHCpndfVeVpzZvlZEGqSnCjMZMC9erinXSvPUWXmiJqpqV9LbxZc
	 uywbY5KYYRsSIzCMfN8eOU5KLJRRChHlJfgg0BcpgieZxKSI6tE4kgLjvgliQnChMp
	 2iUNRKun+rWDllcEqLs+Btpw+s3Yoqh/alV3OmSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972B4F8020D;
	Tue,  8 Nov 2022 12:57:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E47AF800F4; Tue,  8 Nov 2022 12:57:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F00FF800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:57:04 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5475EA003F;
 Tue,  8 Nov 2022 12:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5475EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1667908624; bh=JtyFhxHbGkz6LrmnBG7wKmEKLQL6cfxvewokhJ4YrMk=;
 h=From:To:Cc:Subject:Date:From;
 b=yaEGLCtLMWTqUs8YliF+/GwoqyMsf5SemF1dY7XhRabsHL+5/tDn7fqQ38jdODabo
 jKszf5mk1pqHHtqoE1dOHeSjp88pxpg6nuAYRlPZFz9JFDrSI7/ycf8A0EO2q7+oJO
 O3nyl1IcJZ8/GYpZ0PeZlQqoDWxOpET6HgvehZAM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Nov 2022 12:56:54 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] [RFC] selftests: alsa - add PCM test
Date: Tue,  8 Nov 2022 12:56:43 +0100
Message-Id: <20221108115643.3750754-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.de>,
 Brian Norris <briannorris@chromium.org>,
 Curtis Malainey <cujomalainey@google.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@intel.com>, Jesse Barnes <jsbarnes@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

This initial code does a simple sample transfer tests. By default,
all PCM devices are detected and tested with short and long
buffering parameters for 4 seconds. If the sample transfer timing
is not in a +-100ms boundary, the test fails. Only the interleaved
buffering scheme is supported in this version.

The configuration may be modified with the configuration files.
A specific hardware configuration is detected and activated
using the sysfs regex matching. This allows to use the DMI string
(/sys/class/dmi/id/* tree) or any other system parameters
exposed in sysfs for the matching for the CI automation.

The configuration file may also specify the PCM device list to detect
the missing PCM devices.

Cc: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>
Cc: Jesse Barnes <jsbarnes@google.com>
Cc: Jimmy Cheng-Yi Chiang <cychiang@google.com>
Cc: Curtis Malainey <cujomalainey@google.com>
Cc: Brian Norris <briannorris@chromium.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 tools/testing/selftests/alsa/Makefile         |   4 +-
 tools/testing/selftests/alsa/conf.c           | 379 +++++++++++++
 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  |  76 +++
 tools/testing/selftests/alsa/pcm-test.c       | 523 ++++++++++++++++++
 4 files changed, 981 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/alsa/conf.c
 create mode 100644 tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
 create mode 100644 tools/testing/selftests/alsa/pcm-test.c

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index fd8ddce2b1a6..8ac22d2eb2ba 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -7,6 +7,8 @@ ifeq ($(LDLIBS),)
 LDLIBS += -lasound
 endif
 
-TEST_GEN_PROGS := mixer-test
+TEST_GEN_PROGS := mixer-test pcm-test
+
+pcm-test: pcm-test.c conf.c
 
 include ../lib.mk
diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
new file mode 100644
index 000000000000..dd6aa90deef9
--- /dev/null
+++ b/tools/testing/selftests/alsa/conf.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// kselftest configuration helpers for the hw specific configuration
+//
+// Original author: Jaroslav Kysela <perex@perex.cz>
+// Copyright (c) 2022 Red Hat Inc.
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <assert.h>
+#include <dirent.h>
+#include <regex.h>
+#include <sys/stat.h>
+
+#include "../kselftest.h"
+#include "alsa-local.h"
+
+#define SYSFS_ROOT "/sys"
+
+struct card_data {
+	int card;
+	snd_config_t *config;
+	const char *filename;
+	struct card_data *next;
+};
+
+static struct card_data *conf_cards;
+
+static struct card_data *conf_data_by_card(int card, bool msg)
+{
+	struct card_data *conf;
+
+	for (conf = conf_cards; conf; conf = conf->next) {
+		if (conf->card == card) {
+			if (msg)
+				ksft_print_msg("using hw card config %s for card %d\n",
+					       conf->filename, card);
+			return conf;
+		}
+	}
+	return NULL;
+}
+
+static int dump_config_tree(snd_config_t *top)
+{
+	snd_output_t *out;
+	int err;
+
+	err = snd_output_stdio_attach(&out, stdout, 0);
+	if (err < 0)
+		ksft_exit_fail_msg("stdout attach\n");
+	if (snd_config_save(top, out))
+		ksft_exit_fail_msg("config save\n");
+	snd_output_close(out);
+}
+
+static snd_config_t *load(const char *filename)
+{
+	snd_config_t *dst;
+	snd_input_t *input;
+	int err;
+
+	err = snd_input_stdio_open(&input, filename, "r");
+	if (err < 0)
+		ksft_exit_fail_msg("Unable to parse filename %s\n", filename);
+	err = snd_config_top(&dst);
+	if (err < 0)
+		ksft_exit_fail_msg("Out of memory\n");
+	err = snd_config_load(dst, input);
+	snd_input_close(input);
+	if (err < 0)
+		ksft_exit_fail_msg("Unable to parse filename %s\n", filename);
+	return dst;
+}
+
+static char *sysfs_get(const char *sysfs_root, const char *id)
+{
+	char path[PATH_MAX], link[PATH_MAX + 1];
+	struct stat sb;
+	ssize_t len;
+	char *e;
+	int fd;
+
+	if (id[0] == '/')
+		id++;
+	snprintf(path, sizeof(path), "%s/%s", sysfs_root, id);
+	if (lstat(path, &sb) != 0)
+		return NULL;
+	if (S_ISLNK(sb.st_mode)) {
+		len = readlink(path, link, sizeof(link) - 1);
+		if (len <= 0) {
+			ksft_exit_fail_msg("sysfs: cannot read link '%s': %s\n",
+					   path, strerror(errno));
+			return NULL;
+		}
+		link[len] = '\0';
+		e = strrchr(link, '/');
+		if (e)
+			return strdup(e + 1);
+		return NULL;
+	}
+	if (S_ISDIR(sb.st_mode))
+		return NULL;
+	if ((sb.st_mode & S_IRUSR) == 0)
+		return NULL;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		if (errno == ENOENT)
+			return NULL;
+		ksft_exit_fail_msg("sysfs: open failed for '%s': %s\n",
+				   path, strerror(errno));
+	}
+	len = read(fd, path, sizeof(path)-1);
+	close(fd);
+	if (len < 0)
+		ksft_exit_fail_msg("sysfs: unable to read value '%s': %s\n",
+				   path, errno);
+	while (len > 0 && path[len-1] == '\n')
+		len--;
+	path[len] = '\0';
+	e = strdup(path);
+	if (e == NULL)
+		ksft_exit_fail_msg("Out of memory\n");
+	return e;
+}
+
+static bool sysfs_match(const char *sysfs_root, snd_config_t *config)
+{
+	snd_config_t *node, *path_config, *regex_config;
+	snd_config_iterator_t i, next;
+	const char *path_string, *regex_string, *v;
+	regex_t re;
+	regmatch_t match[1];
+	int iter = 0, ret;
+
+	snd_config_for_each(i, next, config) {
+		node = snd_config_iterator_entry(i);
+		if (snd_config_search(node, "path", &path_config))
+			ksft_exit_fail_msg("Missing path field in the sysfs block\n");
+		if (snd_config_search(node, "regex", &regex_config))
+			ksft_exit_fail_msg("Missing regex field in the sysfs block\n");
+		if (snd_config_get_string(path_config, &path_string))
+			ksft_exit_fail_msg("Path field in the sysfs block is not a string\n");
+		if (snd_config_get_string(regex_config, &regex_string))
+			ksft_exit_fail_msg("Regex field in the sysfs block is not a string\n");
+		iter++;
+		v = sysfs_get(sysfs_root, path_string);
+		if (!v)
+			return false;
+		if (regcomp(&re, regex_string, REG_EXTENDED))
+			ksft_exit_fail_msg("Wrong regex '%s'\n", regex_string);
+		ret = regexec(&re, v, 1, match, 0);
+		regfree(&re);
+		if (ret)
+			return false;
+	}
+	return iter > 0;
+}
+
+static bool test_filename1(int card, const char *filename, const char *sysfs_card_root)
+{
+	struct card_data *data, *data2;
+	snd_config_t *config, *sysfs_config, *card_config, *sysfs_card_config, *node;
+	snd_config_iterator_t i, next;
+
+	config = load(filename);
+	if (snd_config_search(config, "sysfs", &sysfs_config) ||
+	    snd_config_get_type(sysfs_config) != SND_CONFIG_TYPE_COMPOUND)
+		ksft_exit_fail_msg("Missing global sysfs block in filename %s\n", filename);
+	if (snd_config_search(config, "card", &card_config) ||
+	    snd_config_get_type(card_config) != SND_CONFIG_TYPE_COMPOUND)
+		ksft_exit_fail_msg("Missing global card block in filename %s\n", filename);
+	if (!sysfs_match(SYSFS_ROOT, sysfs_config))
+		return false;
+	snd_config_for_each(i, next, card_config) {
+		node = snd_config_iterator_entry(i);
+		if (snd_config_search(node, "sysfs", &sysfs_card_config) ||
+		    snd_config_get_type(sysfs_card_config) != SND_CONFIG_TYPE_COMPOUND)
+			ksft_exit_fail_msg("Missing card sysfs block in filename %s\n", filename);
+		if (!sysfs_match(sysfs_card_root, sysfs_card_config))
+			continue;
+		data = malloc(sizeof(*data));
+		if (!data)
+			ksft_exit_fail_msg("Out of memory\n");
+		data2 = conf_data_by_card(card, false);
+		if (data2)
+			ksft_exit_fail_msg("Duplicate card '%s' <-> '%s'\n", filename, data2->filename);
+		data->card = card;
+		data->filename = filename;
+		data->config = node;
+		data->next = conf_cards;
+		conf_cards = data;
+		return true;
+	}
+	return false;
+}
+
+static bool test_filename(const char *filename)
+{
+	char fn[128];
+	int card;
+
+	for (card = 0; card < 32; card++) {
+		snprintf(fn, sizeof(fn), "%s/class/sound/card%d", SYSFS_ROOT, card);
+		if (access(fn, R_OK) == 0 && test_filename1(card, filename, fn))
+			return true;
+	}
+	return false;
+}
+
+static int filename_filter(const struct dirent *dirent)
+{
+	size_t flen;
+
+	if (dirent == NULL)
+		return 0;
+	if (dirent->d_type == DT_DIR)
+		return 0;
+	flen = strlen(dirent->d_name);
+	if (flen <= 5)
+		return 0;
+	if (strncmp(&dirent->d_name[flen-5], ".conf", 5) == 0)
+		return 1;
+	return 0;
+}
+
+void conf_load(void)
+{
+	const char *fn = "conf.d";
+	struct dirent **namelist;
+	int n, j;
+
+	n = scandir(fn, &namelist, filename_filter, alphasort);
+	if (n < 0)
+		ksft_exit_fail_msg("scandir: %s\n", strerror(errno));
+	for (j = 0; j < n; j++) {
+		size_t sl = strlen(fn) + strlen(namelist[j]->d_name) + 2;
+		char *filename = malloc(sl);
+		if (filename == NULL)
+			ksft_exit_fail_msg("Out of memory\n");
+		sprintf(filename, "%s/%s", fn, namelist[j]->d_name);
+		if (test_filename(filename))
+			filename = NULL;
+		free(filename);
+		free(namelist[j]);
+	}
+	free(namelist);
+}
+
+void conf_free(void)
+{
+	struct card_data *conf;
+
+	while (conf_cards) {
+		conf = conf_cards;
+		conf_cards = conf->next;
+		snd_config_delete(conf->config);
+	}
+}
+
+snd_config_t *conf_by_card(int card)
+{
+	struct card_data *conf;
+
+	conf = conf_data_by_card(card, true);
+	if (conf)
+		return conf->config;
+	return NULL;
+}
+
+static int conf_get_by_keys(snd_config_t *root, const char *key1,
+			    const char *key2, snd_config_t **result)
+{
+	int ret;
+
+	if (key1) {
+		ret = snd_config_search(root, key1, &root);
+		if (ret != -ENOENT && ret < 0)
+			return ret;
+	}
+	if (key2)
+		ret = snd_config_search(root, key2, &root);
+	if (ret >= 0)
+		*result = root;
+	return ret;
+}
+
+snd_config_t *conf_get_subtree(snd_config_t *root, const char *key1, const char *key2)
+{
+	int ret;
+
+	if (!root)
+		return NULL;
+	ret = conf_get_by_keys(root, key1, key2, &root);
+	if (ret == -ENOENT)
+		return NULL;
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
+	return root;
+}
+
+int conf_get_count(snd_config_t *root, const char *key1, const char *key2)
+{
+	snd_config_t *cfg;
+	snd_config_iterator_t i, next;
+	int count, ret;
+
+	if (!root)
+		return -1;
+	ret = conf_get_by_keys(root, key1, key2, &cfg);
+	if (ret == -ENOENT)
+		return -1;
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
+	if (snd_config_get_type(cfg) != SND_CONFIG_TYPE_COMPOUND)
+		ksft_exit_fail_msg("key '%s'.'%s' is not a compound\n", key1, key2);
+	count = 0;
+	snd_config_for_each(i, next, cfg)
+		count++;
+	return count;
+}
+
+const char *conf_get_string(snd_config_t *root, const char *key1, const char *key2, const char *def)
+{
+	snd_config_t *cfg;
+	const char *s;
+	int ret;
+
+	if (!root)
+		return def;
+	ret = conf_get_by_keys(root, key1, key2, &cfg);
+	if (ret == -ENOENT)
+		return def;
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
+	if (snd_config_get_string(cfg, &s))
+		ksft_exit_fail_msg("key '%s'.'%s' is not a string\n", key1, key2);
+	return s;
+}
+
+long conf_get_long(snd_config_t *root, const char *key1, const char *key2, long def)
+{
+	snd_config_t *cfg;
+	long l;
+	int ret;
+
+	if (!root)
+		return def;
+	ret = conf_get_by_keys(root, key1, key2, &cfg);
+	if (ret == -ENOENT)
+		return def;
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
+	if (snd_config_get_integer(cfg, &l))
+		ksft_exit_fail_msg("key '%s'.'%s' is not an integer\n", key1, key2);
+	return l;
+}
+
+int conf_get_bool(snd_config_t *root, const char *key1, const char *key2, int def)
+{
+	snd_config_t *cfg;
+	long l;
+	int ret;
+
+	if (!root)
+		return def;
+	ret = conf_get_by_keys(root, key1, key2, &cfg);
+	if (ret == -ENOENT)
+		return def;
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' search error: %s\n", key1, key2, snd_strerror(ret));
+	ret = snd_config_get_bool(cfg);
+	if (ret < 0)
+		ksft_exit_fail_msg("key '%s'.'%s' is not an bool\n", key1, key2);
+	return !!ret;
+}
diff --git a/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf b/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
new file mode 100644
index 000000000000..0a83f35d43eb
--- /dev/null
+++ b/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
@@ -0,0 +1,76 @@
+#
+# Example configuration for Lenovo ThinkPad P1 Gen2
+#
+
+#
+# Use regex match for the string read from the given sysfs path
+#
+# The sysfs root directory (/sys) is hardwired in the test code
+# (may be changed on demand).
+#
+# All strings must match.
+#
+sysfs [
+	{
+		path "class/dmi/id/product_sku"
+		regex "LENOVO_MT_20QU_BU_Think_FM_ThinkPad P1 Gen 2"
+	}
+]
+
+card.hda {
+	#
+	# Use regex match for the /sys/class/sound/card*/ tree (relative)
+	#
+	sysfs [
+		{
+			path "device/subsystem_device"
+			regex "0x229e"
+		}
+		{
+			path "device/subsystem_vendor"
+			regex "0x17aa"
+		}
+	]
+
+	#
+	# PCM configuration
+	#
+	# pcm.0.0 - device 0 subdevice 0
+	#
+	pcm.0.0 {
+		PLAYBACK {
+			test.time1 {
+				access RW_INTERLEAVED	# can be omitted - default
+				format S16_LE		# can be omitted - default
+				rate 48000		# can be omitted - default
+				channels 2		# can be omitted - default
+				period_size 512
+				buffer_size 4096
+			}
+			test.time2 {
+				access RW_INTERLEAVED
+				format S16_LE
+				rate 48000
+				channels 2
+				period_size 24000
+				buffer_size 192000
+			}
+		}
+		CAPTURE {
+			# use default tests, check for the presence
+		}
+	}
+	#
+	# uncomment to force the missing device checks
+	#
+	#pcm.0.2 {
+	#	PLAYBACK {
+	#		# check for the presence
+	#	}
+	#}
+	#pcm.0.3 {
+	#	CAPTURE {
+	#		# check for the presence
+	#	}
+	#}
+}
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
new file mode 100644
index 000000000000..2814d8f74f82
--- /dev/null
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -0,0 +1,523 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// kselftest for the ALSA PCM API
+//
+// Original author: Jaroslav Kysela <perex@perex.cz>
+// Copyright (c) 2022 Red Hat Inc.
+
+// This test will iterate over all cards detected in the system, exercising
+// every PCM device it can find.  This may conflict with other system
+// software if there is audio activity so is best run on a system with a
+// minimal active userspace.
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <assert.h>
+
+#include "../kselftest.h"
+#include "alsa-local.h"
+
+typedef struct timespec timestamp_t;
+
+struct pcm_data {
+	snd_pcm_t *handle;
+	int card;
+	int device;
+	int subdevice;
+	snd_pcm_stream_t stream;
+	snd_config_t *pcm_config;
+	struct pcm_data *next;
+};
+
+static const char *alsa_config =
+"ctl.hw {\n"
+"	@args [ CARD ]\n"
+"	@args.CARD.type string\n"
+"	type hw\n"
+"	card $CARD\n"
+"}\n"
+"pcm.hw {\n"
+"	@args [ CARD DEV SUBDEV ]\n"
+"	@args.CARD.type string\n"
+"	@args.DEV.type integer\n"
+"	@args.SUBDEV.type integer\n"
+"	type hw\n"
+"	card $CARD\n"
+"	device $DEV\n"
+"	subdevice $SUBDEV\n"
+"}\n"
+
+;
+
+int num_pcms = 0;
+struct pcm_data *pcm_list = NULL;
+
+int num_missing = 0;
+struct pcm_data *pcm_missing = NULL;
+
+void timestamp_now(timestamp_t *tstamp)
+{
+	if (clock_gettime(CLOCK_MONOTONIC_RAW, tstamp))
+		ksft_exit_fail_msg("clock_get_time\n");
+}
+
+long long timestamp_diff_ms(timestamp_t *tstamp)
+{
+	timestamp_t now, diff;
+	timestamp_now(&now);
+	if (tstamp->tv_nsec > now.tv_nsec) {
+		diff.tv_sec = now.tv_sec - tstamp->tv_sec - 1;
+		diff.tv_nsec = (now.tv_nsec + 1000000000L) - tstamp->tv_nsec;
+	} else {
+		diff.tv_sec = now.tv_sec - tstamp->tv_sec;
+		diff.tv_nsec = now.tv_nsec - tstamp->tv_nsec;
+	}
+	return (diff.tv_sec * 1000) + ((diff.tv_nsec + 500000L) / 1000000L);
+}
+
+#ifdef SND_LIB_VER
+#if SND_LIB_VERSION >= SND_LIB_VER(1, 2, 6)
+#define LIB_HAS_LOAD_STRING
+#endif
+#endif
+
+#ifndef LIB_HAS_LOAD_STRING
+static int snd_config_load_string(snd_config_t **config, const char *s,
+				  size_t size)
+{
+	snd_input_t *input;
+	snd_config_t *dst;
+	int err;
+
+	assert(config && s);
+	if (size == 0)
+		size = strlen(s);
+	err = snd_input_buffer_open(&input, s, size);
+	if (err < 0)
+		return err;
+	err = snd_config_top(&dst);
+	if (err < 0) {
+		snd_input_close(input);
+		return err;
+	}
+	err = snd_config_load(dst, input);
+	snd_input_close(input);
+	if (err < 0) {
+		snd_config_delete(dst);
+		return err;
+	}
+	*config = dst;
+	return 0;
+}
+#endif
+
+static snd_config_t *get_alsalib_config(void)
+{
+	snd_config_t *config;
+	int err;
+
+	err = snd_config_load_string(&config, alsa_config, strlen(alsa_config));
+	if (err < 0) {
+		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
+			       snd_strerror(err));
+		ksft_exit_fail();
+	}
+	return config;
+}
+
+static long device_from_id(snd_config_t *node)
+{
+	const char *id;
+	char *end;
+	long v;
+
+	if (snd_config_get_id(node, &id))
+		ksft_exit_fail_msg("snd_config_get_id\n");
+	errno = 0;
+	v = strtol(id, &end, 10);
+	if (errno || *end)
+		return -1;
+	return v;
+}
+
+static void missing_device(int card, int device, int subdevice, snd_pcm_stream_t stream)
+{
+	struct pcm_data *pcm_data;
+
+	for (pcm_data = pcm_list; pcm_data != NULL; pcm_data = pcm_data->next) {
+		if (pcm_data->card != card)
+			continue;
+		if (pcm_data->device != device)
+			continue;
+		if (pcm_data->subdevice != subdevice)
+			continue;
+		if (pcm_data->stream != stream)
+			continue;
+		return;
+	}
+	pcm_data = calloc(1, sizeof(*pcm_data));
+	if (!pcm_data)
+		ksft_exit_fail_msg("Out of memory\n");
+	pcm_data->card = card;
+	pcm_data->device = device;
+	pcm_data->subdevice = subdevice;
+	pcm_data->stream = stream;
+	pcm_data->next = pcm_missing;
+	pcm_missing = pcm_data;
+	num_missing++;
+}
+
+static void missing_devices(int card, snd_config_t *card_config)
+{
+	snd_config_t *pcm_config, *node1, *node2;
+	snd_config_iterator_t i1, i2, next1, next2;
+	int device, subdevice;
+
+	pcm_config = conf_get_subtree(card_config, "pcm", NULL);
+	if (!pcm_config)
+		return;
+	snd_config_for_each(i1, next1, pcm_config) {
+		node1 = snd_config_iterator_entry(i1);
+		device = device_from_id(node1);
+		if (device < 0)
+			continue;
+		if (snd_config_get_type(node1) != SND_CONFIG_TYPE_COMPOUND)
+			continue;
+		snd_config_for_each(i2, next2, node1) {
+			node2 = snd_config_iterator_entry(i2);
+			subdevice = device_from_id(node2);
+			if (subdevice < 0)
+				continue;
+			if (conf_get_subtree(node2, "PLAYBACK", NULL))
+				missing_device(card, device, subdevice, SND_PCM_STREAM_PLAYBACK);
+			if (conf_get_subtree(node2, "CAPTURE", NULL))
+				missing_device(card, device, subdevice, SND_PCM_STREAM_CAPTURE);
+		}
+	}
+}
+
+static void find_pcms(void)
+{
+	char name[32], key[64];
+	int card, dev, subdev, count, direction, err;
+	snd_pcm_stream_t stream;
+	struct pcm_data *pcm_data;
+	snd_ctl_t *handle;
+	snd_pcm_info_t *pcm_info;
+	snd_config_t *config, *card_config, *pcm_config;
+
+	snd_pcm_info_alloca(&pcm_info);
+
+	card = -1;
+	if (snd_card_next(&card) < 0 || card < 0)
+		return;
+
+	config = get_alsalib_config();
+
+	while (card >= 0) {
+		sprintf(name, "hw:%d", card);
+
+		err = snd_ctl_open_lconf(&handle, name, 0, config);
+		if (err < 0) {
+			ksft_print_msg("Failed to get hctl for card %d: %s\n",
+				       card, snd_strerror(err));
+			goto next_card;
+		}
+
+		card_config = conf_by_card(card);
+
+		dev = -1;
+		while (1) {
+			if (snd_ctl_pcm_next_device(handle, &dev) < 0)
+				ksft_exit_fail_msg("snd_ctl_pcm_next_device\n");
+			if (dev < 0)
+				break;
+
+			for (direction = 0; direction < 2; direction++) {
+				stream = direction ? SND_PCM_STREAM_CAPTURE : SND_PCM_STREAM_PLAYBACK;
+				sprintf(key, "pcm.%d.%s", dev, snd_pcm_stream_name(stream));
+				pcm_config = conf_get_subtree(card_config, key, NULL);
+				if (conf_get_bool(card_config, key, "skip", false)) {
+					ksft_print_msg("skipping pcm %d.%d.%s\n", card, dev, snd_pcm_stream_name(stream));
+					continue;
+				}
+				snd_pcm_info_set_device(pcm_info, dev);
+				snd_pcm_info_set_subdevice(pcm_info, 0);
+				snd_pcm_info_set_stream(pcm_info, stream);
+				err = snd_ctl_pcm_info(handle, pcm_info);
+				if (err == -ENOENT)
+					continue;
+				if (err < 0)
+					ksft_exit_fail_msg("snd_ctl_pcm_info: %d:%d:%d\n",
+							   dev, 0, stream);
+				count = snd_pcm_info_get_subdevices_count(pcm_info);
+				for (subdev = 0; subdev < count; subdev++) {
+					sprintf(key, "pcm.%d.%d.%s", dev, subdev, snd_pcm_stream_name(stream));
+					if (conf_get_bool(card_config, key, "skip", false)) {
+						ksft_print_msg("skipping pcm %d.%d.%d.%s\n", card, dev,
+							       subdev, snd_pcm_stream_name(stream));
+						continue;
+					}
+					pcm_data = calloc(1, sizeof(*pcm_data));
+					if (!pcm_data)
+						ksft_exit_fail_msg("Out of memory\n");
+					pcm_data->card = card;
+					pcm_data->device = dev;
+					pcm_data->subdevice = subdev;
+					pcm_data->stream = stream;
+					pcm_data->pcm_config = conf_get_subtree(card_config, key, NULL);
+					pcm_data->next = pcm_list;
+					pcm_list = pcm_data;
+					num_pcms++;
+				}
+			}
+		}
+
+		/* check for missing devices */
+		missing_devices(card, card_config);
+
+	next_card:
+		snd_ctl_close(handle);
+		if (snd_card_next(&card) < 0) {
+			ksft_print_msg("snd_card_next");
+			break;
+		}
+	}
+
+	snd_config_delete(config);
+}
+
+static void test_pcm_time1(struct pcm_data *data,
+			   const char *cfg_prefix, const char *sformat,
+			   long srate, long schannels,
+			   long speriod_size, long sbuffer_size)
+{
+	char name[64], key[128], msg[256];
+	const char *cs;
+	int i, err;
+	snd_pcm_t *handle = NULL;
+	snd_pcm_access_t access = SND_PCM_ACCESS_RW_INTERLEAVED;
+	snd_pcm_format_t format;
+	unsigned char *samples = NULL;
+	snd_pcm_sframes_t frames;
+	long long ms;
+	long rate, channels, period_size, buffer_size;
+	unsigned int rrate;
+	snd_pcm_uframes_t rperiod_size, rbuffer_size, start_threshold;
+	timestamp_t tstamp;
+	bool pass = false, automatic = true;
+	snd_pcm_hw_params_t *hw_params;
+	snd_pcm_sw_params_t *sw_params;
+
+	snd_pcm_hw_params_alloca(&hw_params);
+	snd_pcm_sw_params_alloca(&sw_params);
+
+	cs = conf_get_string(data->pcm_config, cfg_prefix, "format", sformat);
+	format = snd_pcm_format_value(cs);
+	if (format == SND_PCM_FORMAT_UNKNOWN)
+		ksft_exit_fail_msg("Wrong format '%s'\n", cs);
+	rate = conf_get_long(data->pcm_config, cfg_prefix, "rate", srate);
+	channels = conf_get_long(data->pcm_config, cfg_prefix, "channels", schannels);
+	period_size = conf_get_long(data->pcm_config, cfg_prefix, "period_size", speriod_size);
+	buffer_size = conf_get_long(data->pcm_config, cfg_prefix, "buffer_size", sbuffer_size);
+
+	automatic = strcmp(sformat, snd_pcm_format_name(format)) == 0 &&
+			srate == rate &&
+			schannels == channels &&
+			speriod_size == period_size &&
+			sbuffer_size == buffer_size;
+
+	samples = malloc((rate * channels * snd_pcm_format_physical_width(format)) / 8);
+	if (!samples)
+		ksft_exit_fail_msg("Out of memory\n");
+	snd_pcm_format_set_silence(format, samples, rate * channels);
+
+	sprintf(name, "hw:%d,%d,%d", data->card, data->device, data->subdevice);
+	err = snd_pcm_open(&handle, name, data->stream, 0);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "Failed to get pcm handle: %s", snd_strerror(err));
+		goto __close;
+	}
+
+	err = snd_pcm_hw_params_any(handle, hw_params);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_any: %s", snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_hw_params_set_rate_resample(handle, hw_params, 0);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_rate_resample: %s", snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_hw_params_set_access(handle, hw_params, access);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_access %s: %s",
+					   snd_pcm_access_name(access), snd_strerror(err));
+		goto __close;
+	}
+__format:
+	err = snd_pcm_hw_params_set_format(handle, hw_params, format);
+	if (err < 0) {
+		if (automatic && format == SND_PCM_FORMAT_S16_LE) {
+			format = SND_PCM_FORMAT_S32_LE;
+			ksft_print_msg("%s.%d.%d.%d.%s.%s format S16_LE -> S32_LE\n",
+					 cfg_prefix,
+					 data->card, data->device, data->subdevice,
+					 snd_pcm_stream_name(data->stream),
+					 snd_pcm_access_name(access));
+		}
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_format %s: %s",
+					   snd_pcm_format_name(format), snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_hw_params_set_channels(handle, hw_params, channels);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_channels %ld: %s", channels, snd_strerror(err));
+		goto __close;
+	}
+	rrate = rate;
+	err = snd_pcm_hw_params_set_rate_near(handle, hw_params, &rrate, 0);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_rate %ld: %s", rate, snd_strerror(err));
+		goto __close;
+	}
+	if (rrate != rate) {
+		snprintf(msg, sizeof(msg), "rate mismatch %ld != %ld", rate, rrate);
+		goto __close;
+	}
+	rperiod_size = period_size;
+	err = snd_pcm_hw_params_set_period_size_near(handle, hw_params, &rperiod_size, 0);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_period_size %ld: %s", period_size, snd_strerror(err));
+		goto __close;
+	}
+	rbuffer_size = buffer_size;
+	err = snd_pcm_hw_params_set_buffer_size_near(handle, hw_params, &rbuffer_size);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_buffer_size %ld: %s", buffer_size, snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_hw_params(handle, hw_params);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_hw_params: %s", snd_strerror(err));
+		goto __close;
+	}
+
+	err = snd_pcm_sw_params_current(handle, sw_params);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_sw_params_current: %s", snd_strerror(err));
+		goto __close;
+	}
+	if (data->stream == SND_PCM_STREAM_PLAYBACK) {
+		start_threshold = (rbuffer_size / rperiod_size) * rperiod_size;
+	} else {
+		start_threshold = rperiod_size;
+	}
+	err = snd_pcm_sw_params_set_start_threshold(handle, sw_params, start_threshold);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_sw_params_set_start_threshold %ld: %s", (long)start_threshold, snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_sw_params_set_avail_min(handle, sw_params, rperiod_size);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_sw_params_set_avail_min %ld: %s", (long)rperiod_size, snd_strerror(err));
+		goto __close;
+	}
+	err = snd_pcm_sw_params(handle, sw_params);
+	if (err < 0) {
+		snprintf(msg, sizeof(msg), "snd_pcm_sw_params: %s", snd_strerror(err));
+		goto __close;
+	}
+
+	ksft_print_msg("%s.%d.%d.%d.%s hw_params.%s.%s.%ld.%ld.%ld.%ld sw_params.%ld\n",
+			 cfg_prefix,
+			 data->card, data->device, data->subdevice,
+			 snd_pcm_stream_name(data->stream),
+			 snd_pcm_access_name(access),
+			 snd_pcm_format_name(format),
+			 (long)rate, (long)channels,
+			 (long)rperiod_size, (long)rbuffer_size,
+			 (long)start_threshold);
+
+	timestamp_now(&tstamp);
+	for (i = 0; i < 4; i++) {
+		if (data->stream == SND_PCM_STREAM_PLAYBACK) {
+			frames = snd_pcm_writei(handle, samples, rate);
+			if (frames < 0) {
+				snprintf(msg, sizeof(msg),
+					 "Write failed: expected %d, wrote %li", rate, frames);
+				goto __close;
+			}
+			if (frames < rate) {
+				snprintf(msg, sizeof(msg),
+					 "expected %d, wrote %li", rate, frames);
+				goto __close;
+			}
+		} else {
+			frames = snd_pcm_readi(handle, samples, rate);
+			if (frames < 0) {
+				snprintf(msg, sizeof(msg),
+					 "expected %d, wrote %li", rate, frames);
+				goto __close;
+			}
+			if (frames < rate) {
+				snprintf(msg, sizeof(msg),
+					 "expected %d, wrote %li", rate, frames);
+				goto __close;
+			}
+		}
+	}
+
+	snd_pcm_drain(handle);
+	ms = timestamp_diff_ms(&tstamp);
+	if (ms < 3900 || ms > 4100) {
+		snprintf(msg, sizeof(msg), "time mismatch: expected 4000ms got %lld", ms);
+		goto __close;
+	}
+
+	msg[0] = '\0';
+	pass = true;
+__close:
+	ksft_test_result(pass, "%s.%d.%d.%d.%s%s%s\n",
+			 cfg_prefix,
+			 data->card, data->device, data->subdevice,
+			 snd_pcm_stream_name(data->stream),
+			 msg[0] ? " " : "", msg);
+	free(samples);
+	if (handle)
+		snd_pcm_close(handle);
+}
+
+#define TESTS_PER_PCM 2
+
+int main(void)
+{
+	struct pcm_data *pcm;
+
+	ksft_print_header();
+
+	conf_load();
+
+	find_pcms();
+
+	ksft_set_plan(num_missing + num_pcms * TESTS_PER_PCM);
+
+	for (pcm = pcm_missing; pcm != NULL; pcm = pcm->next) {
+		ksft_test_result(false, "test.missing.%d.%d.%d.%s\n",
+				 pcm->card, pcm->device, pcm->subdevice,
+				 snd_pcm_stream_name(pcm->stream));
+	}
+
+	for (pcm = pcm_list; pcm != NULL; pcm = pcm->next) {
+		test_pcm_time1(pcm, "test.time1", "S16_LE", 48000, 2, 512, 4096);
+		test_pcm_time1(pcm, "test.time2", "S16_LE", 48000, 2, 24000, 192000);
+	}
+
+	conf_free();
+
+	ksft_exit_pass();
+
+	return 0;
+}
-- 
2.35.3
