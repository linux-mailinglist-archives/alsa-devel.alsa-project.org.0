Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3449B893
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 17:29:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987BE1FE9;
	Tue, 25 Jan 2022 17:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987BE1FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643128192;
	bh=qqGMcYD15tOZUPxYPYVlBPdHrM8w4yH5kXBYa9U5Rr0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gP7/X/3JqQieQr7z9ddeAHJNyuut5nZ7agszKCzuHUEse4tvY3T+NROm91kMYa2En
	 S+vwDwoSIoU65qRG7HJ0Tp9o3FS0TI49gyC5PRA3F+Aop/gwwZSDJ5H63BHG3JNGC+
	 uOwVQ6bHgHHMQWmTRzpUU784d2sRMnOH5NWNGjdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC542F80161;
	Tue, 25 Jan 2022 17:28:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D312FF804C3; Tue, 25 Jan 2022 17:28:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C283F80161
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 17:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C283F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eWrEwxN+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB1F61721;
 Tue, 25 Jan 2022 16:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6314C340E6;
 Tue, 25 Jan 2022 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643128113;
 bh=qqGMcYD15tOZUPxYPYVlBPdHrM8w4yH5kXBYa9U5Rr0=;
 h=From:To:Cc:Subject:Date:From;
 b=eWrEwxN+lMv6kUR/NAt+msNotqhthwRq+KX2DJszaTLrxS0ky0Q8JdF853wVXyIH3
 j4r/Imqy9UrKp+1u9R11ClXTnqH+ihVkFU6FXilO4xQwZyeSvWzjmvj/RgKrtMF9cu
 x+vge9U2a/7GKk89y+ALIOuizleONcdToQxm0oXfKtPcWFlh+E7SStvSbkH6PDQLC5
 owa44HvpSVzg2mH7YMnBO3anwqaYcJS+y9+HjN3qGaSnD8i6TP8NqbzywJTOX4AZYs
 0xkjF1jzkJ/pUlDpF04xA3TpK5/Te95o/DrCutIWvQ4ja9cCQfAeeSYvXHdKiDnNBr
 qS9StThrqBFfw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2] kselftest: alsa: Add test case for writing invalid values
Date: Tue, 25 Jan 2022 16:28:24 +0000
Message-Id: <20220125162824.3816659-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7599; h=from:subject;
 bh=qqGMcYD15tOZUPxYPYVlBPdHrM8w4yH5kXBYa9U5Rr0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh8CS02EHLhbrO005cM9UxiRd6EIRKIOGphtN9/4cA
 zMeTfEiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfAktAAKCRAk1otyXVSH0C58CA
 CFQh7lxci5KvmQ7HvNlzVRC04KS/lnmZ5YFfkS0x+nh83i8G6Z0FH1XAL00FtDKcWT7xj2HCb4lmgq
 E5PsJvXZr6SHlcBlFBKZhyI+GbMh1uNrbTZU/1JAHDqhmC6nQZdq1WYLugutolcmhVzfKxJq6jiqQQ
 LKEbr17sV7H5H+ummuL4+RUv7ZepjNLOSmmJCg5oJD36TWY17Rdd34nG3b69vM5pHXulOsN0bTYZbh
 pXyn8/zLpN2ZLxzxrYuO7/XCwsvbqey4z8rBjnWbm+MEzyVwRBlvoYoHWe94VOavpR3NNJFg/1BRNh
 F8V7ptFwDB9ManjH0XLJU2D6BZesvj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
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

Attempt to write various invalid values for control types we know about and
check that something sensible happens. The ABI isn't quite as clearly
defined as one might like, rather than generating an error when an invalid
value is written many devices will silently rewrite the value into one that
is valid for the control. The exact value chosen is not predictable so in
the case the write succeeds we just check that the value we read back is
one that is valid for the control.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---

v2:
 - Fix a couple of _integer()/_integer64() confusions.

 tools/testing/selftests/alsa/mixer-test.c | 222 +++++++++++++++++++++-
 1 file changed, 221 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 17f158d7a767..0e88f4f3d802 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -13,6 +13,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
+#include <limits.h>
 #include <string.h>
 #include <getopt.h>
 #include <stdarg.h>
@@ -26,7 +27,7 @@
 
 #include "../kselftest.h"
 
-#define TESTS_PER_CONTROL 3
+#define TESTS_PER_CONTROL 4
 
 struct card_data {
 	snd_ctl_t *handle;
@@ -679,6 +680,224 @@ void test_ctl_write_valid(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
+bool test_ctl_write_invalid_value(struct ctl_data *ctl,
+				  snd_ctl_elem_value_t *val)
+{
+	int err;
+	long val_read;
+
+	/* Ideally this will fail... */
+	err = snd_ctl_elem_write(ctl->card->handle, val);
+	if (err < 0)
+		return false;
+
+	/* ...but some devices will clamp to an in range value */
+	err = snd_ctl_elem_read(ctl->card->handle, val);
+	if (err < 0) {
+		ksft_print_msg("%s failed to read: %s\n",
+			       ctl->name, snd_strerror(err));
+		return true;
+	}
+
+	return !ctl_value_valid(ctl, val);
+}
+
+bool test_ctl_write_invalid_boolean(struct ctl_data *ctl)
+{
+	int err, i;
+	long val_read;
+	bool fail = false;
+	snd_ctl_elem_value_t *val;
+	snd_ctl_elem_value_alloca(&val);
+
+	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
+		snd_ctl_elem_value_copy(val, ctl->def_val);
+		snd_ctl_elem_value_set_boolean(val, i, 2);
+
+		if (test_ctl_write_invalid_value(ctl, val))
+			fail = true;
+	}
+
+	return !fail;
+}
+
+bool test_ctl_write_invalid_integer(struct ctl_data *ctl)
+{
+	int i;
+	bool fail = false;
+	snd_ctl_elem_value_t *val;
+	snd_ctl_elem_value_alloca(&val);
+
+	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
+		if (snd_ctl_elem_info_get_min(ctl->info) != LONG_MIN) {
+			/* Just under range */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer(val, i,
+			       snd_ctl_elem_info_get_min(ctl->info) - 1);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+
+			/* Minimum representable value */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer(val, i, LONG_MIN);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+		}
+
+		if (snd_ctl_elem_info_get_max(ctl->info) != LONG_MAX) {
+			/* Just over range */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer(val, i,
+			       snd_ctl_elem_info_get_max(ctl->info) + 1);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+
+			/* Maximum representable value */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer(val, i, LONG_MAX);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+		}
+	}
+
+	return !fail;
+}
+
+bool test_ctl_write_invalid_integer64(struct ctl_data *ctl)
+{
+	int i;
+	bool fail = false;
+	snd_ctl_elem_value_t *val;
+	snd_ctl_elem_value_alloca(&val);
+
+	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
+		if (snd_ctl_elem_info_get_min64(ctl->info) != LLONG_MIN) {
+			/* Just under range */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer64(val, i,
+				snd_ctl_elem_info_get_min64(ctl->info) - 1);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+
+			/* Minimum representable value */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer64(val, i, LLONG_MIN);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+		}
+
+		if (snd_ctl_elem_info_get_max64(ctl->info) != LLONG_MAX) {
+			/* Just over range */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer64(val, i,
+				snd_ctl_elem_info_get_max64(ctl->info) + 1);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+
+			/* Maximum representable value */
+			snd_ctl_elem_value_copy(val, ctl->def_val);
+			snd_ctl_elem_value_set_integer64(val, i, LLONG_MAX);
+
+			if (test_ctl_write_invalid_value(ctl, val))
+				fail = true;
+		}
+	}
+
+	return !fail;
+}
+
+bool test_ctl_write_invalid_enumerated(struct ctl_data *ctl)
+{
+	int err, i;
+	unsigned int val_read;
+	bool fail = false;
+	snd_ctl_elem_value_t *val;
+	snd_ctl_elem_value_alloca(&val);
+
+	snd_ctl_elem_value_set_id(val, ctl->id);
+
+	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
+		/* One beyond maximum */
+		snd_ctl_elem_value_copy(val, ctl->def_val);
+		snd_ctl_elem_value_set_enumerated(val, i,
+				  snd_ctl_elem_info_get_items(ctl->info));
+
+		if (test_ctl_write_invalid_value(ctl, val))
+			fail = true;
+
+		/* Maximum representable value */
+		snd_ctl_elem_value_copy(val, ctl->def_val);
+		snd_ctl_elem_value_set_enumerated(val, i, UINT_MAX);
+
+		if (test_ctl_write_invalid_value(ctl, val))
+			fail = true;
+
+	}
+
+	return !fail;
+}
+
+
+void test_ctl_write_invalid(struct ctl_data *ctl)
+{
+	bool pass;
+	int err;
+
+	/* If the control is turned off let's be polite */
+	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
+		ksft_print_msg("%s is inactive\n", ctl->name);
+		ksft_test_result_skip("write_invalid.%d.%d\n",
+				      ctl->card->card, ctl->elem);
+		return;
+	}
+
+	if (!snd_ctl_elem_info_is_writable(ctl->info)) {
+		ksft_print_msg("%s is not writeable\n", ctl->name);
+		ksft_test_result_skip("write_invalid.%d.%d\n",
+				      ctl->card->card, ctl->elem);
+		return;
+	}
+
+	switch (snd_ctl_elem_info_get_type(ctl->info)) {
+	case SND_CTL_ELEM_TYPE_BOOLEAN:
+		pass = test_ctl_write_invalid_boolean(ctl);
+		break;
+
+	case SND_CTL_ELEM_TYPE_INTEGER:
+		pass = test_ctl_write_invalid_integer(ctl);
+		break;
+
+	case SND_CTL_ELEM_TYPE_INTEGER64:
+		pass = test_ctl_write_invalid_integer64(ctl);
+		break;
+
+	case SND_CTL_ELEM_TYPE_ENUMERATED:
+		pass = test_ctl_write_invalid_enumerated(ctl);
+		break;
+
+	default:
+		/* No tests for this yet */
+		ksft_test_result_skip("write_invalid.%d.%d\n",
+				      ctl->card->card, ctl->elem);
+		return;
+	}
+
+	/* Restore the default value to minimise disruption */
+	err = write_and_verify(ctl, ctl->def_val, NULL);
+	if (err < 0)
+		pass = false;
+
+	ksft_test_result(pass, "write_invalid.%d.%d\n",
+			 ctl->card->card, ctl->elem);
+}
+
 int main(void)
 {
 	struct ctl_data *ctl;
@@ -697,6 +916,7 @@ int main(void)
 		test_ctl_get_value(ctl);
 		test_ctl_write_default(ctl);
 		test_ctl_write_valid(ctl);
+		test_ctl_write_invalid(ctl);
 	}
 
 	ksft_exit_pass();
-- 
2.30.2

