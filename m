Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1763F605
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83C21767;
	Thu,  1 Dec 2022 18:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83C21767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669914808;
	bh=Vx9X4XLGV+87QBonlTDAWmJxr2iTnW/AMH1GHUB2CgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=po/qu5JSeUBmE0nY79xvJqk9dwt5NAD2SHJu3UY1CDEtGyc0Re7ImiHwK4kw6jfP1
	 jRK86zfX2qKvD56XbujosaI3WShjCv3v9kNO1KuLLtQj34Ja84CtZF+FIr01/nKnxb
	 YO6bX7o0KB6XOihe7tsV3s46Hl/FOqvGzj3vfo88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C847F8057D;
	Thu,  1 Dec 2022 18:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 655B4F8057B; Thu,  1 Dec 2022 18:11:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C35D5F80567
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C35D5F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J6LIrwS8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA31162095;
 Thu,  1 Dec 2022 17:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0407C433D6;
 Thu,  1 Dec 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669914664;
 bh=Vx9X4XLGV+87QBonlTDAWmJxr2iTnW/AMH1GHUB2CgI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6LIrwS80f3HWFnPn+E8TAsDfOpXiqIaFhngKHjGIgteI+OnVs86nf9jRq8+8jGOB
 RHvkYT2RKpp9MGg61f3J995kRHXZD6M7VUEwOeiDc0w0Fu7YclF0jhGRV8WBAdFwL4
 Iqk0gWRoM5zw5IsDY9VzNU0XizDg95UyPoAKNHokcBOzkOqtcz99pq1aeOjGdwqXJ6
 hWvZ+9cgGTrGebyIqOyn9ZWg1QUsSGbZqacRSARvqMUs9nXmoLsQSfxMWNUOa5SHbL
 HmHLcHI0Sc862ACC6Gom9XA3l44NyIWZOGPUHAL3ZT1SWbEk/MH+3wVSJCUrcxHzeg
 UEnwKlv65hqPQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 5/6] kselftest/alsa: Provide more meaningful names for tests
Date: Thu,  1 Dec 2022 17:07:44 +0000
Message-Id: <20221201170745.1111236-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201170745.1111236-1-broonie@kernel.org>
References: <20221201170745.1111236-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=broonie@kernel.org;
 h=from:subject; bh=Vx9X4XLGV+87QBonlTDAWmJxr2iTnW/AMH1GHUB2CgI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiN9fpUWCP6bQYPg5IEoJ+soMA16r5YPqydc2hWsY
 EF2z3w2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4jfXwAKCRAk1otyXVSH0AZdB/
 0T7EDVqIvPaJ4DTpkUCVnYqTDAZcIVPsGXS7XYxGHohRda7U+pQQEvwrP5Xy0h16kSBSAbdNCwn/Fd
 tZVNqz3ppc3wgPsh5dqWpkd7hF6PUHD9vDLULrpKKZCRL4WQzD0pIsGfAdDt2sgk78p0IOfRii+xi1
 T4kP8k9DwxDJCkvZFQa8Ysn4VyUXwi30/5qCryJ06gzZGpCqM+Vx2+I0Op+X/X7P+ADJmFqpsApOJ9
 Y4oaU2ipxfaZIy08SezKPMrg+I88qyE0k4XdhLSNQTd3TxLsR0pl5ZSvsot81b/4lA5VvJu10SP7yV
 cCkIopHccpUw6jX/eOvuOLr/+9Vdjh
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

Rather than just numbering the tests try to provide semi descriptive names
for what the tests are trying to cover. This also has the advantage of
meaning we can add more tests without having to keep the list of tests
ordered by existing number which should make it easier to understand what
we're testing and why.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index c701cf507a95..afa13377481d 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -446,9 +446,9 @@ static void test_pcm_time1(struct pcm_data *data,
 }
 
 static const struct time_test_def time_tests[] = {
-	/* name          format     rate   chan  period  buffer */
-	{ "test.time1",  "S16_LE",  48000, 2,      512,    4096 },
-	{ "test.time2",  "S16_LE",  48000, 2,    24000,  192000 },
+	/* name              format     rate   chan  period  buffer */
+	{ "S16.48k.2.small", "S16_LE",  48000, 2,      512,    4096 },
+	{ "S16.48k.2.big",   "S16_LE",  48000, 2,    24000,  192000 },
 };
 
 int main(void)
-- 
2.30.2

