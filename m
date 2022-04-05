Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D24F20CB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD23F16C9;
	Tue,  5 Apr 2022 04:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD23F16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124542;
	bh=xyboBWP9Z1GsshVGWz0MFifmc8bE1aGwDFJCHV334zQ=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rd/EszzTdmXgo3tyV0mAW8Wl62/7C3Amyvaw4U+l3cHesRSgieoRnn7zDkAFLrG7I
	 0MV5xhzhmMSLt8wKCbj85JbNOVhWImwnofLxM0uguSH1hDcN4SviqTePBYWqHLOz7Z
	 e2re7LpyFP5Xfpkjt/WF7+3TFOT3OAh+orFpP/PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A4FF80538;
	Tue,  5 Apr 2022 04:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4C1F80538; Tue,  5 Apr 2022 04:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3181F8052D
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3181F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="hUMVZYpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G64vfo0cxh3tGzyQ6UC+CRJoAuIK9LYEucWmpIdoqLlp/VupTIt5qUoWrkO8ZuwrmDT+CFK10ZAmmJR2GDRBMneyAtMbyIYfW3kk8RJP0dM/XbnvIdUwE5o3CYLwXsI2AMYyB2RFjYPAN1clU2CCGtwbJgLo2E1bDi15K8wZho+4zZC90wMA/bRch8BmzCqXMzPNI9NssEnIoxe4c5R28KvbFj1TaOPPjyjLTmnrMgOnhUisn2MMYZAAElnz0zgjtE9SPQsWLHLMnVSy58mrjJz6IGh2CBdWPMmRzqz4sKvJQUOPn3y0W075gmLzA0Den1wnDh1GDBEzzMoGbor5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+c99+i7ArhE84dyqRxFq/pXD2WIhIDlE73ETZLhOYw=;
 b=DPPmKOo8SYyD9ONbVLtnQ2G7MDkuNaZxL0yyux49Dvhs9x/pNpB4QAvqIIZmFj6uxxwP1HP4ZCi5rq4EcmP1ze2FULrFWJ35MaPa7Xr4yB3e49lmVzD6x021Ok5KkNP1OLqeYcEBfXA11z2EsyvAkcv0hroebhabui6cvCOUiVDJ18Hz+eE2yGW3yoOnYl5aj4DmtWm/W6FiqUFtWvOrGGb3VvId4LZOVelBp6bOA8RBU1dH9VdnqRci3Xd2I8GCXMcs9aILE8IYdIkobFKKlaoCqxGUS13HAvGyHQo9K0/bVma9NzYYugSNHCTdn1LvZTGfZmJD6m06dRCp+3K1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+c99+i7ArhE84dyqRxFq/pXD2WIhIDlE73ETZLhOYw=;
 b=hUMVZYpudtvyGnv3pW+cH0vtYvgQsDduNVpvCOm1JC+BWzEM4r8yqWSTU9qT6jbQHu261EMWrdHX4GQQbaVH03u8AB3F/mD8vCQoNhaZYfptFpME+Ma31I2t8R4rfIj2oVPBK1qVyXW6wIoS9H/fsTqhBbhcAKPcOEihvVwFrA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB5095.jpnprd01.prod.outlook.com (2603:1096:604:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:52 +0000
Message-ID: <878rskp9l0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: ak4613: add TDM256 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:51 +0000
X-ClientProxiedBy: TYAPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58cc688a-2081-4049-1572-08da16a8f34d
X-MS-TrafficTypeDiagnostic: OSBPR01MB5095:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB50953B626CB551AB888D8891D4E49@OSBPR01MB5095.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NbcLgFVryVkgSlCCE92/tIXb84HdBEnMwOPyF+CfiqbqAej1tHDuZVn76i85KeIJXObzfGz1pasToXM94pV24WCfUH+7bf5AyzJ8B7smrWYyoiFidll9VjbkkgtUh9n689TU55/wh6GGYNxlDFtZUvS8UxEsfacXUP2x/AqLogvaxeL0M+TNO4BaCP168jCSIB9eLL599UNzcLriYwaKk/GK2dnAZyqSgsjeKwZYkUxxnbIfMZR68PbpBLOgmWtu9cUycpvlmbDuy6NASw4+20E+8FrVSRHLBlUmC7CUe82stk55aGnrhKPtYN6JnjRk5tMU7qUTtj75EomYcZ9Oux3IeT/e1xhasEAFPu5TR8wjHgI70HIhNuhWLL9Kn3z+yEzG9s2FzKQDWR3XSWglBX5JrAJitCe0uzSPoYQCy9cEisNbE1yCGQnvn6j9iyM6Vf8TBxx2EhpAqayZ1132WZM3rrDqeempYd3vqu5ZhVxcbUPW/LG1GX3FBBR+aPqO9ms7XVFdGYjzuCiCqYKYFdTTQyLDuoha9Qmo4rUuBSItBHKfYf7nrHzbTdWkaA7XI1t75VbNKEdb9cVu5ec7J0pFPP3Wuyh4WCnA+8LrTNKUORgHzxSkr3DF/gEDj8sdvaQTtrllhWQHxaa0FDac11mW5124ibMI0vAhr2JUT7b7aFVRxf0ROelFmz02P2e8LZjnR+/0EStJPVeZZgLZzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(4326008)(38350700002)(66946007)(66556008)(66476007)(8676002)(83380400001)(36756003)(316002)(2906002)(38100700002)(508600001)(6512007)(86362001)(30864003)(6486002)(8936002)(2616005)(52116002)(5660300002)(26005)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yRWqZUNDvjo9wW2GPFbNMoQxp6uP7oN/9KLLCYfL9IVOweL6XSVe19Iipy4L?=
 =?us-ascii?Q?MpexEUfIiTPPDFXPblhVpCXqoJ707r2rJumxOlDr+sJD9rZ8BFRlAvHyd5kO?=
 =?us-ascii?Q?0rLI+b/78AbxeIY3rRjDFOORCUr1FSO9ofuxMA+AvntULf1MCNcfl1+l5TrP?=
 =?us-ascii?Q?7MyX1tSpSI1PAQl845QrfRpPfHbLFgmXTIjF/j4ugDU6tzOolxO9ySRnRHx5?=
 =?us-ascii?Q?81iG+67G1z5b7BLcpuGY942AHOdDEYGwGxiWNOlgckviq6xqprz2tt6C6WC/?=
 =?us-ascii?Q?UQ8tWbvqN0tS58HIeXE/Yois9lH9Y9PnytLISoXYahJD7W7HQ9ocScqCtlqR?=
 =?us-ascii?Q?ZrhsuW0IKq3aYzFtaxsHkAmQ6Up6+MSAbZD1lMSfLsXgTcvmXFdKwllJcDJt?=
 =?us-ascii?Q?gyS0X6AgOLkD9UwTkDafgEzSGPQEHvevhZyoPQh8bMiy3mEAqbv70mnIA1TV?=
 =?us-ascii?Q?uuMS/tB6RsR2ZY4XCJgzzpcXP+X5NjeOrY9nLW0uRh3uqHVptynstJhkYfUr?=
 =?us-ascii?Q?U3ycRUaK73bJMguaxEdrfrqmtp5z0okbGYz4TEO2lfvWjVioDhaeyIu7Rke9?=
 =?us-ascii?Q?qM8TWpstOIt6gHnx2D0YdKyi4niVUF77S6eyaL6y2In1CAhuFImaWCg1phps?=
 =?us-ascii?Q?A/avarUBfYaXIoUz7oqdWkXMe7YnX6L2yNIgXSUdJKB+Rny3uYUUC3qHbKdZ?=
 =?us-ascii?Q?jD62sQT1096RZXMxDl+/ktMgJyJezeuwbhgRT3fTaN/gqKvV6XEixlhTbw7k?=
 =?us-ascii?Q?6Oh3ZAyoIu/LxgBxLww+A64nUlBHjbWP07Hrdd9pLdfnAsdfBMwwW+m4MEVP?=
 =?us-ascii?Q?KWDzw+p025i4CgLtksPBQ4azW5WuBBVTcmZhtardTrXNpjpAENtVlcXbioMT?=
 =?us-ascii?Q?eTnSwFgeB+NHzBD2aLr5EE5Vh0rdr1//PMiSaFDNFQJ/c3jD09mL6DDfXhSE?=
 =?us-ascii?Q?kHogZPceiGGh8PaALZy5p/zWbndip5ulCM6rFq/tvz1HG6ketByVg3m2ARay?=
 =?us-ascii?Q?eUYHYFrpfR12VsgQakAd9syfcvzAUkbxKzuFo+SzKTUl61R7NizmeF4L/3vr?=
 =?us-ascii?Q?P6h7JbnyNcEGdQU5I4k0VzaF3n/ou2+xR2bSVuqA+yr7v9sJBix9Crndkjz5?=
 =?us-ascii?Q?qi4ShCG1b/YwyLVCggMyDOlBQ38pN31d3oE+65xUyM2w/ItCy9x/G3Zal+M4?=
 =?us-ascii?Q?Px5LU2MlxmB4g5jKm837G3X3uS+SbmdtweUKltUURbIWb7HSodLxcYYwyP8t?=
 =?us-ascii?Q?kHgc1fDZ1NSVZtK+Hb5reZDB/KmnSplgR8oPxfk8jyno4apFLIJYbaoDAc7k?=
 =?us-ascii?Q?ivSSAyJctwWnzK3RJSURAv8GvLuuCyzoJPqNTTfAL7Z6+jozvviuCr+6QEV9?=
 =?us-ascii?Q?nRWMjf2a0PCuK1B3cNDahRT4EI3Zx11r7zQQxOyxcpPlElfPPXxA1Y+Kdh/e?=
 =?us-ascii?Q?rSQr3QsJuFMBCfG+S3EA4dFUM7G+Y2KJ7KuN+EttMAVjz76GWGVxLq7HXT/b?=
 =?us-ascii?Q?Q/L2bTCCPEN6/mSZW7piUb+S+Xi2HNn4xZBve09h87MJx0Eo6OdFTwldzyC4?=
 =?us-ascii?Q?4rUify4yn+8albFySOqgm9XAlxug/bdJkX0r9BX0IyNUN+sZlQeALjBzPNil?=
 =?us-ascii?Q?OUekSKFLB7OlMO0bN6y5ScSHeDx93jzeg8e7PDUGG7biGv7s8/oo4V6qUVWu?=
 =?us-ascii?Q?a9ugzUW3HdRiMsCHNJpH7VrITITFvpHXXJX4wYgfI3YExHrMzsAmpRdfsaAd?=
 =?us-ascii?Q?t//peSBa3mY9U8jmAzr6AcZEVrQJk6SBCdu6+UNOQ8/ejXrGWqyb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cc688a-2081-4049-1572-08da16a8f34d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:51.9672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSP7yNQuWYm7/Vkn8E2wiBvb/mdFAS5GDCgScGLpWo7baJmEG3i6nBFjDuvnh4jLvHsIUvAdbRbHg1TJQ/ftlOSSCyd92QgeS+ybGHEz2fZ7tLdUIB7/ktHk6zqFr5vt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5095
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

AK4613 has STEREO/TDM512/TDM256/TDM128 mode.
Renesas is the only user of ak4613 on upstream for now,
and is using it as STEREO mode, because of board connection.
Thus, current driver is supporting STEREO mode only, and other
modes are not supported.

But I noticed that I can try first 2ch out of TDM256 mode 8ch
Playback even in such a situation.

But because of board connection, I can't test full TDM256 mode,
and/or other TDM mode. Thus I don't want to add new DT propaty for now.
This patch enables TDM256 mode test by "ifdef style",
but it has no effect to current supported STEREO mode.
You can define AK4613_ENABLE_TDM_TEST to try TDM256 mode.

Please don't hesitate to break current code if you can add full TDM256
and/or other TDM mode. You don't need to care compatibility with Renesas.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 245 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 237 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 2ec6313e823d..03b829930769 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -10,11 +10,97 @@
 // Based on ak4535.c by Richard Purdie
 // Based on wm8753.c by Liam Girdwood
 
+/*
+ *		+-------+
+ *		|AK4613	|
+ *	SDTO1 <-|	|
+ *		|	|
+ *	SDTI1 ->|	|
+ *	SDTI2 ->|	|
+ *	SDTI3 ->|	|
+ *		+-------+
+ *
+ *	  +---+
+ * clk	  |   |___________________________________________...
+ *
+ * [TDM512]
+ * SDTO1  [L1][R1][L2][R2]
+ * SDTI1  [L1][R1][L2][R2][L3][R3][L4][R4][L5][R5][L6][R6]
+ *
+ * [TDM256]
+ * SDTO1  [L1][R1][L2][R2]
+ * SDTI1  [L1][R1][L2][R2][L3][R3][L4][R4]
+ * SDTI2  [L5][R5][L6][R6]
+ *
+ * [TDM128]
+ * SDTO1  [L1][R1][L2][R2]
+ * SDTI1  [L1][R1][L2][R2]
+ * SDTI2  [L3][R3][L4][R4]
+ * SDTI3  [L5][R5][L6][R6]
+ *
+ * [STEREO]
+ *	Playback  2ch : SDTI1
+ *	Capture   2ch : SDTO1
+ *
+ * [TDM512]
+ *	Playback 12ch : SDTI1
+ *	Capture   4ch : SDTO1
+ *
+ * [TDM256]
+ *	Playback 12ch : SDTI1 + SDTI2
+ *	Playback  8ch : SDTI1
+ *	Capture   4ch : SDTO1
+ *
+ * [TDM128]
+ *	Playback 12ch : SDTI1 + SDTI2 + SDTI3
+ *	Playback  8ch : SDTI1 + SDTI2
+ *	Playback  4ch : SDTI1
+ *	Capture   4ch : SDTO1
+ *
+ *
+ * !!! NOTE !!!
+ *
+ * Renesas is the only user of ak4613 on upstream so far,
+ * but the chip connection is like below.
+ * Thus, Renesas can't test all connection case.
+ * Tested TDM is very limited.
+ *
+ * +-----+	+-----------+
+ * | SoC |	|  AK4613   |
+ * |     |<-----|SDTO1	 IN1|<-- Mic
+ * |     |	|	 IN2|
+ * |     |	|	    |
+ * |     |----->|SDTI1	OUT1|--> Headphone
+ * +-----+	|SDTI2	OUT2|
+ *		|SDTI3	OUT3|
+ *		|	OUT4|
+ *		|	OUT5|
+ *		|	OUT6|
+ *		+-----------+
+ *
+ * Renesas SoC can handle [2,  6,8]    channels.
+ * Ak4613      can handle [2,4,  8,12] channels.
+ *
+ * Because of above HW connection and available channels number,
+ * Renesas could test are ...
+ *
+ *	[STEREO] Playback  2ch : SDTI1
+ *		 Capture   2ch : SDTO1
+ *	[TDM256] Playback  8ch : SDTI1 (*)
+ *
+ * (*) it used 8ch data between SoC <-> AK4613 on TDM256 mode,
+ *     but could confirm is only first 2ch because only 1
+ *     Headphone is connected.
+ *
+ * see
+ *	AK4613_ENABLE_TDM_TEST
+ */
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -78,6 +164,53 @@
 /* OCTRL */
 #define OCTRL_MASK	(0x3F)
 
+/*
+ * configs
+ *
+ * 0x000000BA
+ *
+ * B : AK4613_CONFIG_SDTI_x
+ * A : AK4613_CONFIG_MODE_x
+ */
+#define AK4613_CONFIG_SET(priv, x)	 priv->configs |= AK4613_CONFIG_##x
+#define AK4613_CONFIG_GET(priv, x)	(priv->configs &  AK4613_CONFIG_##x##_MASK)
+
+/*
+ * AK4613_CONFIG_SDTI_x
+ *
+ * It indicates how many SDTIx is connected.
+ */
+#define AK4613_CONFIG_SDTI_MASK		(0xF << 4)
+#define AK4613_CONFIG_SDTI(x)		(((x) & 0xF) << 4)
+#define AK4613_CONFIG_SDTI_set(priv, x)	  AK4613_CONFIG_SET(priv, SDTI(x))
+#define AK4613_CONFIG_SDTI_get(priv)	((AK4613_CONFIG_GET(priv, SDTI) >> 4) & 0xF)
+
+/*
+ * AK4613_CONFIG_MODE_x
+ *
+ * Same as Ctrl1 :: TDM1/TDM0
+ * No shift is requested
+ * see
+ *	AK4613_CTRL1_TO_MODE()
+ *	Table 11/12/13/14
+ */
+#define AK4613_CONFIG_MODE_MASK		(0xF)
+#define AK4613_CONFIG_MODE_STEREO	(0x0)
+#define AK4613_CONFIG_MODE_TDM512	(0x1)
+#define AK4613_CONFIG_MODE_TDM256	(0x2)
+#define AK4613_CONFIG_MODE_TDM128	(0x3)
+
+/*
+ * !!!! FIXME !!!!
+ *
+ * Because of testable HW limitation, TDM256 8ch TDM was only tested.
+ * This driver uses AK4613_ENABLE_TDM_TEST instead of new DT property so far.
+ * Don't hesitate to update driver, you don't need to care compatible
+ * with Renesas.
+ *
+ * #define AK4613_ENABLE_TDM_TEST
+ */
+
 struct ak4613_interface {
 	unsigned int width;
 	unsigned int fmt;
@@ -87,12 +220,14 @@ struct ak4613_interface {
 struct ak4613_priv {
 	struct mutex lock;
 	struct snd_pcm_hw_constraint_list constraint_rates;
+	struct snd_pcm_hw_constraint_list constraint_channels;
 	struct work_struct dummy_write_work;
 	struct snd_soc_component *component;
 	unsigned int rate;
 	unsigned int sysclk;
 
 	unsigned int fmt;
+	unsigned int configs;
 	int cnt;
 	u8 ctrl1;
 	u8 oc;
@@ -150,6 +285,7 @@ static const struct ak4613_interface ak4613_iface[] = {
 	AUDIO_IFACE(0x03, 24, LEFT_J),
 	AUDIO_IFACE(0x04, 24, I2S),
 };
+#define AK4613_CTRL1_TO_MODE(priv)	((priv)->ctrl1 >> 6) /* AK4613_CONFIG_MODE_x */
 
 static const struct regmap_config ak4613_regmap_cfg = {
 	.reg_bits		= 8,
@@ -260,8 +396,9 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
-				  struct snd_pcm_runtime *runtime)
+				  struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	static const unsigned int ak4613_rates[] = {
 		 32000,
 		 44100,
@@ -272,8 +409,33 @@ static void ak4613_hw_constraints(struct ak4613_priv *priv,
 		176400,
 		192000,
 	};
+#define AK4613_CHANNEL_2	 0
+#define AK4613_CHANNEL_4	 1
+#define AK4613_CHANNEL_8	 2
+#define AK4613_CHANNEL_12	 3
+#define AK4613_CHANNEL_NONE	-1
+	static const unsigned int ak4613_channels[] = {
+		[AK4613_CHANNEL_2]  =  2,
+		[AK4613_CHANNEL_4]  =  4,
+		[AK4613_CHANNEL_8]  =  8,
+		[AK4613_CHANNEL_12] = 12,
+	};
+#define MODE_MAX 4
+#define SDTx_MAX 4
+#define MASK(x) (1 << AK4613_CHANNEL_##x)
+	static const int mask_list[MODE_MAX][SDTx_MAX] = {
+		/* 				SDTO	 SDTIx1    SDTIx2		SDTIx3 */
+		[AK4613_CONFIG_MODE_STEREO] = { MASK(2), MASK(2),  MASK(2),		MASK(2)},
+		[AK4613_CONFIG_MODE_TDM512] = { MASK(4), MASK(12), MASK(12),		MASK(12)},
+		[AK4613_CONFIG_MODE_TDM256] = { MASK(4), MASK(8),  MASK(8)|MASK(12),	MASK(8)|MASK(12)},
+		[AK4613_CONFIG_MODE_TDM128] = { MASK(4), MASK(4),  MASK(4)|MASK(8),	MASK(4)|MASK(8)|MASK(12)},
+	};
 	struct snd_pcm_hw_constraint_list *constraint;
+	unsigned int mask;
+	unsigned int mode;
 	unsigned int fs;
+	int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int sdti_num;
 	int i;
 
 	constraint		= &priv->constraint_rates;
@@ -302,6 +464,41 @@ static void ak4613_hw_constraints(struct ak4613_priv *priv,
 
 	snd_pcm_hw_constraint_list(runtime, 0,
 				SNDRV_PCM_HW_PARAM_RATE, constraint);
+
+
+	sdti_num = AK4613_CONFIG_SDTI_get(priv);
+	if (WARN_ON(sdti_num >= SDTx_MAX))
+		return;
+
+	if (priv->cnt) {
+		/*
+		 * If it was already working,
+		 * the constraint is same as working mode.
+		 */
+		mode = AK4613_CTRL1_TO_MODE(priv);
+		mask = 0; /* no default */
+	} else {
+		/*
+		 * It is not yet working,
+		 * the constraint is based on board configs.
+		 * STEREO mask is default
+		 */
+		mode = AK4613_CONFIG_GET(priv, MODE);
+		mask = mask_list[AK4613_CONFIG_MODE_STEREO][is_play * sdti_num];
+	}
+
+	if (WARN_ON(mode >= MODE_MAX))
+		return;
+
+	/* add each mode mask */
+	mask |= mask_list[mode][is_play * sdti_num];
+
+	constraint		= &priv->constraint_channels;
+	constraint->list	= ak4613_channels;
+	constraint->mask	= mask;
+	constraint->count	= sizeof(ak4613_channels);
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_CHANNELS, constraint);
 }
 
 static int ak4613_dai_startup(struct snd_pcm_substream *substream,
@@ -311,11 +508,10 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
 	mutex_lock(&priv->lock);
+	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
 	mutex_unlock(&priv->lock);
 
-	ak4613_hw_constraints(priv, substream->runtime);
-
 	return 0;
 }
 
@@ -399,7 +595,7 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	/*
 	 * FIXME
 	 *
-	 * It doesn't support TDM at this point
+	 * It doesn't have full TDM suppert yet
 	 */
 	ret = -EINVAL;
 
@@ -413,6 +609,15 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 		/*
 		 * It is not yet working,
 		 */
+		unsigned int channel = params_channels(params);
+		u8 tdm;
+
+		/* STEREO or TDM */
+		if (channel == 2)
+			tdm = AK4613_CONFIG_MODE_STEREO;
+		else
+			tdm = AK4613_CONFIG_GET(priv, MODE);
+
 		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
 			const struct ak4613_interface *iface = ak4613_iface + i;
 
@@ -421,9 +626,9 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 				 * Ctrl1
 				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
 				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *            < iface->dif >
+				 *  <  tdm  > < iface->dif >
 				 */
-				priv->ctrl1 = (iface->dif << 3);
+				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
 				ret = 0;
 				break;
 			}
@@ -578,14 +783,14 @@ static struct snd_soc_dai_driver ak4613_dai = {
 	.playback = {
 		.stream_name	= "Playback",
 		.channels_min	= 2,
-		.channels_max	= 2,
+		.channels_max	= 12,
 		.rates		= AK4613_PCM_RATE,
 		.formats	= AK4613_PCM_FMTBIT,
 	},
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 2,
-		.channels_max	= 2,
+		.channels_max	= 4,
 		.rates		= AK4613_PCM_RATE,
 		.formats	= AK4613_PCM_FMTBIT,
 	},
@@ -630,6 +835,7 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
 {
 	struct device_node *np = dev->of_node;
 	char prop[32];
+	int sdti_num;
 	int i;
 
 	/* Input 1 - 2 */
@@ -645,6 +851,29 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
 		if (!of_get_property(np, prop, NULL))
 			priv->oc |= 1 << i;
 	}
+
+	/*
+	 * enable TDM256 test
+	 *
+	 * !!! FIXME !!!
+	 *
+	 * It should be configured by DT or other way
+	 * if it was full supported.
+	 * But it is using ifdef style for now for test
+	 * purpose.
+	 */
+#if defined(AK4613_ENABLE_TDM_TEST)
+	AK4613_CONFIG_SET(priv, MODE_TDM256);
+#endif
+
+	/*
+	 * connected STDI
+	 */
+	sdti_num = of_graph_get_endpoint_count(np);
+	if (WARN_ON((sdti_num > 3) || (sdti_num < 1)))
+		return;
+
+	AK4613_CONFIG_SDTI_set(priv, sdti_num);
 }
 
 static int ak4613_i2c_probe(struct i2c_client *i2c,
-- 
2.25.1

