Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3154571213
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 08:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 896D784B;
	Tue, 12 Jul 2022 08:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 896D784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657605694;
	bh=WXVKoqkpjD6WomZtLeOtJw1OmfRXUR/s6oqZb3jcxX8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ucUmub4PpXNBt70hcPiYwvL2h3cdCOi4foySuAJtD8u68Uta68Bhs02klCrD7Wz3o
	 5leQPq1zeVO9uzjbRSw8dkaLT4otD7BuUcfQg02/MJ3tsVhZBmtIcKFjzgr8izTMvj
	 P6Yy7XVZXiggEYgQKQitr9UN3ElfHG0YosmvL4EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD322F80279;
	Tue, 12 Jul 2022 08:00:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10163F80246; Tue, 12 Jul 2022 08:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98767F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 08:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98767F8012B
X-QQ-mid: bizesmtp69t1657605612tslowixw
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 12 Jul 2022 14:00:07 +0800 (CST)
X-QQ-SSF: 01400000002000G0T000B00A0000000
X-QQ-FEAT: 8mvwyB2Dxk9RiwgK9+fAaoojQwPmzq6NU9cN3uF3lUWLk7SlBvwoIdeI51YTe
 ST+HpJ17tKOBtfx/Pc1hCww1UvZKC18SbfTE3CJqsLjLLym50L9RmWmZRMYlWWe8PSkojB/
 LAMuKxAw1cNYaU2rRUL8j+I8GA3TS3jSn1S2OVTxinKgxXWVDn43iAceZ3GEIk9IF5f4iYP
 OPRXiVyc9sj8B3zuVVgmuVudxsLk8QjOT+jfg8Y2se3MUX9HOX9dum65g8I43YEpc4hECc7
 olGDdzIgfLFkQb1j1Z5FPJDd2SHnySKPqyGIGgphrv2sewvwwq4cQqcuuhsib+B9frgfQ3r
 uqfp7uEfX5kRSTya87t2V17+tjnzfNBLQcr9SC86W+JRA90qKfUV5igUDJxBA==
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, tcrawford@system76.com,
 kai.heng.feng@canonical.com, tanureal@opensource.cirrus.com,
 cam@neo-zeon.de, kailang@realtek.com, sbinding@opensource.cirrus.com,
 andy.chi@canonical.com, yong.wu@mediatek.com
Subject: [PATCH] ALSA: hda - Add fixup for Dell Latitidue E5430
Date: Tue, 12 Jul 2022 14:00:05 +0800
Message-Id: <20220712060005.20176-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
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

Another Dell model, another fixup entry: Latitude E5430 needs the same
fixup as other Latitude E series as workaround for noise problems.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fe7c1194d052..ecc737342fcc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8896,6 +8896,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
+	SND_PCI_QUIRK(0x1028, 0x053c, "Dell Latitude E5430", ALC292_FIXUP_DELL_E7X),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
 	SND_PCI_QUIRK(0x1028, 0x05bd, "Dell Latitude E6440", ALC292_FIXUP_DELL_E7X),
 	SND_PCI_QUIRK(0x1028, 0x05be, "Dell Latitude E6540", ALC292_FIXUP_DELL_E7X),
-- 
2.20.1



