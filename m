Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3F589AC3
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 13:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C54584B;
	Thu,  4 Aug 2022 13:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C54584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659611450;
	bh=xn75cNUpElIAyRbhYVJHZ6O5OQJz7vO36GYljpujDqY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/HrLlEKgGNop6/cApkHcUiyCcXze1D1ceTDpXYkgdKDK8kABEQFDw1ldH6cgWXWt
	 TjH2KVKmgVgPIWwWBGhk7uKpnKQmubtherv9X9rH+V/28n+AmxYlCzpBwiW/ysNnjV
	 S1k5SG0N4Qc2wQ783WtDjNfwx6v16w96CXR1ynqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C05EBF80163;
	Thu,  4 Aug 2022 13:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D134F8016A; Thu,  4 Aug 2022 13:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, NICE_REPLY_A, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAA6F8012F
 for <alsa-devel@alsa-project.org>; Thu,  4 Aug 2022 13:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAA6F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="F+qtNun4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIp7jELh6AyNM6QzkTc+mXfkvIJl1KeULQTbbSONlLrOvwdn8RkL8w2mGWM+anyC9taCqIO7mJVdma5ouQPmzQ1Bj9Ifm7eH4rGwRGJXmfUF5Hl7hMNnKLuSniXrsaqK7RPSrxEUsvj3y0tFQrEY07CFUYFcwwI2G2D34dHpiJAA00+1J5BAhvCyr9H5FSDbsZoE03an44AoQsN5Ph2C9Fhv66ovkUFU5RWpsV2d5RGQmP/JDDj3x4AcI0BS8RUzwdQcw9iwdkKqQvuoBdZHFvl38Me//KjJDcTwK+HeZuS07NHdUZjuCoKYoKmD5eemTIAKanFwg93uaqsKnvfTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4+F4goXMFUIRYOCJpldzMGQj1Qhto8HdO2wpVv1NDQ=;
 b=KiCz/Q9iMMLXt0ewYggnksyDiXkDB3wvNUE1om4gGnku8V2lJHWNtwcmhG3S5S57szfIaAwN9QOFVSXb7UN7MYDEzUmnjiwmMbHj/IGdChKKH+ebN9mZwEiIgQ+LrG5ww2bftP9vBccO4B/zSntaT6b43CKuvuhiPjkrkfMoGVpbYkFyfyWs9aFB91M2sQ3XE7BmCSYqjsiww+eMdmZ0zvEGNxtJUBmRfyzCibtHBTZGKfePvmz5TosnavxBb2mbvZwALFazX/YU10dDUITkkCr7ZZDN3Xmx4PESnn7DfBWTBGj3RSsJEmlfj2RStVzu/aJ88R4TdAv7/ZLwL+iF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4+F4goXMFUIRYOCJpldzMGQj1Qhto8HdO2wpVv1NDQ=;
 b=F+qtNun4PcKeSPQfMQJKHBAyrinkcJYXoxziXSOgtan+/0XLYNzVR/4HJjyTPaJ4IRopoupGYhinoapD3mx/DlfrjG76swiSkwnSa7RQltlNrivrXdfnqJC/WPRzdrmgA4/d44/tyICzSx7mW2CXQ0US671gu+8+k+m/cxl+0XbjFHkCoyHcSvHr9syaPXQAT3fi4+B0eXWBh8S7oNIShJH6xQSzOkeB7Np9mzjiHjOKUKQziGc5qbKbbBenuxda8aphgUXPru2lXk7nwTHtjAq7UblAjoAR6A4EFTOZbbWrYH1f/Hllmwo8/3dvP8eHNx/utE7Z6Hk79TsywXxOzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by BYAPR12MB3607.namprd12.prod.outlook.com (2603:10b6:a03:dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 11:09:38 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::8c7e:4e8e:3225:34c2%12]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 11:09:38 +0000
Message-ID: <0272bdfd-7515-f7d8-03c6-3cc69095a65b@nvidia.com>
Date: Thu, 4 Aug 2022 16:39:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add sample format conversion
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-3-git-send-email-spujar@nvidia.com>
 <20220802145008.GB30116-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <20220802145008.GB30116-robh@kernel.org>
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e55f4c8-7f89-4ea0-86db-08da7609d23e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3607:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZpxMlAH1DyD4htPmO++scxos/7YJ5nL2exUC7QML3jzM/6kHh50f4+LJusxH0dMkxVX038ndJQEyaxEEoUfNvqOAQskdfFmSBaNQHQ3tRBsv2bHwreuq1rftUPg1CTY3Y7aav7wwl3w+i4BetObLopt4nVGSYjbFkRva+7CC5ehhABVChf9SvlmGSKMTs1WlgCkMvDl97RdgbXjivxHBp7fCsh/p35TSwodR/0zwxtkPlmdfzodiW4xmEfZAXF10SmuCbWUE67gtI8CVha4Z/Y6uCgkxcE2KFAmgGzcqBplpqMYeOCmoINxDwHRk5AUkbblGDCyfJ7hV1NMkfOys7rfbrNi/DnRq8cTEJYcTzLGh/pitVaoCkv/rJL4/Y6MdOa8ZsJsBnVSHK2DD2EqoPyQ4tFe0EgVYRNN3g90/oQCS93ee9aPxPBSurx2EKsbW7t0/V4fLqFF2VfyMLN49wMoHWig6/Uf3iJQjvst/dGBKdxnGSYawbzrz/uQjfBUa3gKexiT5Q6GnEjH4/f+9e8ZFz5abUdZxJ2eKXaZGxB4lE28Gb7ZPmly22h/uf1tiOiuzGqNcir6ZXHYkcgij/dTwxGuthFljMWBOt6rqPgLvgyYaBq5KVo0m8PZaJQp0E+452XGzLVOOomaEJZ5zhkc2oraliD6tp1MbVWzaO8nos0M0joQWYbfSfRug6VAOkNF98mLIb5aX+JBKIhhy/9jfWQvt9Hyv3m41c6pW8kK2lcxOmS+j9AAGteIYy5BbPiklAHwC/E6Y2LrO7o5Et9Ht+tMIufa9824LtS1VpTnN3igiRPPmbORR4F+FspX1mZcwm5cuFKOJenUwHDmQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(53546011)(33964004)(6506007)(31696002)(41300700001)(2906002)(6666004)(2616005)(26005)(86362001)(6512007)(38100700002)(186003)(83380400001)(31686004)(36756003)(5660300002)(7416002)(66946007)(6486002)(478600001)(4326008)(66556008)(66476007)(8936002)(8676002)(6916009)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZlQUZ3eXoyT1RMZkM1MGNuZHpBdkUwNkRjTUxHeVd4SVc3alR1VVFNaXdo?=
 =?utf-8?B?NVJJbm9IZmhMckVSc3pSK1lFV2ZDYSsveWN1QjM5NUxneFJsZEVkOTlWTnlz?=
 =?utf-8?B?MWlTZk1saEFIeXlkYWxjNzArcW9KWmhyNmxmb1ZaWVhhSlBsdjRWUWNjakM4?=
 =?utf-8?B?SC8rUjFMUlNCaTYrWm5wcG51NGh1eEZvaFhTQklsQmlFZFovNjRUcXQ0b1d2?=
 =?utf-8?B?SGM2MVJKbUxFek5VeWRuaVJkdE1yTVRLSis2YUt4cWpNOUhQeU83WWJtS1Jr?=
 =?utf-8?B?ZG9NbWtROTY3Nkh0THZsd05tSUNqZk9BamE2eGUrZHpRbXhTaFpyV0VLRWxP?=
 =?utf-8?B?bzlPZnZVUG10Zy9xMjhpNCsxdEFIYmhFM3E5SGFoMkN6bHFTSUNoNWkwMjA1?=
 =?utf-8?B?Q3VkSTQ2NVcxWXllVkJpZUZUUmJISWJCTWtoMjBsVmJFMDhHZkl2bk1BRjNs?=
 =?utf-8?B?SHcxTzRqUzhaTDRnaUxFenJqeXNKZWRzK0NUdTVPV3hnWGNCVTVUVjRSVXdF?=
 =?utf-8?B?ZDVwU24rUlEzK2ZzeHUzM3REQklWY1hKVG1laXo3NFpkTVgvZ0VlYXlrem1P?=
 =?utf-8?B?RUgrc01TZnAvWFNvVmNXcXZwdG1KeGhPekNUN3piQXVZREMzcWY0OC8rYU1p?=
 =?utf-8?B?K21ic1JTbU1TWnJ0MmpsS05QcDVXdmF4ODhpRnZaS0RYYWRZOXJZQWF4YnY3?=
 =?utf-8?B?c096TjhQVGkvaTR4SjN4aHNwMHdBdWIxNnRXRFJLOC9qWkNmTmtqNllTbzcx?=
 =?utf-8?B?QVFNckRLbjZid0tCRjVDUWk5Q0FNM1A3bGhUbjNiY2E4TDZ3dzludzlHVVFJ?=
 =?utf-8?B?ajQ4azRCcUpnN3VoMnpFbmNBUmptOEdkQWlncTBxSGo5UjBGQm1qRHRKMWI2?=
 =?utf-8?B?SDdRaXdVU0svT01oRXB3MkFuNmdDNVFTL254QUIvYStwYk1DWU9vS3d1ZDBq?=
 =?utf-8?B?eWdXNjJuVXJFOU1mdTYvcGtZTUdUUjAyRkxBLzc1ZFdZSVBPVENzU2d2V2ts?=
 =?utf-8?B?aTBSWno2ZG1UN0RXSlFDUjVseU5QM2dpenZTQ0k4NDU1cE1GcDMzaGVGU28w?=
 =?utf-8?B?Q1E0QjgvdTB5eFVidlZxVnpsRXd4QjBzQ25Hb0lQdVhSUkFucWpES0xiekNn?=
 =?utf-8?B?NzQyYW15M0w3S0xDOWt2cTgyT0xEbzRnU2tXSkNLLzhCVDJ3K01wTnBmbnpQ?=
 =?utf-8?B?NFQ0STA2eldFUkFUL3BxU0l0MkcwR1YrR2szaTU0Zk0yMml2bEJOZTJWdHBU?=
 =?utf-8?B?eDM4Z1k1L3Ixd3FhY0hvRURoaEVMTmNvVzJPK2lWTTQzWFlwdWZkK2h2MDkv?=
 =?utf-8?B?bHpobFJyelFOWnFPS0UzTHVLR3VKRWhDdG84QVVwOWVEOVVIZWVKcW0xMjd0?=
 =?utf-8?B?RTQvdTgyeXdUS2dUbFZyVXBGSW9NYTY0bFJFVEZ5ay9zK3lBRjdabDRXR0xq?=
 =?utf-8?B?cjFON3dZTGptYWFOVjBYcmNzNExnTHJZd245azZ1aXc3QjArYWVSSkkxMmsz?=
 =?utf-8?B?ZHNyRTRHaFA2ZC9wTWtqTVF2cDRydlZJdW1XU0JCdWZDcGx4bzBlazFRN1k5?=
 =?utf-8?B?TEMzTnBkWjZmbTg2RHQwM2M3UEtRYk8xUUsyR2ZpcVJUR0V5WU9iSG50TDRz?=
 =?utf-8?B?bEcyVC9MQlIwZ0d2VkViR1RMYVRDVTc1M0ttSHNxWm1mRGg4S1pVeDhWTWor?=
 =?utf-8?B?aFFGQVFYLzR2dkR5cDNlOFNielUveGtNb1BMbTQxeWhPNlQ5WFlleHN4OU9p?=
 =?utf-8?B?L0pLeVQxdm5RTXovSjR4dXlMR2JOQUlkQnQ3NkdsUCt6U0M1UXVCYkt0WnlU?=
 =?utf-8?B?UDYrRk1ZTy83TjNMSnZWd1RweStRd0lPbC9MVDFEWnNwdUhLSkZQTTJZWnU4?=
 =?utf-8?B?dUNlQlNPaHd5dmdJRWR6M0pCMDB6cVZMT2NUellpSm5Kbkk2WmdwSWNqWWpt?=
 =?utf-8?B?YWxRaE90T1ZabEJZRUJISm5OK3VXTGJwL3hoY29zWXJHU0hvdGJjR0xCOGFs?=
 =?utf-8?B?ZkExQmE2Zzd0dTlkcTIyUE5ZU1FVUVhPalVVWXcrT2E3VFkzY2VieW9WUk5Y?=
 =?utf-8?B?WlNaeEVvZE9ORVNtRHIyY1VrZlgwT25DcVBPK0wrYktBSWE1ZDMzYW0yTEsw?=
 =?utf-8?Q?eAttJapT1v8q2MpCksHL7yXTi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e55f4c8-7f89-4ea0-86db-08da7609d23e
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 11:09:38.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxLomFH4vXa9+0mESlCC/yU4fL91Vn58lqYmdVv6ndC7PPA6VyqpwGxjRM+UJKzoCQ3P+56KLgpzHNxnIUhGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3607
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


On 02-08-2022 20:20, Rob Herring wrote:
> On Mon, Aug 01, 2022 at 09:37:31PM +0530, Sameer Pujar wrote:
>> Presently "convert-channels" and "convert-rate" DT bindings are available
>> for channel and rate fixups respectively.
>>
>> Similarly add "convert-sample-format" binding to fixup DAI sample format
>> as well. This is added to simple-card and audio-graph based sound cards.
> Do you have users for both cases?

I don't plan to use simple-card. Just added for consistency. Will drop this.

It would be required for audio-graph.

>
>> Signed-off-by: Sameer Pujar<spujar@nvidia.com>
>> Cc: Kuninori Morimoto<kuninori.morimoto.gx@renesas.com>
>> ---
>>   Documentation/devicetree/bindings/sound/audio-graph-port.yaml |  4 ++++
>>   Documentation/devicetree/bindings/sound/audio-graph.yaml      |  2 ++
>>   Documentation/devicetree/bindings/sound/dai-params.yaml       | 10 ++++++++++
>>   Documentation/devicetree/bindings/sound/simple-card.yaml      |  4 ++++
>>   4 files changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> index 30a644d9..8e64192 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> @@ -22,6 +22,8 @@ properties:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>>     convert-channels:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
>> +  convert-sample-format:
>> +    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>>
>>   patternProperties:
>>     "^endpoint(@[0-9a-f]+)?":
>> @@ -67,6 +69,8 @@ patternProperties:
>>           $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>>         convert-channels:
>>           $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
>> +      convert-sample-format:
>> +        $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
>>
>>         dai-tdm-slot-width-map:
>>           description: Mapping of sample widths to slot widths. For hardware
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
>> index a9cd52e..93ddd55 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
>> @@ -30,6 +30,8 @@ properties:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>>     convert-channels:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
>> +  convert-sample-format:
>> +    $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-format"
> Can someone explain why we need these properties defined in 3 different
> locations? That's not a great pattern to continue.

The properties are defined at sound card, port and endpoint node level. 
I guess the idea is to selectively apply a configuration to a group of 
endpoints/ports or just specific endpoint. Morimoto-san can comment if 
there are other reasons to do so.

>>     pa-gpios:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/sound/dai-params.yaml b/Documentation/devicetree/bindings/sound/dai-params.yaml
>> index aae60cb..933957d 100644
>> --- a/Documentation/devicetree/bindings/sound/dai-params.yaml
>> +++ b/Documentation/devicetree/bindings/sound/dai-params.yaml
>> @@ -19,6 +19,16 @@ properties:
>>       minimum: 1
>>       maximum: 32
>>
>> +  dai-sample-format:
>> +    description: Audio sample format used by DAI
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum:
>> +      - s8
>> +      - s16_le
>> +      - s24_le
>> +      - s24_3le
>> +      - s32_le
>> +
>>     dai-sample-rate:
>>       description: Audio sample rate used by DAI
>>       $ref: /schemas/types.yaml#/definitions/uint32
>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> index ab03a2b..ec21190 100644
>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> @@ -183,6 +183,8 @@ properties:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-sample-rate"
>>     simple-audio-card,convert-channels:
>>       $ref: "/schemas/sound/dai-params.yaml#/properties/dai-channels"
>> +  simple-audio-card,convert-sample-format:
> Don't add more properties with 'simple-audio-card,' prefix. That's not a
> pattern we want to be consistent with...

Will drop this in next revision.
