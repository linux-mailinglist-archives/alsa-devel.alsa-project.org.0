Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F1509EFA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 13:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837FF18B1;
	Thu, 21 Apr 2022 13:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837FF18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650541893;
	bh=2Qj24wHxJHGYnRy8/BlrM7tH3a9QjizVNtDyHG9KTL0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C6H54bdPCglzKw4KXyxz34duM8BKzWLw7JvxMB0/vPbORhKAQdVw4m9V+zVgU9D1E
	 5OdYWEz5lBlKFiBAIxwRFehCDxWDBTdSo+VfI5qCJdL8fdCDobPpjxirP2sgtSOo+Q
	 F94cMyLpytfd8SlNt28qABdYygkhUjvQngYVahD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F70F80125;
	Thu, 21 Apr 2022 13:50:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD36BF8032D; Thu, 21 Apr 2022 13:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C93F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 13:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C93F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q6Q6Rhri"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6C8A61BA3;
 Thu, 21 Apr 2022 11:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC75EC385A5;
 Thu, 21 Apr 2022 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650541825;
 bh=2Qj24wHxJHGYnRy8/BlrM7tH3a9QjizVNtDyHG9KTL0=;
 h=From:To:Cc:Subject:Date:From;
 b=Q6Q6RhriZNI88NZnnbMIOKcipX0oXpTnyNgyWHYgVJO6s6uXvf0Aqw1eNb4yjkOu8
 BWC7hV0yNS5nz6NBxmZJX2gPuEP1Y6Rv7OHWJlZ6i+/wQhfRb5+7vBTus8+U2J3xwO
 me8C+XJRE83t7JCm4V8C+LSeVQ1CfSuDgJt+ndyy3QffyrjurcsQaDdU+zohGOGr96
 Sk/LPYLCzQMCrb57nVOJFkzYtlBfVS41sD/wBZYhQUMrX0BgN9ztZeBcpDoRu6Ixml
 0OO+B3kmjN7G0SA7a3ADNCdZmoYD42/yhFDjAevzqUUYGS8+sts8S9qsLQvrlBdSsj
 CDO2uOcKueUZw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2] selftests: alsa: Start validating control names
Date: Thu, 21 Apr 2022 12:50:20 +0100
Message-Id: <20220421115020.14118-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; h=from:subject;
 bh=2Qj24wHxJHGYnRy8/BlrM7tH3a9QjizVNtDyHG9KTL0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYUSpMT4SDjmEMOj+aJmQ/ChH9T/sDSTcy9NmBuYo
 nMDmLXiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFEqQAKCRAk1otyXVSH0DWNB/
 4z6yCa2JhkKwSDKm4zOkyRMvA8w7U6j+QCfvTHvhgl9B5D1Orlw1/RiTDcaqNop1Mnoylv3Jcrnhyj
 zWfaaCS+GGCilhGy8TLmdJsEiKxfKMxUqG5PwueH+L0/L8GzXTB4xTFzyxRtt1EuELem05qiKL3pX+
 VCqB86D/w3lRFBhFt3ht3zVV8MnEJR+JZQkMMCsN2Pz5s9WhRVnDwFFz5dDCOIMpBmQu2FvxUhvEcE
 NmNok948eUkNC7klyfHeIz94OFaC4tCSrIYBPLDiqpbTQVC77cCvqbwlWoDq2reYtLQxXrWs2Vpwjr
 Imq5SQxN2+MnBdS6VN6P5+lHQCGNYD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org
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

Not much of a test but we keep on getting problems with boolean controls
not being called Switches so let's add a few basic checks to help people
spot problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---

v2:
 - Make strend() static.
 - Check for " Switch" rather than "Switch" at the end of the name.

 tools/testing/selftests/alsa/mixer-test.c | 41 ++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index eb2213540fe3..a38b89c28030 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -27,7 +27,7 @@
 
 #include "../kselftest.h"
 
-#define TESTS_PER_CONTROL 6
+#define TESTS_PER_CONTROL 7
 
 struct card_data {
 	snd_ctl_t *handle;
@@ -456,6 +456,44 @@ static void test_ctl_get_value(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
+static bool strend(const char *haystack, const char *needle)
+{
+	size_t haystack_len = strlen(haystack);
+	size_t needle_len = strlen(needle);
+
+	if (needle_len > haystack_len)
+		return false;
+	return strcmp(haystack + haystack_len - needle_len, needle) == 0;
+}
+
+static void test_ctl_name(struct ctl_data *ctl)
+{
+	bool name_ok = true;
+	bool check;
+
+	/* Only boolean controls should end in Switch */
+	if (strend(ctl->name, " Switch")) {
+		if (snd_ctl_elem_info_get_type(ctl->info) != SND_CTL_ELEM_TYPE_BOOLEAN) {
+			ksft_print_msg("%d.%d %s ends in Switch but is not boolean\n",
+				       ctl->card->card, ctl->elem, ctl->name);
+			name_ok = false;
+		}
+	}
+
+	/* Writeable boolean controls should end in Switch */
+	if (snd_ctl_elem_info_get_type(ctl->info) == SND_CTL_ELEM_TYPE_BOOLEAN &&
+	    snd_ctl_elem_info_is_writable(ctl->info)) {
+		if (!strend(ctl->name, " Switch")) {
+			ksft_print_msg("%d.%d %s is a writeable boolean but not a Switch\n",
+				       ctl->card->card, ctl->elem, ctl->name);
+			name_ok = false;
+		}
+	}
+
+	ksft_test_result(name_ok, "name.%d.%d\n",
+			 ctl->card->card, ctl->elem);
+}
+
 static bool show_mismatch(struct ctl_data *ctl, int index,
 			  snd_ctl_elem_value_t *read_val,
 			  snd_ctl_elem_value_t *expected_val)
@@ -1062,6 +1100,7 @@ int main(void)
 		 * test stores the default value for later cleanup.
 		 */
 		test_ctl_get_value(ctl);
+		test_ctl_name(ctl);
 		test_ctl_write_default(ctl);
 		test_ctl_write_valid(ctl);
 		test_ctl_write_invalid(ctl);
-- 
2.30.2

