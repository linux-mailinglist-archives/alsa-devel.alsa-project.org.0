Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6F6EC3A6
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC49EA0;
	Mon, 24 Apr 2023 04:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC49EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303842;
	bh=780G7ESiekjHKthaV0RaCN9fDq9yD5vJz3XKwElQCro=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IpKMYC/ucoj5qPohDokyABsG27RDwkpOFSE+LCFVI7+m5gi+9XFfUwTDSt4io53iq
	 6HWZgR+e1wHoO5QYi3jKjqpPcpwGLlBDJtF+PtBZ7olhh43SEMYjQoZoX3f+fNCqIh
	 rOrJc9b/UKWhRs3iGRjV0HYKT5/PlBPHBUhtSoOg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9B9F80534;
	Mon, 24 Apr 2023 04:36:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 398C7F80534; Mon, 24 Apr 2023 04:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 831CAF80236;
	Mon, 24 Apr 2023 04:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 831CAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R5OEKytt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8tjdJOxGKHesND92FwFJuEK/3zOawaVmYQRq1SLUiUrG2Dt19MIEBxWsLLhOrHR+EIjgmhlxwsTBrE29BOHSox2EgUbNMX6AVhbl2LsZO/H2FHfBBBc2DI6vqqSb4oUfwnvbLdL7CIu8N9dOzj6lOA9mHlqHxA9i2Gi1SKJmIyv7iIfM2fNUnqLu3a8U4j/j+ZOlL91iio1TJznoi8uJy6hnqp1sqasdNynz61rH3+hAUkDCB8T6RwcxmQ+7OCW3+fIXOW/d7t5joV8Lzs28uuCL29SBH8SPrDalcN0w2rb9okN/7aEUcQH7xGcXfvKVdLRDlsvj+d0p7hvPlzpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfLddfm0wggOfLdbsJx0edpY3rHEFPr8cwA4bdl8rvs=;
 b=Q1GpxIxrBXvgUd5G0fuAKJUiMwFdjI4O2qbHSF2rNLvCV48FGlJfyIjXXo1fWhybOJ2cjERftc/QOxgxVXMPcogf6fBKctkGP4AQJATQAatbVjuJEoMMFiMn/dDA2G15zr69MDGI0BszXEM4kiJj+YpdMyp2Ve0c/VxFC+Wgs85qjS91dslHiZE7AP+MuAacdh/5Z7/03ZE3z1eV9UlZDCkL7a9iit8KOCH7SVdoxXUueL6BXbByoFrlvHz+R4VgJfvKoTLBFbZZCXVcwFs3Y13cc6mQzzufEv1xL7fW+2HTMEGLsTmEjQZ5xoa+WUi0zE3kAffPIgWgwJ91Ia+98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfLddfm0wggOfLdbsJx0edpY3rHEFPr8cwA4bdl8rvs=;
 b=R5OEKytt6xGd3u7gdTA7n3x6sG/w4sOokunidZLASmEXIoGCy1EGaxR0mhF5a2WjBYWh2OLn6rngPptdIj9/eXEtt77ONLUS87rAVyF99cPbHcsG3mHxlBc6YBWrSK+7LnTfcpnNDxADr6LUb3o81H0h/5Mgi5RJ6a2d8uQIVOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:20 +0000
Message-ID: <877cu20zx8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/13] ASoC: sof: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:36:19 +0000
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ad83e3-e95c-4863-3631-08db446cafc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j+fWMiS2J6gSEhoTPy22YoeIOZWbEsG7/H2KblurNMNgCCQsQ68YAQ6p9IpqJkvyS0dUok77Ry2SzgbUSuACIsV/qxJN+jPRrbzkQ+D+gR4gwTRYgYwA0LAkcE1lYppzlNAecvmuAVp+3RTHvgQTHVHIXkRdkKZk0ZyqbB7+ucx+u/jzQE1b2ke1LXoOFWBW1g/fr9AC2IXGmQS7Cl03+JMpzcSDDIIN1pNbd/btZjY62xt1LH10q4C39dGSQJD4/SXPvtzGIQTqrw2wVV7bM1v9zcuke7j8xFLZbBKPTUGD8IELD06wPnhd4gXXU4a+nzVPqisHt369r6py1uhqchwgNlyIsXezyQRYGUrHqx3FuU2qVXdixz+fXM6lKSxx7qgKFpFmHOhpDsNJxm7yXOmC7Il+iq8sWR0Roo+HWq3gmkxRR8TPPYnzz7DevJfC7ukXzepp2d/o6pXLI5fpGNK2a1vgf2iiVQ4czhBA7gkqNyLnaJ0kasVZ8v/UUAigVHM4LJIRhWw+Df6m2ngReHfRUVrmEQGuiDIE2IyokDZZ7W+1YVhZkUyYl/uSR/RINYWLGcEWCEO1Micx9WU/N4BXIEarq7TWG5ubgK9v153GivKR9FI6HSGJ5K/t8uOk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(7416002)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jDwvXP6ycKML84x/a5VllTe6ymAVHT1u2HFrJixZ138rfl++kMFXGo3TSGdo?=
 =?us-ascii?Q?W0f7n70+fa0dEbqeKFUyYP0PV2/BhyvXhc9YKOMBtFzQzlYUy7E6N0X6P8uR?=
 =?us-ascii?Q?RdhU/TrHprHh71L+OKzTphafg3sNN3Dz09QzoBhzITw8w7SxXJkeBtQWtg9+?=
 =?us-ascii?Q?6rWpeQeLTPP51Efbddlopq/E8ob/ijy5kmKNdM7tw0TMYTQP77GpEabLwVn5?=
 =?us-ascii?Q?M9KueScPCsdt7Yp94FxmbuuK/cxJXqGvOI0ES2PldSOTeG/Vq3Jbc47Z6BGR?=
 =?us-ascii?Q?YfJtuj5vqYt9bJnNxzuwwIFJU3hp4Z2LN2YpMoCRrumUV6TXMQJJkbkgdFo2?=
 =?us-ascii?Q?xhcGaMo+CGupPi6A5Rs0yWuafBAY2aCabMZNHepER5DrzadbLp1yGIVgT1mR?=
 =?us-ascii?Q?hg9bhP0U/Yc1UZ2R/unpXMOjgtKQHKTSx2gjDFRILfziRbZ1iDXLS7grYn0K?=
 =?us-ascii?Q?blZwicdCAHlcUUlD/+nb73b9rhqtR4/9YfOGYS3erFXl4DbEo69l/dGOyh3b?=
 =?us-ascii?Q?ilPJtiDmWzww56UVad8If75aLRfjne3ZHmpYpHXLjdxw3uctJr4dK+nQoL9B?=
 =?us-ascii?Q?uSKejC301fJ3YyX0kx32eCcb0JWWglZCUCA6a3WneqvXBOvSbH3SuJ3WYYoj?=
 =?us-ascii?Q?xNIl42PkHF7mz1dEwBaBHYwFkigv3nzRh+FBzq3BXfKpMkK/hXyz/RAxRXqY?=
 =?us-ascii?Q?F3R5R93YSn5z1e/1Hs2wgah1/CVA8HMghDL5ZBVYBHzZi2n05bx+hXIosY6a?=
 =?us-ascii?Q?uOMtkLC9UkXEZkrY4xXjuMv9pOtmIislU4nVwIPf5OfbIn63DAngFUeq3E0x?=
 =?us-ascii?Q?np1dyRBxzM1Po7cZlMm7dgWqiqGEahfxr3HBYpu/LXfCpvgR6LPoWUPcIHwB?=
 =?us-ascii?Q?DEWhyccT+n+BZxy0g+iG8r/emyL8Ge7CKA8GBQopmg0Yl5LDAuIsFDtjRRio?=
 =?us-ascii?Q?7anGMh4srtz061SKXLK4mvRBHQ3FYfV8y1YtcQ1Ipupyk9id5U8ZTSUr1zwC?=
 =?us-ascii?Q?MTP1sopc8idoWbODP2ub4+OCkIUInItzKaRZ1GGEWTxcFRZoz7czr+dxEibW?=
 =?us-ascii?Q?cvWTL77wmVxOJP5VPGyxBFfzMfZAbc02+RWBU+hOAj7JXq5nw0NkMUDpOjEf?=
 =?us-ascii?Q?sEcEzrw4/HOyqgYeSUJvyTCfQ9y0MQskgLslGdEHf013jyEqFadGeuXzf5t4?=
 =?us-ascii?Q?E2mKMhwLNY1kCp2AtFYNs9yNAVVPkJdq2EliJp7E5iJCtiQRh/rI/OL4VjYB?=
 =?us-ascii?Q?qAOmEcT9WGmuc0q+q/8kG09w1atbXOyFG8TVmTrEQD/PdHdAaO5ZEFVbKBZV?=
 =?us-ascii?Q?c3eWnGNzvLGjWZyVO63Ct3tsVqZxbW95VkAgLXbKdgCUIMQvUhY95Vl53xRD?=
 =?us-ascii?Q?aXctOcuaPRXacIZFsw9KDwab89f+KDiVnJwN7QrkHnoDCK7Z1yJkGebjiLeU?=
 =?us-ascii?Q?5sod0ynTB9f9x2DXadmalVesMBt5Xf1h7YXt+BtQ9gxHhGiE+5BDpdnPjL+p?=
 =?us-ascii?Q?h32rAFTo2R2WZ06k+Te+Kv/I0oJ6pAnP3l98tufVkdm8yKh8UQxpVXVs3Mcy?=
 =?us-ascii?Q?p7xEl4r1mq4ZKV+aeIC7cw4zLeHPpuneJdCxyYMXywAfdgc5I2f7ITg10+Sg?=
 =?us-ascii?Q?MOCXpvtD8HqbJpO9Yi9hrB0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35ad83e3-e95c-4863-3631-08db446cafc9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:20.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g6AWZs763qS8zStvdqpwBBCV7ZTPhNRqu4sCDTpmcbso0zJEnIotmDjgAYBB7//S7HWpC2EVgQH7FFh6QdpuCW0YdmKHIpJg51eeOEnx+swPtRqI+J1B0OYiriuZjGJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
Message-ID-Hash: 6ZT62VK7JVDRZGM5JGZGS5REEI3XSHPP
X-Message-ID-Hash: 6ZT62VK7JVDRZGM5JGZGS5REEI3XSHPP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZT62VK7JVDRZGM5JGZGS5REEI3XSHPP/>
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
 sound/soc/sof/nocodec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b13bfdeb2b70..7c5bb9badb6c 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -32,7 +32,7 @@ static int sof_nocodec_bes_setup(struct device *dev,
 
 	/* set up BE dai_links */
 	for (i = 0; i < link_num; i++) {
-		dlc = devm_kcalloc(dev, 3, sizeof(*dlc), GFP_KERNEL);
+		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -44,8 +44,8 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].stream_name = links[i].name;
 
 		links[i].cpus = &dlc[0];
-		links[i].codecs = &dlc[1];
-		links[i].platforms = &dlc[2];
+		links[i].codecs = &asoc_dummy_dlc;
+		links[i].platforms = &dlc[1];
 
 		links[i].num_cpus = 1;
 		links[i].num_codecs = 1;
@@ -55,8 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		links[i].codecs->dai_name = "snd-soc-dummy-dai";
-		links[i].codecs->name = "snd-soc-dummy";
 		if (drv[i].playback.channels_min)
 			links[i].dpcm_playback = 1;
 		if (drv[i].capture.channels_min)
-- 
2.25.1

