Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AE4E8D13
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 06:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5F9D839;
	Mon, 28 Mar 2022 06:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5F9D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648441413;
	bh=HsNUC/lOpzkE1ztiUoBzx49nJmW3WjMDxc3CYz+Cr0E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e60E/EY092wihn//tyabp3urG2GEhT3Z/SdO9egzvhWkEWf+Eh+63xruEqUCQgWj9
	 8pY8/DuH1C0/DjOrQtKuzjpm/FSV+bPKo/EHVP2m8y6vrLbgKW8DU1jrTSO3RSdZMO
	 EUZ1FqLhuwNXjBYKXtV89XLXn2ynUCOJ+kJDHi1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29318F8026A;
	Mon, 28 Mar 2022 06:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D0EF8024C; Mon, 28 Mar 2022 06:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B49F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 06:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B49F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="JKHNBPNg"
Received: from localhost.localdomain (unknown [123.112.67.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D01343F74E; 
 Mon, 28 Mar 2022 04:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648441340;
 bh=BsTLSb6gtxXL6plxJNqRWBIxx/UAF1BqC++79zpxRes=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=JKHNBPNgOpKPXgNGSw1rJcevXGGjczOsGhvnyVbkZO/ohDD24qa6Cp4kIdo1B+JQL
 S0pT4Ra15VLaLOs4eyL+dcDcuxYvJL9Lv4S1CnY+T1xxKGDl+5WE9YnF3/MLuUngsm
 V0932yS9xnsGx02yiGVa6TXpOfrsEMAXl+HXjt4+cXnyLScvRPhacuSeaqSAhyOyxN
 3iKOx5xpieW7Dqp5PLRBrHQ5PYRu9FI8b4FjBzRSOcMCYi5qdJMiVOpe9N4wBO39+M
 Q7oGgl9jNn7C4DCKHsEHCOExMJhjiKIEfLhewar/G44rDzHQz4F542ouRu28DjrYCS
 Qh6/o9fKHVH1A==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs35l41: Don't hard-code the number of otp_elem
 in the array
Date: Mon, 28 Mar 2022 12:22:10 +0800
Message-Id: <20220328042210.37660-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328042210.37660-1-hui.wang@canonical.com>
References: <20220328042210.37660-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The CS35L41_NUM_OTP_ELEM is 100, but only 99 entries are defined in
the array otp_map_1/2[CS35L41_NUM_OTP_ELEM], this will trigger UBSAN
to report a shift-out-of-bounds warning in the cs35l41_otp_unpack()
since the last entry in the array will resuilt in GENMASK(-1, 0).

To fix it, removing the definition CS35L41_NUM_OTP_ELEM and use
ARRAY_SIZE to calculate the number of elements dynamically.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/sound/cs35l41.h        |  1 -
 sound/soc/codecs/cs35l41-lib.c | 14 +++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index bf7f9a9aeba0..9341130257ea 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -536,7 +536,6 @@
 
 #define CS35L41_MAX_CACHE_REG		36
 #define CS35L41_OTP_SIZE_WORDS		32
-#define CS35L41_NUM_OTP_ELEM		100
 
 #define CS35L41_VALID_PDATA		0x80000000
 #define CS35L41_NUM_SUPPLIES            2
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index d0a480c40231..30c720af98d0 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -422,7 +422,7 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct cs35l41_otp_packed_element_t otp_map_1[CS35L41_NUM_OTP_ELEM] = {
+static const struct cs35l41_otp_packed_element_t otp_map_1[] = {
 	/* addr         shift   size */
 	{ 0x00002030,	0,	4 }, /*TRIM_OSC_FREQ_TRIM*/
 	{ 0x00002030,	7,	1 }, /*TRIM_OSC_TRIM_DONE*/
@@ -525,7 +525,7 @@ static const struct cs35l41_otp_packed_element_t otp_map_1[CS35L41_NUM_OTP_ELEM]
 	{ 0x00017044,	0,	24 }, /*LOT_NUMBER*/
 };
 
-static const struct cs35l41_otp_packed_element_t otp_map_2[CS35L41_NUM_OTP_ELEM] = {
+static const struct cs35l41_otp_packed_element_t otp_map_2[] = {
 	/* addr         shift   size */
 	{ 0x00002030,	0,	4 }, /*TRIM_OSC_FREQ_TRIM*/
 	{ 0x00002030,	7,	1 }, /*TRIM_OSC_TRIM_DONE*/
@@ -671,35 +671,35 @@ static const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[] = {
 	{
 		.id = 0x01,
 		.map = otp_map_1,
-		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.num_elements = ARRAY_SIZE(otp_map_1),
 		.bit_offset = 16,
 		.word_offset = 2,
 	},
 	{
 		.id = 0x02,
 		.map = otp_map_2,
-		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.num_elements = ARRAY_SIZE(otp_map_2),
 		.bit_offset = 16,
 		.word_offset = 2,
 	},
 	{
 		.id = 0x03,
 		.map = otp_map_2,
-		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.num_elements = ARRAY_SIZE(otp_map_2),
 		.bit_offset = 16,
 		.word_offset = 2,
 	},
 	{
 		.id = 0x06,
 		.map = otp_map_2,
-		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.num_elements = ARRAY_SIZE(otp_map_2),
 		.bit_offset = 16,
 		.word_offset = 2,
 	},
 	{
 		.id = 0x08,
 		.map = otp_map_1,
-		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.num_elements = ARRAY_SIZE(otp_map_1),
 		.bit_offset = 16,
 		.word_offset = 2,
 	},
-- 
2.25.1

