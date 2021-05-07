Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82991375EDE
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 04:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186551686;
	Fri,  7 May 2021 04:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186551686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620355622;
	bh=+q6U/Anj73vSf2VC3igbgxCg/JYoGu+7lUl9pJgbc3g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BH9PJ4AlCk6HXYDUT29UbILFkvAaUmoNOwKjE/zbG4svDsPwXwmMRUa79pyAQB1a5
	 PrhOC9pzX3ERcm0VeN/Agu9JIO8iR14QAwFa2CygxPA8y62zL5tvNOCJK7w9jGrgNw
	 DrrX+2X1Sy/oFNoYOgwRG+1xhh5osFnWtU+o93ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1175BF80268;
	Fri,  7 May 2021 04:45:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C948F8025F; Fri,  7 May 2021 04:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A6D5F80105
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 04:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6D5F80105
Received: from [123.112.70.57] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <hui.wang@canonical.com>)
 id 1leqUP-00058x-VI; Fri, 07 May 2021 02:45:19 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kailang@realtek.com,
 stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: reset eapd coeff to default value for
 alc287
Date: Fri,  7 May 2021 10:44:52 +0800
Message-Id: <20210507024452.8300-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
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

Ubuntu users reported an audio bug on the Lenovo Yoga Slim 7 14IIL05,
he installed dual OS (Windows + Linux), if he booted to the Linux
from Windows, the Speaker can't work well, it has crackling noise,
if he poweroff the machine first after Windows, the Speaker worked
well.

Before rebooting or shutdown from Windows, the Windows changes the
codec eapd coeff value, but the BIOS doesn't re-initialize its value,
when booting into the Linux from Windows, the eapd coeff value is not
correct. To fix it, set the codec default value to that coeff register
in the alsa driver.

BugLink: http://bugs.launchpad.net/bugs/1925057
Suggested-by: Kailang Yang <kailang@realtek.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d58f24c9702..a5f3e78ec04e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -395,7 +395,6 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0282:
 	case 0x10ec0283:
 	case 0x10ec0286:
-	case 0x10ec0287:
 	case 0x10ec0288:
 	case 0x10ec0285:
 	case 0x10ec0298:
@@ -406,6 +405,10 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0275:
 		alc_update_coef_idx(codec, 0xe, 0, 1<<0);
 		break;
+	case 0x10ec0287:
+		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
+		alc_write_coef_idx(codec, 0x8, 0x4ab7);
+		break;
 	case 0x10ec0293:
 		alc_update_coef_idx(codec, 0xa, 1<<13, 0);
 		break;
-- 
2.25.1

