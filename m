Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A840E6EAC8A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318A1EC5;
	Fri, 21 Apr 2023 16:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318A1EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086422;
	bh=OtlEK7o2jDl7lioBNIX36Xoy3H/KPbhK1KCHW/LOiWs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YGbmW+znYrHwXQrdHeziRANyqrGz8N8I1ZIiEnh5cZpQNprCEkrB4ttwiChIfyZB4
	 YH9ywq2WyTAjTfJaAgKELVbDlZTnQvLXjgugxaNYUPzbst6I7dn/31CWDVix0OBTfE
	 nV9FlGmepggvpLjjfmbqhJGd5FvdYmypy2qaoL5g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F36F8057C;
	Fri, 21 Apr 2023 16:10:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC2B6F80567; Fri, 21 Apr 2023 16:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20E2FF80528
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E2FF80528
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D59A524257;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DaH-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: properly assert DSP init constraints
Date: Fri, 21 Apr 2023 16:10:06 +0200
Message-Id: <20230421141006.1005524-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZHUV25QNON2SVXY45KXIJVK5T4K6R3H
X-Message-ID-Hash: KZHUV25QNON2SVXY45KXIJVK5T4K6R3H
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZHUV25QNON2SVXY45KXIJVK5T4K6R3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If these are hit, we've already trashed kernel space. There is no
recovery from that.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6cf7c8b1de47..f6f05219f7fc 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1773,22 +1773,19 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	 * ok, set up done..
 	 */
 
-	if (gpr > tmp) {
-		snd_BUG();
-		err = -EIO;
-		goto __err;
-	}
+	BUG_ON(gpr > tmp);
+	BUG_ON(nctl > SND_EMU10K1_GPR_CONTROLS);
+
 	/* clear remaining instruction memory */
 	while (ptr < 0x400)
 		A_OP(icode, &ptr, 0x0f, 0xc0, 0xc0, 0xcf, 0xc0);
 
 	icode->gpr_add_control_count = nctl;
 	icode->gpr_add_controls = controls;
 	emu->support_tlv = 1; /* support TLV */
 	err = snd_emu10k1_icode_poke(emu, icode, true);
 	emu->support_tlv = 0; /* clear again */
 
-__err:
 	kfree(controls);
 __err_ctrls:
 	kfree(icode->gpr_map);
@@ -2391,16 +2388,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	}
 	    
 
-	if (gpr > tmp) {
-		snd_BUG();
-		err = -EIO;
-		goto __err;
-	}
-	if (i > SND_EMU10K1_GPR_CONTROLS) {
-		snd_BUG();
-		err = -EIO;
-		goto __err;
-	}
+	BUG_ON(gpr > tmp);
+	BUG_ON(i > SND_EMU10K1_GPR_CONTROLS);
 	
 	/* clear remaining instruction memory */
 	while (ptr < 0x200)
-- 
2.40.0.152.g15d061e6df

