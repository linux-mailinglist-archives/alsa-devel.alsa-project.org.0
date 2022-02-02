Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D04A7448
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 16:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF68174A;
	Wed,  2 Feb 2022 16:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF68174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643814677;
	bh=S7cvBuUA7E92mwC6z6HrbYredDqrn9Nav7s0tks3JW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpOP/1GUgoao1uIi0L6VCM7Cac6VaVe20h5l1m53aK5Ki8i9PYjJmmht0NBcTL2Ie
	 uzd169CYYXl7FC+RgKknvuYHshlRP3yXzZGmPb5DuMiriHIpLYt4RxisPUZmDxfUAQ
	 P70Uc82tD05TWGGlmeWj0ky9GgP+mmKRzHMTILuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA390F804CA;
	Wed,  2 Feb 2022 16:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B52F80130; Wed,  2 Feb 2022 16:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13390F80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 16:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13390F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qum0W52C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F9EA6154F;
 Wed,  2 Feb 2022 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAFEC340EB;
 Wed,  2 Feb 2022 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643814562;
 bh=S7cvBuUA7E92mwC6z6HrbYredDqrn9Nav7s0tks3JW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qum0W52CXAyKZmLKbJGPEQw7yQT7uRckra3ogUSi27qOrm9iA6Lm9nDVsj/0q5Ebz
 TgouP7U+PlkM33Fcu8wBMD8UJ4pSxCNmifOR5HCKMb5UsCRormI+4wvSAhphVYOsCv
 MkuatE3x6I40ZoAkrImfio2B6/UAniiLdOnE6dvMfCO+8VSsHjNMGXw817xYxUa42E
 f4jcjBnCW6MQCGm86bL6B4C/KVZvcnfcNoz6iPpEZ3JEhkC630j2RlQ32+3UWC0js/
 Vw0TquwvjZW2/PuMrVl3WIjIKBHN94p+6XaT7ZvgDvXpeOcNod1GVHywXlaKqmHIST
 fi+BRR9GqUCWw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 2/2] kselftest: alsa: Declare most functions static
Date: Wed,  2 Feb 2022 15:09:02 +0000
Message-Id: <20220202150902.19563-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202150902.19563-1-broonie@kernel.org>
References: <20220202150902.19563-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7362; h=from:subject;
 bh=S7cvBuUA7E92mwC6z6HrbYredDqrn9Nav7s0tks3JW4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+p54d2FCbgYPVpYhArjxg/SQX6o8Lhuqcm+IuKiv
 SM+tWn2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqeeAAKCRAk1otyXVSH0LwMB/
 4heuGa2hUDlrJtfy/1/g0NUecT/g/CHW3B1E2DitxYmuqo7nYoXeKhmP+IBIc71MvgvfQe1IaUbvGx
 nE8/Yg6/OAY3x6e3LUDc5M8b6F9W6s7qfkO1pi1Ox36r+GeSj+t8ONZrBKUzb0xKGgfxmNRKAH/jhI
 Tq0PCdhkS4WBqwQXTFEdqovfaMC3sHbQ1ZJ4PcDt7OExxlLX54Qdwi7a5lx8mVm/ao0FzQRRVXErpU
 Z/YhaEQyHtmzUU4lfAusd5RYfSTZrktEMiQ0nd0KIOQjGXbmhlGtpT1oGF7d+bXcdtvdP3grRXrQsM
 EZtBWT+FKBSdcE8xIPV9vU8NGv3RU4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
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

This program has only one file so most functions can be static.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
---
 tools/testing/selftests/alsa/mixer-test.c | 58 ++++++++++++-----------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 6edb7dca32af..d0b788b8d287 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -71,7 +71,8 @@ struct ctl_data *ctl_list = NULL;
 #endif
 
 #ifndef LIB_HAS_LOAD_STRING
-int snd_config_load_string(snd_config_t **config, const char *s, size_t size)
+static int snd_config_load_string(snd_config_t **config, const char *s,
+				  size_t size)
 {
 	snd_input_t *input;
 	snd_config_t *dst;
@@ -99,7 +100,7 @@ int snd_config_load_string(snd_config_t **config, const char *s, size_t size)
 }
 #endif
 
-void find_controls(void)
+static void find_controls(void)
 {
 	char name[32];
 	int card, ctl, err;
@@ -222,7 +223,7 @@ void find_controls(void)
  * Block for up to timeout ms for an event, returns a negative value
  * on error, 0 for no event and 1 for an event.
  */
-int wait_for_event(struct ctl_data *ctl, int timeout)
+static int wait_for_event(struct ctl_data *ctl, int timeout)
 {
 	unsigned short revents;
 	snd_ctl_event_t *event;
@@ -291,8 +292,9 @@ int wait_for_event(struct ctl_data *ctl, int timeout)
 	return 1;
 }
 
-bool ctl_value_index_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val,
-			   int index)
+static bool ctl_value_index_valid(struct ctl_data *ctl,
+				  snd_ctl_elem_value_t *val,
+				  int index)
 {
 	long int_val;
 	long long int64_val;
@@ -403,7 +405,7 @@ bool ctl_value_index_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val,
  * Check that the provided value meets the constraints for the
  * provided control.
  */
-bool ctl_value_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val)
+static bool ctl_value_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val)
 {
 	int i;
 	bool valid = true;
@@ -419,7 +421,7 @@ bool ctl_value_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val)
  * Check that we can read the default value and it is valid. Write
  * tests use the read value to restore the default.
  */
-void test_ctl_get_value(struct ctl_data *ctl)
+static void test_ctl_get_value(struct ctl_data *ctl)
 {
 	int err;
 
@@ -454,9 +456,9 @@ void test_ctl_get_value(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
-bool show_mismatch(struct ctl_data *ctl, int index,
-		   snd_ctl_elem_value_t *read_val,
-		   snd_ctl_elem_value_t *expected_val)
+static bool show_mismatch(struct ctl_data *ctl, int index,
+			  snd_ctl_elem_value_t *read_val,
+			  snd_ctl_elem_value_t *expected_val)
 {
 	long long expected_int, read_int;
 
@@ -519,9 +521,9 @@ bool show_mismatch(struct ctl_data *ctl, int index,
  * the write to fail, for verifying that invalid writes don't corrupt
  * anything.
  */
-int write_and_verify(struct ctl_data *ctl,
-		     snd_ctl_elem_value_t *write_val,
-		     snd_ctl_elem_value_t *expected_val)
+static int write_and_verify(struct ctl_data *ctl,
+			    snd_ctl_elem_value_t *write_val,
+			    snd_ctl_elem_value_t *expected_val)
 {
 	int err, i;
 	bool error_expected, mismatch_shown;
@@ -628,7 +630,7 @@ int write_and_verify(struct ctl_data *ctl,
  * Make sure we can write the default value back to the control, this
  * should validate that at least some write works.
  */
-void test_ctl_write_default(struct ctl_data *ctl)
+static void test_ctl_write_default(struct ctl_data *ctl)
 {
 	int err;
 
@@ -661,7 +663,7 @@ void test_ctl_write_default(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
-bool test_ctl_write_valid_boolean(struct ctl_data *ctl)
+static bool test_ctl_write_valid_boolean(struct ctl_data *ctl)
 {
 	int err, i, j;
 	bool fail = false;
@@ -682,7 +684,7 @@ bool test_ctl_write_valid_boolean(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_valid_integer(struct ctl_data *ctl)
+static bool test_ctl_write_valid_integer(struct ctl_data *ctl)
 {
 	int err;
 	int i;
@@ -712,7 +714,7 @@ bool test_ctl_write_valid_integer(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_valid_integer64(struct ctl_data *ctl)
+static bool test_ctl_write_valid_integer64(struct ctl_data *ctl)
 {
 	int err, i;
 	long long j, step;
@@ -740,7 +742,7 @@ bool test_ctl_write_valid_integer64(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
+static bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
 {
 	int err, i, j;
 	bool fail = false;
@@ -761,7 +763,7 @@ bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
 	return !fail;
 }
 
-void test_ctl_write_valid(struct ctl_data *ctl)
+static void test_ctl_write_valid(struct ctl_data *ctl)
 {
 	bool pass;
 	int err;
@@ -814,8 +816,8 @@ void test_ctl_write_valid(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
-bool test_ctl_write_invalid_value(struct ctl_data *ctl,
-				  snd_ctl_elem_value_t *val)
+static bool test_ctl_write_invalid_value(struct ctl_data *ctl,
+					 snd_ctl_elem_value_t *val)
 {
 	int err;
 	long val_read;
@@ -836,7 +838,7 @@ bool test_ctl_write_invalid_value(struct ctl_data *ctl,
 	return !ctl_value_valid(ctl, val);
 }
 
-bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
+static bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
 {
 	int err, i;
 	long val_read;
@@ -855,7 +857,7 @@ bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_invalid_integer(struct ctl_data *ctl)
+static bool test_ctl_write_invalid_integer(struct ctl_data *ctl)
 {
 	int i;
 	bool fail = false;
@@ -901,7 +903,7 @@ bool test_ctl_write_invalid_integer(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
+static bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
 {
 	int i;
 	bool fail = false;
@@ -947,7 +949,7 @@ bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
 	return !fail;
 }
 
-bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
+static bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
 {
 	int err, i;
 	unsigned int val_read;
@@ -979,7 +981,7 @@ bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
 }
 
 
-void test_ctl_write_invalid(struct ctl_data *ctl)
+static void test_ctl_write_invalid(struct ctl_data *ctl)
 {
 	bool pass;
 	int err;
@@ -1032,13 +1034,13 @@ void test_ctl_write_invalid(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
-void test_ctl_event_missing(struct ctl_data *ctl)
+static void test_ctl_event_missing(struct ctl_data *ctl)
 {
 	ksft_test_result(!ctl->event_missing, "event_missing.%d.%d\n",
 			 ctl->card->card, ctl->elem);
 }
 
-void test_ctl_event_spurious(struct ctl_data *ctl)
+static void test_ctl_event_spurious(struct ctl_data *ctl)
 {
 	ksft_test_result(!ctl->event_spurious, "event_spurious.%d.%d\n",
 			 ctl->card->card, ctl->elem);
-- 
2.30.2

