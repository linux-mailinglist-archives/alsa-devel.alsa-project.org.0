Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC96821D6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7D15ED1;
	Tue, 31 Jan 2023 03:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7D15ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130683;
	bh=T0z3Mce7vgQU4ka0NDRhRgidtcpoOLLnFlssbGJ0FOQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mGL32bwBEURJKvHRqdDYHX2IH/lj+3VmiKrz0Zzk2AnV96uxQfcQsLbgGTYbCQ/aH
	 +vnCv22Ie9rZzxup4Q5wvCQEmjf7ed3M50ReSfHsmMOQx0JvHPKdHrKMpA17K/0s1o
	 Op2g4u+vdsjbY0ET08zIrkYwec499/EZSr10He4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AE7F80423;
	Tue, 31 Jan 2023 03:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEFD2F805C0; Tue, 31 Jan 2023 03:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C9CF805BF
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C9CF805BF
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Yv4P6mae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0KWwt3JjBCtlb/RS1O+nF8zHfitpSjpbbblPbB1znalTwKG9RHP0MhgVijYTRs+Q7Qu0q+XWguiKLmy5fGAo+08LuS1PIdPhcuHczkUxVJ/YoEIYMt/lAlvnbL/bZlNQiTvbhYGKYKkn1pelj6ew7z7WSVQOpe+Kfvc99MWPE/PEKquvNYzAQf38SC1QJMeZ9RwLuVbNRnLFOaD6uktaWiyjoTFCx6TB9AjlCv8SCJYnxQ1yrD6WH9vosurT7P0GHlYvPc7Ytk0l/H59ugIexcr6rnEejM59TqaV1PEPDfd6ZIIHtgm2JhbJ4Eu0mHoje4cq85jX1K7f7JyKzbMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=IkEMiHD9uRnrTUpm4OmuDuI+C6PP4p/To10Syktdx0mZNATX8UOb5l9FWCdyrq1kAQB79mvRAOV8GRcklCTL1jS/InrfS9tjhBSQ7EtOf/O/Zv1vcs1oFDMRSl+tF6RrJymEKi3dmmFTzE+2V/7Oc5cqao1KEmHqO2ipVvhfBbeHbr1wQu39BACfrhZB40S3FaPS7z5x5Vf2F9mkkg9UdRmtA6rc5ml9vM3sZAyqQxzOPPtXaP3+EOKFS/YnbW97z4vfww6DEQgnMRkEK+dUQw7o1ic9X1pvxaIWNgGrwjCk/ZM+uxsYbAIP0CLLQRNT1IZeQK+XH+zXOrIOV7Pluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=Yv4P6mae4WLC55WlcYFBlLkz9k/VmGeAJE1WPUFJptdR5BdPdh3ugoULXevtMje2lgHux7qOKFxXozMLZWXvr4cK6UL3meIox6ZjBOs3Gdp4ok3DcqO/JMrCluxrP+PoZ/MT7mTaiv+QphAmG4BqNp2tLaN8rrSpXEsSP4W2NOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:08 +0000
Message-ID: <87o7qfea3f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/25] ASoC: sof: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:08 +0000
X-ClientProxiedBy: TYAPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: acdf9e49-80d1-4459-6b10-08db032f051d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0AE6MtlPw5qwsIjPdCog3PteKxuGviBoQvkU6j/n5kzELFwwQ8BaHHv6DnvRbOrNSTiJaIbaoMyx4zSX9HaCVU03F0HNw7UTr5LNDcxkhrGDPy/HLVnbp7xMlbrUHZ/Bw+YwgTliZO4Dvq1+X0yuUu5oS1ILgjNkO1HZSv8zwsY3WMRYMtkuha1hOqiM4m2Z8drRHAiZJ3LLz+WcGkUrLK/4DrYyMyeusX9ut02An0wrpPmysroYgD41uRaow+tAzN9Y/lRtwW1R5GyCq22aBPw3aEpXzAWL8eUoylEB2i/pMLzvdeO6xdMzFaOqrW0tuwIA2Vo2pj28MLpHO55oaFopf2TtKPnzhGZo1MVelkAcPMIx5ztUkXIAnTbq+LdSxO7Mnwwvnm6cRFcQh3EyD1eSinRfZ5v3wZHbdEpCGnFiTpi6v76qxBQfLxpLCaEXMQGf7ccLOVGIcsgwy0jYpp/EWqFlvwuzBHAE+QR/8KPAOxE7kljmlX7GNsBJu8TaPSBCSG5Wh1JalDVe4yBcvkor951UgqSSHT5gS8ISJXY7UFOX+u8bDwQWBRMTcONsqlZVfUVm37lSCudRN/Uc32Fv3ODDUD0bKi18RRusc275DdWUzhecvzsCzslhYVMaBb4Xo0jnOZ/dPwrJU1XmKhiBkmf0Q8tg+gjfMUX3CWpTXm0mLigvBbuMwwpIVPwBKqbXfIF9HJ70PaemHk6oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0BC80n0W/wdZ66DG6O7wj/1+k2JxQHBg93zCrZtKhHwVNtDbb5HNB2mph/Z?=
 =?us-ascii?Q?3Aeu/wdjMISI9tLRDK1p6aMU2vqfgQaNtMBUlNYoGSjP3S2LHIXBXfCSaSlR?=
 =?us-ascii?Q?l8PkCXnRVOpUJUeEutuZtI1ssGbViDvTL8nNZPJCttXxb6njlMqkOyCZ8bw9?=
 =?us-ascii?Q?I56aE2ss6Qaifh5x+5VNt2IPg8M0h528LDz24BbvVfYNxF8KBS6osjtyGCB+?=
 =?us-ascii?Q?+oNhyQk5B/DcAFKUkPTt2967aDcAuuEeCnJKbKLx8PmHsCHUeT04qwNKB+3s?=
 =?us-ascii?Q?CPyOF7da1voI3TXS8QYek1o+CKNYqk3xz7LpxgL8LW+SqNDeSkj8x6UxhNiE?=
 =?us-ascii?Q?GsrQcrFaU4o+qTGpsIbVvVf4GcxUuR4o5agpPCKWfegpnDLvu+TKwZh8OeuQ?=
 =?us-ascii?Q?mcyTt6d1Gtyogpu9sc/6t2mOZoKCXiSimeHAw5O8D9tf+0zkIKhlk/QrJ5Qh?=
 =?us-ascii?Q?CqE/UE/Re2EMn+UeFbP0+eM+bnGhVWUvG8izfO1JNAVTeu+ZVjtMp0kg+SPt?=
 =?us-ascii?Q?UgrsQR2W8b92yxDc8WaSBAmYDJ5pI+mlwNg89uWUwg85+qu9kvjUs4EAUBWz?=
 =?us-ascii?Q?Isq9yTxaOHjUa/mClQ4JsLGy0SUp3/Q3tynrtwVr4k4T+gQyHKtiIJw973pL?=
 =?us-ascii?Q?XUhUEA+tQFbkonqzcfeHKKNuPBe+Oidz+Bw3GfqiieZ1WhunhWPx4LDCCMVn?=
 =?us-ascii?Q?4Wq0v0jaS6+XzVAebhSfs8gskdY6XE3UPFnaG9udge94sQp9n+fYKjsYGRPd?=
 =?us-ascii?Q?qt1XIEvJEhHhnpFN+fjD3F2dqJZ0VSDT8n5/nnJ/HR72bCaFxjyug1S0Qlo4?=
 =?us-ascii?Q?PSONpglAL9XlZ7TGNAgB+5Xf5PuMeX/9mkyKTCasr4nOigBGo4XE8p1Nfhhn?=
 =?us-ascii?Q?QfSLnTDUBqTMxXpzB2+qglHvCth1zM5KqD7799+BDaOBxGgA1Y1pFYMWLbmq?=
 =?us-ascii?Q?eygd/PR+51VweeeH5npmb8uDzFGEi8SP9/w0t4FzbUq5GvKV926KnKGe39vQ?=
 =?us-ascii?Q?3xMVRGMh3i6NnWt9cVuMXYyI9V6rpdLIbi8lF9o9JiOk0UXogr2Adwa/Xmzx?=
 =?us-ascii?Q?72LEOJRIjsPcOQayvym2E1Hrtz7dVtG1ZGlEtAbbHDIObVKljBu/sR5EJAZA?=
 =?us-ascii?Q?XKJ4/ZdSfNHoQt+wpkOc6aY7PIBg30+TCF0t7psyWnMi6CdvQ7eABNaP0eGm?=
 =?us-ascii?Q?RefbGvH9c30y/s+ea/+K4s5UZhnq5HKMpF6AbUKwpaYzF7juBq7tWFFrGIp1?=
 =?us-ascii?Q?soNtqyYdgOcQmhmIYWWISIsugw+xa186W9Xphi3coag4JGg1jmHoUDQ+Gdkn?=
 =?us-ascii?Q?o8EZhvIq0IE+gDgourupHThBpxpTsMltUQwTwd+i8OhhNKnEBVH+P9BYFQS0?=
 =?us-ascii?Q?iBeC/pL8AA40+HRN9RowPxMCHDPFqzoz/AL1z2czSnykACtEyEnpa8Hkxus9?=
 =?us-ascii?Q?E0RtUgzCPUQSQmILOhAmnRWy154B7VfinvmAVOWLtzddUAzMwNxf5Yu4KZ7V?=
 =?us-ascii?Q?RJKk9RZtgX+JIUzak2wn3kZdrRUAzzEXukouvcpLGdH+0ICVTcNB7iTQbTGD?=
 =?us-ascii?Q?6NaoiGV/CTmYpu+w6bztXhkz0aoZ9c7/LZ5VvWzzr/+uRYqdqNi9Gom15Ix5?=
 =?us-ascii?Q?rpOv1ogIhiAjxnX5Ek95JjY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdf9e49-80d1-4459-6b10-08db032f051d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:08.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zhxq5LRnGHmxppCz2m+ak4sO3pJzuZ2fZgaHzYL3SCZfhqklUqx+5KtH741SJYXb/q7We18byza9SQVtFok9Bo/vDiXmLbaXmVHyYlh0sx7fGsfpbuhOawLD74PcLu8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

