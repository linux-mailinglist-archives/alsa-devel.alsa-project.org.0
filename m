Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABC7983D0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 10:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F811846;
	Fri,  8 Sep 2023 10:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F811846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694160831;
	bh=TaZYiiNAS++bYScMFUoh9OPynCtRgL+S5Gq9Lz8uuSI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Nyn/x+MAW9sVaEm+fAD4H2XVOCMGeeebafGdUjdMidPoIXfoYCgLobHb+sm2KUObG
	 5efz0lb12TtTDjM0xE8VYrKaB8/8eeA2ZecBjltFNdfFqMVxxlKXWZaQ9K4ugkq5qj
	 PioTiOEor1zicHg0zvQH05LlLMHpwUHswE3Cfpdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E375DF804F3; Fri,  8 Sep 2023 10:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54ACAF8047D;
	Fri,  8 Sep 2023 10:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E90BF80431; Fri,  8 Sep 2023 10:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com
 [111.22.67.151])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA3AF80431
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 10:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAA3AF80431
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee664fad700d13-2e456;
	Fri, 08 Sep 2023 16:10:41 +0800 (CST)
X-RM-TRANSID: 2ee664fad700d13-2e456
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.54.5.252])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee364fad6ff8a4-128ab;
	Fri, 08 Sep 2023 16:10:41 +0800 (CST)
X-RM-TRANSID: 2ee364fad6ff8a4-128ab
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	shuah@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: ALSA: remove unused variables
Date: Fri,  8 Sep 2023 16:10:40 +0800
Message-Id: <20230908081040.197243-1-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 47LVN532QLUVTQQJPO5CTFINI53DK23C
X-Message-ID-Hash: 47LVN532QLUVTQQJPO5CTFINI53DK23C
X-MailFrom: dingxiang@cmss.chinamobile.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47LVN532QLUVTQQJPO5CTFINI53DK23C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These variables are never referenced in the code, just remove them.

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 tools/testing/selftests/alsa/conf.c                |  1 -
 tools/testing/selftests/alsa/mixer-test.c          | 11 +++--------
 tools/testing/selftests/alsa/pcm-test.c            |  4 ++--
 tools/testing/selftests/alsa/test-pcmtest-driver.c |  1 -
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
index d7aafe5a1993..2f1685a3eae1 100644
--- a/tools/testing/selftests/alsa/conf.c
+++ b/tools/testing/selftests/alsa/conf.c
@@ -431,7 +431,6 @@ long conf_get_long(snd_config_t *root, const char *key1, const char *key2, long
 int conf_get_bool(snd_config_t *root, const char *key1, const char *key2, int def)
 {
 	snd_config_t *cfg;
-	long l;
 	int ret;
 
 	if (!root)
diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index c95d63e553f4..21e482b23f50 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -188,7 +188,7 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 {
 	unsigned short revents;
 	snd_ctl_event_t *event;
-	int count, err;
+	int err;
 	unsigned int mask = 0;
 	unsigned int ev_id;
 
@@ -430,7 +430,6 @@ static bool strend(const char *haystack, const char *needle)
 static void test_ctl_name(struct ctl_data *ctl)
 {
 	bool name_ok = true;
-	bool check;
 
 	ksft_print_msg("%d.%d %s\n", ctl->card->card, ctl->elem,
 		       ctl->name);
@@ -863,7 +862,6 @@ static bool test_ctl_write_invalid_value(struct ctl_data *ctl,
 					 snd_ctl_elem_value_t *val)
 {
 	int err;
-	long val_read;
 
 	/* Ideally this will fail... */
 	err = snd_ctl_elem_write(ctl->card->handle, val);
@@ -883,8 +881,7 @@ static bool test_ctl_write_invalid_value(struct ctl_data *ctl,
 
 static bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
 {
-	int err, i;
-	long val_read;
+	int i;
 	bool fail = false;
 	snd_ctl_elem_value_t *val;
 	snd_ctl_elem_value_alloca(&val);
@@ -994,8 +991,7 @@ static bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
 
 static bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
 {
-	int err, i;
-	unsigned int val_read;
+	int i;
 	bool fail = false;
 	snd_ctl_elem_value_t *val;
 	snd_ctl_elem_value_alloca(&val);
@@ -1027,7 +1023,6 @@ static bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
 static void test_ctl_write_invalid(struct ctl_data *ctl)
 {
 	bool pass;
-	int err;
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 2f5e3c462194..c0a39818c5a4 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -257,7 +257,7 @@ static void find_pcms(void)
 static void test_pcm_time(struct pcm_data *data, enum test_class class,
 			  const char *test_name, snd_config_t *pcm_cfg)
 {
-	char name[64], key[128], msg[256];
+	char name[64], msg[256];
 	const int duration_s = 2, margin_ms = 100;
 	const int duration_ms = duration_s * 1000;
 	const char *cs;
@@ -567,7 +567,7 @@ int main(void)
 {
 	struct card_data *card;
 	struct pcm_data *pcm;
-	snd_config_t *global_config, *cfg, *pcm_cfg;
+	snd_config_t *global_config, *cfg;
 	int num_pcm_tests = 0, num_tests, num_std_pcm_tests;
 	int ret;
 	void *thread_ret;
diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 357adc722cba..a52ecd43dbe3 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -313,7 +313,6 @@ TEST_F(pcmtest, ni_playback) {
  */
 TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_t *handle;
-	unsigned char *it;
 	int test_res;
 	struct pcmtest_test_params *params = &self->params;
 
-- 
2.38.1



