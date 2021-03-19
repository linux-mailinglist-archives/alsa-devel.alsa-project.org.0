Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9953425F3
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 20:16:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D421693;
	Fri, 19 Mar 2021 20:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D421693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616181362;
	bh=Upa8xkuEcUdgO+bzqPJezNXNEPhwH9cUBbb0mKoxmbM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pWmahXutVger8y6xTmE3DfO9jlW0PmDASlf5odffRBlhoapWocH8kMSZB5T09gEFz
	 5pYmigsD4MCg0JVyv7B/ZUMEbwlQ1J6ocMrnG1GrHM2NnqUzPp8/ebA6cpir/FUWHt
	 FMRP5UhtfGYIcC3Ve+0BnrbiT1KIOacfmCJhdqoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55923F8032C;
	Fri, 19 Mar 2021 20:14:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2DC6F800BB; Fri, 19 Mar 2021 20:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 UPPERCASE_50_75 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2070.outbound.protection.outlook.com [40.92.22.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B557F800BB
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 20:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B557F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="gdqhD9dK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJkuB1S+o1zBuvGfb2JKGgWGXl5LVTVdpBMV7nxfTBJKJ3/NfsfSdkxTQIRnptseipSScQwkxoH0tGGxg3JldVO/xUi5whCa4WIGzu7Y6x9u5rb0t9wTvmReKhm4tUfKWw8y4kOSm6B+f/LDD9v1vjpydC5UJaxw+ubXtYBZR2+ktYNjj+uYKLHx8hgi7ZVPatiliGXkmnAuz3eBSh2qL+P4C2cG8rGWFvbz691sBGBMq7nGqN+BUDIlKDHUBjhi4VJtpUUZ5pWR4F/vxjlCP+IOaS2akp3FLmCMhy2Mt1V9Xx3+AhfKSLr9DHsG4ZjYJWwmRC4gR2INCHNMC5DbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PclFFJizvl89I+uhovAwAG2HrugwfyZ7fK9TdzVP4G4=;
 b=adNvM9SMfUC3c27LlPDX0iU9uQUKOlCBg5wyS9hBgf+ffwbPT7tRwR3ZXCRC80OMBDNFGdOFVNcV/RKHHI7fZyGHzMnbzqVUeCZCNKuXgExiJrcmn0Xow8hfBoioDwfBLbqIvHIvC4XOfku4KQkzvJMjeJn0fomlOMdonfCghoPqKJOQ83evhjbCREUA135/9UJjJIIFu29Yvoa3oee5ngdEZbuDaYaV07JDDva7o6NuJFzdxPdOBdxwg68VfZQpSBTTHXRsrZ2YGhe17MWYS51q/4e6i9sBcNuVljpmoGC2DnQZaQZw3L154N9FLA7vV9q/NSEb2j62tp4m+0eLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PclFFJizvl89I+uhovAwAG2HrugwfyZ7fK9TdzVP4G4=;
 b=gdqhD9dKFrLykuZOdkdCuu/9Jr96v701Foj1zV0JXYX/5644QrO68w1KXSqcxZhmhQpTJLCre5CcO3BQXFko2IiSH4Fg5QgCpFpAVtgemrjktlkrSS9/3Ftno+/VLqcttK++F5i6ehjBHx7y/VpuLzWjWrMxTaBu0YSJncQAhUPnLvMqJXvvzwnrnX+Wlm/jfLEZqoHWWnSKr/3g5qoCHIo2M4KWSxXbScN2q/DTxPk2BZHkpld7tfhKSAebVKnPgZIQnGKxSIgNTrO9fV/lz8ZKjSgcmSH3ZTgjJZpdEqB1/HE2/KZHufg2Ojt1aIxVYK6UvE9XAICGU6ap9/c7rA==
Received: from BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::41) by
 BN8NAM12HT048.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::304)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Fri, 19 Mar
 2021 19:13:55 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc66::53) by BN8NAM12FT062.mail.protection.outlook.com
 (2a01:111:e400:fc66::321) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Fri, 19 Mar 2021 19:13:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:43A34AC0507850892914D4D8127524594948569CD068CBC185E86342265D9D9A;
 UpperCasedChecksum:4C72A9C8D67D99165ECC44552078B9D4445DEC238987D1C0C0D6FD8AC6C31193;
 SizeAsReceived:7402; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 19:13:55 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 1/4] mfd: Add Rockchip rk817 audio CODEC support
Date: Fri, 19 Mar 2021 14:13:34 -0500
Message-ID: <SN6PR06MB5342F55B21521532DA19587EA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [brBSG+GdC8L/0AwOmszEomwwMxlNCEi3]
X-ClientProxiedBy: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210319191337.9414-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 19:13:54 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 69493a0a-33d2-48ce-0018-08d8eb0b2376
X-MS-Exchange-SLBlob-MailProps: mBy7Mai7yE7CRTBaMPdSvo2GfMG4mSdlUA9MwktO30GraT6pW5dXbUlp2j1rr8zQnRpXqYbZxgjgByZxnYE2I4eNg4tx1xYjyaCCADHDA59LVYnZMRQJzpvASs7HzA2ld5oAx9XdJqPwhLj/w+ZMVpdL/CD2c9VvJmNaf2Yc2lWDI9gdn4dh0tSXvFPgkec+fz300XI1WOkv2N2HtsezfFDew+njhDkuZ62aYz3FnSa1Th73IyIAZmD6GwX5HTY5IpnJJC+ZgMAcKtGLzRgNEQjt3XA9HpkcfEdeLCOPj2xh3VQ7Y2l0cUVglHf9fU8CCD/646l7nUAJBAbipdMRzShp11ADYP4wvMdLeUuKHpcenmjhLJ0pXoyYXpiuIS2umb8PJVHO7kjv5fbWgBsSarxbDmgGsQLgE5fBp7DrmInYb093xTw3iu1InNeVOy0P4uX1tE62n7WWrU2XsUuJ5Supr2muzMZe8eSqXH/ib6hZ4UpAS+SvNxpK3wd+9oPrflpe8r03r0qwd+Bm5cjkQnxoo4DNql6qgTBqIqKqc7N5AhuIzyVt4xhG9/AkBHTe6WJ8FDLrLXnO06HT6RNvJ7Z0ZL+D1w5EYRrF9slqQXeflHTu7Y+QUbbGGGHOjmUQCHmB0hyinkHokFmmR+C1sZ0FZmRh/Fp53/VR3MHwG5nxeMiLC1i7ZCyv6d1bjcxqNeGiH5RbnsPSyj5tikKUg5NAnj/7dbA6
X-MS-TrafficTypeDiagnostic: BN8NAM12HT048:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i93/pDHU/k7XOL2sV+ASZ0QVY7nRn8UooHf0wMSOE6k2sT4Cr9nKzhH2ySiTsFb4whuD6V33XCW0FLogTQc4vj6ZsQv2YqOJfhPaCkaiTAnZuY8dX9DkGFWeIaTSogYQ7y51Sl5/i+9SywZCE9nRS0LdcH7wbynk0dZp0Of/jAJZyIINrA2/wJ2D+6WHn957weafHWkRCaQqnOIdkl+71Wm5EkkNfD/wgqFD4BP4s+Gq+ZbpV0ydzLBKnmwkaiYV51JE+3P/Ts0jtHdzQjC13SJyXGsKr6NFAHyHhOhxGpzExA1jiShR8p94DRtVCdcOX7XBP6bc7dSqQeiDkH8VKQL4Zwfi/Mk5qrWl/wNYQ0NIxDdGzPtIgJCClgD8u0BF/jAdYaAVOURavqEXr/VJTQ==
X-MS-Exchange-AntiSpam-MessageData: 9TNtIDrkmZckdNbq2OQuWeFawme3MLgeWbu/LTuMojBWsZbzIyrfBjyse+O+LPFxxjRYMyNJDuNOOW6N7GMjlODxV3wOVkkPnjOqE+H6ne3GP4yDuBZ4UU5zOGcjOWxragzpIFJ1JmgLXaz1k3FjIA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69493a0a-33d2-48ce-0018-08d8eb0b2376
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 19:13:55.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT048
Cc: broonie@kernel.org, heiko@sntech.de, pierre-louis.bossart@linux.intel.com,
 Chris Morgan <macromorgan@hotmail.com>, tiwai@suse.com
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

Changes from v4:
Move register definitions from rk817_codec.h to main rk808.h register
definitions.
Add volatile register for codec bits.
Add default values for codec bits.
Removed of_compatible.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
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

