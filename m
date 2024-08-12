Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC8A94E762
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 09:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF31C10BE;
	Mon, 12 Aug 2024 09:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF31C10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723446345;
	bh=Dmowx2c0bXCdeWJUcVNHWwAZENBfnHosC85gomICYJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GA3wCRfqRnZAh+BKue+xZ7u81KgKM+Cs8hTPbb44l8nvrGsWIE9LSpvpmy+e8o5L5
	 3HJCqEBsx3sZ26SJ/UmxAzP+XqU2vdJr8nNL0Gh2ynpaaZ+petk2YDELGyy7pCurEN
	 mjkbwI/wOeBlrMzp04N9/OiGvXc2SFHuZOoDIWxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CFBF805AB; Mon, 12 Aug 2024 09:05:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA804F805AE;
	Mon, 12 Aug 2024 09:05:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E37F8047C; Mon, 12 Aug 2024 09:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F1C6F800B0;
	Mon, 12 Aug 2024 08:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1C6F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MI2NcDIF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHsFyttYYpBCoCLXzfC2Wgtgr/1hSHoKv4/UuascllG58XUrEQZJuBoE2LrdZDjZs8g99PHjBRAPlSckxXRJCuLGvV8m6NziEvLNiMx9VKiXp2mKftXiTY7amot7eIHj3R0hGj3hh1KQ2KDpI0BvQRfgRnP2tidmm/a+qvIN6xS5BYtmW7yRIJO3inqAVOQFiDuCsPwlzu5SDPooj1KW2R0UFoqLVDJDUpsY0wJvyB/bGoak84lzQD873Z9g/3b/NyUfQ5p717VKyUNJu938OQcW4QKMweGvsalyUPs3Udath3RRjcZSQ7TyPEIzKh1MM5QRi131JCvq6ap5H6AjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af4PqS+dbLbEx8Jo2fAQubjDxlKXKm9160iy+AK2FcU=;
 b=JrrhIbey9R1G4BQ8XtqsqHG9f04ntibkqKEIGS+neo6KluXz0D2Th9ORH8zQmfvDyW6/VyK95rFFEzrGYpw8PxW4TeslpowCAPqflmkwrshSZWM/hlh7KPZBd2DubctsOqp4OxkF0S7ne5B1Zl79T9/KF2O8AMYu9cB4uYcdqwMUXpAPJwqxGpeaRI0/DmaztraypmZWJybE3vGRYB5n8Ehs60Ttch1ZqPjVDkotlzXAj8B+1Bsy1BaeeYNv6DfvQrwUfQFgCfv81vbKikfKxB2aBja6SSJAp1iUY3LAPpJumZjwc2WLt5WGH4+YsrBS0RTR2Drdg3DBZTwrACt4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af4PqS+dbLbEx8Jo2fAQubjDxlKXKm9160iy+AK2FcU=;
 b=MI2NcDIFZ+gWe/9PmGwGNBH5zVnMufP8ZeRG22SmGvOXpV9H9sBGusYXPD/wSaPUuHaSNgVZr/G4+28+EeEQp0axCjZOGlmX2RwQwia8PHDluaR9SBQGh4eV/eEaSODa36EWYTbgteOD9QzSYIzM5VtYQbdpvu36HJLudXwFg5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 06:59:10 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:59:10 +0000
Message-ID: <7ea677c7-cbf6-49ca-8483-95d5a2242337@amd.com>
Date: Mon, 12 Aug 2024 12:29:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/8] AMD SOF stack fixes and improvements
Content-Language: en-US
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com
References: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0133.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::18) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: f48899fa-76e2-4d60-91ca-08dcba9c441d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REpnRVZoTjdqTmpzVjBYckxqa2NPd2NEd1pFYzVCdnQ1Vlo0U0wrU2RlZS9q?=
 =?utf-8?B?bWE0WU1zQmRlYzlxaHE0d2hnM2R0UGNVSVNqYVVNNTBlTW9sSTJJaFY5Ny9l?=
 =?utf-8?B?WndsZjdDbko3RGdnOXNEVzVuWGdjaE1GeWo2Z2xEcHBxMTFPWEwyZWp5bjRT?=
 =?utf-8?B?QWVNMHVnaHlvZGpOVEFiVEFTb1BYTG5aL1AxbWxsdGVLOFQvYmp5YzJjSFlx?=
 =?utf-8?B?dU9oT3VDY1NLNzRWTTBkWFhFZTZYNWxqVlg3WStxN3EwWjZDR2xqZjJQN2xG?=
 =?utf-8?B?RnpkKy9BdnJnOG5hWkRwbjhRcTliaTFyWGJ2Si9EK1JWSXhYK0VzemlONlRu?=
 =?utf-8?B?TDdXUkFBNEI1aHRoOVJ3SU0yY0QwdGVFVHhlakFtQUk1Q05zWHdsMGNvT21s?=
 =?utf-8?B?Z0xSdGxkRlJQTHo2dU1MUjcrWHFVaVFNZDhQbWJBTFZlWXRPQW9Qb01yL1Y2?=
 =?utf-8?B?ZEZVWkVvM1hiT1dzNnR5SDhzaHMxWHU1dnV5YmV1OU9zekttYytLeUZTekk3?=
 =?utf-8?B?SzNRUWs1OEsvOXY2eUVSU3NMU3liUVZDRjhyM2Eyc0kzR0c4NEJUWGRLeWY3?=
 =?utf-8?B?TFVKOHM2ZEF3cnJraGFTMDBRU1VRbmV3ekw3T1NsZEkyM2tkOWZaUEpXQ0wy?=
 =?utf-8?B?Q0VsZEpELzZ2ZlBDQkhJY0k3OGI3eGpNTWh4UDlPWXJxcittMk5TOTdZem5s?=
 =?utf-8?B?K0svSmxzZ3p0MmZEMERWVUF1M3BjMlJ4Z29ETWFLR1FtYjljWkJXa1NFZVRK?=
 =?utf-8?B?aVNVb0x5M2h2ME94R3lZNUcxT2ZIUzQ3dFh4b2hPbVREQkQ4dGpTVEMvYzJC?=
 =?utf-8?B?YjNlRG1ZUE16cWsrUGVPZVpKZzNWUSthUGIweVloNE5UVFNqYlBIVnEzbmVx?=
 =?utf-8?B?WTFkM3FZR3FYSEVvcnNJRHB6akprY0ZxVjdRSjB3Mk5GQkhkNHYydnZ6ajF1?=
 =?utf-8?B?R00weTRTanVXS3B6TUhjZzQ3M2hJMlJmY0RCMnhEc3ljbmxTcHhUaHY5ZEUv?=
 =?utf-8?B?M0hkMUF5WkNxTy9mWmtjQUFIZ3ZJMC9lV0NNNGVhREFvamxFbDV6WHd1SFpB?=
 =?utf-8?B?eFl1UStzYlNYTDRiMFhRQWlhSmk2ZXYxaEdrM2hqUHBqeElzdW1RcFRjRnVJ?=
 =?utf-8?B?dnVwdHRjU3BSTVlDQWN5OUdQc0xxVjl6Mm1RMlBTeXZOR3lxZ2hiTkRiVmRJ?=
 =?utf-8?B?ZWhLZTZQNUljc3BvQTUxWStMUzdyRjM4TEc3YXdSTnFOQVRUUDFYU1FCS0pT?=
 =?utf-8?B?SjBnQm9RcWJSbVlMUHIvZTJtdTBPVmNjTy9tK0t2QVdqTlZtWlhld1NQUEdk?=
 =?utf-8?B?RVN6dWRITy93T1UvTTJyOG1oNHJNeS9PTTMwdm1ydWozc2VMT1NTcnlnalQ4?=
 =?utf-8?B?dzh2NUdIckgvcysrN0hRazNpWWxTY0t2Yy9uZCtuWmRUN3NSbkhKc2hPWURC?=
 =?utf-8?B?Z1huOTBuSm4zRjZwVndFRDkrTXlsRm5heS9RcE1NbHV4bmFiZWR0UVh5T2NL?=
 =?utf-8?B?a0R2dmxSdW1JdHlsVHZ3Z2J2RDhCWXc5SkRLYnQwdGlMVFhZbklXcmVIelBw?=
 =?utf-8?B?MGlyMWxjYzU4R3ZoSnVjbGtYdGtSUWJwQzhMRlhTSXgrYXVBNElmVmQ2MCtm?=
 =?utf-8?B?anozclZOOE1sekF6ZFVUQmlxZjl2KzZhZUtpL2Y4SUY4S2ZTKzhEUitqazd0?=
 =?utf-8?Q?qk4KdOIx2J2plC7wZHLr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTI3SjNMV2swalRTOGZBUGsvUkJJWE1Ha2tiWW5zU3o2akFGcUhEVGtMRVgw?=
 =?utf-8?B?R3hRekF2VENzbmRmU3orTjBQeDJRU3pCTkdaVWpRajlLTTZpUmRBT3pLckh4?=
 =?utf-8?B?U2JpdFpkdlFxWHZXNE1DY1I1eXpFQlM5Y1E5cnVYL2lvSDY1N0dFeStJNVdv?=
 =?utf-8?B?Ym90b0VlVTg2UFJydTlxUldaMTFWaUFpajY0aDVuOERGUUpaajdGQzBGVDZa?=
 =?utf-8?B?LzArMkxibkhEQ2FyRUJkaEFDNkZqUkxLZUtxNEh2bFdJc1dNUWxvN3lFNEdO?=
 =?utf-8?B?MGhiNW9NM3hvN3lDbVdJeGFzd21TdmFNSzhkT1pMVHFIZ0U5bTFiUDNUVk0v?=
 =?utf-8?B?b204TU8vWFhnWllVWmhjbkNZZXBXSlF0VVJoUkd3TGZsSVZTckJzZnZMODhx?=
 =?utf-8?B?Ym5ibkhJSEFIcXhQQk5MT1loVUl4cnpaZHNrTUwrYlU5QTgzUHVPVmppU2ZS?=
 =?utf-8?B?YXBhSkJKbnBSMmJGb2MxNEFGT0JLbUh3QlNsVHI5ei9nUkY0MUdFNng1MDJU?=
 =?utf-8?B?VGF4ZFZ5TXdwYmZqMitNYnVRK2FCMUUwQzhtb2s1Sk1Rd1ZlMXd4R1lrd0F2?=
 =?utf-8?B?aTgyd09ORmV5Z0Z0RWErL3NBbFJTQjJEd29VTlkxcG16OTBlaHFoNVUveVB1?=
 =?utf-8?B?Y3UxTnpaNGtETzd3bHoxMmxSaUlvbTJZaFZjQnFEczJHamVTZEVpY0l2bEcy?=
 =?utf-8?B?akdmUGtqTjdJaVpiemZEaXlaMWIwTGRXajlYck9BRGlKN1N2NEdwNmpoaC8y?=
 =?utf-8?B?VzFkeS9yZ2pJdVREb3V2L2RFcVBlQmNHVnYxWWZ1ckljQjlKb1RmN2w2UHZB?=
 =?utf-8?B?UHBObWRJSXg4eUtsdmJhNEo4U2ltK0ZNVklpaTBaZks3bSt4SkU4ZnN3d1Iw?=
 =?utf-8?B?eWgxZEFUZnkwM20wVlFVekpsNEtkYlZ0ZjAxVVA3eVFTOHdYck4rTzNKdEhq?=
 =?utf-8?B?Q2NQbkdxYS9VNnJodTBKZmpub29vMVVDS3hxOWh1dWo5NVVLdVJrM3N3UEwz?=
 =?utf-8?B?ek43OWkvdWc3VXhaL0FVbW1HdXVxZGFkekxTMmZGYklmNWptbU0vMHdFd29h?=
 =?utf-8?B?bGlub3J6NEE0M1NGWGNXY1l0L3IxcWlZNzhaV0ZxWGh5UW55dkl5UDBKcXRF?=
 =?utf-8?B?dGhaWVNvWU9xR1dhOC9raDVPWlo3c2RMeHNIWElzamxsSVlkNTA0TzVyUHF1?=
 =?utf-8?B?bHNuemxDc2xpZisxU2duWFBuV2FKc3poWnpDbEQ0UnZBcUdLU3VyTDk1WWxJ?=
 =?utf-8?B?eGo3QTh5Z0FtcnVUS2NkQ25CTFRzLzJWaW52cFl3blVaNktxTlpaSG1aR1JH?=
 =?utf-8?B?L3B6SjR1SjcyUFV6K0U1czR4M0VQQjRmWGswM2FQTXVBWWlSVUc3bGVIZ3Ez?=
 =?utf-8?B?eHBEcSs2TEMrWS9wY1JMejVzZGozcnR0OTR0eHJUY0pLRFI2WVVXWHYvNHFh?=
 =?utf-8?B?ejlDN2VEZi83SGZDUXNqRUZWT1pyeGF2aHhmUndXaTMzSWpMWnhSV0NNOWtT?=
 =?utf-8?B?WlFmNnl2V0EzQ3cvZU1kM3BBTitDZTVKT3VMYng5NlF6WDZWaG9JU1lwRUtU?=
 =?utf-8?B?Z0s5T28vSG9OOS9QOXVJZ1VFd2dhYnpLaXlud3JuM3dNbEJyM21DNUNMS0Jp?=
 =?utf-8?B?MUJET0Q5eFZyY0ZOQUJCcUF0NHFrTCswUGhOYms5cUg1a1FReGluVzFkUGZB?=
 =?utf-8?B?RTVuc1pDNjBNSFdlcFhIOHhxb29CSUErbmdZUUR6OTgvTHoxTnBZeUFxVExa?=
 =?utf-8?B?TlY3UlkrUStPU05NRXhNQ01XTG92cStxVlNPV3dEeFcwdnR5aUpKcmttZGRX?=
 =?utf-8?B?SVdsbFptVkdtWFFsbWJKazY5dFVMRzZMclNFZEJrRElicUlBQXp1N1FCV0l4?=
 =?utf-8?B?NWRIUmdMWVZIb0Jhb3lzUXhCaWdBdm56NHhESUVqRVdvRWNCYzN6ellyN3dm?=
 =?utf-8?B?QmxHOS9EZzVIYXRnd1NqbTRtYzEyL0RTeDFQOURCblB3dm96LzdwMlV4N0JX?=
 =?utf-8?B?MWhvRWViTlM2WnFSNTFTcU9qTEc1Zk0rZjNzYWNmY254ejdCYzVpUDFock43?=
 =?utf-8?B?YlZpWHFySVp5MjRqS1BXRTJkZHl0T29CT0FWSXRSU0NXek12L0ZGVWQyRzVN?=
 =?utf-8?Q?ffnL32PhurSahsJVsfmCELEvS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f48899fa-76e2-4d60-91ca-08dcba9c441d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:59:10.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5n8+Szcdoa+TJriq39s9TQqodEdT7QKqrsIBKIsAPxE0nwCPGX+FwbP0nimVU37tpdRGhKQFltHqWZhgjOT+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
Message-ID-Hash: N6JEQEE773TCCAXANFU6KWV5IFB7XTPV
X-Message-ID-Hash: N6JEQEE773TCCAXANFU6KWV5IFB7XTPV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6JEQEE773TCCAXANFU6KWV5IFB7XTPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/08/24 22:27, Vijendar Mukunda wrote:
> This patch series consists of few fixes and improvments for AMD SOF
> stack.
>
> Link: https://github.com/thesofproject/linux/pull/5103
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Please ignore this patch series. Will split out fixes and refactoring
patches (which has patch dependencies) and will send it
separately.
>
> Vijendar Mukunda (8):
>   ASoC: SOF: amd: Fix for incorrect acp error satus register offset
>   ASoC: SOF: amd: fix for acp error reason registers wrong offset
>   ASoC: SOF: amd: move iram-dram fence register programming sequence
>   ASoC: SOF: amd: fix for acp init sequence
>   ASoC: SOF: amd: update conditional check for cache register update
>   ASoC: SOF: amd: modify psp send command conditional checks
>   ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
>   ASoC: amd: acp: Convert comma to semicolon
>
>  sound/soc/amd/acp/acp-sdw-sof-mach.c |  6 +--
>  sound/soc/sof/amd/acp-dsp-offset.h   |  6 ++-
>  sound/soc/sof/amd/acp-loader.c       |  2 +-
>  sound/soc/sof/amd/acp.c              | 59 ++++++++++++++++++----------
>  sound/soc/sof/amd/acp.h              | 10 +++--
>  sound/soc/sof/amd/pci-acp63.c        |  3 +-
>  sound/soc/sof/amd/pci-rmb.c          |  3 +-
>  sound/soc/sof/amd/pci-rn.c           |  3 +-
>  sound/soc/sof/amd/pci-vangogh.c      |  1 -
>  9 files changed, 60 insertions(+), 33 deletions(-)
>

