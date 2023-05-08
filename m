Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD356FBBA1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAEF1198;
	Tue,  9 May 2023 01:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAEF1198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590037;
	bh=SXjJjElwzg3jRLdkNOevBK3f3rHsMuqgQXgfXyQhd58=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uiZpHqAfTxCPnSUPTg5IPf/vZTRdQy8AHbDC9ZPmp/wBfpFsDG5DCznZXPcCY8GrB
	 QADo8ZsipFhrqIPizRl55FQN7e5pPv2SfGrIdUflNzWbK89oIiqeCt8aVMJRMzm+Md
	 wLhcWR92S061JJ045M9M3jjfsMXTS1e3t966RjDQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B3D8F80310;
	Tue,  9 May 2023 01:52:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2345F80217; Tue,  9 May 2023 01:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD465F8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD465F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OO8XdV77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gERbPz/D6VJ8E/QPrY8ub4POtfrKyZG+53nBqLzyoTR7GCOHp2/8Ci+N9M8UWoPJB87+0GjRrfH1wwz4+LqPwAHwCvqQGT/B1au4Q39RNBsfBl7hMjo3m1FH9/eYLKyYk7zXwv2znulY70aLrzP9E3R/6n37LKmGrimo5gIV9IZxBfFOKG8R3p835y77sqOy8J3p846hJH9isNm/W8FC5wOoG0kaFRXllcW0YQO/75fUtoLaJ5OkmgG1yKhiDDdyBO709zSvaaZOqu7y3Q+OzpCUSiAjx+g56qdsiHc5k4aB3hDBDT6ohM6TPlwC4d//GIPOyj/vQF154D+4nLqvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD8tmtQbf7+Qhe0OrY/P8Xoy8+nvxwkj7ybhU/6O1EY=;
 b=CnegF5A2xdCNtrk2jCVdM8kbJ+Ljy1H4GC9WNlyDOY1xkq7QfTHer8XQMb+7VFsP8EXhJjKjDth5+F8h/TuEiSJpX0/po2g4MHeQHJmTHujVJMFXGo+48487yo89/NP+aWZ6syXB4ZeiSOOJc0Sft+ZWqcFbBj9Xkz1P2NssRkb7Y+tRp8JchhaUhPD8JOvyxc6LlzwSobKOdWeNvJTWuPEi+z3bS79lh90cagEnEWKFGmCVA0Asv3TEMN1LsB+epuAcq3nk/TJXkY4lfqc2KJGZQEbyVhq+gf5xSUhwBv5lGvrgjHwlUXsQrbvb5gLYngr2imrG6ALXfadGbX9tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD8tmtQbf7+Qhe0OrY/P8Xoy8+nvxwkj7ybhU/6O1EY=;
 b=OO8XdV77tloHFLvSoSVCw8vsXK49dCQDYRkWUkvlh6i685T2BQFasLQTkfu6ktMKfbDIjEvALS9uWaCrkBle7s+B0Kaia7q8sw/IajgQv/GG0VbGeP9UFUtFCR97TfgwzLFDm21XnJ3FV/JZRzw3uGrHdf+mtRDabL0iFeVNbOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:08 +0000
Message-ID: <873546l6u0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: [RESEND][PATCH v2 09/13] ASoC: intel: avs: use asoc_dummy_dlc
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:07 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4bfe52-3c05-4c4b-7305-08db501f3bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kdnViyu/NUBFg9ecvgvTYaRGE117XJZeEkxfXgTTPCSIZ9Se/Z+68XygAF09cGJQWddKMl1tlbBf7sZYvWWpc2pqu7uf/u4b229j8Ca9ICaNeZh8P0YKF40BoeWIa2gv0IVUWWZyLnBRbQNQtrmQQHwNDcBx0BseKvWwRA8FwFSTV9elq0zDAnvSXZ1Ch55BAKSTgnz76BzNtSjGcg5vDmKOHcIE7cT/owuYtS7+g4UKYBfUDz4fsXiL8sQGXt0/fhTbFurR9oP7mynOmzXEOat3H4ZoLRyNra5Tac6TX8VNTRbgFwIYPZd9AkcrP//sS1IFd/Zi+hntRMc0bAyiDmEMNkJ2JXVFnRWe1Wb9iQt1sXl6RpCIDUr1Z2tfjOHL4J20Bwf3bjej+fqemjfJYTx8xNFiiGqZRYUZgz6lI6aNfWyDgwLITz6XQGG/ZoNG959Eh6v5NerJqhBlb7ljqX9Zo2s2QKDdoFkD0660paL2BlfGXogIaMHb4nBz2kfKA1BXDLbLsIZtNNOaPJNKvNc7YvLaO8MCl2Kr+0djh4iIO7Y4l104d8+JOvk3u5yF9F3Hh619frmfTH1yM804dPXufjfFH7qzgIaJAfdnsgwaxeHQ25x5Tr6i2Ed3rZqdsHPQ/D3mckvOXVCKxCHDIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(7416002)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(921005)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nNLuNgmTs4A5hKcQTIphwqZzcIUlVDdmKX+lWMEPdZzm2HEgsQXP5u8rRAEd?=
 =?us-ascii?Q?ydDy6GQe97tE0YKQBDS6Driw6CnQZCBe/5OPRKv6alImg4nZzyVCCVrPLrHH?=
 =?us-ascii?Q?qfdhMCQcIgqSwufAeNdqx94ipd2g4ic54uUyzPn0TkEw1M424REiHTCfyyfn?=
 =?us-ascii?Q?SrKMfzx3TyuNnTFVw22syHJSzQsWXab65CpcYAYcMP061MkNw8jcUy8whTFK?=
 =?us-ascii?Q?o3my0wFFAD/UocpBbPw0wd/Kq6L52ZAzIma5oQO9em5xBeM35TSwsRxn5J/z?=
 =?us-ascii?Q?T94PIVO8QHA9dM6wTzx4wWWRV4W4D0C5jxVQbvJd6GwZNqzFhhJQQog+vcMW?=
 =?us-ascii?Q?WkgatDhniH6+B8uw6YeV0IBJ7vr2yjjdWYPi0JTsu8B8Dxl6Ul+2LSEzJAq3?=
 =?us-ascii?Q?+UvZZ1vN/WCxajoYd9mmZw6oPYJHMQmXAqNPkKvOY+hheQZMpLaEXdK3rXy5?=
 =?us-ascii?Q?sk5QEWICcrKn1WlVF+deWXsaYaKbkTCGdjiHt/Plmt9IQBQtUMpAmYCFwUe+?=
 =?us-ascii?Q?np0NsWvYhhUACFCD1GkyeW+FGK2dIjXvDXJCMGvsK4HgdQDJ0jkAImoj+dY4?=
 =?us-ascii?Q?lUjlyAuNZQuCHHpOXS/e5gvmUl9Jku2gR9jidiJjqFsr2q3ZXZhzKmTdd7hH?=
 =?us-ascii?Q?9Izhq+avG46Cl95l1ESnFmbNEcKa7aA2vdW41nQQ0+cyodL9053cJ3P3v4nR?=
 =?us-ascii?Q?Bo1jL6ndgwPJT3AhjeaEvovF/6q9EkBJ8Gsqlruc6HYtGx9JJNiB71Wc5TVs?=
 =?us-ascii?Q?JeJ59TaVTtiPM+cUzfDs8Fx4nto3CN6iXCRIaXJq0y4YCiaIupy2HcyYWJzD?=
 =?us-ascii?Q?2UetCBzJTQhU8s/aV9OtfjFGRrSxFpVgTnbpe4arG1qnQlyN7XBGMOrfkZGI?=
 =?us-ascii?Q?8IHKRm5Whr6ILyO42B4oSbWc14ElXdWN9jTQdLfFU/muut2rVbzM0iwisxbQ?=
 =?us-ascii?Q?EM6bP+B5UN6MquiosZ62fJlyWhSNViSSBhywdWFMDJMvnndlah7R8C+o7Rdi?=
 =?us-ascii?Q?9japATlOHo7YJHOpUmy9lo4xrFo3+B0q56W1kfcpcmY5h+8LWC96ehqFvOgz?=
 =?us-ascii?Q?m+xvg9m53MvCBEba3TnG/Fdo7TNGGlmNNzcLV7IuTx7YHUmeV1HtI7DbU7VQ?=
 =?us-ascii?Q?UvBcZxMQC+wS+vsoH5giMSq01JtBUIrXWorWYio9l9zrRNUt8MJjPwp/gHsn?=
 =?us-ascii?Q?U70IEmEIsdkVsExGJULb6qm49ZyxeQ4J+sc9lcOElQ2O4hDIguOrhC3NKuxT?=
 =?us-ascii?Q?23+/XShRU8IelVC6+pfY4jRnnuoTqwLnZ+5oNYfu8EYV7LExtAE4FNb+IiKc?=
 =?us-ascii?Q?PGJhNb1LTBbrF9htLPOlsE5wbZv+As21NuFCJ1DnA7ctmarIPxdIG/NT1eE7?=
 =?us-ascii?Q?YZhqi2D6vmyb4cJx/gEJjV0NQPY4jCW3wFhTcJn/N46ZujPeY3i7JdQ/K/kb?=
 =?us-ascii?Q?92FHAgQS6AiSGM7+6p7h0ZhQW+mz5hk8Xq5Rh5s6TI4CQfNDq5k80RUUR0Kk?=
 =?us-ascii?Q?bfopJCa5gEbgS5zg+Y6iaP9q+r1o8tqKdR0I6MFWbj7FMt05W1uESAilTGIG?=
 =?us-ascii?Q?UjJRf2oYknOTX5YLyRXKOzjI8EhQZaCtgNtrdfpYmu9iDIZA+YYoDGjVWZTV?=
 =?us-ascii?Q?QBdONowTdsUlOVnDnGS/yPM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d4bfe52-3c05-4c4b-7305-08db501f3bdc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:08.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mHEV+zyhBaFaRDTxnXyw+9VGJRmUVrwxKRBqpyDjaHRE2+9Yz8zoca6pnYB+VV3lRyf3FUckABhJRvuWaLrt9w3DJ73BYLf2RwvIX/qxj6igsAOZ53/4/usN9Qk1rAEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: 3VKVH2VK44O7LMOJAFD2PYRRLV7U3N26
X-Message-ID-Hash: 3VKVH2VK44O7LMOJAFD2PYRRLV7U3N26
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VKVH2VK44O7LMOJAFD2PYRRLV7U3N26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 8f0fd87bc866..bc3065c6ceda 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -28,13 +28,11 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
-	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
-	if (!dl->name || !dl->cpus || !dl->codecs)
+	if (!dl->name || !dl->cpus)
 		return -ENOMEM;
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
-	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy-dai");
+	dl->codecs = &asoc_dummy_dlc;
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

