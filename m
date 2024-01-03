Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD18228B1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 08:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D53CE0D;
	Wed,  3 Jan 2024 08:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D53CE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704265437;
	bh=25ieGJUM/OQSqXDOb5mtDqLlt+68zLkK/fgJVHevkf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gV4kdXhTwv1yStG2iTIlLcXrofRwSdXKWNb27/1fd6ZBpyvz08nr3az4afmRvsee2
	 fzs/hOdNDZN7aCy4bsNmiUlVxaAquZGOlklXfA/Hq0IxPRHEnomvXj/Xg8liPgHy0W
	 XK87CnepG+oJ12TJY0jMBq23LNXFwBGHdYUN/O8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E95F8057E; Wed,  3 Jan 2024 08:03:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E59F80570;
	Wed,  3 Jan 2024 08:03:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA0BF80424; Wed,  3 Jan 2024 08:02:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CD45F80051
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 08:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD45F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Xj7tqw2e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8TIT8ZR/ef2G14NcDFdzrTsyCWSxdFRa0ILBJY3y7inPJ4IMKCYDKDJQbn+3QnTQ8PRlrZLKogciECh1mrmxVCxUJb0/BPhg1ID2Ou3Tv87iRjhq/msJR4Jd0O0EbLLo3DgvMYRYa85y/dHQM33Cm8bS2DxWRQNVb2JIiXObJCC8FvesPum3lx6mnA0AtOJHpar4wAjs6/r6qlWdpjFGUUJBad/gVq9kfaBiBu0kV28UoTzoUVyonugfDKVozODNUA4wl3rqcupDXUL35ek5UrFwPXwqG4F7HxIS5vYh+mToPIepYZ9D+N1OTGGGqabADPTMMEwoFtRWQU3CG7XyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2S9g/srkZm20I/OWFO0ZtrquDdfYchOBOrmYfcxkaY=;
 b=CCR80AJuI3o4CxBkGw5tjshLEYBUxGbhhSgJlvRuWFRabkVYH5cTH4ETKfCwvhLtN/FCpFPiuNocXdRGszyO1UYlBXa2VtaCkah8PgsuINjdOaQb1mMkE3Y9aEN55nD/XRIRPZJp/EM7fSwFfa+yZp+pcZYsUxtXwsv862baRNJ2Uo31N1pOKT5Sq81RKIZfyyT1AeSBA3fC3iOzjo88W8/QL0H6agyLrXpueaX65UWJTMpTqEgRwwVl8gFRyfs4zNniF8ip6OXhtuMDdNhTB7Cwd/KfqoNpXcBYW2bXDlnBQBEuF/4m+pKr4IUxQSTV3MSdc9Mgyokl++8UuncUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2S9g/srkZm20I/OWFO0ZtrquDdfYchOBOrmYfcxkaY=;
 b=Xj7tqw2exD8gmDs/7fabf1XaMz0v8XK/aBHf7peGAqS8Gi/c5YwiEA9YzyEyfKayg1SrVwB79CF/pYLw6t3zfMisDY2Bfl7ynMcEm6r82kEjo3LyWKUntA0W918y3wJqsQnrPurpapqAoLullVpzpVYL2zvlTLO3DXA7h8QQlEo0L+Yr57MrYdXhOe1YcHmy3yKEcR0qAMS3HSc+NwBT58DjjTKGFF3kwyzn9jKGoJLTHWPGrJz7YBN9oWBd9DPe+eBemu+5mZowhzhc+QMn6So21Mo7N4PMRg3FoxX+yr0MtO73c7FLqVf2M3H37oAIJOhbpUwV6ctCS0ptN/YaqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by DM4PR12MB5914.namprd12.prod.outlook.com (2603:10b6:8:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 07:02:17 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13%7]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 07:02:16 +0000
Message-ID: <b041d536-213f-490e-a83f-d86fc4149eaa@nvidia.com>
Date: Wed, 3 Jan 2024 12:32:07 +0530
User-Agent: Mozilla Thunderbird
Subject: ASoC: dt-bindings: Query on audio-graph-card DT binding
To: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::20) To BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:EE_|DM4PR12MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: d112455c-8e8b-48d3-1d44-08dc0c29eb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i4yqqM+DdW95de67/CfRFCQZiK4NsNRresMAc23EoD36+SpVHHbNiLd6EFaYGlp/qObSZBwCiZ62MwDS9iHR2Sig4jeqI0osZBhqak70CkQOdLRzFcvWzgLlhRGrEUvtRJSctS3+CuQpSJcgEZknpGlutL9Gin5ZMLQlbC1IRktBnDddZ4VSuF6BxmlRY0Df0vo8lYgLJcM1DzFNyTNzxFhP2TWYr/LicL7RrmrXc/BZcXDBqal1geLva1UnmpA0hkXx16LDOyaIUQ3cTnyyvYMi/7ZhWd9a5IT2u0Cp3fp5PIZed+k6fGPG3Ka1HdAw5Fqy+gXchsQ9/ag47ZITJ6fh8pV/R0NNY3pN+uxGCYA4uD9Z7aFCajxxCoyrmO/u83jPzptPxrClaPC7Njhd02UbKtgR//wpTK5SJQmBSFU+5q7hc0NLxAwqfyrR6cTMJftfGAiwvYL++t8IGbKZhzbHJseOA2rGTWFm9SXASoVztBuvCw5OB/Zo5lafXZa1XZESyFFzVNm7++PBYCIKem+LsU7u2Ef8qALdOU/HucD06w3XqZeG/b6YAkXp5s0lYQzAVyFI3Ysnkcc8vceMbf8ZnP6uVqJPaMUPFCNrWGQ/pBNPvyDFZWFdPFKCdC6EMXWh3emn/h1EVERSkjD1T7XOpITnHJ8v3Blo2O4iuUdrJ/tH+SL5Zj4fD4NXvTZC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3205.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(26005)(2616005)(6486002)(4326008)(8676002)(5660300002)(8936002)(41300700001)(6666004)(6506007)(54906003)(2906002)(66556008)(478600001)(66946007)(316002)(66476007)(110136005)(2013699003)(31696002)(86362001)(36756003)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emNvS3prUHVIWFhsZy9IMlVpZm5LTnB0Q2VPTzgyMFh2M3hTamlMc0hUdWsx?=
 =?utf-8?B?VXJFYmNxNldQSEdPbWMrdEUyaVdFcDZCOElwbUc2cVJ2NjRmT09YdjhsalpW?=
 =?utf-8?B?SjIxVjF1Mnd1QnRtNWNYT0JHeGtzQ1Z6K1RpU1JRbVY0V3oyTWJBVnVCYWpL?=
 =?utf-8?B?dm9IWDZtdlZMQXlEeTBPTzA4L3NLRDI3c3RTOTRtQmRSQWVNNmJGTENFbjNl?=
 =?utf-8?B?TTJ2bWdNcUhuTjZhQm80ckl2dkhTQ1lEZkg1SUFGU3dGT05sNFFGbUNGQVZU?=
 =?utf-8?B?amV6RThkMXJsdzMvVzR4bVBicy95bURFT05nTnFSVVFRc3JMcmYwQldzRGhI?=
 =?utf-8?B?a1IrczQvSnhNUzMwMmR6cHpRMW50V2p6Y21aUjZkalhCNmRNWldCcjY3ZUZ3?=
 =?utf-8?B?dExONDduTjVJN2h1WHUyTVIrUUZpcEcreE9KYThnMkRBOFJFS3dpbGFZTEx0?=
 =?utf-8?B?bk9jWUFGelV5MUdhZGNuVzZlUERSeXp4WmJmc1FLenp1NTZGeEo4SThnNCtU?=
 =?utf-8?B?aitBN0MzeG1jYW41TmpwcG1qZVI3Wlowdlh6QTVsbTN6K05OWWFXNFRROGdO?=
 =?utf-8?B?TW43VER1dU94cjdtM0g3bjc2cFNkNDh2UG5PNWl0VFJVdWNsU1dVVkkrRlcw?=
 =?utf-8?B?R0R0V2d6eWRKamw3R2kyWlVGMUtjQk8vMUNiMGJ1RTZZMkJ0NkFoVys0RTJt?=
 =?utf-8?B?UHg5bVdJMmdnYlBPYXNEZU5kRGtIVjZoeWloL2dHc2t1eHh0RDB2YUlqZTdI?=
 =?utf-8?B?L1M1MnJja1VwL1NSUklqaTE5dGI3NXhBTk0vT0VkUVNsVUl6ZVExaHlsRkZB?=
 =?utf-8?B?eDMzRDJrQ09SY3NqekpxMUY0Yld2ckRnNjE4ME1KOVZ6SGRrcWU4eWlyMXUy?=
 =?utf-8?B?bDFDK2hEZ01YbGp4ek1udTJJVDFaVFU3cVplZmcrYlEycEthVVQzdVZJa0pw?=
 =?utf-8?B?Yzh5K1ozR2UzbzRqSklTZDMxMDdpN0dOVHpER2R2OWhQYXU2WXVyb2RqM0pw?=
 =?utf-8?B?Rmt3ZGpSWXpVeXVhZ21WWHEwN3FBRFBWYVkxL1FrNTFhVVNOSUpsZDUrcEpP?=
 =?utf-8?B?U0pHN1hEMWVWOWlVMnNCa216WUpRdEZYT3I5S3FuZzZaemVkVXRiY1Robm5u?=
 =?utf-8?B?YzN0TzdIenlNdmVBeUpIeERXdnZNVXRtalVmUXVFVjZGWmRsbGxUcUUzQXdp?=
 =?utf-8?B?T2xDWEQrSW9iOEtwTnc0ZDZoMUdpNWFwak1UYTNzbkZDNjRCRDAxL0hUL0lU?=
 =?utf-8?B?UWQ3Q2c1RW8wZGhjWHdtZWpaOG12R3JJZ0lWclE4V3FFN0krellMNUxqOEJs?=
 =?utf-8?B?ZW54WjZlcVNsWUNZRkJIRjhrWi93ME5heE5EMUdjVXNNQUVUMEhSWWVJVWJr?=
 =?utf-8?B?cUxTSXh3OW1pRXdpSjU4YlhFUTUxS2szamZsb3RMQzhja1FBSHozZWRPTklR?=
 =?utf-8?B?aDg3QmVGa1VLL2tvdCtwTDNaSkhmaGVzU0JyaDF5cGZTYU9SdHRZRzR0S25o?=
 =?utf-8?B?K2x4MzN4dHlhdjIxdzc3WXd3MTZBZkR5OXBPUmplNnpTZHF5S1dWTzIxZXV3?=
 =?utf-8?B?dlkwUFhQRjdNYUFZcWRXVlNQZEJlcTg3TFZZbFVuR0VhaWRra0Vsa1dySkNU?=
 =?utf-8?B?b0Z1MzhTYndNTWxQZk4zVk80aEc5M1F5MUZhcldWdlJseEJ6aFlya292TW44?=
 =?utf-8?B?Q3FWUUt0dkpqc25MUDd5NWVvQ3hBSTBBK2Zha2dmblNac0EzNFZQTUtjcWVH?=
 =?utf-8?B?RlZaeGswMWxzT1U2SHZOSEVheXprNlpPT2svTHZOcHdmbnlaalEvVm9URTl5?=
 =?utf-8?B?aFNFZU5WejNqY1AvTXNuUzB0Vi9ZNXpvNi93aFVTbWxmRjdrdUFDdXE1WWJl?=
 =?utf-8?B?VThITGFXbFl5OE5BaG1hRVYyZ0hIMFJRUWV2V1R2cmJJczExUmRkTjJvR29H?=
 =?utf-8?B?OXdFcGZiMWV4UXc5cmsyTmdXNCs1U3BZZ2g3alJNMFN1ek5kSWQ1S3JqRWI3?=
 =?utf-8?B?UnBzNktDL3dUd3dkOWJ6WjV6QnV5RSthNGg5bVBLZEdLdXJlcUJIWDdJbzFR?=
 =?utf-8?B?alJLYWtVdTNIY0tUcEhhTjdtYWxZeDBob29ORjlZUGRhdnhDMTczbHNVclFu?=
 =?utf-8?Q?qdzSG7Q1jnDwipomYj7BJY6yx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d112455c-8e8b-48d3-1d44-08dc0c29eb58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 07:02:16.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nux0EfYoo4lT/YDWyukkp9xh12bTistSaPWhj96vy56VzYAPW4vR3jEa50BGqZvft9+vE1oCo6lV/exgQ6scoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5914
Message-ID-Hash: KZGKVXVVZ6HP4FCG6YHWNKI47R2KOVJ7
X-Message-ID-Hash: KZGKVXVVZ6HP4FCG6YHWNKI47R2KOVJ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZGKVXVVZ6HP4FCG6YHWNKI47R2KOVJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob, Mark, Morimoto-san


Build error in the example mentioned earlier seems to be expected since 
it requires one to one connection between remote endpoints.

Pasting the error I get:

DTC arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb
dtc: scripts/dtc/livetree.c:437: propval_cell: Assertion `prop->val.len 
== sizeof(cell_t)' failed.
Aborted (core dumped)
make[3]: *** [scripts/Makefile.lib:419: 
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb] Error 134
make[2]: *** [scripts/Makefile.build:480: arch/arm64/boot/dts/nvidia] 
Error 2
make[1]: *** [/home/spujar/upstream/kernel/Makefile:1476: dtbs] Error 2
make[1]: *** Waiting for unfinished jobs....
   CALL    scripts/checksyscalls.sh
make: *** [Makefile:234: __sub-make] Error 2
Execution failed.

Given this, how an endpoint can be shared? Is only solution is to create 
dummy endpoints for CPU and connect them to each codec?
Can you please suggest how this can be addressed?

> Hi Morimoto-san,
>
> This question is regarding audio-graph-card.c driver related DT binding.
>
> I am looking to enable following DAI link connection in device tree 
> for Tegra audio:
>
>               /-----> codec1 endpoint
>              /
> CPU endpoint \
>               \-----> codec2 endpoint
>
>
> I see that, "remote-endpoint" property can only specify single phandle 
> object for connection to a remote endpoint. In other words, the link 
> can be one-to-one. For illustration, please see below example. However 
> I see it leads to a build error if phandle-array is provided for 
> "remote-endpoint" property.
>
>  cpu_port {
>      cpu_ep: endpoint {
>          remote-endpoint = <&codec1_ep>, <&codec2_ep>;
>      };
>  };
>
>  codec1 {
>      codec1_ep: endpoint {
>          remote-endpoint = <&cpu_ep>;
>      };
>  };
>
>  codec2 {
>      codec2_ep: endpoint {
>          remote-endpoint = <&cpu_ep>;
>      };
>  };
>
> Is there a possibility to re-use the same CPU endpoint for connecting 
> to multiple codec endpoints like shown in above example?
>

