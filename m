Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77E500996
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 11:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4BD170C;
	Thu, 14 Apr 2022 11:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4BD170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649928058;
	bh=TqgD68icMhsgG5FiomUxsnlNOKradkh5u6bGh1bp3qs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YI26l1r/dh/QRkYboYf6pWpZHRumoGQRVZMw7M15J6f6TBhhg+WxoxBJZYDSB6cRc
	 Fzdz+SIrCh4noRq3mjeZV4DuQ0NYAKi3RCSd6mfe0RPyNf9NbE62/ytoFABROwrGm+
	 88mYvbDJrWJ2fh5UAwoaLdXAJnVuEGQCfIqRHU2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFDAEF80114;
	Thu, 14 Apr 2022 11:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6371AF80162; Thu, 14 Apr 2022 11:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A43F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 11:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A43F80114
X-UUID: 19af92ff3eaa41ad9c77d4ed76c1d6fb-20220414
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8658021b-0be8-4d85-a32a-7515a3822e1b, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:8658021b-0be8-4d85-a32a-7515a3822e1b, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:d0435f78-0afa-4dca-bdec-ca54c998425a,
 C
 OID:ea95d75fe251,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 19af92ff3eaa41ad9c77d4ed76c1d6fb-20220414
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 135584740; Thu, 14 Apr 2022 17:19:43 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 17:19:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 17:19:41 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next V2] sound/oss/dmasound: fix 'dmasound_setup' defined but
 not used
Date: Thu, 14 Apr 2022 17:19:38 +0800
Message-ID: <20220414091940.2216-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

We observed: 'dmasound_setup' defined but not used error with
COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.

Fix it by adding __maybe_unused to dmasound_setup.

Error(s):
sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]

Fixes: 9dd7c46346ca ("sound/oss/dmasound: fix build when drivers are mixed =y/=m")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Cc: Takashi Iwai <tiwai@suse.com>

---

Change sinve v1:
 add fixes tag
 use __maybe_unused

---
 sound/oss/dmasound/dmasound_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 9c48f3a9e3d1..164335d3c200 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1428,7 +1428,7 @@ void dmasound_deinit(void)
 		unregister_sound_dsp(sq_unit);
 }
 
-static int dmasound_setup(char *str)
+static int __maybe_unused dmasound_setup(char *str)
 {
 	int ints[6], size;
 
-- 
2.18.0

