Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16823C621
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 08:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 131EA1683;
	Wed,  5 Aug 2020 08:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 131EA1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596609691;
	bh=mcC39JN4gKVBif133L4KpVlV1mxSDSRHA4gReXq64pc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofag5ikt/NFOBUrLi4laJKcFWaX7qkaiVlt9EfhaAwut1wkQAj/tHdXYJTcty8WgD
	 UHRl6edNWAe2O3SU98jcqdgiJY2a1T770Wb94r81NmBSUw4pYtqSAYirJfpYbZfk6L
	 QkKFkq1oAAzpCEkHdSrsbgZlyswgy0xmOLAheaHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02172F802E2;
	Wed,  5 Aug 2020 08:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0135DF802BE; Wed,  5 Aug 2020 08:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04048F80124
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 08:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04048F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="IFdVIsfL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeUESxhZI0/cO7GsftvR612/kF8ofX3OJKSOpJprmb5GWd5IWJmFQZYZQxhOS5df2AN9oojTVXiIruPXXOaoP5o2QnY3ki280wfwenPp4QO/YGaHdCY/va4R+87t17a5pgHucc25sE/cx3xdYNtyhj+GElZ9HBg0gcGXWZo5fgIog0X3XoALHG5hfV6nUy1sx9hkfedOS4S+Ov47aUEkHp3g7YC7BJ/6wYCTyDR+z6sCCjckKFfXMeLaXBlhC7w5w6d6wnWDX8tHmp4NjzFilZbtnEMY74w7wdhPrTldv02m36kz3L5PLKsbEthjlg0Phh95S3MN92KqAR36/Ouc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0zMM0JhlzaXBePhSH+s1xb8PjeOUHkljWYyPZBV9FY=;
 b=HIpyKzgEpd0wDkW4nu+4cAsrUhWRe4lplowb5S/xm/pCeor1UYE8b1TC//F7idP6cMj3KwxV3E96rYsaWzsZ94gp1WwS4JJ3l8hjgC31BoVLFUcCFwyjAyvz5yKwiPt/yvlA10tDO3K79offz1e3Z0SyzpoUEJkV4ITpnGjxRKH/YO6Z3aySWdhKWToMH7W5K6ZIl/inMc72xGKXxu+lSkXoaQm2ktmJ9J9qioKVMEiZJ4nDRZyC50pHsC5ILoSoGpKtpZ3khbSQ041hbFFSrgfluxN6GnhiLoLz+j4xen8QZGiOqpsAVT4R8c6F8k5W6CJtCGBqPyyuK8EifR5jlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0zMM0JhlzaXBePhSH+s1xb8PjeOUHkljWYyPZBV9FY=;
 b=IFdVIsfLWNbSHKhU1/pqr7qxzfduiIf0njI/cxvMC5E/1cRN+eZJLWTWgrcd4w+y5DXalngNAMiJeCExRy3bBXPj7EMiEqgyUJpH1wTCufUP3WIq6rxrTmMWxpfw0RU/+RMGptpVl3o2jgvwP5oBJz1bFzkph23edw8GGyt4L+8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB3055.eurprd04.prod.outlook.com
 (2603:10a6:802:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 06:38:03 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 06:38:03 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ASoC: fsl_sai: Replace synchronous check with
 fsl_sai_dir_is_synced
Date: Wed,  5 Aug 2020 14:34:13 +0800
Message-Id: <20200805063413.4610-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805063413.4610-1-shengjiu.wang@nxp.com>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.67) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3261.12 via Frontend Transport; Wed, 5 Aug 2020 06:37:59 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e81d0715-3079-4b82-d699-08d8390a1a76
X-MS-TrafficTypeDiagnostic: VI1PR04MB3055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3055351D95B05C7A6789BF62E34B0@VI1PR04MB3055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/hWTrDqxUBo6+pCDII9E5M1mpVafJORP4Ka0aCU44nHZGw9SsbQrY++hNjgMoafxa/6BXNQlvDQEtjnfA+mqaZMppYDYrlQBthdZ9Y9MYR4Ep2+NYJpbaPAA5Iyz0Hh1jbfwqjD/+RLnxG+dMhGtDY/GXAF8OKzY+r3a+IYhajXglx7W3lr21DCpYEk+TLSPVcRn+e1LLtxNroW1740F36Zakgxvbt8k5gEaHGbU6HXnI34P3B/9/N2kOymzT97X8FHBcQ/uxt7cj3rq4xYl1y8JWKBBwdPW3OJwDV/ld3C7kd8CE449B4BqeunGVl6fKv3XkINvBqjyDw+AEWOYxCV/1gR46UhpWxD1E6VdkVmnkuM5fUlj9h1vNu6e8Rx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(36756003)(2906002)(44832011)(26005)(86362001)(6506007)(16526019)(186003)(956004)(2616005)(1076003)(5660300002)(6666004)(7416002)(6486002)(6512007)(316002)(8936002)(8676002)(52116002)(478600001)(66946007)(83380400001)(66556008)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7nDoisJfWUDRAgJWXkTnmJrFfXd1rZVNRDEfO+Slf736iQN9WwaS35nJBYq0hmslMmYsN6zKLxWEQwr/OSHC8ZWY9LG0x0q4pL/bsOWEMXiqAYaCI7UxTeLN4WqjD1II4VEAfvGX/xoc6Ifn1m3urQ5BGEho5XnxohQO96F7Or09xNBFtnpoUFGhnH2InCXvT3vR7cKJZ17uqrE0HdsgmnOZI4Y7WdKdqcsVPwtxY110tkiJW1Y4M5qd0WnfTy58CARVSlS3EUhVszNdXLUrRgdknssKwGnM+4j+7hGWbko0yPpxIz1NchCnXxrk2KmxJbsLsixtw7u6y+3WgnCx2MkKTSyqKdwkFZqQnQ7tyUn75utiKzL6P7DQb0twvb4fhOvz7ph3ZyFHqMVihbZJNh4HhyXLU8tEr8gwj4qZdNb7F9DLxPA6sgbfOLVKv9fL/2CHqg3AxFEj0TLQ8jMHQxsFnDF5XYCkdkmX3pzIjG6St/WsLY36CVGKcXFoCu1xykOc8Mn3GYH6dIawlqdFfgHOseIKgwJNUo8YzqV/kIBmaQo/BFU4MLkg3IL9fMnbg5lFELbUPeK1BhblYES3cA5IQNRwRlBTiHke2xKkYMI1itz+0YHmA7FrimX0sgJxnw3PKP70BEzJ3Ah7CnyQNg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81d0715-3079-4b82-d699-08d8390a1a76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 06:38:03.1725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9a+lMgDUdkUEC8RRBUQCB8BDZZtsPZnKui9OCI0vz+nO15EExXV33hPvpjaIhqjsUyGXgNiDz5MppOYiJ4xnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3055
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

As new function fsl_sai_dir_is_synced is included for checking if
stream is synced by the opposite stream, then replace the existing
synchronous checking with this new function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 334090d581ae..f6969a5d49e3 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -350,6 +350,8 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	unsigned int ofs = sai->soc_data->reg_offset;
 	unsigned long clk_rate;
 	u32 savediv = 0, ratio, savesub = freq;
+	int adir = tx ? RX : TX;
+	int dir = tx ? TX : RX;
 	u32 id;
 	int ret = 0;
 
@@ -408,19 +410,17 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	 * 4) For Tx and Rx are both Synchronous with another SAI, we just
 	 *    ignore it.
 	 */
-	if ((sai->synchronous[TX] && !sai->synchronous[RX]) ||
-	    (!tx && !sai->synchronous[RX])) {
-		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
+	if (fsl_sai_dir_is_synced(sai, adir)) {
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(!tx, ofs),
 				   FSL_SAI_CR2_MSEL_MASK,
 				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(!tx, ofs),
 				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
-	} else if ((sai->synchronous[RX] && !sai->synchronous[TX]) ||
-		   (tx && !sai->synchronous[TX])) {
-		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
+	} else if (!sai->synchronous[dir]) {
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
 				   FSL_SAI_CR2_MSEL_MASK,
 				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
 				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
 	}
 
@@ -442,6 +442,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	u32 val_cr4 = 0, val_cr5 = 0;
 	u32 slots = (channels == 1) ? 2 : channels;
 	u32 slot_width = word_width;
+	int adir = tx ? RX : TX;
 	int ret;
 
 	if (sai->slots)
@@ -491,22 +492,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	 * RCR5(TCR5) for playback(capture), or there will be sync error.
 	 */
 
-	if (!sai->is_slave_mode) {
-		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
-			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
-				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
-				val_cr4);
-			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
-				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
-				FSL_SAI_CR5_FBT_MASK, val_cr5);
-		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
-			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
-				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
-				val_cr4);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
-				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
-				FSL_SAI_CR5_FBT_MASK, val_cr5);
-		}
+	if (!sai->is_slave_mode && fsl_sai_dir_is_synced(sai, adir)) {
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
+				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+				   val_cr4);
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR5(!tx, ofs),
+				   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
+				   FSL_SAI_CR5_FBT_MASK, val_cr5);
 	}
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
-- 
2.27.0

