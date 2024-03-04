Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06086FAAF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 08:25:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DCE847;
	Mon,  4 Mar 2024 08:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DCE847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709537105;
	bh=Gj2lRboKxBVdvixZvNzJ7QK/VGYERNSF4gHnW2JKNks=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F2X1W5kSLVP8D5qU3F9UEXaIyH8ZMWxkfNGE3CM06nUFfIMVMXkBf6OPZXO6lFgk7
	 RgydqL6RJxevly31Fy86Uk3xNZiOu7quVjZ1OKJSPT/RKSBNRCRSwN5CmBHI54EWrn
	 nUgGgrzENpgJ4123yXBfmnZxV2K08a9NPgxIfQEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E59DF8058C; Mon,  4 Mar 2024 08:24:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B67F8058C;
	Mon,  4 Mar 2024 08:24:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A67D4F8024E; Mon,  4 Mar 2024 08:22:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1CFAF80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 08:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CFAF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=YNy33y7L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4aKZVWkEQD9X9rmta8e9f9jnmAY5qkOwtL62uRAyzDnzDCc3G8PAs13qTnWZ3IIoIv5xsmZRaZ0ifIKKYlMazqAo0Uf90Q/ORUP5RlFNjYPFt3RdKFDAVOF4d8PM0bUpqfgE/N9uWSScDg1LYFI6ZyEQXG/tDEsTdHJ27IcIhyRvXq678qjNlncIAuB4HRF/gUQ5mzawnxkKBhKlxpZ/kmqavMcMTos8rtaxtHO1wJPzBufAsapCpW7WRm6orB5pE8M/yjIwxZ6uTHzDQRrqQHtgs0HlVK1sd2yv6lrr8F93MDatw5hCB2utc0oQ2NniJYJrOrpF1YZz6LQLG9E/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxbA7LKAydOccFW7Qng4AYrX+8yhLCrGfnXumGJeP8U=;
 b=flsvqEhIts4qf4UrM9FVtu7FOs/wgGv9NYhllrLOlvl4BQkjbMeWoDNP7chPN+6mFUvexf/E6Pn4gPoG8aatEWR3iW+io1HNkDOqIBDR3WFA7yQcZ5dV9oHFDCzDheNdnR+HUt01fE0vk0paHvqH78Qj2ek1MZOSA5DGknNdYYaPhj4I+XP9Rem3onEvGAMRCOnKYtmP8L7Y/VzEPz7xELKlqCOOV2x8IKAp253VGRpNDny9l7QgtyhyDLI248LIvzaZumhinSHT182/+t6KNHKqgIbzDGe2b6CvWHKzkNeuhJ5uErYzUVC4DaDuK9bugPBwA9GPDWd4+5xcRlDyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxbA7LKAydOccFW7Qng4AYrX+8yhLCrGfnXumGJeP8U=;
 b=YNy33y7LGcB/q+EyoXn3ppiX3MZMsVM0/5x4JPs+bXJV5y96fl523lAP5lqNNxV5roi8WaqJTEVdTgtVd2qAIYVnh7K5+Ly0Ypw0O2qrNw97fY2ag4PllriVvX9ygAkEEJo3Xuqe30TtLUdxjacdRV6eWAzJGUbeMKMctcMxo7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Mon, 4 Mar
 2024 07:22:30 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 07:22:30 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v3] ASoC: soc-core.c: Prefer to return dai->driver->name in
 snd_soc_dai_name_get()
Date: Mon,  4 Mar 2024 16:21:28 +0900
Message-ID: <20240304072128.2845432-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: d804e1f3-0176-4955-8241-08dc3c1bda2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1WgFbi0bLA9bm3MbpgFdeO/MTLjPElioZbQv5yorfhr4D48yOrYIJO51y5zgzYbWZB06YyjYSJyuh9Z7euXohbsnUv7/ioKgYraWuN99cbSPbTS0msSSmJR1wTD3NgDDMSD9o1wjU0y/R2qvJ+NKGMEDZr+ImC/xllZYSoqiym9VS5p2uGDSebftAnn3aC02tAuhEiIr+zk+lkbWyFWi+l0+Fb4HJSlNaNTz3zcZQUJBo1JXw9EdWe87abHza9FM+YjqrT15dk9VqCFHd1JvKy8Bex6FpJ0GBpCpEvt1IgctRHGB/3zMxPzUvDFytAdZeyMjNJtOOZJVOhAxi/plllluM5bCFUpyb9wQkgmgufnfCtkO66of1woS7GThUWfpH64re/t1weUnhKUh3dPpkYzoog3pL/Z3FySLkagbIUMa3HhXaMi2Lmujjc0GC2UPuYKUI1dTi13Hi6ZixeAsuygWx5Z5Nc98E7QMuMvdZ/d16r4106x+N0qs+4GKsigkFOGGKkn6GG6EcX2/RWJ5EGQTuKw36zhsW6G7dCAd8kKUK+dvtD+8gWfsA9UcSMZALob0ZLphQAiiq8N+jArxgPQy7kTtEu0Lz5Y5fIldTm6rm5F/qlU7YIjZ8L74lWfK2hGJzP4eQDma7JZ77DQIoIKKoazBvueLhLOSiyKWbBI9OqEBqHs3UXXYLIiOODKi8DRTPeOTQwWVQbkc52cs0L+k8hd+fTyfJcN9dU+FtIY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uizufDMDJAyGuauU8DFOtC86hKwju//grgkCDTPx/E3Nbk4ezfLVPi51rKy9?=
 =?us-ascii?Q?vDRG58X0VA1xmNMz9rPSD/P4ml8Y2ktEI5rwa+argI4DTIB2GH2iQZ5Csh44?=
 =?us-ascii?Q?efYPR/rMeehPDiJlp72NZE6SCPg04V70q30/SNcnwzF5CvYnEnJeY9KlYatC?=
 =?us-ascii?Q?s8Ly45IbutSy1b7ZIf1UYBHNzVgZHRnbyVIfCpPql9WtTaCuIcf3YsLfsvSQ?=
 =?us-ascii?Q?7+TSo96W6aNZga2dnbdf68VutuSdja9xoj2hs87o1uCnUaiQEV8vTmqi/h0c?=
 =?us-ascii?Q?V9t3+dveOdXwIigHonkuwn4M401gqKqxNmdYwqGL+cTbWBZLQwbk05Sx1ZX0?=
 =?us-ascii?Q?k2NcMOpvC5FTow58XKpnpO9bJLkMlqbSf+vI0IM42Sn5/XjJ7mQIDysOt+Mh?=
 =?us-ascii?Q?1x7jRV3OmoxYNti4NcvYfSgcc0xH4BSR4d2K/BnRR12Xi0kFMbtvwx5wIKcU?=
 =?us-ascii?Q?iWcmgXM9/sL1TXq0QoShneUMXKhgJ4zzNjEYlr5Jp9TE3h86rgQypjtC5oSe?=
 =?us-ascii?Q?ETLHED8sdsNx1eEJntIZPqwXdlR5LbPgmnrqLCcbxCY18AZPGDJLiMYp8T/O?=
 =?us-ascii?Q?/tr9JoWCt2Z/aNb5oDgtWRm4oDBB6I7AGdwXOlcecBk+xcgrw7RCAjc++byB?=
 =?us-ascii?Q?tE8td2WZtliblh33IjTbnInZVA5ul5X1zQEfxd63VkVBM1jAO1QADKhd6vqr?=
 =?us-ascii?Q?KFqTvUmDWFtDb1lHsV8T7sPdS2Gxe57c7QJY9mhsNN077Ift3B1HOy1pvxvv?=
 =?us-ascii?Q?3zHryE3oMC5+PpLvDIbAjqbFJCLH7iNIswduWWrWZJG8s7cv0iGRsEmVQjet?=
 =?us-ascii?Q?MIyiygP8W5u1R3KkXQnjAqO6HZDX9W1vlGrLDuX6VuhX9/44/bGYjtEvTiYs?=
 =?us-ascii?Q?TZTMkkCIgOIfSkMfODc3WZQpO7Jg6YEcMJU8RvDaFiUC1O0gp1SAjC/VYbul?=
 =?us-ascii?Q?4h0RTrb5MtU3IjZ+JL3L7AE7EpIg+0RHanz5aXG3kd6aYjPE8wy2sOh4Rqv3?=
 =?us-ascii?Q?O7Bc0IS2LqocjLh/ApLcfIcJc7ND5RisWuECEqT79+wEUFdqqgWg+SGpfMTq?=
 =?us-ascii?Q?aM3TNluztulzXf24L8HBNOFZdWd81nQFntahdnMnweNNVx94GEJdOafyl6MJ?=
 =?us-ascii?Q?U1o9biG7/32gpw+SNU+dLoRgoRt7Bb+XM8nLhb5EOTXtzMqs/IqLRzSKJBwC?=
 =?us-ascii?Q?Qog0Uq35i/NBd0sbFOKUNhoqoXaMm5bbEwpk51Sjuy2nrbT4MEVzisFjbBzg?=
 =?us-ascii?Q?56/f9NH6NlX4VM4PgTphNqsIuiMzPFYQTSfxVbZyvkPdZDpk0rqafGN3sMvZ?=
 =?us-ascii?Q?uv1BXnzlgMcxKxV7SqD2bMJkAc5aOg1bmPrlXGdqwO9gZ1aEn7PJ1RfRP7gC?=
 =?us-ascii?Q?0vP/ACwWJBuuTF8WCZiVTefpN6CYyFihEagWq3YTzQtsQprGgjTriOZULjKp?=
 =?us-ascii?Q?3T9w2cdoShqMJmbFFKiukFuf4d0lGGUIFkNua2xvueIs8oEhjoWA5NDS4wOG?=
 =?us-ascii?Q?vlHmVhGGRJ6CKxvVEF3omfGFpJ6OKUcAv1Mwju2zQ/HVwVY1h82rd/BYuTII?=
 =?us-ascii?Q?KS99m9pg+tpPre9aS0mzEEi/b2NNFWWxZqpf0PU9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d804e1f3-0176-4955-8241-08dc3c1bda2f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:22:30.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 etHJlhST9f7ARZqwDAwu7i70EkOQKjbep/SkyuNB6TLviOUm5sQgdsQQYxSZL89L/w17PFBK3CuWw9YS7nFcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
Message-ID-Hash: 6ZJVQ6X3FIWFXWKGTLIJ3DNKFDCQ73OK
X-Message-ID-Hash: 6ZJVQ6X3FIWFXWKGTLIJ3DNKFDCQ73OK
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZJVQ6X3FIWFXWKGTLIJ3DNKFDCQ73OK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC machine driver can use snd_soc_{of_}get_dlc() (A) to get DAI name
for dlc (snd_soc_dai_link_component). In this function call
dlc->dai_name is parsed via snd_soc_dai_name_get() (B).

(A)	int snd_soc_get_dlc(...)
	{
		...
(B)		dlc->dai_name = snd_soc_dai_name_get(dai);
		...
	}

(B) has a priority to return dai->name as dlc->dai_name. In most cases
card can probe successfully. However it has an issue that ASoC tries to
rebind card. Here is a simplified flow for example:

 |	a) Card probes successfully at first
 |	b) One of the component bound to this card is removed for some
 |	   reason the component->dev is released
 |	c) That component is re-registered
 v	d) ASoC calls snd_soc_try_rebind_card()

a) points dlc->dai_name to dai->name. b) releases all resource of the
old DAI. c) creates new DAI structure. In result d) can not use
dlc->dai_name to add new created DAI.

So it's reasonable that prefer to return dai->driver->name in
snd_soc_dai_name_get() because dai->driver is a pre-defined global
variable. Also update snd_soc_is_matching_dai() for alignment.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
changes in v2:
- update snd_soc_is_matching_dai() for alignment
changes in v3:
- resolve conflicts when applying patch, no others changed

 sound/soc/soc-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 507cd3015ff4..1e94edba12eb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -283,13 +283,13 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,

 	/* see snd_soc_dai_name_get() */

-	if (strcmp(dlc->dai_name, dai->name) == 0)
-		return 1;
-
 	if (dai->driver->name &&
 	    strcmp(dlc->dai_name, dai->driver->name) == 0)
 		return 1;

+	if (strcmp(dlc->dai_name, dai->name) == 0)
+		return 1;
+
 	if (dai->component->name &&
 	    strcmp(dlc->dai_name, dai->component->name) == 0)
 		return 1;
@@ -300,12 +300,12 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 const char *snd_soc_dai_name_get(struct snd_soc_dai *dai)
 {
 	/* see snd_soc_is_matching_dai() */
-	if (dai->name)
-		return dai->name;
-
 	if (dai->driver->name)
 		return dai->driver->name;

+	if (dai->name)
+		return dai->name;
+
 	if (dai->component->name)
 		return dai->component->name;

--
2.43.0

