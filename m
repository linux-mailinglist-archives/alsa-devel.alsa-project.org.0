Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849588937EE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 06:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE8D218D;
	Mon,  1 Apr 2024 06:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE8D218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711944064;
	bh=sZI6WY8O0zOMIY6pjFuOdzxteiQomX0hOAZYWbPR2dk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UmljMVAG8Alq2phH+uX2mEUESqiA8N5kyoJwbVjXFt7NM8Z/aCYNYcFPkJk74tWBa
	 10PEymy1RVvzpKBEdOUHiUYLLMN0RBo5V5iQixAgb5SmN0N5zRwuAlryPt3lOA0Rud
	 onlyWUQnb2PCIO1lr1xTOjm5/hPDt6RHGKxQDKFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83B18F80568; Mon,  1 Apr 2024 06:00:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5800AF8055C;
	Mon,  1 Apr 2024 06:00:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E736BF80236; Mon,  1 Apr 2024 06:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c400::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15FC2F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 06:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FC2F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=AsxaJR68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI1MJHfdhZv2CvSRUTlAD19WiPp+9ueV4IfLQscx5NsMT+vjJ3AD0nvm3z/2xwFcYndjBxzXnLeXVjoAG7gE1kMEEnzYmnr6fSrNcc9yITa6akzHWT0jhvM0zEtr8oUeJm0D9rIsfcxmOrwZ1IowD4Qc8gudtEWtMfSiwN+/IXtGs9ITElmQHPK+a6m8qkNaj82z+lfElWPXW81dtUsA0DQP3pCv8vvBx6kTyTTVKQ1H114Ph/N8XjsUzE+XEqLI1NvVE4Sm2nYVtp4BEl8HvNTFm1MrvaJXi1urEXZcuso0sjNKJjH8TKL3XOgdFMtPLjO0rTrfskrEDe3l0iX/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZI6WY8O0zOMIY6pjFuOdzxteiQomX0hOAZYWbPR2dk=;
 b=EgR+53zfaiaWZQOx1YhJ8OOcZOolBx3sUqsy9u7wbGvGLhrkOiDtSSeVTvLMAu4u5u/wH5y4hJClHD8DLMe75hckq0if5NSZA8t3UAT8bRtK+x04FDJI8lpuCssFPdCDl4vZblytF6BdmMjePKzu6PKAvXr/hfySKTNUe29WQ271BaVkRiGTDFw4aGPxGVxBnxk5iVV5gJxsHEtbw8LTuOEXsAUAH53ky9bGp5VRiXrxWJOPS8sxZyCsd2eGcUdsb9K8xf5CMzY9oFtc+wrJm0OIjFXQ2YOPh63gy8sDw1kgUyTVVbSANHxgJSR2+U3kao3x+56PMHsAKu8llRIO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZI6WY8O0zOMIY6pjFuOdzxteiQomX0hOAZYWbPR2dk=;
 b=AsxaJR68XgWWjSd6qCnuX1qwqyFAitWgyeS/DpmW/Ee1Agg9NyOIrMY2hNKnBNwJwHBK2VapD5mj3aJJp2prlHWhy4sV5wx7x4QNo9xnNIxRFUOE71YR8V8TRokEJ42kN0ex4s+f22Oxl9fkOfS65qsyzLx7H0EeUtwRbwuPpXc=
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com (2603:1096:4:235::7) by
 SEZPR03MB6761.apcprd03.prod.outlook.com (2603:1096:101:64::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Mon, 1 Apr 2024 03:59:59 +0000
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e]) by SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e%5]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 03:59:59 +0000
Message-ID: <7426929b-c92d-4020-a59e-20fddc753e98@nuvoton.com>
Date: Mon, 1 Apr 2024 11:59:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] ASoC: nau8325: Modify driver code and dtschema.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 YHCHuang@nuvoton.com, KCHSU0@nuvoton.com, CTLIN0@nuvoton.com,
 SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
 dardar923@gmail.com
References: <20240329085402.3424749-1-wtli@nuvoton.com>
 <ZgbFv+c3fjME+x+Y@finisterre.sirena.org.uk>
From: WTLI <wtli@nuvoton.com>
In-Reply-To: <ZgbFv+c3fjME+x+Y@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To SI6PR03MB8987.apcprd03.prod.outlook.com
 (2603:1096:4:235::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR03MB8987:EE_|SEZPR03MB6761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oe3v6VjabG1acXk0RPMoY2JrtJ2atCC3NZxl00uxTd0ecDJqgNV/KpZGqjOjgTGBAzqpRMccdpESAzDGaAVifsR3tnu83y+/BW9sEBJlX5j2bnR5cA45aGcJ83arVNG9xgI3xWXpAp4ibwjDSJag/8y6p+iBl7EaZG8GGkjnhBtMT6AJcg1/DQGFC3HldJAxr/Fe4Gvc/tJAbuVHfFqW0ejD5RfWpQhVg307wgOFUmVes8BbFRS2lFVOL+9RbDyGl/H2dC2h1vpWNSX6oLOsHJTFkUMGk9me4JECcOlORbEnQ2wSsiD7Bgi0ZfryABfCra3JW+4hqhnW92ZErFZUlSP8LttyqZyyHu187MjtHyZTT/R2SSzVWe1uNEIvAk0xyxnrTBVk3lWvDgi591ohlxrJWWPNRVwgcIRxo//o06/PqSKgygznDfOoXKltQ/Uymv9MRu/TMmGnDa+nZA5YaX/ieKXFNpQ1cMf/MjEshNnzShA3rQwqbnV7bKlphZCqigN0v9eiYShG5ahcqs7H87hczwGJ1HeoThgdPrtOD3fligc6M6Hke4Q6u48ZmgW//jlEjaldT9M0ofGiGyUtCVOZDbZMRnwyGj4Fk+ou3N4fIJmZU7VZH3f1/g+BnO0YlSCzjdyCRhqPSOF+JMmnirXESiBFlpwSLgKdJfs69D8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR03MB8987.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0EwOHI1eFRCMDdKQ2lFbERRQXNFanFzNUlsRGJPbEE0cmFrZFd3QjhYbmJG?=
 =?utf-8?B?cWZsSjVjMC9Mc0l3U3c0UUt5WmFIMEFDeVJmMDZiYUlTNjdrYk4vNWpUM2VD?=
 =?utf-8?B?a0pmcnl4OXdBU0pNZ3ovZnVRYnZWcHdGNWx2eFFDUHEvVTJlcGRzcGd0allW?=
 =?utf-8?B?a0Rxalhtd2Jsd2ZPUmp2bGcvdGwzYjBna3ZmcDhwMWxzVVdlMzU1MGpWT0E0?=
 =?utf-8?B?VEFIMEVzL05oOTE0ZWhXaWRwYTI4UE40UUdPeEUxbk95SnhVKzUrSUY4a2Qx?=
 =?utf-8?B?V2VvU3NxbGdWMW1tN1lNWEMxUVJtd1Zpb1FDdDBQcjVuckhsdHZ4VVlac1Fi?=
 =?utf-8?B?OWhmL0VKekxrZEV4ZkNqY0k0NzVBckExSEdSV3I1Rkx4eFBBTWE0bnJVd3VX?=
 =?utf-8?B?QU9DMWo2K3RmUnplc01iY2xHZ1ArN0tjcDZFZW82QlRobm9MeHVMcUF6aWFr?=
 =?utf-8?B?ZXh4NnJacU9VWFdaaE9CdWNiNTVTQ3JocG9IT3pHNWFURDBRTWZmWHIwcUlJ?=
 =?utf-8?B?Q2wwRVdPY20zdUxZMjVOM1NpUWNvNEpwMXVIV0pVY0FHVmc2dVJDZlk1Z1RR?=
 =?utf-8?B?cnZNcmlBMWs1d0RCM0N3RCs1ZHkzNzhyU3BHb2l2LzZTZnA1V0J1L0F4ZHZF?=
 =?utf-8?B?MUNIQnloL3dwUTVRdUpaTzRiK1dTQk9WMG52ejUrMHE2RERPTjhoU2NNcEVh?=
 =?utf-8?B?bDFNRnZWdVhNSUZ0SEhXb1F6aTNCaXdDbENwQnFDVTk2TmZHaEpsMWxJWHhX?=
 =?utf-8?B?NmM3WVhWTkN4a3plUjh4UFZJODJZa3Q5UThIemZsbVp3S2FrRlNJZTJrb2FY?=
 =?utf-8?B?OUF3dWt6VkRDdUZjTVo3YXd0dStWTkZqaXNvZUF4RXl5K2RPZEpQdE5lRVdj?=
 =?utf-8?B?UG9reXZTbVc1TVYvMVFpcjN1SDVvNHRoclpscHMzd3krVEtNemJMS3N1SWFq?=
 =?utf-8?B?ZWQ1TmhMVW5GVFkyY0ZXTGx0T3k3VjZXN21UNjJrSTRrQ2EzUEx5UEtscUdM?=
 =?utf-8?B?ejFkZHFITjFubEpQemlZbEhqTUlENzRMSW5iZkZHUE9aaTNsOE44UzVyQnlJ?=
 =?utf-8?B?bWtrcTB4NVBWTG1hTC9iaklXNTlLdDlOTGF2cStXckVxNkVFVUhLelJ4bnZt?=
 =?utf-8?B?OStPRXJ5OXJCNXR4d2ZpZmpCdlpYclZJMXBKQnVrOTQxaWJVemtGUXdaQmNs?=
 =?utf-8?B?ajlkU05YZVRzSThGVVBXaFcrb2VOQjl4czdraGdGeG96bzVIOCs5N3dYYzlH?=
 =?utf-8?B?YWJkcmtLcDA3Q1Z3OVVTVDgrU21Zb1pSSE9KaUdpWDRwQUp6Uy85TW5tRUhF?=
 =?utf-8?B?VzJMSlQwRkRZa3MxdmJxNGNCYXJvV3VjdTI5Q2w2MGFYOUhWL0d3R0l1eXZ4?=
 =?utf-8?B?cDdrVWg5S3ROZkR6bURYWUNVMXovaTk4NDBrR3doT3YxS3ZYK1ErTDRubXdh?=
 =?utf-8?B?MHhsS3N4eUdsNVRldmQrMWxxS2h2c1RJUU5CWlZ2T3lJRFhvTG43bGZFSEhO?=
 =?utf-8?B?RTZ3OTAwWjhpeCt2VDZ3UmMzUjh1eHRVWFc0NzY5ZzN4Y0RYeWlyTktHTFFW?=
 =?utf-8?B?ZU1NdVBBYmpNWWRNZUEwTStXdE1UaGxPTFFPUldtdjN1aUJHL3VyUk5nNHlS?=
 =?utf-8?B?ZHE4V0V5R2ludy9ZQ29QejdnRDZ5U3kwVjFvM1ZwUHJNdUxucHBHU24zcThv?=
 =?utf-8?B?VzdBWS9KbGhieWxpbnJyN1FEc2xDMVlsM0dWajI3Q2JkbmtYVll0TEdWQzlZ?=
 =?utf-8?B?M3VaYnA1bzZsYUN5ZDI0MnNJUTgzNXBVVGZxRmpvSS9OZ3c2RDJkd1dnOHdo?=
 =?utf-8?B?cndwcklZcFUrNDFoUm9rZnpwNUxSRmUyaTZGZ3krc2FEdHZra1JydFY3ZzU4?=
 =?utf-8?B?ZEg3QzBwaU5wRHVWaHFvdkJZdUU4bEc5WUEvR1FPakNxN1c4QWFQVGZUemcy?=
 =?utf-8?B?eW1WNlZLUzFWdkUvT0FvWUZFQ3l1cE4rQmYvc0hEYUxJbTNYMzE3dURWazA4?=
 =?utf-8?B?SGJCa1BXSnNSKzdzcndYRXNxZlVNeVJQNGZzcDZ4djVhNlQ3YmtINkhQTlVx?=
 =?utf-8?B?M2ZRanJZKzgxb21RVmkxRG52MkxxR2hPT1Z3SHZ3TTFJL1BYYmxpYVlHdGRH?=
 =?utf-8?Q?hyZojdcuIuzxUPSMYxXUqaZFW?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 519bf643-9e81-47a3-8507-08dc52003317
X-MS-Exchange-CrossTenant-AuthSource: SI6PR03MB8987.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 03:59:59.2097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mlQqy8J9EFWxvdSAEJ0x/SpJsO1qr30N1qq5UkIz2QItrfNE35gXL+ENOnv4lpCFDxgiGr4N9XWNZAZ+WFkg+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6761
Message-ID-Hash: W2NYDBFMWZRTLN6CRCCSL5KCKBEYG5EN
X-Message-ID-Hash: W2NYDBFMWZRTLN6CRCCSL5KCKBEYG5EN
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2NYDBFMWZRTLN6CRCCSL5KCKBEYG5EN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Mark Brown =E6=96=BC 3/29/2024 9:44 PM =E5=AF=AB=E9=81=93:
> On Fri, Mar 29, 2024 at 04:54:00PM +0800, Seven Lee wrote:
>> Revise properties description and use standard units in dtschema.
>> The unit conversion driver based on the attribute must also be
>> changed accordingly.
> My applying the prior version raced with you sending this new one, could
> you please send incremental patches with the changes from your v6?

Sorry, I misunderstood. I will send incremental patches with my v6.

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
