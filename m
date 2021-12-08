Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59046DD8A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09EF82687;
	Wed,  8 Dec 2021 22:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09EF82687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638998439;
	bh=ZpZe4S9g6+9K/niZOHt6MFgbYLGRbm9ZPNUG1vDHhUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGHwryglGIxYyjSG3Ko5vPPqRPDdAYKx5B75avb2RxkcT+H2l3BP3phQ6ttW3MKxR
	 JcXzHXK2Iy2b82Mi83J+ZTN4AM11DsQQeBllEzcfKLJ2GWnppbKrjg3XtIH6bmJWAo
	 LiS3mhUY288i5vX14tp3T8W6G4LXglXMOywgxeVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A47F80516;
	Wed,  8 Dec 2021 22:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD3BF80506; Wed,  8 Dec 2021 22:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F394CF804E5
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F394CF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="av5FyYFh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C8691CE23C5;
 Wed,  8 Dec 2021 21:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32679C341CA;
 Wed,  8 Dec 2021 21:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638998276;
 bh=ZpZe4S9g6+9K/niZOHt6MFgbYLGRbm9ZPNUG1vDHhUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=av5FyYFhxbkE5uyrlJbWdGps3XUQeE4j6C/FdRChirF8XmQM72OrtcA7BP5GrE0gR
 JKECUbw5LzTTTl4VVzDozJlmTYqicI9XMgSbdlSa9GhHXgVoXniK/OpSzREwBIyx7Z
 tGpXb/pUjXvvNZpDslHqbO3b/pL5d76ujvBVXCWGHqjxGu584ku8/sOYGNSavpyBfU
 c3m0G1MvtxoPMfl3vnP1gysUUHSO/NJgqnAweC8HqpMAK3Em/kbDBRdeW8OG5Yn3C0
 MPBVgURitPJTW/It8APiwxzoCjpZAHkfUc6rwOMCizNE8lHzf67v222OE1eyt4ttwE
 58Q0q4eLTURHQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 2/3] kselftest: alsa: optimization for
 SNDRV_CTL_ELEM_ACCESS_VOLATILE
Date: Wed,  8 Dec 2021 21:17:44 +0000
Message-Id: <20211208211745.533603-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211208211745.533603-1-broonie@kernel.org>
References: <20211208211745.533603-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=broonie@kernel.org;
 h=from:subject; bh=PNhi0HaclmY3tvqaRA3cxAHo56f/6hUNXvdxt2Zcq+Q=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBhsSD3eu8xGXcFy0nhWMHOgf1rSAnPvDqKKgBbFmd0
 M9gsyT6JATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbEg9wAKCRAk1otyXVSH0HODB/
 d6q/FH7FGeD899VRbb9BLh6S+4V4h33apyDiW8/ImgDm2LHrMNXMWIJEfxYNwTcJjeWFmvuVXK7qZd
 F0wvXKahbhrqmtNAS7yanjrak0cARns61eyQqASwYhbBGCabv0ttXqOMjftSVC8D2eg7rqHAqtJcdS
 rBpG6nFwkpwkhTCJ4aWI0wBWuk8jFrlGIxuZxj+mNEUzFt4ozKpNmk7XYnBtTmtxbSvPq41bYVUIzJ
 ODEakiwcX4bKa/rgKlXT06tBhJ9fNtfpOsTOjZETYfON6sdyFiYHyux2MHMjOGLuMoRCJ7Tdcu0gVQ
 09H5ejGEqB/Su+GI51nTDaJth+70g=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

The volatile attribute of control element means that the hardware can
voluntarily change the state of control element independent of any
operation by software. ALSA control core necessarily sends notification
to userspace subscribers for any change from userspace application, while
it doesn't for the hardware's voluntary change.

This commit adds optimization for the attribute. Even if read value is
different from written value, the test reports success as long as the
target control element has the attribute. On the other hand, the
difference is itself reported for developers' convenience.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/Ya7TAHdMe9i41bsC@workstation
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index ab51cf7b9e03..171d33692c7b 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -307,9 +307,13 @@ bool show_mismatch(struct ctl_data *ctl, int index,
 	}
 
 	if (expected_int != read_int) {
-		ksft_print_msg("%s.%d expected %lld but read %lld\n",
-			       ctl->name, index, expected_int, read_int);
-		return true;
+		// NOTE: The volatile attribute means that the hardware can voluntarily change the
+		// state of control element independent of any operation by software.
+		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
+
+		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
+			       ctl->name, index, expected_int, read_int, is_volatile);
+		return !is_volatile;
 	} else {
 		return false;
 	}
-- 
2.30.2

