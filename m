Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75184509176
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 22:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081661B34;
	Wed, 20 Apr 2022 22:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081661B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650486922;
	bh=tVFCDZ0vBwvWKJ8tL5yO0R/kUmljF0kqDX2ldSTF8Dg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ra1zdmw3LhTcPkiakOfYUYU73aEkB8Ey2OsVA3E9jUF/gcMgvTr3eFHt3JuaI2rhr
	 u+BgCaXecOd0WbwHdg+8IMw2llpAOy7IDe7f015D67GDAEI02Rn//rP4W++xWyX6sC
	 kAQ7uSR6LEm3+Ey/r9XOcZbFJkCEo39WVSfYEy1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6102EF80128;
	Wed, 20 Apr 2022 22:34:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442A7F80125; Wed, 20 Apr 2022 22:34:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70935F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 22:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70935F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MHjcFJJY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E15FE61618;
 Wed, 20 Apr 2022 20:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E227BC385A1;
 Wed, 20 Apr 2022 20:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650486851;
 bh=tVFCDZ0vBwvWKJ8tL5yO0R/kUmljF0kqDX2ldSTF8Dg=;
 h=From:To:Cc:Subject:Date:From;
 b=MHjcFJJYYSWwm+k7Hw7O2Nz5QkZECo96GlzUt6uPQJiI37cgA27i9OfoUcO95O5VU
 rVCPZ+Twe9EHTndUyaAoVvQwJBIZeP4XvNzhXQFfqUNfBMFhlwWkfmc+w/QoysyiVs
 +J+zJ8IaROy2iE1uX4gNijBdfw8dn2Tkh6lWx+2dbz4KvJJdEYHOqI/1nhpl75bjNo
 2ZRbwfncv0F40gN1/szSkCFi4Sna7c766vJXcJVsjHaq0Q34jlE3uRJy/0/lUpDjCV
 dx1iIWaeceSeZab/Th7wfc0/ybTVBzSqxtJgtbjoavRo5E4MusjRUgSBtjE1sLvq2V
 9uNiOgCgGImEw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH] selftests: alsa: Start validating control names
Date: Wed, 20 Apr 2022 21:33:20 +0100
Message-Id: <20220420203320.3035329-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; h=from:subject;
 bh=tVFCDZ0vBwvWKJ8tL5yO0R/kUmljF0kqDX2ldSTF8Dg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYG3mcAO/vJ0SBQyjb4SwpnhiafiONNdykHqOJk9A
 CBVYn1OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmBt5gAKCRAk1otyXVSH0LnMB/
 4guK0eanunQTBSnw9DVKyEw5/rEpo98727kQQxDVlvGCGw1EOHKZQ/iOpPfxlJn2BEva+1zn/QZZSA
 BJaeHsysVIQyK7E1FZzcNHulqfNRQK8uEQ1UjqmI9G9JNolYyOwgm41ScPSdgnq8tZMze9UMjRp7/A
 FJz72pNDX74Qw8pzfooeLE9T80BOsiQ1n3URuy4tDW/HwN+9mNbGUt5IeXLxp9L1JHp0nJadsSC/3Q
 xIxuZsG9Vre2lag8oJz8LYqQDjbT8CjgZksjLY5NXDFTbz7LQIq0hiphVe1PitzcJsfpxnoTxKAz2J
 +CXaOW8YXUbQna93CPZpENtngsFpQH
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
 tools/testing/selftests/alsa/mixer-test.c | 41 ++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index eb2213540fe3..b747dbc023ab 100644
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
 
+bool strend(const char *haystack, const char *needle)
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
+	if (strend(ctl->name, "Switch")) {
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
+		if (!strend(ctl->name, "Switch")) {
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

