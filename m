Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B485763CC47
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 01:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49DCD16DF;
	Wed, 30 Nov 2022 01:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49DCD16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669766983;
	bh=SZHDVz1meOtVOiMtc7gqDxDlymHtQ6CtxKd4qfqfgaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OggbQX5xyoCWTHhDsUS3BX3mmzuBRyE43ORNSOTskVR0DRnVwq0gypU8vTi/9eFZe
	 bF8dULUMIZjLswvLLS1rx39nP287kNCQIdPNeHYWZw97M60Vy9/M/rsKZIg7SYsiMK
	 8LN4D8NYQfLuZ+rlQ3qwwDG/F0MG10wJ48KsVfYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B95F0F80580;
	Wed, 30 Nov 2022 01:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD9CF80566; Wed, 30 Nov 2022 01:07:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5066DF80557
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 01:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5066DF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tPhFm/Rz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FB8461983;
 Wed, 30 Nov 2022 00:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1194FC4347C;
 Wed, 30 Nov 2022 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669766824;
 bh=SZHDVz1meOtVOiMtc7gqDxDlymHtQ6CtxKd4qfqfgaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tPhFm/Rzn35CIuHoM6Kgsoh5DKPiQHfbzJx5SwxcOGOneYc9CYHFA7bk0L3nxELuA
 T6YLnzy0TSak9OyZFGt/JuT2uwToUhZ58/6dRIEQV4RFbk87XPdnq2fsMpDHzv7wqj
 lxK4zuuLgnuj8DHu9F+PDEEBEes+riNjojaZahmnJ+7FDQeD8Tvl0nkFS5liwmj9q5
 +1pO42XnWJmjnvO+Daa1Ja+kyQdyfqK10cKpT9n9j6gimEQkzAUQMfktuHYu2eSzhr
 /L8+yxHYjNUHOVd25N9aK96NZVP2JpmI9HHvTCqXvP58TyXrIPNrFGnGV55AR84wz8
 kGkbXf2pqHx4g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 6/6] kselftest/alsa: Add more coverage of sample rates and
 channel counts
Date: Wed, 30 Nov 2022 00:06:08 +0000
Message-Id: <20221130000608.519574-7-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130000608.519574-1-broonie@kernel.org>
References: <20221130000608.519574-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=broonie@kernel.org;
 h=from:subject; bh=SZHDVz1meOtVOiMtc7gqDxDlymHtQ6CtxKd4qfqfgaI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjhp5w0bk3EujAlnTerYvqQ9S/R8ox+IZVeJcICXIK
 wwlnRFWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4aecAAKCRAk1otyXVSH0CllB/
 sGS7q4vmYVJutEyNKuqLI/KUoHy9Q6FnDhS5uiUkaQsAaHDzOWu5oJ4cV0eoMbV2AIysL6J1+y2Rj8
 Pmn93CcKhqva/XJCgoIDYiQ0aiR9tkzRMo8tuiGhtUYD+UQ9dkzLDXB2kiYZRzUxpATphPmburf24u
 e7uvG+ciBZQGml/WT+Taz+LFOjvVC/vG71NeZCEbJAzjeAhhc+5mYD+5RbKxMAJwSPNb04tnNBHn98
 zziqRYeBHd0U/x/kMUbOD3GAsOQb19bhEcV8ZKYLT+gyDmdct3NPcDnUUOPo4WzI2hjiyBx54Pzpy6
 35DLesB6oimXgjzPA4gbkIIFS/bJe7
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

Now that we can skip unsupported configurations add some more test cases
using that, cover 8kHz, 44.1kHz and 96kHz plus 8kHz mono and 48kHz 6
channel.

44.1kHz is a different clock base to the existing 48kHz tests and may
therefore show problems with the clock configuration if only 8kHz based
rates are really available (or help diagnose if bad clocking is due to
only 44.1kHz based rates being supported). 8kHz mono and 48Hz 6 channel
are real world formats and should show if clocking does not account for
channel count properly.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 614ccc52cece..d76a6f15ce25 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -517,8 +517,13 @@ static void test_pcm_time1(struct pcm_data *data,
 
 static const struct time_test_def time_tests[] = {
 	/* name              format     rate   chan  period  buffer */
-	{ "S16.48k.2.small", "S16_LE",  48000, 2,      512,    4096 },
-	{ "S16.48k.2.big",   "S16_LE",  48000, 2,    24000,  192000 },
+	{ "8k.1.big",    "S16_LE",   8000, 2,     2000,   16000 },
+	{ "8k.2.big",    "S16_LE",   8000, 2,     4000,   32000 },
+	{ "44k1.2.big",  "S16_LE",  44100, 2,    22050,  192000 },
+	{ "48k.2.small", "S16_LE",  48000, 2,      512,    4096 },
+	{ "48k.2.big",   "S16_LE",  48000, 2,    24000,  192000 },
+	{ "48k.6.big",   "S16_LE",  48000, 6,    48000,  576000 },
+	{ "96k.2.big",   "S16_LE",  96000, 2,    48000,  384000 },
 };
 
 int main(void)
-- 
2.30.2

