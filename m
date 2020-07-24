Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F922BDDA
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 08:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE64168A;
	Fri, 24 Jul 2020 08:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE64168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595570649;
	bh=heq+yA9r6yhV6BJ19e9uUiMBYTJYaJPHr5aJE7wPFf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q9EyTyFiW277t07O7u8ufLYk3/MHsSjVFIJE3QB2Ve2ghy64MzBotrMM1jmy4nAqj
	 VfuetdPxt47gLSOEEbDNBm/mHln0JnuukJZ6CFGSdGHDOdvR+WYP44R1Z/FWaj0zsp
	 0CyA2OGWOG/mdsRzSi7lz2Gog1gRyIvDlwz4xB7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FAD7F800CE;
	Fri, 24 Jul 2020 08:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77FF8F8014C; Fri, 24 Jul 2020 08:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750112.outbound.protection.outlook.com [40.107.75.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC2F1F800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 08:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC2F1F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="FliyQKKZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8Sqx5MhmhAZU2VUDc036Wd3A8RalWBrxc/F5aCdkO/fSPyaUm14sCW5v6/PVm1SvroXOoMugdbRc46JJsa4WuWcOlttwllhKuW3173NsnGNVhosTl2uwC0nb1f2yGvWMS4vgLgD/KRhvLL0wUj19B20ntDdyej2Owp/vtm57ARuF1Wy+INSV/Bnr2B0WESSOkYFDg5+f+F0Apxrx92eJFBr6TLEAVGuapmpNns58CJ2lPHyRKhFBMX62og4mkwCRcdHYpb4MO2PnfTzuRR8vNPVaWvmcCU0paMGTkyyyUlLTBDR/adDa/wy5OSptSviW8h+9Ag4btE447CnQNfPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQNHTtxIzShBvGtIlMKkz9O/8pQkqF0MvUCX51cxJLI=;
 b=EbrkrNnma8wzTvXPbVM+zf/jOTQDmJLALzwb95gocZ5OJRT4C1JrgUqpaj0gXmqG8RqYq5v/okQx8bdvOY1pDp6SooVxBsv0RtYA4CK5S7lCDJKAl1w4Pvf4mjUWWeQVKJazgSNxQo5MwZk4B+jwsM7nE9ulaps/JUWy0T9A4akgP8SieqhDvu8wnwhctKkUxy0ljswDV4fiArF0N8Dp8VvX8fevgGa4I8ocPfrCjzAIDxa7SVspNr09wWjFfEnbxKN/4F0hL3q/MKrGOhsYq1uoDjtDkJVfI0o3lpkTMPAUb4g5gDypQGv8AqmnCtZLwZyV9gSD1jSkRMfkKIj4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQNHTtxIzShBvGtIlMKkz9O/8pQkqF0MvUCX51cxJLI=;
 b=FliyQKKZERRRjtUFJmodByCAl2tEwyYjzss7i4L/hJlBLMa8oVv/e6Ah+t7Tg1xXiHkM848GXH9UQKA3uJiLAmQwEJewHrs3MyNw8A04OugSqoPnifBmDdoiJqTYImkrG8m9QgAvSVFEQrPlaXYgE6Vdddhl0f9iVLb4NKhmca8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1646.namprd11.prod.outlook.com (2603:10b6:301:c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:02:08 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:02:08 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: max98390: Fix dac event dapm mixer.
Date: Fri, 24 Jul 2020 15:00:58 +0900
Message-Id: <20200724060058.19201-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:100:55::14) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35)
 by SL2PR03CA0002.apcprd03.prod.outlook.com (2603:1096:100:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.15 via Frontend
 Transport; Fri, 24 Jul 2020 06:02:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 998eb6eb-b0c9-4720-aa13-08d82f9718c3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB16462CC59C853B72D63C32BA92770@MWHPR11MB1646.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2CxY+8ppep7amW2x1tbhg0g8IjipqMa6YzOopk8aKDu/PSrAVh24Y6r1t6oE5R9eBI2+AaZwjXeuhP3rwPThb+tCdgRqJhQHuWTis2wUX1sj/NWKhscNVnz4Apt96cNDYKYKtgukZS1Ph7Gf2PHGeJPAS4EUbkddZ9qM2oi/wfu1HG/R4ERqj2rjgeGN1GdlxkTZ8qBYrxwBBceuHuVP2PHvUglS4AhamD4djNafkPBacNCkuutF4an+gF12F8wg+go2kkr5GK3v2TViUukSb73jOpQZNDqIeLMgLnw56PzPKRQr9wbt0usXqW+niaWRQkYwrIAUxt2LSrPrdgqM8TEqP/C6SUzmYAlU6kpPzqGCz9CQpmfLLUQ/kpklAl5J82iW3d5FYtH36HJMxc8Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(7416002)(186003)(2616005)(478600001)(4744005)(52116002)(69590400007)(6512007)(6486002)(6506007)(66476007)(36756003)(66946007)(83380400001)(1076003)(316002)(6666004)(4326008)(86362001)(16526019)(5660300002)(8936002)(66556008)(8676002)(2906002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: yCLNinj1VOxZadxePMSxGwtBlXs1JXrKEmmRkNckMwuLO3lf6XfJR61033FFzoyoU4ydfJHXZHpXysCrDQAZgyQebbX/93DdsIPpM0YwNRQ3sd9Rt+kmE2sQFbD9rOOSNWREkbAIwoplFGydkUK3NEO4S6pfG3xxMv6pOQM9VQrdC23SNaVewix3mXZAA2iIztRE8LjzOAYsowAa4ZuvHvH1Ok5LYyd3/Kxb6ltl7s7Os0ssSFggFcw5EI/weJJAan3e9AxpnFtxiBhKLxV6nofuXhHGkRtd8G5Oov7mTf9bPmtqXwW19JHACCbk4r0ajmF3RUlU6RmseiwmweM9VQiY+khfl5diVKIMoIYtGlE0fhJGD50CRZACtOdXbtCs0+tX8jsLbajJjWdJysmfcAw3y7a4odDyMsrSy1oCmNtvBnMCNTqU6bM5AsU8+GIIfkPgieZxqUln3RL8vHgsw//+SV7YcCPSR12MzIWa0yd7XagvSaEU0oCM6WWUJJ8GZFY8mVf2ctVoGQIEQ1WMG48Jbs3j//lpDfkYiei3J9Q=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998eb6eb-b0c9-4720-aa13-08d82f9718c3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:02:07.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4ZxKojnIAPwOteMRsOrujyC6KNyNf/zJT2ZxiH20B+BFd+wnQSYwCdNM4zccUZiR0a1qlZbcXD6cYgYNApi2mRa5nWqklq6ij+3eI4yHcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 Global EN register guide to off before AMP_EN register
 when amp disable sequence.
  - remove AMP_EN control before max98390_dac_event call

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 3e8094241645..44ffebac15ad 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -678,7 +678,7 @@ static const struct snd_kcontrol_new max98390_dai_controls =
 
 static const struct snd_soc_dapm_widget max98390_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
-		MAX98390_R203A_AMP_EN, 0, 0, max98390_dac_event,
+		SND_SOC_NOPM, 0, 0, max98390_dac_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,
 		&max98390_dai_controls),
-- 
2.17.1

