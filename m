Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42C656D4F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 18:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A07A64E7;
	Tue, 27 Dec 2022 18:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A07A64E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672161033;
	bh=uxaBKlEBdgL2vH6RIInA6fuLSoTpmrLUhjWBaHzLQMY=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r8EZSiBRIyYI+zVkKWR+Pw0Q/zak8G9uyxppnqKc9/00Pd8BlTIetARsigB2yBCSF
	 FoziAhgyKnIX9qbbqdzLZcctb1oi74crCuTktgUJNMrHM4NTtNWOFwjOmvD6fxVpZa
	 UxpDQLnMrzVPzrLXdt/hp/vbXP4izOuVUhPlxQBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4CD3F80571;
	Tue, 27 Dec 2022 18:07:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5486F8056F; Tue, 27 Dec 2022 18:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E12ADF8055A
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 18:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E12ADF8055A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B0vvlwYe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18725611D6;
 Tue, 27 Dec 2022 17:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E40C433AF;
 Tue, 27 Dec 2022 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672160852;
 bh=uxaBKlEBdgL2vH6RIInA6fuLSoTpmrLUhjWBaHzLQMY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B0vvlwYeBFVsH5dzWcS9zGctixO+BcVewUGdlEbOSaTLz6q4UGTMnJfw5wtWPC8Ki
 Z//pmIfDhIzmK9aBnkuh2SLvCJnSrzzjX+h/JxoW+h6XHL0aOecAWUC+te1OVgBEmU
 KkAlT0XTbuomePlmuHknbIuoG7N6GWr5hClA9oXnDOuzJQrXP7D+21w6h57Vea2BMM
 x4c9/BMJ0LyOWy6X+nvuR2HaonZKqwJPUKhlQ4b9aeU2vPJR4VokQ/5+kzLQEdEcgV
 /yRcqvwCYLrJFYPJseOWvfSqhtWTIZOQgfyLeybXhOo9khAAeF+1SDbFcQdmbwKt2X
 omC8FY3PycjcQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Dec 2022 17:06:52 +0000
Subject: [PATCH v4 7/7] kselftest/alsa: pcm - Add more coverage by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221208-alsa-pcm-test-hacks-v4-7-5a152e65b1e1@kernel.org>
References: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
In-Reply-To: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.12-dev-7ab1d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uxaBKlEBdgL2vH6RIInA6fuLSoTpmrLUhjWBaHzLQMY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjqyZF4AynULWOON7IsKhfOyuMp8d1cKEzp28jmiLn
 bAKabXmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY6smRQAKCRAk1otyXVSH0L4CB/
 9Y/IcV/hbQxayzYQsUYnwl4bcP73J3w9Q8D4DLLlcycEy9+CT7NbYvB17FUeibbOMc4XoojPKLTSpV
 qcaYQ9DSDtHboeRb70V7brVMWPnWDKiDXL2U84cDKqt2TFa7PJu8LnutT2N5ko/3UAu3UtAgA8/akI
 wiOevp+bm+amAgoHMuqFVwh2XVDuVWRZr60Ib2HsLDYgImHhSgudVrxvzF4sgpyg5u2xKHqFPUcWc+
 Y5Oi2RMVA0FwgMYR78oZeUYPqOwdHWzIuqCueNshnmMhCy+k11lLh8Y9rsuQq4eoW/lNRzohzQUIzE
 Co6Kr1lvBNNjZEbIhPZEOM8aaV1Elv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add more coverage to our standard test cases:

 - 8kHz mono and stereo to verify that the most common mono format is
   clocked correctly.
 - 44.1kHz stereo to verify that this different clock base is generated
   accurately.
 - 48kHz 6 channel to verify that 6 channel is clocked correctly.
 - 96kHz stereo since that is a common audiophile rate.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.conf | 47 +++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.conf b/tools/testing/selftests/alsa/pcm-test.conf
index 1662a8c7073e..71bd3f78a6f2 100644
--- a/tools/testing/selftests/alsa/pcm-test.conf
+++ b/tools/testing/selftests/alsa/pcm-test.conf
@@ -1,4 +1,31 @@
 pcm.test.time1 {
+	description "8kHz mono large periods"
+	format S16_LE
+	alt_formats [ S32_LE ]
+	rate 8000
+	channels 1
+	period_size 8000
+	buffer_size 32000
+}
+pcm.test.time2 {
+	description "8kHz stereo large periods"
+	format S16_LE
+	alt_formats [ S32_LE ]
+	rate 8000
+	channels 2
+	period_size 8000
+	buffer_size 32000
+}
+pcm.test.time3 {
+	description "44.1kHz stereo large periods"
+	format S16_LE
+	alt_formats [ S32_LE ]
+	rate 44100
+	channels 2
+	period_size 22500
+	buffer_size 192000
+}
+pcm.test.time4 {
 	description "48kHz stereo small periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
@@ -7,7 +34,7 @@ pcm.test.time1 {
 	period_size 512
 	buffer_size 4096
 }
-pcm.test.time2 {
+pcm.test.time5 {
 	description "48kHz stereo large periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
@@ -16,3 +43,21 @@ pcm.test.time2 {
 	period_size 24000
 	buffer_size 192000
 }
+pcm.test.time6 {
+	description "48kHz 6 channel large periods"
+	format S16_LE
+	alt_formats [ S32_LE ]
+	rate 48000
+	channels 2
+	period_size 48000
+	buffer_size 576000
+}
+pcm.test.time7 {
+	description "96kHz stereo large periods"
+	format S16_LE
+	alt_formats [ S32_LE ]
+	rate 96000
+	channels 2
+	period_size 48000
+	buffer_size 192000
+}

-- 
2.30.2
