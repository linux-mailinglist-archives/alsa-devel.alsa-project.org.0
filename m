Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24D63FCEE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 01:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3528E1833;
	Fri,  2 Dec 2022 01:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3528E1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669940666;
	bh=IS7rd7rcz6gVpwRJ0tJXC7rhdgZaY2/fgyU9ObJPI5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNOaSJzj3CBZp26Vb3JH9qbchYLxPN+u31RCaXI76pJE8tPdngK9PUQ9XDdZNt9r8
	 zUoyQVJdgFe8LMSQwHIsJ+31QAKBzOqeXG5tbNaL9ZslQ9KaknbUy+QW0pyCz0D4dJ
	 4OQMJUglmseyfuDjp6Rz8CyFIQ00ePSPHRIRzVmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA67F805A1;
	Fri,  2 Dec 2022 01:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 593BAF80118; Fri,  2 Dec 2022 01:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73FCF80118
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 01:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73FCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KWdLTbyZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5706B621DF;
 Fri,  2 Dec 2022 00:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6066EC433B5;
 Fri,  2 Dec 2022 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669940493;
 bh=IS7rd7rcz6gVpwRJ0tJXC7rhdgZaY2/fgyU9ObJPI5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KWdLTbyZw6FD2y1dEc0h4hUfAw8464ePoanpcVIdyrak4PprQq8PxsPn1UUcrc8Sc
 Q9f7PApwg5oS/44kZo9xNhUVZoDfig2BV4mrEPgycamJTz/5j4w/LYT4qzv1pva5T4
 XuWyJZ53ebqkEQxhV2nN57oezbGJuNAQFjjZlMQorXzZJQ/52TLOuW+869yh+6m3dT
 gRYBUu5WpdXEzcK+1/2MtjQXNypRcirjhPZwpSfL1Ut+oIC8M5mrDla9oS49UAjVvG
 7XXEnhr88ICj6O8Gdxle+wE7l9Vh/8J6B30mAwPDYrVLZqdepUGHEDyzfHFVfwUz6S
 dFo7TwUUqXJgg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 7/7] kselftest/alsa: pcm - Add more coverage by default
Date: Fri,  2 Dec 2022 00:17:49 +0000
Message-Id: <20221202001749.3321187-8-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202001749.3321187-1-broonie@kernel.org>
References: <20221202001749.3321187-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=broonie@kernel.org;
 h=from:subject; bh=IS7rd7rcz6gVpwRJ0tJXC7rhdgZaY2/fgyU9ObJPI5Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiUQsmgfNGHKOyR2nQQ0g8wGVV9lgyN9d+BfKhoRB
 DB3xuZaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4lELAAKCRAk1otyXVSH0PtDB/
 4gY8OkdnwpR37jPZrDF0R/dLp0g3ttzwQz0tuLDVznS8yA3Mo4Mf82os5jYW27sKRp6h0m6Ok25Q4R
 z4EV0mSsg9TVhikFfGZ46cDGtIY255Lx5sTxymEBPxXWn8NqoGpNrCkKVf7ek2dAnPnHuor8wJsm3S
 r8kRHRgnxoiypLVvapPXg20t8WoO93oFixEC/wTiX6wnhyVmjp6zdSaWYMGLA9oVVDNh4Q68rwlgwA
 KpigtY/fdow0SZOsJ06ZTrehq6XH5yzHSFhPnk/r9/R508sEZKYU9vllaswIrQLPf3wcM5OgXFGBtP
 RcNDRE8WHC4H9dvJdtUJ5VvQFe1VcZ
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

Add more coverage to our standard test cases:

 - 8kHz mono and stereo to verify that the most common mono format is
   clocked correctly.
 - 44.1kHz stereo to verify that this different clock base is generated
   accurately.
 - 48kHz 6 channel to verify that 6 channel is clocked correctly.
 - 96kHz stereo since that is a common audiophile rate.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.conf | 47 +++++++++++++++++++++-
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

