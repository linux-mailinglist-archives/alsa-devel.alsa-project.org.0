Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFCF674DB0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1D42E07;
	Fri, 20 Jan 2023 08:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1D42E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198283;
	bh=CTcchOkvpob68bMHwkywSzJcRpjmweYX7cPtxyy04Ak=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h0Svh0ZluJfoXkV68cZhrrgAFO2njqgv72lsku43mvggK58uNJEP/qIiL73GMSqvD
	 LccWSMHpztppCYeCNRwa/0YWZF4pcFzpRtW65pc/TDTKRG5Fi0ExSQw9BSI5pzUPOp
	 yTX7YGZO9ayKfE2K3SDOGsTSHqaXLKGh37MsjLs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25ADBF80567;
	Fri, 20 Jan 2023 08:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E9FF80570; Fri, 20 Jan 2023 08:02:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B03EEF80567
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B03EEF80567
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ceMM6S16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfVwf7HOWCZVA43qnOY9i8yKHB57xX+gc5ZgE2iQnbssvD7AM0RIHccmmniFY0YaLB5r79ifYXVkhJFvyN9UQ2h0+pXRl/XQF2oDAfip+VTD19BemWpiApZiu4kKdnlbAa7cukTdsnni1dBzLFtqvWToLl9zCoyd4z8wnCY45ptSyg8uBtG3KdhSbuh9v94LAJh8xvwdd47/tsvCUb9orD9JlELW1+5m5c0mSFBIdG0VGYa7qblOMDFiLS88myCYki2JmJ/Y/cn98dxTEM5Ah3aGoJ0XXymU9kjYI/cmS87YRE+iMgQo13ZJa7+Ndeno1Qb4tsx78aMQuyiCGe+hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=EARiOsLNCejR5G2OMPu0qO3HjpaQCeq9paWWT6WLl2Ei6gklql7uUNLVn0MTg4t8hml50S7avP2h06bmOqxITdWYW0ZlogX3Ssgkq7bNB+WKmKuFdoDDV2ZniLN/ogt3QVX2XU6zgEyrBkZbEZWYHRIbTIXMwF09xKvnt5RqhmxAfHxAEAf4BDqJNeH4CWMlLWE30+nCx/d1Sh41M9MrWdFW2YZXb7AQZi9jllr3xm6NL2YGYZRTndgjShMhwTiJ7Nc4fUXmHbxmMPUL9BTwlGptqPl0NBATKwJMjoaRfV6OY5WUcN9NrDSnd+Iuzr6TjWn6hepL1RyEDCcDB1VIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=ceMM6S16DnZ35+eMoyctJ9xhkhbfSafsk8sqGlGesVQcVAwfrK2nWmlTyoTYTGUDHy5PHfNXyCFmcyqSaH9IAXPFqTl/pPOjUm7ECzoP0vCpxM25lejuBx7KVZnySbWGoaARSIKSjfYN8QbjhCJpuuym7ile3JjwTn2uMT8GeDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:27 +0000
Message-ID: <87zgadk7st.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/25] ASoC: hda: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:26 +0000
X-ClientProxiedBy: TYAPR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:404:15::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 9772adbf-095f-487c-2d98-08dafab44a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AVzOJtubJ7ggKyNehssntz4TfA0JYRCX1lKc20nq95Eu62tUIrRwWstkCOGRyjR8S9YYUVWxFSPZ65QIu3Gl6wlMB7DYvLvC2Gpl7kvseXfXAjE5f+c/XJ3+9NYRWR3MRQE3LduoAIv6Jwn9KxvFOV1X5rHZ0UwydYyMAkN+WHM/YpnkBVCwJZ8Ou02Pv9SI3NeOTOhHwNFlmO/7WDT+oEYI9pEGgew0l6eXCFirb/L96ivB7LAakNfs4GpxJD9kYBjVFM45Paod8bbXj+iVoprKR5o8f43lsVtwsvOB5IJHxrchorLY9ZW4ZyMm8n1YBihcF7YuA2pJ1g5PMA9eQMys7CCuLSSIF2jqGAvLdgNMl1E2TK06s/7WDCEbG0Swp18PRoQT3fVwOWJcBJxIBjf4A3ZyeCombJTqPl2DaTl/72/qDdgx9CUHEFCim8RvppIBjiGTh1iWj+IhYgkw7cskljzadOA9lKYrNzNcBj6HLfq7RFBjTDo8TNzx27U8NOe7Sgmqk/IX5PICEbCKPIxlO+xDKlShrcT/Nc6bYgzL1U5Eq6iyYZJonEcsgBm7hsBBwSX+33HBklLn7/9Y2Am34GHhCF9pA+7f6OEOXZQOlrkgFUEwiowYsnGZ6qiFNMkmYQS/9yjtl6+oIWVKO3WVxO30c2P0Bzt+fK/Y4/bqz4Oxfr5L29Ejpj7dA9SPBNqZ4ewcHh2NiSJIIosBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(4744005)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/qYKA7PJOr+BsG9eCUNB79mikXXAxhVW9j5iVwphhGmhrzTe+1Dm9RESnhS?=
 =?us-ascii?Q?4dLqiKTGprZgsHsi5FzxXuBmS3ArlgTVpsSZADVmfyUMXoANp7cCSi/6pB55?=
 =?us-ascii?Q?btIxBspMibmS8RhP4JU/v2UxlwjTrVd1HZbCx8eY2257Jx6YrnJvjFlmxHae?=
 =?us-ascii?Q?kmMqfGmUNPFoggCRVsJIGbVgcwMdMEE+TDDpQdPm14T3XQ0KdFbTtkcbvxkx?=
 =?us-ascii?Q?HYiDGPJkjYrkZRUDY6Y3z7iuSA17vj+k6zx+9mvfCdAKvJqOq8PHZgRkhkCU?=
 =?us-ascii?Q?xu1EvPzavP9bzjxukNkMBv0XGRAa2dcRl9cPg0fS0B4UovXjD6LvVkETBZIC?=
 =?us-ascii?Q?Nxau/NIKZzHmcjETvZnMv9P0N/ZLzPRlSDFF5rFBhm+3MqUzxFSGO4zi4N5V?=
 =?us-ascii?Q?0S6H05xWlHnpJMvpFar7NxdxB2U3eYoHTRRy/80UMo8vCc3Kt8lDuh7s3d6M?=
 =?us-ascii?Q?VJGOnf3x70M9EXfkhJQMPMoXWLbT0/qItFO25yUZvEbWFlpk3qzLTlGq+OoY?=
 =?us-ascii?Q?QWRXyQdQt2b/GvwriNSptakrpYKVr/vuw97gBSPrALqG9rikFSVWZBcdXd8s?=
 =?us-ascii?Q?UzxgpTASVDIn8/afwQmthM92E/7YgEbQpXEOCKqXq0Iuq+nHf4D33xUyXuUB?=
 =?us-ascii?Q?73JPbfSN2ZBNJ89vHfTfo/fgtgekInECrIy0Jakq25sgND1/CGrLs6LKi9a8?=
 =?us-ascii?Q?TXVqMxwnXFLUf/hWmRyraESQGwcUNc1dYODQvcjOxI05awUJLTiNdyymcboG?=
 =?us-ascii?Q?/cskoIMEHz1397mfmk1A0oR9/bjJ+fRaCTVtv0SSiuXUNFy+31LM/4YGbfil?=
 =?us-ascii?Q?iA+B3hxtr3Ji0celtURLT0503j3MKIoSu5xHQxGu6kX3J0naLz9tc5u/uF9+?=
 =?us-ascii?Q?x+y4Qb5UsWv9q3zM5Q4Ff43pbNOBdtXJQL/8iiQe/iB9HgFD/k4aPWeA2VzM?=
 =?us-ascii?Q?duX5ctLS1SjevkSVintLW4MGDn5rD9vkwMFQvLpACu/Qs3uSN9qPwebFnMjL?=
 =?us-ascii?Q?oRkNn6T0R+LCmbCW4KtUyTTYB0poKoKiaMOiCskt0CKJLJqUTYrTkQNydm50?=
 =?us-ascii?Q?R8Yv8WG3sWzpPZ17BBGyGCsRQuLN3gmdwhjnJ3iHsAnrIV5Y4I+v4yt1GX/j?=
 =?us-ascii?Q?lsj8zy/c3+MflCAyB4GjQvPlWn9a6GHRavYDFS8lFW8EQjkjDSu2voGQ52nL?=
 =?us-ascii?Q?JpYbOiCHTF7ZA4RRQ1hkRCSNcJ4rW1+LfU930L8rq0RHD6JkarSYvMnBps7i?=
 =?us-ascii?Q?00a42yojwRXqlIDRd313ua3/ypWG9cHwR99chkCxA4ePb6v3PfWPEyW8wI8i?=
 =?us-ascii?Q?bgcbwfwJ2yJ8l3/a2z840qI+7uFcMLPZSo+QYvChX0xgsPaLy9vmReVSmXZf?=
 =?us-ascii?Q?lc2obzgPg3HU3mo8dxyT+X4jwnYytkudGgrf4oN7fVX7WYGQ8YogpAC2XHcB?=
 =?us-ascii?Q?cXXV3pF715YGS5YsiZ1+ltJXoG78eigRN2CfSf/EzH5HozYgN8zRrvHczQse?=
 =?us-ascii?Q?iHeIW21hjDxjvFa3YpOHB8rDee5Qv3vRsWZmPPf+OCB1kZH+2Zvo3eSUQxm6?=
 =?us-ascii?Q?TEjzhJKhTFobNCK+x5OjzlNw4vOejFf0h2ausKzv/0rUxcb0DWSHqTyVmE7G?=
 =?us-ascii?Q?e5wQE2H+JL1b7LEbik982GA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9772adbf-095f-487c-2d98-08dafab44a12
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:27.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1s9pr8ptlcmsDzbXP2MG30qJwLcQ+q6EET1vpA64vaeol7RI8Z7kxGA2Q8InnA0IPzedVr0RbxhL9SRmW4jULJLE/LYRzP3MvlR8i0sEzCjNiTkV6pwqJVhUwZh6KTk
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
 sound/soc/codecs/hda.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 4b8ec6f77337..d57b043d6bfe 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -126,12 +126,15 @@ static void hda_codec_unregister_dais(struct hda_codec *codec,
 	struct hda_pcm *pcm;
 
 	for_each_component_dais_safe(component, dai, save) {
+		int stream;
+
 		list_for_each_entry(pcm, &codec->pcm_list_head, list) {
 			if (strcmp(dai->driver->name, pcm->name))
 				continue;
 
-			snd_soc_dapm_free_widget(dai->playback_widget);
-			snd_soc_dapm_free_widget(dai->capture_widget);
+			for_each_pcm_streams(stream)
+				snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
+
 			snd_soc_unregister_dai(dai);
 			break;
 		}
-- 
2.25.1

