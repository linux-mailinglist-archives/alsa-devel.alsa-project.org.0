Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69762824DD2
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 05:55:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C319CE8A;
	Fri,  5 Jan 2024 05:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C319CE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704430549;
	bh=DlYPFWmAesXcRlxMo5F6GEVq8iSThTI8S33ahgoRFOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c3vxm3fAUXbIZ8JP66NVSRFSphR5wfPcFHVDdyPlD4rIWon+WFvpdUYPgT+dhsUi0
	 9iAwyGwwwnUwyAebcx2awIMyT2GGeV3y70yQqkhR6md0Lg0CFY2Ov6RjjSe8leZXuB
	 zcU9AoE5ycqq2uR9Z1Rm0XQxDnb9+p2EHSgqQLxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16EAFF8057F; Fri,  5 Jan 2024 05:55:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82439F8057F;
	Fri,  5 Jan 2024 05:55:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F298F804B0; Fri,  5 Jan 2024 05:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54BF3F80086
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 05:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BF3F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=hgiuhsQF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWu1xHngqbfdp2Sw0ggPeJnB3ehuTI8zD3ksUxawk2sobubHujoDt5ZXK0IelJM5ZE3ZjTRl0iqfq3XnhW4IK7ujiNsT96PsN26QqmFz+18VMbaOavwmyPzkOuyIXQCRqihW7MegFz1YgzTpQxKsoYaubW0MvVrnjgH6KprBaW2LQznvydf2dnPKCQDvKGuG8l07FB8pR8zLfr+KW4RUYDN8VxjuaRzFm1Eicl1+78Sug1hRa1KkwU+go8eykjZHXuvRrqpEF+4kRs87/PButgtb52+bSt7DfQH+B4QyYNNad0BbVZg2FkQJQJBcMxCgBkZ1UC4JbZyo9c69bbbuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9Q01E6HOzlASmQ34hVpCXl9hlptHHM5uIRpczARrrU=;
 b=OV3ZhAsmZXWS3YmOBfxo13c6JZlTim0Gw0pAb0Mm4ve9PE/HslVC8XpQmYhFqvtgjIVPEDbEbh/sVmgGtfMiKKVvWVo6Hl6Sao2XmvGLIkQEt48pl6zmuvCZ51uTPjGc98wHBfIhAK2gCjyUwoVyTWjW36C77vlGxIPD8eY4gr1Fiaas/OixNGdGnysxZmFqFxpibVkzyr4nvRbCU7SK6cE4pp9bHyg3DOEeC5lhrSYzqFPBpl/ZqTxzY9WIPFv/giBEbRsOCXfIGhoZj95LfHztMNc0Pbj0ir4y+qc208kgxVTtSrri5O+0hC+aZPZcVBMHA7GU+9CAwon2QCZyDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9Q01E6HOzlASmQ34hVpCXl9hlptHHM5uIRpczARrrU=;
 b=hgiuhsQFc7zLoDkh7Lu+IvLPKxQK1fOZDd5EsxtquD6VlssFECl6bRPl64LzX/31CKSPECa6QliiE5sfrzufFeyr6k3aYNHVY4pn29EabAZThxzdIVMUhVypVgYF1RfO2UjO5wXgdD90A7328BfZtACrs8EiXSrrI14ItBCy0NAJgHamMiteia/4BR1HhfQnv/t3EnHLM8pb2b/WkgYGFMuxGxpDMQoHdGFzA3bIOvW9wqV7qDSoKl0OfwqRMh2T5ZV4ysy4U5+/2PKYp+OScjC17mcp3M2Wqj7DwhqAruJuyhWm5m7kZc2CNk4bBIA7pMwTnQqfDUtdS4mf8VYX4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by BN9PR12MB5276.namprd12.prod.outlook.com (2603:10b6:408:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 04:54:27 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 04:54:26 +0000
Message-ID: <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
Date: Fri, 5 Jan 2024 10:24:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::20) To BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:EE_|BN9PR12MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: b60b7eae-3744-49de-d811-08dc0daa6478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJIYukjhHixb7HFfkXVEDExH/TPElfgzzDoS9PksjPB9il9vURKOvAyv83KR4da+qarTPWotPf8avMw6lNIfhHo2W3oVK8k66lATMf/UjnH7TBB3V4mML3WDMSHrErVrk1ujLBTXDrEph52CZc3us7nc3mHE+sLksg5N+hX8nktH+99C1hBeAVSmS0A7RfnjfCg59w5M+/EwS77gmoYTvQfMhUVpIGRJ5vePAnc9+zVM19VhmfVa2cXgKmnITYVVqgxt9v7rPWJLq5BZ+8dELauljX3UV9j3PQfdqEU7sGL/NapbYK+MO4AroQYK2wsllJsfDFNyO/hU4gzBwcDcpgtfT2jw6mjgqLS+Sx3N6OJbmEkPXnYZ5v54GytHubx5nc9knSXUICQXHqAaN6jmsxukwa9ecIc1/j49ANOEA4Ez5mL6Q/qYvvCwiaSRtmb9oED22rBvX7gV5xG6N3U8oI2hfzJGk0W0YBZ/+30nt/5bP8UT5pqmJgVLYTL6reTsLVraDA3iiZH9c5y/W0tinsOd5xYiOQ/ygyt8FzxCgVG6JkV1T5eiEJ7ttAeQl2dUOSAd0Hb0O1f+evsNZ0NlnmF4jzl8vb+HwQIN+gvYb8HJweYhJBGBnuO1ABILWWLad+gtzZaJ5tZBQV8Y03M2ioyjtoiBTbe3WVFu3JAAJcrFZFxV3/GzxRqIuKnW67dqJq3Xf7IjVA/UvlfltVKRLKtuwWLcM5rfc/bYkonQ3Tg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3205.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2616005)(26005)(6666004)(53546011)(6506007)(6512007)(86362001)(83380400001)(4326008)(316002)(54906003)(110136005)(8676002)(8936002)(2906002)(36756003)(5660300002)(6486002)(478600001)(66476007)(66556008)(66946007)(38100700002)(31696002)(31686004)(41300700001)(2013699003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHFheG1nRlc4d1dEVFBUNmp3Z2pHM3F6V3psZmpqWW1URmlHWGsyNzAzNmx6?=
 =?utf-8?B?bEdYVU1mY2Nza1RIa1lIY1lPUWg0cEY4MWd4NHVJNjJQWEJpLzJvNlJvVzdj?=
 =?utf-8?B?azBGb3Y3MnlmbWpCOFBrNS8wVFFJZFc1Z1FDWnh5SW1XRTh4SDlReU42ZXdL?=
 =?utf-8?B?aWZFYVF0aDRjczZ0bmVZQW94RGRZWFJJMGtqQlJTVFpEK3FXR25Hc2NsR0p1?=
 =?utf-8?B?SzFUc3ZIZDAxRkxnZWlEL2Z4WlpCTUFMUkQ2SXhUWld3T3BUV1Q1NEk3Mm5N?=
 =?utf-8?B?ZUhwUEc4NnlqSDlVK1cvUThYUXQ3ME44WUd5R3hTU0N0aC9IZkZ6cERGMHJ6?=
 =?utf-8?B?OVVzY3lLbm85aGtDR05NMXJXcUo4Nm5sTFBwaE04ekJtb2FMTnNybCt5K2dI?=
 =?utf-8?B?N2wyTk9XZ2pXVWxzTjBTZEdWZWVYY1hKL3FEM3lERVBIZUtrTEFmd2w1eS9k?=
 =?utf-8?B?YnJLNUFSVFlXb1AvT3NFMUNHNjhCZXNlWTlvdHN1Q210aVVaTDVTUUJOUVpS?=
 =?utf-8?B?eGhZcWo3QWJYdHFnT2pYNEpnZUhJVXJxNkQ3SXh3QzFmeStvM3VIODQrV1Jh?=
 =?utf-8?B?d2FMWE1DZDVGemJ3VHEzZGowVlRLRVlXUmNYVHZ3RGI5MDVhRDBQanhxK0l5?=
 =?utf-8?B?ZklCNnhrTkc2UFNxT3FrM2N2NkU3WjNlejJYMm1neUZDWUppM3dvMjMrazlw?=
 =?utf-8?B?ektHOUgyYmxJRng1SU5GbHY4bVlOWFUxUEE1Qm1rSTlBVGNSdzRhTnRqUDRq?=
 =?utf-8?B?V2dIbHZrQkZoRmd3eU1ScHM0NzdMN0VVRElVQVNpNEs0TVFoZFlXTzVzL0Nq?=
 =?utf-8?B?aFdQWTdsNVJiU3FoTVMwY2lERGxEekNDT1JqUUdDOHV6U3ZrcXUzWEJ4azZh?=
 =?utf-8?B?MTRvYjVTVFVISVV2eGVlVjlkckhjVDNjRW4wSUdBTERvZHRZdnpZVW5GQlh4?=
 =?utf-8?B?SVdBSFhqRzY4aTYvNTRYZ09sMXdJT25Kai9sVmZSVnpkRTdmOU9BbWlORVo3?=
 =?utf-8?B?d1ZMVWx1WTBkWmMrT1ZXcHFYcm5wOVNXRHBJREd0aFR5aE9EWUxuY2IxVXQ1?=
 =?utf-8?B?Q3dqOFR5eFNudStPRFRYd0tJQU9NYjUvUnZmc0wwWHZWSjROdXFrVHpJeFFq?=
 =?utf-8?B?clpEd0xYUU9YOGJmNTdCN0JBbVlINGs3VHc4STBib1lSZE9DM1VFL1Q3RXM5?=
 =?utf-8?B?dGlQZ3NzbFZnT3JtSHM5YmY1ZE9hRElkMmJkZFRMbmFyK3JIL2YzOUhTRjFi?=
 =?utf-8?B?Y2tIWEx6NStRSzJwSFhVQldhRDNtMkNtSFduc25MMWZrSUVPYStYM0xzcWxz?=
 =?utf-8?B?c21jdldXZnBONy9WbFQ2ZERBYnE3ZzZJTE9OeEQ4VzFxVGJZSUN6RVNOaTdH?=
 =?utf-8?B?RmlPUzhJVEFvQ2VWeFVhYmp3Sk1Rb0c3WGxXOHNFNFNrNkN5NXFmMk0xbmps?=
 =?utf-8?B?LzFTVUs4b1pxY1F6ZjR0em9LbnViWFJUUCswdmlibHJGMndoUjdneEMyRWNV?=
 =?utf-8?B?NTc3WXd5SDJCbDBTSjVWWlFiZXk2RkdOL0oyeloyd200b3FoaGJWaG0vTTV3?=
 =?utf-8?B?bnpqRWdwbGZieWhTR0R4T284Vk5jN25qV1MzSGJMRkI0aEpJcU8zOFRWSnV1?=
 =?utf-8?B?aU5QNEcwanl5K0tCRkdFTy9QNFZPZUs3RWEvZHB5QjFTd0EwZDZ5Nlo0SkFk?=
 =?utf-8?B?czNwbUdqOHQxYVc4RktsYnFKZ1hMMkVDdlc3RVo4aEE5YU5COVBvTXZUQ09I?=
 =?utf-8?B?QW82RG96U3RVRWpKS1drQXBWQVJoMEpSYXhUQ0FhUHZJcGZadU5QTlJ6MEVG?=
 =?utf-8?B?cjZScUIrQ0JhN0htdEEweTBMdkpqNUdNWXFHZTBZTXVGd1UwWlJyalA5UTBL?=
 =?utf-8?B?d1R0T0tpTTFSRy9Iam8xUk1kdjVCZkNLdGRZMFNXOGREa3lWNlJHZUgxVFhD?=
 =?utf-8?B?bHgwZ1RXUWpHUVlFeDFSY1h3WFJ3dDAvbm85Vlp2SjJWTGtPVXh0ekF4RkhD?=
 =?utf-8?B?cExFN01ub3c0bFRjMlhFZW1ZZVdTQjVyQUVpU1lSdFBWL2o5Tk53dzc2OUJj?=
 =?utf-8?B?TjUxNVQvYjltUVdxb2FiWmxpaGtBdHppMDk2OTIxS1NUbzAyOTZ0SWNPdWxz?=
 =?utf-8?Q?zMLmMUIJqvdp099TzkCysDWzm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b60b7eae-3744-49de-d811-08dc0daa6478
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 04:54:26.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UOuYdsX2jyeqCDTo7jCDlK8hjXBcLKs4HJclb3vk5jpnIsmxdwqja82Fhd1UB/rnX0ia/pzyk1+0SgupE2dOKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
Message-ID-Hash: GRBL7QIWD6SM7K3JXMYPIIZGWEYSANHU
X-Message-ID-Hash: GRBL7QIWD6SM7K3JXMYPIIZGWEYSANHU
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRBL7QIWD6SM7K3JXMYPIIZGWEYSANHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 04-01-2024 22:52, Mark Brown wrote:
> On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
>> On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
>>>                /-----> codec1 endpoint
>>>               /
>>> CPU endpoint \
>>>                \-----> codec2 endpoint
>> Can you describe the use-case? Is there a need to switch between codec1
>> and codec2 endpoints or do they receive the same data in parallel all
>> the time?
>> Could this perhaps be described by adding multiple CPU ports with one
>> endpoint each?
> Don't know about the specific use case that Sameer is looking at but to
> me this looks like a surround sound setup where multiple stereo (or
> mono) DACs are wired in parallel, either with a TDM setup or with
> multiple data lines.  There's multiple CODECs all taking input from a
> single host controller.

Yes, it is a TDM use case where the same clock and data line is shared 
with multiple CODECs. Each CODEC is expected to pickup data based on the 
allotted TDM slot.

It is possible to create multiple CPU dummy endpoints and use these in 
DT binding for each CODEC. I am not sure if this is the best way right 
now. There are few things to note here with dummy endpoints. First, it 
leads to bit of duplication of endpoint DAIs and DAI links for these. 
Please note that host controller pins are actually shared with external 
CODECs. So shouldn't DT provide a way to represent this connection? 
Second, ASoC provides a way to represent multiple CODECs on a single DAI 
link in the driver and my concern is to understand if present binding 
can be extended to represent this scenario. Third, one of the user 
wanted to connect 6 CODECs and that is the maximum request I have seen 
so far. I can expose additional dummy CPU DAIs keeping this maximum 
request in mind, but not sure if users would like to extend it further. 
The concern I have is, how can we make this easily extendible and 
simpler to use?

With custom DT bindings it may be simpler to resolve this, but Tegra 
audio presently relies on standard graph remote-endpoints binding. So I 
guess diverging from this may not be preferable?
