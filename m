Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50682A6F7
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 05:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3CDDF9;
	Thu, 11 Jan 2024 05:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3CDDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704947386;
	bh=dqmYAmSMtz5SSTuBfGssWZQS+fXOoqZqcIUAecxSXtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWXXBiOa6WcDPEHsZ9TGtRoSyLs7gx087YbifA0CptRqOsOjBIv6vqxe8gHFwA/dQ
	 +i+MajCCIoe9CrNP/tjqg7e8yFRlCIHaNWoyGtg8LcMZI6dKYkD/9eQdsZJHExa8Ui
	 KqkwlUNI5urWkZlSxXMFFSVY7eQF6Dmw8KyCk4fc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDF9CF80588; Thu, 11 Jan 2024 05:29:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28AB3F80571;
	Thu, 11 Jan 2024 05:29:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E46F80254; Thu, 11 Jan 2024 05:29:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DDFDF800F5
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 05:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDFDF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=bPd59GH7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYflU3FLsCzccukWSUH2bVhyqQnahkpD0PDrLu87i3TqKqsPE2nKr6nFfuCxgRuEmFD50u6PodHktUQMh6LN69DcWaXIF6rre4aE1LqbW7yChp1/eMbEGO6/8WKHqwtFSVHHtB2E0rXgtjRxYivhHlwbj8QiwOidfyrO7EsLHRG2JJpV6CArQCS1xorWfqWFc5x/9HLUOZroHpxkQPS1oRsAgUlLFob2Xao27CfKMyDthvfIdSfUeR917hJrRIi7rC+ghhY9UZGpDCU6vAz1vqMNFdHYy//avnQ/BpEIc2Ag+HzGdV1cvdRsQhvrf3GbIE1vtdr7dtKte/kCM830QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+bsuDkrxNOYDusgLbx3t4jXYgdFYisQzpV+ZFkeZkc=;
 b=k2mQlCL/DCpeF9Yy8WZVfER8aGiHOpBdMIrMUQ2gT/poCNdc/3M6NU5DMimlV9U9wxfF7IsMLSjwoLVvsf3LGye95MThWiou0ix9eYexEpE3o79rRO7NyrUW7twxR4FprHSgC8JriEu74RZ7wbinldMfDd9hN2bbhyF8X5zyWNcuIW4wIS9vPYEsW46KDjkZkIIlUkt/bP6A1an7kGI+gfyTfzJ8vKTZ4NOsOQeqIlH8zqHFoXffZ4A7+ZOK03RtITR2MPFnqZ4h2VkdIAwrTUTFYJNNcuNzfDziRxQ42rTO5xWIjz6BR0mtjyNddnc6L7WUc6ixvPCLwhZOlvIuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+bsuDkrxNOYDusgLbx3t4jXYgdFYisQzpV+ZFkeZkc=;
 b=bPd59GH7h4EijkfvfUIiM89wigyPeM7vPSiAUV5Mn16hm6pCs9N9FCWt8v9qlpnWFfSSo6D5uPmWMiX+RS28Ys0I5rcG6NdNKqxSqzysYPtrP7b7ln1C/BU6axi+L37Ex35KZRqx+GosN3vti2pK266sude2UC+esACqrLSy8CbAx4bVNyugMXAFi1IkZSmKuc77Tj7cVdgVG58pNE6XwsTqR+lTW+FGw5Mna+bobCPYN3M6lq2YG4hMxxClv1gZ6vKqNTqJ1FwcLCbHcyC9vGOqLK1LtBfuSFDoR7pmw7p93iVf1naozxav3f30U3IKrw+e/93QzkQkw1tIrLoYfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 04:28:49 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 04:28:49 +0000
Message-ID: <eeb61f8a-697c-425a-9873-b7b60c0a5558@nvidia.com>
Date: Thu, 11 Jan 2024 09:58:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
 <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
 <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
 <e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
 <87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
 <cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
 <8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cba8c2c-789b-4576-cf24-08dc125dce80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KiHEcVhKMoApBwSHn5S8qfvnGwNqtvf4p7/TLlm6WhRLrchMgRvZ4P2W258rDQeEjlQciLX2DyEk0ZdqCKI817UxA51CZdprLQBR9IEJ/Xd1SpwhwJn6TFfj+5ysGL0AMl5K5InfPI8UwiAvFIO03qiULMQFX/KUDWO0Z8lPsaKAmBjqdjTgrpHb2FFzwQzcidy9ZcwYo1I2ntZwuowB9gfIzU7YcX409e0o3fifJpIUwNOwI9Pxodbt1KdK28lLj3ZvBWOlUhNENagtCJWacwOWOK6mCI61KWC+Kfy4tVzQL066NnI+eCCYAT6E1Rwo/W1WTwtC8zkho8FqHPf/ulIDMkDdP6v8e4u9vSGdLbrWKXS7LbFrJ17LD2+mt7XWtWpo6zAcwdI0aI2eegtP+zC5MeGgDuvpf0euI0aNuaXaVCHxFsBIASAVLmbwsaq128Ep2wLTIAj9tgsJ7QxqaaazoBLzVbDyNdzhEXMCNXlYdP3iCyBikvbSFfIvL3Y11ruawpTJzZiqpmBOlaRn/I4HeBBkl9km/qMoAIQcxknQttYjDBtfPWWLg5hlTu5J5YlJggWjr/GzTdXqm19rf1GOENqkC259pZ20yAvUoytwQidWom2hpD+daN6EE2XTIRnO/nVejD5MiwFne0VBPHcrzdrFGUbwa+zTgmJ1kVHeCb5X4xHCMcSd8d98aYkS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(6512007)(26005)(31696002)(86362001)(2013699003)(38100700002)(36756003)(5660300002)(4326008)(6506007)(4744005)(2616005)(6666004)(53546011)(8936002)(6916009)(316002)(8676002)(66946007)(66556008)(66476007)(2906002)(41300700001)(478600001)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWcyRDdsNXord0E1NGhxQ1oxZjdjYklvakljWUlWQlRucnRZZncwbTdFcVBZ?=
 =?utf-8?B?NXlUZHZTZ05Xdms0MU9td3BRUjNGQU5ZRTAzdFdvcUJYVHdNVFlSN3M0eEQw?=
 =?utf-8?B?eVp2TmgyUDJMU0VtZEUwUmpXb3NhYVlYaER3ZnZGbTI5enBxUGhHNlV2eXNu?=
 =?utf-8?B?MWllRlY2TlVNdHAvMTh2eFpGNEgvS0lxRVVNdHc3Rkc5cWhFMUpXaWRUWDdo?=
 =?utf-8?B?eHhrdlFrTkdLUm1DSWg0MGRMRU8vOGlLLzk1VnpLYmE4NExPeWFVN0VLZFRL?=
 =?utf-8?B?emR4TE1OSTZ5cFA0MndET09IaE5ENWVQSGZVdHVFZFVVa3ZLT1pBQjJaTC9J?=
 =?utf-8?B?NnJaYzJ6Z0NFdmhaR01LcU1NNEtLMUFGeG04TFpWbFUvcUlVUm5ocXl2bVJS?=
 =?utf-8?B?RnRSK0VHeWVJenM1bVNhSktWUWxhOHJ0VzR2dGpZaTVyUE5NcWNQVFJxajA1?=
 =?utf-8?B?UGZLbWM0SmcvcnhYNnE0ZllPc1FTQ3Azbmx0Q1NZVUl4SnJ4b2VaOGFTdklW?=
 =?utf-8?B?WkVNcFdORUZhT2VQWEpHeUY4d2hTZnNodGk0b3JyOGtkaUJOcS9HdlZXUUNG?=
 =?utf-8?B?L0tyNVRwTnRRd21zSlNGTE9sMlRjTUNERm9JWmRVWHBMOTE3cWoxYVhOcGhw?=
 =?utf-8?B?MHFEMkxQQkdsQW9ZcTY0bWFpbWZSTmdPRllGNk01QVFGTm1aelY1VlRWREcz?=
 =?utf-8?B?TGw1ZnI3emVqejNoMUQ3QzYvRVpLMVptelBpaSt3RFYrQTBiWW1uVFNMdnRP?=
 =?utf-8?B?S3BhaTNXT1p3U1BZRTRXT0hEVGRtUTdJRkRQcmNIU01BVkZaOThNdkpGekJa?=
 =?utf-8?B?MFdjVy9FbHlDMXRyemxyV056TWkrc3FEWGFQcTNVeWRMYmZkMU9PamJjaWJ1?=
 =?utf-8?B?MUJneHd2UFRaSEs5UmtxL2hCU0FIYi9URHduRHZ3R1pVVTdMZFQ1VHE5YW1Y?=
 =?utf-8?B?K1k5c3RvVnk5YTZiSnhEdEswTzFOZnlUelVOUlNYWFV5VytsbFpBSkNkY01w?=
 =?utf-8?B?L3IyUkhxL0xDSjdVSW54dzNDSDNsSnNkbEtTOHV0bXZuaklxUzg2c213M3NK?=
 =?utf-8?B?T3krelBnNnEyVlM5VWN6My8weW1ZVUlXQm9EVHU1cTlySXd6T1NmZXhYQURr?=
 =?utf-8?B?VC9ieGxWdjJBT0N5cU9HZzJTMTZObXcxQTdmUjY5a29uVldsdnRVOFJ2QXQy?=
 =?utf-8?B?SnZUSVp6ZVd6ZEt0cmgxc2xrSE9ZQnhVdDFVSEJqVUFReFFFcGVMM28xS0JP?=
 =?utf-8?B?VnVHaFU4T05pek5COXROTS81Z0wxY2JkQk9TUk03ZWNrd1hjU1YvRytVWENK?=
 =?utf-8?B?NnA1ZnNIbzQ4aVh2bk5vRG5FM3RRTEtwUVcwR1YxUFpWMmZSLyt6UU4zMXV1?=
 =?utf-8?B?T0l3RExyRUVXaC9CMlN3ZkMrQTRWZXhGM053T1pRcStOSzJKeHlGdUJOdGtU?=
 =?utf-8?B?S0pxaUl5czBRdGJwQXNuWTIzZE42Q3VQMnFjK2t1STl2UUVsbmlMQjFWZEFW?=
 =?utf-8?B?SmZJU1BoaFI5TWUrZUdJVTNxOWp6V2R1citISzl3NXFCTkdjNGs2UUc3RGln?=
 =?utf-8?B?MXBwODEwYmtGdWovTTFCc2xVbXorcDJreHZwMTYvRUd3K0oyM2dOVTYyZCtG?=
 =?utf-8?B?RE5mRGJhK0YvaGZOS2xOK0VmTXA1eVJNZ01lL2U5YVR4L0g4MEtUbWthQ3py?=
 =?utf-8?B?ZHNjVWVaK1NnQ2M0aWdUeVkzdkhraFZ6WE5ySGdLL1VxQWIvSGFFRTNaeEJ1?=
 =?utf-8?B?bDZSbWl0TWppc0JEeW54SXRVb1ZWUWZycDFzaVkwZ2hwSTlhbHlKeWdNU1dj?=
 =?utf-8?B?MXlXcjlpK2l2U1ZlUWRBSUtPcVlzaCtFVS9saHd3NHN5MGdOSFJzc29Eb2Iw?=
 =?utf-8?B?Ukt5S3RvU3k2Tk5TanY4UXZxSGYxZGpzclZLc3dEK1Y4VmJYS1U5MlNYckxh?=
 =?utf-8?B?ZUpGQjVDdGdVSUhaOGQyQnU3ZjhuQkxXdjU1VUYzT2RzNjNXMGJFZDYrUTdL?=
 =?utf-8?B?VmxjVHFtS2krdVdJWFBEV3hmWjU4NWcwNmliQmU1RmNzT2V3MXNHSUNNa3Z1?=
 =?utf-8?B?T1RnRW9ubGdZNVliMHZTT2pXWXYyMG5wT21lQmpwT1JWRUFOVk5PUU5RZmp2?=
 =?utf-8?Q?nudyOJRIcvc/3oN8jQehqCouN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5cba8c2c-789b-4576-cf24-08dc125dce80
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 04:28:48.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bFIbLvPufkNXxEX4sFgQP487wScms0tFgOiikzx/80LSpfqaA3DZmv3GEGAJJrHxA/LtHVAvDsk1Ejfpn6mgUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
Message-ID-Hash: 3O3SVF42HITOH6I5BS6GQBUEDE77SWIY
X-Message-ID-Hash: 3O3SVF42HITOH6I5BS6GQBUEDE77SWIY
X-MailFrom: spujar@nvidia.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11-01-2024 06:14, Kuninori Morimoto wrote:
>>> CPU
>>>           port {
>>>                   cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };

>>>                   cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };

You expect this endpoint to be exposed by driver right? Or are you 
suggesting nothing needs to be done in the driver for this endpoint?

...


> Sample is for 2:3 connection, but it should be OK for 1:2.

For 1:N connection, how many DAI links audio-graph-card2 driver creates?
