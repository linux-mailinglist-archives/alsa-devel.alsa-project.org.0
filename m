Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDE4E96D0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 14:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 247DB1896;
	Mon, 28 Mar 2022 14:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 247DB1896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648471055;
	bh=UxMpTLRGPMz2qHyNkFy5ODJEVfN2/AyFlChGZuBTV8E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6EA0eVINoakFLrzy+ii7LuI3VTF7PmD6hCa7h7KBdnCuwSU2e0WHPL6SSSKBGeCC
	 Y+/NQEcYVEESHuvXtb7zfpczzLCq7wIs7zZ8KtpgSRcSzOYscgbhbrhhtfVi45T5Uh
	 3jdpBVgnP3lU916SLKhy8JdJJv4orj6PiATvqhSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E15EAF804DA;
	Mon, 28 Mar 2022 14:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0040F800FA; Mon, 28 Mar 2022 14:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBDB0F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 14:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBDB0F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="fTyrNGcH"
Received: from localhost.localdomain (unknown [123.112.67.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2E9083F76E; 
 Mon, 28 Mar 2022 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648470957;
 bh=c9mWB7np2oC4r0d0gBYtyYpvC9n2rRBgCmhBecVFV/o=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fTyrNGcHEUYXNUrdp5kxQc+Shmx/Qb7hhG+4sP4jJm5C6YF42PC15XcCIirjINRZa
 p37D1tyovJbbNc6C0/VLl49UMnHIHgaNLdBNUt219Dw6jE1yzijFHoltBgz+Ont92f
 7MdicT40tjaB51m9eB3lw48c/7AVuMyP+5TmH+iqY8IXwGSQjieLLOlnN4ku3Xo/y6
 lAVt5isMVyeCxx9m+f4QcyIwfQgy9Eqk6dr7wbuVDYmwECoUW2DgOgY4YIiz6DHtOt
 TWRxtypi8gR2oOf84NJHSxKT9HjvmV3CZW1OSmZhJR7YmC5x1VmQgLgA/6/wHdEQrb
 N1WoyZuOyQFSg==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH v3 2/2] ASoC: cs35l41: Fix an out-of-bounds access in
 otp_packed_element_t
Date: Mon, 28 Mar 2022 20:35:35 +0800
Message-Id: <20220328123535.50000-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328123535.50000-1-hui.wang@canonical.com>
References: <20220328123535.50000-1-hui.wang@canonical.com>
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
since the last entry in the array will result in GENMASK(-1, 0).

UBSAN reports this problem:
 UBSAN: shift-out-of-bounds in /home/hwang4/build/jammy/jammy/sound/soc/codecs/cs35l41-lib.c:836:8
 shift exponent 64 is too large for 64-bit type 'long unsigned int'
 CPU: 10 PID: 595 Comm: systemd-udevd Not tainted 5.15.0-23-generic #23
 Hardware name: LENOVO \x02MFG_IN_GO/\x02MFG_IN_GO, BIOS N3GET19W (1.00 ) 03/11/2022
 Call Trace:
  <TASK>
  show_stack+0x52/0x58
  dump_stack_lvl+0x4a/0x5f
  dump_stack+0x10/0x12
  ubsan_epilogue+0x9/0x45
  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
  ? regmap_unlock_mutex+0xe/0x10
  cs35l41_otp_unpack.cold+0x1c6/0x2b2 [snd_soc_cs35l41_lib]
  cs35l41_hda_probe+0x24f/0x33a [snd_hda_scodec_cs35l41]
  cs35l41_hda_i2c_probe+0x65/0x90 [snd_hda_scodec_cs35l41_i2c]
  ? cs35l41_hda_i2c_remove+0x20/0x20 [snd_hda_scodec_cs35l41_i2c]
  i2c_device_probe+0x252/0x2b0

Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
Reviewed-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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
index 810643be13a4..9aa2b8948c61 100644
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

