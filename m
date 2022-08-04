Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444CD589A4C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 12:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7EBC83D;
	Thu,  4 Aug 2022 12:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7EBC83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659607827;
	bh=iiVuO5j5icS/ODwNM39/+Oda6ZfzQV6L+b2xdWtoufI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRfT3CXlor8Elu9PCAGFhl421Qnl4KnFhozOZmMiIkl4Rz8SjKzuKuzpROwFv4dwF
	 d3y1r6slqPb4fmAbx/FyjazJ0w2Eaug7qhF0SFY3ji6SZF0niFukEjwqz5CcbRoCLn
	 EQn1b47Xe1Vv/90Fyc5sOGC+uR5jYRxdVvlARGvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53922F80212;
	Thu,  4 Aug 2022 12:09:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D685EF8016A; Thu,  4 Aug 2022 12:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, NICE_REPLY_A, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 971D1F8012F
 for <alsa-devel@alsa-project.org>; Thu,  4 Aug 2022 12:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971D1F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Y3+gDxYo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOUb4xyUScE/2C5MjGmP2kt2voZUSTiSJP73hSnbee6SVAgkTRtept6FEm3xIWUaGb42W8Ezn5fJXwJgjMTWJKEPujdDGhz5ilQt2twD1EAv9yI4qtVkpwy26bsxzmTNgAYjxY5NrvPzvb2nE9qyr1lvj2vhtYKtygmiNeVina2kulPgADYVjl/4eKvnzFDkECcpdQrNc3xpH/Emdsysr5twpEm5AGKRkqN/ZntVoFpPV9iC2qhnSdcsyVsFxs9/QIX6RUMRMNBy2YeCn0oS1+czFCeSKDZxMUBHRpNb8m8jimsx+RYbWQJ/oOqt8Agz6uIh+/cY4c5gNeIjrcv1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wiBDIv99CN8b8OQTrwhU0WyjdWu8LN13Dbx9fDhTx8=;
 b=l7dPvT7qNRTmMNYx/FHPBtt8xYzVLhWPvXTLYIQmSRyNtKC5LliyFFrqAj6pN5sBGqrS6RzDZv9BMEHd7l5mPmWtmPWYHudYzLUANyH6vkj8nujMjqx2To2zaDKGBMG6cr5lIGAZO1Pfvnd1JAdy0zMVTnjcDPptD1KM2tey/x2k02JcCBkyJU9IANadv9ynPp6W8G1uaiEk5UiO7J2ZPq1KrwalK5j7+MorKrry9GfPA2270AGvPyjpxiVsgtQdNhGyne31/BKAiraOdM1QBnWUuqJqDX9AZzNsdlGUYhz6HDtZqT4Z79Xe/7RmMG0BuemKOQm6JmBLDkxW88/TAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wiBDIv99CN8b8OQTrwhU0WyjdWu8LN13Dbx9fDhTx8=;
 b=Y3+gDxYomik44JVgtMSsCmirj5aH/NyFXRuru6E3OH96WEDKwH5XzhneRu6zs1KO7ewkZF0V4ZQEwRh6UUR5e3jT5H4unc/jI9loLpERouCDtd9WhFX5AOSHEcLRY756jQNzXhMdOb0+4tY+9hooH7i/gMjfmYQ/QjmKwVr+IxczxYsXP9HjBQUF6vW5w7w1q8i6UdTGVD8dgS6G63YWPabYgfzuHubTfkqvoR9838FIxpEwhLiRgtboFEg97QIjqlOCiCMKleJRuCmo88R9goo3EtUTTnJalS2ky1IFgu1lW+fai9x4bpdV3/ZZxvxtcXpNVUPCNAmr7To7NzugxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 10:09:16 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2%12]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 10:09:15 +0000
Message-ID: <b6d845d4-836b-a908-5bd2-f98710a3696c@nvidia.com>
Date: Thu, 4 Aug 2022 15:39:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add schema for common DAI params
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-2-git-send-email-spujar@nvidia.com>
 <1659382247.124005.1380281.nullmailer@robh.at.kernel.org>
 <982b3f0c-0b6c-d531-3d75-27d5ca1aabec@nvidia.com>
 <20220802144602.GA30116-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <20220802144602.GA30116-robh@kernel.org>
X-ClientProxiedBy: MA1PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::32) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85ab3858-bbb1-4760-9cb3-08da76016317
X-MS-TrafficTypeDiagnostic: MN0PR12MB5835:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opFctVAaKjB2/fy+MtWVB7O4GP8Lc5zN/vt9Y58pRwpeawEqtHJFWH2oROhdbH8NU7OQcIsS8KKktdq5TzkAHtP3F05ZYj476krsF2EhHn8N6Vax66sHHxm89/fNjfQGbF0BsoSttaavxtmtGuXQfdLkobvYFewe/0HVr2CqMrsOzcoC+OIFg/FWl8XfjoAbIiAwuOP3JtCECAsPY3L1kUC6uflwEn88vXIxphSqv0cPejpdQRMaCLSHy9dj5QUOSftk6/Qi5//C700wItHEnounZxdaVaLVz7KAz5qwCHmtURg+rzlZVNs2hZCpAz0/Mytw+O6alS/mObIBZ8gvPt1OaIziaEODoyqqZ0cS3M8DrWWFmIx0sVaNazeuC/dCloAuHXw10zdd4t7n3fJvMAaz5WI4ij8wwy0GYuThW40JLHRoDbjF0V9lAPl6zPNQ83mlhJsAp75axtUGubQoZCs6ioEWJcHAOhwnl0Wwoo4w5PuxEvAvnOAcysIqnAcCfTgFcgFiAZAdh9wI/djjTnlLIgFisqIRg0fHDSr6niGLh99Mf18r7O2akaduGxlupUeJJwUb8CbbwiDROG9SIDOaqLDZp+4ky6Ptcj3HyrwaiXm1mCi+rJ9LijCFooUBcsnQZyrICWAp1el2IKCn9bfphKVBxMoP+2zzd9+Sms5Nwm9uZSf5c0OOOyaRpyKwTQ9cEcM8lkdYUmb6cV6/R4TNs/25USPfvVPOnAXt1zwutm+rWiN/8oXuTs6/Z8CzydHlFYPgmnLnOfangCJIz8Bq8WVNq+kGJf0E+h6OeWQULwZF8ly69sVckF6I6urwcUpshB2VCAITAU/RUnoNBOiXGY9T7sL2ZLoBiAxnaQEQ/np3i0HZEdBttgBBPgoBxbJcKNgyOBDfPcQUPl29yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(966005)(6486002)(6916009)(5660300002)(7416002)(478600001)(8936002)(316002)(66556008)(66946007)(66476007)(31686004)(36756003)(8676002)(4326008)(41300700001)(6666004)(2906002)(2616005)(26005)(6512007)(186003)(53546011)(33964004)(6506007)(83380400001)(38100700002)(31696002)(166002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZ5WXpwcmN4YUxrckhGL3diR2Y5VWplbGFZRWlsVFBxci9OQXhXcm1nMXY4?=
 =?utf-8?B?eFFPdjFMTDlVOEVTb0JTcXVKTkFPckRYM1hnS3dRWUNCblEvL2xFUjNQWjlY?=
 =?utf-8?B?NXVoYVNtNnZYdUVxalFKbHRmTDVUQUt3aTF1MEtBWStKR0hMb0RQbWYwak9T?=
 =?utf-8?B?dHdkV2FUTVBFRE1tcW5xZnlMSHpPa2NrMWtPc1o5TVYvaWwxaUpESUl6OHI2?=
 =?utf-8?B?eU5xNHRoVTUzdHhmOHVFdlZ0Zk5yV2NmQURqWjVxTzZtUitCS2M2N0l5bVVo?=
 =?utf-8?B?TFRFTTZFN0w5UElqOHZzd09IM1RkRis1K2prNXV3VEN3ZXJhaGFNWnI3R1Y5?=
 =?utf-8?B?OGJaTDZ4VEp5VXp6Wlh6V3NpMkZlQ2VDRy90MGNHTzBTL0d0alY0SWNTalE0?=
 =?utf-8?B?ZVRuVGN5b1V6WFlaeGNqZXhlOFQ2NGY0Z1V4Zkc1RVFYYTE4TzEyYkFiRlIw?=
 =?utf-8?B?UTJYdTBOdFl5NmQ3dDVjRS9YV1RBWlFldXU4ZEJJREVuakxKMWE2SHRvdHcx?=
 =?utf-8?B?OTV2U3BZQjlaRnZMNFlCMnl5ek1kTFZSRDF0cGFhVEg1QitHSUk5M2RraU5t?=
 =?utf-8?B?S2JPNXZKNjZ4cDd2SjlaVDdQeCtjQ3plVFpNSVJrRXhNcjlZM1pUM3BaS2dS?=
 =?utf-8?B?UGROcHMxOEdRUUpBaG1FcHp3YVEyZ1VwS1dpTlo4QjV4SjhxclBzcWRvY2Vh?=
 =?utf-8?B?bjVuQmIxcFdCYXV3VE5Ga3lCc3BFWDZRc0N3YzgwSzdmK250UHd2OHZnaTNN?=
 =?utf-8?B?OWRQT2s5bXp1dG5Sb2lBQW5vOXQ0Q1JCaklMeENIbUU1YmErYlJGMHpzSmVH?=
 =?utf-8?B?UENnWGlGUU5QSmJUMjdBZ2VYOEpWVllRYkp6d0VUajZXNEdTaFpiN01EWDda?=
 =?utf-8?B?YlFqclNHaVpMRlZTS0sya2FnNzdCZmo0TlpDdlpoVG1pRTFOZU9rYjdNejZj?=
 =?utf-8?B?Sm92M3NCVWszUWNQSGU2TERPT3FPeUNhelk1b2c1T21iS25vN0gyTmJidEVX?=
 =?utf-8?B?NjlSUmpMOVNPTzJwSHdWTm5FNEZVV2tkUTdlV0NTS0t6WExuZEpGazg0TGYr?=
 =?utf-8?B?bTBkRHd5VUdZMGR4SXlGV2d5bmluYmVjQVFrc1NzM0F5S2hLYllvazN3ZVZ2?=
 =?utf-8?B?S3dURW5LcnMxYU1tY3F6TFp0TkticVp4SlhndnlDVTdSejF5empma0c0NTdU?=
 =?utf-8?B?VlZlb2FYNTZPTmpLK3VTVk4zT1gvQkZmR2dqUWxtenNEZzBZWFRmMXViL3Uz?=
 =?utf-8?B?YkVuV2NKSE5od0Y5NFlNTFUrSkZ2YWZFYzY1Q3I5YXJSbmdtVU5udXV6WjFT?=
 =?utf-8?B?cUxBVEltV09iWHl5MFhJdVkvUUN5VnhVSWo5UTJ3U2plczYyS1VEOHVTei8z?=
 =?utf-8?B?OFdVZTJTYUh2NUZKZVkzQnZESnZqWU15Y1ZNQWRxSFpsajcwczhoaWFsVkhS?=
 =?utf-8?B?ZGp5RGxzZHBPNFl6WUdra2ZFNER5YkMyNEdGK0NoZHlBaCtlRHB3TGZsRWFk?=
 =?utf-8?B?WWo3ZFdtWFJUbDFUbEp6UkVmcnE5UTI4MC9FVzVmNXJhZFh4bW5oNTc5Mk5J?=
 =?utf-8?B?OFJKRFNRRWMydTh2VmQ2Mm9sTmd6K2tTRDJiYjcxKzZCcDdpMnk5U1dZb29F?=
 =?utf-8?B?dUtBZXNqRm1sMUYvZGxJVG5hU09hTFRUeUJHR25KTDNOaGUyTHI3S2puWmRa?=
 =?utf-8?B?M0NjSXora1BRZ3YzV2xNek1mNVJ3UG5iL3NDQy9CWGtiSDdodld0MW51ZVRp?=
 =?utf-8?B?aWpzNHZEejZoRUI0WS9DSzRSYWZjQWh5YlorNHdRSnIwRnVFRmZZZEJDZnNn?=
 =?utf-8?B?RnAzSkNTZGFQTUJjdXFsdytlVUkwSnhWNGp6U2RIWDlSZ2tmK1Nwc04zbzBE?=
 =?utf-8?B?a1RIeE5OQTArUTdJRUVGMU0reSt1NU5vay9WdnhTN1d2aDdTSnZJNXY0SXo1?=
 =?utf-8?B?V21zdFVocDV5cTN5RmN0WWUxWDM3R2RxRXU4V002QlZkemVtYmp0bk9ia2F4?=
 =?utf-8?B?UFdrYlkzWGFFR1RiUDZ2bmttTDhvSHFBK3dBam5xd0hRTTZKZ0RjTUQvKzlH?=
 =?utf-8?B?dTRtcDgranovb1JpT2ZaUEZlVCtlSHljd1VXTzRTeTczQ3lqZk9XZWsyVTRn?=
 =?utf-8?Q?8ekzukVromgFJTRlLssI9p2X+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ab3858-bbb1-4760-9cb3-08da76016317
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 10:09:15.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ed+gd1DvhFKxaGW7i6XnPcQkudamq/GJjR5oy88v0y8qIbnwBwL7yiouihywr2yUc+yksNFGwf9CHwQbvZkPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 02-08-2022 20:16, Rob Herring wrote:
> On Tue, Aug 02, 2022 at 04:15:28PM +0530, Sameer Pujar wrote:
>> Hi Rob, Krzysztof
>>
>> On 02-08-2022 01:00, Rob Herring wrote:
>>> On Mon, 01 Aug 2022 21:37:30 +0530, Sameer Pujar wrote:
>>>> The "convert-channels" and "convert-rate" bindings are provided for both
>>>> simple-card and audio-graph-card. However these are separately defined in
>>>> their respective schemas. For any new binding addition, which is common to
>>>> both, there will be duplication.
>>>>
>>>> Introduce a new schema to have common DAI params properties and these can
>>>> be re-used in other schemas wherever applicable.
>>>>
>>>> Signed-off-by: Sameer Pujar<spujar@nvidia.com>
>>>> Cc: Kuninori Morimoto<kuninori.morimoto.gx@renesas.com>
>>>> ---
>>>>    .../bindings/sound/audio-graph-port.yaml           | 13 ++++------
>>>>    .../devicetree/bindings/sound/audio-graph.yaml     |  7 +++---
>>>>    .../devicetree/bindings/sound/dai-params.yaml      | 28 ++++++++++++++++++++++
>>>>    .../devicetree/bindings/sound/simple-card.yaml     | 16 ++++---------
>>>>    4 files changed, 40 insertions(+), 24 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml
>>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
>>>           'type' is a required property
>>>                   hint: A vendor boolean property can use "type: boolean"
>>>           'description' is a required property
>>>                   hint: A vendor boolean property can use "type: boolean"
>>>           Additional properties are not allowed ('$ref' was unexpected)
>>>                   hint: A vendor boolean property can use "type: boolean"
>>>           /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
>>>                   'enum' is a required property
>>>                   'const' is a required property
>>>                   hint: A vendor string property with exact values has an implicit type
>>>                   from schema $id:http://devicetree.org/meta-schemas/vendor-props.yaml#
>>>           '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not 
>>> match 'types.yaml#/definitions/'
>>>                   hint: A vendor property needs a $ref to types.yaml
>>>           '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match '^#/(definitions|\\$defs)/'
>>>                   hint: A vendor property can have a $ref to a a $defs schema
>>>           hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
>>>           from schema $id:http://devicetree.org/meta-schemas/vendor-props.yaml#
>> I am hitting this error if I use properties/definitions from another schema.
>> If I define it locally, it works. I see there are examples where properties
>> from different schema are used. But not able to understand why errors are
>> seen in my case. Am I missing anything here?
> You either need to use 'properties' with actual property names and
> reference that schema from the node level. Or you use '$defs' if you are
> going to have references from the (DT) property level. I think I'd just
> leave simple-card out of this and do the former.

Above errors are coming only from simple-card. The audio-graph related 
binding checks are clean. It seems having "," in the property name is 
causing errors for simple-card. Is this intentional?

Thanks Rob for inputs. I will leave simple-card out for now, but will 
use $defs. The reason is any other vendor schema can make use of these 
DAI defines. One such use I see is for (../sound/fsl,easrc.yaml for 
"fsl,asrc-rate").
