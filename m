Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18183DCA6B
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 08:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B6918AF;
	Sun,  1 Aug 2021 08:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B6918AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627800583;
	bh=6KC0P1o1JwyliJV47gIQ7tC2naJvCXH/IQZyUIUCe5g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NWTlE+DOVqJe8CIL4U3TpVmROh60+hGjTI3fTBttwXQ6Wvuzwg5ka4ZTOMKtGjEYE
	 WYdfHDBlEbRJhiKbcc1l0Nsqyrf6mCzGccyUr/rRIzgcvR/mXBVp2IScYKfk+BMOnx
	 GHn5Yf2hQXy/3Iy0xeJwJE5CldtzVHn7/kQRnra8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8152FF8032C;
	Sun,  1 Aug 2021 08:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3D17F802E8; Sun,  1 Aug 2021 08:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B3A7F80095
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 08:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B3A7F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="fHFoVul2"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B43CB3F10D; 
 Sun,  1 Aug 2021 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627800487;
 bh=oI3Kd0QjwSYwaV+e2/loeSN2Q26jSUvl0TRKj83+fR0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=fHFoVul2hFXNQJr1+O1H2SguDMaj9sMH2AbZgbkqNrIgkO8b8XjpfnZtoMEpZJuXs
 xWtUSfAiU2x//vAYpi4wy7TnbcitEtZ20+3Zd/DdvVxCDN9hzXYstEjX3C1pTL+rMQ
 d3D2uIbHOxtwwBu6Rk3Yd7JtXfCv//KfaO94VviUUWYkpwVnDm0bzyN0aHWbP3l7rd
 fRSB6Mg/WblSBIQXtOnHkM+xESs7KhL8cqArhert9DGq9EFuza7Esgq4s3xyOEzkQt
 sOFS2YE79bQ5QThCy7BYja7EOFhzWR6qqZLXBlcvXAhqh40htkcyhHzH7ipDPOk+7g
 jeh85t57qFnFA==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320aic32x4: make array clocks static,
 makes object smaller
Date: Sun,  1 Aug 2021 07:48:07 +0100
Message-Id: <20210801064807.138641-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array clocks on the stack but instead it
static. Makes the object code smaller by 316 bytes.

Before:
   text    data     bss     dec     hex filename
  63668   28264       0   91932   1671c ./sound/soc/codecs/tlv320aic32x4.o

After:
   text    data     bss     dec     hex filename
  62616   29000       0   91616   165e0 ./sound/soc/codecs/tlv320aic32x4.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 254a016cb1f3..d31ffb6d5b4b 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -714,7 +714,7 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	unsigned long adc_clock_rate, dac_clock_rate;
 	int ret;
 
-	struct clk_bulk_data clocks[] = {
+	static struct clk_bulk_data clocks[] = {
 		{ .id = "pll" },
 		{ .id = "nadc" },
 		{ .id = "madc" },
@@ -878,7 +878,7 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 {
 	int ret;
 
-	struct clk_bulk_data clocks[] = {
+	static struct clk_bulk_data clocks[] = {
 		{ .id = "madc" },
 		{ .id = "mdac" },
 		{ .id = "bdiv" },
@@ -994,7 +994,7 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	u32 tmp_reg;
 	int ret;
 
-	struct clk_bulk_data clocks[] = {
+	static struct clk_bulk_data clocks[] = {
 		{ .id = "codec_clkin" },
 		{ .id = "pll" },
 		{ .id = "bdiv" },
@@ -1144,7 +1144,7 @@ static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
 	u32 tmp_reg;
 	int ret;
 
-	struct clk_bulk_data clocks[] = {
+	static struct clk_bulk_data clocks[] = {
 		{ .id = "codec_clkin" },
 		{ .id = "pll" },
 		{ .id = "bdiv" },
-- 
2.31.1

