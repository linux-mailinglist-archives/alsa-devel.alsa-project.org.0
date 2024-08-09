Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96194C85B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 04:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17AAB71;
	Fri,  9 Aug 2024 04:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17AAB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723168924;
	bh=xXwIZmH61VtpTQVGXi6rFVZTJsP8hGYFdqH8nnaY+JA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DffbRLXy31+DxqOJTcQcPNiVsqyWivCli5FKhsXHRUahIiema3wwXbhRoCM6r6FaE
	 01Zk4EyqKahYE9f3Hdu4FLnkrtJt8mibjLgX7b4vJxpjtqdxn8feBeGMMQvzZMZKmw
	 axaZuO1c3DiSxY/aLgGgPjlOflx87HN9SrvjKVNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 815F0F805AF; Fri,  9 Aug 2024 04:01:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E20F4F805B4;
	Fri,  9 Aug 2024 04:01:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2F6F802DB; Fri,  9 Aug 2024 04:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AA6DF800B0;
	Fri,  9 Aug 2024 04:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA6DF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cZV7gXdO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB3OMUKWebFGtjBvV8aQOBlYnJkSCZb19w0J3Etm+duCWB/U1OjBCBSgNSmk7sRzjpuxidvtZ/D573fQbGNTTMoRPoXjjUYnKJjOutltZfMtPndPtXBzk3l0mZftvVtGRRgsnlTwGLVtqJuM9/wPOVquWdqatkOQcBUALELvoxinaTZUuTWOk/LJYXLUV5IS6U89txI5o/bAOTzflgk1r4eQ58mTgknBn9WWZR7m2ibb8s3qr69E0rTjqw+CtNOHxreg00TNgFCXESttzGxBnK0FcL2hMs46OT/XB9ZdgvNUp9vHw8qmDndGOrnhPQp6JwDCnUqGZXFcPglCzd9ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWQ/bhvy3Ra6c0decCBmLuoEGTg77z7/dyVmjnmsX3c=;
 b=Km75ieddjhCGB7BNa4p6lt7zU+ak/egNnWU/ywt/kqXEvzxVQEVWyf/UmWC/dkE2zLDdccsnrx3ySSzg57FjRoO4tSsRrNYAe+/a7vAGeD5kVhzG6FKyh+dvyX2t4cGidcrgqP7kLVPGEzlBUNxDzUoQZJ+Q1xUDixLRY21dW0vZpoItHWBJ7Qrl6nW076PFTo6nJ26fRd/9TI9yfKfXNEcW6DW3CmCh8D8Ti8/cCLJsRTJXIE3+84hEmtG6Gay+RaJSf6fKbb/qJgD9WSOdF99BcEvEM98tkmWB0F0l+ZrEKcNJcm7EaAc6c1kt6Ul27wA/AGHwrZ1IzN4QHyZlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWQ/bhvy3Ra6c0decCBmLuoEGTg77z7/dyVmjnmsX3c=;
 b=cZV7gXdOQ0h8cP1DfVMcuLeCzfgMZt/+QoAU92O7vICw+LSFQ8a3KLH03f2BjRX5DohhZCNJeEL16ou0rVx2345LhpVEWWXwjavoYZskTY3u3nnExw5PQi6Vmv0U+Qy+YPr35mDd0uERfNcJrvP0k7pQkEQIOIHH12DD0ALajPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 9 Aug
 2024 02:01:04 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 02:01:04 +0000
Message-ID: <a6a0c975-728b-4379-b074-b88ac928c58b@amd.com>
Date: Fri, 9 Aug 2024 07:30:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
 <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
 <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cc0778-7f5b-451b-e3d6-08dcb8172048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFJ4MmMzNEp1aDhQeVU5ZmZJdloxOXMzTlZrTE1KVlBYY2tVeHB3R0JNUWtz?=
 =?utf-8?B?bWZVMjB0YVdDZWJjV3B6MlVVd1Bhb2RkR0FPWkdwQmYxMkpHOVVWUHlsdnY3?=
 =?utf-8?B?YTdEYUhLbGluUmx1QmtXckpUZnpnMnNncXRYUG9OUVBrc0w1aUxKT1dnVVB1?=
 =?utf-8?B?emNzdDhCeTRJNGhxTzZnR0JhNDJDZmxiajhWaHFsRXd4MFdCKzZOTHV2MW1J?=
 =?utf-8?B?eGx0dDNKWUVFVlRTQk0wd0dpWUZQV1hGMnEwRHN5VnhHekpHY0hndVgwa0lp?=
 =?utf-8?B?TWxnOCtqaXQ2V2dzQ29Zb1BJTnVDN3NWVklSYnM5SklzZ0RXcjgxdUxQL2xr?=
 =?utf-8?B?b3Uwb2RPcGNzdXc4Mk9EQVhHZWpSbnh2cC9jZ1hNczFRajZlQ1VYdXRZekNI?=
 =?utf-8?B?VjBwNkJYbll0c3hWOE5xV3B5SG9nRjhWQ2tJSzRzaWszRjUwS0xIbkNHcFRF?=
 =?utf-8?B?T0RFMXN3VnBnSkRncW9FYld2ZlJPK3kvSzlEM1Qrb0NvUFk5aktDK3Fmbkh0?=
 =?utf-8?B?MVRtQmQvckkrc1VlRWZ0aGlud1V0VHJmUVIxUHBBamVXcm80cnRCRkprS2FL?=
 =?utf-8?B?a0NUaUlvb0JhaTBHQ0hKeC9rUUNSOUpFZVBibkpWRTFqd0ZueWdQVWdJSUJ3?=
 =?utf-8?B?YWt1ZkNid1RGT2ZudlI1S1F2eVJna05TTHdaV3pjVGpHNFZPSmpIa1lMOW56?=
 =?utf-8?B?WUdmUGRKMVRmeDNMakVsS0JxcDVObnRyQlVSc0EzODNLWFBLMnZOeUZINWY0?=
 =?utf-8?B?RGFCZkRkais4MlAwWTQ3dlBkSGRid3FKM2JPcUQ1bHhlaWFEbkMxNXZ3Q3k3?=
 =?utf-8?B?SHBodkozaERJMG04SFE2eFF1QjA3NXJrak1DYkFIdU5TYllPM2ZNS05CdVdT?=
 =?utf-8?B?NFpxdlR1OHlKa1h2WmluVjhVU0Z4RHo2TzRKamplQjV4bnZQTHc1UUNrb2Qv?=
 =?utf-8?B?TnlQQVN4ZkptV3BBSHpEelU1ekJma2lyK0tSckV0a0NUL0VLMFA4UUF3M29S?=
 =?utf-8?B?dE5zN21WeGdzVVd4czd3Q1pjWGpVbHdhSmZRdmUyUDlFVHQ0bnQ2bEtEYUVI?=
 =?utf-8?B?TDdHaS9PMy9PSnMxOHdlTUloREJvMTFaZ2lLVUY3WGlqVkNwTWxROTUxdHVZ?=
 =?utf-8?B?MXpGV1JvWWUveHQ3N0ppVWNUc1ZNV0pJVW4yWXNKNXBZbGNzVitoUU0xZUJS?=
 =?utf-8?B?cUkvMnpYTmhzUGRJZGhhUGMxSXcwZDFXYjNMUUlWMDhtbENPT0N6amhieTMw?=
 =?utf-8?B?eGcyaDErK2x4Q3hOTFNjZnZQWko5Tzkyb3E2Ryt1ZXQyUHdrY2FPRktWTWZZ?=
 =?utf-8?B?QXdQY2d4OUtzZjZXeDRyL3d4ZnRTeTU5WHhlaEplQWlIL01JMEYrVVliV3pY?=
 =?utf-8?B?OWlvNXJQQmhxQU9BRThCUkJHQzc2VExVN3MwbTU0c0ZJbFc4bGFYaDBWZ3pz?=
 =?utf-8?B?aUQ4eS80VFB6a1BWWkdEcDYrektYWlhQc0k5OVZGQWlIdys1ckJ1WEtqZzB4?=
 =?utf-8?B?RGlQTzlFZ0xuOEh1L3R0OFdKNFVNQU5tRlcvVjVDZnRldEkyRitRRTMyaC9t?=
 =?utf-8?B?N0phTmh3Vy9oZ2JTNVVPSTZnYTBrWkxwdzZRWC9VaS9oWSt2ZlVoVC8wS0gx?=
 =?utf-8?B?bUR5clJhZlkvazRZNEdmRlRVeUtCN0NmTEw1QnZWSmc1azliSVFkeE1OdjJp?=
 =?utf-8?B?b1hFZHY3TE0vYVJlR3dCa0tlcjg4U2hXS0NoRkltZnRibXBLcU1WSWpGcE9M?=
 =?utf-8?Q?UUVsWzWRxkOqVvaTYA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MitCSDZuZnZuTTNreDJ0K1BLZUJSbHlXUHR3LzArN2gzUEg0UFZ4ZFB0bzBF?=
 =?utf-8?B?VkJIbUJET1lqUXJRNndIdk05M29IU2FDTlBsdCtIZjB1d1U4aW5QSXNnOEpP?=
 =?utf-8?B?bGY5RFBCYzQzK0NsNks3QVdqUy9WNzB4YmpmdmpLRFVsVndGUDR5NkV3SXIw?=
 =?utf-8?B?cXVzdFZkZ1lsMVRWS0tnQ3dFNWRyYVA2NE0zOVNwSHFmemJWYTZzZ1RvYVdo?=
 =?utf-8?B?cUZoYVNrL0JRNGJ2My9WU2JTL05sRFpKUG50Q1JubHdIeWpjZURmV0FrWWE2?=
 =?utf-8?B?RWVFT3dEZy9XL0d3QnVYdFRZbXNJZC9IMjVpc0ZzeWpsQ0xNMXh2UXZMbncr?=
 =?utf-8?B?QlYzc2k0RytxZFRjUTJycUM1Zm9TdnJPY21ZdGNyeXFYOG9FMG1TM2FqTHox?=
 =?utf-8?B?SUYyckVZRWYyamNXb0NhcDhpem5TNlV6YWc2OUF2VXh1U2h6aUNvc2ZQLzNN?=
 =?utf-8?B?NVR0dVNFYXJvMlVUUlJSVDltUmVvaTFsbEorNzI5VnB6YmI2L0NxVnJWU1gw?=
 =?utf-8?B?eTVNdGtOR0QrVGdra2FSK2ptbDlTNFF6VGdxSDZKV0FjWHh4eFNIbXRBMU56?=
 =?utf-8?B?cFZyUG9KczM5Q1ArNXBFeTdMcTFaSDZST1EzYlphWnczZFNzQWJBYkZzOVFy?=
 =?utf-8?B?MU9IVnJDRU1Mai9wZDNQaW1VbXFiY1k1MGxqVEo5MUg3dk8wbjZOUEZSMDla?=
 =?utf-8?B?Qy9qWEYvdS81N2dSRjcwbUtwak9uSnVyR3RUK1VpSXhCeHdTaUdjMVN4WlN0?=
 =?utf-8?B?NzVrNDZucmlVeVVVZTNaN1B1VUhCLzhmZmgzcHUxRXZYa1dHNkRDdUgxaExN?=
 =?utf-8?B?aG1PRlRJYTZzaDJzS3o2d01Ham1XMXZEVTNIVllqeWQyK0lOZHR1L3ZTSFVv?=
 =?utf-8?B?K3E0bjMzL21mb0MwWThjUzNOOE9wZ0xTZ0g0VTVHREdhdjduUVNEOFdpenhr?=
 =?utf-8?B?aUhPUDVWSVdPNTFZb0hzMWNxSGtWbmJvY0lMQzlBNlRsWTJLU2pndmtYdnpm?=
 =?utf-8?B?TzVCSkM3L3NibitCNzJUTWNLTEdNNVlKb2NQOXFjdkhZS3BWQWpqVDRaemJn?=
 =?utf-8?B?VTQ1cUhNNHJvb25YR2pPNUVvYWxkNEhNVDZ2amI0WlhvUndCS0VtU21QK3Bl?=
 =?utf-8?B?NUtkRWlJOTZCcklUeHRMVkM1ZmUzdHp0VGY1N2ZzVE8rUjhteUlNSk5KekFV?=
 =?utf-8?B?Zmw3R0Y1TmRjbmU1Yk1nTXhZUHlZd3k3Z0kwNkdkTmNJNk1GSkE4VEdRb0Ri?=
 =?utf-8?B?U0xqNW5GOGFFZ0dnbmtHOHdpZXFrVHpHK2thU2doRDZHK00yODBVM2c2dTdv?=
 =?utf-8?B?RnBSei9zbFJxRFU1cHJjQTB6V1dxUWp3c3JFc1lBQVRjQVNGR1hOVjFxdEZv?=
 =?utf-8?B?bUduejZpdkhVVnlnOFdDbnA2czdIR0xMRFN6c1NBMHJ3ZktEQjZadUNtNCtt?=
 =?utf-8?B?U3RidHpKb2pTVTd4Umloei9Ia1E5elZtRnM3dElNTHFPc3dGT25sWEJ0RHlq?=
 =?utf-8?B?dWNJUE9oTUdEeXhLRkRhRlk4Y3pFT0w0L0lURG9URlAzUUFZa0dIdC9vUFdK?=
 =?utf-8?B?R0wvY25SQS9jVHY1ZjdZVFNyQ3cxZ2pkd2JXR20yYnRCZVdaSmcvNlZWU0t6?=
 =?utf-8?B?ckhuT2doZW51bFp3am9keUh4Q2hETTJRdnhsblFWYWFqZkJ3R084MHFMRjVC?=
 =?utf-8?B?SU8rNjJ2RlFONDRHN3pnTTNvVmVGREMwVG93c1JRNk5US1ZRQTlTMDg2RGpJ?=
 =?utf-8?B?ZlZuYXlJcmxHQlN3NXprUUxwM20xZWFJYjcrRE5IVHBIRTJZakRpZXNNelhR?=
 =?utf-8?B?Nzc5UVFySi9XSldKdlBSejB2ZHRDTTJ1TW84eFZidDU5M0JOS1FTUStvQklR?=
 =?utf-8?B?djI4cWM5S05BZ3BOVHRickFKWmd2T0VGOHRJY1JvUkJTaERUcjlUdkhFN1d0?=
 =?utf-8?B?ejkwTkpqQm9ORDhuN2EvSFFMK0FJODZjSmlCbXVLUWtZT1B4VU9jTko2MXVC?=
 =?utf-8?B?VXNYeGpzNGptUzNFZ3JJU1JkQmprODRyOHg0Mlp5RFRWVnBHamU2dFBuWnNz?=
 =?utf-8?B?SURhTEhCODFWV1hXQkRjWjVvbHdhd3hOVnNIRC9UODFDeWVWN3JBVDAydGpN?=
 =?utf-8?Q?wnUb0vNCo0qs1oPxiQ0nhZX8g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5cc0778-7f5b-451b-e3d6-08dcb8172048
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:01:04.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dMWCtuPv74+uKwF/1dk82zj9Yccjay1ynIYgqkjJfLKkJpV+RH3wnTb3OHeZaolP6FH/B34HM8V5XD9m9ar46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598
Message-ID-Hash: JN7ZZMKJOQI2QYBUYXMWFMJPMXBPUT4U
X-Message-ID-Hash: JN7ZZMKJOQI2QYBUYXMWFMJPMXBPUT4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN7ZZMKJOQI2QYBUYXMWFMJPMXBPUT4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/08/24 01:02, Mark Brown wrote:
> On Wed, Aug 07, 2024 at 10:43:14AM +0530, Vijendar Mukunda wrote:
>> Fix the incorrect register offsets for acp error reason registers.
>> Add 'acp_sw0_i2s_err_reason' as register field in acp descriptor structure
>> and update the value based on the acp variant.
>> ACP_SW1_ERROR_REASON register was added from Rembrandt platform onwards.
>> Add conditional check for the same.
>>
>> Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWire manager devices")
> This breaks an x86 allmodconfig build:
>
> /build/stage/linux/sound/soc/sof/amd/acp.c: In function ‘acp_irq_handler’:
> /build/stage/linux/sound/soc/sof/amd/acp.c:407:26: error: ‘struct acp_dev_data’ h
> as no member named ‘pci_rev’
>   407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
>       |                          ^~
This patch is part of https://github.com/thesofproject/linux/pull/5103
which got successfully merged into sof github without any build errors.
This patch is dependent on
Link: https://patch.msgid.link/20240801111821.18076-10-Vijendar.Mukunda@amd.com
which got already merged in to ASoC tree for-next base.
It shouldn't cause build error if the dependent patch already merged.


> /build/stage/linux/sound/soc/sof/amd/acp.c: In function ‘acp_power_on’:
> /build/stage/linux/sound/soc/sof/amd/acp.c:444:22: error: ‘struct acp_dev_data’ h
> as no member named ‘pci_rev’
>   444 |         switch (adata->pci_rev) {
>       |                      ^~

