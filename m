Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A49F3417
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2024 16:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA6A20D;
	Mon, 16 Dec 2024 16:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA6A20D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734361821;
	bh=GLzfGqihHg4IMDlhmV6mQqd//yd+NCMjpgA6Vu+DGuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RpYlpI36wIUlTZpARia4vvhQ5mO1vl+Ta1om4l9lJi+ujJ+wA7hbteh2RPSYZbk8D
	 gk49UuVKl6qLrvaXNgnatOj8I9YMhRnPMENZSA5ifIwiFthmpWItpgsQtNcqaAasat
	 Fnf07ArqWeusiAW1OuKvZjH+aAtLVc0QoIWKfsbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5017FF805C1; Mon, 16 Dec 2024 16:09:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEBEF805C0;
	Mon, 16 Dec 2024 16:09:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90AAEF804CC; Mon, 16 Dec 2024 16:09:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::606])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69FA0F800B5
	for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2024 16:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69FA0F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ggsNGibX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kxa5ry4pLum8sjShNXpSyBVXiDZreD8f7tYhguBYj2rdNCHAs7NuxN0eE1FgZpI6hLkansy/ogzwd4uarim0ie1WPaHTA9s1PM4RnL1Cn5xBga9IJzBcWrlGuz6Ln3eV5/b2uVEyCTRJ6CDEqDXSYqRxh4QWWs42UhaZ4h/7H7PPI1J8Pla6QduayPoSwiij7cqOf7men800do7dOrMEmqoBYJtpPSHYisw22p1IcE9PuzOJrE6lE/l31sIXk/bWGD3s02VWzKU68GhdrRYjXjPAZxPq8lmeNpxqpfsURXaf9dcGfStIalnsxwU+1VuMymmez6buBeDwxAl7VLBesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXHgpQpGOOkjQJhLnJosOhLo0Tgva6Ys9A/M2eeV6QY=;
 b=jDAUDTcO+1QHENRidaHmrOAqxPM/kWTaA0y3zqgQp23rpVc/R81RNe4lyCYlwk9uV5Su4GwkyMYW7s3WCccjR60mo9x2CAYo5i/ehayvk4nrLKW2I3LuFAhoreUiFO/xaACK/RaDLNqGa4goog/MDQ0M9xD+WWg2+8ZLNA1VDbhpUi1C2BEAJF9h2Lr5fkXe2Z0iOlLC8JF4nn7Mq9i/GUmK65SS0fgA3MMmIxfwlhb1LJ/UC+uzydnE5W7vklcTmYKM1lKdv5dGqU1HCavTWjo9PMG1WD0/5cpIK3/5+SzgG5BdfokEjd2QN9grU9wKJBGQcsIgF3ATQHCk+EBe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXHgpQpGOOkjQJhLnJosOhLo0Tgva6Ys9A/M2eeV6QY=;
 b=ggsNGibX4E7SKbGHUch6E3pJfG90j1DfOQQrC1wsW7oglfvcaSGhAPxnWFmJNyJhSQZsu+rDkW2E6ejavLCu60tVml1PW/vxbRAARYHZ+oAFmloPeyr34dgHQZUE0aMxpETyQMrnsEQOEyTveE1j5pa5d3h5RGUGjGK6Dn8D7dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 15:09:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:09:27 +0000
Message-ID: <cab6f9b5-605e-4d6f-8859-02d451e7ed99@amd.com>
Date: Mon, 16 Dec 2024 09:09:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: ps: Fix for enabling DMIC on acp63 platform
 via _DSD entry
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241213061147.1060451-1-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241213061147.1060451-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:806:130::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fee640-ff38-4eb9-5817-08dd1de3a23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTB3RWpKbzZaN0NzYUJ6VlRySEJBbkxuMTVSTFdiYmhKNjVMMEtQRjdDUXhM?=
 =?utf-8?B?N0dZdEJEdFBFL2t0dGdtQTlMUnJyamQ2N1prNnhTajlxbE85MjRTMjNwSmtv?=
 =?utf-8?B?Zk5zdkJOeGF5a2lFWjVTNjFNajhGUVJqRHEzOFRTaVI5cEI3ZWZxTU1QcmJu?=
 =?utf-8?B?WktjRTJ4MVF6OG9oWXd0MHZXNzA4QWpJUERqaDdrKzlkOXN2TmlKazcwVG9O?=
 =?utf-8?B?ejJLTmVEWlJUOU5MalEySFVjWjBQT1hRVWJHN0hjSGFBMEpBZDJHdjVrVVFi?=
 =?utf-8?B?bzByZ29jV3NaUmN5RnRtS2FIVFg5RU9RVXV4bitiMHhweTl6SW94SURPcUdm?=
 =?utf-8?B?Rmp5clJsL2xhNnJEamI3SzB1VjFITkoxUWRtMmFGOXBCOUVxTjZYd3NUbU5q?=
 =?utf-8?B?aDZJZ09HT1dQUjdqUkdZd0U1Y2R5dnVQNXdPZlhlQ0R2QmJTSU4wRFNCdTZt?=
 =?utf-8?B?WGQ0TThoMVM3OGw5OC9oQWhwb0MxOUpqdlYrdXg1L3R5QkNVSTVRTjNBN0cr?=
 =?utf-8?B?cFdRWmwyNElSdWFGODdidkoxNGV6dmxUTFVNUXozanVZS0t2bjhqN3AvQ0VV?=
 =?utf-8?B?Vjd2OFZJTDFVTk5XdkpKVjlPcmJ5Sk1tdWhMRDU1TGVPcXJrdk5Sc1I0Tmtl?=
 =?utf-8?B?SmVqOU5raEpqOGxQTFowZ1BCU2h0Slg3bmZMck5QaGhKOFZINVRHSy9JSEps?=
 =?utf-8?B?S1RFOWFlWjkxUHpiak85TytOS0ZYd0NwZGJVM2dwOGQvQWJXVjVBR0FQc014?=
 =?utf-8?B?V2xPbXJJbWpSS01heHNpbUx5OFFmWittWHVWMUc1Q0M5eWU5dUFIUDNEaWpO?=
 =?utf-8?B?VzhqV2JscVF1S0gyZk9NTW5oMWN4TTQ2SFZIaUtndUNLazBUUVFOK3ZuS3BW?=
 =?utf-8?B?NmEyT0YyeFpVd3FZTnFoQ3d4ZXBHMFNPQ0srNmcrOW1HUzVBRDg1MmkwRDR1?=
 =?utf-8?B?bzRtbFhneWM5SG5RR1ZsSTA3Lzl0MDJqOWpuN1RuOWhSVDh3azBDbXA1TFBD?=
 =?utf-8?B?RVczbkJuSEtpeXU4L3R6RVhaUUl4Q1FXSHhSeXYrV1NTZjdDOEdlZ1dyUmd1?=
 =?utf-8?B?ajVwV2JnL05yNUZucVNTdmNlZFd4RmJEZTd0aUZGcUlmSmRyMVRBekRZdXZ5?=
 =?utf-8?B?NlBwTXUzdkdKYTFWbi9ieTZiMDBlamh1ZU9FOUtBTUFrbVRQampad1J0NVov?=
 =?utf-8?B?OVBJdGFpNVE4WnR1NStDRkZaOHY3NnBkQ0ZWZTdCbDA5SjNMVnJuaXdlQmhE?=
 =?utf-8?B?MFBpRURIRG03aGYvbXZNbFdDdzRaN3FHS2l5SnNQeGdBMFRHd1d4MWVDeWpU?=
 =?utf-8?B?VjdObG9kaVZmNy9iUDdXZzk3ZEYrT2lBWmRTY2ZKK1k0VEhtUk1LL2tQNzBq?=
 =?utf-8?B?Z3g1d242V29wTmQrMEs2allwRGJhVUxwdHVCaXovSS9GdExEbmUyRFowZnl0?=
 =?utf-8?B?ak94eDlrRm5GK1RySnhKZ3g5b0JaaHNRdDZ1bjI2WUJLUEpJQlE5QjFSek9L?=
 =?utf-8?B?WlFNOEhONEMzc1NMVzRSMy9hcWNWVEJXMnRWK050MHlNN1dCZXp2S1FDSlph?=
 =?utf-8?B?WktCd0J1cWxJS0tBdjIxbXo1cUZYL3RpZmdFWFF0c3VKY2p1MFNIaHFxd2ZW?=
 =?utf-8?B?bjJYWjhNdmpxcmN5ZmZ3NGJNM2R5UklJWUczdGZSMU1wMW5yRGVIdEFZUXo2?=
 =?utf-8?B?UkZaa2VQb3hlckdwZGFxaFBZQkVuS2RuWFkrdWtKd1NpaXZtWjZyKzZibXVz?=
 =?utf-8?B?WHhqV3B6RE11SnJBQ2ZxWUU0Tk5uNXFjcUFubVpnTU5lR0hmQzNSeloxdk9N?=
 =?utf-8?B?K0ZRUkZaL2N4VDJrVzIzcjlTU0I1Y2QzVzV4cTkxSHRlVjBuNGQ1dUlhSytL?=
 =?utf-8?Q?30LsRkh3eJS/1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUNPVk1GVmZrTEpPZEM2a3FGTXNSWlBPaXRUTXJJSDErbkZEWDFQemJIVlBt?=
 =?utf-8?B?THBtSlZsMjBaQjJYZkZvZS8rN0wyREVQVW1Ucko3TTkwM09TbnVwbE5iYWNl?=
 =?utf-8?B?NjN1WmgyU2pvZTJiRFcyN0ZEZ0xvRm5JVGpFa29pRTdLaythYUVCc1Vudnpn?=
 =?utf-8?B?WnpzSDhaWFh1SGRyME05eFhIbkRuMEVUdE9BMEJFdTQ3L29TcHlTK0M0YWZR?=
 =?utf-8?B?NHI4ZEhrQ0wvM1pSdzVqR01HQ2crK2hyemZaYTI2Nk1OcUxMNFIwekVxMGRC?=
 =?utf-8?B?WGtXT25OSktMYmhSbzB3bVdudGQrdEtEbFpCcnJyM1NoZGs2TWJreHp3RjBQ?=
 =?utf-8?B?RE9mZm1lQzhUcC92VnBrZzdIUzFwTUxWSTdPVTcyOWFXTnhxVnFTRWdBa3E1?=
 =?utf-8?B?ODdNRXFaNzhJZGRTdnhzRGhWTlZoM3lvM1R4Qkw2OUFEVEd3M0RCVDBlUzNJ?=
 =?utf-8?B?cGNmb1ZML1FNMjU2cmJYWjNoa3ByNkVqblNmeHpyeGxGOXBBU2RSUy9xZ21I?=
 =?utf-8?B?cGFXZW1ka2dNdmt0OWp4TFd4dFVxQXNyaDhvYmVTTzZEWlhzZVZXMUlwYlYr?=
 =?utf-8?B?S0VnRlRLRnovRnV6dE51ZU1qVmVvck5OZlBEbzhpbnIvNUFIcXYxTysrcEhN?=
 =?utf-8?B?ZnpRZTlKbzZvTCtaNzZhcWpNVXVNREtmVlRIN2VQUWt1dlZqQldzZGJEQUh4?=
 =?utf-8?B?U0U4clluSlR2T3ZxZXo0cFlYMXZBMFg5YzJISGdCaVB5djZvNWpDUFNHV0tT?=
 =?utf-8?B?ZTY2T2c2TklUd0tuY3BNc0pLZWs1bGE4Y3ZYTEVvR0xnRWJOdWtrUzkzdkVu?=
 =?utf-8?B?cU9lSHMwTGs2cG9BejJQZ3FWZjEwRVBXNFRHcEtmT1ovclpyZlg2S2ppNC91?=
 =?utf-8?B?SjZWNGpIcDIwRTAxQmdGdXMvaTJ2WUhyMnlKVFJjcFZlWkpDYVpTSnN4ZXlC?=
 =?utf-8?B?UU1LK3YrVHh4Zk1FVHk4Tmtsb2FRU2xLVm9zdTV6K25uZCtaWWdjZFRwbjJT?=
 =?utf-8?B?NnB1aXdZYXBqT1RtTGxWTUVuRHYyNFp6ald4K2ZzaXhWOVB3VjdRUVpSS085?=
 =?utf-8?B?dHNYZWtaZWxOZU1qUG9jTHZYME0yN2ttVHNoNWhRdWZVV0ltM3c3Z0tCWUJG?=
 =?utf-8?B?MmllOUN2T25WUGVHeDREQ0IwS3pPSkJCOVBUUG9xQVg0ZnhJVW9RRjZ1Tzkw?=
 =?utf-8?B?RDF4THNHR3lrMzNnbXU4R1NWODdMMnRNN0VuaFpnSEoyeDF5TmRXUjZMZFli?=
 =?utf-8?B?enYzOTQ4QzVrQzhJd2lJTkc2RlRJZjJadTZpTEFXUGJXVllCTEhFR3hva3A3?=
 =?utf-8?B?YncyWk1NR1RNeUh0ZFkxQVRteFd3UzcvbFRpdHpQbjZuY2EvOVlOVXo2RVAw?=
 =?utf-8?B?TVVOY0xEYUxCeW9WZ2dxSEZmQnRvcUtaaVRxcEp1eWxtUFlCREdyb1JTeS8z?=
 =?utf-8?B?T1pLSWkvT3VtYUJGSklPUmhqK05wYVpQQjM3T3BUK3pkYmhmU2N3Wkw1WGFw?=
 =?utf-8?B?eVVuMmdSenRKZWs1ZEIvUVcrd2tyQWRldmZ1VE4xZGNnWFFKbXJNMmhHVkFE?=
 =?utf-8?B?SU84SWZJbTQzWGJ3RjlkZE1OUzlZVzVCSENmOVZZNlBFZ3lGZEVVZXFIY3hT?=
 =?utf-8?B?R0NzWFIwcGQ1bE0rTmZKYVFqUDN3T0dHSytXMWZpMGtDSmpkQU5INDFKak1K?=
 =?utf-8?B?ZHZSdWtWaUhGWWVLUFgyazNBRkw4WVlXdmQ3VURPejhWZXhodHd6cHovWDhk?=
 =?utf-8?B?NWRXM25WV0VITjg1ZVBocTZPTEVRdHFVdEppN0xHM0RiejdwbFJYK2xpZkV2?=
 =?utf-8?B?R3BWdmNxZFFtZEFlQVhONjBiV2pCRWdiMVNtSG5wTHAvWGZDcjdnN042L1VR?=
 =?utf-8?B?MzdDR1JuKzZFNVBwSnVkNDVjLzZrWkphNnVIR3NYU1FYSXNIZkNkVkpWM1gw?=
 =?utf-8?B?RmlESnhFbHlpT1lGWWNHWGdpd2thMWc1RHVyNHJJSlJwOUFEZU9jU1NNelJR?=
 =?utf-8?B?dWZGR0RYeWp6dVRVbVBINkhjUTJGZzI1UFVQdzYzcjRudENaRHdacnVHZ2M4?=
 =?utf-8?B?SjNsWXlFWGhpQUpMRjdZc0dydHlZeGRWY2N3emEzQnVLWXVKZ1A3MS9wMTVa?=
 =?utf-8?Q?VB54ehOaf3ugxXwzXjabQX6Fk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7fee640-ff38-4eb9-5817-08dd1de3a23d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 15:09:27.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZJahXpumi2XV9iBemkIxinURSX2GfbjkhBAmh+8SS1PfQGcZdm4c+cebRqPRvmu7pIZjn3Iq5SsyPFLTVNZubg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997
Message-ID-Hash: JMJSSO3UFAINKSY3OIBHIKTEZPMZTKZP
X-Message-ID-Hash: JMJSSO3UFAINKSY3OIBHIKTEZPMZTKZP
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMJSSO3UFAINKSY3OIBHIKTEZPMZTKZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/13/2024 00:11, Venkata Prasad Potturu wrote:
> Add condition check to register ACP PDM sound card by reading
> _WOV acpi entry.
> 
> Fixes: 0386d765f27a ("ASoC: amd: ps: refactor acp device configuration read logic")
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   sound/soc/amd/ps/pci-ps.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index a7583844f5b4..983d7fa13938 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -374,11 +374,18 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
>   {
>   	struct acpi_device *pdm_dev;
>   	const union acpi_object *obj;
> +	acpi_handle handle;
> +	acpi_integer dmic_status;
>   	u32 config;
>   	bool is_dmic_dev = false;
>   	bool is_sdw_dev = false;
> +	bool wov_en, dmic_en;
>   	int ret;
>   
> +	/* IF WOV entry not found, enable dmic based on acp-audio-device-type entry*/
> +	wov_en = true;
> +	dmic_en = false;
> +
>   	config = readl(acp_data->acp63_base + ACP_PIN_CONFIG);
>   	switch (config) {
>   	case ACP_CONFIG_4:
> @@ -411,10 +418,18 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
>   			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
>   						   ACPI_TYPE_INTEGER, &obj) &&
>   						   obj->integer.value == ACP_DMIC_DEV)
> -				is_dmic_dev = true;
> +				dmic_en = true;
>   		}
> +
> +		handle = ACPI_HANDLE(&pci->dev);
> +		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> +		if (!ACPI_FAILURE(ret))
> +			wov_en = dmic_status;
>   	}
>   
> +	if (dmic_en && wov_en)
> +		is_dmic_dev = true;
> +
>   	if (acp_data->is_sdw_config) {
>   		ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
>   		if (!ret && acp_data->info.link_mask)

