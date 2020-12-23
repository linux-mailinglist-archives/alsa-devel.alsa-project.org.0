Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FC2E1FF7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:27:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF12D17B9;
	Wed, 23 Dec 2020 18:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF12D17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744454;
	bh=azDgIRXuMzM20wQxMLD89QtpIjKA4ZlUA/AE21j3u8k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HC4IpqbStzYriiEyBl8RJMAPT6jq2x8waOsx/DyxjYFL6hbeSX1ZlmCQShzDxjp9C
	 Bb6zlNGDTxn5s0l3BX9kJD/EhHRd/k5DLpxgUSdW4S+xOQPnx1Z3lw6yu/elzcmTuH
	 tnhPwuqkb0pqwU8p2GtZUBjkWITN+xp4Cn0Alz4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B5D6F804FA;
	Wed, 23 Dec 2020 18:23:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 715BFF801EC; Wed, 23 Dec 2020 18:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD04CF8021C
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD04CF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="as+fadmV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=KBuBNMEHzysXWx241zOq5QF/81jau2QOPh7AB7vvToU=; b=as+fadmVswFvdkuXW+MTRk/dGa
 vZutXfPbXCvQL3YLPIU3doK8wJPOREJpwAp2Vi/pxiwTxypA4+G459dOTftl2S8x22B1OohNgWv1p
 wwU8M8c3rki7fw6/l0IyuzZ/R2yeY+DJofJFbzuby4vjAl38OMyB0WB9PrSOenVCScrcGRi8vcNge
 Qe2x0u+t6mnd1/mgnhC3I+DXG1WcSRwSs1VSkX/GyIp9oxqeqZs1bb3bgn1zH8sfxGObG3McDQUoo
 ye/g2WqQf/56tbMbfF2TwxcaHhkSRsoUvuvegTx33BoE/0Wb/nd9lOEDUUqDNmtikDXsCszbuiofe
 iDRPEtkQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qt-000Euq-LL; Wed, 23 Dec 2020 18:23:07 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-Hi; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 10/18] ALSA: lola: Use DIV_ROUND_UP() instead of open-coding it
Date: Wed, 23 Dec 2020 18:22:21 +0100
Message-Id: <20201223172229.781-10-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_UP() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@r1@
expression x;
constant C1;
constant C2;
@@
 (x + C1) / C2

@script:python@
C1 << r1.C1;
C2 << r1.C2;
@@
try:
	if int(C1) != int(C2) - 1:
		cocci.include_match(False)
except:
	cocci.include_match(False)

@@
expression r1.x;
constant r1.C1;
constant r1.C2;
@@
-(((x) + C1) / C2)
+DIV_ROUND_UP(x, C2)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/pci/lola/lola_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/lola/lola_clock.c b/sound/pci/lola/lola_clock.c
index fdb85f256ed5..cafd30e30913 100644
--- a/sound/pci/lola/lola_clock.c
+++ b/sound/pci/lola/lola_clock.c
@@ -135,7 +135,7 @@ int lola_init_clock_widget(struct lola *chip, int nid)
 	}
 
 	nitems = chip->clock.items;
-	nb_verbs = (nitems + 3) / 4;
+	nb_verbs = DIV_ROUND_UP(nitems, 4);
 	idx = 0;
 	idx_list = 0;
 	for (i = 0; i < nb_verbs; i++) {
-- 
2.20.1

