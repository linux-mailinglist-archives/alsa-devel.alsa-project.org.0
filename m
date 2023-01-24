Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BE678E02
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:11:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A70FE10;
	Tue, 24 Jan 2023 03:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A70FE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526268;
	bh=9l34JNrCKH/X4nvx21PI1aNB3NuvcrDUD35HM5FU7ts=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TvMF5Tf18XeqOEbcaJaU24McpBtPOLaix//Pvpw0EKbcs30omEV/tFdBrD5310IHq
	 bFyHwnGCUr2uXUi/wBv+53ON0ONCmxowRqB7KPpMsmbgAWBkz5kHd958gYJ/ISXKWt
	 wuoGkPiR15+bpahZf2E2QwAgoXUh+TjPIFdvn0Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E782CF80515;
	Tue, 24 Jan 2023 03:10:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AAFCF80515; Tue, 24 Jan 2023 03:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A4FF8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A4FF8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kVXrlUdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2T6t7Wtu5ec90ZkX8yYKqvJcfvx0jyS6m7EH2TFc14BEFlTbKOeCIyvzOSeKLLsnC7tZhzCruf6pZWwTD7dc1rjHkOt7tOm4AUbr7YEZU8mjQejAHGyge5aXADlxO+oGN55zyD7IrmoOKjUTYHXVDWZwbL+iexFa7bRm5kAHTv9c+Rnk1Mi2F+TZI2BSf0pR2J/xCFJ03fvehPOFOX5eQxtFVef9Kk2c2F7Ieq/sqlh60sVsxHXyPPY+DWLf6wdCPWeINzVW0r7T6h0wdOxvLaw/SSlZ4utq3WJZAiUZJfcHUdrTwz75kb62BEHgjm6DLmR/k3wNUn08XymVOFvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=V+kt2UtQ0Y7xVVJNdypL9s0PlOx+jukQagJb4+hz+LlM5GVMhIfv4GMZl0+sKqMUFMQbdVCNBeRuX/K0aaE2QT24i4P7WsxIxU1RZIBJccKxDFheDuKViLDFYfnHuhsGU1wv+JwTeA8iOe5xls7JQhRotE2FQimjG4/Sk5hmTNOvqPbo67L94wMHO7y4fVDqRaBYgnRjDxtdH/p03PWCSB+h92cZIOOpTzlTclg6epCQ9/9qx2X+dCxdcfUbbYKkjMyFKzm+XUm3AeFRRakTkY36oBjgR4vg0zAHqEghbQFGdejNyPTMRop3n6Gs+ygQZe/TJ0wPrN9pTlixDJWo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=kVXrlUdCBymZRAH9OSTEz/yEAerObGjeffFnBx7mPQql2czOVMG686HoPagq3R9lgw73A+Gt8caFDUqEzoNjk1Jj3oQ9c/UHOlWcKYLo4ejEuk0iaTLQyf98JucW+Z8NvLWfQgdbyvJGJqwKqRl+HrXoHvH7hO/4OU6Y7AlJ2b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6128.jpnprd01.prod.outlook.com (2603:1096:400:61::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:09:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:09:53 +0000
Message-ID: <87mt68u1hr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/25] ASoC: max: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:09:53 +0000
X-ClientProxiedBy: TYCP286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 888b5805-a0e5-4e0c-9fbe-08dafdb01505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vTbReOJweuHca9sXl+MvwMa1Rg7Lj7WVObtb+hU969fVHpxaSF65bZTYWE93vWFH1ohjH6dusC71Uh+jyj/xOBZRgJvD1PTdyEP3F+TFrEzm0hArW0av9ciCqFzUu+ZJw8fCJ1Sj5bWJjQjryP3qMCBsoj3EkGsjPWka9l7aynCZoX1fBjUqhuKUr7M++PcX3Lfm64PwF8QSwaec+oAGWHSVJU/k7THEDa5c9b8h3/lAs4XtwuGF+tpRGKIK15O09i6WkJch5KCFFKq5bGlG6Q9uq4HirFWw1swxFMotEma5bMEW4RqOu3UbJ3aygzY3XYkvhDkhrp/ih0RtdMqlKXnQNhM832oUtR5NxANLVQm45f6LLbZjSZJ7B4uVD8N6v9tLtdaf9zegUHmV7LxBismWn6oNsHHN8WjtaBpurKlxUcfwebix9Js7HJ5sHdiRrFVFdN2+QXOlM45wcPFSt3rK1fmmSj6erctx5+d58qxADPCt6Exj0gulOxbsVEyrhJvgmB6NGjrWhpliJgKj9lGPatc1nGxnCnObWJQOwSn1uk4r8ohmqh6w2Ww2jA/sgkZqds9QgNw0r7mmq5ZqnDfa3UBwTfxKchwQATimSGaAT4SiCNQE2jiM2i7nBuJlemgwlEIu/aW1lOLR4PDyaVbsUbH4tsArhRLg1UG1s68CDQ4J5Q1igrjfY67wblRI2M0/vUBPEaIt7U+WbOUVDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(36756003)(86362001)(66556008)(2906002)(8936002)(66476007)(6916009)(66946007)(4744005)(5660300002)(38350700002)(38100700002)(6486002)(54906003)(52116002)(4326008)(316002)(8676002)(41300700001)(478600001)(83380400001)(186003)(2616005)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uqMAhXEIbcpIXBNKEEaSFFmuCThm43pqkmMS5MQfscrM4zXpupIa3BGpD3iG?=
 =?us-ascii?Q?QbvVU0cJBtMPT5ZPJnYEeTBe9irjz2Xi+lIRWTsTnkMZCy5VypfkXUe1gf1I?=
 =?us-ascii?Q?Q7QorFyyCdlCihcCUhEGJUYoLAROX6Yk/XKtIXiFlJ0uYzTAWBjqwWS1AM+w?=
 =?us-ascii?Q?XT+lA/E7rmhtEvjq3O+SWMLIhtzYtqFWGM969lZThy+v/2fn0wHb6s5filug?=
 =?us-ascii?Q?FfhlaU01lopjfM41TE0YFvGMAkwcQ2xI9E6P6ZOCqAHCEpeDjbVe1zbI9/Fy?=
 =?us-ascii?Q?ggMIENAVLIeYjxLZqnVbx3B3l41jeuNS/kIqOQcjTMZBNg/CdUMgI0pwzQmI?=
 =?us-ascii?Q?7XfFavD9LvI8c1Y484iT6G5gBItdK1egieRbBQc7idkjbRJtpfH3wpSQsUp4?=
 =?us-ascii?Q?+CKuIaQdDKgU54CbglZcSDgvXqI77wPkTaSmwEh+bQuVo7u++94T+QHyiIUB?=
 =?us-ascii?Q?dtKWLOQaCmkWGogLEtLOYkawu6LpdSI50XJcC8fZc2gvuRS/NT42hFQpi3Ik?=
 =?us-ascii?Q?mBaaEUNXw0K0DtRaJXLTE7azUCeB/rZG9x7ds4iLJytnbokdMvHzDL+9f+J/?=
 =?us-ascii?Q?KZkNU8YAptyaTmYE6Y9IggFvocgdxEmmio3EZYUbvHDn+Y14E4vsvVNyTCGc?=
 =?us-ascii?Q?sHvYB1bG4W54LmlasQJVdN0rMiQpmALoZPSAW/Z/rinCuvotRKS8jglye1ZT?=
 =?us-ascii?Q?NAtvNt3NKXasH7PisrhwHeoFbeEybBjzfCLrLmqmAGLIgImvAS9ft3GGs4Gk?=
 =?us-ascii?Q?py29lnz4GDeMNvBOekcTj+0LM5bab6FmmkfZyOI38kDO4do7a1DJqxR2uqw7?=
 =?us-ascii?Q?+fbZGJDc7b4tc2BwjFMuniLmSg6Fbbhmgz5z9U28btbAG/AFobggQEnH2ijD?=
 =?us-ascii?Q?zRX1JXdIyWrGYKbVo/4Gb8UWMN4g7+B2Eq7zaIXnG3P5szo/0KsToZybPrMq?=
 =?us-ascii?Q?CDq41DKkkVLFZQwJSNJOS3paho5MVou8shV7P+JqpZ9L1JEw/jRa8s8r/dB6?=
 =?us-ascii?Q?PbDi4wdzTaCIu5T3EE4ao0tGDWpv/9bdVg/yrJT15kFil9UycUrjStIJb4m5?=
 =?us-ascii?Q?yfxPDGFAkP1tYEPL458vLSMtihrktot3ceo6t4fu3DaGRXSMI5rTjdt8aZH0?=
 =?us-ascii?Q?nFIbVHquxv52xv8KH9KcDQnp34W08AW1NzAPJX3SDMHpky3z7/2VyKgIUE9z?=
 =?us-ascii?Q?Fs/hVM6Lmop2KJuqRWqkVJ+W8ugW0Q/SIcdfrQOZv0xplSJo+na60YsQMnCm?=
 =?us-ascii?Q?ExMo1fvdjjM4LlapBA99NpNmonQwlVnZNIsbnH565IkA7MFGZe3QAPL30Wol?=
 =?us-ascii?Q?WvQ0FCr0ClOVXZAoqMoPj9hBYxq8vcrvEguYy+k91sIGFix5JaX6+6ejwsq3?=
 =?us-ascii?Q?4B2MG6mMwcZU9nSgbJcLRhtXgcKAmb1wqnFERitGkDMO2BpYTIO3wID5Qq/u?=
 =?us-ascii?Q?L6AzAdnmadTsQoF7tfRfyka8Y9tnJ14otWgP9Zkrgcyaycrn8GGibEdMXTW/?=
 =?us-ascii?Q?duSuMV5niozh9g7H+R2+dsf15Je7TcW+cCCzaFiwicvXM6VrhenCPp0KI6AL?=
 =?us-ascii?Q?RrW/lvZCEKV/zbHou766pCiZQbIxrI5P4SbjcwvzxlCaOcW0c6n8/jGvP17g?=
 =?us-ascii?Q?x4WxicpRiJsJHxk4EidwcI4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888b5805-a0e5-4e0c-9fbe-08dafdb01505
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:09:53.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gK1Rxgw17tmQ24OA1/eU5bskVjaVNH50G/2P5PgHEguR6Du72kC3awSRitAhyTV0CcZpjMXkqE03BbvzkxcdxZFskjDrUovcBK3fQMGmW7N4VqqVnMhKY8pEELR/+ZXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6128
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
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98373-sdw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 3cd1be743d9e..c9a2d4dabd3c 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -689,10 +689,7 @@ static int max98373_set_sdw_stream(struct snd_soc_dai *dai,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

