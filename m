Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53BB107B4D
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Nov 2019 00:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205761854;
	Sat, 23 Nov 2019 00:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205761854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574465338;
	bh=pEo3idgc8xadc6lh0ueLdRPvZuaTTFdqnxEwE5/W5Ak=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B13/tnGQTsb0UiBcpPOqYMyogiqI1JdB1IyoNkYZLbdClWlPTQYWvrZgwJ+9BWz1L
	 ubQ2ORyZsGG/rnHgqeWFONBo4QUDZ+8Z3Jeygf0UXsWtDkMoXSkHFPllxS9eDnUrN2
	 dziW3BA61I2U6f/v/9eSiXWjlLx713/DXJ/aEk+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBABF8013F;
	Sat, 23 Nov 2019 00:27:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82614F80140; Sat, 23 Nov 2019 00:27:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42852F800EE
 for <alsa-devel@alsa-project.org>; Sat, 23 Nov 2019 00:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42852F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="e+PaxCeV"
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D510723CF6;
 Sat, 23 Nov 2019 00:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1574465226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yPu+usdTMaBaw0ZFV5ndDgVLntK9TwEKvBhp47O63LA=;
 b=e+PaxCeVa0VVHHfBSnL6lLpBiRdU8xUAzEXcepo0hNXvwAbbUBIEzo1Pb7zDUj83APBPuy
 JpYuIM2mi9wgjiFeli0r3PK7TJGvzWQ1REK48f1Te1QHDangLmWOdi7HdqpepOZv2IUFgG
 mXwCAdgOlim1lv29++kRZe0Hwyk4nAg=
From: Michael Walle <michael@walle.cc>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Date: Sat, 23 Nov 2019 00:25:32 +0100
Message-Id: <20191122232532.22258-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: D510723CF6
X-Spamd-Result: default: False [4.90 / 15.00]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM(-0.00)[-0.522];
 FREEMAIL_CC(0.00)[gmail.com, kernel.org, perex.cz, suse.com,
 opensource.cirrus.com, walle.cc]
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: wm8904: fix automatic sysclk
	configuration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The simple-card tries to signal the codec to disable rate constraints,
see commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when
shutdown"). This wasn't handled by the codec, instead it would set the
FLL frequency to 0Hz which isn't working. Since we don't have any rate
constraints just ignore this request.

Fixes: 13409d27cb39 ("ASoC: wm8904: configure sysclk/FLL automatically")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 sound/soc/codecs/wm8904.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 7d7ea15d73e0..5ffbaddd6e49 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1806,6 +1806,12 @@ static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	switch (clk_id) {
 	case WM8904_CLK_AUTO:
+		/* We don't have any rate constraints, so just ignore the
+		 * request to disable constraining.
+		 */
+		if (!freq)
+			return 0;
+
 		mclk_freq = clk_get_rate(priv->mclk);
 		/* enable FLL if a different sysclk is desired */
 		if (mclk_freq != freq) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
