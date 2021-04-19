Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEBF36479C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 17:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF041688;
	Mon, 19 Apr 2021 17:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF041688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618847980;
	bh=Y5q59Y6PR1f2cyKIT61eldRaAd4aVKiPY6SPqnC0g9c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QfUBeTtQY6LDEbklSeZi/4SRB7HIeRJ5+Jx6CMcOhe7CcrvArpeoF62rI3rznwmNM
	 HVPLw87Jgc0i+Of6+Bscy2o9cemTLJ3thSoK50FhaXZS6mWQBf9vTikwgw1zQ2RJ3Q
	 yzf/z+4u/c0LTJG0UGNpbxpbCVjJyR32bKWzqihw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 797B8F80274;
	Mon, 19 Apr 2021 17:58:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 394EAF80276; Mon, 19 Apr 2021 17:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn20818.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::818])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF4EF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 17:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF4EF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="pfqEkmsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0dGiYLObjEcZXcUImiLhmVGOGq0tGrF6b+5By41CHbCVax69jzt3nOZBK+Qi3AV+PHw6V8aFERNgf/ZfSRsdQ7t3V8Uh73v0xDBpby0qqDfxyemPJcPIkzTYFtmV/IDUk8/3PZ5D8mu2KE6g2Fr6cKDMAwuSfgmI7yjOar+2843ZoMxFGspobJ/fqh22ZSNJv+WkE3qc2RYCbhKGSsj+GqqEEpOxFeHK6m6s1b+3ZbdGLTtDPD0JfKbV8s+5lv7YVnXgx1MSv08ekS3+9TEo48NYcyZ7CuUvMvXOwFsHncgJWMQXAuRArMB4Yw6lW3iwAnijRQ0u/hSAYgcckYkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByzEHp9ovlis/GooH0HTomT5X3u/nCY542tbrjpHAA=;
 b=jZxZnGWQQFvyovmdGf4hYSi7OgOVpDRFr7GbrVKuVHqkI5cn8VPDz+6yW64o/DdCoLTKvi0G5IrzNGlPs0LK3RA41j5V/DlcyihXbEa2ZKEYB7iqcaPvCg18L+N2oWswB9MPpsWVzRL8Wrcc43a/rcrPyLLvA70bxoPOBRuq3k3e9rUvp0SDvDsjM/KwibK7gWzZQG0FSHvi9TVGBGnaqw1TZRSEQoPoNbkAxbmCIkHArnxhpN8K5JLhf7NYjIFjWFptTqa64z75cDmlcdgjLbp3ktPMN1wVyxo9X//YubpRl2Ihxt74MJObt9sDOQxr2guu75Uha+k5TwLhu+CwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByzEHp9ovlis/GooH0HTomT5X3u/nCY542tbrjpHAA=;
 b=pfqEkmsYQxNsuhnDK/5gH8jH75SpqyrcNX4l0Tx7tZVUlva2WoDLLub5xxEXmoGH7Sn8ywK2m3Eqxiq5FT6RTF71crQbAxOIlU7qjBs0dpyDl9fadgh0+l7n+9hrgFRe/VXMJL2VuHPndOySTFaSzsr/Gjj2c37u5O/BPWbDQjFUij5cMAhlxFRNFzF+8tWbHm3giQ538m9Vk9Lxnu1FWp94wPlkNHNAvRQ9195+T339i1fgsv90mp2bJvtE07Iaoqghk8wMe6HChZVomydtY/nme2uwe1KlcbM6K4CFxFg8pzss91Z8opL3mYnph4R9Gf4TGI32MJU7I9IH7vjo1Q==
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::4f) by
 DM6NAM11HT052.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::478)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 15:57:42 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4d::40) by DM6NAM11FT058.mail.protection.outlook.com
 (2a01:111:e400:fc4d::216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 15:57:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DCFD92C1B093BCEDB66465C4D37F56F8ECD874D5865BC7607FF6BDA39879A808;
 UpperCasedChecksum:B0C0D632416DC4D01E90D30C6E8FF6AA335B0047516695DED6D9209122061662;
 SizeAsReceived:7563; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 15:57:42 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [v6 1/3] mfd: Add Rockchip rk817 audio CODEC support
Date: Mon, 19 Apr 2021 10:57:16 -0500
Message-ID: <SN6PR06MB5342B036562B085C95BDAB42A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [9fLmyeWXp9nZ3TreEksinp+RfcOEPz8c]
X-ClientProxiedBy: SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210419155718.17348-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR2101CA0015.namprd21.prod.outlook.com (2603:10b6:805:106::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.3 via Frontend
 Transport; Mon, 19 Apr 2021 15:57:41 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3a99f36e-3cd7-499a-da57-08d9034bdd62
X-MS-Exchange-SLBlob-MailProps: c2lCoQNu4ID10AyVGR+QpJizbz6bHfbmEHAusOCIqeHD3RSgxdbzCEtrKMcb2/B6/n0uH+l43AWM8mUFJQP9yxvlhRj/jfxUfkxhGPiGt+VmJfAdtao6oba1kaqjhsbbVCtlEEKFdeDgin9bhh2pbTMwfAnU/M4IKhl3C/2GZQh5Ws8Q01XMn4eBHDa8+/RcDo2pXYKGSzuV1ZAIXrRpwtajD3JUXeemRe32Q9oLh5YLXyHx6BIng7PPILZs7kKPyt+aGmKVAOcwHGTEdW0XmQYIZit+LBKbtY0QQ6PJsfJKZg7EhQsjZR2SgPdRoN3FVqp+JxtLtCFhzvgJcKa+tmjOEz7sPVWOwzu3waD+WLjLbFpS5UQfQh0fUef0YIUF8mCqeG5B7TmxNeZv3+40bt7hLQMa+Fv4qO/z4pIK32QZ0Yb097nP5bKPPVE9NXSlzU4pAjtNAoLwYILS47AIBH/OidBCTQ0PXk7YWdvmW9pPcYuAhR0iISudncJcVvAafEvx+Lt5xl/eaWFNhUZTYRyOtq2VvLbEkNchL5fLNBUS/AosmXmoegJJopyfU9a5RzWTMazsorXDT7Ri+a66bbToeKbcBbbcVEfd914/DtWrQQ9GFmuehKP53XlQbm3ca6cAptmjoF/prpjuUzcWOofUZF5X2cxYa5e9+IkPKeG9W+CDfvA93n02LRedky6t/G4b6+YHNhE2OOVSH5MecTA1lJp0DLtznsKZo4/EF0M=
X-MS-TrafficTypeDiagnostic: DM6NAM11HT052:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cso+zwlfI6aeOnzcQOSYwWcUp1OtZKLApxvqiQD+wdIx5oCRjTQRE8VTCmCPik7LSMXRSSWLAQnJg+tVqSd/8lxfUyzCvEkxkeQGL47igWcTZo2Pir/SX3HtnTCUMRC1ikRiE0Cbz4sGRXh6MTIsPurZey0tkeVZL5EafJaVYX+Lr5ACXntdTITz+fjb8I/lBjxF7OXaVkpa8yCJTLl4XsnzOMCeXxeDWswfmS1ZVmBiIJtK06ezLs31Nz5+EWvDhOXyRGPMHS9EU5cL++QaG4lVMOt7sb2tL2a38o74t858Vafu8JrhbHZm1wMAukYDruDBdLDUSAudWMd4dCJNX/oMEK+DknO80uilVrgFYl9IIdVVeJ8hIEGHHJ55Q//lOXeDVTfQqjk4YCLkOnZBTw==
X-MS-Exchange-AntiSpam-MessageData: HB+DR+YVwCno1sgoLc7Kjt4djKaCtLZ3uZ2JZ99n8YW96gimp+lmLs6GTw1BoZZ/f8/DT0ywyRNewFpen/4Wxw8Q2CppKovR0tmyLlj6zRdWkZpjSrpQlDApS+jWemhgTeZQEuCfaCghP19kyCyUxQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a99f36e-3cd7-499a-da57-08d9034bdd62
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 15:57:42.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT052
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, lee.jones@linaro.org
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

Add rk817 codec support cell to rk808 mfd driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changes in v6:
 - Included additional project maintainers for correct subsystems.
 - Removed unneeded compatible from DT documentation.
 - Removed binding update for Odroid Go Advance (will do in seperate series).
Changes in v5:
 - Move register definitions from rk817_codec.h to main rk808.h register
   definitions.
 - Add volatile register for codec bits.
 - Add default values for codec bits.
 - Removed of_compatible from mtd driver (not necessary).
 - Switched to using parent regmap instead of private regmap for codec.
Changes in v4:
 - Created set_pll() call.
 - Created user visible gain control in mic.
 - Check for return value of clk_prepare_enable().
 - Removed duplicate clk_prepare_enable().
 - Split DT documentation to separate commit.
Changes in v3:
 - Use DAPM macros to set audio path.
 - Updated devicetree binding (as every rk817 has this codec chip).
 - Changed documentation to yaml format.
 - Split MFD changes to separate commit.
Changes in v2:
 - Fixed audio path registers to solve some bugs.

 drivers/mfd/rk808.c       | 89 +++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index ad923dd4e007..b92f4c6f503e 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -65,6 +65,9 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
 	case RK817_RTC_STATUS_REG:
+#ifdef CONFIG_SND_SOC_RK817
+	case RK817_CODEC_DTOP_LPT_SRST:
+#endif
 	case RK817_INT_STS_REG0:
 	case RK817_INT_STS_REG1:
 	case RK817_INT_STS_REG2:
@@ -163,6 +166,11 @@ static const struct mfd_cell rk817s[] = {
 		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
 		.resources = &rk817_rtc_resources[0],
 	},
+#ifdef CONFIG_SND_SOC_RK817
+	{
+		.name = "rk817-codec",
+	},
+#endif
 };
 
 static const struct mfd_cell rk818s[] = {
@@ -201,6 +209,87 @@ static const struct rk808_reg_data rk808_pre_init_reg[] = {
 
 static const struct rk808_reg_data rk817_pre_init_reg[] = {
 	{RK817_RTC_CTRL_REG, RTC_STOP, RTC_STOP},
+#ifdef CONFIG_SND_SOC_RK817
+	/* Codec specific registers */
+	{ RK817_CODEC_DTOP_VUCTL, MASK_ALL, 0x03 },
+	{ RK817_CODEC_DTOP_VUCTIME, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DTOP_LPT_SRST, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DTOP_DIGEN_CLKE, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_AREF_RTCFG0 not defined in data sheet */
+	{ RK817_CODEC_AREF_RTCFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG1, MASK_ALL, 0x06 },
+	{ RK817_CODEC_AADC_CFG0, MASK_ALL, 0xc8 },
+	/* from vendor driver, CODEC_AADC_CFG1 not defined in data sheet */
+	{ RK817_CODEC_AADC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_SR_ACL0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_ALC1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_ALC2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_NG, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_HPF, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DADC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AMIC_CFG0, MASK_ALL, 0x70 },
+	{ RK817_CODEC_AMIC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_PGA_GAIN, MASK_ALL, 0x66 },
+	{ RK817_CODEC_DMIC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG2, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_ADAC_CFG0 not defined in data sheet */
+	{ RK817_CODEC_ADAC_CFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_ADAC_CFG1, MASK_ALL, 0x07 },
+	{ RK817_CODEC_DDAC_POPD_DACST, MASK_ALL, 0x82 },
+	{ RK817_CODEC_DDAC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_SR_LMT0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_MUTE_MIXCTL, MASK_ALL, 0xa0 },
+	{ RK817_CODEC_DDAC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DADC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AMIC_CFG0, MASK_ALL, 0x70 },
+	{ RK817_CODEC_AMIC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_PGA_GAIN, MASK_ALL, 0x66 },
+	{ RK817_CODEC_DMIC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG2, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_ADAC_CFG0 not defined in data sheet */
+	{ RK817_CODEC_ADAC_CFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_ADAC_CFG1, MASK_ALL, 0x07 },
+	{ RK817_CODEC_DDAC_POPD_DACST, MASK_ALL, 0x82 },
+	{ RK817_CODEC_DDAC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_SR_LMT0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_MUTE_MIXCTL, MASK_ALL, 0xa0 },
+	{ RK817_CODEC_DDAC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DDAC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AHP_ANTI0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AHP_ANTI1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AHP_CFG0, MASK_ALL, 0xe0 },
+	{ RK817_CODEC_AHP_CFG1, MASK_ALL, 0x1f },
+	{ RK817_CODEC_AHP_CP, MASK_ALL, 0x09 },
+	{ RK817_CODEC_ACLASSD_CFG1, MASK_ALL, 0x69 },
+	{ RK817_CODEC_ACLASSD_CFG2, MASK_ALL, 0x44 },
+	{ RK817_CODEC_APLL_CFG0, MASK_ALL, 0x04 },
+	{ RK817_CODEC_APLL_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_APLL_CFG2, MASK_ALL, 0x30 },
+	{ RK817_CODEC_APLL_CFG3, MASK_ALL, 0x19 },
+	{ RK817_CODEC_APLL_CFG4, MASK_ALL, 0x65 },
+	{ RK817_CODEC_APLL_CFG5, MASK_ALL, 0x01 },
+	{ RK817_CODEC_DI2S_CKM, MASK_ALL, 0x01 },
+	{ RK817_CODEC_DI2S_RSD, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR2, MASK_ALL, 0x17 },
+	{ RK817_CODEC_DI2S_RXCMD_TSD, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR2, MASK_ALL, 0x17 },
+	{ RK817_CODEC_DI2S_TXCR3_TXCMD, MASK_ALL, 0x00 },
+#endif
 	{RK817_GPIO_INT_CFG, RK817_INT_POL_MSK, RK817_INT_POL_L},
 	{RK817_SYS_CFG(1), RK817_HOTDIE_TEMP_MSK | RK817_TSD_TEMP_MSK,
 					   RK817_HOTDIE_105 | RK817_TSD_140},
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index e07f6e61cd38..a96e6d43ca06 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -437,6 +437,87 @@ enum rk809_reg_id {
 #define RK817_RTC_COMP_LSB_REG		0x10
 #define RK817_RTC_COMP_MSB_REG		0x11
 
+/* RK817 Codec Registers */
+#define RK817_CODEC_DTOP_VUCTL		0x12
+#define RK817_CODEC_DTOP_VUCTIME	0x13
+#define RK817_CODEC_DTOP_LPT_SRST	0x14
+#define RK817_CODEC_DTOP_DIGEN_CLKE	0x15
+#define RK817_CODEC_AREF_RTCFG0		0x16
+#define RK817_CODEC_AREF_RTCFG1		0x17
+#define RK817_CODEC_AADC_CFG0		0x18
+#define RK817_CODEC_AADC_CFG1		0x19
+#define RK817_CODEC_DADC_VOLL		0x1a
+#define RK817_CODEC_DADC_VOLR		0x1b
+#define RK817_CODEC_DADC_SR_ACL0	0x1e
+#define RK817_CODEC_DADC_ALC1		0x1f
+#define RK817_CODEC_DADC_ALC2		0x20
+#define RK817_CODEC_DADC_NG		0x21
+#define RK817_CODEC_DADC_HPF		0x22
+#define RK817_CODEC_DADC_RVOLL		0x23
+#define RK817_CODEC_DADC_RVOLR		0x24
+#define RK817_CODEC_AMIC_CFG0		0x27
+#define RK817_CODEC_AMIC_CFG1		0x28
+#define RK817_CODEC_DMIC_PGA_GAIN	0x29
+#define RK817_CODEC_DMIC_LMT1		0x2a
+#define RK817_CODEC_DMIC_LMT2		0x2b
+#define RK817_CODEC_DMIC_NG1		0x2c
+#define RK817_CODEC_DMIC_NG2		0x2d
+#define RK817_CODEC_ADAC_CFG0		0x2e
+#define RK817_CODEC_ADAC_CFG1		0x2f
+#define RK817_CODEC_DDAC_POPD_DACST	0x30
+#define RK817_CODEC_DDAC_VOLL		0x31
+#define RK817_CODEC_DDAC_VOLR		0x32
+#define RK817_CODEC_DDAC_SR_LMT0	0x35
+#define RK817_CODEC_DDAC_LMT1		0x36
+#define RK817_CODEC_DDAC_LMT2		0x37
+#define RK817_CODEC_DDAC_MUTE_MIXCTL	0x38
+#define RK817_CODEC_DDAC_RVOLL		0x39
+#define RK817_CODEC_DDAC_RVOLR		0x3a
+#define RK817_CODEC_AHP_ANTI0		0x3b
+#define RK817_CODEC_AHP_ANTI1		0x3c
+#define RK817_CODEC_AHP_CFG0		0x3d
+#define RK817_CODEC_AHP_CFG1		0x3e
+#define RK817_CODEC_AHP_CP		0x3f
+#define RK817_CODEC_ACLASSD_CFG1	0x40
+#define RK817_CODEC_ACLASSD_CFG2	0x41
+#define RK817_CODEC_APLL_CFG0		0x42
+#define RK817_CODEC_APLL_CFG1		0x43
+#define RK817_CODEC_APLL_CFG2		0x44
+#define RK817_CODEC_APLL_CFG3		0x45
+#define RK817_CODEC_APLL_CFG4		0x46
+#define RK817_CODEC_APLL_CFG5		0x47
+#define RK817_CODEC_DI2S_CKM		0x48
+#define RK817_CODEC_DI2S_RSD		0x49
+#define RK817_CODEC_DI2S_RXCR1		0x4a
+#define RK817_CODEC_DI2S_RXCR2		0x4b
+#define RK817_CODEC_DI2S_RXCMD_TSD	0x4c
+#define RK817_CODEC_DI2S_TXCR1		0x4d
+#define RK817_CODEC_DI2S_TXCR2		0x4e
+#define RK817_CODEC_DI2S_TXCR3_TXCMD	0x4f
+
+/* RK817_CODEC_DI2S_CKM */
+#define RK817_I2S_MODE_MASK		(0x1 << 0)
+#define RK817_I2S_MODE_MST		(0x1 << 0)
+#define RK817_I2S_MODE_SLV		(0x0 << 0)
+
+/* RK817_CODEC_DDAC_MUTE_MIXCTL */
+#define DACMT_MASK			(0x1 << 0)
+#define DACMT_ENABLE			(0x1 << 0)
+#define DACMT_DISABLE			(0x0 << 0)
+
+/* RK817_CODEC_DI2S_RXCR2 */
+#define VDW_RX_24BITS			(0x17)
+#define VDW_RX_16BITS			(0x0f)
+
+/* RK817_CODEC_DI2S_TXCR2 */
+#define VDW_TX_24BITS			(0x17)
+#define VDW_TX_16BITS			(0x0f)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define MIC_DIFF_MASK			(0x1 << 7)
+#define MIC_DIFF_DIS			(0x0 << 7)
+#define MIC_DIFF_EN			(0x1 << 7)
+
 #define RK817_POWER_EN_REG(i)		(0xb1 + (i))
 #define RK817_POWER_SLP_EN_REG(i)	(0xb5 + (i))
 
-- 
2.25.1

