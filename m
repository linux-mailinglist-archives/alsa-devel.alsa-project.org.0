Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED395FDD7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 01:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BAC6A4B;
	Tue, 27 Aug 2024 01:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BAC6A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724715842;
	bh=zIaNtsMOHeUUGN1oP7AezTBOKzD5+O2snnv/zzXjooQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Crc3mYKNVs5A8W6EXH78zlqN/7HZY4TnT3BIoLXSSFtUOrHMLARYyZP7vsVXy/Q/S
	 p8PuQfpbmVIYAeqnC43+QOIohvwKm0Ha0Bo7UJP0F3NY+eK/+p11GYnlZ5Ri4tauqo
	 083DTzgAxbtKlzbSflWXNLTIYI0R5AsHqKs7Xr6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 170CCF805F6; Tue, 27 Aug 2024 01:42:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 635D9F805FB;
	Tue, 27 Aug 2024 01:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1516F80423; Tue, 27 Aug 2024 01:42:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33525F800AC
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 01:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33525F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kEHW/cvD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOXsPjjW8aQCY9o0Us0pyVa81oWg/ujqZUWr+hGyvwbT4hn/9qWxLPZzv4TgYQszr7Z5BmR4CD3yoLAZa4z6jHnTj9hDdr4dfoTC0tYUSnbQ222FUQDnbD5qk5kfcK1F4EJlMuEk0Sz4xUiwQtYhszvcVCNUIirvz0bL0aUGF5O/gn7Ng/A3gjMgdXx2PHmmAAgqLXn5Mm8jhmDbt88oywN7HpS8ojJ5KL9E8iyJS4kUR9le/B70Z4LD19UTrhB1ikTfZWGIXPDicN+vJ2ufsXyOmVzO3bozx1V0cpsX5AQjPQbkYksNFeTwC7HgkSfDZGAttpM89ndCVuRmJqh9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N7URJglFcbRKOp8/FDpjNEuwFAq7K8FHljQGHY2XC4=;
 b=eBF89TXLRRE0XJJ+UILp2TI5PxDfXURG5OEeMP03H47obp/5fv5eh/V39ul8HleFV/pTPGFHW2mYkUWujkE4FT2zj4d1jvXwLFStLpch2SmNtBmSrtzidJQSWvtFbQzqKdK+Nr14C3mMn1kUA9geKTMGSBl0sPv/c+p1m453YyMt+o9vwto7xgjf1Ozf73/n2KhpL/xL+rXI8gm98q6Ltu5iSryGsFiOK3JIfP8ezzYdMQNbgvNnzX2m+G0d0eFbIlwIN73cnK3Js88Dvy969ZfOslZ7MrzMk0EUoyTt/LhnE3yG4rIusMSVAmdK7pWQXtqvfSMG9SrxpuSqR7tZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N7URJglFcbRKOp8/FDpjNEuwFAq7K8FHljQGHY2XC4=;
 b=kEHW/cvDiYJpraaWOOVSirBJmxy+7FJR3ccH3Jd+OqmnbPEEzHrF8RawCsO5WAm+SuhNJs9vpBrirTUrMsIunK5tHDGun1Kujn6DUTaJ2TMDrSEHwPpkWMJQyhTVJi5oN6nigpb7a5tKjBBjYx0OM3ch85fuNzosTCmb/THS8qI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8522.jpnprd01.prod.outlook.com
 (2603:1096:604:199::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 23:41:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 23:41:57 +0000
Message-ID: <87h6b6df7e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2-resend 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx()
 local function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 23:41:57 +0000
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5fc379-d098-4c7f-d12a-08dcc628acb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NkcEC++IT1575IvglMr2FOpH8LzQviArPfT35JEvvqir0noZBYy1c2bwyNRO?=
 =?us-ascii?Q?VkUoV9BeXUQRnmIrE7Np6Qln+E+qZx0jopbrS8kv8fb2oWvMjUCN35GGMt8L?=
 =?us-ascii?Q?WuxiaN+ULJmoSlyoyr9Mo9kO2nQACy4/YBjk+z+7clyQIQxrT7z0dw13qi9o?=
 =?us-ascii?Q?RYYw/xuZc5ZmviVFyzSxuupVCtqPEeLpViobYsjD6Fdza3RAhSRRNRo4Gv0H?=
 =?us-ascii?Q?ri3LaWWcnRmZzftwoWrObIyZd6VqqRGgh7ScSwVrksMyv46NDcm3l7ZzfDE6?=
 =?us-ascii?Q?LjHSsZ/laRdZafTqDNdq33fi42fDhg94GtPYiRylBiubY6Jiri8y4r7Fixkv?=
 =?us-ascii?Q?p9kXIHWPw75HFw8UPyVAVXD6Nuiz9sN9Lfi45htL/PvP6lv91xVCWUCh6rZ0?=
 =?us-ascii?Q?gNQ9AF3KFwupr3hDmKu0B1w3UyFuuorStOvci+5xdS5qeTNr14Yu+U/Kf2QY?=
 =?us-ascii?Q?RSrWVE87oJg7cC0ltiMH7twvAuG9mUj7s6+EiVWn3k6RR4DD2nKj9nLvp1dU?=
 =?us-ascii?Q?CAzotciw7wbnXZLwdoMC86etoh5/iywQjJ9NgakAtt8YJIx4kuSE68lkUSus?=
 =?us-ascii?Q?MyeD1wM5hwVD1y78qDPBNsU8WBnm35vPCbtyKEZaWpJu6oZG01uQYI4AqqC3?=
 =?us-ascii?Q?7NbofmO0N1XQP8fKBFYewJbxSMtoBh9xvjKKhywmg92zbIITc1mEEv35xyev?=
 =?us-ascii?Q?fVYmpo23W3BdrQxuh9n4WKO6DtVcGoLmyyOyZbmWw0zDqoC5GDYWYk9juaqY?=
 =?us-ascii?Q?jYsYZXIc7MLXeA5fOWUI1CYW6KWzDSwWktBhJx0FJtXxap1SXF3yhS4o/rcP?=
 =?us-ascii?Q?98oxo1hK2/Ydezewbj77RkH+m9jIfo/3Z2svchTX2hQ+BpzuDR+h6dHAGVHB?=
 =?us-ascii?Q?IxuHbpzq2ZSw7pZjNklNojw/GLjqw2fLWKpimI8U4Mymh4nODfBPgC/+v1AD?=
 =?us-ascii?Q?ytPrPMAoBAhoj+fkB2QruhhbV23xhuZDkaI6YiUVwKYiQCLoQotJsh1GCHKp?=
 =?us-ascii?Q?mRdPSSj9QcBycwrKVXNuv+9BFxk0YfJxVXqYDeztTbd6JyAVDJ9hhWt0bCtm?=
 =?us-ascii?Q?JO5EXhhrlYAaZ/y21pyMcBXKPUJS2YCbl6AMADXMG2wFFSjyfn839cxQacUQ?=
 =?us-ascii?Q?U9q09xQeKH8cRqrs981Sc1vE3PNwfTMvtN3t/5MJUcDpnLK69zbMeRj56Y5K?=
 =?us-ascii?Q?Wo1rkXRUoctlceXtYYmiwZ2spUMrkmYCf91Spa0wc39UnHve68uWzswOz3kW?=
 =?us-ascii?Q?Q1aZqjNz/5kEdmy1FgiGnWXlUXLUCLhg++8RQ1GtVBJOtZajQagKjzQB5PX3?=
 =?us-ascii?Q?+D7xVpw8pnNNbsdqzLI06dr75thHNk6NT9+nOQ5KthmLScFCt/R/S+WV6otM?=
 =?us-ascii?Q?ILVMZyXSIM4L1rVZDnfQKynBIS/FZvnzmLhT53BEAwc9lTuOVA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XPy38QbcQLJPDiYx5h204MtIDqhn9gy2QtHFzMQ8aCnzy+N5MVl0r1G3SP6S?=
 =?us-ascii?Q?L+mlOcLkpRYkCKxVBEHswhRa25G8wJ3qRszlgCoJkvkn027kPbZyAo+I6m8S?=
 =?us-ascii?Q?mkqXm58Cb0KpfvGHjrnCLTJhshvG0ZTffu1LlbfmAey8MqOO4FE/hNznZUlO?=
 =?us-ascii?Q?9qM7JY7VcnFX9swwx99HoNIT4Uh5sIszrdxWvKbPEGKW4ZEq7itwc2Qzy7mn?=
 =?us-ascii?Q?mzEAoBLWZt9nyZ4uHpNd+C88+RUuV4IT6fmM7HSjQ1ohj1c8wzz9+IfOoqwX?=
 =?us-ascii?Q?87CYnU9AflB7Zz+khR8oPdt0MOxKIK6KDX3NJ/qhJwVF9eH8Z5+cXVIM4WEr?=
 =?us-ascii?Q?28DVI1ozCRvd5Jz+h5fRfXwVNGK/2EqF+6PHyqo2O1LrKlE6xUkdWQP16mmX?=
 =?us-ascii?Q?gkLLQ4cgZj336rykXXpa28kgGyfRSkwGs3oWC17hTR1qLr7s4FJdGRi0RIEl?=
 =?us-ascii?Q?x1eBTl+GzmtuPaDDg4zcbVT1wuB3+gtdt2PvlDIIQ0ilX/ulxPfkvrgn/O3P?=
 =?us-ascii?Q?TCee/NIg8L1nyaD2TPIarLFbRJup20ik5dSku0RlvRfR65NO3PbBi6sF/lnc?=
 =?us-ascii?Q?DanlnY9LBki6h91XaPrtwGfp7pE3EDBC1yjGctH5eXOxC+rIEVQKCp/GZ5sA?=
 =?us-ascii?Q?vliUdKiEiWocfCAphhYU6s2oQn1wQN1B52EVUw8ZKmd1sn/NXxd5kpI4BJqy?=
 =?us-ascii?Q?4bjNo2TCh4euivCA3e95iNr8SwrLWUSLX3W22z9CBVNjK9SYUwLMa2HoK7x1?=
 =?us-ascii?Q?+dj0NETy0xC2rxxFxzdNZMKNnM71B3vWBWMBOrgcq1OF0i7S5d42gbX0A0X/?=
 =?us-ascii?Q?fVq2ex+8utH6UFeOU2fGKNx91qC92FczNPb7hGdZg0dFNz8QIkXQb3gNjtlP?=
 =?us-ascii?Q?t9GRztXmPJ9qYFoSXahxoD4MjUSUWgUkvUOrNJqGR8nNRlrCkVD0DLVwK4pE?=
 =?us-ascii?Q?mx5WVAOxDLLl8Uf7Y5jQeuK2XBNKFHlHG8J47pcihCcRr+o15BAz7DrqgIoj?=
 =?us-ascii?Q?XPixFXM7SbZvQyOTTaDI8LvqbZJ5bdYv4urQJqDVgKtMSantHj6fwNSTHy4A?=
 =?us-ascii?Q?3dfUHDk9zaKHZjNG4M+6lT5UOkqWosXn17ENWvSO8eCsNrUcIBoaGP7i2Hpl?=
 =?us-ascii?Q?xQiHcAP6nP+pqmD3OCxVjUGkNZ2wbAEs6KOb3AFmrW60wZKs5paerQYSAd0V?=
 =?us-ascii?Q?IM/1azzSD8V2cZHoKUb3z88ViKT/UTZadqz+2yWw19ntQplXPqvIjnbRII3K?=
 =?us-ascii?Q?9UIYVupGDS6zuw4XfarqjoIGTd7kDYnTPj2vbKApYLXnmc5avoenoG85qW3+?=
 =?us-ascii?Q?zfYvL9peB+3Ia0pvwzYcybjVZEn8KeSdZ4EzjBhsdtk5RDwtKEQOkGchGo9f?=
 =?us-ascii?Q?WjAotR+MPTYVZBS5dVzf8fzzZGKjOtoJoQDSASVPAugTxhlGnoe2QRmXxhaH?=
 =?us-ascii?Q?tRLa4p4E0/PS+/A2WxNqlEwGEhJ9nWpr7MqrqnmRz/woUCjLQXNtmAjyVy4g?=
 =?us-ascii?Q?NAMkV7mXpegPzY0AuZ7w9eP/keDGP4ioQiKeEV3uTHzW8m+SznEBlYKddLDr?=
 =?us-ascii?Q?PAlkod8xtkkAWZ97puXaUs7VaWz2jJl3rjAhNLkRuFW31XpEQUFBYd9geiA/?=
 =?us-ascii?Q?AtPlK+xG0IOYUHRH+ruq8k8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b5fc379-d098-4c7f-d12a-08dcc628acb0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 23:41:57.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZB1H3cDWUf7hvDSbpwJrRBzwdmFJwla57VfaeaYXRemq6Uo22xUmLmtIy7lwXBjgU69DZF5Yku+n23D7L0GGf6jkyLLJ1fJI61VrCroMMQIXNrEbWvtyFF/YEF56bqnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8522
Message-ID-Hash: YKLUYTXNI5CRP2FZ4LE5F5YTQUWTI2FA
X-Message-ID-Hash: YKLUYTXNI5CRP2FZ4LE5F5YTQUWTI2FA
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKLUYTXNI5CRP2FZ4LE5F5YTQUWTI2FA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. Let's makes it static function.
One note is that snd_soc_dpcm_fe_can_update() is not used in upstream.
Use #if-endif and keep it for future support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h | 18 ------------------
 sound/soc/soc-pcm.c      | 23 ++++++++++-------------
 2 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 773f2db8c31c..c6fb350b4b06 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -113,24 +113,6 @@ struct snd_soc_dpcm_runtime {
 #define for_each_dpcm_be_rollback(fe, stream, _dpcm)			\
 	list_for_each_entry_continue_reverse(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
 
-/* can this BE stop and free */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform a hw_params() */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform prepare */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream);
-
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream);
-
-/* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
 
 /* get the substream for this BE */
 struct snd_pcm_substream *
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 667d8dff1314..c421eb663a3c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -50,16 +50,17 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 }
 
 /* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+#if 0
+static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
+#endif
 
 /* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 			       struct snd_soc_pcm_runtime *be, int stream)
 {
 	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
@@ -68,7 +69,6 @@ int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
 
 static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 				    struct snd_soc_pcm_runtime *be,
@@ -103,8 +103,8 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
  * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
  * are not running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-				  struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+					 struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -114,14 +114,13 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
 /*
  * We can only change hw params a BE DAI if any of it's FE are not prepared,
  * running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-			       struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+				      struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -132,14 +131,13 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
 
 /*
  * We can only prepare a BE DAI if any of it's FE are not prepared,
  * running or paused for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+					struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -149,7 +147,6 @@ int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
 
 #define DPCM_MAX_BE_USERS	8
 
-- 
2.43.0

