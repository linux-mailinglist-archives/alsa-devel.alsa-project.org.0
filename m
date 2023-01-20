Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B08674DB6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:04:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47692E09;
	Fri, 20 Jan 2023 08:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47692E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198292;
	bh=9l34JNrCKH/X4nvx21PI1aNB3NuvcrDUD35HM5FU7ts=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JF7Ej7ouPw8vvF5bkFpfeaZBa0E0GvXDge5wWg9Br5lTEzq0KDNJEl8cun/Xx/bmv
	 IEuN1hb9yr0XXDwbS3XUNMZcL/UfD5ugZuLMAxabn9hWoAEvrKYvMT+l5X9IID+P/I
	 vx1SOvI7x2x96Mkw7qKnllLVlBClZKswiAOaQ8+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 115E4F8057E;
	Fri, 20 Jan 2023 08:02:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE3F5F8057D; Fri, 20 Jan 2023 08:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 082D3F8057D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082D3F8057D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OztOX3Ds
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWPVi5fP8EpDyzzjUY4qwLz/mcGVsbpUayB2yjPvflENv6FDhPK5H5mYsYfAwlJCTIwWK6Asn8WKtzxJwpKBVa/XEU9tukkBlEpjo01cnDbmEAnGdvz1tQu7rx6Q9kK3TC0L9Wz2uN5ykRMQJnAqDRGqiqkxSAz/ohO6tnjus8O+gJSK/nsnXcIxbVI5dgkotE38hUk+VaPU9mJHX8mf6vxwnHcam7ukRrRHeobQt+k27O1Rrr4yph0khOLte5o63/+seHg5JNjLYF9buLZLDIq6bLlnZcCJQsnFQLhnQZFNm/FTZ0r7zlT3YvI/la+mzfPKENTfykpDdjdyQw1c0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=dd88b8QzJXmnV+rHMxJYLZUiLdfEaJO1V3IyGGEqOrHiEXhszWkBlJKmwrpXkHvBLl3lHxv1xEtdJWulKXXSAenkLK3bTXGi1SJ06cLPLQ5K9YeWqvEclpIDPITh4/P2J3ofdnWfMxmJhDIEQjsyEYgqxmniaLxFIxQbxfOsSqY63BRIHr4YpIshqmbnZtvKCihNDunId+KfoBJhcvXFU1J9ORRo5PwyikSg4AsGw3fwgzAu5qL6U8VwlxT3Lj6qLFwSAv7XRV1YcPeGfN0h+RK8VmNHuCMC3x3HV80z6UXR6yW8sCyJjUOa6+d0RhDjtRb5cleSCFmFuNX8C/26aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=OztOX3DsbDwU7MTw2dzdCqGlsRWOrhkym6xrQ2edTaA2oPecRQx9wu+UG3pjpVlDMF4JPY+/2/stz1BuaP21E5ddfXDVPAwLyMLFmPhUJYjWzKpwOO4wg25BiubnK91ANTrZ9Zk+O72pYATEezB0Ux5ZfodszTIjsOEM590th6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:33 +0000
Message-ID: <87y1pxk7sm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/25] ASoC: max: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:33 +0000
X-ClientProxiedBy: TYAPR04CA0020.apcprd04.prod.outlook.com
 (2603:1096:404:15::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 909644e9-7066-4b1f-95fd-08dafab44e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFfUN/A+FfnDEOJEPY5ES+ThkRQlkCjkmFozMCXuAkyO0viR5oSyhscr3OwzdhWAIgDI1lLUyYwANVUU4dc9dMuvpzENivN9jd0Xs5PNKRcghGQyLRSLXTu4bNvKEOV0o/uR0/hGEn1bimXhratbGpCh8i0/V97BqtmNR3tJjKcWvBwl/nrH2viaWU+IY2i1vmfPzhPGm1uTylN2Ztlu+s9IdsrKWQOJxs1UpSOcedj9Lywb+SkfsvvKXA1l9Vv44qeU9IMKatL+ucRVRthePNdiKuUcyQbKjdNi1maVjCStuWDlZiwGQSQJUporEGP7FeIesD+yZFM8LOjVvduSx6FPm8D4Oi2tjJ1asUDM4U5ebi6+mh+MXPrenkPi1VTjJPxrKRc00MNXEWMPavKR9HOAw4l7FAWxNLbkr11YsrUfkENcfa+ygrMFkMEr+oBjIU7mgn1G00bJ/ZuY1gLsxbSxsw6B7w9/UfvJMOUPaciuFU6Dt1h2p7LDyO1IsV8g9b7dfdGO1eaYW+dejn0sZRE2CA7cMeXmjseTeyvdp6heP3blJxnm5uplgS14ctZ7EgL8mf9b2JmAIZaNuII9Gl5A41dIL43vbu25ekIzUL383IViTBCZytvjCfPz6rFXRqU7gMozvcPO8B/o+nLgH4y2HurMnPyfzZbPWYwRo23QnsVvpdehZ0PdtBOX4sPx9hEeMmdNkTlpHjrioL+Ksw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(4744005)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WM1t/s92wQ1HCQ8L4asj+VvwuIL4foMS/+RtAtGPAhjRsg4JD4KAyg/s2iWy?=
 =?us-ascii?Q?8xz/kxykHZQm2f0O64zsNFpaM8+SYvD0vv8ESsJkc6zN18vPLFZhYiFO8o2N?=
 =?us-ascii?Q?itGpPT/w/ob5QQjM5HmROcJ+YJu3Cds89CeSTb9W/CovQ+AyC+O29gepYpvO?=
 =?us-ascii?Q?yS22YSnYUFF/FvQSE9wzPhIO31Jao7WqbOAjp/ILPe7w7m1RS5nFenS6c1Z5?=
 =?us-ascii?Q?UYwv0hxfrCiXOZEWKMEG4jgRbYGkWv2H0ZhO6GJv8NHMhUvuhUIVfMFF6xGU?=
 =?us-ascii?Q?C61Lwu+uu0P2SvdPSlmyDymJijXRUELNAHAIjRyP7hDB0Z8w+3TEtCY1d0Fc?=
 =?us-ascii?Q?NM0grIboHW6eDb8vu3fY51/pniaC0rcpBMdecj+Ddi0n8GmDWqDgIZskdGnm?=
 =?us-ascii?Q?wAB8VhrqOyCX4JTNXaWdPihBJFDJIiUQvjG5CWRnozsr2IKol1iKng4eB1G9?=
 =?us-ascii?Q?wAkAdAaxgwBsNXiHVMrBBGRk6a7TMlLXAfoUFWC3+6o16ZB02PBg1Zq2nL0M?=
 =?us-ascii?Q?XYjYDXcFfdf1Vm4zVu1ksTbMa4FZTe2NBaagY9KBq5oX9W2BVigdQhY5H9L8?=
 =?us-ascii?Q?XC3rb3eJtOzmRA6J++oF4rOLj3k9IdiQsrH2/oxQDwQweWVj62TfseaALOgQ?=
 =?us-ascii?Q?Jk9fHNy5oJUWfzI7T3wb0aFMgw7IdPn6p1V9OD5+a1lc6BjzHzMnnl6nz0FT?=
 =?us-ascii?Q?+QiPtyg6lZlTPriufwIWONwZ24fuq1n2v8mw+h5hmSnv2qu3rdAGxUlnmW13?=
 =?us-ascii?Q?lb9WwzmBQGQvdTL9GQTgtcerJotbAY2rTjidAhXEb2zzLwWp7KOG4SJ+zobZ?=
 =?us-ascii?Q?ZmqTLfOZRZBiX0piVPOTYRDbwuQJNf5gn8/Ljf0FS3zZnL3Grb5kCB2f2cX4?=
 =?us-ascii?Q?PSIWbv32DvRDKLTqiuhO+p/EN1JKUjfxASeKh5ry+zSWU8mqV1gogg3L0X+a?=
 =?us-ascii?Q?lRrPvYX++w8em/dgxikuZrbhV6rH8A1c+nJrQCbrZCOGfJrNT78lil+y5Ils?=
 =?us-ascii?Q?6lL6RFyA9aJ5ZgB8j+0A7JKMzPGwOZaDLh8XYFNE0caEOGbFUzsp5sr6yoDt?=
 =?us-ascii?Q?m7sqeX12eQuMoTwqD41wJ4l9NUD+iR+/bGX+UXRU8P40lTKt5p95IRKd3m+V?=
 =?us-ascii?Q?eYSssFwO2ePbcoYQepxKLZJA8t9cEFRx9ZNHV9MBzX4CWxGzqoTRmPkG8wkB?=
 =?us-ascii?Q?TQBZLSRI9gs+8JCUtbLGto7xH9oeDCNKRyFyhg8r9ETtFwgzA4VwSPIfAqgC?=
 =?us-ascii?Q?TsWVPCZ0HNn8yeXkt7DcNU3w/iJoAMgJjDdu8tYjiAVI5GNtw2FSJseJaouE?=
 =?us-ascii?Q?nY2vEhDAPBc5t7vINdw4TgyaTAKtYbDRe4E5aH60Xbs9vf3IHd8fHmfNUrjY?=
 =?us-ascii?Q?T2gX7sBeEPbDpcZ+staqMXrCYFxz3ltRH95LypRb4+3AFjVQrR6ydWTO1P1a?=
 =?us-ascii?Q?evbIr/7d22FTp4Sl+Pas3xyiwGC7BS8UD4SY2zxgniWitMvKEiVbWmIKuf5G?=
 =?us-ascii?Q?8kWSGIJf7kYOWArLCkycj8aAoKNK0KNrF1wxyLEQVj17MApA+CED0jazqIWK?=
 =?us-ascii?Q?Q4a/3uGG36UbGmhRFwmCYT8EAfFlKf4ytE9g8FEGbgM0CfxQWTgxbC9uwCY6?=
 =?us-ascii?Q?aTEAqCU8V8zJ8qHFbCXvRgo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909644e9-7066-4b1f-95fd-08dafab44e18
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:33.8887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70IUdrEeOzqWOu3MnwKDcipTCBGL2Yw92hpqyEuvoNYPueNPWYRThVyofstC+ssD/rZIcHVWkyteREPYxYQRCCEw0w9zwY9ttZW8C4maAATCona2y0sg5kjrUob1d8co
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
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

