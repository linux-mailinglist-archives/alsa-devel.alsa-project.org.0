Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBFA470987
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 19:56:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8054020F9;
	Fri, 10 Dec 2021 19:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8054020F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639162592;
	bh=rohsPdVVVR9EdevsE/V/GrFKcu2ngPnD5UWW/wpylE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ohwjCXOeBhxYDYPDZ0Nl44lD0I5blvQfsCXgqF8d4hOTx425qwjlFpA8i6l2g3lRE
	 ccWo/3f1Oitwjrh38u/0m55ttvx368XZuuapOH/k0VPb9KKoQWIgDDquwgZOGsEbn/
	 vElW9Fth5w43mbSqsfcwgcweWcoPPkkE3F4/tPP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDCAF80519;
	Fri, 10 Dec 2021 19:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAF3EF8050F; Fri, 10 Dec 2021 19:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E554EF804E6
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 19:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E554EF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BzIxwZk+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61DE4B82994;
 Fri, 10 Dec 2021 18:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E3AC341C7;
 Fri, 10 Dec 2021 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639162463;
 bh=rohsPdVVVR9EdevsE/V/GrFKcu2ngPnD5UWW/wpylE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BzIxwZk+DITCW30wfmUKbqOGJX4HTafUAe3dHGKFLZJAvt6O4ZStY0P7gyk1yoWhA
 0CvcLzLfd7biSWv27oOLKUeOUbbCjAsG0wXcQtjk1viMjoHPu/rbQ7GS5nkvD8HOyw
 IKtX80G5oz34e87DN3PGn52lhN5FsY3BnFkwlRmv89+/gHsHSWXZmy1HQvAcfpKuA2
 pqMY19Q9Xu2yIpMOsiPEMHYGN1t3PGzivDq+IjQEmdPXe4xXR/KEc3KvsGCTiEfz+C
 cl1v4CAiqUuMDN8Z8moeC7MTZEl+Y7uVIDh0D+BCKD95TUFZveMXVKzhlDelg3aH9v
 CZ11besCOGCvg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v4 2/3] kselftest: alsa: optimization for
 SNDRV_CTL_ELEM_ACCESS_VOLATILE
Date: Fri, 10 Dec 2021 18:54:09 +0000
Message-Id: <20211210185410.740009-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211210185410.740009-1-broonie@kernel.org>
References: <20211210185410.740009-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=broonie@kernel.org;
 h=from:subject; bh=KiZKlxbVF1zb5VsBrhgN0JQrdG+LGi2hP5TTfQ4nqY8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhs6JP/y/vzqH2TrApPXd/uop9W8pDfPqPgrnVZMps
 G136DteJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbOiTwAKCRAk1otyXVSH0CYCB/
 9BPfCV7GbUpSfjWK21CuxoL+a5B8lj5rwFHdSO9HVoorkax3/yAbvQSWkmnAiNIIBUZFmDGkwPlMpv
 TulNRwQl1PxTOz1GFLLItnSMvbih9Pbsj7cmeRuNPpaOiIs+o0eMr9L5qMY5IwdE+uZDlE1CgPkuYO
 1rVvWvUUAt3t0AY1QDJAQgbhZNuCy2Sw1dk5OU42qWmPrwaoXguIV2IbU1D/WCyuTH9fKRSHFxSmio
 J4rMgd2ajrzTYK+SS9NoVhTrq/N6upBw+TKIAYjKOaA13gDHBDMoO8RxcYcFFTyZkD/0qsuOvxdGbo
 7Jtm117Znt+RkZwUBqwotvJJ7ML5V0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
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
[Fix comment style as suggested by Shuah -- broonie]
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index ab51cf7b9e03..f65a9046e708 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -307,9 +307,15 @@ bool show_mismatch(struct ctl_data *ctl, int index,
 	}
 
 	if (expected_int != read_int) {
-		ksft_print_msg("%s.%d expected %lld but read %lld\n",
-			       ctl->name, index, expected_int, read_int);
-		return true;
+		/*
+		 * NOTE: The volatile attribute means that the hardware
+		 * can voluntarily change the state of control element
+		 * independent of any operation by software.  
+		 */
+		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
+		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
+			       ctl->name, index, expected_int, read_int, is_volatile);
+		return !is_volatile;
 	} else {
 		return false;
 	}
-- 
2.30.2

