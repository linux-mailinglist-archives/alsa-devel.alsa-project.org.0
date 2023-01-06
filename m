Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895E65FD93
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF12614136;
	Fri,  6 Jan 2023 10:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF12614136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996870;
	bh=nS9gbnxwufmObv6n0JCGQlG4xZiMk9YsU4TFKGc2byA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NmYiTw29THJWherR9utxtVXQEQWczkFZcWrMVKRxvNZiitAsTkFFyp0kuvgpg3HyW
	 eNYiUnmCvPln9XC/0JD31+QpOtLbDoZZYyinuBDFoXen2r6STSCyq3RZahduF+Opbu
	 DnZ5Y7C2hUfk1bAeDvf/J2HHbrjr91FkE9Cr358s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DACC0F805E8;
	Fri,  6 Jan 2023 10:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A1AF805B1; Fri,  6 Jan 2023 10:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 880B4F8057E
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 880B4F8057E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARdBkP7Kgx+pGPLpINExNM85llX2ck96BYf3poHBfqiYDUGX3rAVNv64zfM8QOE9LxW07YmivxZElzwqcFAtmKU7f6+ubxlcF8oGjPRN04QO4WJAxIrQl97QIXwkf6EIFA4Yqa13DuZyt6yYFyo3CROVfrTjf/FaXfctCYBFvceiPx4exUsGoUtdLmVMOfotHMxMCfwVq6xCJsXh9MmOsNUot6mMVCXeJLLZEsVnTR4w6X0WQWDt7xsjRT0nmifrvj5TNn70mfyKRPO0ZknwKdArFLRAbQ+hnT80mIrm0DIitjSpX/2svvqwOwPnD3pxh7XuhOEFUxpmARlFNi89SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA+ZO2SQADMxLPUhNfCsUBUr0jRQNbQcQrMQkCAHX+k=;
 b=IAHecKwYbegLF1een6cQ8IYhLrgFa6zqq8+4wmfnnVSMB/t3hn6dXTLvcZC3FmRGvazVxUkl+QwbjFVLXlWkLpsOF78QeDhCF/B/DS0s7vO/YefhDXI+09O/CaxLDnNtDVH8S7kQjPPFqwRutJVZZx726/TdBXLYrQt81OHDlBweOgpkSV/vH6nFVffGc1LxWTF/dG4RowfRoenC1tmf3ISEQ8YuAOLiAcdjQDcJVCLj6bWEex/oA0bFxtLu5IsknKbF9YeEvJp5uAdqJEwse7IoZ+AYlAtJSE2qaY9E2adNrtL7M/qcO2rz1omcnX70x7g4/YkkPV/1qvhNCd6GaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:16:00 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:16:00 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/14] Remove the shutdown and startup when set PLL
Date: Fri,  6 Jan 2023 18:15:39 +0900
Message-Id: <20230106091543.2440-11-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: 530d975f-61c2-4c1b-ac42-08daefc6a075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WR/z1ezy8FNNJh3GnJOTaqEUsAWDE3yU4d500FiqJ8HnFaJLKwFvoSZ4dEzqZ3+TD564ZcinjrJZgNC2ZJhkdviCruL0hxg6guNZGjMAoJaG/q2s8f2/zuTzEnchx79tvKA9I2LNdUlRrdokLdNIIP92iNmnJuBvCSWa953dzXEzBI0tLjvzNp3i4Ivu6it97Z0k7keRzqr2WFCIqmVKz/kXGkkOau6L7j3ExucBVWrFmz1jp00A+8O1zSLGQ2zpw8BTDZI6+P+KizQlTdgsPzNall82OS9OkIp1ABxmWkgUwwmNFZlhzCjwm1qkFQEejqgNFu9parNs/ESgkJF09KhQcLwxuZaJmJyOyE5MJIixnJkxAtWIdSvg2g7+P0/u4xlUxSvpfWkOOvE8tRXGG71QelCbNKg2R9qS/RtCOHjlmRTWV+4lbYTsOKSE4mpnCnH+iJHVBRdLiRotSPw0eB7yLdMPcJHTCy/FpOvKqY9GiARQOJRsfQp4Yvh9blzk46rMz5wfU87Lr1RI/vpihtsXuMgZP82HNbmBZ/cAJHIuLgO6pJ7yFOZlfMUXXQkkWwoT8cOuDCNBsAzdIob1sMMDot9saTyCcpqbPeIkROiyvMA2qj742kgTHy2TA0kJpKeVGUBaB4JFU8I+vRrwqi4PcstKMEBXSVj25GUdGH+KeW6Fvg4xOi5fZ12Evzx6oJ3401G5OUy+dHH6XcyAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(4744005)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssKVoy6Fn/LiB0aQrX3ne1Hfs+d7NoO/4FQmqivCLv4pkfPxzdAm+R5dESOa?=
 =?us-ascii?Q?650hpOOenV1EmfL1TG4p++b2xaUgNQ7q5axz+2AYucjyvEfczKUsQGSoon19?=
 =?us-ascii?Q?qPyMRfeZtm3R1JmZ64wirVHj9n+Lrf+RvxrJNgpUuPfrSPD8AF2RAqGcNYyn?=
 =?us-ascii?Q?Q5RjEpDDG9kkqMUI9BeNfHCfbwAlkwyMNCXMeav2prqoBod4/0iFY9PGFiz9?=
 =?us-ascii?Q?ej9faGX//pzUbEaPTgWKnOJeqMnso4O4xVYna0ITML6nwhNPiBJNLIFz1IQD?=
 =?us-ascii?Q?i9l7tLCE6Dadws1EmXpo3rpORV/tARDsTgOW56Gpbm+RjzXlIY+puUAvBHxq?=
 =?us-ascii?Q?S/zt4BclMaQTHRp8zwC0CbtQk0NDy8u3C433Mo0sg73NqIvkn7O2o1fdzxed?=
 =?us-ascii?Q?AYJq/tKj7yHTNA+G14DWuyRjR4mRdjZiDdHoXzRu6SrVoGSNddmrs1j9MFwu?=
 =?us-ascii?Q?kWGuXcRxCChcTalQOkg1TjAEi6jA0wgY+WMhzYbT10mv0LlTV6NULYvAzTdx?=
 =?us-ascii?Q?CVtLlG9Yd7kqTJ0yrkAKyFCJQWiYxx/vj3Mjpila7YWh/Wo/oxfr5DL9zLj2?=
 =?us-ascii?Q?MlKjm4leMoPCXs6khMsdDhLaLTIRkJEi1fGC0+mbhxTEtZwnU/JtRszWCNys?=
 =?us-ascii?Q?Yhitml50AcBNtU/Xqb6IQ/9NqyHHwaSq1RtGKo/qtYp/nJMQ5tcXAjitHFiP?=
 =?us-ascii?Q?Fk7CA6mjkU2hGQuT8UoGhwwSmi5phKgS/K724bjYODkffkhROOtMwRp3akND?=
 =?us-ascii?Q?Pfx2JQhNzPYH6IurNIaa+HtNMHh44U33IZg2j4cNMZJtEmNFR2lFE3Y57heI?=
 =?us-ascii?Q?vA1WYqHgmEm2yM8JTuGKBvhDIt+yOPdd6azDHfhZCguc8AUjnLaQax6QCgwg?=
 =?us-ascii?Q?OspiOiknH40em3/d0jV72xnqaa7WnTc+8nzAfzV4MOqzFTrWK6yu9MrOJkbm?=
 =?us-ascii?Q?Ps+ScVS1LzEmyTtDl9lpzyP/eTu2Hjvod+u6xPrV54nObTJfaH8oMG17wgMm?=
 =?us-ascii?Q?gt2LrBPScDqaX7aC3esDQ0uVIsl+h8rbzxL5/nti6XcMuM9PLboj0WDyaJCt?=
 =?us-ascii?Q?EyPHd+oOVg2xbfJLucny9LU7sMYTGGuKJ91Vgd1nvcNezOv9SqA4PBGkTUUh?=
 =?us-ascii?Q?XlLGfQCjMePD2Ii3VftYZewejsvRweiIUpcDANffYuTvr6ygXo0a0Our97Xy?=
 =?us-ascii?Q?E6DGlfMeg422cnyLdOcnfMIReKZ/guACvIZaRnhFA5KoNblVHoPuYTv4uVK1?=
 =?us-ascii?Q?WJDV85QAXZomVR01fjIT8ZJM7t9VqlBVnX3Rg9R2KDhoRimccMO1489jGV5h?=
 =?us-ascii?Q?0qCnyDfSxGGoduVbln6QxFLRdM4qL/UsW0W3446QkTDqYHP7B6LU4HRGzrsu?=
 =?us-ascii?Q?R4K1WuvfaqNpiO9fN0re7pkOCm9CJUZsLi33bS6eMvTtwlpSIzawvL+0GyN4?=
 =?us-ascii?Q?23b/njQh8I5vKdlNbo2iCROhkZBXye+StEyKD/Xv0bhiM5yCxSJyjc0Vt9GA?=
 =?us-ascii?Q?8nv8bGsCs8Fthlh5CW6faSbiN2R6WrBRDMwmq+dO2x6opQqE7AsXmUKN61/h?=
 =?us-ascii?Q?lUH3TQaN+vtCis5aRujPtHo0vKDUwsWjsBXKVT6qlhkmrneGTXUjHtamLdoA?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530d975f-61c2-4c1b-ac42-08daefc6a075
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:16:00.3944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBPPbpIkxyfaexNmQVGIV/qXQu3vZNwXLKbUEUW9f/j9KIi1OcrnE+uX8UpFwmiK1kSrlGthkdOiHFaDoJJPtnq7tDv+qC9TKIvRxcRA45A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sma1303.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 1991c8d21ba3..0b4ca935ae9f 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -943,13 +943,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
 
 			if (sma1303->last_bclk != bclk) {
-				if (sma1303->amp_power_status) {
-					sma1303_shutdown(component);
-					sma1303_setup_pll(component, bclk);
-					sma1303_startup(component);
-				} else
-					sma1303_setup_pll(component, bclk);
-
+				sma1303_setup_pll(component, bclk);
 				sma1303->last_bclk = bclk;
 			}
 		}
-- 
2.30.2

