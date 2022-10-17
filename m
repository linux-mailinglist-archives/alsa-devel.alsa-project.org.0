Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D72601DB2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78ED8E2E;
	Tue, 18 Oct 2022 01:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78ED8E2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049930;
	bh=0WcOp8MTXyasmNZkV8Wyu1Kx55UULwgfVzCqmvSlj1E=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t1/x35nDU1L9Pzzobta/Fd5j7SxNbyeG8+vKkKHUiKLLqqivPU/0g6G+FtolbCp6X
	 tBpnd5A3RhgJJ5Rvp6N3g2dHsqurSs6poF8y53b72SybGNG7o3asSRx5NIe6EgSrv7
	 /JQmgyLWVBhltV+rD7I6PtZhdkg1oYuGUJyRbu68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98381F80567;
	Tue, 18 Oct 2022 01:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B53F80551; Tue, 18 Oct 2022 01:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA2F9F80533
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA2F9F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="HnUgH9YB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc8TpfV+EzVe/3S3TG59fuTbk3strTWMd6/I5aUJ1priujj2dHZ4WV3zEbiCDe3fx2Dpr9AQhh3QmySn8yDBfheKXPMANUZkT9P++4c/f7Rt5Ot7xoefM2H2IYfWezWwbYeuBcFdx2OPwKzhpEDB/pM4BH8i3xb4ECfkA9faHyWzeH0bkDrRbbBvPh8FIkrcBZIuoqm4UWj4QMatEG/RF8dwSwH14COgpwgJcE6rC0sWtAJbT6uy6fLDDpANRKwn3XElrH85rQEAVsUcOZIMXjNAsgj/AeFVBgOSVBcpJZEutMx8DlrgjiP7uTITgcB+suaUzQL0QJsoC1yzaXpmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVVQrZc6UZrEvJwiSHgFbITlsLwkyYu1IMo64mlJr/Y=;
 b=XpB9bXoveazds4nJDNQMwodMiGIpXE6Ic/01kjSLzb09i63KfZo7loYk+HdU5dkaZ0rV9ekkoSgTD84M/UNpiKLfClAKLJXYEUMT4nbQa/NkdNln71I9in8apPBiVStbcZkJxH4Tbp9Hh5jN3GmwLKBY7bJ0+Kd0MtTeNEOls4fObW+2mikkZohWJfyKG2xk1j7BsQVyOLdMjBflOAkxTjtLs2bWYRSB/wBYWssa/BhcLXqT8Fg24N2K0+oGip0chkxAKWaqixy9EUk+grzGEYkmLXwGI3APQCtK+so7v+umPVnwLwlUj/OqHAOK3SD59B/nSxreqEovrAGLSiPyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVVQrZc6UZrEvJwiSHgFbITlsLwkyYu1IMo64mlJr/Y=;
 b=HnUgH9YB4SS9jv2tIFZz/3+fNeUMceSr7vqjhHQUhULepkkglWUgKVpw6rbeNbP1pZF4h6rGKt1DwEihSkuHGL+CkLU6UCO+du8tmYFWIl1HmSz8fC4wOnrbE4YxVeflARnJtwVWPf8ebyWki594o8jiVtCVd/ujX04JEkOesI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:37:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:02 +0000
Message-ID: <87tu42owdd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: soc-dapm.c: merge dapm_power_one_widget() and
 dapm_widget_set_power()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:02 +0000
X-ClientProxiedBy: TY2PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:404:a::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca3e2cc-4f9c-4254-f784-08dab0987e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffeFLK+Z0nKJTDMY5azSwL8L8aLpQpvcNTJPQ96+qVZPUxcCI6id7SMecweME8jGQwcHGa2Nv6ado+n6Mn2BoXy8ALKwMQrRtBAPLTdVxOs0pc4oIDQ3xMjEQrs9zxnE8LsXO8EzIbkUyg2T9cTwRsNdhzWWI8YbiG4PGx+AtGd22VQBPD84j+SeSs035o8TDp5gsJ481HJmlByWgLG5IkhwjxTFZweOv2wXJYqbrA4Lyxf8gsR+5GF/g7/FekTdQI74gQ4qpzl6AICZCa2sQPg1OUH4SMQsXyXw1yHRKUCeAY3FW3CYoFswvdArd9GXi2hUjnvnshTOZZUQ3iTbI5ApmPN4yXxdkJ/ZDroS8rSjJTeFFkN2kz2zLkGycC6uZjyoz/wAbu1QaBmAAMvPehtgJETNAS91CbO0ANS1o8VXhFSBjxBMH0KwcJ93RrOlKaiXSyn87aCkQAfPyr1+a8tmqXBokYM7PKukyveiFpnI1xCT6A1rQ8lYMIOGLMzm6EpyKpKkQCVtmT6e84oaZJL7Qig3nKelNxopWDNxdgoQVo8KI6tKOkgJzih7AhVPuPRpsu9CyVK36AxM4udW8hu1g4q+XxIEiuO6vfaN149uFOd/Pju0l3sVxKptalKHjXUZ3iVzwfk7Ng50UYIuP7ord7QuKxb/Gt7HiR7iWWa56jjUjBfOVOlYSfQ2Gni77cekJ8p/gk3JUgTnAqSjq6efe5xr25CJKSLzNI2P47XTqjaI6HSYKKK9kdyFkALX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GGcxtH40UIGK0/oKbdvHvpW2QRpL4h4juUS2IVwzfguBRqH8JgU7u2ZYMo87?=
 =?us-ascii?Q?2bNx52POwe7c6HOqGqC4slJlMP0vzpG1sYco2uvyeGssp7RZLR6gpFm6P3xc?=
 =?us-ascii?Q?Jtrd61uP6HcT0LgYQuCTWI92ejOUBx49g9QOzInjdQRJrZhemSSX4KTq6xRH?=
 =?us-ascii?Q?bJTtD0x6u9F8QVeTFyttO/QHr+Q0mOW+8Zs0TE7Y3YPQD00F/+udyUEDWWdw?=
 =?us-ascii?Q?yZLF8RMoVbF3xDR9fzGQnwx2+AqiiI0nzeEgbAtcEYDNFiHc5x5WToG8qU1y?=
 =?us-ascii?Q?1Mb+amlDc1nsqIg6t3c8nNAB6w0t/LDVzraYGKlj327wnKZqTBOfI21oSHId?=
 =?us-ascii?Q?wKBvMxgZ8YZqcEXNIrMF1jkGChInCXE3xY/fg9JPwEsJaNqI7/6sEBn6j7ek?=
 =?us-ascii?Q?5baSNMIoCIo+9EaeTCT4LgroL/iKedn5mAI340IzDkEp5D53sGg3IL7B+InA?=
 =?us-ascii?Q?YWm0x2B+tqKlhyuLMwS6idf2pmsi5Qu08hiDxw6pFB/koP2HTpVoT4UtfMBW?=
 =?us-ascii?Q?fCN10axqL0h3VujcCOtYiZIZia06BKBZUvimoS3+98yUxHyEQP7ee7cCO2DB?=
 =?us-ascii?Q?qP8+WjHUZ5lRKYUoVnDxM8OTwoxH8oiLvcuOYZHAZ1Kbk/J+WV1iDE9pogRO?=
 =?us-ascii?Q?1LhzfPBOgq7LP3b49c3gK7HdVo0qg1fm1OrOhGzCWRaJiFirXGOf8UKsNYye?=
 =?us-ascii?Q?S2Hsa+i+NtZ4kkg9gK7/9NC4RjttWPND8sP7e5uuLUAeNPIQCiSAQxneT5rd?=
 =?us-ascii?Q?tIvhuyayKvXQN4mekIOlw43M1nWsBx1y582l34bMJ5nt3LBLRdAtbZffKm0V?=
 =?us-ascii?Q?2AaGpd82S6b8RoJtKxgT49c9He/MA7D6+A3XXaT04nLxf/hmq1BwTUuSq61C?=
 =?us-ascii?Q?WIlvuwelue94+SQBIJgUY62E1CuXjf/rS8Q8tE68wHCvr21n4oipyipQ7+g+?=
 =?us-ascii?Q?WAhly5GIgKss8/w2fytSC3h0yFzvx78e4N8KuDM5y2lwogAwMPOao5NT0aQu?=
 =?us-ascii?Q?ASFzRCuXAZCJhcxcPc3BlnL0IQhRuTZoS1VWeyltQad/ijFjht6XRI31/h9I?=
 =?us-ascii?Q?FXOkL7iKypDdAi7KDcfbw0+qvLzeeDpE7DiRDayZTymD6SLXeS0/dQBR8rGg?=
 =?us-ascii?Q?HJfqMcLaQcw+dIMBH2n/BOuyfeXYRLurjdXcCZG+C9+Nain+K9Ni4ZvLQ1KZ?=
 =?us-ascii?Q?/nBiEfUPH3KteWTnoDhnhE84gJqirU15SkdGZWCQ2cWD8CoMqFZ+oy5d04ta?=
 =?us-ascii?Q?apLePs7ATchKibIZffYtecdh6yE7z6MgplXG4OjS0/FtbUE97GeZZ71LlGZ+?=
 =?us-ascii?Q?hkubsH7hRV4RLYP61dAx2hNBtbGVnOJ4wOLTTC6TxhDwVlwWczYqlAoUWWfZ?=
 =?us-ascii?Q?xwhr/phGVNalOdMRIIiB9OW2zt1WIxo5eS5VtM6T5GBYonDke2S/v7hypuIl?=
 =?us-ascii?Q?Ug0DvzIXufkFfcAZV79WnqutkTF9udgW3eEqX6pCLnNrF5iHzZSW7YD5BUwc?=
 =?us-ascii?Q?JsXAejewV/78neGoU497qCbNA5RXobjf3pz3Jn5CWWx5+kWNzvcLnf3Cjc3v?=
 =?us-ascii?Q?q5NXGwy2/RzRvou0J94J2SJINiinonJPVXKVz2GtXAAFrmyLnWLpTIpAY6qk?=
 =?us-ascii?Q?o26Wz7Sm2jGVRSWygHTLJy4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca3e2cc-4f9c-4254-f784-08dab0987e5c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:02.8823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ELpo3JSaHTL5/8HxC7l5JNWCUJjLqEzqoBwzuVkuqQsk/JNpKUSeELgJJXhMBeZFZFymiO5F4v5gLZVlylCFBU4xOZWF6vLNzh76KWon9joSjhTIBdHo/Tqm0ShXZ1c
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

dapm_widget_set_power() (= X) is called only from
dapm_power_one_widget() (= Y), and total purpose of these functions are
calling dapm_seq_insert() (= a) accordingly for each widget.

(X)	static void dapm_widget_set_power(...)
	{
		...
		if (power)
(a)			dapm_seq_insert(w, up_list, true);
		else
(a)			dapm_seq_insert(w, down_list, false);
	}

(Y)	static void dapm_power_one_widget(...)
	{
		..

		switch (w->id) {
		case snd_soc_dapm_pre:
(a)			dapm_seq_insert(w, down_list, false);
			break;
		case snd_soc_dapm_post:
(a)			dapm_seq_insert(w, up_list, true);
			break;

		default:
			power = dapm_widget_power_check(w);

(X)			dapm_widget_set_power(w, power, up_list, down_list);
			break;
		}
	}

It should be more simple, but the code is unnecessarily complicated,
and difficult to read/understand. This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 39 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d4281e776e44..764830a51d2d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1873,11 +1873,24 @@ static void dapm_widget_set_peer_power(struct snd_soc_dapm_widget *peer,
 		dapm_mark_dirty(peer, "peer state change");
 }
 
-static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
+static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 				  struct list_head *up_list,
 				  struct list_head *down_list)
 {
 	struct snd_soc_dapm_path *path;
+	int power;
+
+	switch (w->id) {
+	case snd_soc_dapm_pre:
+		power = 0;
+		goto end;
+	case snd_soc_dapm_post:
+		power = 1;
+		goto end;
+	default:
+	}
+
+	power = dapm_widget_power_check(w);
 
 	if (w->power == power)
 		return;
@@ -1897,35 +1910,13 @@ static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
 	if (!w->is_supply)
 		snd_soc_dapm_widget_for_each_sink_path(w, path)
 			dapm_widget_set_peer_power(path->sink, power, path->connect);
-
+end:
 	if (power)
 		dapm_seq_insert(w, up_list, true);
 	else
 		dapm_seq_insert(w, down_list, false);
 }
 
-static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
-				  struct list_head *up_list,
-				  struct list_head *down_list)
-{
-	int power;
-
-	switch (w->id) {
-	case snd_soc_dapm_pre:
-		dapm_seq_insert(w, down_list, false);
-		break;
-	case snd_soc_dapm_post:
-		dapm_seq_insert(w, up_list, true);
-		break;
-
-	default:
-		power = dapm_widget_power_check(w);
-
-		dapm_widget_set_power(w, power, up_list, down_list);
-		break;
-	}
-}
-
 static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->idle_bias_off)
-- 
2.25.1

