Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB7163BC33
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 09:54:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7D6164F;
	Tue, 29 Nov 2022 09:53:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7D6164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669712065;
	bh=OXJHGABVUryCsc0cQCu1OJiE8wYMy8xGVZqgKccRz10=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ipyU3qVMWTr+LLLHYAAhspVHGcohwdNH3beFnE9O5fG9iZhrAI6sB6LFQhT0KW7JJ
	 cYiv2kGz/kBdJjJGE4FwcHuv9k3u4UBdqyDVQtWZ58KDibKWH7aAkADwBaiNYoiN+S
	 NDnoO1h8BDLt7qPkJdYCoSR+zxHQU65RAPzu3bb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBD1F80137;
	Tue, 29 Nov 2022 09:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADBC3F801F7; Tue, 29 Nov 2022 09:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74A75F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 09:53:16 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B8315A003F;
 Tue, 29 Nov 2022 09:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B8315A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1669711995; bh=ZuqTF/kXfHsbw0RNdeSEEjlfrwG1HBuYOcJUr8ozmoA=;
 h=From:To:Cc:Subject:Date:From;
 b=TUUoj/v8diqQRVMVro47GIJ+3Li0ah1ewNuG3GglLIOJyTVgTj6hZwzwzCdqYtchy
 i1n5YYCYVfTrSBzTqtfghK7GvUTFKz2zrVF50nW+IY7uUNpOwsWcupMPWpmDLw7j+6
 lNkJjXDCxINFdmwoPs7vY5PT4iXbaX/rBcoVAN+E=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Nov 2022 09:53:09 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] selftests: alsa - move shared library configuration code to
 conf.c
Date: Tue, 29 Nov 2022 09:53:06 +0100
Message-Id: <20221129085306.2345763-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
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

The minimal alsa-lib configuration code is similar in both mixer
and pcm tests. Move this code to the shared conf.c source file.

Also, fix the build rules inspired by rseq tests. Build libatest.so
which is linked to the both test utilities dynamically.

Also, set the TEST_FILES variable for lib.mk.

Cc: linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 tools/testing/selftests/alsa/Makefile     | 13 ++++-
 tools/testing/selftests/alsa/alsa-local.h |  2 +
 tools/testing/selftests/alsa/conf.c       | 69 ++++++++++++++++++++++
 tools/testing/selftests/alsa/mixer-test.c | 53 +----------------
 tools/testing/selftests/alsa/pcm-test.c   | 70 -----------------------
 5 files changed, 85 insertions(+), 122 deletions(-)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index 8ac22d2eb2ba..a8c0383878d3 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -6,9 +6,20 @@ LDLIBS += $(shell pkg-config --libs alsa)
 ifeq ($(LDLIBS),)
 LDLIBS += -lasound
 endif
+CFLAGS += -L$(OUTPUT) -Wl,-rpath=./
+
+OVERRIDE_TARGETS = 1
 
 TEST_GEN_PROGS := mixer-test pcm-test
 
-pcm-test: pcm-test.c conf.c
+TEST_GEN_PROGS_EXTENDED := libatest.so
+
+TEST_FILES := conf.d
 
 include ../lib.mk
+
+$(OUTPUT)/libatest.so: conf.c alsa-local.h
+	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
+
+$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) alsa-local.h
+	$(CC) $(CFLAGS) $< $(LDLIBS) -latest -o $@
diff --git a/tools/testing/selftests/alsa/alsa-local.h b/tools/testing/selftests/alsa/alsa-local.h
index fd0771ac600d..65f197ea9773 100644
--- a/tools/testing/selftests/alsa/alsa-local.h
+++ b/tools/testing/selftests/alsa/alsa-local.h
@@ -10,6 +10,8 @@
 
 #include <alsa/asoundlib.h>
 
+snd_config_t *get_alsalib_config(void);
+
 void conf_load(void);
 void conf_free(void);
 snd_config_t *conf_by_card(int card);
diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
index dd6aa90deef9..c7ffc8f04195 100644
--- a/tools/testing/selftests/alsa/conf.c
+++ b/tools/testing/selftests/alsa/conf.c
@@ -28,6 +28,75 @@ struct card_data {
 
 static struct card_data *conf_cards;
 
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
+;
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
+snd_config_t *get_alsalib_config(void)
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
 static struct card_data *conf_data_by_card(int card, bool msg)
 {
 	struct card_data *conf;
diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index a38b89c28030..05f1749ae19d 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -26,6 +26,7 @@
 #include <stdint.h>
 
 #include "../kselftest.h"
+#include "alsa-local.h"
 
 #define TESTS_PER_CONTROL 7
 
@@ -50,56 +51,11 @@ struct ctl_data {
 	struct ctl_data *next;
 };
 
-static const char *alsa_config =
-"ctl.hw {\n"
-"	@args [ CARD ]\n"
-"	@args.CARD.type string\n"
-"	type hw\n"
-"	card $CARD\n"
-"}\n"
-;
-
 int num_cards = 0;
 int num_controls = 0;
 struct card_data *card_list = NULL;
 struct ctl_data *ctl_list = NULL;
 
-#ifdef SND_LIB_VER
-#if SND_LIB_VERSION >= SND_LIB_VER(1, 2, 6)
-#define LIB_HAS_LOAD_STRING
-#endif
-#endif
-
-#ifndef LIB_HAS_LOAD_STRING
-static int snd_config_load_string(snd_config_t **config, const char *s,
-				  size_t size)
-{
-	snd_input_t *input;
-	snd_config_t *dst;
-	int err;
-
-	assert(config && s);
-	if (size == 0)
-		size = strlen(s);
-	err = snd_input_buffer_open(&input, s, size);
-	if (err < 0)
-		return err;
-	err = snd_config_top(&dst);
-	if (err < 0) {
-		snd_input_close(input);
-		return err;
-	}
-	err = snd_config_load(dst, input);
-	snd_input_close(input);
-	if (err < 0) {
-		snd_config_delete(dst);
-		return err;
-	}
-	*config = dst;
-	return 0;
-}
-#endif
-
 static void find_controls(void)
 {
 	char name[32];
@@ -112,12 +68,7 @@ static void find_controls(void)
 	if (snd_card_next(&card) < 0 || card < 0)
 		return;
 
-	err = snd_config_load_string(&config, alsa_config, strlen(alsa_config));
-	if (err < 0) {
-		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
-			       snd_strerror(err));
-		ksft_exit_fail();
-	}
+	config = get_alsalib_config();
 
 	while (card >= 0) {
 		sprintf(name, "hw:%d", card);
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 2814d8f74f82..6e7dfc395b98 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -31,26 +31,6 @@ struct pcm_data {
 	struct pcm_data *next;
 };
 
-static const char *alsa_config =
-"ctl.hw {\n"
-"	@args [ CARD ]\n"
-"	@args.CARD.type string\n"
-"	type hw\n"
-"	card $CARD\n"
-"}\n"
-"pcm.hw {\n"
-"	@args [ CARD DEV SUBDEV ]\n"
-"	@args.CARD.type string\n"
-"	@args.DEV.type integer\n"
-"	@args.SUBDEV.type integer\n"
-"	type hw\n"
-"	card $CARD\n"
-"	device $DEV\n"
-"	subdevice $SUBDEV\n"
-"}\n"
-
-;
-
 int num_pcms = 0;
 struct pcm_data *pcm_list = NULL;
 
@@ -77,56 +57,6 @@ long long timestamp_diff_ms(timestamp_t *tstamp)
 	return (diff.tv_sec * 1000) + ((diff.tv_nsec + 500000L) / 1000000L);
 }
 
-#ifdef SND_LIB_VER
-#if SND_LIB_VERSION >= SND_LIB_VER(1, 2, 6)
-#define LIB_HAS_LOAD_STRING
-#endif
-#endif
-
-#ifndef LIB_HAS_LOAD_STRING
-static int snd_config_load_string(snd_config_t **config, const char *s,
-				  size_t size)
-{
-	snd_input_t *input;
-	snd_config_t *dst;
-	int err;
-
-	assert(config && s);
-	if (size == 0)
-		size = strlen(s);
-	err = snd_input_buffer_open(&input, s, size);
-	if (err < 0)
-		return err;
-	err = snd_config_top(&dst);
-	if (err < 0) {
-		snd_input_close(input);
-		return err;
-	}
-	err = snd_config_load(dst, input);
-	snd_input_close(input);
-	if (err < 0) {
-		snd_config_delete(dst);
-		return err;
-	}
-	*config = dst;
-	return 0;
-}
-#endif
-
-static snd_config_t *get_alsalib_config(void)
-{
-	snd_config_t *config;
-	int err;
-
-	err = snd_config_load_string(&config, alsa_config, strlen(alsa_config));
-	if (err < 0) {
-		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
-			       snd_strerror(err));
-		ksft_exit_fail();
-	}
-	return config;
-}
-
 static long device_from_id(snd_config_t *node)
 {
 	const char *id;
-- 
2.35.3
