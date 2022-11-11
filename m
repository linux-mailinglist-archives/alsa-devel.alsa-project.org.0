Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A2E6252B0
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:36:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9823E1633;
	Fri, 11 Nov 2022 05:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9823E1633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668141363;
	bh=Z2GjF0XMq6TsbsAPfBIUDZ4YShMIDh+IiUqRdOcmB0U=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qW9cverOjUrPc5dX91r//E03hZu5ubfTzuR6AmwLJaY7oKVqVtHViRxOZcgp+UEWY
	 jzkdnHMIbHVmR4JAikm6AcmdwxMCFCr3p6bZ2uZ+1K9lfAQRT/VbXpsJzmUDEvv3bu
	 3MaUAyAJ2GDXdxXxonlqig7CzkW2oQWhf1Lsx16I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0B1F800CC;
	Fri, 11 Nov 2022 05:35:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC2DF800F8; Fri, 11 Nov 2022 05:35:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ACCEF800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ACCEF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ZIBMDNqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2JRru+/S5c2puYGXYwk3fD7nHGT5pa7IuHdgLFXKuIXXan8jGzxz0r5o6k+qeI90x21OqFM/4Xk1OOtTXXKB/DhqQtyXQvzaJHuUOICEfFJsLTLVlSvnwIt+qD24HahgpAWu1EcF/1ebgpGOprMMWtsd/DvGAkqYbELPJypRTGTt4VayCIBsAr1S6jHgh7m9dlGE+Q7avHyHoF/dX/h9CxYsngVZsIsoD52V+gnqfAGv6x7t9s+0kkB+cSiCnqI0NM3AcJNgDchR5wnZVzwQznbsTiKX9/WAih+6LQPZUUvR4kCO1to+/6+ApY8r8CaP25WquaX1hqX1k8jcxn8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KOhZBJDSO0p1ijkCz5Kr6tf/14lKuHhR6Hc62TNi1o=;
 b=HwxGq3UnXA9p/jWaKq102bZCMFXjy9D60DakfoKx5Ho1rRODOIYnZnNKVReRkssDr3mzP9/QLqf9/eue35P92almPcY3B6DwqCR7ZZZJo5eTIg4Pdq7EGS38oegdQZk+akwCNl7EPnjFldZnG2FtNXaGG0JIHT85nXDFJCSd+4PoeCJYE39XQAf7mae2v8dCivTmz+VOLLUe5O1h+Fnjx8GjEGomn29abNexN8tWqfgrqPMgzHQWkwJtgZ5OyX6RiAwiRwzfWAsYSZOjcyIdQVriN0n5RyoMrjQSn+jDSU9lD6hxNvB0/RmWEMSDgk3C5h5AQi8fQUGovQEwRevYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KOhZBJDSO0p1ijkCz5Kr6tf/14lKuHhR6Hc62TNi1o=;
 b=ZIBMDNqUs/OUzZDoCMvBZ280TS9gRq3Np/oEfMsuWzf/iVAZvsylKPlX3wRcb9k/tsHCeeb2k8kon5JLBrRAdLULix8BGrLZ0uIzkyYQ/5apIQpNt9Yj4Qmvruk9ALCUm1w06WuTF1j2qnIqxCTdS7P7sR9fG7PZVp4M7tBwo5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5762.jpnprd01.prod.outlook.com (2603:1096:604:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 04:34:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%6]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 04:34:51 +0000
Message-ID: <87k042nm6s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: remove Experimental announce
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Nov 2022 04:34:51 +0000
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3f75d5-65ef-4015-71e7-08dac39e12ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eK5zWJMmDicL3KmO9NaHq0EBWlw48itoCqVHMsAfP+OY4Dzg9jvOQHCedA4EiFMrd8fkrgqK1UzVRY5ksvm+0fCMGFjFPGEdiET30SZ/x+oo4Wkx4AzMzcYvfW19QoQSB7ozHChsuElP1z9bRJ0J4Kim7xXc3qJpSAPvtEcwKfLnwks9x2peSNPXhLhh5+QWUVLk4aW/buSLDGzFI5EPqzrjVV0CENQbREHj/A4GamlMIhhh3tD2I/nqNGXG63oE8+ABfnYResRVDwU9G/fMFYy9A1RGGIR8PnJoIeNB2Q5219I+Wh0QeFSqIPccAq0lgt55sYqiWVn09d3sKpZfzH4qr6OiORu5Pc4TjBpxt775lBh3WDj3l+AIbb7t1B//Q7WZBWMYv1G+CSGsy0eIFc5ZOaVgVOFoDlL/21wMY/eMAhgpvY+lGJbcbZEyMRs2D7MZChI9d4mpOFZHt0tIwqlrw8++JwStyOqAT5wfTHmRdUhkiEcM9bwiVluAB9cPGYsiSjkb7lVRWtHnxLZq0jKr7cEA7tVszHbe2X1WFTF99LcxazO6DoQ2aLX7bUDbwWp9AGDvCJpQ8WdRGuBblkGpy+RVY+yliJHCn2TyZS6dErIzPcCtw8fzb5rvPsqfNeFiZv62KHoOoptLOILBIzk+lkFEE0HHUHObRIapA6DBslbjqrr8OjbluuWBR3nZLnaa8oKMtMIAkRhrXa+98Ayi2LSMDmkf5AHBDkLFkgvtEMXo1vaBG8m2q5tdrvqFVUEpF7VN4mlazUSBpERXxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(86362001)(2906002)(6512007)(38100700002)(38350700002)(52116002)(83380400001)(36756003)(26005)(41300700001)(6506007)(8676002)(6486002)(4744005)(66556008)(186003)(66476007)(2616005)(478600001)(4326008)(5660300002)(66946007)(6916009)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mbcdfd6Mk62OieQWnZoZGriLSiHabOvIbTxCxplEqYH/U4BF3ZqtbOg5CGlx?=
 =?us-ascii?Q?qYzQ6N3RyP1qiZa4QzvFxeHvsTHnm4t2cL3iewO9VL5/sSa4EKB27hc+c9B0?=
 =?us-ascii?Q?86y8NiZWb1lEtSGAgc2LK2B5Um4/dykgDjNLYh+aKUlhIQziW4qRfxG24Jmt?=
 =?us-ascii?Q?c8EQDdcx44Xt99YceiaBuUfcJ39hQk5l1kH0ZCeGiWwehI6u52pwTVvtmiaO?=
 =?us-ascii?Q?dqe80xN4zhTZXYwiGpew0gSpWGby8/178PnUEvn39o+WcsU48Z18c9rhbuet?=
 =?us-ascii?Q?SB84GCFzl/UCNiI2NOYt8mOr8jAJ+O92zkGUIUn8A088zbsPR1ZRTMs8JT30?=
 =?us-ascii?Q?BbSZf1FNfoYcuZz4WLdFjjQhbtzn2nkmp19lfkFMX8jl6v4OBf6d6TksgHoK?=
 =?us-ascii?Q?YkzqdBbwjGeU68koyvjVWwVz01ATWR14KuL0KW4Hn9O8aT6gGPpFkwBSbzSb?=
 =?us-ascii?Q?Cig2QetT5rulDMWkCx8eyWil/c6vzKAmYIDAEmz1oXcafnxMjcUZei0KZ1KQ?=
 =?us-ascii?Q?C8ZbtlmUHMVB0kJIV54ZwGBrS5FOedRjosbKEJd3ut4d/12l5Z1Okesfgg+h?=
 =?us-ascii?Q?88iMmSqOfqwAyBGgRW+Mcy9SFlffEmstsCjhoEYM2jACTDMEcvXSuTx/MzDP?=
 =?us-ascii?Q?JJZkMgkmWLUW72kqKSiKB8QG90JNQIznIgeldrZH9Cb2TzBO3GX2bQvh9ulh?=
 =?us-ascii?Q?i5BkK2tfBsDaS20zO7B54TRKj0kGgBSUqRWIuyMrpSyVRvQ0noQnFSUskcyp?=
 =?us-ascii?Q?YPJm4bDATnXuiDbcY1vpmLmstF6uZd3zCK+ARyAk81k8qoKB7DJN1PU58Myy?=
 =?us-ascii?Q?1ZEhTjcTZhVxDYWwp84voVtAI7WSRrjnBR/y0yRNxqVxU1E2U+ew58jSsp7J?=
 =?us-ascii?Q?XuLbrWpVlQ6LDRLkFQWVhK6bp//wOgzgplCGUXWmOdKHsr4XVglaiXoNUeJp?=
 =?us-ascii?Q?LY+kejaqgMGqAZLYjrS06OlIzn8+tK1SUKuDyJrSGpmxZvu4J2h0RX9+IEaq?=
 =?us-ascii?Q?iLg1PyE6gpFR/X7EsDcTVnpuQjiVnXfYIIo1ReH5pdMCUHESDD/k+kr230q9?=
 =?us-ascii?Q?WHh1846BoaFL/BVdttX5hSNKMXokyxhzY1T1A5yplqLOmEoJ2WCGcuo6ViFr?=
 =?us-ascii?Q?X+QrNHn5uMbhJJeAVt5DHSm4sL2mFoarLUQfsJHNkpqNn01Rnp+BRh0bWLnu?=
 =?us-ascii?Q?CPNQaSVrYaHQF8HmIxxzAzRfdZZCo6rzno8qwyBtzHoLgzceDqD1JIFtmTnL?=
 =?us-ascii?Q?R28e5zSx6I51E/fhZ3DWdX2UV4f0nygutMsri7nOlj/VHoKU0Y3w/VTu9n4T?=
 =?us-ascii?Q?DBvz0ApUnOwN9pakmTJepTowpuqhtjHO26lN0+RKZtZ772rXMaxD4Nj46R2+?=
 =?us-ascii?Q?fJeLiuUUD/3Z2GithNh147KJyCNMj63Ix2OY89y381d53zm8NLIDpXqwrmW1?=
 =?us-ascii?Q?zCzY/i+NRT9pof+nA54j6MlOjSmOat2h/nuPmZsmaDPjf8gqNy7NBHPTEXYE?=
 =?us-ascii?Q?5hKtBjwMsjweHPKYQIzYD8yC9iyeoKGgpHSFEy6yUVZRuVYc/NyIjUusRkQ8?=
 =?us-ascii?Q?h0R5iSAu1Rh8XL8dGpPSB0CZINQjFD2T50LnPNInOKVgNQ+Poc4U9RHV/crE?=
 =?us-ascii?Q?X0j3ht4IAoPl+bLOapqyUZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3f75d5-65ef-4015-71e7-08dac39e12ee
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:34:51.7149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYAYTDOhNP/suPBFj2AmlChLu9x3EBgL23cGqtZAMtI5OVAj3er1C0cJuV23DeiO2bUDMWYIm9SQCoKmEvz2Lel8mozgAc3b78N/kcV06RjV8O5zRc0VlmZRJb4QC8t2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5762
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

Audio Graph Card2 has been announcing "Audio Graph Card2 is
still under Experimental stage", but it is time to remove it.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8ac6df645ee6..0b0fec9ada51 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1271,9 +1271,6 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (ret < 0)
 		dev_err_probe(dev, ret, "parse error\n");
 
-	if (ret == 0)
-		dev_warn(dev, "Audio Graph Card2 is still under Experimental stage\n");
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
-- 
2.25.1

