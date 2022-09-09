Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A005B2B75
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 03:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995911674;
	Fri,  9 Sep 2022 03:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995911674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662686522;
	bh=KMcFI+m1Z81z+VMXY9FmRMdioy8gj0U06h/K3ysUWJo=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m3wG8d8JNLYmE5/9VlRIrECH5pOuEvOzAcnZPyaJlP4kOzlgxdXL0xtiSYhpyP+LJ
	 ziDo7kxMIWkN/MtFyR/p5Xo7I5Td3pZOmkoKJ3H3M/Ykr7K/U5+rrrC96cbdM/+rdZ
	 BYmaJq6yOJfxdWd4bzgonBuELLGN8T3mSm6eTFjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C29F8011C;
	Fri,  9 Sep 2022 03:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56D6F8016C; Fri,  9 Sep 2022 03:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB43F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 03:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB43F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="lSe7NyhA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVxdpW3fWTnEWHbVuxMihqierAhmIvVkdVYqtSdrzIdZtm+uRPdvf08AFYSiRJ9RqqN/VJ0xq5/d5+HGDnEsRCrM3VMDYHvOG/u1DqtgkQgHq3Cf2uxhKugkJpj/Wkz1jLdC8Gu3Ur3W/S0/6pq7uTO7CS6nhrzBtCRsAhn8gkcE1KdtDCfkVrg/w0YCRsMzhkU/wyXBKoOzHRVTGt62DwHTvXDBNUaiDEG0naoYUPoa1d6CbdTpi0ECn9tlFuIdmdtXyy6QUQHjSeo/XUCS8+uuEhLD2YPTPG6SzK9Dz3s4l61yLJsFBOMutl5hN3Sz3Mb14vltE/Nq+WYakCfqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neZV0ZEZNYHm50/l/qVcMSf5VRB/cCQZ5FO3tGL6M8M=;
 b=keF0i0IhIMjVeWgPfnHWsKtrhKv5bbnNyAYjOkjLbIOe8WiR3FR1M0SbPc15Xcq8EzhKIFNtKfWDCm42LnmJ5qenpGMzndjXWsk1tm2lafo8YR/477hwUy3ZitracxjK3W1BG/7Q+ZtWVtLF1Tqg3UFPZexYHXToQr10REiCyr/zo/eKczUo93uDPIx+VL01c0nyVR/NKj0OWL0+DE/3tsyB6mPbT9Jh8TZq0eoaT4gXFVfN9+RITuJEdnb7WCiZqE3AGS1WEctjwGS4btMMngAKQ4O+julXZnA71dzdlyrKBWuE1yaYDMT/igdOPjXw0O3ybs5FAVcxUEdZlNdhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neZV0ZEZNYHm50/l/qVcMSf5VRB/cCQZ5FO3tGL6M8M=;
 b=lSe7NyhAlQXKZOMemGeiD4KHmf2y5sgGjsJ7s3fLMB64VlOhvaM8Kh5Ua53SVKk7szSj3Tt8Zmf6uZ/ix2ohsU6fyHMNvXWw5nsxAIzkd1wLRPss65gtK3ABlG3N1py2aTFt789heAxzDLwTaPyUJ45u39fSqkn0mQd6ieRekek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6022.jpnprd01.prod.outlook.com (2603:1096:604:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 01:20:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 01:20:48 +0000
Message-ID: <874jxhmjgw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: hdmi-codec.c: use devm_kzalloc() for DMA data
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Sep 2022 01:20:48 +0000
X-ClientProxiedBy: TYAPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:404:29::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e96475-1bf4-4925-9876-08da92018701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5q5PAR9zvWfS7NuVr6RPlpGzkrOdA1Aspts6AxNSrpaJRssqzoyIIDZZGdQgKrKMW8vxlGZJBUEZ5aPQIoksuIJTFraxl5hx9x2FYlkvIj/+vid/2FmBWwvJeWoZWy/tsqX+ZOtwAi2Kx7dciVs+/imZkeFhWHSegAP5Pn8bOqyIzjG8JLSgizRzsWM5A5mGWlK0TvlLLdYgAwvKyIkvaReP/4Lv9lE1RVY1iPbSSSIOgT0zo+M9D+urTXY8B4U3MuLdVr5ojIYilsqCJ2/sRpzKZ+BoRje1qH2Y+CiC1qk06g8+6W5LQgqJ5BFKIZcg7FJ9Fwl9cO8UOzvLwJPrEEbUUZ5DlD2SjH0L77IzyqaYfjWwGLBd7M2dO9gEyp2z+g6FccEMhI/WwmWFtNhsWKy1TeXGgPBXBPxqaXwBsbXMJWteRQzwHHHxLce1TKBX3cDtwlchgtvIDnlClnMKElO0sHQ1Va0xO6JnThDwXgQtriDBH6K/R3BxlNzCLjYC1Dkj/3vGitaRT7q5m4sPTPJpm070ge9JyJ0+Ms161nZZNb2jz8yFMwkVUM7TmfiCOgTs9fJtSyZusRmlD9hHn5IQoLzKBv58QatEJaV0mkGnzDI4tCTwldBFwXNZf/WtFfWi9QltZpLgXo6U2+op0c4F+OBz3YugagTYSN9swaiij//tbl4tvrS1qIP/FPjqEHFIb1wbzbjTX3bm5GiVF64kQLVFAjGnYznR0MObXqii8FLnRrwYGxhjCE/O7wWOqkZ0kAiU3WNfqKz59AoIyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(83380400001)(186003)(6486002)(52116002)(2616005)(5660300002)(66556008)(4326008)(66476007)(2906002)(66946007)(8936002)(8676002)(6506007)(26005)(36756003)(86362001)(6512007)(41300700001)(478600001)(316002)(54906003)(6916009)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5L/MlAlpPToBrCpUaUCkrzcDyvJO8QgPQi5t8KtCfmmIiuxTyAbKVbUUbN8e?=
 =?us-ascii?Q?HQAQC28xBaQGMhh0Kt63mzsVI7QpQxtC7DkWhmVNGqaoP6E9KjOlFXuNYKr5?=
 =?us-ascii?Q?j29AE6sjEJGisr4U8dgaJJpdteTC9KqWhrpFjTkf8EJWi7ntCiuaD61bIzD7?=
 =?us-ascii?Q?IXjoXZykOZnKSescAIbIiu4K+z0QqLkuvQyjck14KnMTH8ln3y8u6Fk8Cvzl?=
 =?us-ascii?Q?NgM65S+fqV1Bocgks8ZSAuJcRmTzu7q05KaijddkuPqJRAK9lccdEblklOV2?=
 =?us-ascii?Q?M+Jz6kOIBDU96mD2WmzApDei/v/wEIIafJydSWCrj/jZgBAswvRvNHc+Sjt1?=
 =?us-ascii?Q?PuAvdAVhu1fMT6KnDOuzVMFvJOpfdvVwo7PuMfKbJ0omYwal4fKjgtBjM/An?=
 =?us-ascii?Q?bEPZQ1wWg2TRUW64Tyj5kBNOzwfgxz7re6MGIsX6MfDu5zZT5qFKAvdSixKy?=
 =?us-ascii?Q?3MArDcP9VKkUcsjRMoFMIsRXqVyjZpb32R0Hj1r7eL2Foe6DflazJpGoUPIV?=
 =?us-ascii?Q?oU4G2DxMqohfUt+aePhmm07ipzJmM+VvmycOQJn5wcIId/Vp4H9sGnhNUJlF?=
 =?us-ascii?Q?pBNN1tq1+TcXI4+w2Yx3+ttS0xAREJedSawnFlQ3cR7xLli/vmoaMAG0gJj+?=
 =?us-ascii?Q?pkxQVWhz9UeOoRNCCC0nIJjyzqMCp6rvEmKLg4c5xtBdVDE4ogYDj0rHEQGa?=
 =?us-ascii?Q?YReZ9Y43a4VJI/JoYc7gCtfn7W2dh5p+Q8WwJdx8+8kSMzBmgTrjKBAPQpP8?=
 =?us-ascii?Q?u/hKv8ZmJ90HCD6XnA0h8OvfmGMwglkOsW3M2tXzCGtdjTj3ChybiyDIrMC3?=
 =?us-ascii?Q?fXRS8Gx0tVL70jLxw6g9GPQaHqKDBcFKsQh4/k5VQFQ0evOw9VZHSzVR90QC?=
 =?us-ascii?Q?MKQjC5d3aqYtds4PNFeCC8K3BtRKEd/lwBk6D7RJQdjAvLszq00rFzi25G9M?=
 =?us-ascii?Q?RevezU2M+Wt9bbkfylQsrJ7iR+aNhJLtvFnaCEfCjs1MlFKn9eMI4bJq5XID?=
 =?us-ascii?Q?WLQNMGvpPRd+zS1ylQSkqdMfb6J0lNOD2csDNDOEKbeHfdQKrmJApUejCsWb?=
 =?us-ascii?Q?GAfkqs715Q2mVYPHHpKsV/9Svp8C5eAcFoUX24De35hc799/AMRuDGwokJ3F?=
 =?us-ascii?Q?0ZLb8Y4jXFCS2hl82z6paOVDw92VmEhYAcbMUjhhzpYElyZeStffnUhPscpO?=
 =?us-ascii?Q?NScoU7rtKvXFl6aoktw0bOSs7tsu0qyseY0vwkhI6YuJM02/moiIy3tZkh25?=
 =?us-ascii?Q?/FC1FLUlsBzJhnzOW6DqI0uFhK6qQF+X+HDKBbNA0dn6BN9IT2VSPFaIspFp?=
 =?us-ascii?Q?D3uNFZrM0rbiz/lE1YWtrHk8t4EAlmxgdXkaOG8KR+OJ4vMU5jMY2bnEzpW3?=
 =?us-ascii?Q?YptuxXp3+ACJyqalsIoYu2KxzzojP+91zNDbZi1npvZG28nmlz4j6QL/e9he?=
 =?us-ascii?Q?arnmTHyWThxqlRgubpqMvdhKh1xkFRYajqUTUvrsNJFz/xnMlR2JIHiQIDne?=
 =?us-ascii?Q?bTjHRiC/kZOi9LYn95MUICj0sdRPISiFkG2WjfIGNxHuL1XCeW/jxy3xfiEj?=
 =?us-ascii?Q?47Y5dFb5NpD8r5KkfwaeSUXr+HhsOGJz0Eu8t5MQ5kY/dwiP9nLoyvpJYu5C?=
 =?us-ascii?Q?mY5fknsKQA/LqzHxH6JTWIY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e96475-1bf4-4925-9876-08da92018701
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 01:20:48.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oiL7BquUx/a8wfqe58MZJZAv6RD8bYA0bRScdv9kyO7yjKNcQ48B5HEtJGkoeGtKBeSt/xwZIvIlVax9f+gmS/SuQU25J+86vCvOBnpohFT5jQymtDen8DNs2NEkKHZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6022
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chao Song <chao.song@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

hdmi-codec.c is using kzalloc(), but we can replace it to
devm_kzalloc() and then, we can remove .remove callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hdmi-codec.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 863e679d2ac1..0b1cdb2d6049 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -823,7 +823,7 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	daifmt = kzalloc(sizeof(*daifmt), GFP_KERNEL);
+	daifmt = devm_kzalloc(dai->dev, sizeof(*daifmt), GFP_KERNEL);
 	if (!daifmt)
 		return -ENOMEM;
 
@@ -890,17 +890,10 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static int hdmi_codec_dai_remove(struct snd_soc_dai *dai)
-{
-	kfree(dai->playback_dma_data);
-	return 0;
-}
-
 static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 	.name = "i2s-hifi",
 	.id = DAI_ID_I2S,
 	.probe = hdmi_dai_probe,
-	.remove = hdmi_codec_dai_remove,
 	.playback = {
 		.stream_name = "I2S Playback",
 		.channels_min = 2,
@@ -925,7 +918,6 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
 	.probe = hdmi_dai_spdif_probe,
-	.remove = hdmi_codec_dai_remove,
 	.playback = {
 		.stream_name = "SPDIF Playback",
 		.channels_min = 2,
-- 
2.25.1

