Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371D25FC78
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 17:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1538017D4;
	Mon,  7 Sep 2020 16:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1538017D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490827;
	bh=gGmPo0rlpMEGrQGaxCoLa2kxZkWjzMZUDEuPjznIhvU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ry3ArIOR/vrseTor6UdpFIZ5mcOohUHo8sQYO1j3NL5GFt2pmum1VjyV5uM8sR5Ao
	 +nrB/Vc3gdZr3Ea7D0qbNsLsifbb+U8v616eEN1VJubykrxaT8rT+FblFdOIvCs0dI
	 +as8b1tFe8v0jGFfEemyMwgdgPE96h2+UbJ0q2ZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DBA4F8028B;
	Mon,  7 Sep 2020 16:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A9CFF80227; Mon,  7 Sep 2020 15:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, MSGID_FROM_MTA_HEADER,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255086.outbound.protection.outlook.com [40.92.255.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC6D7F800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 15:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC6D7F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="Jem9FxZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js78pOZ4pYWnyHAu6RUmHVCN0IloHkXCZzm0ZjSNjiWVpbeOSUym1KkI/P+K1tJv5gZ76PyjQo/je1y5F2weGF7vvCq2ujeRs0RUTM00V1brAOigKvJ6E+kVWNPLFRWN+iYGaEpMbyT42SLrsttbHm2kgAQrQsGwjXxtJKwdxaDUjwwb/s1/zc400uTFEJPg5CJb/JndK+DUGu2KVO0T9EnR2IYGtYkjIOuyP6Nq4586MA6EehZcSQm5yWBQVo8IVENMEqhgOFLvoZFvn3J4U4HRm+u+TWJm8LH7ly6SRinUN19MjMyhnN/jzTIEiTGD/7ouzCBTMc1c0kLSYE1j9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM++dEIvB1D6MZvpG9mUZiNZaEEB6SGlisJUyHaGXqA=;
 b=HCxSit34cvK0MlrVd0wkZTXVmQRfsXgoSFZiTYBT8lMKMLoHvdQUC6KQT+1EJzejMGsTxQRNuYYja1cL0nJltQdihietSeMV3dIjHJ9PTuQzTlLfdC+tBtkKXwvUGSO/HFTeyEfBTz4BWojHtss/ekyCgAAf0Fcqd9gZBpNJfcenSMvH4Ttk8UAvQ4Pxy5AdARnZiKNQNc0Sfn7hpVK2boNAKQBtU6HBzh0HHGZUmles2sCEH5PEZffwE9pjmbPO8d4wcroIq3zYI8fMPcRq9bOpUhqPiji/EM8mZLB48rRcHCXhssbsow1S2QYojAXN5ohhZqW4scQQm5R6Bh3mVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM++dEIvB1D6MZvpG9mUZiNZaEEB6SGlisJUyHaGXqA=;
 b=Jem9FxZ1dG1iVo7+K4ivX+2X/qwz9tmYN2xW2nF59kU1Th99kL5te7yMAHct2eN6H0vJZVOtkhVya2ajBA4unrgZ40wGyx3NFq9N9tSFeiHZTXSjK1ZLzZzz456ZU4hqmo6I5zBstyMVBRz4Vuq9l3rHXMYXIr5H5WBjY6TTo97l/t2D9WZgg8A+ImFKpfVDmYYzHAHffNxuiUEJrtoyC7W00PDAJIiqDDG454QlH4ukXRAucwOIIe8sBX83sowWWi3K63pr4fQRKFM4AzxNgKbDw/6Gjj2wNU1h/L8nYsThq1PJ/anRSOb319WMcWVV8fnfggC+sVKlE7pQwi9tQQ==
Received: from HK2APC01FT011.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4d) by
 HK2APC01HT102.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::291)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 13:10:14 +0000
Received: from TY2PR04MB4029.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::46) by HK2APC01FT011.mail.protection.outlook.com
 (2a01:111:e400:7ebc::153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Mon, 7 Sep 2020 13:10:14 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B6E8F06CE9A02A73162C4D2DDE247661788504803B6EDEDEAD9F6063A94F1B77;
 UpperCasedChecksum:3BCD6C970AB85451360DD602DF6B751DF150374E86099C5F102DAFF5775664CE;
 SizeAsReceived:7641; Count:46
Received: from TY2PR04MB4029.apcprd04.prod.outlook.com
 ([fe80::f89c:3b41:cc1b:bf10]) by TY2PR04MB4029.apcprd04.prod.outlook.com
 ([fe80::f89c:3b41:cc1b:bf10%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 13:10:14 +0000
From: Tuo Li <tuoli96@outlook.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 heiko@sntech.de, islituo@163.com, baijiaju1990@163.com
Subject: [PATCH] ALSA: rockchip_i2s: fix a possible divide-by-zero bug in
 rockchip_i2s_hw_params()
Date: Mon,  7 Sep 2020 21:09:37 +0800
Message-ID: <TY2PR04MB4029799E60A5BCAAD5B7B5BBB8280@TY2PR04MB4029.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To TY2PR04MB4029.apcprd04.prod.outlook.com
 (2603:1096:404:8005::13)
X-Microsoft-Original-Message-ID: <20200907130937.8571-1-tuoli96@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oslab.tsinghua.edu.cn (166.111.139.154) by
 BYAPR08CA0018.namprd08.prod.outlook.com (2603:10b6:a03:100::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Mon, 7 Sep 2020 13:10:08 +0000
X-Mailer: git-send-email 2.17.1
X-Microsoft-Original-Message-ID: <20200907130937.8571-1-tuoli96@outlook.com>
X-TMN: [4iHdCKPT0OLf+f0DeaUlQVsAZGFSHNHYbHoR1SjYg2U=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f30e2ed6-ea85-48ca-d6b5-08d8532f5b2a
X-MS-Exchange-SLBlob-MailProps: 6H6McBavlAgH38auFqsg93Z/iiafy1GfONNCBBwmamBg9zvLbel49YlABEMf84D08WhkwY5HHi1m6kKeaKlAxZFRQUCdP8eNnzb9cvcBbOoX5dBHgfwEhchGwJ98XQCm+zNgNu962yB8lwZCnH2tGKHK2Kt/ydBwjuKOac0EWfMeaM2LXwqVjCli07aN9N6jRygjOVSTkHwCtdJPACFwokMnJOe1QPlkCiKeDU2RnNdNwlxsVCPq5fVEfuedLWALDJSkC2/RQSJrrnWQFe7Zs77hlXzGFX84aQWmgv1J5eW5soH5Ofo1Nz1iEdirji/BnCQr0ZSBE+keqmtzo0NTAoQxrMBwbIOyejF2gVeWs2UqZ79XaeDVaAmINt/dx5mJFqEiKsPFjAqHvDS7ikas0oYrPs7ty2vg728Mn58kOsj6NNLvWZ2KSuUBv/P1Dk+ZO0D5/TFQKgcLr91QMZwJzsomVoC9ev583H8FPb3dvT7owKvJaRWP+YyM8gDhH9edK6RHdRV4Zp7EVIrH5Kk7V+oix+UDwdPiVBUMAqi0FvoPxa+FUEuK2qwklBLGrxgy4IXb1knQsaPQFFjUw1fWQFR/Ip9mOISO0BOYZhuq8YONugpiBROS2xkcCMuFwms7PRrAk88dpdUhYEunmVLUnI7KQuwsY37hL60Era0GskXHJXZwMLKiAu0qbw+5uEQ77DkFb0qsqNfdLcSRC2wlzjEWE1/p090Pp/7L0kvoBQUwWUB7kA2r5rfxpQR+5FUIp7QeMj7X1pA=
X-MS-TrafficTypeDiagnostic: HK2APC01HT102:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uK//X/gBgyTWRKyZ2pQnRmwZax/lmb2B5oCxGwvzQpky8lPmxfDD77tQRyVid/ouH4PeubsNsuckYpd1kODKN/AS2lx8QLqjDsJYakkXWdlB8Bu3DxQzbNTnhhhgwkNnMboD5rkCX/4/gocSiey0fEP12J0h95YspLzxZ1xtGhNINgG5NX0dNY9b6fsyE71PmQY9+MqT1h1fk/Y/UnRqAg==
X-MS-Exchange-AntiSpam-MessageData: StIP0lYp7vK9bq505sJvfNu2x/y7S0UX+ulC4ZV78Dv2DE+go86ju//zs9qih7mK1/2fP7zXQ6d+MdEiBQ8c4U8Z1Tc+0izZzSDZ/ne//cfwIJzOfILKOixk89VcOis+LKwcC6JjV52q0uGkHRZV8w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30e2ed6-ea85-48ca-d6b5-08d8532f5b2a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 13:10:14.3403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT011.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT102
X-Mailman-Approved-At: Mon, 07 Sep 2020 16:59:34 +0200
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Tuo Li <tuoli96@outlook.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

The variable bclk_rate is checked in:
  if (bclk_rate && mclk_rate % bclk_rate)

This indicates that bclk_rate can be zero.
If so, a divide-by-zero bug will occur:
  div_bclk = mclk_rate / bclk_rate;

To fix this possible bug, the function returns -EINVAL when bclk_rate is
zero.

Signed-off-by: Tuo Li <tuoli96@outlook.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index d1438753edb4..593299675b8c 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -279,7 +279,7 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->is_master_mode) {
 		mclk_rate = clk_get_rate(i2s->mclk);
 		bclk_rate = 2 * 32 * params_rate(params);
-		if (bclk_rate && mclk_rate % bclk_rate)
+		if (bclk_rate == 0 || mclk_rate % bclk_rate)
 			return -EINVAL;
 
 		div_bclk = mclk_rate / bclk_rate;
-- 
2.17.1

