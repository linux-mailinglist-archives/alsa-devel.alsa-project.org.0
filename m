Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A74E603E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:20:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EA117B7;
	Thu, 24 Mar 2022 09:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EA117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648110038;
	bh=WuS1dqI6IbjT4uRDDUf0Lmlobeyk16PlXybnSMX9W94=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJfWtCrDZW/CEYFZLluanjIMNV7cnv4OP1+EsikF0aV5HUlGRmAm8stFZbYIr6C6Y
	 DzBgv09XEe1g7962C2RV60/mP5Kuu0hrhjTpR3zGtmx6ipATRu0/Bpo3aj6e55AEFy
	 PvHmcvnRK0d2rr6+T0PQsJbt0XffDmOjfw4p+NWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C96F804CA;
	Thu, 24 Mar 2022 09:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C96DF804C3; Thu, 24 Mar 2022 09:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C498F80154
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 09:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C498F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="potzM8oM"
Received: from localhost.localdomain (unknown [10.101.195.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6FE1D3F663; 
 Thu, 24 Mar 2022 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648109932;
 bh=2fcTaBoBIASIf1cif015U/SCeUaMEYKHNqPlujojgKk=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=potzM8oMmumIR4duqkhLMk7g4UmJ1/H3C/zEg0UO3TOjwwIPytgY6ZkqPU1RObB0v
 quMc158F+uhaWK60wmgsrRkskRgbR1laObw4Vo5jnNTceroCtwo+PWYCd8jv6VtD9r
 TWqQewQwYK+73JS3ZSzAwtQPmvN4117+XJuHy7AcltkRUsi1sfG/WJF5Qi7lMrGuDq
 /LWDq8GBTJ99DCIKk4JIWVZIOsJd1JLOhXjsSKaCAmorY8CT0Bbo1mzN1Yi+4FpVOo
 RGFj/pcx4M4LiuLLff/ANjlMKSKXmymzT0izYbdqH3mcnrbtc8kxv/AG9Ajq+S3JzE
 uYusT44DpYKww==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l41: Fix a shift-out-of-bounds warning found by
 UBSAN
Date: Thu, 24 Mar 2022 16:18:39 +0800
Message-Id: <20220324081839.62009-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324081839.62009-1-hui.wang@canonical.com>
References: <20220324081839.62009-1-hui.wang@canonical.com>
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

We enabled UBSAN in the ubuntu kernel, and the cs35l41 driver triggers
a warning calltrace like below:

cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 8, word_offset=23, bit_sum mod 32=0, otp_map[i].size = 24
cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 0, word_offset=24, bit_sum mod 32=24, otp_map[i].size = 0
================================================================================
UBSAN: shift-out-of-bounds in linux-kernel-src/sound/soc/codecs/cs35l41-lib.c:836:8
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

When both bitoffset and otp_map[i].size are 0, the line 836 will
result in GENMASK(-1, 0), this triggers the shift-out-of-bounds
calltrace.

Here add a checking, if both bitoffset and otp_map[i].size are 0,
do not run GENMASK() and directly set otp_val to 0, this will not
bring any function change on the driver but could avoid the calltrace.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/codecs/cs35l41-lib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index d0a480c40231..aa6823fbd1a4 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -831,12 +831,14 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 					GENMASK(bit_offset + otp_map[i].size - 33, 0)) <<
 					(32 - bit_offset);
 			bit_offset += otp_map[i].size - 32;
-		} else {
+		} else if (bit_offset + otp_map[i].size - 1 >= 0) {
 			otp_val = (otp_mem[word_offset] &
 				   GENMASK(bit_offset + otp_map[i].size - 1, bit_offset)
 				  ) >> bit_offset;
 			bit_offset += otp_map[i].size;
-		}
+		} else /* both bit_offset and otp_map[i].size are 0 */
+			otp_val = 0;
+
 		bit_sum += otp_map[i].size;
 
 		if (bit_offset == 32) {
-- 
2.25.1

