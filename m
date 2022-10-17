Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED9601DAC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD488E5F;
	Tue, 18 Oct 2022 01:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD488E5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049880;
	bh=I5G02RjgMCidsQZkbTBCklj0B3k+nYhlPWYxJx0trTA=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHsY7pSevhAw6taqrtISvmLifI87NEkM/o8ye8PKz/3VA0FZndMI/RKMtYLoL0Sdu
	 ERV1RMS2lTI7zxl9fNES1UzhWrRJvjs2/qcLcT3Zrha1XmPtaF1+hh2i3iSCbh3eyE
	 qktJCyno2tuXvIOx/lVXOck+zTUMGbSizs+JqOPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 293C0F8025A;
	Tue, 18 Oct 2022 01:36:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB5AF80543; Tue, 18 Oct 2022 01:36:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDEFF80548
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDEFF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="IqCxCu4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQEuVbBY6HfEUyJwycWF6ErkKuRAWml2wCM8KWgFKIBW0aroSkFXq7IaWklXINHxzaFM4Eqe/XbCj3fUAF6lifnDlUAXQ7uWF/T0HmkI4RFCTHD1GlK1etD7TCcUzqPXdBA5Scnokq/gwYCnFjVCusPshpm/S3chLpeiPVIEImuoAVpYRNOnocgqfNj/QeQQ5U56uaGkKTyyAqGqUgAOZOJY8560oDqghMqhuaqKQcZASqPEWTbPgqLJO7Uh+AUTnjNFe4WrKrwFyBtOyQXhrPA4dLSFRJWgFQ4LY2VimZND80jqhRVlb9IVqvuEwyjFAXFhZJ8Nw4wB1quseZxpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+OXH2PPYfYsnFBFHjj9DsaqwdSQr9JCKTvuxXpwQco=;
 b=KPLdVVSwtifV+oYTQ+rIh5gYeOAQWO8wfxP3T1JswcAj0xangmn03f1UVS6G0P69CpK5DyGX5/yQMawB7OBWG+nK+K47Zne4gcoHe7O5VMaTR6x7yu3q7YRowIGoZdW4K3/zHxRkZtEK2KxHEuvltaj1nEX5QrQqrkEmOGFA6Q2pnXhEreMJxeA0/xoE7YcSRhI3f2AKkgRXjo2spfu9I/XNzxvB9h20U/pRavBT/eWd72ginwck9M5s/FtiSn2OPynCFBuO8XJcE7Y+nteHyvM8gn9RxzJEGy44DjhlyBLCoB+9SZ51FbRj9jf6wExStOmIxIuitN/Xv7Xz2/Llpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+OXH2PPYfYsnFBFHjj9DsaqwdSQr9JCKTvuxXpwQco=;
 b=IqCxCu4MCdqv15/cIME8q0wKlPgrL53KPtecdorzoxaPWkbtpstRQBq+NrmVNQylIlARZ7rPtjBAwUTskqs4t2K/SuhwmaDnwy9auosP4QGHq2eD9/FEXF3S+20lXDhPKuRnUi9dkyvH4zf6m9zC82tXe6dpVPL35hB6IRaMAfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:42 +0000
Message-ID: <87y1teowdx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/11] ASoC: soc-dapm.c: remove no meaning variable from
 snd_soc_dapm_add_path()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:42 +0000
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 59901561-611d-4ea0-3a79-08dab0987225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUTW9V05hD46ZyR6Zyy8Ci0F32MijN8AHpWxYXFVplI3clizfsR/1hwuaetf75CA6CIeEkYDJmvyWxwZFg6Nr1ebGNMNpilbtV7zn0lJQylnUF0IMmW5s8KUItp+wzu53Sa4HhRUpAtMEoFauZ17bmXUU2J41s6DtSa9FEpAnaJwuYzdM55ofBZNjeD2OBbQ0/1jdXDlkbvtscD32V2ngKrhHgOFoROapeSw87viJnx5V+5rLKLYaQjuS5nQAlfbR3W30kxrIV63GfgApv+J6WGrBKaibM4cxJKRFGLG0D1lEiG9kyC2sy948buChojFw6Wnh5+8Ioce6Izy6IlG5Yxl5JiqHHAbqtb/e6a2eFbyNzq4BaNAgprmK6YbNkun3ATBrHMy+Xmk6QxIwLFC/wcws8+Wciy2ZgrcFrz6sfNHoF6GXj/7OXVSYUsSXsCNAFLX/fuYNLGsQOiOPePIczFnrX94XNoty2aYcyP7at8qxnOVlDvIb7PrgvLxwIlx5fbodjdac0jcDM+fo79pg79zg7yysqg0vbmPoMJLkyfNCE3+ripufJyLKMkGOGvW4lAUBC2w6aAL6DR3NGZymlgFV6Utb+TCJFMRVuRgLkUbCV3ReuHRFeNC+OYB1mr3tGypm4Lw3kln46vVe1G7NA3y/alFLfrtTNUO33FBiuGOx+utK/PLhvCt0P4SXAmX+ODMqKk43nhA6kJ2ufLmLXNvky1NSdYM6W13TOTBajFMVhfK5rniyld3EBrKZiKfPY+iT4D2n+tbBQI+4EMHhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+wDT+m88YzL9VV6TXRRpSQlLtWnm8xd0SGGPJE+V66XWRPLPRzcvw2wY8ntN?=
 =?us-ascii?Q?ReiKV15OisKyFzAX7vNiNrdiIyDzPOk21CoGHsZ2JzvITKnMJ0O3OEX8RcEA?=
 =?us-ascii?Q?epYbUD4Q1YHJt4bMQd1e5yIn1bTB8Uut53Eek0JcN4e5XxE+AfCqOGsv1GEC?=
 =?us-ascii?Q?hQtY9oNwILr2wGwO9pQutD0agUJsbxmwtwAslpADMtXsQtUF9gGJ+fKLH7LH?=
 =?us-ascii?Q?lau55TLf5ioJKiGINpWdgg3Un7BJCaY4ZdfOFvguSUR+UjNgThNizPWxbibp?=
 =?us-ascii?Q?8EqR8vMMO56SW8RfPX1MA/tK52Q0pLPzcim1GfuuRHNb6pGKnLTyYC2dmqtf?=
 =?us-ascii?Q?vh3utkaUnIPnBrVfJ+cWwGbQylbYpXiltzFS3YXlEvT5f+9QJLgdExEux169?=
 =?us-ascii?Q?bVnPdDSgrGh3sTWX5cvR32QCq8JH47nqYGFUD+i0NcwLkKcxT7Z6jZ3reZJV?=
 =?us-ascii?Q?/bgb17/o87bbPBoVtHYbfeURviSScKsYwjC6WdRjkGa7G4CoyIMozdln5Ehf?=
 =?us-ascii?Q?Q013WweZ8QUMmdZb5YnKQIN1skzXRQm0jSFMtfMoDYG1ACkcZLM2vV2cXBj5?=
 =?us-ascii?Q?REoXNuUUGHVdJjWRjDWF8a4HmjsO0MjBDM4+ljwVBd1g/5PKRnEmSwugwbCB?=
 =?us-ascii?Q?t5KIzNQX3Fdc+ClFlX/IxT7CmJCGIsibHTqJrHuckHmGEkwV4bHREgkmlzUd?=
 =?us-ascii?Q?v1qYNK7mn4FN4XNHDW+IgGPTkVOmIUfRy2WxV5yju9Ucr5CwvfxJWPSoIHEc?=
 =?us-ascii?Q?prH3R3BXZZR1IqzF/vwj6Z4T7GbmsPwGszle3MeiYweUm9gYSjESjGByhPTw?=
 =?us-ascii?Q?WSbK/4DL0wnXl7rqkAkRw8y9uppY2JDoNVlIVcUV6nU3zw+oLWAcu/tGWnXd?=
 =?us-ascii?Q?FNIk9rPAeGnqYo6nKinNMeGmWi4ZJ4Dzvwwg9i9dA3mB4wJa53NlDV+rNf/Q?=
 =?us-ascii?Q?MSI5/1Fim0LxfoS0U+wzeiEYXV8SOPYa1969nLpTSpJOxzVdjEaNyqXjN35V?=
 =?us-ascii?Q?Drd8NkakITr2E2fJHeGOqcKcL3CGxtXLyXiBvnBBaHEcCzII4HdpgCYkVrDP?=
 =?us-ascii?Q?6BUZ2+eiwORtF6wsjSbsPW58A90IIlZNpF7Pzg82bLXO9V2pYdTI4XkGDGtU?=
 =?us-ascii?Q?YskNT8PZnwXvS7Gy0D5XUZYsg6L5Q5gU0pLF0s5Pws0a0VavA7/DgELGKYOw?=
 =?us-ascii?Q?7lZ1I+sf4I6ENuX/YQxt6FM/z9rFJVoodQLRSbAse9QgBgvii04xso4FkcfC?=
 =?us-ascii?Q?N7fPFpm+kfO7+39UNlCKpR0tDA//8pCzEhKoX4vthynBNuYfnN/RXv43thvI?=
 =?us-ascii?Q?Hi8WyzFm8K0F3UNs7Xc3jaKPdYRqBfOdjngb8qGCe4jDNHBc1hcsUAZRSm0X?=
 =?us-ascii?Q?3lu8oEznZKDXeeZvdhw3jZ2ti/vQM6n90kNl5MzF7Nnl5+Na7x40zzJVklX4?=
 =?us-ascii?Q?kyJ2wlU7XvW8g111J3TNIVg21/Irpqpq7qYdRlQmXDJIp7LIYlMwnjsxPQza?=
 =?us-ascii?Q?pIgpu3h/VJp0wSlz14OUZzhh8LCmBggIioeo1QsiCrrNbrDpzRoQOkwqGC3n?=
 =?us-ascii?Q?gaG1ZMWCJoJZBXsqTK3S0LkDVfNsYTugFnklhsksH1WFz8jPivdSIm738ui4?=
 =?us-ascii?Q?JFri3KaX57uBKn8hlWRbuwU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59901561-611d-4ea0-3a79-08dab0987225
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:42.3844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMa4BUehiy32gFsVhvEkLSLsO7RDnJf2TjkeWt2RM7KXGpujftKWMHjF3KtlmZwR+KF56Kjqyrwza6XMoFt9CtFnA8drg/VI5hWoWRdyqa7D4Ws+OKV7HRDY+hJhC2NK
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

snd_soc_dapm_add_path() is using local variable "widgets[]", but it is
same as path->node[].
This is no meaning and duplicate operation. This patch removes "widgets[]".

	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
	widgets[SND_SOC_DAPM_DIR_IN] = wsource;
	widgets[SND_SOC_DAPM_DIR_OUT] = wsink;

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b4f876dff994..f9c4fd11853c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2826,7 +2826,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	int (*connected)(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink))
 {
-	struct snd_soc_dapm_widget *widgets[2];
 	enum snd_soc_dapm_direction dir;
 	struct snd_soc_dapm_path *path;
 	int ret;
@@ -2862,8 +2861,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 
 	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
 	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
-	widgets[SND_SOC_DAPM_DIR_IN] = wsource;
-	widgets[SND_SOC_DAPM_DIR_OUT] = wsink;
 
 	path->connected = connected;
 	INIT_LIST_HEAD(&path->list);
@@ -2905,12 +2902,13 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	}
 
 	list_add(&path->list, &dapm->card->paths);
+
 	snd_soc_dapm_for_each_direction(dir)
-		list_add(&path->list_node[dir], &widgets[dir]->edges[dir]);
+		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
 
 	snd_soc_dapm_for_each_direction(dir) {
-		dapm_update_widget_flags(widgets[dir]);
-		dapm_mark_dirty(widgets[dir], "Route added");
+		dapm_update_widget_flags(path->node[dir]);
+		dapm_mark_dirty(path->node[dir], "Route added");
 	}
 
 	if (dapm->card->instantiated && path->connect)
-- 
2.25.1

