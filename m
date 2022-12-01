Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB363F603
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:13:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE9D17BF;
	Thu,  1 Dec 2022 18:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE9D17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669914786;
	bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkNOMnHV0uiDQLFzW7rT0aGsBx7w595PZ9VdZB3hlmjYwHKa55tNYHOPGevwzrASl
	 noxdp6eLkEa9ypNoq7XYY2Oh1xWWYdBzoaRydNveGlNTDnBvYQLZjJ288HD5BRr701
	 KjRivgb3c02y1096BhKPYPqhR/k3lgheEVsPZQWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD77DF80579;
	Thu,  1 Dec 2022 18:11:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F151DF80558; Thu,  1 Dec 2022 18:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E800F80557
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E800F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CkRtaRQp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EEB5B81FAF;
 Thu,  1 Dec 2022 17:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028FAC433C1;
 Thu,  1 Dec 2022 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669914662;
 bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CkRtaRQp6x7iwTvF6XjTffEjvgtpwLH/Se4dvQttOtl6J4dv5C99vVHBYoYYNTSDQ
 92iI4DDI1OPIJU2mTOqNcJ6K+4HMdGLROxTbDCFqj6TkiOh5/jHVCVI1MBSwv/MRN+
 A1nWEq9Bm9sC3zhgHywWgPEpTle6Wt/DvvhRLPlIc8+70iORa3UCY+XGasu5hT2ynT
 AIOSC5CqZDxTNdrKCO+tdYMnuxan7Flc5wt6F8qYkl5bOovsj7geYBhYApjr+ePlMw
 0curbL4zE5cMwEfxhMPs0JExBqU8q5aXp8TRFZ955RAVWfDrEH5vEr0sbNagVLHzNy
 FA9z3iPOYH7jA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 4/6] kselftest/alsa: Don't any configuration in the sample
 config
Date: Thu,  1 Dec 2022 17:07:43 +0000
Message-Id: <20221201170745.1111236-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201170745.1111236-1-broonie@kernel.org>
References: <20221201170745.1111236-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=broonie@kernel.org;
 h=from:subject; bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiN9fa5wTLCtYT9notHr7El4eyPGnYoYICD8o+gE3
 8SBIShiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4jfXwAKCRAk1otyXVSH0K+vB/
 4jhJBvtqbxPvVCaIt3Nmv4O/SMt/nFZjEiK40mVWdP6p6cZtuMufcWu0yElXfkHqdlM5GfHlK0JKY4
 YjcbKzMos2akkn1OQFWcZOkg2Qy6FAnuqgzz9wZ7gT7SNmjLfr/r8o5xXbzqWpRX3b2XWyAwTNPezF
 DRgrajELlpmgJ7IbNK44+8vV2+bjQhMuFD38xNbHiWeuDSbLt0pt9dFbPVva9lFqX14eYIY0q693Py
 3t7l9r4BtGrbDiw5PQnFmeJ4+Gx8ZkLe7dkSI4rGaoOPIkKxbSqXinOTswgolGhjV+mxX+P6TABT8G
 /Gx2Uv8VblE2QYnzx5jx98HXDnbFXG
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

The values in the one example configuration file we currently have are the
default values for the two tests we have so there's no need to actually set
them. Comment them out as examples, with a rename for the tests so that we
can update the tests in the code more easily.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf b/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
index 0a83f35d43eb..9eca985e0c08 100644
--- a/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
+++ b/tools/testing/selftests/alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf
@@ -39,22 +39,25 @@ card.hda {
 	#
 	pcm.0.0 {
 		PLAYBACK {
-			test.time1 {
-				access RW_INTERLEAVED	# can be omitted - default
-				format S16_LE		# can be omitted - default
-				rate 48000		# can be omitted - default
-				channels 2		# can be omitted - default
-				period_size 512
-				buffer_size 4096
-			}
-			test.time2 {
-				access RW_INTERLEAVED
-				format S16_LE
-				rate 48000
-				channels 2
-				period_size 24000
-				buffer_size 192000
-			}
+			#
+			# Uncomment to override values for specific tests
+			#
+			#test_name1 {
+			#	access RW_INTERLEAVED
+			#	format S16_LE
+			#	rate 48000
+			#	channels 2
+			#	period_size 512
+			#	buffer_size 4096
+			#}
+			#test_name2 {
+			#	access RW_INTERLEAVED
+			#	format S16_LE
+			#	rate 48000
+			#	channels 2
+			#	period_size 24000
+			#	buffer_size 192000
+			#}
 		}
 		CAPTURE {
 			# use default tests, check for the presence
-- 
2.30.2

