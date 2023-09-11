Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E579B2F4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03546820;
	Tue, 12 Sep 2023 01:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03546820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476772;
	bh=NLRo6rUkv1Bvwc8IFlPV35lkzFdGrsohcMNLxSU+NXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wc/zrojal8taP0LMGTDEcKHNutbxt6qAVEVpoQhAsZ/rghlt6eCoz+wDcjMI7+Ayb
	 XgfIu/gjs09NOHmv/qKB5YPVv1raZTDKJEaJJ4v/6Lz0PXCiB84FAekV375RcMTLtp
	 gy4saMhwMOpdyfYYAxw+FzoiRJIsLhShWOfNhPH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E59CBF805F5; Tue, 12 Sep 2023 01:52:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F7EF8061A;
	Tue, 12 Sep 2023 01:52:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B62CAF8063A; Tue, 12 Sep 2023 01:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69E54F80687
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E54F80687
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YhPtSE99
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQaIndgVsSlB6SfOxx8FkRPUGR5bFpMXJBVaAgMQktx5zY2o7oV8hQy5P72ucEXoJqcKs3Rhwcu8xKWt9ZqRvKo2KIDiXcrL1kJVHf2RauwzSsSJ3+8EhHEt/wUV87rYWZQGDv+S/kUOCwwvE4+g7hkSElZHKR3/QO3cWhh0er5yNrwk8awEVXWbmTyyTmimPOY40U7tVJ4u/mQeOCYYyZyqtJs1qTUKR4P0pDx3OYGOkxU4ueWAcyr+lBcOjLeGWmQwcNG5SwB+WIj/04RC2NSSnxob0vKcRk+ly33/WEcui6UxupaAO1l39xJ/qUmW0TQ4pzmsvIV0KGXIoGbrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/M4y7AhyQ0+lSWx5futQMphbG3WbDCqmtxvawpaDAU=;
 b=iTAXVqJBgQZfQdfq2RAucn7+sjSxcdrqS/UKqKxkpLWzJvXZyklRxApo4k+ltwuRQjz3W5Fg0FQqXaUHCEH4UfK2fooGSpMr5D+YbDxY4LU0KUDNs/OjnnG+TzxxTx8MqYWuDP1nzTW7ct4ppqk5eoPIN/I4KvRJyvWIo9Z83BhS2e0UU0jW6ew5lPT/BBUfOUF0GwA0fjjUAqMtwPVrOAsutP7HpVdNXHUmongoTsmG+7M1Mwd71/8tod8kdLV5EliPyF5/S/FAE6XXLbE0tBRK83acLIPi4mfs+nCGgancZvyL+k6Ci4HAYwS9ayChnCXKxU8RCM5BvSUa+CumrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/M4y7AhyQ0+lSWx5futQMphbG3WbDCqmtxvawpaDAU=;
 b=YhPtSE99Yd6KXCKgCqtExatcJXnyARK2UAwFazNtDSiaLHnedj4f8VMxkqmXrAxZQbv0yRFdY8ukv9UTfeLuVvF1BDHVfM8wLzKdQl/TYU1aWo/kDwrTa6phZONlAj0/OF4j5z0qkE5tI+IdTkgzdxrRYGHbYAlBqeigXMehiwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:09 +0000
Message-ID: <87tts0p8ur.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 41/54] ASoC: sof: amd: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:08 +0000
X-ClientProxiedBy: TYAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:404:14::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbd4a87-c587-4382-dd35-08dbb321f895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	luBtFV1cb1TWV9yw4w7UCqMVwKi9alcP8feRsjAoQJ/86CntIk9I7YagBf/XAuq/FQW41tqNye/Q1jBzUzGsGr5yfx43mTPdyRkr6nNlbmJz2tYNJoZyWrricHJdbOOpSsC52UURpdV2m1Yx3G9dd89tKAD94Q5bd8ywMgR6faDsrwPdVJBV90vGTemtjuAL9gGWmOElVdfFs9ebHBTSR2OIzQ2MZLqLl2tCrgrYOI1PGU9OBZ1MzKKG9jt2hxYfoSEtHq7VxX/Ej3qUS2VQfH+zzgkxAy3dHG0/MdLobW3xBbsIxGNf758Y67ghOUqUW2SR74u2//keKj70BhAtYQmm6NOTsbcMZwjoR7ZyqRCUrOk/WWyHE18u56cy1vxTc4UmnslwHXzmg4Raij4GY/rbgJQJippchryaJSkY8CivX/10lookFPwjFKGIGaPA7WhCBX7JIpIH9Jgp7b/LSFnLaIX02LciuMkbexf9sOKegsnSblzW05BEZuJBLIQs94zoPTYtYhOqScM8TVsyAGjOLDAo7nTb4rN6qR8AN+Zm0ZABySduoQrXnmu4xl7NF01i+u9DFtcz2Qr4XmfjkOBwY5r5DZhmxqEKo7kc0gSnz8kL0njub+f0RK5nLzgoNYgdpGufILF78Lrc+Y1njZt+m1Ufrxv/q4ECFVOaRs0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(921005)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(4744005)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aA/A9wiVenF+cC+YgjxUEoXkKZYrLQVia+Jd+ka6BzGii4WRyluexc55Vom7?=
 =?us-ascii?Q?ARyU8XcTuqeiJ+5Hg0vAYSeBUtjTPGLJ6um9VIEOWK3Hp8Qbsyp8/jOYOqJ4?=
 =?us-ascii?Q?FkUI+eawtB1p+ST2CLGXg2yenWB8XQITXEBlkzgipGJZfLimO44mt1xXGqlz?=
 =?us-ascii?Q?A4x8IbP7L96OM/3t9IkZqM2DXmq2+RSuB7PCgowYJ0C5yZQInv+NpFoiP1Ay?=
 =?us-ascii?Q?CZsF4ZI20E1ZAzzLqF+eOxODop7DKD5FkxvgFXGrNwHCDVoxRNhRxp9+hiY7?=
 =?us-ascii?Q?Ff5IKuJKyxaRXd+0nNQPv4pooa2trtxLwrOGfQSp/cSKaq+TQci37QoUFjUn?=
 =?us-ascii?Q?MMitVcNT0Uiy5t7mBlhDUYe3mRxtMsEzBvHFK4jkJNhEmBfnEp+DfXJ/zgHD?=
 =?us-ascii?Q?hTK6uwlSnz4qBAEwnalB1MghSD3ASLpz6jp8+Wbn+vLgOgKoW40ya+lTo5xa?=
 =?us-ascii?Q?GlVImxTEU6u+JtiPoH1uLd7PN0/b0MhU+PfMa4nNT/R7+4EX6wLmX7Vr5+bQ?=
 =?us-ascii?Q?cniuIeJgvKVilvmaS2Zcpx+lmADeRKgjRXN64A+Ue1NzsfHP4Ka9JPiZPa+j?=
 =?us-ascii?Q?hLRROPUoSGbS+nf/WB7Rxc6dO1FThPyB3p83b+OnNY/DuwnJH9z6FtosanY4?=
 =?us-ascii?Q?fW43Ij+EJnu2ADZZDT05VcX9aHbmlL7TP75hjJUoDXeI6onEUQzOxEgxObsw?=
 =?us-ascii?Q?ffsYxhIzFdtOH8mZLJxX9mxhajjko0XLIoan299gKPrSHAtx8p1SOmCCO/o+?=
 =?us-ascii?Q?fq0b3a0cuL4fNPfz/NMK3g1roWlqjWmPf05IUYDxWdTn/EgvTY+24UrNohqw?=
 =?us-ascii?Q?tOesl628E8YjD/buXTBP1g8Hp3jpGHhNrfQUvwPKRJYfSt9UCDap+sOnszE2?=
 =?us-ascii?Q?s6ODuLSy5dkWpLbkOcrTRhViR8uI7kzz9/lSOFmYNwgEhUB5zAKqHpaVybPn?=
 =?us-ascii?Q?aWwDQPpP1pwI/JMn3fnrS9Sg+HubJH8fSejKuvLmduxpngcRBvMwwVPFYK6T?=
 =?us-ascii?Q?0YSYNvVmmS3AW4Io2oCzj0RffKzaRGMmpeG/0ShxYR5v4qgmAqvxuEY37v+a?=
 =?us-ascii?Q?TJCNCglULDU0ocrgBIMDMJloQJVQMtwwiMEqhOok5Scc91UtBvzswGo5VOhV?=
 =?us-ascii?Q?EriuJWURfMdvUCellfk6QIKAxKRmeAI6zC04V7mJCJy79SYHwkTGQtb1BnQY?=
 =?us-ascii?Q?/PEaM9fo0FDHHEYSp46jzDIvznYlSUJds/3TH3WBA6/zCcpBcQ5qALXx65B9?=
 =?us-ascii?Q?lSstM7YvdUmrQ9c2m6v5W3eLbr4M2Id4TmdqimDYiG6kQYeCXgcE5fL0aPW5?=
 =?us-ascii?Q?12XC8jLIpNFIXVACp3KHCyOYfDj4l8F60Ss+xrEk76g9Vn0USXMr4Aqr9Sbn?=
 =?us-ascii?Q?/hPP6x0Kvpfxt9Z9gNaNNqxqESCJN1gbssaYlrdjTDhSEkUOccAtpW73niSR?=
 =?us-ascii?Q?Es0+se5ansRSiwWGyxsiwOMsPh1ytCDwvOJnrYZWp8G0XS+7vezqt+4yEs7o?=
 =?us-ascii?Q?/ds2Z/F6wXr+0YHA+KaBPJDrqnFqMnpaUgyk6oxkppPqwmXFKxzQ/UJ+QdSZ?=
 =?us-ascii?Q?3DEAmO9kPa/AlKAb6I9vNMGXBdVy+OHLXa3J2iIGL1a7L68KfEa3DaXhAkMx?=
 =?us-ascii?Q?9Z7mLhLwd85Yc06IUBv3MNM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bbd4a87-c587-4382-dd35-08dbb321f895
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:08.9829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5ExkKM8O6AyuV6RIx2zPCdXt/vHrWfKpc61NPrhkCruRcnetl8H4FxoSfRQJOHFv0a8cakBCa1R65UFjNUbivTiBoF0ALRGTczhVAttExjNpUK9Zqtf+2MVxBcVwBy89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: 5LCGFHTB5KV5ILF7L5FDNHYGVR47RCBA
X-Message-ID-Hash: 5LCGFHTB5KV5ILF7L5FDNHYGVR47RCBA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LCGFHTB5KV5ILF7L5FDNHYGVR47RCBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/amd/acp-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
index 0828245bbb997..cee0b11548742 100644
--- a/sound/soc/sof/amd/acp-pcm.c
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -89,7 +89,7 @@ EXPORT_SYMBOL_NS(acp_pcm_close, SND_SOC_SOF_AMD_COMMON);
 snd_pcm_uframes_t acp_pcm_pointer(struct snd_sof_dev *sdev,
 				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *scomp = sdev->component;
 	struct snd_sof_pcm_stream *stream;
 	struct sof_ipc_stream_posn posn;
-- 
2.25.1

