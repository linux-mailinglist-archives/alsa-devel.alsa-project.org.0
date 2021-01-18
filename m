Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3672FFDA9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FE81AAC;
	Fri, 22 Jan 2021 08:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FE81AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302182;
	bh=4rsRcBsp9E21l4mrs6L246IEEVm2X4kwcAyC5TbizF0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dFa2JW/p2dVIg2lXvgX0Ap93oeqrr8ok+tqlIMxr5icBYomJn3ejVX4izwD3+ATMh
	 AzxQFMCOMtPwxHtEa72OuOzoIGi8xGlEjdy1ocTSvHCnkwbfSk4hL23WOxTp5eXd8c
	 JQyV64pJ8cVHPy2/4Y/sm06C21jiwSzIVe/S4Gag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F95F80166;
	Fri, 22 Jan 2021 08:54:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E1CF8016E; Mon, 18 Jan 2021 09:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B16DF80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 09:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B16DF80137
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UM3Lpls_1610958471; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0UM3Lpls_1610958471) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 18 Jan 2021 16:27:58 +0800
From: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] sound/pci/hda: boolean values to a bool variable
Date: Mon, 18 Jan 2021 16:27:49 +0800
Message-Id: <1610958469-65856-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:37 +0100
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, pegro@friiks.de,
 linux-kernel@vger.kernel.org, gustavoars@kernel.org, bo.liu@senarytech.com,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
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

Fix the following coccicheck warnings:

./sound/pci/hda/patch_conexant.c:570:2-20: WARNING:
Assignment of 0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 sound/pci/hda/patch_conexant.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index d49cc44..f2aa226 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -567,7 +567,7 @@ static void cxt_fixup_mute_led_eapd(struct hda_codec *codec,
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_eapd = 0x1b;
-		spec->dynamic_eapd = 1;
+		spec->dynamic_eapd = true;
 		snd_hda_gen_add_mute_led_cdev(codec, cx_auto_vmaster_mute_led);
 	}
 }
-- 
1.8.3.1

