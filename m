Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E777601DA9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C24B8E48;
	Tue, 18 Oct 2022 01:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C24B8E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049851;
	bh=CcaeVGj1sc1OkJJ95ICBOwCzH4g6sT33rO4mAa8JYpY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1QSHBBy9Z1KQxmjCIb+vsM8uMNKTcBnSsD+b8me3zD3vB5Tf1SB3VZoJMidzopqA
	 EMWhb1PyfPzUcfN/QGCuQy4cLmGkaF6QCklv/EHcLW4jaLvqvrDLAsw7452iZ2tRx+
	 eMSjmcZJzxPg6M/1xW5PjOyPShC/myVUvxz17Rgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB394F80149;
	Tue, 18 Oct 2022 01:36:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F81F804D9; Tue, 18 Oct 2022 01:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E56F7F80149
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E56F7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="K7K0XWJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy9Q50s3Swp+aBgtAqebIO105s8u12mfdqWE6Hixi6Npv2dNBB8FYLbxe+WotFplkjEbv/0wJ10ON6BFWe6GYyA/5e7QcdDgyVMVenrngjVoGQljKNxpV3WPZw/o7PSNqyYrX5OeHzIau5fpIRovgawqkxj9K0IM/81utrK1aTBMGv+rpII4c98f/VJvzVXlh6cgAXF13ze82us8Wuj3coKkaF2/jesqkN4Wkk2c5HDLlnXz+SAtNHXwsbja+tst533EuOP8JwGwmr0TlNeO0StQHO2d5qRUHjA0lOmKOaBUugZFMJXVRltp5AlZ8l11XxCrUtun5ih41/ctFsJNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCc1uUpTlKt5moZluVRm8uZD9QpshNc3QhAGSxw6Lpo=;
 b=clwYhs7r0gcfrtzLibFo9ii5KEO2Pt4DDUjBF+N3Z3jI+OuTKF75STNDyfsmj2Wu6KiEEYy53feFbn+8foYBBj9hRGBQHpuA9+11N9b/GJjYoWblMFBoeDw6+2GXURBjVOQvx+8OVgqU3Tw18fdp9IwaLcLilK+eukUL62AEtYcqr6sqiirMhuM1WnT5QTrcKLceBcPaizrc9LeLyiW8fhmoCXJ4NQqsF9e9w73bhE2g1gE7WSVfHLYc/GInj3EQl4WMWw3/49XKf4QCCy65bahaH6jlMtLzwv1OiAw1wkeOTTfzK02+Zf7RHfskVSg7iOP4CLcmkhcAhzelFSGQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCc1uUpTlKt5moZluVRm8uZD9QpshNc3QhAGSxw6Lpo=;
 b=K7K0XWJ4yXKXuA1GZct5nc2YNt8Ts/VhRZQeG/3lvV6bL9suDzPNMxpICpzNq45EfhiM6W40Y0za/cM+bY/qmzcNarJg0x8eseHDaPAVD1e5xPWX7w5qvdN3a+gnOfm+p78XFdxDQwde2SlKbPis9d7QUqpQ+6a8EW8qHQNqqOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:27 +0000
Message-ID: <871qr6qayt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to
 snd_soc_dapm_widget
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:27 +0000
X-ClientProxiedBy: TY2PR0101CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 273e13f2-3ad2-4690-06de-08dab0986946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqFeUU6qPVNcJyMSu0fagCsQs+i7dJCOsQP3Wug1MgMQICkClEabNvtHj1kwROqPIPCskz6JdqgWgt4jG4p6LP2PBJbGWuqVjL1AYPvJkeNNZsoVD9NMQb8bTzZ+UwegcZzCTEIva0w16xIEACk3/UhDfjFSF42tr5PzjhhmpP8kp6PHgmdQzBS7iQMNzC8oix0zD7cY+UmxqR8ben7O6TYicBrSSsL5vhmO0F3BRAQf1gvzD7cDujnThC9Zf06/aQgmIW7tfvjYNJiQki+mtkFFJg+DX+2QX6f8IaSa2/RSQ/YPxEYvL+RSJq1u6mXXwU2fMJD4RyNdoL3Q65P86eYOYQBPIuLRIMc/w4iBVAn+QbmtAT598JuBcdo7TN9GTF7bvSyQxIE2pv/ZVpP2v7mHwsQU1kbUODwJzkI2swqkwETn1EkwiRV7A5dFL70YlKsXABRSvAOq/tJHXe2aB64SpEHtL294rtgQy2uHCu+cWmp4nhPiNGbOeZcRrH+en5L2njhrq8F8NC0S3VNsRmG6FU8ve7D5L0M0W1MDJns30fWW72Pp+PSTzNm6S+pr6BwvY0kw/lFxlawCnhdxSS2IS1c9U8y8/tzwgZaE75CnzGujmRcfO/5JelZDv8IaPf/HexY+rlcW/v/UyfkSqtt26eebJtloX4pR5Fej1FPTsjeJhjPcwNmIKwWmAh5TLrdV6pWGn0qkPkOfZet4pj/DfIpg+fnXYcsWhTc8pfwo2dSbNKu4SWIS6vgwjwgRW2RQg2FM3GKlJnYyPpToUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEycfnHjJcNKGw1t+XrwB+aIoz8HF+TYZlyetDAevFMxqSMlVjSpLOIEEQcU?=
 =?us-ascii?Q?e5MsRPIkYEqKwbhucfU/qrnxf2ts9anUCDJ5ZTPkda/c6k5UBYBDiK3tee7n?=
 =?us-ascii?Q?1DaZcqOEf2c5oatdYmbmr3fSt/jGC8aCFJbiXXM6rwfH85JIjQYh0H15dhPP?=
 =?us-ascii?Q?FQ4VJVQEx2WjkKHeJ+4tNKMS8GlRiM8ZXYpx59Kq0rV1kmZLai+pj4IqeKVt?=
 =?us-ascii?Q?EMT6tKTtgDGxeLErBuz2pobFXdpKNRSv15rqJa/LaVE5ENGjddiFozitkHU3?=
 =?us-ascii?Q?Jbl/VvyRWuiWF9sccGjsp62Fmo6RoUP+r+rEvI2mH1WbjfnJ/TQFcK7IJ447?=
 =?us-ascii?Q?7bdD97otGD0li3ltVZSBa8mcCPRqxRwyX/LnDnJgOcbWhTpFTq86ArrqlDne?=
 =?us-ascii?Q?q1DzDlzx/tjDDXxaR3bCx1qmWZ58ojguPgqAQ/RAV2kNzoqvGXnKBoRVsTQf?=
 =?us-ascii?Q?jh6X/Oc0r5S0NVJHbUJj3Xu6DLUhyupHKxdJNTV2eDmHlFQYT9pvygdZ6qQC?=
 =?us-ascii?Q?ed2smB8TZMLCv6yI5bGRLqleRsrRugqnNhciaNHGbc6gd5ucLGUcpu1bq0Wf?=
 =?us-ascii?Q?KL0wlIGBXe6hhKC9/hHdUQGHIYg4kDkrGQ8PHLtyFdV3gglp4hpyGyZMBzVS?=
 =?us-ascii?Q?SiYPqOFBPyAsk3XwaIGPWq8WA5gtPfNKt4qb61ra8s4YEwZeN17gnrbc10y/?=
 =?us-ascii?Q?1RBilM7EskqZi2W8j2wcZyok14xAHvBbc5curLVyP5olPWMoNMqfmgczJUvb?=
 =?us-ascii?Q?X/W5rCTlgpSE+m+DKD7XzMyd9G5To3oOLL73yVpbG7VN1RjTw2tVLUJN+9Ob?=
 =?us-ascii?Q?w63iTU42KA6vnqmUwGOYKyRWJXcU+WF4fKMtFdzUEiDfym23CwDpqobaXdn2?=
 =?us-ascii?Q?aoXBi4KBYnzL6u8C131pOGw+Bkap26iT4lCPkvAI0VsuSzmnhnjBUH/88HO/?=
 =?us-ascii?Q?4/xYlptJLQ1k1si/D9zzxhZY07EIg21JgjtAUtMZiXe+fFJOiQ89rU4yUCjD?=
 =?us-ascii?Q?dnSwD6uaokAHrNpQyFx4rzyN9ug2qMz+QAGnlrqPkarxfaC6R5lLXOgRDgM8?=
 =?us-ascii?Q?ZYSgthoUQlbHwZfeGmAUsWKxPY1KiWLDeXRo3gikz5OXWg3CUXSAZfEAvnc0?=
 =?us-ascii?Q?Ca2oZ3D2fSJ0RRclyWCBqly9O7FFfZESJHunAEPyf1UEQMRMMBvxd3Xt9OZY?=
 =?us-ascii?Q?aNCRXLkaLm3GOd3cu0dlRsh0eFAzgnrGmIP9ZBv6hnd1ZwE4oowFtJr9ez4+?=
 =?us-ascii?Q?twXjLpSdC4QkN9b24qKLd2OCX2/ddHuX2+JSxT9G8TSbS8v6uV/3I1YR6hVW?=
 =?us-ascii?Q?n47dd5RxcUg5Y3yt46NDaJZKCVJjAUaRmnn1Cle/kvFmRr6edpEqboSfV7m8?=
 =?us-ascii?Q?CCn0Bf9V14SaIGM7Aq3sdio4CX1w0JrnY7j6EQsaAvZ7pFSn+4QS2Ktd8xQJ?=
 =?us-ascii?Q?9ZjzKuMSmamAy9rQMDE1gd3Xf36ETGysO6aCjhU+Et44p2GQ/C0NzeTzspSA?=
 =?us-ascii?Q?Z1H5NzVwJgwnVKIZG8RnK/EPKphD4qGSxZuoA33Itsbf3Hky3dbrVq3son0L?=
 =?us-ascii?Q?a0As/5YwvuX1+lE8Ezle+mdQDnXklVbiuUI+KA7CBchMjaNjWKko7cXnBo0f?=
 =?us-ascii?Q?nmBnksaL/1im4De3/d3u2a4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273e13f2-3ad2-4690-06de-08dab0986946
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:27.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePSCNYPWMpuSo8t2mqsKgCs65zOLJYeBU1PWq2Q42VvZDmyejTWhk0lAsf2S+/zOodL3Pp2Pa37jC/j5/kPC6xf/IBvgYSCAd/HkvjElRxf8l5yuBkHqpFVzbXOi0DI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10199
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

Current ASoC has snd_soc_dapm_wcache, but its member is only
snd_soc_dapm_widget.

	struct snd_soc_dapm_wcache {
		struct snd_soc_dapm_widget *widget;
	};

It is no meaning for now, and makes code unreadable.
This patch replace snd_soc_dapm_wcache to snd_soc_dapm_widget directly.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  9 ++-------
 sound/soc/soc-dapm.c     | 29 +++++++++--------------------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ebb8e7a7fc29..29d5700393c6 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -450,7 +450,6 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 			     const struct snd_soc_dapm_route *route, int num);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm);
 
 /* dapm events */
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
@@ -680,10 +679,6 @@ struct snd_soc_dapm_update {
 	bool has_second_set;
 };
 
-struct snd_soc_dapm_wcache {
-	struct snd_soc_dapm_widget *widget;
-};
-
 /* DAPM context */
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
@@ -699,8 +694,8 @@ struct snd_soc_dapm_context {
 	enum snd_soc_bias_level target_bias_level;
 	struct list_head list;
 
-	struct snd_soc_dapm_wcache path_sink_cache;
-	struct snd_soc_dapm_wcache path_source_cache;
+	struct snd_soc_dapm_widget *wcache_sink;
+	struct snd_soc_dapm_widget *wcache_source;
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_dapm;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d515e7a78ea8..1796863bff1b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -652,10 +652,8 @@ static void soc_dapm_async_complete(struct snd_soc_dapm_context *dapm)
 }
 
 static struct snd_soc_dapm_widget *
-dapm_wcache_lookup(struct snd_soc_dapm_wcache *wcache, const char *name)
+dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
 {
-	struct snd_soc_dapm_widget *w = wcache->widget;
-
 	if (w) {
 		struct list_head *wlist = &w->dapm->card->widgets;
 		const int depth = 2;
@@ -673,12 +671,6 @@ dapm_wcache_lookup(struct snd_soc_dapm_wcache *wcache, const char *name)
 	return NULL;
 }
 
-static inline void dapm_wcache_update(struct snd_soc_dapm_wcache *wcache,
-				      struct snd_soc_dapm_widget *w)
-{
-	wcache->widget = w;
-}
-
 /**
  * snd_soc_dapm_force_bias_level() - Sets the DAPM bias level
  * @dapm: The DAPM context for which to set the level
@@ -2516,12 +2508,6 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_free_widget);
 
-void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm)
-{
-	dapm->path_sink_cache.widget = NULL;
-	dapm->path_source_cache.widget = NULL;
-}
-
 /* free all dapm widgets and resources */
 static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 {
@@ -2532,7 +2518,9 @@ static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 			continue;
 		snd_soc_dapm_free_widget(w);
 	}
-	snd_soc_dapm_reset_cache(dapm);
+
+	dapm->wcache_sink	= NULL;
+	dapm->wcache_source	= NULL;
 }
 
 static struct snd_soc_dapm_widget *dapm_find_widget(
@@ -2961,8 +2949,8 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 		source = route->source;
 	}
 
-	wsource = dapm_wcache_lookup(&dapm->path_source_cache, source);
-	wsink = dapm_wcache_lookup(&dapm->path_sink_cache, sink);
+	wsource	= dapm_wcache_lookup(dapm->wcache_source, source);
+	wsink	= dapm_wcache_lookup(dapm->wcache_sink,   sink);
 
 	if (wsink && wsource)
 		goto skip_search;
@@ -3018,8 +3006,9 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	}
 
 skip_search:
-	dapm_wcache_update(&dapm->path_sink_cache, wsink);
-	dapm_wcache_update(&dapm->path_source_cache, wsource);
+	/* update cache */
+	dapm->wcache_sink	= wsink;
+	dapm->wcache_source	= wsource;
 
 	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
-- 
2.25.1

