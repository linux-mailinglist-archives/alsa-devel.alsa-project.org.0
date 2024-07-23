Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AC939788
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 02:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17F1AE8;
	Tue, 23 Jul 2024 02:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17F1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721695452;
	bh=/d7MtHbaA6J4dlJDyt25HP5mftHet5b3MpFTHg/LGRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Po6j2Ya0bSwsSadRR2Ze11wpR1rX6K9zlWeQFPT5PYMe5zVC8OoH7SCfWbpvUC653
	 EIOG10ZB0FpbIc4heG9NS8EBH57NIPJ7Spq0anYDuTDdEnxL46QPaENv35bfZ5cy+G
	 exo06GXkQS5WSqKkGMalJCMW4OA+gc7pds5aH5y4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E12F80588; Tue, 23 Jul 2024 02:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B31F80580;
	Tue, 23 Jul 2024 02:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32A80F801F5; Tue, 23 Jul 2024 02:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6584F800C9
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 02:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6584F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aNCqs5U2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AO/8THFybXa3R/578qrqY1CXthV4MThYd1kVZ1524cxTUnLop3cTbR++Xn3gzF+5fYH8Wd8pnljCt4GrXP7t4rDiUf9DN+zWokvTvqtSq1e29jecJfEMZt/YNXjJ/YN4tj5drQJP9r+sEebpLM9uarPoRviv89Zdg/0tFK75W4Dnh8E1RV5z6NDENKMuHCD/QX/JROxVMidlKj/k7fynHz5k6r0k8GhoERPlZrRAgs4f/6MTbdy7wl43Ei1QGBw99LJbrFZGPJgRy39ak4ebpmm86R6UqFViVlcoWTyNZeUqT2vfc3KMlXYuLwu97mnDgnTKlhaVFNxEKvr39p9T5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eBjefuJmk/rMXfdUuuZQqi5ssnS0aUBuS1rLA/i6sk=;
 b=qNJrKsCz77Z6ZNfCPeR7v5M0jlWFMZpmJUiiIBKpCnfsMQAX2PzLjX07WdjOobzxlTagxTyXRKMCKCNhg8cWoWFdNf81lPLgIAPIiXVg+7tlrbAsyvWPgEOMLJkIcCIdfivKEjvQEF23agD5u3aCyKUkPB9dxAvL+lrLnd5upCvaP463kCJL7LBCA8YW7rv3NVSOTmI+cJ6a4afxw6XClRZNzMZx1xriEssLEamy1IttvkrXL/V7OrWICqmbQJPIYZmLO/6CFer992z7ELBdFPXMhMmAW7eS5DZj8PE8xzVSOAU19uUCA/HZOa8DAnKIWlQRltK0U6dJNZcwApPTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eBjefuJmk/rMXfdUuuZQqi5ssnS0aUBuS1rLA/i6sk=;
 b=aNCqs5U25bLLEgpnWJLUaNtlSK/2blK7yzamacT/zvK1KuS95HNVv7g275KyIYge2atWOfw8/6pfHUDlRnRu1b96bWrS5y0n/PxgaEpSZE5RPSiXKw7+628jdwt36q7ncgL2JZs8waOWEOFFLEw66nCa0Zg7Hk4SQH83b8EBQW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10741.jpnprd01.prod.outlook.com
 (2603:1096:400:2a5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 00:43:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 00:43:18 +0000
Message-ID: <875xsx3pll.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
In-Reply-To: <df2f2cc2-6d5b-4f4b-9edc-84ba1fde4d3f@linux.intel.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
	<9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
	<87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
	<87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
	<87v80xq1td.wl-tiwai@suse.de>
	<85450b77-d68f-45e2-bef1-6082bc56fa59@linux.intel.com>
	<df2f2cc2-6d5b-4f4b-9edc-84ba1fde4d3f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jul 2024 00:43:18 +0000
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10741:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a0a65d-0451-4dc9-e060-08dcaab07236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uA/K7M/GtMISXfV9GHPSg48ibeciKufKoXQXmId+yNfDv/Sl+5cOXBfSU8FN?=
 =?us-ascii?Q?rgHUrAiaxFMEu1Rpwel/xUed/JfdkxlKKbe8gxiudhUGdNS7hgWc60IqwBeJ?=
 =?us-ascii?Q?aSlCvIhlMtDzRVr9j11qHqe6vV7A6aJafJmUwVkWq/Zi42Kmno8vGtXk/rOY?=
 =?us-ascii?Q?slThn/HqCUMS76cdk/lwshKtt5q8dHLXchvDOfAV1qU4MmiZtdStVlOh/FFh?=
 =?us-ascii?Q?vabdgIdA+wIyJIkdmllKq6yuAnmVtWqYaXIESffdttbVqLsVLLBl+ykdjQvF?=
 =?us-ascii?Q?EuHeBgCuHrM3QYUQbDb+tpqHmGFQbuzFa1dQoa1Qdu4wpCXii0RjjC/Xg4rv?=
 =?us-ascii?Q?i90jU6OeRJbVe8cshgXOLu5Tm3KdzgTS6kViwhkpDwfXEETM0TbkSrd1NoKj?=
 =?us-ascii?Q?Uzmj46r84xt+y7+ZVahNRTt7J8OE5hR91EXk7i52sVN/1RrLBnV9QJmNTYnL?=
 =?us-ascii?Q?EKbkiCZOC1WFVEl4Fan4OCxxt5MwI2S4xGjXwCj6BbzfEVbI0J7hUjxwQ7HI?=
 =?us-ascii?Q?VeqVndiSo7c/YDU8GvFWjGAPIY9NL7wWnvQ20yjSMnFG0b9hfk09s6Br2AS2?=
 =?us-ascii?Q?XQaH69AJoydWzc7mqRUHskEeGyl1/6Uvnw4O01rRyRWnV91sx+ORFrNs2B9g?=
 =?us-ascii?Q?GkiGIMnfpHJ8ePfYmit1Ebb/u+uXpaIyGJGCurvI1Lil88IVRtJCokwP60jy?=
 =?us-ascii?Q?35KOOiUi6vslo56QU6klBrjTrW3e0YPR1CI2OZ5+e2ciaXFEGVLCO7xP6NGC?=
 =?us-ascii?Q?btfVdNrnBo6qnS399HSzsjIbphDcVlgXeEcK+OwjzB4k61G6YgJG91sGnkLX?=
 =?us-ascii?Q?NN2tWyTILiW2ZTiwxCQwKIjdVu5EMROLF9rXlMB6FckGTEIa4KfE8gi6W25N?=
 =?us-ascii?Q?drt7uyzJqhyJ01PdVVr8AEX5T23AuSE1QEZHMgOm95a2IE5JytTlvuTvfWWJ?=
 =?us-ascii?Q?zB+pPUu3FkxJcdyQL+e2aE7pufNaNrqhEaAQGzONUEjYvnc56ZGv8TwTYT3k?=
 =?us-ascii?Q?KxMUqCkg+HvCnKcbRitLH+IRY2Y+NBVi0O8NINZHOxMmfbFEsPXJlr46VKIN?=
 =?us-ascii?Q?axV/Uk9H5N/41RWyZZWd0LvaMIbM+Mms8a1S9BufOdsO4NxTm8DQBYYrocYl?=
 =?us-ascii?Q?VkCzt/YMkeCvBbE9Cm62oFaTYrx/VJP+HejVagNxtzyspGoa5wNkkr3BMPgy?=
 =?us-ascii?Q?0PyoLNeHhQ/W/Quc91o9OC2US8JbUqDbe5hWE8RrfY+uws699Yxa8fQTGL/S?=
 =?us-ascii?Q?DH+dvx89FNEF46y9YIM3jJgJbFuEQaqj27q/dK+uqXxQOKATG52EgHDb+cUC?=
 =?us-ascii?Q?+wzmC3695sSzqlDofe+cfuI81sWJfmqlj3VvOikk+aU8slxlUbDUKI80a5Lt?=
 =?us-ascii?Q?Ep/i/dA63LFPW7P3v7eBZ79wa1eCp9E+dQJL3gMDZ/SFN3mfiA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oso8wSW87b3K8oFoJ11aWcXBQrhJQMVZAoT6HreP5uYL8m0htrYyv9Jfzvmo?=
 =?us-ascii?Q?hc6fhPPzCsz1utzBqbuqeT0hYL39A1ji4MgoeP0WISfecySgYG6WWIhTwIh1?=
 =?us-ascii?Q?iL3jXl1rHpJb9LelcBOu35GbH5gHZRqlELzI8cUCyRthEVf/OHYzkcNHT0Vk?=
 =?us-ascii?Q?rrUdjuUM9UYn+DYMOOvpqak7uAX0i06MIjIRv/bfwGHGrAoeVv6xNJf0QN7m?=
 =?us-ascii?Q?+mxGUAMmjQ97SAsPBvsBELDACtY73OVjT8dCFe0648aKupDOx04G0lPz+yvl?=
 =?us-ascii?Q?8GGfDaMo9xnfmtDVI3rDgPPu3SAah8rVTwnZlALHt2mV9//apXXTw2K9O81v?=
 =?us-ascii?Q?SfL8kfZnMySQW8Z2nazXo4BW50VGfSZyLy18CZfVx7L7NV0ZMH6LL6z/Qul3?=
 =?us-ascii?Q?7VVi4ScjmKYhQY6y90UWR60m97gDn29yg0taUzB47azNQgB2Dni5KU0asWiT?=
 =?us-ascii?Q?ePvGmVs0LqEyMTlp8TUdznVeHlbV/vwRsOg7d/tnuEgl58Vu2rcGm2hq44uO?=
 =?us-ascii?Q?2r7pbYUnXZueFxVVI1A94DnzYAp2abUrE4AwuE64vlapT3F4LsfWgqB5xA2W?=
 =?us-ascii?Q?4cD7uPzBFqDERTbRVgGwyZHGvSS2OqHl3dPshA8QZCNunoAFvq1js4sYy8oH?=
 =?us-ascii?Q?IQLgvEFLp0D6TE38w9qsTpYCOfs5TrrceMfIxQ/9dsmmMRWhqNoIfOHyV8BC?=
 =?us-ascii?Q?ve4n8GybNL3ha8jI79vf9FestnJxRks9xu8c1hfQyW9VV1IyRPynJTSt+XSM?=
 =?us-ascii?Q?bUcl5uVeypV0NwDMGmZHyO1jihfj6DYlW3cYTWxwM8h9CMCr+Ssz6yli/m5A?=
 =?us-ascii?Q?oJEhjl0lH0dW/v+bTqPrsj5+1CRyaRLXKDX20C3ij8nd2mSuhA5N6NJw76Yo?=
 =?us-ascii?Q?PVp96yqaPuZRZc2RDJt6mTeKGoVSLQVhbE6/PkSaprNbfYzvE5dMztlwEnSC?=
 =?us-ascii?Q?OkEDHGlnmncnPgRQeSOFFrnfMkEJgRnnCvIzoEWls3wLkn+HpQSJtHiawYdw?=
 =?us-ascii?Q?BltNdCasUcXr7Ob59iJEb5zY+tLDp2R+j9B0abf08Q0O0ccHCiz4XaRNA4WA?=
 =?us-ascii?Q?kn3EU+hRI1+jD7jwVyWaRk/3CmLWiquqcPSHlYJPpnv48BiuqdGAWZoV2hqG?=
 =?us-ascii?Q?Hp0AEPgm54kF2HyNg/r/fPq+gX8KwOh7O9Mn2/Yja08kl2a345BQxumFn1CO?=
 =?us-ascii?Q?F/U0A0WiAX9BCKbH/Xv2yZX1dhQxvBk9VojR1dEw57EBOIYonzvZxF0qg5h8?=
 =?us-ascii?Q?NmvBBi/YMKR9FW5MDQbMX1WqZKgbMH538QZtXZhIh1uK6x+aWVMmurszqZcx?=
 =?us-ascii?Q?8upEqCg1WMHFjzDWH6juMxifaQsZOlxrsRFpDAxxFEcfWrduRtHECDBNzCPK?=
 =?us-ascii?Q?06hUlsvXIc7PlpNST/3DWxv7PEHJJKrCwghi333RDkmIUhDtpFYhFTJ2yNEJ?=
 =?us-ascii?Q?nDIrzSfpmQ5Cg0mBOd9d8YBlmeI6ACgIeYCCUVmuIlUE/YY0qtDKYzPAEb/V?=
 =?us-ascii?Q?zW9gx7/81SsxR2wRX6Dc4I/1jRTEimr2ZgFXlvGBpr9ekefClqz4AwyYWKUK?=
 =?us-ascii?Q?Gi+Vl2lD0PGu+/AilzMjJjTDJ5w6lFkhxD5cO7TPM2qolvDzvzoryq2G5thJ?=
 =?us-ascii?Q?NQHBIIakffuXeEkfSwV0+u8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87a0a65d-0451-4dc9-e060-08dcaab07236
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 00:43:18.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eJ4Lw7Olo2Ht5QrVw3IrWo2m76jxfS3uWm/gLqFMh4TOnJlVQ2MjRDgBQPWufYaqfO2htVLhNxd5BU3zuXPC85f/tHJFSnMykD0CuDdLS4oR1L17BT/BaXXk/TWDf5FD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10741
Message-ID-Hash: SK3QM5AO6YQT3NDHRPNIEDYROKTCMBF4
X-Message-ID-Hash: SK3QM5AO6YQT3NDHRPNIEDYROKTCMBF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SK3QM5AO6YQT3NDHRPNIEDYROKTCMBF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz, Pierre-Louis, Takashi

Thank you for your helps

> That said, as of now, I'm not much convinced to go further.
> OTOH, I'm not strongly against taking this kind of change -- if other
> people do find it absolutely better, I'm ready to be convinced :)
(snip)
> > The main issue I have with this patch is the continued confusion in
> > variable naming between 'stream' and 'direction'. It's problematic on
> > multiple platforms where a stream is typically identified by a DMA
> > channel or ID of some sort. There's also the SoundWire 'stream' which
> > has nothing to do with PCM devices. In the end people end-up drowning in
> > too many 'streams', no one knows if the code refers to the data flow or
> > the data direction.
(snip)
> Oh yes, so I'm not the only one :D, I also would very much prefer if 
> there was 'direction' instead of 'stream'.

For now, unfortunately, using _Generic() makes code more complex, because
many drivers are using own direction variables (with unsigned, const, short,
bitfield, etc), and _Generic() need to know it.

Not _Generic() code is not convenience, but not so bad (?).
If so, can below acceptable ?

	snd_pcm_direction_is_playback(const int direction);
	snd_pcm_direction_is_capture(const int direction);

	snd_pcm_substream_is_playback(const struct snd_pcm_substream *);
	snd_pcm_substream_is_capture(const struct snd_pcm_substream *);



... BTW, I noticed some drivers are using below, is there any difference ??

	substream->pstr->stream
	substream->stream


Thank you for your help !!

Best regards
---
Kuninori Morimoto
