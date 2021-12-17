Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BE478BFA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 14:04:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A80D285A;
	Fri, 17 Dec 2021 14:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A80D285A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639746290;
	bh=TY0V7AI9o/rOip8k5bSrB5QxCjKmjF4nwvLn6k9eTZs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpG9wFJHq9pp5AlABIwOiUTRTCHg7+xMCfgkIHuSC8gPOyCfBIpN/tT2nlD2Ss43a
	 QzffmQfDUieC1Yy1R0hvBGdfI/Flo6wJNDBmI/1r125gUjfOKwVhiIMbNyKbrRBBby
	 YdFHOAwgr07rQAZdo0Yqxm4yhsZDoBW21BC/dzp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2CEF804CA;
	Fri, 17 Dec 2021 14:03:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A4ACF8016D; Fri, 17 Dec 2021 14:03:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D893DF8014D
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 14:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D893DF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YT+5XX24"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E316B80CD9;
 Fri, 17 Dec 2021 13:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A8DC36AE9;
 Fri, 17 Dec 2021 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639746180;
 bh=TY0V7AI9o/rOip8k5bSrB5QxCjKmjF4nwvLn6k9eTZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YT+5XX249OrNlx+PHAC4OvXpCQx2jGPno4CZKU42Z4JJ49iVxS346bWX84YcJIofg
 gZyqMT9v4zLIGjzkuidRt0PVz6GZHzw1K9xVlZMo3SS0l+uWYSoi4+axICdhtGhc6i
 9gl6CuezV49aIop3EDmgB5hIktSTU+wqFq747UASsZrH7EdxKpps4QVmz1Y6kWeyr4
 v/ujxr1pt8C5j9LFkCTGelhRR0tlxnZ+2i7kDkk72gLFPA/dvNLUYwBBSP3Wx2FRUY
 L5Ks1auNt6XrM224gg1Cm+ILMF55ufJEn61/EJ5IWRs7qf6zon5Td7LlZzzvcH7XPS
 qypNWf0srfVjA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 2/2] kselftest: alsa: Validate values read from enumerations
Date: Fri, 17 Dec 2021 13:02:13 +0000
Message-Id: <20211217130213.3893415-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217130213.3893415-1-broonie@kernel.org>
References: <20211217130213.3893415-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; h=from:subject;
 bh=TY0V7AI9o/rOip8k5bSrB5QxCjKmjF4nwvLn6k9eTZs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhvIpNINJsd9u2GOqr2y3tsCH8PH/9AGzxFQF4/bEv
 EMPMliiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbyKTQAKCRAk1otyXVSH0IQQB/
 4q/VupXstKGRjhr7iapGoDkw1zEGSo+Ay/40Tvnuzw7de5MrKUxRgVO9xcEdfThm115wc9ZKBdyWFI
 rL3Tyi08koEZKG+XtGyyeFGglG8PdAAhahZ9nw4kdIzmvT0rZPiVqtY0H773w/7DZ82bPkX0L2nO4x
 7SnNrDS/t41yqPvRDx6UlLjCXKDgTq+2SeVmJQKM9DYXo1usT8ix849MhJ3BbOA1I4Q9GWQL/dLJ3p
 wHD1spotYn9zhU/1FHc3Vv+MDqmjeAaAmQvfpUGw0KzCwjOCDPA0lfP1BVNeWM99ZxpD6zdcbrKItl
 jj+CrxTWxbAKoU4WDycZihXYoLT7Ib
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

Enumerations should return a value between 0 and items-1, check that this
is the case.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index b009fc5df605..17f158d7a767 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -276,6 +276,23 @@ bool ctl_value_index_valid(struct ctl_data *ctl, snd_ctl_elem_value_t *val,
 		}
 		break;
 
+	case SND_CTL_ELEM_TYPE_ENUMERATED:
+		int_val = snd_ctl_elem_value_get_enumerated(val, index);
+
+		if (int_val < 0) {
+			ksft_print_msg("%s.%d negative value %ld for enumeration\n",
+				       ctl->name, index, int_val);
+			return false;
+		}
+
+		if (int_val >= snd_ctl_elem_info_get_items(ctl->info)) {
+			ksft_print_msg("%s.%d value %ld more than item count %ld\n",
+				       ctl->name, index, int_val,
+				       snd_ctl_elem_info_get_items(ctl->info));
+			return false;
+		}
+		break;
+
 	default:
 		/* No tests for other types */
 		break;
-- 
2.30.2

