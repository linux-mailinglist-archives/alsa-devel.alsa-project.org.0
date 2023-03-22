Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F192F6C4F44
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 16:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EE9E9A;
	Wed, 22 Mar 2023 16:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EE9E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679498358;
	bh=G91Xxoht3fjT/ksBx7WK39E+k66GaFoCv6vtPQKyrIc=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bMGvhCVFrZiQwzig0n2OBVApgI2lystPaa/SP2M4Hg/XBQPbH/eUo8X6AdbNnCvox
	 E9nyXtvypV5zv4sTZHmG4sLwRLsQC1gS8TNveHGjCFbMLcLV7NLAtW+Ng0Jw1O2/X5
	 QQnmZCuHQ+51+y+DqVuAitRSvxpAcG9+NJ4zoMPw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 540B9F80254;
	Wed, 22 Mar 2023 16:18:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AA08F8027B; Wed, 22 Mar 2023 16:18:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 375C5F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375C5F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QaWquMRs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A81096219B;
	Wed, 22 Mar 2023 15:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9298EC433EF;
	Wed, 22 Mar 2023 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679498296;
	bh=G91Xxoht3fjT/ksBx7WK39E+k66GaFoCv6vtPQKyrIc=;
	h=From:Date:Subject:To:Cc:From;
	b=QaWquMRs0vLW629HLsF0AR2Mf+8ZKwsgWEJ+bmdMu9QIHIlXnZgfcUOp/nYigHNHO
	 2NBtLFYzTkCRVdxH/T3r9ZgEVZYaLJBCNSa9OBjiiHaQf1/rO+mFeX/XR8ajHKZsLS
	 BOyejorKR8KNY64I2rDfW9kf7uJ9bC64tz+bAFr9zoWBOsqzrO+bDBf7J76/HNRf1R
	 3BEDsV5bvAxAJT2QGAHE+k9OszbE7vJ1fG5vR905iiTCp7y4RN0f1/uRhsk6zynsHH
	 6MsQ57q/Ncb/UTeIu4oAJvpgz1OHQq6+roq48ysDVaghJb6xaweZl9ixyFFLrzUzYR
	 nVQrNBfatFwiQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Mar 2023 15:18:07 +0000
Subject: [PATCH] kselftest/alsa - mixer-test: Log values associated with
 event issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230322-alsa-mixer-event-values-v1-1-78189fcf6655@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC4cG2QC/xXNQQrCQAyF4auUrA20aUHrVcRFZow2WKeS1FEov
 bszy//Bx9vAxVQczs0GJlldl1SiOzQQJ04PQb2VBmqpb3si5NkZX/oTQ8mSVsw8f8TxOIynEJl
 GGjooOrALBuMUp+q/iz3r/Da5F1wPL9d9/wPAkofJgAAAAA==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-2eb1a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G91Xxoht3fjT/ksBx7WK39E+k66GaFoCv6vtPQKyrIc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkGxw1pNw+kqrw+UT6UrYdlwhHdKFk0xjSV6/AlI0x
 +G/DaoSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZBscNQAKCRAk1otyXVSH0PB2B/
 9cZ6FBiQvVna4Jf9J4Wi+vyJSupNBGGqijeKbrI65XwPMb7+xkhpgddnRUDR00wiNrQx7J1iXklBxo
 2exeYAyDGmQt0z4vIe9phw7JFSQytvl35PTM3hCx/yQuz0LgWXINAngpKmtvjIS6nm9dqydaIgrh9Z
 VY4TX0itnVAjpLN55ThrKOURqzktphQhwSO8wuULdEp7hHY/cCLfF59mL6Y+oBtY3pJR4RU/DO5Esp
 KyLshOyxCZ4WtxrZtk83BOBFabP+/RUK4m/MyZhHnKUqLshMFyxxyl3zYu35mBbVGOnucKO64HyzAX
 zoWrPbFD1g7OQvZEPJyAmhvIT4Rzzp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XA4EMQWWW4S7ZGFU2YIWF2LX4AAOGLPQ
X-Message-ID-Hash: XA4EMQWWW4S7ZGFU2YIWF2LX4AAOGLPQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XA4EMQWWW4S7ZGFU2YIWF2LX4AAOGLPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While it is common for driver bugs with events to apply to all events there
are some issues which only trigger for specific values. Understanding these
is easier if we know what we were trying to do when configuring the control
so add logging for the specific values involved in the spurious event.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 05f1749ae19d..15d2ef8d4d27 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -445,6 +445,48 @@ static void test_ctl_name(struct ctl_data *ctl)
 			 ctl->card->card, ctl->elem);
 }
 
+static void show_values(struct ctl_data *ctl, snd_ctl_elem_value_t *orig_val,
+			snd_ctl_elem_value_t *read_val)
+{
+	long long orig_int, read_int;
+	int i;
+
+	for (i = 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
+		switch (snd_ctl_elem_info_get_type(ctl->info)) {
+		case SND_CTL_ELEM_TYPE_BOOLEAN:
+			orig_int = snd_ctl_elem_value_get_boolean(orig_val, i);
+			read_int = snd_ctl_elem_value_get_boolean(read_val, i);
+			break;
+
+		case SND_CTL_ELEM_TYPE_INTEGER:
+			orig_int = snd_ctl_elem_value_get_integer(orig_val, i);
+			read_int = snd_ctl_elem_value_get_integer(read_val, i);
+			break;
+
+		case SND_CTL_ELEM_TYPE_INTEGER64:
+			orig_int = snd_ctl_elem_value_get_integer64(orig_val,
+								    i);
+			read_int = snd_ctl_elem_value_get_integer64(read_val,
+								    i);
+			break;
+
+		case SND_CTL_ELEM_TYPE_ENUMERATED:
+			orig_int = snd_ctl_elem_value_get_enumerated(orig_val,
+								     i);
+			read_int = snd_ctl_elem_value_get_enumerated(read_val,
+								     i);
+			break;
+
+		default:
+			return;
+		}
+
+		ksft_print_msg("%s.%d orig %lld read %lld, is_volatile %d\n",
+			       ctl->name, i, orig_int, read_int,
+			       snd_ctl_elem_info_is_volatile(ctl->info));
+	}
+}
+
 static bool show_mismatch(struct ctl_data *ctl, int index,
 			  snd_ctl_elem_value_t *read_val,
 			  snd_ctl_elem_value_t *expected_val)
@@ -584,12 +626,14 @@ static int write_and_verify(struct ctl_data *ctl,
 			if (err < 1) {
 				ksft_print_msg("No event generated for %s\n",
 					       ctl->name);
+				show_values(ctl, initial_val, read_val);
 				ctl->event_missing++;
 			}
 		} else {
 			if (err != 0) {
 				ksft_print_msg("Spurious event generated for %s\n",
 					       ctl->name);
+				show_values(ctl, initial_val, read_val);
 				ctl->event_spurious++;
 			}
 		}

---
base-commit: e8d018dd0257f744ca50a729e3d042cf2ec9da65
change-id: 20230322-alsa-mixer-event-values-7498bca29241

Best regards,
-- 
Mark Brown <broonie@kernel.org>

