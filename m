Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB52600148
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 18:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D39159A8;
	Sun, 16 Oct 2022 18:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D39159A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665937576;
	bh=zkLz+ch7FU8rPzpdgNM1u/gj0vonxP6e7fZkN6ttmTQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDDl+ICY829iF7zDRXqbyDMCHSGTRTz7DrqFwDeM4tLAb3fNH0nYWnDW6CkwZREWX
	 Btst77/1aPYxQvWWQjUrLFXj3p4t0oXPPMcdYaIlmxx52gqT9qP9ZQ4dRcFgZKYqUQ
	 gWYLtISAQaH3nCf3sNtHB16wMEqTRJJ1I2Fqeq1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D01F8027C;
	Sun, 16 Oct 2022 18:25:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF0FF800F8; Sun, 16 Oct 2022 18:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA06FF800F8
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 18:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA06FF800F8
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:166:9ae8:9d22:15bc])
 by albert.telenet-ops.be with bizsmtp
 id YgRB280021KXA1b06gRBlU; Sun, 16 Oct 2022 18:25:11 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ok6Rq-001oFR-IZ; Sun, 16 Oct 2022 18:25:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ojz5j-000MFM-DJ; Sun, 16 Oct 2022 10:33:51 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ricard Wanderlof <ricardw@axis.com>
Subject: [PATCH] ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in
 __exit_p()
Date: Sun, 16 Oct 2022 10:33:50 +0200
Message-Id: <3225ba4cfe558d9380155e75385954dd21d4e7eb.1665909132.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
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

If CONFIG_SND_SOC_TLV320ADC3XXX=y:

    `.exit.text' referenced in section `.data' of sound/soc/codecs/tlv320adc3xxx.o: defined in discarded section `.exit.text' of sound/soc/codecs/tlv320adc3xxx.o

Fix this by wrapping the adc3xxx_i2c_remove() pointer in __exit_p().

Fixes: e9a3b57efd28fe88 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index baab320ef98879d7..a969547708d49676 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1449,7 +1449,7 @@ static struct i2c_driver adc3xxx_i2c_driver = {
 		   .of_match_table = tlv320adc3xxx_of_match,
 		  },
 	.probe_new = adc3xxx_i2c_probe,
-	.remove = adc3xxx_i2c_remove,
+	.remove = __exit_p(adc3xxx_i2c_remove),
 	.id_table = adc3xxx_i2c_id,
 };
 
-- 
2.25.1

