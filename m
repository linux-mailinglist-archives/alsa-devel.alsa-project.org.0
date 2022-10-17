Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65122601DBB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13FFF8E32;
	Tue, 18 Oct 2022 01:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13FFF8E32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049951;
	bh=uCPc4X3Cy1vwQF2SALXpScB8bqnIer2dAMWzUOHP8mY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rWvdApDBJ5ik6knk2dgAYVfuSLGeVjGGur57mFn1Bd0sYDxgVy/MmKLhcOPAYdMLX
	 e1OA2p3Iur5pmn8/CLiH+g9WRf2dDu6qmKXoMXWX4QSC8I5GZ8x0eOcr9ijoenUXev
	 VRKLHKJRmcVUk+Oq7Q9j/BLMB/KeZ8Z36l9LVx6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A0EF8057A;
	Tue, 18 Oct 2022 01:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8C9F80579; Tue, 18 Oct 2022 01:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF62FF80535
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF62FF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="R8Z5G1zL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIGbCzNBXzkM8e+tGv2siYha8HLEbx2W1dexG2XzcmVpVn1+wWdGHVCo/bMiW+46DJ4ntYT80Kz2DZqiCfsV++QZDfkV4r4goRDd/zuqqceEZxKjPQne0k5WkplyErf59q4yk/vdnFD/yo8fhSNEGAdFcXgXhyVzTOGfMqtIxzDMA4j8CU/daeEKwWtgWkrouHRnOhng/6IdrrotbEZ4J1NDffkpxi97S0l0ghV9BFLSqQraEx84ASEbJlY0IDHdnL4b6w1K7SwQ4HJ/AsniFPDMLIBgZ1kF05WrYct//AU4rmXdGpqmERpy8Whq7R7udwXRFrwveGe8LO9xSx04FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJqlDNStcANf59V0aGryaosmVkvOD34eJDigLAKmZJU=;
 b=bavTvPCPiF4dhamS2iTSDOnO4ptxXLGqkQ73nnN34Hk2h29KMYRLTiEgFPmyQfIagf7JAPPcjNYJjuvcRCuO8rzkVdhqII/WkXW+KCv99fOvh9zGZtwCdC3te6ty1xhILg9Wn3Jf2pmY2uEc8y8otdQoyR09HE/JamesP7clx8YKRUV/EuF6bVfSsZSgMqCTPQZ91nXPFR0sgmPBCv/J3V6qnM5fLxGbQQIUO+V9VE/XdD8KwEQ4Yj6Rji3cI+qzOZl66mNMgoo+x3RM1g/TgN7or8gpByjKayweEc/Wh1oJMw0Vl5cz/ULZSR4GV3JGgXeKeNFdJE/69EsPsGADww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJqlDNStcANf59V0aGryaosmVkvOD34eJDigLAKmZJU=;
 b=R8Z5G1zLiaA8/i9mUbh5gC4bZi/0u0vcT/gAkjKjM1nd52/oeXQUOPYiGK4UmsuuzRiTKDdwngztKLjPjvToGOqb3DT4USWUI6qZuEXec74BhzfpxKuMitj5NcvaPLBDtt6sx68BvGyM2f9M/lPcspiZAC75IrIHmLRtkhCxA/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 23:37:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:09 +0000
Message-ID: <87sfjmowd6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:09 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ec86c1-faf0-455d-062e-08dab098824e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjHV+4WsfbyGqemYeCBgXcpG0Xev1mZ/SWyhcWh7TcDTXFSWm6ZcrZT296oikepKl+HdoNrPfC4jAEM93L69PjtRJ84PFnVuAdL01D7m4GYzovWtjWs9g9Rlw+i+XnioaQuyn2T5O0QgP5qaVSHJej26HO19pEWc4zjoLTFuN4mSkoq8gqXNgSEO1dCEAKck8MxiR6jpTvKYAvtiHRXea97iXYgUZV3kgK30xIicmOL1z/5Q3VBSnPXx0nHX3CRkJSTHsjHfSiB4r3YmBfpv6U0RF0J9m+tuGal1U9qvUP9TyTYgjITrXf5OfLytgi6gUPc8B53nifblTlzB2T4bpYqW7Wz/NY/4CQwybUEX7X/dxRUhyHGZPAu0MXHZ4LDTYhfqoWpGA4fc6LJj4ZiCgLSWLiYREd0h95/B8RVnP4yHMh8poyBEK1HsmyyzE5VKHky/RvD+nTpy3rHIaIQEpTbWo/hpfsRkyxy/w9L8fFkLxdsPmSIqKf8x1kK3Yr1YkW0Sy4T9ZYD9OGrGRX1AyRpY7kQWcJX+kBsGq8ZiGkIiYVYa5CSDS/afUmkvVGT9/NtzFM/peEkTSA07bXqxcufQLMIPRIuw9XqSE/7Zkhqh62kMlgx+J4RVkegYexNfYGeyzuRxQMlBzHWSQZalYf9bnoN3kDTkpzyYe0RliJ4LQqpBAfQkpw45IQkkQrH0CKUqB3MK8O+9rQJah67HMSsuUfTZ4MaZm7T77zc+20gCFrLt9pfYIZeVJUBikHfsUryDjIVC9q0Upw8oib5mAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(5660300002)(38100700002)(2906002)(38350700002)(2616005)(186003)(83380400001)(316002)(6506007)(6512007)(478600001)(6486002)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(4326008)(52116002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPciCqdUwUoWkmXHpoznyMPqxSJXz/r5X4+J2k9qVZf+oWUAtxkJi8gDK/rk?=
 =?us-ascii?Q?Ues03YQA6tg0y375VzB4OYNzFS5a7Qa9hIp2S46lRiOXJHnhJxtLbnFbUUSI?=
 =?us-ascii?Q?0KLICcC36uVT9DcIk/QsjDlNfbdSSdD/rU76zn+JQG62ybzLenEwikpyHQ8J?=
 =?us-ascii?Q?prdnEb2CIWoJxwcqVmXdC4yE4yQ5viHUIUz5n9dOgLPUEtSB+KRBhZI1g+O8?=
 =?us-ascii?Q?9hgILyE03WiRh27nbzUp8ip0aL0ZYO8J6PJxZrZTWYTJ3KNwrHnxz+NCNzsW?=
 =?us-ascii?Q?0HvONFmmed9gScfrrw9/+kZJJJT2u9QKVHhHa0fCb2w94msIGB9RhGRTU1Gf?=
 =?us-ascii?Q?5kFmO08s8TDwv8EQrEX+wPBt33tU4bU+yo7P7wLjRGP1aX6CF4MQC8KkD4Rv?=
 =?us-ascii?Q?N8RorYOC3RWR6aQ0w0rqXEqIUDtW9uvYJGuWDIJFs0vtrJWUs4Kfrvn4lRch?=
 =?us-ascii?Q?sKxB+vAwrxI5btAPTRzAy8GEv/L28HvaAMqiPG03vZb9259oi23Q0FVhckuR?=
 =?us-ascii?Q?K9smciIaXAnfsKKeXpcEHHJozsyS4cExfrYdKv+OS/QKPYISPgJKFRx1M5h2?=
 =?us-ascii?Q?GW74FZPApn0A6EReSSTKBKxfSyzz00y2kAwXdtKnQwL+CTbDqszr5pgmEz3g?=
 =?us-ascii?Q?glxr6e85nOUSyYDGspFsqPQww7dB7itWf/xmSlxJ/0LWP1/eSvJXD+69FanK?=
 =?us-ascii?Q?dPSRfYh+O2NJUvSg8JcXo9DQDdwzVempsyOymuHljUkOjemgBDVMWfKbKNhQ?=
 =?us-ascii?Q?OYzzx42rk3mJlTWxPwhdntacOsEXKch+4TUnDgYqRHCvrIxMs/1ua52VqsUA?=
 =?us-ascii?Q?ZI4TiBrB9I0GepHOobRTUl5N3lAFQBKidvwI8shzBOs+2S9JogVrePSmXmbp?=
 =?us-ascii?Q?uKP7MmHeRTMmVChpCTqVzpGWZsBFH2XZwhxSRpb0Jukj2Ai2KhcJglLF2Sd7?=
 =?us-ascii?Q?nG0VQPZiogpd46r8U3V3PjuZIbEBD/Jajg3OpT91TBj3/Nlinmh9FmHZSdj4?=
 =?us-ascii?Q?5djDImcm3jlxCZUF0b5nlkG8HhtTvuE088rIcKcS0f9yp2z+wpVOq4CRFLkn?=
 =?us-ascii?Q?VtF+OwABOh7X3C62XKUAjXDa5IWmpgKMrZ9cBpYwpDNS+LFm36mwhhcjETT8?=
 =?us-ascii?Q?QO7zGblHO6WSVRDIGbBM8OR0ZHs0BSK6xpj4odcGrDonJHB25h/sZbgGuObW?=
 =?us-ascii?Q?pWHQAnf7UT0fXsAR9u+95Ss0I4jcadAoXI3JBH4PVO+por7JeTn3UoXaEFcI?=
 =?us-ascii?Q?0g+vXbU+zkHHW2v702RmlcW5SRwBxsyuMvQL4iDVcHjIS1/W5jGDFZtK0DIn?=
 =?us-ascii?Q?M8+6gnwEavej1MuYJYMweW3Cp0nVSjBaIzRZGfozotysHQVt6vVU9e8bHAHK?=
 =?us-ascii?Q?07+etbdhqFZ2r6YM1qBltocesj4Yhw+B/2xKn6I/Krxc67kcG09vf3sjZdXs?=
 =?us-ascii?Q?iaZYlnDKzKYKdNiqyoUqV6ONGFDE+V7L/dgR1rIRWhwJshD6Ol+vBva7FI0E?=
 =?us-ascii?Q?IKm7xVqnn40SjxzCNGwrRR4IL2Y81TNHvXFr9YF4CHgvMNuMqeV0VYrTr6ph?=
 =?us-ascii?Q?jYkFEnVaK0ucSK1heFXCGDPM13BWfu4pNnRe3A4rtMFLZTFVQP31gElWH9qD?=
 =?us-ascii?Q?V0czCjdc7DCP9jTLAuy3ZhA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec86c1-faf0-455d-062e-08dab098824e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:09.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSyLUSoToTmwCTAyB86O8rbQFjCfjCGexTtHPE9JGiikCwM0m2PlI35RRO9VnjfKpr3aF+W5s2p84qEnyrkgRQp8oF/S5I/7XP0iRyFRcV8QSGMovPVjYiq/RxFmRoBC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
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

snd_soc_dapm_new_dai() setups local variable "template" at (X) and (Y),
which is used at (Z). But these are difficult to read.

	static struct snd_soc_dapm_widget * snd_soc_dapm_new_dai()
	{
		...

 ^		template.reg = ...
 |		template.id = ...
(X)		template.name = ...
 |		template.event = ...
 |		template.event_flags = ...
 v		template.kcontrol_news = ...

		if (rtd->dai_link->num_params > 1) {
			...
 ^			template.num_kcontrols = ...
(Y)			template.kcontrol_news = ...
 v			...
		}

		...
(Z)		w = snd_soc_dapm_new_control_unlocked(..., &template);

	}

And this function has error message, but not for all cases.
This patch (1) setups "template" in one place, and indicate error message
for all cases. This patch cleanup the code, but nothing changed for
meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 56 ++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 764830a51d2d..92140a78573d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4130,56 +4130,53 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
+	const struct snd_kcontrol_new *kcontrol_news;
+	int num_kcontrols;
 	const char **w_param_text;
 	unsigned long private_value = 0;
 	char *link_name;
-	int ret;
+	int ret = -ENOMEM;
 
 	link_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-%s",
 				   rtd->dai_link->name, id);
 	if (!link_name)
-		return ERR_PTR(-ENOMEM);
-
-	memset(&template, 0, sizeof(template));
-	template.reg = SND_SOC_NOPM;
-	template.id = snd_soc_dapm_dai_link;
-	template.name = link_name;
-	template.event = snd_soc_dai_link_event;
-	template.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
-	template.kcontrol_news = NULL;
+		goto name_fail;
 
 	/* allocate memory for control, only in case of multiple configs */
+	w_param_text	= NULL;
+	kcontrol_news	= NULL;
+	num_kcontrols	= 0;
 	if (rtd->dai_link->num_params > 1) {
 		w_param_text = devm_kcalloc(card->dev,
 					    rtd->dai_link->num_params,
 					    sizeof(char *), GFP_KERNEL);
-		if (!w_param_text) {
-			ret = -ENOMEM;
+		if (!w_param_text)
 			goto param_fail;
-		}
 
-		template.num_kcontrols = 1;
-		template.kcontrol_news =
-					snd_soc_dapm_alloc_kcontrol(card,
-						link_name,
-						rtd->dai_link->params,
-						rtd->dai_link->num_params,
-						w_param_text, &private_value);
-		if (!template.kcontrol_news) {
-			ret = -ENOMEM;
+		num_kcontrols = 1;
+		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
+							    rtd->dai_link->params,
+							    rtd->dai_link->num_params,
+							    w_param_text, &private_value);
+		if (!kcontrol_news)
 			goto param_fail;
-		}
-	} else {
-		w_param_text = NULL;
 	}
+
+	memset(&template, 0, sizeof(template));
+	template.reg		= SND_SOC_NOPM;
+	template.id		= snd_soc_dapm_dai_link;
+	template.name		= link_name;
+	template.event		= snd_soc_dai_link_event;
+	template.event_flags	= SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				  SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
+	template.kcontrol_news	= kcontrol_news;
+	template.num_kcontrols	= num_kcontrols;
+
 	dev_dbg(card->dev, "ASoC: adding %s widget\n", link_name);
 
 	w = snd_soc_dapm_new_control_unlocked(&card->dapm, &template);
 	if (IS_ERR(w)) {
 		ret = PTR_ERR(w);
-		dev_err(rtd->dev, "ASoC: Failed to create %s widget: %d\n",
-			link_name, ret);
 		goto outfree_kcontrol_news;
 	}
 
@@ -4193,6 +4190,9 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 				   rtd->dai_link->num_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
+name_fail:
+	dev_err(rtd->dev, "ASoC: Failed to create %s-%s widget: %d\n",
+		rtd->dai_link->name, id, ret);
 	return ERR_PTR(ret);
 }
 
-- 
2.25.1

