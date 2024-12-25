Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A19FC3C0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 07:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734056026C;
	Wed, 25 Dec 2024 07:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734056026C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735106487;
	bh=hOzMmbymisfmsXs7eIdWHBj4Ycqq4oJqsRo/p5xV1J8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DW7HvM7AVzZxPWOQ+kiQdSrVNKOH4L0u1EmRXkeLw5c0ar1s63KLjz+Pkdr8m/1bz
	 qEn9Mf1lymTUAlGNe6d9kqUZYcbU7Vsip/wVGTOhLdxVJtjeRQ3vhrff1jyRG/NozT
	 QdStFDj6KLBbsjTb41D+tlPjdbA3vTn5Zt9AY6sI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51913F805C0; Wed, 25 Dec 2024 07:00:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA7CF8057C;
	Wed, 25 Dec 2024 07:00:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 837E8F80269; Wed, 25 Dec 2024 07:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C51D7F8016E
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 07:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51D7F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=njeOoQz9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alZjU6irjGm39g6HEFBy2fZAOicQ9Ax5/sn4OekKjPVBM7LKgMmf3EzGHSGaTEVCAdFjI4ESRYE/raE73H2mM93ZrKxFVD2GVv+YYdIzne9MNJWw24UWZCpfy8ZYs8+65CUCWn5RzJnKA5XMD06xu/eDvNp+lHflY3UTGY2fErba4RkwbknYTjsNKp4Ww2xivGjR2aiiVSksjyYOM4KL3cUzi2FXdBYZW9KmJekSTwK1VSSFQ9vXDyP9A88J3x6XA2r/EdV6hfDxr3KzFSWRm3I6qEvWabdS5Zlifu3bmOpKOOBHJT/jaft/kQCTPUSfkhQX1H28IcPIPv0S9tuYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOzMmbymisfmsXs7eIdWHBj4Ycqq4oJqsRo/p5xV1J8=;
 b=in+DZrh2hBnxk23kf8TNOnkJx6sO7VxniX7qWJDQk+tEcEQq/txisb1teeqrJUFjxew+7MTjyMTahj1jyNwdjjo9rQiaWA+frDLbWZ0a4HsU9a6P8rHqSw0mvkgFYC38SqN5DF7xH0LiOpWML3/IBJI7wY8s8kilx+TQPfmnur2HnHtACk6MXC09Cp0JaCw71/NSo5vsi4ComZ6W67Pf5NdlZMPaYxWIQhf8K/8Jtk0R5awhNO4ESVD2ZYda68E6RoTrslWhCECol3G1WVhpGVdEI05iCflllTmD90lI5dpC/MXo53wd6Y1/gCy5hk6XbAlPbhBcHhsRqHmb47xMrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOzMmbymisfmsXs7eIdWHBj4Ycqq4oJqsRo/p5xV1J8=;
 b=njeOoQz9CY8kgQJ+UdjAiWXqAus9l+sCVd1nTyf8tQ77Zxg8ESIyaCPpJovck857JZAkZDMmsspzoPKEmjWT3s6IKvZ7qe3oIeKbzNcLilmX/rZGFQz/4mvOO0aOdxHAbZmqjS4iUq3aN8XebKJFZnPqcCWMzkp7ECYKvKT10O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 06:00:31 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 06:00:30 +0000
Message-ID: <0381c4f0-1588-45a6-9742-d291a5d18c0f@amd.com>
Date: Wed, 25 Dec 2024 11:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] ASoC: amd: acp70: add acp pci driver for ACP7.0 and
 ACP7.1 platforms
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
 <20241219054857.2070420-3-Vijendar.Mukunda@amd.com>
 <e805eb22-9177-47c2-84d6-c32d93571a44@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <e805eb22-9177-47c2-84d6-c32d93571a44@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::14) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: bccd3fbf-414c-4f00-0e6e-08dd24a96fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3hIYjV0YUV0OVZ3VmdNcG1CLzd3VndVODFqUE8yV24wRFBURlU2MTJtL0w5?=
 =?utf-8?B?ejdLZi9DQnZBWUFDUUZEcVh3ck1NaHFUcVduMEl6b3NvQnREK1NHdDVIOVZD?=
 =?utf-8?B?ZFBoSEpKMWxnSm1qTWVjMGorOUVGaHN2dlZ2OXFBdHZ4aDA5aThyT3lyNVU2?=
 =?utf-8?B?MmUvVno0SitZRkhieXduR3BVVkE4cEpTZ1pqVXhDanl4VWVxeHNGQlJiUGlZ?=
 =?utf-8?B?WWhabU9JSEZTeDFuOGRVbWs3UU9KbUJ4anFrM1FpcC9FWWVUdDhxRjNST2Vp?=
 =?utf-8?B?T3gvZ1hqeEVjMyt4aFZ6Qm9XZTU1YmpJWHdtYWNoMFVFTlhlM1ZING9BcTAw?=
 =?utf-8?B?bXY1WE5SdFhVM3VvZUx6SjlraFJ4RDNMOFhPTFpiM2haeDdDd0prZHJsV000?=
 =?utf-8?B?OUhMejNXbkF2WmhLQUJ2ZWVoWkdKYWRRY2I0aE5GSUdZUWFPR0d3TXA3bXNx?=
 =?utf-8?B?ZVBVT2VqZkJXa1R2ck1rNGtGSTFaTFV6UXdsTU5KRENURUthKzFENkJ4RVNt?=
 =?utf-8?B?eUpxUkp6SVhobTFJaXFVcnZJUTI1VVpvamxxcVRZNzZsY05JVEYyWHdsajI5?=
 =?utf-8?B?N0IrZzdRQXZkZFF3K2NqK0RhZUJraktwYllRYTB0bHZySnMzVENPaXg2NW9u?=
 =?utf-8?B?VDlVd2Z4VFlJNVQyaDZNbG1KemlVNEdMMFRlaE9iK1J6NnBIS2ZFYjgzKy8x?=
 =?utf-8?B?YkZBV0FXSlc5UzhhOGM1Wm1yaE1RdEV1N1NseG00bXFqQzAyN2w4YWQ5RFVV?=
 =?utf-8?B?RWNWam16WlZiMTZCR0hFTTloV25WelgrbTFpVHZ4cTlpMGQxU0w5RHZ3L0RS?=
 =?utf-8?B?R2p5K0UzL2tXUVpyckFXd0ZPRlpncWc4TmdsblZ5elR5QktkT29VL1NGR3FM?=
 =?utf-8?B?V0tQQUExSzZiViswYmtKbFN1WGtsN29TQWNoNEZsOHJmdTJKd1gxa2wyT0Zz?=
 =?utf-8?B?aWNrbmYvc2pGYlJHenZaMHdnYUpFSWdBN3h5M3JNdFRxUHlqY3pPZTR3MjdS?=
 =?utf-8?B?UGtqTWl4WjJaaUNFTXBsY2VZM1JMWTRwMnVlZU9jbEpucGh6cmdHZG9tT2Zk?=
 =?utf-8?B?b1pvZWJZL0pNZDZsUitWWkRRNXBscUpYbzJCYW1VK1RoUU5JWHYrZHdNQjRi?=
 =?utf-8?B?cHVaU0tFbDVxb2ovKytOeGx4dXVySVZzK3VYWHFhVWVsUkYwdTNJWDk3enRS?=
 =?utf-8?B?dDZtY2RQN0tsUjNtcnBkanlzU016YkZwTkpVd045bVJZU3NRMEtyZVk4MGJl?=
 =?utf-8?B?VXZLUzB2RWZwTFVEeXkvQk5UaGoyR1hVVGsrTEgrN0hyL0F5QUhXdDJXSEJl?=
 =?utf-8?B?VVRxOXgzYVZ5TXV2MFdqNUhyWTIxbHBPekhYMTM5MlhraS9RNUNqSjQ1dFpK?=
 =?utf-8?B?bjRuZE5ZZExaUTVFdUlqZDZCckFrTXkyd2FlVzE1cndCRmdtTkVPSVBwRkx4?=
 =?utf-8?B?SU15S2tJd0ptd3ZlKzRxdFZrcDhTMSt5WHpXa0pOTElYSWZWeGhoYjdMUy9G?=
 =?utf-8?B?elRtWDFCdUttL0dpMmdsY2h4ZUc2Vnd0NXBlSFl1UGR4eWprQUdhNzlsQkVx?=
 =?utf-8?B?aFFFNzZXU1dZb1h1amx1TEdxYkhvYUFkSVJOeVIybGd1Qkg5WFhUeVVxQzRa?=
 =?utf-8?B?RW83OGdOWEs0NWNUZTJ1bWN1QW0vSXJwYjJ5YXc4OVMrRnRpSE4vdk5OWkRw?=
 =?utf-8?B?UllsYmUvQjJNTTJDcGNUZHNKbmltVjBpS3R5QzJrVWwwTExDekhnYXVLSjlp?=
 =?utf-8?B?T3p6R1p1eC9SWXdTT2ZlV01BWDJtK3hDblJ3cDdXS0RnU1FOclVDSW9WaDJk?=
 =?utf-8?B?Z0orZkN1dGJiaHdySnEwS0Z3MGdPM2txa2RPWXhsRUhteE83cHAxMWYvUTRJ?=
 =?utf-8?Q?m153sgSzWSDq/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnZpWGRFS0NFWjk4cTE1WXowR0JBQ2cwdEhsQlAyanhYMkZNSExKbk8rYVV2?=
 =?utf-8?B?U2NscWo4ZlZpbnJsTXVwK1hLLzRhdXlrMzhkV1EyaVI2TnFzdHNUejl3OFFB?=
 =?utf-8?B?QVZJZk9ycFQ0YWphblJoRUpjWTJTc05WTGw4WnJhRGtFNWduTEhFYUh6Zkdk?=
 =?utf-8?B?WEZ1bzVaSUE0a2xEQkgrN2dRV2tadXJSSitWWlJ1SUFlV0s0cVdPZ0xtbVZT?=
 =?utf-8?B?a1phdTI1ZHVrWVR1QytrVUcreVUwYXZkQ2hQRHNRM2VNVzhDN2F5bER5Y1F2?=
 =?utf-8?B?bTlxR3lhblRuSENHMHlDZ3g5V0dDNktCRzJHT3Rsbld4LzBOUklKaU1UU0Vm?=
 =?utf-8?B?NEkrYTc0UzFvR013d3N0UytrSDZLRVYwVkNpOTd4a1h1OEVyRy95ZTNaTncx?=
 =?utf-8?B?OTFXTVRJejZubEV3V3IvM2FqMGl5T0FmWFVveFc5SDdHZzFSOG9QQTFWVWJG?=
 =?utf-8?B?ZWI3SGlHcU1VRTc3Q3FHZFo1aEwyZzZmQSt2WG9KalpmckZySkY0bXFOMnpy?=
 =?utf-8?B?ajhYWTVtWFJWUXlRNjZNeXA1dTZQNkNyVGxOY1g4cTNkYUFuSGRUQzQ2YkFL?=
 =?utf-8?B?dkZtMHo2U2E1elVYQjdzWE9PQmVDOGVJd0dMWjlEVHNKcjFJS2hRb1FEVHRh?=
 =?utf-8?B?d1BPZVZMSDVuWUxjQ2pibDNXbE16eHI2dktMcmk3bkdiZ3ZGTUIzNFUzRENN?=
 =?utf-8?B?YlY2dUdoejVRVWFteFJ6TkNvelRCeVJMTXQzb2tmNVoxRVNYREFweVQyN1pp?=
 =?utf-8?B?aUtxbTZNOU9sb3Q4WUo0OUdPbExveElWQzJtS3RTSmJBOFhxUkJpSk02dEtG?=
 =?utf-8?B?ek96QzNXVkl4SHJRWVNIb1Vubmhyb1V2dnhRaGljeEQzMW9QUFFWVFpQKzB3?=
 =?utf-8?B?UlNmL3hWREdsaDFXTXJxeHFNQ3N4b09KN2ZuZlJORFF3RFRjQ1k4WEhkSFc4?=
 =?utf-8?B?Sm0wLzRNc1VXN0N6eGV0WWVRM3JYcDJhK1dlTGl5S1o1ZmVWUWZOZzFQbWNW?=
 =?utf-8?B?aDR2ejhyZGprK0xIOWo3QUs2VDVvMXRpcjhVbEVuUjc4VzNBVnJVUnhRMGl5?=
 =?utf-8?B?eElxdDl4cURnNUFuWnhZS2dYZVByaDl6c2JWa0VZUnYvUUUreUtRdjhyRld2?=
 =?utf-8?B?bmducUtsZ25KbWhsOVlrMjJkTnFuazFsR3dVTTBEUlpId0V5UnZDTXBXcGkv?=
 =?utf-8?B?QmJQL2MyWjVBWlZHZXllV2Q3a1hFNGVaOThaWlRTYzZiSzQ4L0toNHZnNy9M?=
 =?utf-8?B?aHFxZmJOZDhCeDhseWozSWM3dHNNUFBNU0F2bWIwU2Z2dUxFVUwxMU81ZURN?=
 =?utf-8?B?OGQ0UU9uVC9yVzgvRjRHY2ZzM2FRWmVKcVArY2pmUHl3MWhFU0JST0JYNE42?=
 =?utf-8?B?dGx2K2dJUjJEWkc5Ykl6TkpxRnpzcmtxL2tZYWpLN3NGYXBCZHloNXM3Zk94?=
 =?utf-8?B?MTA4U3ROZFliZ3Y0REVaSGpLck9VWXlSR2x0M01pKy9qNGhSK1dqMmR5cjVt?=
 =?utf-8?B?a3dVRjYxb2FzaGxrL05veTNJaDBROUVWVUovQ3I3UGM3Y2QramFSR3N1ODdt?=
 =?utf-8?B?TVFsSHNxU09ielc0Wjd5dk4yL2FYY0hKKzB3ZWFsOWo4cllwcXBTaXJ4cE1q?=
 =?utf-8?B?OFdqdFp3SUFJeGlOT2dUN0NyQ0ZaUXlwdWhGY00rK3Y0T0E4QWpsblJnK1cw?=
 =?utf-8?B?M2JMVkhYNHRtMmpKeFZaZStPQm1Tb3hsOFgybUpSQkpXQTZqQkgyTEptSVg4?=
 =?utf-8?B?MzR6V3ZsZEkzTXB4UURDTldHUCs2eEx4eE44Z21aeDZzREtRUnZDQ1dqMFZS?=
 =?utf-8?B?eVhTOUgydXg1TnAvUzg4U1dMbnlCQXFvNVJvcVY3VzFoYTFwRFBEb1BtN0ly?=
 =?utf-8?B?SWNiRDVvQndra1BEc2pSSmgveXZ2RlZ5Q1pwbUpNYXlGT3lObjBVVEtpY1Vs?=
 =?utf-8?B?NFg3YlM0RVFSNUtaSUl1SFd4aEpxNG5xY0x0M3hwMUNscXBlK1k0NGZwWDVO?=
 =?utf-8?B?Nmh6YjJUU1JlR3FwRmVyNXZjNm5IbDNkTFVjanNwRHh6WGpmbk43d0lUV2hG?=
 =?utf-8?B?UDVuUGpIS3ZVbTNiclhzanpqVG9MbUFCdFhjSEFHWGpFeTNYMlM3UXVyUUU2?=
 =?utf-8?Q?qr3xuB6oRtE14uCjYmqBNAZJG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bccd3fbf-414c-4f00-0e6e-08dd24a96fc6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 06:00:30.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x/lBpMIvCVuDKxaTlK3SmtSo7L3QdAFjuqb/MMxb7S3qcRGnCyTFUcWBJFCVgUjuy7RmFFL16iPqWbwMmZJKzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
Message-ID-Hash: RXOHG2JJI7JHCIPK4AEGM7IE7GNA6EJC
X-Message-ID-Hash: RXOHG2JJI7JHCIPK4AEGM7IE7GNA6EJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXOHG2JJI7JHCIPK4AEGM7IE7GNA6EJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/12/24 22:53, Mario Limonciello wrote:
> On 12/18/2024 23:48, Vijendar Mukunda wrote:
>> ACP is a PCI audio device.
>> This patch adds common PCI driver to bind to this device and get PCI
>> resources for ACP7.0 & ACP7.1 platforms.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/acp70/acp70.h     |  33 +++++++++++
>>   sound/soc/amd/acp70/pci-acp70.c | 100 ++++++++++++++++++++++++++++++++
>>   2 files changed, 133 insertions(+)
>>   create mode 100644 sound/soc/amd/acp70/acp70.h
>>   create mode 100644 sound/soc/amd/acp70/pci-acp70.c
>>
>> diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
>> new file mode 100644
>> index 000000000000..28a46f0c2026
>> --- /dev/null
>> +++ b/sound/soc/amd/acp70/acp70.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * ACP 7.0 platform Common header file
>> + *
>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
>> + */
>> +
>> +#include <sound/acp70_chip_offset_byte.h>
>> +
>> +#define ACP_DEVICE_ID        0x15E2
>> +#define ACP70_REG_START        0x1240000
>> +#define ACP70_REG_END        0x125C000
>> +#define ACP70_PCI_REV        0x70
>> +#define ACP71_PCI_REV        0x71
>> +
>> +/**
>> + * struct acp70_dev_data - acp pci driver context
>> + * @acp70_base: acp mmio base
>> + * @acp_lock: used to protect acp common registers
>> + * @addr: pci ioremap address
>> + * @reg_range: ACP reigister range
>> + * @acp_rev : ACP PCI revision id
>> + */
>> +
>> +struct acp70_dev_data {
>> +    void __iomem *acp70_base;
>> +    struct mutex acp_lock; /* protect shared registers */
>> +    u32 addr;
>> +    u32 reg_range;
>> +    u32 acp_rev;
>> +};
>> +
>> +int snd_amd_acp_find_config(struct pci_dev *pci);
>> diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
>> new file mode 100644
>> index 000000000000..23e47f619bd7
>> --- /dev/null
>> +++ b/sound/soc/amd/acp70/pci-acp70.c
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * AMD common ACP PCI driver for ACP7.0 & ACP7.1 platforms
>> + *
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include "../mach-config.h"
>> +
>> +#include "acp70.h"
>> +
>> +static int snd_acp70_probe(struct pci_dev *pci,
>> +               const struct pci_device_id *pci_id)
>> +{
>> +    struct acp70_dev_data *adata;
>> +    u32 addr, flag;
>> +    int ret;
>> +
>> +    /* Return if acp config flag is defined */
>> +    flag = snd_amd_acp_find_config(pci);
>> +    if (flag)
>> +        return -ENODEV;
>> +
>> +    /* Pink Sardine device check */
>> +    switch (pci->revision) {
>> +    case ACP70_PCI_REV:
>> +    case ACP71_PCI_REV:
>> +        break;
>> +    default:
>> +        dev_dbg(&pci->dev, "acp70 pci device not found\n");
>> +        return -ENODEV;
>> +    }
>> +    if (pci_enable_device(pci)) {
>> +        dev_err(&pci->dev, "pci_enable_device failed\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    ret = pci_request_regions(pci, "AMD ACP6.2 audio");
>
> Presumably this should be "ACP7.x audio"
will fix it.
>
>> +    if (ret < 0) {
>> +        dev_err(&pci->dev, "pci_request_regions failed\n");
>> +        goto disable_pci;
>> +    }
>> +    adata = devm_kzalloc(&pci->dev, sizeof(struct acp70_dev_data),
>> +                 GFP_KERNEL);
>> +    if (!adata) {
>> +        ret = -ENOMEM;
>> +        goto release_regions;
>> +    }
>> +
>> +    addr = pci_resource_start(pci, 0);
>> +    adata->acp70_base = devm_ioremap(&pci->dev, addr,
>> +                     pci_resource_len(pci, 0));
>> +    if (!adata->acp70_base) {
>> +        ret = -ENOMEM;
>> +        goto release_regions;
>> +    }
>> +    adata->addr = addr;
>> +    adata->reg_range = ACP70_REG_END - ACP70_REG_START;
>> +    adata->acp_rev = pci->revision;
>> +    pci_set_master(pci);
>> +    pci_set_drvdata(pci, adata);
>> +    mutex_init(&adata->acp_lock);
>> +    return 0;
>> +release_regions:
>> +    pci_release_regions(pci);
>> +disable_pci:
>> +    pci_disable_device(pci);
>> +
>> +    return ret;
>> +}
>> +
>> +static void snd_acp70_remove(struct pci_dev *pci)
>> +{
>> +    pci_release_regions(pci);
>> +    pci_disable_device(pci);
>> +}
>> +
>> +static const struct pci_device_id snd_acp70_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
>
> Do you still need to specify the device ID since you already have a class
> entry in this table below?
As per our understanding, If another driver uses the same class, in that case we
need Device ID
entries for platform distinguish. I think it's still good to go with current
implementation.
>
>> +    .class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
>> +    .class_mask = 0xffffff },
>> +    { 0, },
>> +};
>> +MODULE_DEVICE_TABLE(pci, snd_acp70_ids);
>> +
>> +static struct pci_driver ps_acp70_driver  = {
>> +    .name = KBUILD_MODNAME,
>> +    .id_table = snd_acp70_ids,
>> +    .probe = snd_acp70_probe,
>> +    .remove = snd_acp70_remove,
>> +};
>> +
>> +module_pci_driver(ps_acp70_driver);
>> +
>> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>> +MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
>> +MODULE_LICENSE("GPL");
>

