Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E963CC44
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 01:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA8816CC;
	Wed, 30 Nov 2022 01:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA8816CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669766951;
	bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jR7afd3/qxINNnQoZdQahVPq2IzMvrDs9Oo5l5EDcjUEDKQIOzwfwYpaOJNdaJzrI
	 LPU1GN4z+FKLprE8Sq5Kkm+hG3aMH75I5bP/JF0U1PfgHlEn5dRzVlfmBeL6CcdJkp
	 j7TFljqJO9FQERV4t2FcgH9UfoOatT6xLVv/hFrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A390DF80578;
	Wed, 30 Nov 2022 01:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD7B4F80558; Wed, 30 Nov 2022 01:07:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACD57F80482
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 01:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD57F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F/iVjO3e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A731B819A2;
 Wed, 30 Nov 2022 00:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6097BC433B5;
 Wed, 30 Nov 2022 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669766820;
 bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/iVjO3eQ6O5SgF4L+pW9wQc9nwBwqAboxcJv9JEJRFeJ/drWcxPH5BBlqDfHhqA3
 kGABAq+BeP9U+y+XPW8m1PQszD+9pGLFw3E5MLA6JaFZM1jZupLKV73IbVEgXhYGlM
 BVPqPjREhoNqRbxPga1qUP247txfym8MPKg94sFUtigBGDRpoY7qDp51eR5Uroyjrm
 KwH3JtqnreECU67fSnB7BY6tnQ0R4wMJ4kg9bf0pL6RJ5AlxNR4bqA3LEqQrJ8xikp
 miueaeBcBuTclKcS4XBE5C0KrbVkMRa/opcJmVUE+Uo6q/Oedb7+IGrJy6s9UQkYMw
 2Hnf6XyRvGCnQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 4/6] kselftest/alsa: Don't any configuration in the sample
 config
Date: Wed, 30 Nov 2022 00:06:06 +0000
Message-Id: <20221130000608.519574-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130000608.519574-1-broonie@kernel.org>
References: <20221130000608.519574-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=broonie@kernel.org;
 h=from:subject; bh=Kn+BswH7rAycY9VeynvDcjRtACgC1wb2IYiNOSjS+Q8=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhuS2eXnZc4R1tCP8b77YUvVbKE7uxMflSW0cHPYavxjNPyp4
 eEl0MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATUShg/2eYF78weJ3a86ZGpnfu5i
 /kv7SciZHoYFb9teXqbmZJzc96i4qK6hNql027XRo8//srOTlb75gTF0SzU+3Xm9ma+mczPNqrJLXF
 rdblc+xU3X/rW+/mf5leOKPQJ/q19mORXQ5BARZ/ysr0OKUFWs+HGDxLirX4zbcgMtju8Ruxt2+/GN
 vPcWl9KMkdduSYkImZ0/vAFbwbxZsDorsX8BxpfhLAX7OuM+5AYZNW0Jrf2Svr+lcXBLo2vrz4WuIE
 V6+QzM974ldOsHJpT3u69IBIbwWzaBiL5KKn08V38vAJa8dtqpPfq2stFb3i5VyPA15BU7ZvfbDJ7/
 nzD/Lsj+4U8R7/XNARmCVSd3ItAA==
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

