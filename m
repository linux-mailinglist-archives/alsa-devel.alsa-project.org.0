Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ACA94248B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 04:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C29DA4D;
	Wed, 31 Jul 2024 04:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C29DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722393737;
	bh=u5QbBOsv0qQWNCKCfryxh7VHTlVZB5DaCf9udjhHYmI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F9NbilzylwaDFiEYoVbBaY0BbzKQ1IFhPSPbkq8ckAKtFks45obOI4YVd3kJGwpH1
	 MQ0i+VQ+8hBHWN5JvLdj1fxQJdHeUTXOEFSNrGLJ5p7Aysq7BEPLcCHM5QJMJVqDB9
	 lP6dMFtcBQnRC0GXUdZdEXlZ26ZgxsIz81sbNjPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2232DF8057A; Wed, 31 Jul 2024 04:41:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C86FF805AF;
	Wed, 31 Jul 2024 04:41:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4555AF802DB; Wed, 31 Jul 2024 04:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E10E3F8007E
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 04:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E10E3F8007E
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WYblY1pqTzQnMR;
	Wed, 31 Jul 2024 10:34:33 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id D2C50180101;
	Wed, 31 Jul 2024 10:38:51 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 31 Jul
 2024 10:38:51 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <jonathan.downing@nautel.com>, <piotr.wojtaszczyk@timesys.com>,
	<vz@mleia.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <yuehaibing@huawei.com>
CC: <alsa-devel@alsa-project.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ASoC: fsl: lpc3xxx-i2s: Remove set but not used
 variable 'savedbitclkrate'
Date: Wed, 31 Jul 2024 10:29:49 +0800
Message-ID: <20240731022949.135016-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)
Message-ID-Hash: HNIVIYVE53KZRCSNKXSXT3HGXPFQPGGR
X-Message-ID-Hash: HNIVIYVE53KZRCSNKXSXT3HGXPFQPGGR
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNIVIYVE53KZRCSNKXSXT3HGXPFQPGGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The variable savedbitclkrate is assigned and never used, so can be removed.

sound/soc/fsl/lpc3xxx-i2s.c:42:13: warning: variable ‘savedbitclkrate’ set but not used [-Wunused-but-set-variable]

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index af995ca081a3..62ef624d6dd4 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -39,7 +39,7 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq, int xbytes, u3
 {
 	u32 i2srate;
 	u32 idxx, idyy;
-	u32 savedbitclkrate, diff, trate, baseclk;
+	u32 diff, trate, baseclk;
 
 	/* Adjust rate for sample size (bits) and 2 channels and offset for
 	 * divider in clock output
@@ -53,14 +53,12 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq, int xbytes, u3
 
 	/* Find the best divider */
 	*clkx = *clky = 0;
-	savedbitclkrate = 0;
 	diff = ~0;
 	for (idxx = 1; idxx < 0xFF; idxx++) {
 		for (idyy = 1; idyy < 0xFF; idyy++) {
 			trate = (baseclk * idxx) / idyy;
 			if (abs(trate - i2srate) < diff) {
 				diff = abs(trate - i2srate);
-				savedbitclkrate = trate;
 				*clkx = idxx;
 				*clky = idyy;
 			}
-- 
2.34.1

