Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE45A2C46E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 15:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F3960247;
	Fri,  7 Feb 2025 15:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F3960247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738937035;
	bh=BBzGmhBp6kW5xER5LyPPRiPoQxaSEbmFACb1zaxcj1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oV+et/MKBPLddINCf+yosuK7askV/1STLzqR0U8AvAcSDUznyLleITob0h9HdLoBU
	 wSF0kLkvXynG3Nlj1M9sR/Y1RyNJeY9C2FcFOLK50B73uC3WjsvQJJe421hcLTjjMy
	 D4ucwC8poGgO3UMcEQzkgB5ZiNwUaJCYUNTO1T4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAAEF805C6; Fri,  7 Feb 2025 15:03:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86EB8F8021D;
	Fri,  7 Feb 2025 15:03:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F0D2F8021D; Fri,  7 Feb 2025 15:03:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FF60F800B8
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 15:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FF60F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p3SG8RV+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6SZnhFsmFfNN+i6viqhxw+otAhtkcFqh28ih1w4A7pcv/dg95o2vgZU59hsBs9qtBzFD7kxgybZMi0UhyA2REddS1WpLm4oRdP/vlAMbI3Q7MPQ6XkF0UdUngme22xx7TEmoUn2zIiP6fuX/IOfVclnJfDdhoCNGgrltYRqJBn33W7ryr1RZt/Sz1mHNm9xjJFcaYvjkP2BJTSCM5MTxqXfVr9jmoevQayG0x6v8399JNVsnXx6qbol/yY8K0wYrtR0Y9iNHX3c6iIUJfpqh3uyrAwhBfn7g5T6bHpfWhfZF/kPzpSN7D5YTM7XFPChjs+IG6xQ6tG42Anrs8PIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28FX88uT8Ma7M/z4Nkg9kw/AfHt/u8cRlyBUwe0VIWI=;
 b=orCqeQQTghCERgXakzPMs57ALVDHcPdk+hBC6rU7VTameHx5nzypKgUvSdF/aYWihYFHbCJta0PfiC2PTMxztSI+iM3sxXp62RInDMhK03j9+6pI/EapAzDWHfll4ak9c9I4eaHfOQeIMFAZYVVnTxiUZkRefBHO9w7XAh15Mp3zDcGs/cTy93vWOAG1EymY7QfM02lkxVepgwt+ipLmHVW5yBmUN/R4x74BYqWbacuPUmJRJiGiwAmuYYHU7Yo4RKmaexp+fMWKdzXiH1HEfco7jTcEBk9MqM/vJjSQkRNSAv0i3jaikaBTF/E9un4+LIsV3I6XFG0efkIuALe/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28FX88uT8Ma7M/z4Nkg9kw/AfHt/u8cRlyBUwe0VIWI=;
 b=p3SG8RV+55MHxZncYUI5Uz3Yt48jSsIH74EKypCiEGA5pSMBRHr8cxwC7pX+sVuPB6D2nhX9EzsRK/sbDtRQ+1LGZoPPv/rauIUzK4sqLupuiCEHZ+WPMnEVJlc6d5ZtleCZNFOBDbG78TZxNYwIq7zAPqbHckJvEdoh3eZSLYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 14:03:03 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 14:03:03 +0000
Message-ID: <55a89842-35f3-4dcb-a23f-c07f43124861@amd.com>
Date: Fri, 7 Feb 2025 19:32:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 16/25] ASoC: amd: ps: add soundwire dma interrupts
 handling for ACP7.0 platform
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
 <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
 <a799e6fa-5ef7-4e1b-993e-52555a73f2a8@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <a799e6fa-5ef7-4e1b-993e-52555a73f2a8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::21) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c4ac3e-aa68-4aa6-57cf-08dd4780235f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1RCUFBpVjROODI4dC9TOEh6dnJBR212bk15SDRSL290eHdCd1hHSHNDME44?=
 =?utf-8?B?aUJ2L1EvcFhhZmk2bm5GVG9TSFJOZXVRMVV4NVJZUWFhRzBMa25IdWdmMEww?=
 =?utf-8?B?UTRMUWpnYjcvRnZ4QlVmeERRTTA3Ky85OFYxelo5TXUrVnMyYWgySnBWaU5G?=
 =?utf-8?B?T0JBSmJsVExETFozSFVqOU9DYXkrYmkxcHRmRDI2YXRQS3F6ZWRxWFRJdmN1?=
 =?utf-8?B?c25tT21mNDUwRE5jcXRyN2Vxby9DbnYxU2crZE41aFAyK3JTYlJPZTRYZThR?=
 =?utf-8?B?aXpBNmVVTFNFU2VJUGRoNGZNYUFjdnNSV3loTjdXUlJaMFNGUDJ0ZnB1d3Bk?=
 =?utf-8?B?UHBsakZBMUZqejlDZkNHcUJGM2paY3diNmE0M1BlWFovT1h1RWpkZG1ma2Iz?=
 =?utf-8?B?azNCUDVaeit2aTVXZkJqZ3NHWDEwMWtvYVp6aFdFYUs3UHYzYi95ck1UK2VI?=
 =?utf-8?B?anJUcmJ3bDBObGV2U2dYS2dYUmtPUjhEd3J1dmwvRmpZek5EczZPYS9PRzUw?=
 =?utf-8?B?ZnM3aU80bzNGMnV6cG41WDQyY3kxVzdicjg4cWRuNlltVjJFR3V0Z044TU95?=
 =?utf-8?B?cDVZT1BhMWFlQ3IxT2cvMS9ZZThaQXkrSVZMdDV5cjdTejNGYjdwbVFOZWJS?=
 =?utf-8?B?TVdQb2ZXN3ZrZ09MMTh4UEV4Y0VGMGgyT0U3K1piUlZ0SVBnMEwwK1pzdWdv?=
 =?utf-8?B?NW5paDVJQlh5YzZqd1NVSGpNRXVaUEVLWWFYcjBnaTA3Y0x3WFRNZHQ3NzFB?=
 =?utf-8?B?UE9KY3VjMk41c1dNcDJ5K2pISEVyOXQrbXhPNElNditqdkpVRE1RQUlldmV6?=
 =?utf-8?B?MjFtT1RyMHZEL2l6T0J1M2p3MytWdzJYZlFhU05uQ1E5dzN5Qkc3WVUybkp4?=
 =?utf-8?B?bDd2Z0RUNE04QVlJK3YxNnNET1VWTi8zNnNuMkFRY3E3QWsrWVVzc0RzMGFr?=
 =?utf-8?B?Ui9YQi9IcmFEb2ZyNURZTWVsZ3hua0V5N0RkRGJvKzhLbDRhelhZSTRRVGox?=
 =?utf-8?B?bjNGV0hGZGdpMTJ0MndGbVM1TVNFU3liVHJzUWtYd1p6RmkvWkR4TCtjT0Uz?=
 =?utf-8?B?K05aUE4yazV5Ymp6ZnZVL3ZnYXFtZDVtZ2xZVDZTelhzdnliZGlLQmFCdVFJ?=
 =?utf-8?B?NUM3d2E4SmtDbWNYd1lzbjhQaHRMSTdOSnc1RGg2QzAzcEkxK0YwbVUwSytv?=
 =?utf-8?B?dGNTWlRSUHZTeGNaT3FjMXZMd0pxZUh4VUhscGNWK3FoNUJsc1hyQVJmNGhy?=
 =?utf-8?B?RGRmLzZQejRoOXBHYW5rTmRrWk82TzFkL3g4TWNEdkdaQ3VWQWgrNGExUmhx?=
 =?utf-8?B?WTZkZW9YTldiU0o2RGsrVFNtc1dQWWY5T1VqUHA2MVJkT2JYVzd5cTVJVlpv?=
 =?utf-8?B?Vjk4MDhzUElMZkxjeDVSODZqdnYxWlpPK1IrWVVMR1Fwd0o2NCsvVTlZSFlF?=
 =?utf-8?B?dkdkN1REUEl2THFqdW5RNlVpQjZEWmovU2Q1a0lxT0h6cFdUZjJKYTJET3dp?=
 =?utf-8?B?VmpGR3RqUXBKV0x0a0tiY0E2REZvRzMvY3JSVnJPMWN1bU84U1BxbnVlM0xN?=
 =?utf-8?B?a0lnbm1vdlUrV2Rram9VYS9McUswU0pvMkNyc3FZV0hEV2FkN0xSYmhmd0dF?=
 =?utf-8?B?bUdRM210b0RrUDRiSWNQUEJHZzljaHRHTjRSc2dYVGVlVFg0dXM1QXF2d2RD?=
 =?utf-8?B?S2F6U2FCenR5WCt2RTFYWFQ4VlJucFJ5c1JFNUwvNkNmZk1KMUtjN1hyZXAy?=
 =?utf-8?B?TVV3L0NqeFUxQzgrRmdUWENGenJMVGhwekVIV1dDVS9iR2hsV2o4OElyZmE1?=
 =?utf-8?B?VkQzV0FKT2w3aGl1c2Y0a0xSNkRyeWIwM2oxWFhpSmQ2dEdUZzdtN2drcjdz?=
 =?utf-8?Q?GO3a4ZpVzEYDe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0VxVks0R3VLL3Q5YnNRVkVLOFZLL0ZZU3RiY3J6a0lySG5lZjdiTUFtVGha?=
 =?utf-8?B?SnRVaEhoNlAzNW1McFFJbFJnbnJ1SEJ6ZGFuV3pMRjlFd3hsVGM5QnhDWDU3?=
 =?utf-8?B?VC9VQk15MVBoS0dxckw5RlFrY25UQlEzSmM4bzE0eXdUWlROMUx3N2xSRHpv?=
 =?utf-8?B?aXN1TFFvSktGbTVuNVFCVkZkbVJQdjBUMlN3cXFBUEFYa0wrelloME9QL1F4?=
 =?utf-8?B?K3FBNW1FWHJaai84RE1DVTI4eDF0eVBCTExSb3RaaWNuVjkwT0tuV0htNlhu?=
 =?utf-8?B?eFVTSzNsazBTSWJwMENYekZvZ0p6UTlCZFpWblAxOWdYcXNVOVNUb1d0ZHZW?=
 =?utf-8?B?NFlrcUZCcmQ4QWh3RUhabnR2T1J2M0VNTTJrdVFhZ1FBaTVHcU9sWTlLRFN1?=
 =?utf-8?B?cWlaZktsRGIzYjhjWFFGdTA4dVBNeTV4NjRLY3UzUUtVbzdMSlBoRmExeUlI?=
 =?utf-8?B?Mkc1bGhzSmRvTStNSllzNStMeHJtUHZoOXQyRlhaS2QyazNwMytqQkM4WFc1?=
 =?utf-8?B?MUV3OXVNcFNTVVRFVDdMZkJiYUsvU2Vnd2h3bmxPbGd2U1o1SUFRL3dmUnlv?=
 =?utf-8?B?aUEvUmxxMWFtbHF4S0U4NjVCVzBiMkJqL0RFYVk5NFo0SE52Uzlva09zNzNj?=
 =?utf-8?B?ZytsYXZtckJBbmQ2NHUzUnNaTThvMUVzS1FhUnZlMjZFa3RzUWtVaDVkQnhm?=
 =?utf-8?B?dEIvU2V2YWNSSndPdTMvQklwdkYrWkxnK01McmlndzBQRTFLZzJTam56blE2?=
 =?utf-8?B?dkNONmVlekhFUmZ1UndSY20vUW1KL1NSZ0NZdzZFWGVJK3FoWHNuTTFSNGRv?=
 =?utf-8?B?RVNiZlByVHFMd3VQdWRhQmFNM3YzemFTSXU1MnJkbm1VY3V5MFhabFJwbXE4?=
 =?utf-8?B?Q1dGTFZlVVVtcnhtVGdnYnJXOVdmVDlHRmJSSS9RdldHeGY0Ym9Cb3dOUDJZ?=
 =?utf-8?B?UllvOXNzVTIzVGI5TW9XWlMwTk5WdVdDUHlVTkx4TkNZNDRyRVNPRDd5RldQ?=
 =?utf-8?B?L2NxVkdXOWtScDFnZVJNVUVQMHJlRVBPYWppMGdWYVM2ejlHb2NkMjdhMUJi?=
 =?utf-8?B?ZnpBSTJDNUdOVmttTTNmazh1OUxNcitxbFJIblU1MWIzd3BsQ0hFRzVyb2xq?=
 =?utf-8?B?OGk5QXR6RDRkOXhxdGc2aStWZmJWRXFZQzhIa1l3WElMbDZOQjhpSGl2WWFi?=
 =?utf-8?B?aEk5dXFIeG9UNklrUit5clA4RXIySEZoaVlOTk1kTGFIRTRNS1J2aUp1cksx?=
 =?utf-8?B?QTdvejZPQ2ZBbkRHa0ZTWWpBV3pKSHdBV2o0TFZQdGZqdEdZSlN3MzlhMklt?=
 =?utf-8?B?eUd3clh6U2gyaGVlTkIwYVpBL1QxazBJakFwZTJxT3FjQmg5ZE1MRlNJaGVq?=
 =?utf-8?B?NVArSzdzajUwaFpJanZOTmVvbkFGWU8zRm1GMEFJWkF3Mm9CbWpqeXcwZkZV?=
 =?utf-8?B?WVp6Rm9HOVdSKy9lNFk4NG9wWmdvWGdDNitTN044ME1mY1hlczlQK2lOYS8y?=
 =?utf-8?B?VU52TndUTGtsWXFkY1dNUjZXWXZFbE1Qa2F5czBEaEFZa3B0SmZrZExvMVRP?=
 =?utf-8?B?RndaZHA5bEFVYzF2bUtqOHhIODl4TmFQMHN6TDJDUUE4UEV0cjhtTlA1cmo2?=
 =?utf-8?B?UWZIMVV4cHlsYzBvQnJKSDZTTU1Gd0FpM3NnWHlOSitDbGlXM3czeDR5S0tE?=
 =?utf-8?B?WkJJd3MrS3hRby9Db1p2UzdiSnMvYUxtNXhCamgxMmQ1NHFnS2RhWmlJUG5X?=
 =?utf-8?B?czFwSEZxa3EwamhzS1lTdTJkWURMR29BbjVmRjNkbjQwcTlXbjl2a20xTnpv?=
 =?utf-8?B?ZGhQTVord0RPUG1lK251NXFpV0pmekdrUlQzRVhkWEJpVzFNQ3FWVHhnYXM1?=
 =?utf-8?B?Si9Mb3Y3ZjZtTmxJeHVTVUdyWWRnd3F5WjJYcW9WcjBXaSs3OCs3RzBGbnA1?=
 =?utf-8?B?UGViclNVYUcvTHVIN1VaV0lQRlM5VHAyYkt2cTVmY21jY0VnRVZuWEZteXZJ?=
 =?utf-8?B?VGtXd1NpV1FwTUVuOVc1bFlKSjdVUEZuNjMzWmRCcytNSTBJT3BQdXdNUXdE?=
 =?utf-8?B?T0gzeUJyVlJhT3dPQXhBa1FsWWU0c0JJRVdqNk9qQ2pTUXJsSzlJYXdyYmlO?=
 =?utf-8?Q?S75yxhGhLRIZcG6j3JxecxVXm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16c4ac3e-aa68-4aa6-57cf-08dd4780235f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:03:03.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VWPegqAcSEf4Ksdl/hFwPS6cL/5AxlhcXo6W4un0xipojJFIl68/2RVZ1USaxtGN3rah9F8tVDC/mjmpjQ+VUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
Message-ID-Hash: IKA2PELQEJ26R4LD3YCM7MLV7TIU2CCZ
X-Message-ID-Hash: IKA2PELQEJ26R4LD3YCM7MLV7TIU2CCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKA2PELQEJ26R4LD3YCM7MLV7TIU2CCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/02/25 19:02, Mark Brown wrote:
> On Fri, Feb 07, 2025 at 11:58:10AM +0530, Vijendar Mukunda wrote:
>
>> +	if (adata->acp_rev == ACP63_PCI_REV) {
>> +	} else  {
> Unless I find something major in the rest of the series I'll apply this
> but it's much better to write these as case statements, that way if you
> get additional types to handle it's easier to extend the code sensibly.
> Please update this incrementally.
Will push it as an incremental patch.
