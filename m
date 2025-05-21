Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48094ABFF04
	for <lists+alsa-devel@lfdr.de>; Wed, 21 May 2025 23:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8AE1601E2;
	Wed, 21 May 2025 23:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8AE1601E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747863416;
	bh=g6+zsbOHPyUG91NuSDbzA80ZYUNh8XVdbb2MapM+onE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sUIHYlLueHoSP+pTtU4RRVMwF+QANCwkshl6okn91jUPwaFj8qqalEBk2gSd3wT1I
	 nVombnM6gPojIJ95XqhLG6xlzJcecvV/SGNXmNpsEFvVLlcRIumCtoVdTbdzUc18Wc
	 2IkhuEwUFH8vMNqFiVKpVi3WZh2KxGY3Ncf1y27I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5560CF8057D; Wed, 21 May 2025 23:36:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46282F805A1;
	Wed, 21 May 2025 23:36:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 254C8F80553; Wed, 21 May 2025 23:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35F46F800C1
	for <alsa-devel@alsa-project.org>; Wed, 21 May 2025 23:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F46F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=pxem612e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAobFysQEWGbEzRAjswqcOoan4V9aiG4inKvrOPyncP6IMSm0cfAKlCkd71H+XTAGUoajILxUTTaCq8x87ztEyJjDxEVgXaCrvCO0vG9MNcSJgHMl2hu46RbP2epZTiskm8ElWvVljFXsatmFeReLUn7DgtzS1HVscyTBs7NkJnSVMk8sM2I/+Wbo7+gIh0iQA+zSkQo4WbfSlF6NUymM3HDLzTeO/RdmJ3MktdDB1pKqlxolhN7fmOsI+VESdFzOKZbJR8DT73HWTovqyziBo03Dw3l6K4592onKE/UB97dOulJIJfDqir6potcYNbRQh7xXyzZ+favbmBynHw/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naQDv1linFnpGkcVGPeykM6qkIIzL6/9J+fRGuU6AcM=;
 b=WMwLWh6plme2JBb8TqTmLcSHozz6pGSwxx06nCN9p1UPhkLGhAEz8dLs2JhK4YrDf4EJYxchCtG6lU40H4Ke8XAK71JSALNRL64OdS3zLJTozAcckqnHJ/gee1jIcHv5ELvPgnJ1WwF0BUS5vAKRHiM3doX+vXCqxMK33UiVzmlcfT9OojSPfN63kzK8zFmxXNlCqIpb/JEF20JWr2TbjQ3mwzbhaKSzrwCX43VnxxKNREJi+rkp6X02LEHka1ngVraXSun3B8QB6c8yrhQa7Ijh8neBbfKPcbvbbJv12R/fbZp0ZLL/XGkuv400hkTkDGePBRWRbQ/BoAuG+GhG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naQDv1linFnpGkcVGPeykM6qkIIzL6/9J+fRGuU6AcM=;
 b=pxem612enEmRZem5PsQBksXwIV5mDNuX/Eb5yeZoewDFOmT7sX7KKweFliaDjiHtM25Y6HW4MutL2ed29Zw7sa6Ynn80fVwb6FTzmlzqWPyGTVSlaXXdQSRZNqFzh8VeaXxqQDV+uOe+KWcvsrmlLXCMfTFpBnWR9iOsQQlVz5PEmO16M1um1YMEEtd3R2ukM5/IlUDHV1F+aMXmBdQOJ6YXMzbKUp71lqt6XdMx4VU9U0rrmS6w9J2rZ7fs40X43VF3tRoxEWnJBIWoxv665OVPNPYaUkDtDVhtaSQEm6WDhNqMVIm7DETIjTicPlhOLaNMIBWPXb+uz67v1scXfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 21:36:03 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 21:36:02 +0000
Date: Wed, 21 May 2025 16:36:00 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de
Subject: Re: [PATCH] conf: aliases: add hda-acpi -> HDA-Intel alias
Message-ID: <aC5HQAcun3NMnVMA@ddadap-lakeline.nvidia.com>
References: <aCXs810qs_pvuOtx@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXs810qs_pvuOtx@ddadap-lakeline.nvidia.com>
X-ClientProxiedBy: DM6PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:5:334::19) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: d408f066-642f-451f-fcb0-08dd98af7c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eSONRXN54Id6WFN+KVf4uGodQQphbNdLmkxsQcFtf3cQ/2/HTHk+hTIpFR7B?=
 =?us-ascii?Q?rmb1//WJoVUOxGiMYa44JDW4+WC1sIIrzFJY3QuUOtAuWm/qd2fOQKBS8x0p?=
 =?us-ascii?Q?yNH5GkcU0oXM7wKvbRMNBq5WiPZbJwndykG4/0oIt5KzfVT6GCM3HOuNZk6w?=
 =?us-ascii?Q?c2AHqdRwLgGknOsMCE+EYMH0XyKzajE1ZE4G0W3e52DA5shAhYT+d/2zNwsK?=
 =?us-ascii?Q?KWOulbIztkHZyd/aQ5+1LHt6dUR9nBnV+4iVUKDslyRNmsGu7CpmkmmeKqWF?=
 =?us-ascii?Q?nK3aYqDXrQ79Q2g3YDqI7B5fiRRD0In050qm6llSAoObda+3LNAdxqzdd6EJ?=
 =?us-ascii?Q?TDaqY+4VAvMXbbTDEvtW3qqsR4LLaNo/xg28JvOhPVQl0RaBx/SjsCC+1bjl?=
 =?us-ascii?Q?YMWAPU5QdTcBIu3qew8sel4FONnNEPTrpioVjiyvPL8ABCXhXJKpExBpDV5f?=
 =?us-ascii?Q?wFxQedFF84rCUXQBBnEgApf3j0oZvUhJ//cSwUP41z9YYbZjIp4w8O/yk0Q7?=
 =?us-ascii?Q?wZ7f+dk62ujsHYfe55Ivy7np2mhofyk/3fc3gwpPPMHbeCScVB3KAObB7FKH?=
 =?us-ascii?Q?ixiUMC/cGMIK2uAfO6beJ+FSM5b3AFOFucasLG8csXdllleyJVUc8kpN9c92?=
 =?us-ascii?Q?ydKXlYBmVNQOwk7KMOPp9PtzAGxYjEKmfZrKpsx219ocCVlkV5PCQyjtB82G?=
 =?us-ascii?Q?mA5NQBAyyj5mPve6QCsK5yLt0KQZYN+L0lZKzakhxb6GVXjBddQZhRXHEBZo?=
 =?us-ascii?Q?KCt2Y5wY5HikwfSAPvEFAKliowWBL490twBincAx/ehdRo2i6LEp4AnxEu9e?=
 =?us-ascii?Q?YxK237W7/hc3rZYjE62BMiJ8DVnfAd+tnjLHxolF8yH43GY+kZS41nqxIz8N?=
 =?us-ascii?Q?a3kMqQP67VShnBvVMFreczR8Ybv9tWYWNP5Jb+Rs6agH+kxhlulP/3DKAhNY?=
 =?us-ascii?Q?W74q6yGFVrhTOb5wC20/80z2uqgLhjsL6sO0ptXISWMAfoq1nzaWevEwMouz?=
 =?us-ascii?Q?pO4SRiw9kZWpH9XKVDIXeTwVOeSRDJHhdOgEwHtuqEo0HyRVkiE4/rvzASKd?=
 =?us-ascii?Q?2mGQQzKMKNNrQLoyduYmUKZ0grPcynUWl6PQvG64AhU495GXfI97rctn3XXT?=
 =?us-ascii?Q?NaTJaAaD1HbjO6qwDO6LICaf9g6lzXvNjjeFTlwQCa3hEBycQqSviCQrVJKi?=
 =?us-ascii?Q?ku4n7bOGVAxv/XBOv31VVScff+fzSbqNyqpXF+W84pSluYjrIjOCYGur+xu2?=
 =?us-ascii?Q?eUpfM7KL8x5QCUb7KOX+EZOL5XvsijH5Lwq1owOZBwJSlWLeEVHHwEVHfxQH?=
 =?us-ascii?Q?/pX4VQTemMP12V267J5vAmion5+frxJzKRmGR+ulR4IBWQJ+Ihh+ICx+9Aij?=
 =?us-ascii?Q?mIvh5wLsMvMxwVutHQGXpXqxlrA2ncIpAudoc25yAqQCsd10Vh4fxckiZ35j?=
 =?us-ascii?Q?aVEKxLmalSQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9gMZ1HZ1HTpA7se57xnmf0lWBvBzpHx2DgHVj9vuit4rbY/rtRC5gO6zOrq0?=
 =?us-ascii?Q?x84YqvevWezlcwqruWxRXET20zFXdmyAp7A9X86YiHwVgtZ2iL+XMvdFUcyh?=
 =?us-ascii?Q?ShrHwbNjh6n0nat5Lt9YW5TCbe9B4tY3FPt6RfsfXy+APDXskc+QelJIKkuc?=
 =?us-ascii?Q?fI+NKJT+2O4jAHcAd3zNcmmLLmUYu5Vxn+iwodZywaiRnTDj8nJha4pEuFM8?=
 =?us-ascii?Q?rfuBoKtmOP/fPRO44fModI/2hxLRI8xKLJZom7dCgAMUv3fK4DNLc3hafF67?=
 =?us-ascii?Q?xvgHtVfn5n0UiXM5gOD5BrXAOU1ipW4tCWJquB2dkFAyQeImCKz7ZZhfngXm?=
 =?us-ascii?Q?CfYJCpMfBd7hjOygai2ZHcKDY0nuiEmPMiqr6d8KvZhcr4CpyeOad12rKX0T?=
 =?us-ascii?Q?vFUEMmWW+jQTQNvVaCsQl/3zBtdQm4nAdOBkEDa9dB+C+YhxP//H/BPP/Fip?=
 =?us-ascii?Q?Oq3CAbibQzitjWiHRRoV7+BsK/L2tKw2QgeVEN+yjpgEP648gEmFrVPj8mF3?=
 =?us-ascii?Q?fkXjgYXO8aglVejJNtiXd+pOPRpmEZNe5pi0u+l60+QloX2OfoIMgVkKqGVj?=
 =?us-ascii?Q?9s2oX8UFnRpX7z9i1+i8BXC1OXkgn6hlBuwZmz0Sdy8NZHt/6iroOBVC9wwO?=
 =?us-ascii?Q?hT6VRlFF/YbMY9OsezoZ2JRoY/ThSSponINkLKVd1MkJQh8fhMDHYtOCXi+g?=
 =?us-ascii?Q?N7ZaNpiB703GGqKMAO5h4/9syo83m75RK/VrSW9yFL88tMSuwvbxPDCbfc8o?=
 =?us-ascii?Q?5VwiEWVJZRaqUaMjWgOeV8ftU07KobXe+oE2qFSL23GoSUiQtNI50hFzAYkX?=
 =?us-ascii?Q?xYwZ7vLnMKMM1vt9lO4i6NEdKucakrE+RjsH7gmnnR0t/OODGBKBiFMH4iZz?=
 =?us-ascii?Q?uP5cVu8wNTAALj4tWUV+ZC4C5TsJ/rhgYQGz4RUyjjn5vgteIPphmQGSuj+3?=
 =?us-ascii?Q?RfB0O19QVtKllQc1cFOid5+NbxE4bhBHguayrAmEg1WSOU7bfOYh/8aaisr+?=
 =?us-ascii?Q?wvz5vaC5Ibk3cWMKPFcajiQpBOFmAZirZYfVj2X0MRi8B35WTd+vh4Fvlan2?=
 =?us-ascii?Q?7wb7jD/cS/b4aOBMTm5atUGK+xOmJCZCm4j6LTELYtulC299vdvZhCDWdqSU?=
 =?us-ascii?Q?pk0A1UGfWVQZ7HqUNOAa7jN4oPljxU7TEbl2hUBXvmN450ZngbriXn36sD2K?=
 =?us-ascii?Q?nKMAEGHjEf4cx94saeFAW2AnL0zSAaTnmMUI/bC4tLZaL4qBw9tK2zeqeETm?=
 =?us-ascii?Q?93VeONTW4b0rD2glLxLnUETaoFtleyIQAFoP9Sf+OBqfehzWxnnDA55pYeF9?=
 =?us-ascii?Q?boLsv1HCoqR1+jtfn09svadmowJEmAe+m0z8ajz0vOt1wG0Csu6jZ6TCSm4n?=
 =?us-ascii?Q?/py5UA+b+mY78E30r6yylrfUqHKMYa5R/0VF6dDZDhYnhpSBN0Lfe3gVlxkf?=
 =?us-ascii?Q?colbNq7JzFsmpYXcZ4LO0KKFyk7HPQ5ldar6dNA8z6/CO81uo8wsE7Eh8WAp?=
 =?us-ascii?Q?iLlhthQZ5Oj4+VlgmZszjwl05P2plCnk+ZyrSJivdPKBtU3GWRWNkbXKuiUW?=
 =?us-ascii?Q?k6jSFvmrjU2ETpOO726QOfYark23RTDdW6g3r6hb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d408f066-642f-451f-fcb0-08dd98af7c2d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 21:36:02.8180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uTb2Eaw/G1BkZ17EW5T7e6gbEwLgR/BykXEkBKv9fTwR2CrIOdx3Hg1inAttIojnWOb6r8HJGVjnvBc8v9lrOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964
Message-ID-Hash: IFL43RSSYFPKECQNYQ3E3SJC2YSNNJCX
X-Message-ID-Hash: IFL43RSSYFPKECQNYQ3E3SJC2YSNNJCX
X-MailFrom: ddadap@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFL43RSSYFPKECQNYQ3E3SJC2YSNNJCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Takashi to CC. This is for the hda_acpi driver which was just merged
into the for-next branch in the tiwai/sound tree.

On Thu, May 15, 2025 at 08:32:39AM -0500, Daniel Dadap wrote:
> The new snd_hda_acpi driver in Linux exposes the existing Azalia
> interface to non-PCI devices advertised over ACPI. Add an alias
> to the existing HDA-Intel configuration file so that devices using
> this driver can be discovered properly.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  src/conf/cards/aliases.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/src/conf/cards/aliases.conf b/src/conf/cards/aliases.conf
> index a54824ae..e2d59aa7 100644
> --- a/src/conf/cards/aliases.conf
> +++ b/src/conf/cards/aliases.conf
> @@ -57,6 +57,7 @@ CMI8786 cards.CMI8788
>  CMI8787 cards.CMI8788
>  pistachio cards.pistachio-card
>  VC4-HDMI cards.vc4-hdmi
> +hda-acpi cards.HDA-Intel
>  
>  <confdir:ctl/default.conf>
>  <confdir:pcm/default.conf>
> -- 
> 2.39.5
> 
