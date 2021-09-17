Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906140FA72
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9598017B4;
	Fri, 17 Sep 2021 16:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9598017B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889633;
	bh=cixE2AAWxY97+4ke/CEE588gNpa49NmQGM8HMfsYGeE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkAZIDik5vNL4CholJ6u36CTAeSXX38pY6221Ae7xguSlxej6lH9mXuTBoQkU8LDT
	 XC6E8KM+02olxWZbc3Knb0q6Ppjd6GhHtCUM1jlw1oo1+k7p+5edCCsLqSIju8tPz7
	 /8o2QUeyZIHkxO4o/uBYSVN4jRdcHvoQF4Yu8P1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0BBF804E2;
	Fri, 17 Sep 2021 16:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B610F804FB; Fri, 17 Sep 2021 16:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5B41F8032C
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B41F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ftsIYu4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5ycMJdtpAEZ29R992MBwsZ6eZMYe4Y56FO4wPkvyr13/zouM1sLfm2AUrqAQ7+PoqtlNIjp9E41ZyENVZI5Kp9MRTxN8tfrzw2OrvoBtLMVz62tdfTbRiftUbiMWGIgELUrax/MkkKKxS1jLKavcTYrqLgJwJineNnXCcnqKq6IOLNAlCLF6iWEf23kjZ28riw9ZgtTd+6C4SjFRrRjHJXeJXGhxVBXqyDTyNVfW8CWzIdbytXIblBsWftkvLaPPgH9ulw7wcKRAlt7aXxw4UeAm9k2CwaEjMcaxx5+5csjBEXtWWubn/TzfaudeenV6EJZguVWxwe60nJb98xDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u9I0bTWeTJRJhAo/bWdeNfgm3cdwkNJBKcDPRlyLCzs=;
 b=IZ5tcacx2xg+mdNi+ZbvW4HubY2w1TDfTNvONitddy1jMeAn+fqywogEyMSmBmJH4KFf96Xo1YbckbnCasDWn1Hc3pQ6xxTbJE8pg9ulTbQ8mJqmkq6pkfRUoAZNfgszrcffGY8Ywcwics94f1AFMVCR1coRxqrm5R327KtTdgImsxYTxP9Mnn4scTjWgUWDNKJNzxKG+1/FtAZWxtYwhJ2su/0ZLZ/odEfLeTHLVCHWox3DvA1jrRtPY3318cYBN2Hhkn3xaqZqp92pqQ/pr+/m1TUqCyYVzM5C5BFttB7N8Ujv1JsPiEbvK2Sn4tuZvvZPrdIsrC7haA+JcO3f0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9I0bTWeTJRJhAo/bWdeNfgm3cdwkNJBKcDPRlyLCzs=;
 b=ftsIYu4DtUKK+lFyMAoIX29WqMxBqyBy6EC4QjoGV4Rn/ZWF1EXCLDTo6hX7Nogav/x8dHE3B5nh2R1i77YnNi7rpAGAzceY8IiarJOW+ZUZ+nFoYZlyMB0WhdtMusEZU7wp9RM2z2b8Cqi092h7dCjxMv65vFtEVwhMrfM2alk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:25 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:24 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 05/12] AsoC: dapm: export a couple of functions
Date: Fri, 17 Sep 2021 17:36:52 +0300
Message-Id: <20210917143659.401102-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:8372:c747:541d:bbc9)
 by VI1P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 14:37:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b11c5c44-260d-4f52-91bb-08d979e8aa5d
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3506C0677CABE81F4960538CB8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IlEuaO/wfeBG715VOOoF+Fx5ua7nbg5Zbxkvn4WsuFH4tw5IFa50aEszM3aTd3M2YYJ3SFoVYpJec9b7Jz4kx5oMNzs9heS4mo2s5B86//lUtZDimmAlWX1YDHzW5DG64An9AEWa5xbGj3OiTFsg9VbGY3ryx3KdraytIdReXznyloyFi0UtWi9h8WCcptF+xFsn1SxV8hoiG4Kiee0HVlBB1Fk+k1lBj9sQ1m7eHHjtIoDWc6tvV2vCDOFIMpdBuSREf94iZ/jcoPIibrPuhprcGCz3dIHMtr3+Vu94ovCmPSlidhoDrGOoJrHIXACrWWjr8u3XGRaZB0lcM0BbNZnBUGLy1N4H+5n7uyXmFj23zXDQUlrpdZ6PLHi73847Nhggv4brPVwMK4jzGoEZs0cW7JMDjO9DKupt6gPWetR+cZMy/m5C4075Gfar/qvoET0c7sfcpJTJ8LpTeZil45dlbMWTkJyD7BA81sjfloRHFSh596cFfk3j1EZZqzre2sQdaa5grau+YkZJOtAIBPSxY8t8kdwh/4q3rP0y9rzZY0UWqtt5A+uplUlbk9xpQazP8ip09DyQjhTubooFvIVc+BO87L4mcIV0EnkfZkj30EC2ZZri3r597pWss/NotyOi4JMN7T3OPMYttPyCbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cEICiHH4U6b2IDlKoAegq9OHjPAi6OiLnJnzSOHScoeKG2dmbpuiHimA6Ai?=
 =?us-ascii?Q?sbqmR6VOrCmUQvh8BvVabmTJ3yphKfOpXKZ/S59rUOAb3s+09P8iAaoBuZQA?=
 =?us-ascii?Q?fNywwr09o2EPqhUjisvpaI8xxuWj3u+TtOHC3scBCmvoQLQuxhPOlvl5ElJ1?=
 =?us-ascii?Q?Lo9xe7/Ke+QwGBCQFRaNQGF0s33ZLfrtMO/qeKOYeFLZYDZvFnVXbMMcBn0s?=
 =?us-ascii?Q?adontbWIkSkdhyesWcbBkrVYwowwmbDrSB+7EC0oJ+xvV07UFQNNj7nZdb/j?=
 =?us-ascii?Q?Bqm2Ucecy1FAwEyjlb/XAWOruDle0GV+Eco0f5+gjSNw/wqXwTcD3flHZ7aC?=
 =?us-ascii?Q?b8wj+Yhl3Ohww5MwAlh8RF7KbCd6aZTtG0k2BdQcj5EatKJb1E7ZDkpZ+0Y+?=
 =?us-ascii?Q?L2rx8PRzmeS/Ho3fnupI7jcphNuacvAhR+9Wzb/oki0eyMJ135d2unZFlkFe?=
 =?us-ascii?Q?XzD7SIP3Lfp8nRiARBE3K5Jt4Y9ocWS7SWzXt5ozgmCBco4TuM0p3ycaVnqj?=
 =?us-ascii?Q?5HtwCpy144dI2tEIDepubmer5L1n+OSdWrznMxkj9sVIyET2JUUylA9N2Hak?=
 =?us-ascii?Q?8Z4gympA1jKNuvEVy5PJpKz0ODKS8yTp5K0eZk9n8u2WBa25MhWD4glm1ih5?=
 =?us-ascii?Q?KqIAywRKr3rGKSi7KHRx/uow/D5ImLy7sKX8z7WsBDk7gaPrFYLpIhsvZ8ZF?=
 =?us-ascii?Q?n0rK8fyuIYpz/DwvK81WKj/7B9zwh09Yof/8od4BlLI7Vix5KD9WtOIGvHhj?=
 =?us-ascii?Q?542kNAEGuzVac+kUVVzMKvJ3d7CwqfAEXP/4FZVG5nU9wzOrq5d5l893SLds?=
 =?us-ascii?Q?4l8sIl6Tyx6OvqreFLDXwdhTsz1EI2IskeUAsm5B6QJwX/ulFi78cFbZWGJE?=
 =?us-ascii?Q?ls61oQDkpu7HREjfsVZk96Zxq8ZKPGG4I/y9YcLO054pDSEyCR+VSXxZKR83?=
 =?us-ascii?Q?JhlYzIFAYgVOSqi4ETP+Ec3jmhsfRMPVCuUGHaYkLWZg0pY/2EU0TGa1qq7P?=
 =?us-ascii?Q?lu7WKkwXpDNu81I84xF2EBkgfIfcSQG0MPz4usG0iChXne+w0ETmKi8fgOqH?=
 =?us-ascii?Q?bTFXMBiLleXOAAbe/xxOQPFoxi0+LCyMDEUaLwViYj0BPZ3v6rT9z0sULCWI?=
 =?us-ascii?Q?KYjLtYEy3+TWP3B2RCmAB4TKlhfOS+Fkc4L9iJzrLkNoL7tJsA2cfgk0EIGy?=
 =?us-ascii?Q?ORyRTlTxg9dAdzkuJVcNb8MtfqdzH1/NcGV0u1zUdOna+gtslwQGvcrlFz8P?=
 =?us-ascii?Q?kSM0vXSGgpNMQvgxsjStGBubq1gjtyrGi+A4SGzjlMcoxGUT5m1OZ8KqHj+v?=
 =?us-ascii?Q?w0A0v9QjwpoPWN5hiKHETYZM6WMX4v2fDXr4rJuWLmyB8kkCysIWktPxihjH?=
 =?us-ascii?Q?iubFjYvk3NMbEMLx1mzinj6d9v5A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11c5c44-260d-4f52-91bb-08d979e8aa5d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:24.8927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN3OcuIksCBUmKr49ngq4EN75twbhBLSGz9AkVnBLuiyYQYTdiO/ggGmQ8amqxa563P2pKSQ1bHgHSmswnM8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3506
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Export a couple of DAPM functions that can be used by
ASoC drivers to determine connected widgets when a PCM
is started.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/soc-dpcm.h | 1 +
 sound/soc/soc-dapm.c     | 2 ++
 sound/soc/soc-pcm.c      | 4 ++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index e296a3949b18..bc7af90099a8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -159,6 +159,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream, int cmd);
 int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event);
+bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir);
 
 #define dpcm_be_dai_startup_rollback(fe, stream, last)	\
 						dpcm_be_dai_stop(fe, stream, 0, last)
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7b67f1e19ae9..44c4d105ffdb 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1331,11 +1331,13 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 
 	return paths;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_get_connected_widgets);
 
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list)
 {
 	dapm_widget_list_free(list);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_free_widgets);
 
 /*
  * Handler for regulator supply widget.
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 48f71bb81a2f..fc1854e3e43f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1262,8 +1262,7 @@ static int widget_in_list(struct snd_soc_dapm_widget_list *list,
 	return 0;
 }
 
-static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
-		enum snd_soc_dapm_direction dir)
+bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir)
 {
 	struct snd_soc_card *card = widget->dapm->card;
 	struct snd_soc_pcm_runtime *rtd;
@@ -1281,6 +1280,7 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 
 	return false;
 }
+EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
 
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list)
-- 
2.27.0

