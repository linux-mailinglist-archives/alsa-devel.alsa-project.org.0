Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259F63CC46
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 01:09:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CFB16C5;
	Wed, 30 Nov 2022 01:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CFB16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669766972;
	bh=kOi2ubrZvDe707/dHvl2mMsoj6BDmru6DBWUPvLaUxo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a2ARSv6ltO8JJhQqGiSuE+n7GUFH7FrxOAuBHKsxYTtlG9Pt7A5Pc34X2O3lH+joc
	 vRdePoH0YoW6b2q8Uei64mg+QyVSOcLQnTsnR1lFk5DDvXijBo/e8UtK72XvzqKh9T
	 oT0ThNoH4voy6uvMDxK6/sjx7jTF1tna/gkbNYdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44D45F8057C;
	Wed, 30 Nov 2022 01:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A133F8055C; Wed, 30 Nov 2022 01:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69745F801F7
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 01:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69745F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V76bYzMa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 354EE61982;
 Wed, 30 Nov 2022 00:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39566C43470;
 Wed, 30 Nov 2022 00:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669766822;
 bh=kOi2ubrZvDe707/dHvl2mMsoj6BDmru6DBWUPvLaUxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V76bYzMawZs2YAZJGTTI54SCy/ykzT/KViJgN1xRHteLpFJ4NMiP16Eu+ai6NkR9J
 KqjYNfFxvQicyYObFWmw5mjE2Bn2sMAiR/U6I+TpayzrU1xXHxgStxeY/YYzvWjcIw
 LA2P7bYO7U9xGtQVqwfGOEXHlMXaUoR9FI174M7iTCmJllRtbzG4CVYCjdjyn17usp
 XtzoUuo2GMffADPV756TGO5MiNZ5RkvKjtBR3d5ZiOSVCKy8joNLAB2DWY1WYfi+kL
 VTni1/k/QUM2NNDK4A6MX34ZDz6A8HYVJPppOyRWPuX+vdw1JVZD5HUVe8M+6Vd2aa
 PHnk+g1XBq72w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 5/6] kselftest/alsa: Provide more meaningful names for tests
Date: Wed, 30 Nov 2022 00:06:07 +0000
Message-Id: <20221130000608.519574-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130000608.519574-1-broonie@kernel.org>
References: <20221130000608.519574-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=broonie@kernel.org;
 h=from:subject; bh=kOi2ubrZvDe707/dHvl2mMsoj6BDmru6DBWUPvLaUxo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjhp5vuot+YdREPb2LKHc+Hc4LtSKasB2J15HPSkKa
 bmmoyNiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4aebwAKCRAk1otyXVSH0CQdB/
 9cJAjFX1Xnft5g+5CfO4Y8lx+WCr3PDsQszQed6iptz7DARLlXwMxdtMkdd604CYcSD6AvJNAK3cw/
 ZkkB/JMf5+ux/09aCxl/d6Cikp9UygL6YGghksGVo45g3IKRJ7S/KIYXpF1bYrEVgXJRsLnmLttiDD
 9wKr3MxG14S+OUBmHArQDXpFX4GhRdrhcLo1mzq9C3uftSxkbei3787vsCNf/JprSYk0HBd5yJM7+4
 st6OIHQjPQ6gRYIcR0pxe8EHnn6Sut3MNmakDNDvkKVduqSpX0u7GCcCQz2P/h1WkYXH9Lwx/rQ3KZ
 pSJVo6mFnGccacTrr/nPenPPeiap2E
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
index bc0cb3c481f2..614ccc52cece 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -516,9 +516,9 @@ static void test_pcm_time1(struct pcm_data *data,
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

