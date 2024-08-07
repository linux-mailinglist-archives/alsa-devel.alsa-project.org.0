Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3528949FBE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 08:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7060B14F2;
	Wed,  7 Aug 2024 08:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7060B14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723011810;
	bh=btxL+X1g0tC80zz3l1W+jRfLXbYPaYlCqnAQ6WMKApE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BL8ab82EH0UzWxLa2NQ3DF3xJZSxfj5EAVUDMt0nbXQ6Vy4vjOa3AW+3tyMG7ImjN
	 Ead77BFJnrhuvZ+yIKHKnDBQxo8By4rBbRodbNcuOba+Udu3IZ9ZuGTT8zqz0plGXr
	 Y03TrFNaEeBxkrmYXtsl00paULx90BlgRbEUdeBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20730F8049C; Wed,  7 Aug 2024 08:22:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C226F805A8;
	Wed,  7 Aug 2024 08:22:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8FCF802DB; Wed,  7 Aug 2024 08:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B7EF800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 08:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B7EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=grCCB0go
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk/HTnRYfKkQQxm4NocvvJL91WKBqzjjMwBILX9TFRfuVPCVSXNayL7YEs0n7GnmzmYYETchzQZpNu5v/zAJE0hYwjZDWLwZs+CU5TAszaAYtp/uDftxQxgEN2FNczqbn/FLkn5uQcYU2sg7mwPdwsWq+KLtMCi8fYzySWu0Epbyx6Mov6xoYWXoguKbKj7Jpd0QEtwyf5lT2WwyX7J5fWC6H40ykWBVj94hAj4RCh0CXeMEp8NQnEegqfsC2xM0sY9yJQHslI8UoOyNWrIfvVXlAlRJdffDr2FyX29L3xUh8hIPDQCqRVs+ev+oKX8M19MbtIZk6K2H70ze5nFIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btxL+X1g0tC80zz3l1W+jRfLXbYPaYlCqnAQ6WMKApE=;
 b=IoPytwPEagytc2RCu+vr85bDqX8HKLsYaVa7+FJSnZHxp9d1bipBOchZRxpJ8pWcmkEv1L5f324G3pNKL8xJaGP9+tMvw3AFs5NLeyN+Uh+IXSK+PRKVVQBqkXwyhSJEjhABAYLT+UW8qxVBpaZ+hNEajpHU19msMpoY9mHg1a+0eFaqqd8z1oLB+/4XgM7MxqnbTlEUh0cOFAUkoiQ8fWTLRflRztdBZUeUGA5Icjpyly5kaQv4Z3EaEvRd3GnAjQUSp5caZ8C0h7qe2JnYJoYgrodH+9weGq1YFE3/kfeZf7SChovC0/s3F/38EJdiEXJy4E0CEAKFmXP+bK71TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btxL+X1g0tC80zz3l1W+jRfLXbYPaYlCqnAQ6WMKApE=;
 b=grCCB0gorJMUA+qPNPt5fw1j+Lb0XOlJDE4HoP+uxvkq99EIMBiAqHGFu0z3SKrd3i0OF8ZHW0Fl6WtCqeprVVnQpXXI4i4ctlA7bDJUItVAPNpBwWNWDD3CrLPYUIFGYXYeo+oCSjnaILi5C6r6hOEFgp51s09XQpR/vAV540I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 06:19:45 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 06:19:45 +0000
Message-ID: <cb7140d4-5a86-4948-a374-07a31637b18a@amd.com>
Date: Wed, 7 Aug 2024 11:49:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: remove MODULE_ALIAS for SoundWire machine
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240807050846.1616725-1-Vijendar.Mukunda@amd.com>
 <7078532f-ac07-48e7-8123-2577b7216a1e@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <7078532f-ac07-48e7-8123-2577b7216a1e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::35) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: da56600f-e060-4708-32ea-08dcb6a8ee4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QitXY01RQzJUTjI2V3BwN3VNWjM1WW1SaGZLNlFpaXAvaCs4azhaSWpyVE5E?=
 =?utf-8?B?RXVzWjlJOXpQWVlhcWtTRjVtbDQrbzZaMkxjSHdpZ2YvclpsSmFCaXVPQXV3?=
 =?utf-8?B?MVNOQkJBaHRha25td2YyWXlSZDdRVlljUXJZVHRTMHJOK2pBOUxpSGhydkk3?=
 =?utf-8?B?Z2RSRmQ3SjlicTErdUw2bG5JZzRxeWZ1Z0NpRTRXM1pxd0hVL3pQNkdBSjBq?=
 =?utf-8?B?VUNYeXRSQm5mS21vS0dwQmtkaVpxWUNVV0hVQm1rWlZBUUhaQmpNajRycita?=
 =?utf-8?B?WVFRS00vaFU4anIzdXBBYkpCNVNhN21oMERPVmRuZXRHa1ZGa3V5Q0dwVXVJ?=
 =?utf-8?B?SGhuT0ZVTFlwODMyTDlUaWN0TzZ3ZDJnNDJSTnY2OXZUMnpaR1V0ZXZsclBX?=
 =?utf-8?B?cndRdG04TWlIS243RDhyVHBCVVJXUkZCaHhWRVRsM2wwZWlkTnN4M2p4dFVB?=
 =?utf-8?B?bXllcWc1akRNZkRnNXhvTG1LbzBqOEI4NHJmeHd3V2g4NG55aExOc2F6TmIz?=
 =?utf-8?B?SFdnaTkxSCtTWFcwZVhiRUhBeWRUaVJCY25KMnljUHpEZzFCRlYvZFZLNmxo?=
 =?utf-8?B?OWdGOG93eDUvMjQ0a0VYaWdqVWw1OXAvZi9BVzdmU3JKNGd0NlRZU0RpSW5n?=
 =?utf-8?B?MWhHMDZBejI5TTZoUmkwaXhLblJFRUg1SDJOV1ZBbS94WmRwRDR0U3ZKWnEw?=
 =?utf-8?B?Yys2eHQzeFlyL1Fqd2k3ek5LTTVrV0lVUEFWK3Y1QVh1Y3Z1ZVB2YWlMMytl?=
 =?utf-8?B?T3AvRkRJSXJEZm5aQzFJT3JCQnZONmRVK01pN0hCRGZFTXM2aVg4M2dtekZJ?=
 =?utf-8?B?SllDSkwrc1FRMUpvQVBCTXNkNmc2dXVyNEE0QnliTmgxWXZzUE1MZ2JzTE1K?=
 =?utf-8?B?WVcyblpqOW1yWmxiQng1c0M2MUN2TGM0dVFrZjZUdHZoN2diQXpqd3d0WlNj?=
 =?utf-8?B?N2FWcnl4ZmlPeHJhK3lMT2J1aHFWWm9IdlljNHE5R2E4SHVrSVRybURKRnho?=
 =?utf-8?B?a3MvRXpSSDFRdUpabERPcExPTWJQZXZGRFNDc2RXd2VvQ2lQSmloRzNvKzhq?=
 =?utf-8?B?NjVRSi80eGg5L0dKcDVmQzYvT0MxdmJIUkxGZDZFVXQ1ZkEzZllwN3hhOWZL?=
 =?utf-8?B?VFhWRldZWXRzckdCN2c1TFJpTWNONFZDK0dQemxjakhpa0lBenV2QXk4QlpI?=
 =?utf-8?B?RXFUYjJCUUs0cEJETElPd2V4ZUpzT2xVaEZMQ0dhVHlmMFFLY29NZmpjcXhh?=
 =?utf-8?B?Uit5SkRSTlFRUGZ6b0lIQ3Z6TjRoS1h3ekhyZ3llb0ZFcEFuRml6ZmdyR3dR?=
 =?utf-8?B?MEpyaTZ3Wm5vMEVnT2M2SXVUcE5ueks0OStoQTl2K2hKMmJMVTZaUy8wV1Uz?=
 =?utf-8?B?eFA4aDE0aGMxUEF5N1hYcVBlZWZVLzNtMWpiYmdIWTRxWVlZMWFST1VXNTMz?=
 =?utf-8?B?SFJSQmdVZDgrZGdHOXFGdlFEQ09GSWlOL3dQSzUyNFNsS2RZdDZBZEV3S1ps?=
 =?utf-8?B?Tm1PQ2NaVUtET25zeWNvRmkrMzltenRVeC9DM1crUXNYRVlVVUx5dXF6L2kx?=
 =?utf-8?B?Tkt2bTZBSmpXWHMwcGtHTmVpWUZYWkVWcmZ4UGJwYlR0TjV0SG52NTZLTm40?=
 =?utf-8?B?cUpzR0NmRHhGaFcrQUwyUWd2LzB4eGVGUFF2K0lZUncwZ1g5c1dUTk5pQlMv?=
 =?utf-8?B?M3lQQUp2akNNVG1COWFtYkZWa01xTVlXZzNveUpYSnJubm11MGJ5SVlVMEda?=
 =?utf-8?B?UVRTdlRQU2VJOURqTXlZWmI5ckR6STNLbzhmaWJGYlhyYjRabEhZYndmemcv?=
 =?utf-8?B?cGxaMGNFa3NOaVM5c2pXUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bi93OG5NRGp0TVRaZjZGMGtibkZ6cGUwa3pXZXNBbjZNamxGbkp5Nm9XR3dM?=
 =?utf-8?B?eGgvSDlGYmpmNm9GVVhLNmVyaWx4UU50TUpZVUJ3eXpLQ0dpNHBTU2VMMzEy?=
 =?utf-8?B?UzlZQSsxZndXRTE1bW5iRk5wSE5Td0M4VndTQ1JvUTRSR1pvcEp3T1RNR1gx?=
 =?utf-8?B?M0k5aUNKbXYwZ3ZSSEhVOC9pTHFEOWtKWFNBZDBjTkpHQTJ6RnQzZVhoNWxF?=
 =?utf-8?B?dHY3RkIzazdjaWRTUFdjenZ2UDlhcHFlcURjMmxRN1Bydkh6bXNWbCt2V0xm?=
 =?utf-8?B?TVlWampDQ2NrOTJCd21qL2RDRjY0bkN1TFZqcjl3SXg2dEtnV0tURUZzcTZl?=
 =?utf-8?B?S2Evbk0xT0srQlJWYWVucjNicTQrY3h4ZThFZzBUQUpLamNsb2xMZHZ6MEhV?=
 =?utf-8?B?VHRNY2dPTFVENE5lN2c4Vld2QXRxR1JDWkRjcFBtVHZnT3ZUelN2L0RLNjI1?=
 =?utf-8?B?a0JQQTBSbEwyWDNEWWdvd2k1aGtXTmFoQnF6TUFPNTB2Sm9CUjlqd0xlTDNv?=
 =?utf-8?B?K1JNakRrRVRoRDZtY1hBVEZIOVZ3cXBIZkRNTVNCYlMzYWNLMHNTeWdSTk1M?=
 =?utf-8?B?YlMxbm1tdi9CZ0FzV09HZ2pOTDZ2UmdkRXlnVjk4STg3WDNCZENIdXdWMHFH?=
 =?utf-8?B?UU9sb1Y3YlpKWmY0UENxdWxQemhBblk5R1dMdjZuNzlXL3Y3VDFEZXkydnlq?=
 =?utf-8?B?ZGdLNFl6S0tKMlExOUxxRW9vVXdyTDg0THkzRTNHWDF1WTVueVBZc0dCRk54?=
 =?utf-8?B?NjhvcGJ2akwrMzczaDZzRjcxTUVnd1BKZFdkUlk3TkZXR3FjMk9DYkJ1dTRs?=
 =?utf-8?B?bDNnS1pGYk55MTN0MCt4N2R5NkRnM3A4KzFuaDJjWVp0eklYRVVEOStLTXp4?=
 =?utf-8?B?MGJUcUxIN3hEN251UWxxSlRwRHVIZDVMTVFCdVRsOUJrbTZqb3E5b1dPcUJB?=
 =?utf-8?B?Q0xMT3pucDJwOFJTbDRlejYwdlZtMjZjS0J0ZzU0YUtUZDhEMkNhMTB0aE54?=
 =?utf-8?B?M3JTdnp3TWZVYjFOazkyaEpUTWMwT0svMWZnang1T2VvYkkzU1FYOUdkSnNy?=
 =?utf-8?B?Wms4MDhlbXpUajBQRS9abmNEUmtiVGEwT2RHVTR2V1R1a3A1anpJUnN5aG12?=
 =?utf-8?B?R0VVRVA2M08rbis2b00rVVpwa25zaStRTnV3WmY3TXkrTWNWdFRzZnYyb1Ru?=
 =?utf-8?B?alhjMUQxdG05TmxrS3hPak1RR0RGQ0hUalhkaytXMkFub0xYejBDa2c5UC8r?=
 =?utf-8?B?OUdhL2llR0VUUjZVM3RONUQ3NnhMdWhDaG5UaEdCNjB2SHc5ZXE0Lzhkb0Iv?=
 =?utf-8?B?Sng4QVBmM09GNFp3WWpVRTR5bExJTGswVHJIM2xwY3NCRytJaEVOd3RVOTlE?=
 =?utf-8?B?VTY1VHVrWjB0S0toZ3F6RGZGTUJkekNDK1g1dlkveWFhY1dSOGpnejE0cHVs?=
 =?utf-8?B?QzZZeVdoVnd3YnNVWHBROGxReDc2RURuUXgwK1NXMnJ6ZEE1MXI1Y1BaSzZk?=
 =?utf-8?B?Y2diVmZtaEVFRTFMZUN4Zk9iK1ZvSzZPSG15U0JlWVJtODVtUk4zSXBqNUtD?=
 =?utf-8?B?SVpHWVR4ekUrMVVVaWRha3RRZHBJMnlWbEtIMm40N2pxcXhDbUpIdDVXVWFS?=
 =?utf-8?B?T1VBTGE3UDNlVHAyZGJqSEZleHh0UEZPNE1TTVlld0FoVWRpMnNPN2pBNVhn?=
 =?utf-8?B?ZGNNdzJ3OVNXMGQycEhlN0g2T3djMStmWmtCS2RYS0g5a2hteHVBdUFLWEhy?=
 =?utf-8?B?M1pjeENaekR1aC90OTVYUXQyS3huc1pvdndISmF3eEJGVlFma1FpRGpZNjBZ?=
 =?utf-8?B?ZGNxY3lkWU1SeDJqcGg3TC9SWENSTlJXY0NEa1UxeTgvMzdBSUROMGNBb256?=
 =?utf-8?B?djk5NElsaEMzWU1CRE1odi9pZXo1RzZITHRRb28wQjRrUjhLY2k1NlBUR2xn?=
 =?utf-8?B?NitDNmJuMlNXN05mOEZXdHhjajVlbmUyVmdjcDJNeHFpNDBnSnZEdlRTcE90?=
 =?utf-8?B?SXpWMUNQb3pwUTJQSDYyeGxhM1pDMU9xNFI5ZnZsVWhwc1dmWlBYSVQwdTNr?=
 =?utf-8?B?TFVwOUQ0NXVraEdxUS9ML1ZXQklxUy9sSFFaYm5GZ2d1VDBIeEdzcG1PUXpj?=
 =?utf-8?Q?Oj6aT2aE5powUiIveGPfEyn/S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da56600f-e060-4708-32ea-08dcb6a8ee4e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 06:19:45.1731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dZvsyfbIGXAyX5WkwNPiYGagDTUZvRB431Z/ifGIwvhkC4lBeIt3mTTgPxBzQWUXlzETnpZf5W9jhOggVdSFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454
Message-ID-Hash: NYYHTWCBFEILIUWYM7RCIDKHRUA46SVL
X-Message-ID-Hash: NYYHTWCBFEILIUWYM7RCIDKHRUA46SVL
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYYHTWCBFEILIUWYM7RCIDKHRUA46SVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/08/24 11:38, Krzysztof Kozlowski wrote:
> On 07/08/2024 07:08, Vijendar Mukunda wrote:
>> As module device table added for AMD SoundWire machine driver MODULE_ALIAS
>> is not required. Remove MODULE_ALIAS for AMD SoundWire machine driver.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Provide credits to people...
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
It's a miss on my side. Forgot to add suggested-by.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

