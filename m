Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC43DCA60
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 08:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9579A18B4;
	Sun,  1 Aug 2021 08:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9579A18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627799656;
	bh=3CbvtK5IwQntah6CSBa6xmE+PlO99bimxPn1j+6LQd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QSWXP5aGTHxi3m4VL2nAZ7ymQzZKHpE2OOQIft3FXRKgZT4J7SC8k2C5G194wBJ58
	 qM4t2hDcY/lnfMT7kNI1V71l0d0hAHLjnnLs03TVRzLoz4YYsoEYzRT2HKB9jhwg2z
	 UvZIiaxwPoZVnkGKdDSlk5kuOJIxLi2CyWPLQbbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C62F8032C;
	Sun,  1 Aug 2021 08:32:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A68DEF802E8; Sun,  1 Aug 2021 08:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D855FF8012E
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 08:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D855FF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="A/A2/uoq"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 023F83F051; 
 Sun,  1 Aug 2021 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627799559;
 bh=AUaRd4BS3iiGKLLSuJWn46Te1rChqiyKMssPEqtpXaU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=A/A2/uoqD7cAjEnl2Hap81woM5IfW4SZtVQHOn86i7DfjvzberuZBE4S2OadUjRfk
 Ywogy3sn6HyBwNGpxIA/cRp5WwUib+ofWlMYJNQl583LekPLpj8D+94VRP66kk8n6o
 zCTqXPLeta8S3gF16c6jOHkMzEzM8HSJh1zQ3rfp3INFRrVSfuR6LwNaJ/j6SmTg5z
 BkInryYKCy/bpCFl5dpL3sMbFUH9+W0i8xXPFt1aECXNxzVorrl93vM9EZW83NMGQZ
 gHGqdJWaUMnztfqlh8eyTFBCz6ChaXxSyKz3E3OYIB1cgatMxqc+1QVsjx4cZlb/wn
 iYwDpx2FojwYg==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rsnd: make some arrays static const,
 makes object smaller
Date: Sun,  1 Aug 2021 07:32:37 +0100
Message-Id: <20210801063237.137998-1-colin.king@canonical.com>
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

Don't populate arrays on the stack but instead them static const.
Makes the object code smaller by 242 bytes.

Before:
   text    data     bss     dec     hex filename
  23827    8764       0   32591    7f4f ./sound/soc/sh/rcar/ssi.o

After:
   text    data     bss     dec     hex filename
  23361    8988       0   32349    7e5d ./sound/soc/sh/rcar/ssi.o

gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sh/rcar/ssi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 27f34ca6059d..87e606f688d3 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -165,7 +165,7 @@ static void rsnd_ssi_status_check(struct rsnd_mod *mod,
 
 static u32 rsnd_ssi_multi_secondaries(struct rsnd_dai_stream *io)
 {
-	enum rsnd_mod_type types[] = {
+	static const enum rsnd_mod_type types[] = {
 		RSND_MOD_SSIM1,
 		RSND_MOD_SSIM2,
 		RSND_MOD_SSIM3,
@@ -228,7 +228,7 @@ unsigned int rsnd_ssi_clk_query(struct rsnd_dai *rdai,
 		       int param1, int param2, int *idx)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
-	int ssi_clk_mul_table[] = {
+	static const int ssi_clk_mul_table[] = {
 		1, 2, 4, 8, 16, 6, 12,
 	};
 	int j, ret;
@@ -1079,7 +1079,7 @@ static void rsnd_ssi_connect(struct rsnd_mod *mod,
 			     struct rsnd_dai_stream *io)
 {
 	struct rsnd_dai *rdai = rsnd_io_to_rdai(io);
-	enum rsnd_mod_type types[] = {
+	static const enum rsnd_mod_type types[] = {
 		RSND_MOD_SSI,
 		RSND_MOD_SSIM1,
 		RSND_MOD_SSIM2,
-- 
2.31.1

