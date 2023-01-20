Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579B674DC2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0400F2E05;
	Fri, 20 Jan 2023 08:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0400F2E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198451;
	bh=T0z3Mce7vgQU4ka0NDRhRgidtcpoOLLnFlssbGJ0FOQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M4wpfpZpdHEZmMekwJ1+eDdLKgpjT0fn6lm30dyKBUf/aP2Gsp4zvG+ocHWd3Y2YA
	 fOvJA5n68Upp/A8jP3g6m21/ssVQgZYAZ1LLobIJbfttOnsTG39wEANVsfkiBB2GNS
	 s10nNH9DRHhFuN9mMMiTNTLdA/bRPTsHP1jhQ2bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD0AF805D5;
	Fri, 20 Jan 2023 08:03:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E1A0F805D6; Fri, 20 Jan 2023 08:03:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 066DEF805D4
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066DEF805D4
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JV/QvxWZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebzr43iRp1AdVi//Qr9PQ3t/9U7uUidurdJkehisX6rFbYnO2MJZptK1TIHI045MjahfCbIKY5BJ1/gySJQXcAJ6YYhMpNaowomJlfBrsi2CVBSLRegA0f9VRWLsebljFO33+yotnZ5XVioPPETowVHBNOxV5Jzhc35SPQ+h4sqH8VJSCwXAz3pd9+7Mvk8oxx2P+bXz/c54F2ZUke8cFcbaBcXaSDflQJ0XPw+v3UQI2cAY/GZJBWokVXTyccqfv7CjmjQQDl0mBlCigjv8HwzzFCZ+CxmGPMX2zs5hthBHxlcnUVKHvBSFQ7lEiapeOCrhQA26cJ+ZaKwb9uT4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=bMte1i8omY9aQR106ZWoP4h1LM8uegYyVuLy5nr0vrauG6/S1GjVYF09FzVpO6iLLLpglN1HoLGODA9BVgJRyX5f3kxNvObQVzwqJiu7/C0E2GU0WkrbYpw88+q5zT/RKeDMxni41Sb3sQwOk6LMa7wqieYaudq2RJ4xMYM2ujhX17uMAXZp4vjR6kibul4E6kOmxuZqKrBikxoeFee+8tQDfvfAArfKz4amFatRQ0XJ0yQqmCv9Wtc5P7xKFNwwUXnWLZuI5EN/DXEibUs1iKauqlq8Nz/nBCVz5nPDCKmcz4cs4jYFj5CKgY5pkTPScmaRrOzPBcPftNFSvVgpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=JV/QvxWZbGM8YYuH7dLmaWvMJdOeMuLCgkZA40pAoDR3iSs6J1YkXX9tLXoiGdtj3qMjt0xR3xtCq6TaiEDYB9TEWc+NRsO+15Gidh5Ci2H8hybWiXecN4R80aVCJScOETkSx+/i6pNqTO6WzCWaJwsW2qj8TCLRsL+NJPArNyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:22 +0000
Message-ID: <87lelxk7r9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/25] ASoC: sof: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:22 +0000
X-ClientProxiedBy: TY2PR06CA0041.apcprd06.prod.outlook.com
 (2603:1096:404:2e::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f2df16-b668-4171-7763-08dafab46b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEWMxSXj+/2sPSjlW7V25fWNEYkZuwF+1ez1FBvrAe5Gon9z1snTG/ep/lFQISLZix1Gh3Mci1vmZfSFRc/qenr3wHowAxD0wJEY/tRFatd5VG2EyO5/7Qlu3Km63VZiU6+2kGAtbMvi5Jvmrtv5CFDI7l1NatrsIbAO09JqteS3njILBHH2nOvwmgEVU9lXtHs8qVWKqTkbc2omkWtKce/fzb+UMCmaDGBfqJhaFGOQRSKJmoP2pj5dhJmPhxwgTtrBbNRqwkj6GVqzoTu3kBb0VJcG1mC3rCcKxJpp/t0cOReVKZ6PjrYuVaQQ+bapZzD2wZ9Iqi8pOGtzlvql7xV6Zj6OPPWL3P7u5hLG2UhEZ6BIH0YIT5QjPCgUtAkt4lBeKZhT4DPx55nyQhvJOO4QmqkR93BwlIJgq6wa4BExdXn7xfL2ACH8kdE266ObMITfOHNEkecqLj9cPwpynZhG7EHh3tdiisY5QtE+AIWr7pl+5b8K9bTzZ1tQDkF1tQGzRRpyMcjH/NSBD75BbDxbwezEho9ghITY5UIOP1axdgJHexjmjJSBXLe15xIlgrH2SfR7+bOoUcBZA9d1Hg52/p3no7mTIO75Ex/ATIEHE0PUVfgCrWbSUJ35jOAsS9n0/mJ9KvLr1KBE7PnNU9JtDG9rY1whiKyFtiGiKBfl2WrkW+CJ4L17An9Qky30kmD53kM1Myxax/DNd0m/eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(8676002)(36756003)(83380400001)(6916009)(66476007)(66556008)(66946007)(4326008)(2616005)(7416002)(54906003)(316002)(86362001)(8936002)(2906002)(38350700002)(38100700002)(5660300002)(41300700001)(6506007)(52116002)(26005)(6512007)(186003)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Da3ovEXwrlpXQ/Z5VM755j7zjRJktFNWGPZ0zbx7tVcwdSp+ONFs/fbpJQFV?=
 =?us-ascii?Q?FDD4DOqcZYG6vEjzwGk2jcxVEpdgexp0gjsTGY/tz/smXJIgDIeVzpuTkTcr?=
 =?us-ascii?Q?QsCaZXuPfVsfZSicyAn6yk5qSKZVhldwNWt+zEO2L/21FDPxoKusLz8lTJkQ?=
 =?us-ascii?Q?qE5uC34NBKNZ0oCMykBT7W3RCt6zfZeJDjFKXNj9o2lgGaV9LW9e+nhvbgc6?=
 =?us-ascii?Q?KSb30CDvR79RoaaGgG4VkabOszRhdxQqhmK6Mu98j0SXVVeVWihVfs6/bWGu?=
 =?us-ascii?Q?mWHdW2gv23ObJUgQj9+0WDl6PhurPiTSznMo2Umg5fc87gnlEMJCM8iTNEl7?=
 =?us-ascii?Q?364HDJEfMzlQlBnhZr7k2pD0i/yKEqCKgV5ITNtXzRRlFUUgYPxI38blB8Uf?=
 =?us-ascii?Q?g289d/E16CmECRGxqpLJen7HjptdtgJkqJc7klbazX2s+TgEHV253Sp8lRCG?=
 =?us-ascii?Q?rvaDHZ/TaQD2JRwxnQy5Zq8y5pxfrkzqVp0s1YIXsyfvBSYQOLinX4jUf3Cq?=
 =?us-ascii?Q?XnlO+DMvpiM8izPaVhv5zh9WoPNsm0+N46aCNA2wXql6lHFxRWMcfKhjSC57?=
 =?us-ascii?Q?EH2PRmE12is9EZsyOnez8gUq87GHotffVv1+9N+rrPAoBCHgFbb8HNoXai/o?=
 =?us-ascii?Q?Wjr3WCRf5kBb3GmLJV0Zhqhk6OE6TMFrJBKmV45vgSIy4bak+TMHbF370a9O?=
 =?us-ascii?Q?6PTijuiBxklEpmrGWwequ5Hb9cVDtPfXBRLAwXVD/jXZf9OReOrfGAUDBSw5?=
 =?us-ascii?Q?Xa/F+NJVa0EeASbbLNv3TnJFLb7kVPsRI9X22hTu9Wzjm08RDXtdSSgbkiYy?=
 =?us-ascii?Q?TNoFJGija7eSR2CDSXvBVVrddxjEFFnTq1JaQ5XhXdlgRbf5QF+WhPtmliNA?=
 =?us-ascii?Q?ZbKtnV9YXbGdjepRxy+vme6vvFfHSTB95TpnZz4N6ntLmC9BgAfDqpSUcafs?=
 =?us-ascii?Q?ypeOFoSeNZnNVl5tM7trjzLmmFd64MjNhz0OomyVjvFLzbAGNZNIJCggyISH?=
 =?us-ascii?Q?IuaTIiYbqaiGkVumrJ+UJVmkBD6t4IQ4QyNY41xH8PYeqyJnLXxi2cNRH1ub?=
 =?us-ascii?Q?MpQeixa5DaE/UbuiWEFLcJb4D+62BnHo1JIIGaRf6b6Rl+5x2UusFuW0/iDS?=
 =?us-ascii?Q?hwnvH+Ll3RxxZ8yv4OleFsA3AfpdUI0OVet+pX4632xfHibQ91/T0+PGEPEz?=
 =?us-ascii?Q?2lkQ4335YXqyU4SlEPGtV33eQUUhKfALy92MOWAH5NdBfrewN+pvm9nAADis?=
 =?us-ascii?Q?ewBCkv7V+kQxclSn3tinO2DbqT8f5xXpq5P4u5C3Hr4Sok1RsJh6Zb6zWHca?=
 =?us-ascii?Q?ZYLJHz/vxOdfCbn6Op7MnHCsmDXwKWYIXDvc1sgK2ZmvZkyJlHvcKHMoLCdk?=
 =?us-ascii?Q?QXZOl70EvW09y5hBCnwnyxhHtt27AQjyILWJAWAYI2TdEkUQ4JT9skqAJk8m?=
 =?us-ascii?Q?ic7lPwJS+IqikedXYLbv1+M9luVm3aDmudrHdm2/iWjbA3bVSTXcog990bUZ?=
 =?us-ascii?Q?bmS0obM+l90M9pxFnnX8Mqog48GsB6SI0x5sv7tFUdZfB5Q2bDvxw1PktKE3?=
 =?us-ascii?Q?l+5lEGZ8Ui/5GoTTXNOPX0Sf3J5SLl7zrZfcsUbeibCdrL/48n2vW2krmLcp?=
 =?us-ascii?Q?QqUAcC1UGXaW4BG8PF9ekZQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f2df16-b668-4171-7763-08dafab46b50
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:22.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6p1dJgI7cg9nKZez/4XhLMOXiLuwpp8WDjLZkPpcaFj6mutKtbr9Zk0+6O8FWlSmjSKDQnFK70/psHj8U5Y0RhNCzLVawBDWfyArcj3KOdmmZlvPqRXsaEzNY58YE8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9821
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
 sound/soc/sof/topology.c | 104 ++++++++++++++-------------------------
 1 file changed, 38 insertions(+), 66 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 560771ba8fb9..e9a2d4a240b3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1055,6 +1055,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *cpu_dai;
+	int stream;
 	int i;
 
 	if (!w->sname) {
@@ -1062,62 +1063,41 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 		return -EINVAL;
 	}
 
+	if (w->id == snd_soc_dapm_dai_out)
+		stream = SNDRV_PCM_STREAM_CAPTURE;
+	if (w->id == snd_soc_dapm_dai_in)
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		goto end;
+
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    strcmp(w->sname, rtd->dai_link->stream_name))
 			continue;
 
-		switch (w->id) {
-		case snd_soc_dapm_dai_out:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				/*
-				 * Please create DAI widget in the right order
-				 * to ensure BE will connect to the right DAI
-				 * widget.
-				 */
-				if (!cpu_dai->capture_widget) {
-					cpu_dai->capture_widget = w;
-					break;
-				}
-			}
-			if (i == rtd->dai_link->num_cpus) {
-				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
-					w->name);
-
-				return -EINVAL;
-			}
-			dai->name = rtd->dai_link->name;
-			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
-				w->name, rtd->dai_link->name);
-			break;
-		case snd_soc_dapm_dai_in:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				/*
-				 * Please create DAI widget in the right order
-				 * to ensure BE will connect to the right DAI
-				 * widget.
-				 */
-				if (!cpu_dai->playback_widget) {
-					cpu_dai->playback_widget = w;
-					break;
-				}
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+			/*
+			 * Please create DAI widget in the right order
+			 * to ensure BE will connect to the right DAI
+			 * widget.
+			 */
+			if (!snd_soc_dai_get_widget(cpu_dai, stream)) {
+				snd_soc_dai_set_widget(cpu_dai, stream, w);
+				break;
 			}
-			if (i == rtd->dai_link->num_cpus) {
-				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
-					w->name);
+		}
+		if (i == rtd->dai_link->num_cpus) {
+			dev_err(scomp->dev, "error: can't find BE for DAI %s\n", w->name);
 
-				return -EINVAL;
-			}
-			dai->name = rtd->dai_link->name;
-			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
-				w->name, rtd->dai_link->name);
-			break;
-		default:
-			break;
+			return -EINVAL;
 		}
-	}
 
+		dai->name = rtd->dai_link->name;
+		dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
+			w->name, rtd->dai_link->name);
+	}
+end:
 	/* check we have a connection */
 	if (!dai->name) {
 		dev_err(scomp->dev, "error: can't connect DAI %s stream %s\n",
@@ -1134,37 +1114,29 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *cpu_dai;
-	int i;
+	int i, stream;
 
 	if (!w->sname)
 		return;
 
+	if (w->id == snd_soc_dapm_dai_out)
+		stream = SNDRV_PCM_STREAM_CAPTURE;
+	else if (w->id == snd_soc_dapm_dai_in)
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		return;
+
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    strcmp(w->sname, rtd->dai_link->stream_name))
 			continue;
 
-		switch (w->id) {
-		case snd_soc_dapm_dai_out:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (cpu_dai->capture_widget == w) {
-					cpu_dai->capture_widget = NULL;
-					break;
-				}
-			}
-			break;
-		case snd_soc_dapm_dai_in:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (cpu_dai->playback_widget == w) {
-					cpu_dai->playback_widget = NULL;
-					break;
-				}
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+			if (snd_soc_dai_get_widget(cpu_dai, stream) == w) {
+				snd_soc_dai_set_widget(cpu_dai, stream, NULL);
+				break;
 			}
-			break;
-		default:
-			break;
-		}
 	}
 }
 
-- 
2.25.1

