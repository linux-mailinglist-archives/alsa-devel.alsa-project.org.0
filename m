Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C587AFB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1EB1F2;
	Tue,  2 Aug 2022 12:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1EB1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659437212;
	bh=bzWj8YdSod7FK9scJ55LEiTceSBNYQgV0kA2T1ON5QA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OaYH+gzSdVOOzOLFcK1CTc6ojYoo5PrxbPN1t7OsNXVAwDeHz5vFcClg5XDR1YtOa
	 SrvfQDbOqGlTVJ0Tnv27hH/LoF1dU5V5K3aYJZPexmAccKF87oeR4zqOisLq2k0jGo
	 8wx6rKXLWddxQ0QeZjmjV2fCSJkbsn8r2tsnLssY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF4AFF804A9;
	Tue,  2 Aug 2022 12:45:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4706CF8026D; Tue,  2 Aug 2022 12:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B49EF8014B
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B49EF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="l9GKZEwt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnVRIx02IR3Gt8frkMyegazY1RyTMfXFvSi9kHEqGbxJkuVFp2lY3XLU/67HVi9NmJ788KZfgrnRuwXkizG0kv4w6qaW7ZEu8onx0it0uGvYEFxayihflfc//RjieTUohJ5CcZ4xwTlWM97DUj/SFZbNzWnYX+xksxeHm8g0s5/n6n18JdqhDuyRpr+ab+FAsIHWis4Oe/XIh+6VNlSsWBslSqnbQvWsv+rDdcWhKEf2kzLsu/SXl8DOZHULzMutEQp3gJEiRfUevcgXpgSkNlNk5qbAvWk2jGDeQnW+vVwTV/a5d3HPFg/WMyM9zNegGnX0j8KesQYs17trhfeKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoQ/Xo1CnBpxoakWQgydPOX3FrXuoXQf/vc9lEpLOkc=;
 b=HzbvT6XKG5XI/njLxbZdW9rP83jkYInV3R6FMu6NPCNOR7rk3YbUKDgl0LYYzZ+yEQ9U2UEbwRP2D8O698BqiC1EYsqcHR+62Y0asHLBxwoUD09MJJ3bjvFZTjhX3WBpHtutFPBmS+ebSHqrocaW1ubTP4zFYhOPonovJE4Rts6O6exJQaY+oC3HD22YyENh1MQ+P8Smf3FoNUBukWMdLQIU9n5LeRQ14jy03wJ1MNSFziJRybexkwB48zLP4/L0k7PKCR3Z4ANsG0aAk6V8X7MYVONWOgAv4+iBJirSM090PUplo6PcQFQcj1UWV/fMkRaDo+LxKG2LXs48LkuafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoQ/Xo1CnBpxoakWQgydPOX3FrXuoXQf/vc9lEpLOkc=;
 b=l9GKZEwtj19xFtRaA28OHIlKjJ86YgA3vXAyUMjJJSbf8EnjwsFGEfAGtvM+bXaps3Hh0LPrffrCDjlI1cH5VZwv2dD9tx1OYPUD2GTK+R22wpQ8sptIGkHbTH6zpVbnQkRLb8HV47O3EuPtOnDy+uIBQycIkyA/u/kBJRkmklItR9Z+WuEVHpWoBkZ4yJrCUnPA9LT54HlSwGOnz+qLX7MVld7zWVlaOr5nPKKlIEERpI2Ai44piFXehkWXM6vgh3O9PkJFmVUTCp1NHmMMLkAKXuFldGhKSLtMaUK5hhSKNWC83df/9E3I1iaA1TEtojoajotpxpJhgIgxRufLwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 10:45:42 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2%12]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:45:42 +0000
Message-ID: <982b3f0c-0b6c-d531-3d75-27d5ca1aabec@nvidia.com>
Date: Tue, 2 Aug 2022 16:15:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add schema for common DAI params
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-2-git-send-email-spujar@nvidia.com>
 <1659382247.124005.1380281.nullmailer@robh.at.kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1659382247.124005.1380281.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50653b56-eb0c-4339-34c0-08da7474254d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDx/E3GFYIjs/6QdJfN3KoC8ny4iLeUnI9VcYVlg59WBhMa+mtMdzq2PTI+IitoLbQsIbOz0871i7ZmeNqC2r7nNdedVu8ZgvHYOVuhzNGgDYo6HHnndeA19qT5/FHV1YKKhiiILMYSjJVRvU1rnBExD1nJZ0WIRf0gttmKrPQgFvPiguF4I7f+C0Rq2sKln5lP+Xmc5cZmcWvzG4u/tKmNCaIiIKJriG/UdWGJalnkEUybRk8J3xp/hRnahr3qlnf1uc9yl0huaFYpZIbvfwAKgaQ95Y/NPVPioRvircewX1DQvsD5lEKLGs1jOxsdAqWRyEdawGbZCpHxPz7CbZ0O8jGWVA321ZRBqSXbnJMOl0otVuoRJ2ZuQsiE+iyF+LwimvCe30IcbfWbk9hyY14kvfa/fowXeFABxr3dCgeYHUkWn+qcCUWhF3zJ+Foz9/UGfQtQWu4VXXWs1WCTmjESKrT8iw0JLgXvvs7rumfioJDPW9eYJU4T3gKkwTzkiOLuBidzFCr3U8QWB+V5PLg289odIs4Qje2EEIfAYUroheM9V0eo6XV1GAGBAiYw7SCSr0nw8lDy37ATXWiDWi4yKrRO5doY7nb3MQ3pk0It95sRZzZaRGP5Bftx1jw9wot2YYcCEhIvZKHAry4Zg4EWBdirLfS7omKJe/3vuLz6OTx3ngsh6ybMDkPjjMC18LHcmwpfNzZ6iq5E82sfWtQiiWqlSUdoJXvPz7QbOnhk/L7ouTPYoPiJ39ZljR81Iar6mLo5wWyC+aYFxvaUIuNEpDH0aEQl6+zSA9m4zxHULqKo5yUEdSbCi5pMEKoLFEWXVHMRoDiHvl4fvDGP0NtEXtQTQ9Lifs8LWjVx0n/1Psp1xmUSahO0BAUBLMbQWkDSr48En0yvVh7JYZFTgNcY2uzIGCzy1MZLKDhP8GvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(6666004)(38100700002)(41300700001)(6506007)(186003)(83380400001)(7416002)(2906002)(6512007)(6486002)(966005)(26005)(36756003)(31686004)(478600001)(316002)(4326008)(66556008)(8676002)(31696002)(66476007)(8936002)(6916009)(2616005)(53546011)(5660300002)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFgvV2MrcnRCOFNXWDg4SzdYUDRVdVh6NjhXR0t0dXpHUU5mc0tHYktIVEJJ?=
 =?utf-8?B?RkZkTjlSY1NabHhaVlJSMkN4UFd4eThSeS9NWmV6Ym92dyttcFg4Y2ZuRElL?=
 =?utf-8?B?S1RPTTM5TFluSkZTVHFGWTZiZmhuUFhIZjVVVC9hMHR2V1hNbnRZNVVudFZT?=
 =?utf-8?B?THprR3M3YWVZa0t0Q3MvZ254OUtNbXdHNzRMTTRNN1lwWGJrZ1BDOU9TSlpx?=
 =?utf-8?B?cVIyYlo0K2k5c3ZaeHk3R2FkVVNJNzhNMlNsc0pYbXd0aXFnYVE2YmZmd3du?=
 =?utf-8?B?MFQ5eGlNL2pIVVNod0hhYU1QWjhLdmVKQnFhbmwyNnJLL3l3a3FIMkdlZ2pK?=
 =?utf-8?B?UWlRUWFRL2ROaHdFVHF0bjQ1aC9vUXhvQmJ6OVJXVTJBQ01FQ0FjWEROd0o3?=
 =?utf-8?B?SXFaZGNXNERCSlhFOUVGSjhNdVJXdnU4Rm45VEF2R21vOFYxNFNVdTJrWmZL?=
 =?utf-8?B?VDNQQUkzZ1g3a1lubTRyTkY4dmxSd0tRWjlLWGY3bjUxL09TMGd0bC9RSWJ0?=
 =?utf-8?B?cUNMcEo5WnRHUGZmL3hrU21TSnhwQWlRVitnZkFTT1FHTGhZa29XcitMWlZY?=
 =?utf-8?B?UEJRYktSZ3VjeFhvQTJ2MkxLZzdxU3F4cWx3ZkwyS3ZEaGR0U0pPRy9XelhQ?=
 =?utf-8?B?a0xhMXZaZjd0S09UdWx3THlNaVBZV2hscDZvZ3ptN0tsY1M4cnNEczdlMXN5?=
 =?utf-8?B?Z3F4L0thVElTNEZvRVdjTE55c2kxQTNBeDlMUGY5TVpsSVBWNjJNS3EvSlZT?=
 =?utf-8?B?dmFiU2RHTlVFcWtRUlNkT0xoenU3VkV5bnV6cnRLMUcrd05lcktpMDBSelps?=
 =?utf-8?B?NFczUmxpa295TFFLeGNqSG16SmI0ZHhnNk1hc1pranhkWC95Z3Y0SGFBLzc1?=
 =?utf-8?B?cTdUY3JmYWxpcXA1Z2JxdjNqbE9CblVYTCtFbnd0RElETzZxSW5uTmtxWlVu?=
 =?utf-8?B?c011Y1BIWEJnZ3ljelJpdnVnd0xsb3l1NnVRVTM3clhpSlJCVW9OVlo3TGh6?=
 =?utf-8?B?UUE1TEprZHo5aU53NGxndnltSFdZbkxlUHdkeUhOcnVBRlFLWmNiN0ZCbG9w?=
 =?utf-8?B?dDdQQWIzR1VRVmtVRXR5aEZNUytFSk9vNCszeFJubXZ6T3hhUlAxcDBuM0dn?=
 =?utf-8?B?cWtrNThSS05tWWdsb2g2NDAxWmV0RXNBSU80M3lqaTZUOCt0MHNyMXhBVlo3?=
 =?utf-8?B?dXJzVFFkVUNmSVdGbU5tT082S284UTZsaDlMV0t0MVlWWjY2WDVoSGE4U2ll?=
 =?utf-8?B?cFYxM2ZNbFZ2N09MWG1XNDNkYS9DeFljY2ZvTTk5aEhzTmNlZFVCczJlNlhx?=
 =?utf-8?B?RFRQcEI4Z05XRy8zVmhTL0xtZGNsejN5WSt1d2NDeE1rVW0vS0Z2N3BJbU0w?=
 =?utf-8?B?bDU3azhGbjhQYU5iaUpaYUxUU00zQTdWbllUZTB4Y1ZzYTRrS2E2VHpjYlE2?=
 =?utf-8?B?c25VZEZBNkJib3g3QndWMDlwdFRwZ3l0R1dGck9INmhySDJ5Y2xvcDdKUUNm?=
 =?utf-8?B?OFpOWHJxcU4ybmxCdVhkSkpZZm9HTC84MW45aU1mMEQxZW1GZlBtK2xhZ3Ez?=
 =?utf-8?B?Qm5nR2doOHFoSm5TMnZOdzVRYlZnZyt0djhZWm5yRjlBOVd6dll0R1dveG9E?=
 =?utf-8?B?NzN4b1U1Ymg1MU1OU3QxOUZOaW12SkJWUi9OYkVGcGQ4VHU1N05yV1hwTjJa?=
 =?utf-8?B?QXNTOVR4c2R5TjIrWlNBd0kvd3ZrUjdnZVRONjF6emZQQ2tjbjRya2ZjTm0y?=
 =?utf-8?B?ZGZLZUdIVm1LbmdDZnVJRm1kK0k1Z0YvdFpUSEN2YVpUSGxXeG9XZUp5bzFR?=
 =?utf-8?B?bDdSb3lPbldIcmYwc3V6NnNBSUFkOUtXMWFiR2RiYmdDcCsrbnNlTXNZZzNW?=
 =?utf-8?B?M0g4WllSRnpKOXMyaS9XaWVDSFZFcFJPcVo0a1NjQ21RYXhpYnA4aGFtaC9J?=
 =?utf-8?B?ZU11UWJma21wOEl2aGZNbVFvZzFJTndMLzZaakZGQXAvMjZMSHowcm5jK3pC?=
 =?utf-8?B?ZVFqcTRncEFqRFdoNGllUHJaaEJGREpxS05qbzdLYXVCdU4ySmJrY2Nid3ZZ?=
 =?utf-8?B?allMbEY4WWFmeVo1bWVNTytoOHZaZUVhZVVXS2hEclNSbnpINW1yS09qbWRT?=
 =?utf-8?Q?aUzlaLq5I9dwNl2VBDNmUjX/H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50653b56-eb0c-4339-34c0-08da7474254d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:45:42.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu1LX0lV/CPi4GGoXxC5KD52/E0C8923Mrp89qqzVxFiXx4cVR9cK3pUzQ48LRkk2PBFOwnDIf3U71uoqhm4vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

Hi Rob, Krzysztof

On 02-08-2022 01:00, Rob Herring wrote:
> On Mon, 01 Aug 2022 21:37:30 +0530, Sameer Pujar wrote:
>> The "convert-channels" and "convert-rate" bindings are provided for both
>> simple-card and audio-graph-card. However these are separately defined in
>> their respective schemas. For any new binding addition, which is common to
>> both, there will be duplication.
>>
>> Introduce a new schema to have common DAI params properties and these can
>> be re-used in other schemas wherever applicable.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>   .../bindings/sound/audio-graph-port.yaml           | 13 ++++------
>>   .../devicetree/bindings/sound/audio-graph.yaml     |  7 +++---
>>   .../devicetree/bindings/sound/dai-params.yaml      | 28 ++++++++++++++++++++++
>>   .../devicetree/bindings/sound/simple-card.yaml     | 16 ++++---------
>>   4 files changed, 40 insertions(+), 24 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml
>>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
>          'type' is a required property
>                  hint: A vendor boolean property can use "type: boolean"
>          'description' is a required property
>                  hint: A vendor boolean property can use "type: boolean"
>          Additional properties are not allowed ('$ref' was unexpected)
>                  hint: A vendor boolean property can use "type: boolean"
>          /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
>                  'enum' is a required property
>                  'const' is a required property
>                  hint: A vendor string property with exact values has an implicit type
>                  from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>          '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match 'types.yaml#/definitions/'
>                  hint: A vendor property needs a $ref to types.yaml
>          '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match '^#/(definitions|\\$defs)/'
>                  hint: A vendor property can have a $ref to a a $defs schema
>          hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
>          from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

I am hitting this error if I use properties/definitions from another 
schema. If I define it locally, it works. I see there are examples where 
properties from different schema are used. But not able to understand 
why errors are seen in my case. Am I missing anything here?

