Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7612678E0C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C74883E;
	Tue, 24 Jan 2023 03:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C74883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526307;
	bh=vsculmxc1hx+N+BUkp7cdH3YTKpGnSwK8BQpqfswg1I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=asCilGIHfVSpvti/716A2yPUhV/T4ROAadeBOM83C3GZYQfRniWUdEAHyOCyGfsMi
	 GY0FT29CtdVq/7QGJeA8NsBQd2shE0jiuec1VRniIyC2upLsfaY0QjciPsjb6tX1G8
	 BgE4HX8vTjhy+B8mYW/Gtxj6WLMfq3S9ehRyYsWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD7FF801D5;
	Tue, 24 Jan 2023 03:10:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1174F8053D; Tue, 24 Jan 2023 03:10:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B04BF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B04BF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oSn/SkhV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLd9j5tChL+8QKxjXio8ImowK1v9gtKlGEK56HVszfzP4+a+yf99pGk4PK0qlvm7vueQAVykygkxPSQh5BW021Ak3NdKHl7Z4oLVhBCIOLr26FU6akZgkVt+bBqfPQMKtUYsj9qoFylibzi4ARzNiITWuLIuB59a4y91qUKoV/9imoIZPMXgFa2Yn5srEgoIwdSRYKTgilS0Bryr7Y1N/yNDHwmp2XLIfQtXoGYHZxYAB3cgwomdhcrNyqUKZMxie3RwKOIUVb8hF1IxNEczcgz49XnYU7n0ff+L43MxJ6ZKFS/1I0RfPGtgK3pvMPnnVsKszXoIdNX8DBJGRU2QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=TCVeDESaSLeZWt2RuShRw3ab5cpendZenqm+y+PMBegwhFhq6T4WhegAQyM/LFX57JZJfJ0zsDHD1Y55kLkSUmC6fgqYiNORuBFa8IJ8QzK5305y1GSFBeqgKx8Eu064i4XxOuKNQKvlPwOmCR3vqU1YkPrlT02Z2M1nZ/Zg/ftPv2vOEz2j4GkH0Vj1EjNJwC+QjlOKlzJHA7S4AWrNla0ZWJ5bGlWfxceiJ4R0A1JJTAQFii0mpI8ULxyxFhG29ic2lbf+GBotOzIjSjUytK1lxNHL03ezzlYvcsUmyjGoE8o0M0pGIqbAApdYTHeijr5v8JryyyoLA1EICmbEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=oSn/SkhVqzCI/WXjkqEObOW9+mgoU51Z59axAuz8jS4IHmwh8Oyo5k1luf7x/iRbd4Z5LXG2J1S2FUZGjaXoxvMN8JLV7T6jeR7GfFKfsrsFQBgg+Mq5iFcjIB6PihHYqjIOL4+Xw+/7nDW6eIf9dUVQuUuLyq06+8zk9FaRS34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11421.jpnprd01.prod.outlook.com (2603:1096:604:22c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:10:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:10:37 +0000
Message-ID: <87k01cu1gj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/25] ASoC: cirrus: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:10:37 +0000
X-ClientProxiedBy: TYAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:404:15::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11421:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd00668-66ee-455a-65af-08dafdb02f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aqzam9pV4nnxX+6BOnX4SOAT3XqJEYe/Ht3wDAZVIhE+rBHnUfNRMvxZivkgCOkDUT/DC4YxAKi+QHtZTXZJYnXh61D3xVlUY6ggamZGbQgXTdhQXwE2AIy2kOHMCOwBsB41y+Se6tfLkPIZJWXI1VkqGtVLi8Qbaex7GFZ1l5zen0NOhaLsuxYUol15FP3kif4gR2/6uVsFEusijH6LI3+G17WrDJz+pcd4uSLhqgSxJ6T0OuUons+l3I0eiq+FaupN/FCS2Z/wJfQFpoirDlcUVmK6vNmZP9+sQ0BBJ0sgIkntYU82Ik3oXGCFckaDBD4kV18XLXw6UOcfY8zbvvhIjCu5XZXfCfHJJ/ATBEzukhjNhTV7AfjKuJR8uyoz2Ag8tqoLeiMFGg77iiltThrZnRGGtqdAtMZtot4NZUcbadQJw35MotfA94DM3Sqp6rqO9c/6uoK2P4Plx35nxtURDlZtN07jZDvLM6gaLT7eiqj6C0nLgulyQ8HKfUL7blmWEDZjTW1k6l8lAiRu9e8itE5/YG6ayqJspp2jzZda7WPEhyzEbn0oT6q5Vcjd8m8TiH9DRDWwJSrIpGWHRjnortVXCvC5OmIaB/7B9XW7alUDlUP0MHLbGSatEvNePenDqRrOjz8EbqTi1GZgnmyLPaaEGR+VxsKml+CAGOI1g3DbDTR7IVQzDzG2AdK+s5R3w3zHLjPUWTdkWvI74w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(52116002)(54906003)(316002)(41300700001)(36756003)(8676002)(66476007)(66556008)(6916009)(4326008)(86362001)(66946007)(83380400001)(38350700002)(38100700002)(478600001)(6486002)(2616005)(186003)(26005)(6512007)(6506007)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqGdPFWGjvInqQDHICzWRKKc+kVBs5ZVbxWzgtTkW6rSx/1DivizfMeWxphH?=
 =?us-ascii?Q?op7wm68Hj0dnCYwtO9WYvMBTXvGhXcoIR0zeZKVC3mV11yDXRzTy/YzqQN8g?=
 =?us-ascii?Q?FWmLZ+dEv/7fVDLifwCalbuVgUeNS16eVmlDA9m5T7+cE9ZtzcJDq/RJOfbE?=
 =?us-ascii?Q?qXVzOY3mUPfbqmbtkB1fuqdrniEtq+TVkvMI/m6HJXRL/YXPNNddpXXILrfm?=
 =?us-ascii?Q?chX6oUopNxJJpFkxonsBax4mvYcdkEsmLnn0NzETpCl1ALN5TUZ68rDMYyX1?=
 =?us-ascii?Q?4t1tlCkK2RROznFDMJJ25SN8hlT5kHhMwGN5PteT9L5Z+1hQfvdTF0Njz/b7?=
 =?us-ascii?Q?xAwPJuzTz+CyQIIWU2QXLheSHpok9VDlqS47UXhCYjhNDzXdzgwo6gIaFamV?=
 =?us-ascii?Q?2zoctpL4O7QPVU939rZQ408HJmMMbxk4yyAY0mTNQiWhQYtWOO/HR31wFvAn?=
 =?us-ascii?Q?xvA6YdEh0rq/v8VKszRERN2ou5TZEkiRNKtj0d6q6Jq/0DpF+CMoD2seBIpq?=
 =?us-ascii?Q?c+7vJI4Fy6lMY65SJg8EmZmieJxeld/7UgZIDEiS4UPvL1/CX0k7CsuEe/kO?=
 =?us-ascii?Q?KqSTIe5HDJG1gnTNvlisz4bm9TJ+8fnDH65Xl/fTWTpCjT/Ln773fANfQlGC?=
 =?us-ascii?Q?f6H8BfIcZEoxsRypbRJK0ludzP95Mg2o/WXo/Ayy4PWMR7Zt4CxP5AFwYGI0?=
 =?us-ascii?Q?2ru7NvE1UsSkQkox/Wh7CLiyw+iw5E4jsH4UrT1CfQjju6wAd1/BN2A8SGwj?=
 =?us-ascii?Q?0SHfnIuThNll4ty30JopaL6sQ9zFRju2fM0jfStxSdzePg+dphJmdZ7XkIlK?=
 =?us-ascii?Q?8tgot6Hkqv3R0clvU6FthL/+KPyoYenFJIsoSnPuTzh49d+LNdv4yU3Bw4rq?=
 =?us-ascii?Q?blFLeJxogMT3XZFA+oHmUfoZDggY1B+3sL3XO0h2Lb3jIa1uKAXLdAsj9/bU?=
 =?us-ascii?Q?kYQAUxa/Pns6FRQ5wyIibTepwBVQYg2tnyXkwXppXNXsVsly/tYISdMBaer2?=
 =?us-ascii?Q?53HkJe3LxqVSsnQH4uR0Hi4mPNoXTiKT8fVBMAuOPcH44XMh26YmVD9GKKm5?=
 =?us-ascii?Q?NI1PgIjExP7qKqpUo/Tf4cvmMoxel1ju/k0xNcC7505OYf7IpNZ4Q63WKbul?=
 =?us-ascii?Q?Zol47smZRftER9cB06lKh2KI2Vavvz2SBbvTNVLktG7fFF12ZMvY/qMMCyRB?=
 =?us-ascii?Q?Tg+8MZTw2JUizv0uGoNzgLDe2kxEyErQK8TwU1sOgWs6uQWdw+kswWcDNIJD?=
 =?us-ascii?Q?r31C0/ZXzR7XBojf28rbinTi1WM4j2X9ygag9lmZBSVTM9ghAZ34WdLmdrMu?=
 =?us-ascii?Q?YT61gWEpreO96HkiZpEDCpmdnBuUiTOyJasiXUQT7os/HPcgq640jHlSHcF0?=
 =?us-ascii?Q?kbkyaDD+1OPTWtsUOdHyJP1cK83W2e8G/G/29W0RsW2GSqCk9qxRR4SHNFvq?=
 =?us-ascii?Q?w6daIf3Mc18TwrxfFql6bHyXtb94ufQL/Be6CDYrwbc59EKuONOfhj0ACK6z?=
 =?us-ascii?Q?OX1qDutlwBghw0irKrVmwqXUXNILNkglULwGbjdaqk5P2m9OQ3TgWDSriDNT?=
 =?us-ascii?Q?0JJrXASXIWLqP5NBD+uwFq8kfOHvONM/ySfDC9ohJK6awsHnmKPN03X2Le+v?=
 =?us-ascii?Q?qMP9p7tstZtXhD1tI5kmbOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd00668-66ee-455a-65af-08dafdb02f0e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:10:37.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG/Ok7x5J0MoVBcKJHSIq5Rg7fkpGhokYUCvyPd+Y+7ak59t3n0+ioJfqLXzIbGhxawBWmEMfnyRDElSydPpbOBuRg8ck8h5fwneY29womgts8hCZVhxQR+fkpa0MfJ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11421
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-ac97.c | 4 ++--
 sound/soc/cirrus/ep93xx-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 37593abe6053..cec067c91a0f 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -323,8 +323,8 @@ static int ep93xx_ac97_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_tx.filter_data = &ep93xx_ac97_pcm_out;
 	info->dma_params_rx.filter_data = &ep93xx_ac97_pcm_in;
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 982151330c89..8265173a7932 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -202,8 +202,8 @@ static int ep93xx_i2s_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_rx.filter_data =
 		&ep93xx_i2s_dma_data[SNDRV_PCM_STREAM_CAPTURE];
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
-- 
2.25.1

