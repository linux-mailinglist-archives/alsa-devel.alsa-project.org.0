Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2B7AB8B7D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 17:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C68F601D5;
	Thu, 15 May 2025 17:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C68F601D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747324339;
	bh=S6ltgaRjL0K8b8O9zf0dZSH9cyShD+drA3UCYiAZ0q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjWT/vDc1mmsG9VPNEdPG9NIyQrwzzy696kNR3S0oz7YiMXkzfFi+Oi3997KfBm3V
	 BgglkzDQZsgi/UXJTzlF4vd+6pE0T+Kf1QMZic8zi+lNcYcDNwfDF2UZDuovVEZcwW
	 khezxaP0o8R/511txuIUfOu7nPpZy3bs9U0gVVDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD94F80171; Thu, 15 May 2025 17:51:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1BA5F80149;
	Thu, 15 May 2025 17:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C37F80075; Thu, 15 May 2025 17:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE0E0F8003A
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 17:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0E0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=OCH1hRdp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=td33pUx7eMlzFG+ixcpkrnBU+VMA96K2C6Jr8qEvtMs6bY5K8tErEEKiRgSo8rCuDG/ZLO9ozODdB2uSME/2TvSJ6mwx7a4odQNG1FSnNPmU1x3K8ei7ODwhflTqPO57LXef0xiql3+EhPqnA+SQm3GjizTlq/xrnGgzDxvAA6xgvcsTct/jm0tEyniB7ptTvt0PImx+M+K1aMa/20QKT0FYPGCCj1T8hD3rkEeQEtaaSUMXP/AeFAKG5YAQ39xaowfEW75OFtXZrcosY0+4S7tV4ji02C5l6IZerfSOIbIuJgCrByesSSZzbjQsYI8qdIT6dsUWQZpPSLiKK0AfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7sVu+sWBrfJ1G9iT6FnZtCBw20BObtmD9SMvWWjPF4=;
 b=nsGeIxNBFHx7079aEL3nXzuc3+clMf0USnudX+xaC3PnQrwDAubHGhov+7Zz3CzjREByDL738QMPswvLgs9Hncn647JWKaeWRPJumutKXuvOMWgacu+n85Y/tpMHk11HckLXTcAttxnroQ3S7BZWLNLKZABhojn8Dd3DKeimIYZVR1keSMAOEd9U8pn1HxYFJGWmRnP812Njt/EztcuX7dISKWOtw9nxU+uwLFoJElQEUEXaNDc2CUI1YYXr/Nabp1qN1RnGgPSqr2YPaSb5LVGE/YAoW7cSNxcJwdrTuE9FZaRTBLTCaO43aBHwpm+VVSkaB1JGu3u/j59kzJj0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7sVu+sWBrfJ1G9iT6FnZtCBw20BObtmD9SMvWWjPF4=;
 b=OCH1hRdpTGxo+8ZsfYG7+zmX2kc7H0C9eWd6KSCidaquz+EyqUnp4C64lHHSzmOqiXAiJokqRNXkwgRPAk+dhtsof1qswvczYNNJFABktK/fPyKCmmUF+UwxwJudtHBg4hu6KcjdpyJFVIZRBKbE+PJmmbgVFeLsEIkUt34Qig6brSpe373gfw1dbSQG1cCy3HIQhImK1i8In0vYIbPTJc2XTOgJkYL0a0IAfVBQo1O0S71fs/v8wSSk4PaTrSWMBRL4nwFFWjBzl0m0Z6z7y4Z2JhMx31NVfMfOsDJqJDmLZAS3INqsGYgRbdADoKQnq/CLyg9G+1vhUU28REnjsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 15:51:37 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:51:36 +0000
Date: Thu, 15 May 2025 10:51:33 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
Message-ID: <aCYNhbh54tiVDwUH@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <87o6vtylem.wl-tiwai@suse.de>
 <aCYM9v7QP8IwLj5Q@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYM9v7QP8IwLj5Q@ddadap-lakeline.nvidia.com>
X-ClientProxiedBy: PH8PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::28) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e8b612-0fa7-4a3d-7fd5-08dd93c85fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4epEXGc1o8FBA4lGpENDsqjgI5DKMExEuZoWbJ8AKyMqbXpAw51RCnyIi8tw?=
 =?us-ascii?Q?SlmMFiisxSvy2/1mxoPOXb+l+fNF2qbZxzfKACG/u2g+vjeqIFTz9+5MTeik?=
 =?us-ascii?Q?EasBRScu+d5zOPNH1gObtfPRRWSSJCxsvJRZ7vZj7ZFeAi8mmV7NdKRp9nU6?=
 =?us-ascii?Q?EcR5vjnm5sms0QYUrAbllAC0HYnXGCvss4/b7LjdpmNdTEpVe+/S8SLbTn80?=
 =?us-ascii?Q?S9tA5clzzSEPrJnVNurpN5DNQ9nCbzcSFA4vlHweC4E7uUuaO+2u9TzVvR/m?=
 =?us-ascii?Q?xOWLgfnTUFPwshYoNui7+kFk3NrDMeyVDJvhEZAREIHlSPeRQTKciidjQGNU?=
 =?us-ascii?Q?t/3UW6RwzwXDPaCloIL2wiX0YqShu1VOyaoPJJxbcDGUC1J6EgdUFBg9wsfc?=
 =?us-ascii?Q?rigtjEpcpRePnIlqM3FJrAOoqEQs4uR9BeSXPqpWq77lo4LVkhLjuUB+T6Vd?=
 =?us-ascii?Q?qr1WqIaaz0qpuCASxN8L2xUjcOi2OH7BJtwUw5l4QBKI8H8TTbLfqXwdIMPt?=
 =?us-ascii?Q?EgGpVehyd2L1G5dB8OrnjSu7G9EzHpkVwcxNpboIW76YfwFLs1HqKBbV5ANm?=
 =?us-ascii?Q?bTodePdxmTslye5+X9huRCLGZ+eItnLnCrCu303b/56HNWyBbFKa4Z/w725P?=
 =?us-ascii?Q?paJtfXJMdPBteY45+ekBTu7y/TpqexYaH82aO5CDDmXOvlUHJXzhDuvcFpmH?=
 =?us-ascii?Q?Ltz+Vq3K3Q+t9WzYvfrTlAfWJf851Qmb8dbwCRRnl4d6uo/gaD7xJAncorFA?=
 =?us-ascii?Q?dQDX6NrdttvS0nVhZhsEkY70KjjyczhmIciGIk/tnOwvcJhpY/NH16FytTef?=
 =?us-ascii?Q?9YXNnO4SUoI2oymvUVqTXcDqX4VZP3mRQddqO39UasTxE5Hi7RglbtnD4Luk?=
 =?us-ascii?Q?n+KzrzLJQ4TRRGUeEPXafwOiVkmheHEOMJsBOMJweII+eB4K7zZdKzOddde5?=
 =?us-ascii?Q?6hAzmSYlYpg8gR7mfk70d3Fh5eh5ND2SLFqDpcGTjDAJVeZDtVW/bwk/Vh7Z?=
 =?us-ascii?Q?/Tn/hyQdsZ7kxl5gX+KBE7vPDFSmBoRK+NJtGVPs/5h8F2nBYkhn8MTqI9EM?=
 =?us-ascii?Q?+KXux5yiKRrb0Q5wCUtU+Pzk/+IdipdFYG/csl0kjIzg7IKcON7thVgJbs1M?=
 =?us-ascii?Q?FEuWWFc2ndLj4zI4Fx4VUyGBYk02W3ZjIwD6GO43q60a2B4FBMbrEg9M559U?=
 =?us-ascii?Q?YjXN3OdQfOLD/xJwb18NQnECJQecpi8oGQaJNJoBULSOp+xexD9AeXvQ+iSO?=
 =?us-ascii?Q?kKW0l+Va3spQnXzDKShhsd+zZ08NJCXbBTmpHcoDxVgEc/KsszwwJCb/+TGf?=
 =?us-ascii?Q?IJ2Kts4ziu/+Qyz5GpF0CUVfJSEiyRESp7dFMX+79t8Y8rMZZivij4WFbfSa?=
 =?us-ascii?Q?T7QrAYIboYC4xseWkj02XJXF0uB0SuYMx714bIlaLMOWyvw7Bdga5NhHH9KK?=
 =?us-ascii?Q?k/UP6Zex5Qc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q0DrsR+7KZli+Y1Oh8Om8SqzQ59R3rf4O/ZNWkTyjZOnCPVeEXYVWYRi4AXh?=
 =?us-ascii?Q?R0MLH9TVrxM+PRLjpDrcAGMpyynFcQ5VyphzboGw5DgN+9xQA9g5S4eX/eW5?=
 =?us-ascii?Q?m7fbNdHfXLJcntfWPD55VhN8p9FDhUi9FK4JGRL91LlPIc8XMM5vIG4DDugg?=
 =?us-ascii?Q?eK+UUXjYsRMBpnHJm8KrrSLss//H0n1kbvGL2RqUPIGrThk6AzlvSb0rEPN6?=
 =?us-ascii?Q?/5T8RozXPDiM55pk1y2w0exXMZY2wpAix4HfAaoc4uvoY9dHT/6ObtyquAyo?=
 =?us-ascii?Q?cuwv2FwJFPC98ah5F7iwdJ05pxYtd96gAYwpUZ2cYqGQnzg8inhOz6euzkXj?=
 =?us-ascii?Q?aE0fIkr2tSwQPrkn0KL+JkDhAnrDN/jdQ9gvLSnRISuVLzEUGnM9ZWshDL6A?=
 =?us-ascii?Q?LLKKf1qx+xT2d2+efoppjHypPO+8L53LBcfWEPeeF8s4YXuGwnURu8fi7uYS?=
 =?us-ascii?Q?Fc7D5ze0jEbnJTjXR5orlTPNAP+nXzKnAhQftgMHQWS9yneyoMkDTZ6lJ7EK?=
 =?us-ascii?Q?2FknOV8nSTm46gx1x8uf7ySvxO0fdqHnVKttCqcm1wJXFjwflgBemBbG81JS?=
 =?us-ascii?Q?B9rtHpY+0WTp1chtxlq5grNgabxhqN112vvXTRsFRocXKh8+KLXChzpWBUYW?=
 =?us-ascii?Q?D6y7k7UPFiir8LaFzAchSWYZipWPl+ViSwnBkOKyvexHa0+yZZ5qdXwSXQhp?=
 =?us-ascii?Q?vOSV6z33MuQaqzS0pA7rncGpUqgJ3aTcdov894/2qbfxDmUiAcIAmmZvhvMs?=
 =?us-ascii?Q?fdsLNZhvCZwxmmPceHSaRXohh94sHAzzI3nirnlNYrUqXO+CWeoZXGnGyvcy?=
 =?us-ascii?Q?xKilND74RyqFbV5AbJaPSsNCwJGoVY4p25hdQqhRStc4f13hEAF6xjK/UIDr?=
 =?us-ascii?Q?rCnl2K+pI0dO9H3EUPNRvJbMvS5C/ENl5Khi0UfwfxIMHyM+QpC4Q8P0gYzw?=
 =?us-ascii?Q?sUzKczpclSXdNSxuIPOCjT6C50vtfPvRzwpHmvXUuBr80qxXpr+IAleO3XGH?=
 =?us-ascii?Q?JBqnYiY/7ANRMNflzkqGaiUHpf2xaJgupqjVUBT9WBVimqzJgCRjaczLTgJ+?=
 =?us-ascii?Q?gmKKajhOdeDpcF5qg/QXyxgPJTL6bfz2lcKb6mF9D4Wls8X4Ko58lmED2SYo?=
 =?us-ascii?Q?ta4JlMKmjdzkEVqyqZPN0K/dkjf9bAPLN/z7CW+WeroVdtghq8n43dY+rVFI?=
 =?us-ascii?Q?pCWWIsoRBjoX3SOIHJGXZkbAtZDrjNwigfx67L5W8dhyBlJyJBh5y6+Dod18?=
 =?us-ascii?Q?ZfwhJzRaR1DGVQFwjI73yXgTDRhux5UpJopJdyzdWgl5knNpMV9jbTHejCj2?=
 =?us-ascii?Q?2960i23CMybRk9ua62uNZXSVDoucocgrxdF3qDRG4peHl8WKxta2V80ReITd?=
 =?us-ascii?Q?3xgRgpeFeQyp3Ht3rb/zL9C6UqBzUMHZugVYgC2QAY70lAgnjhgdjhy78nJg?=
 =?us-ascii?Q?75ID5DMeLdH396ccxJu8xRgCz0DFD9k6IdpklqsS9HWpLJM00EC0Pax9DWiZ?=
 =?us-ascii?Q?23DtmVM+LUKfjVC7KrlGyQIXEhegITG7kvoMMUkRwX9wyYe1WKiukOmZ8Ajv?=
 =?us-ascii?Q?xUyiYCiL2Hc0D40ZhI6E6CFr1wXGvS/HuGpBRbjp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4e8b612-0fa7-4a3d-7fd5-08dd93c85fdc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:51:36.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GRtNtZQCdbzRWtDaYKvpBXEXocDkSPbMtP7GlfWq7FHwkGGQ3culUYuqdHex6SnpzAOh4DOM7QZiYPue7Fnr9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880
Message-ID-Hash: IE2JRFBRIZDSEWPGOZCYXC7AZTYJ24YG
X-Message-ID-Hash: IE2JRFBRIZDSEWPGOZCYXC7AZTYJ24YG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IE2JRFBRIZDSEWPGOZCYXC7AZTYJ24YG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 15, 2025 at 10:49:13AM -0500, Daniel Dadap wrote:
> On Thu, May 15, 2025 at 04:54:25PM +0200, Takashi Iwai wrote:
> > On Thu, 15 May 2025 16:45:52 +0200,
> > Takashi Iwai wrote:
> > > 
> > > On Thu, 15 May 2025 15:31:46 +0200,
> > > Daniel Dadap wrote:
> > > > 
> > > > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > > > which encapsulate the controller's interrupt and the base address for the
> > > > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > > > table dump excerpt:
> > > > 
> > > >         Device (HDA0)
> > > >         {
> > > >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> > > >             ...
> > > >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > >             {
> > > >                 Memory32Fixed (ReadWrite,
> > > >                     0x36078000,         // Address Base
> > > >                     0x00008000,         // Address Length
> > > >                     )
> > > >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> > > >                 {
> > > >                     0x0000021E,
> > > >                 }
> > > >             })
> > > >         }
> > > > 
> > > > Add support for HDA controllers discovered through ACPI, including support
> > > > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > > > is done with a new driver which uses existing infrastructure for extracting
> > > > resource information from _CRS objects and plumbs the parsed resource
> > > > information through to the existing HDA infrastructure to enable HD-Audio
> > > > functionality on such devices.
> > > > 
> > > > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > > > which are not actually enumerated on the PCI bus. This is because it depends
> > > > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > > > PCI-based devices.
> > > > 
> > > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > > 
> > > Thanks for the patch.
> > > The code looks fine.  Just a nitpicking:
> > > 
> > > > +static int __maybe_unused hda_acpi_suspend(struct device *dev)
> > > ....
> > > > +static int __maybe_unused hda_acpi_resume(struct device *dev)
> > > 
> > > The __maybe_unused is superfluous when you set up
> > > SYSTEM_SLEEP_PM_OPS() macro instead in the below:
> > > 
> > > > +static const struct dev_pm_ops hda_acpi_pm = {
> > > > +	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
> > 
> > Also, at the next time, please put the maintainer (me) to Cc.
> >
> 
> Sure, already sent it with you on To: as a reply to the last message. I was
> wrong about hda_tegra having __maybe_unused, you already cleaned that up.

Oops, sorry for the churn, I did not notice the difference between the
SYSTEM_SLEEP_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() macros. I think I got
it right, now.

>  
> > 
> > thanks,
> > 
> > Takashi
