Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6091308C4
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:31:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768FA184E;
	Sun,  5 Jan 2020 16:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768FA184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578238262;
	bh=VHPYlqJzmQQJnCAbDZrfVmmDYd7sEX4/h1n3a+PNopw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8rmBYVMuMp2eUzFq7ehJP/9aI3qwlz05TlWEqsctEKWAPuPKfufiTQDxMVx9dKaC
	 kKy8ylegUoXKjsSWERhlv2sTYytYSHrBxzAMNr1ReEx8+p2uuBw2dRCJdoUzjB9/3u
	 fqp042PGaQf07CD3wXryQTRilzwEW6B1tqRUnUac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFE4F805CB;
	Sun,  5 Jan 2020 15:50:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35877F803F3; Sun,  5 Jan 2020 15:50:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D9C3F802E8
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D9C3F802E8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 021ABB2CF
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:21 +0100
Message-Id: <20200105144823.29547-67-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 66/68] ALSA: pdaudiocf: More constification
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to the static table for verbs.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
index db3cd459b954..5537c0882aa5 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
@@ -179,7 +179,7 @@ int snd_pdacf_ak4117_create(struct snd_pdacf *chip)
 	/* from AK4117 then INT1 pin from AK4117 will be high all time, because PCMCIA interrupts are */
 	/* egde based and FPGA does logical OR for all interrupt sources, we cannot use these */
 	/* high-rate sources */
-	static unsigned char pgm[5] = {
+	static const unsigned char pgm[5] = {
 		AK4117_XTL_24_576M | AK4117_EXCT,				/* AK4117_REG_PWRDN */
 		AK4117_CM_PLL_XTAL | AK4117_PKCS_128fs | AK4117_XCKS_128fs,	/* AK4117_REQ_CLOCK */
 		AK4117_EFH_1024LRCLK | AK4117_DIF_24R | AK4117_IPS,		/* AK4117_REG_IO */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
