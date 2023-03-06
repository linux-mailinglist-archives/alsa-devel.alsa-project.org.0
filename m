Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F16AC30C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 15:21:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B451110;
	Mon,  6 Mar 2023 15:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B451110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678112477;
	bh=60Dvz40Apg10LIVR8Wrt138EIQKfoVEnTzRBhbCLHFI=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QS3ralmPBsE/z8xdioOjQAVV/bQPEpUkl5H01Ty7dJ+yLFXMeZrY0lf1BjuiO5VJ2
	 9O8GAb1BC5NDo/5N1pjc7YMHAtK3kgDZWbPn9kfaTQdXr8Q2dyfui1vxYQ3nU5Hp5d
	 0AUVZA/SIrJS5QQF0sSoHp6xdbHI2ac90oOG+cT0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC52F80236;
	Mon,  6 Mar 2023 15:20:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57E72F8042F; Mon,  6 Mar 2023 15:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0764F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 15:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0764F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S7nnSoDS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FC1960FC4;
	Mon,  6 Mar 2023 14:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76301C4339B;
	Mon,  6 Mar 2023 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678112410;
	bh=60Dvz40Apg10LIVR8Wrt138EIQKfoVEnTzRBhbCLHFI=;
	h=From:Date:Subject:To:Cc:From;
	b=S7nnSoDSoKXpiOB6Qmp8N5oxo6tY7Www6cRJRu0n4D4B6MiOgJEZBkuHhUc0ohjpR
	 9rTTSgyyx/oIgUsRcgrWsuzcLozZnx/GoJPxmxue3q93OD5d9cgXA2gNhabHMKDCqk
	 DOklSGO65SeDhynJeOsHOyM4BjY8eYH5KvROvD5wOkRlVj+JZ504YANdRMXWNCN9Q5
	 VH8VaOgD3tGgVaVG85h3DzDvGTjNO8WB7ofXVrTmFn0rgK2fMqYiFbmAWPia4Wzwct
	 c224AjqJguq5gAd2zmjsII0W+vwlqYe+K6bxW5BZmLEAPX5qrxv8irBb8RwdnhAjjf
	 CyuqmQQ3CKejA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Mar 2023 14:20:03 +0000
Subject: [PATCH] kselftest/alsa - mixer-test: Don't fail tests if we can't
 restore default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20230224-alsa-mixer-test-restore-invalid-v1-1-454f0f1f2c4b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJL2BWQC/xWNwQqDQAxEf0VybsBuK7b9leIhq7GG2t2SiC2I/
 272MvCG4c0Gxips8Kg2UF7FJCeH86mCfqL0YpTBGUIdLnUIV6TZCD/yZ8WFbUH1yOqztNIsAwZ
 q2ni/Ecd2BLdEMsaolPqpeH5Z36X+Ko8uKcfPbt8PwYovk4gAAAA=
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=60Dvz40Apg10LIVR8Wrt138EIQKfoVEnTzRBhbCLHFI=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhhTWbzMk0yMaz7BaGZ+t4mMOsI6NqtV8y2WtbzHft6dpgcY+
 kR2djMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEFIPY/3C+c/Qyn8lw9lXn8mf1D1
 80errkit3MkBDU/dDcL/xQ0F/yz+RFR70k1c9fdm3d66bZaPZq24b2iNuV91O2mjHIZJ70c4sWmlop
 dPVWiLHejPkC0n6htVteMRfcrFm10zozYePdboMHUYYaaRcFf/5+37t7ypN7O+S/tTnrl22wbj3adH
 KylLN3irDxXc9nFcpZefMYnXQV3n84Pff2gpx35551bu7YzdN168MUpjwzndCm4FWXvZSPv1fN/M+u
 e9J+Mlui15+lOZprPPylNQIvRa/IUsm3z5nWXC52w7P+tsaMqnWP+qNmWW//8eH5fbOlhX4T5nDeuV
 kXkTxJMHZm66r65GpJCwbbiwX1AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: IIUZZ4K5QNG3YYGHI7AT6CVN2OG65AUY
X-Message-ID-Hash: IIUZZ4K5QNG3YYGHI7AT6CVN2OG65AUY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIUZZ4K5QNG3YYGHI7AT6CVN2OG65AUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If a control has an invalid default value then we might fail to set it
when restoring the default value after our write tests, for example due to
correctly implemented range checks in put() operations. Currently this
causes us to report the tests we were running as failed even when the
operation we were trying to test is successful, making it look like there
are problems where none really exist. Stop doing this, only reporting any
issues during the actual test.

We already have validation for the initial readback being in spec and for
writing the default value back so failed tests will be reported for these
controls, and we log an error on the operation that failed when we write so
there will be a diagnostic warning the user that there is a problem.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 05f1749ae19d..ac5efa42d488 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -755,7 +755,6 @@ static bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
 static void test_ctl_write_valid(struct ctl_data *ctl)
 {
 	bool pass;
-	int err;
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
@@ -797,9 +796,7 @@ static void test_ctl_write_valid(struct ctl_data *ctl)
 	}
 
 	/* Restore the default value to minimise disruption */
-	err = write_and_verify(ctl, ctl->def_val, NULL);
-	if (err < 0)
-		pass = false;
+	write_and_verify(ctl, ctl->def_val, NULL);
 
 	ksft_test_result(pass, "write_valid.%d.%d\n",
 			 ctl->card->card, ctl->elem);
@@ -1015,9 +1012,7 @@ static void test_ctl_write_invalid(struct ctl_data *ctl)
 	}
 
 	/* Restore the default value to minimise disruption */
-	err = write_and_verify(ctl, ctl->def_val, NULL);
-	if (err < 0)
-		pass = false;
+	write_and_verify(ctl, ctl->def_val, NULL);
 
 	ksft_test_result(pass, "write_invalid.%d.%d\n",
 			 ctl->card->card, ctl->elem);

---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230224-alsa-mixer-test-restore-invalid-2a57b98aeb7f

Best regards,
-- 
Mark Brown <broonie@kernel.org>

