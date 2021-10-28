Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C343DC52
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D2D16BB;
	Thu, 28 Oct 2021 09:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D2D16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635407134;
	bh=s0UIBnnPtba4DyDHXk/+KwGD3NqBiFVYhLfU8Y3GLZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyA9XFOywZPUu3r8HVMG3cEmdUDgutLZToQ4zanb2zpjRJG0/6rwSVE1kOcIGuBJv
	 5xLTuHu11sqilE3hL9v2O2yFMUvc5Ym2v4XUo/iPNdXVQHnRrEliwmHMY1NXJ5TVXG
	 AlcrHpwybauOA9rxdUdi74ofIdePaymNZ+pUt4Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C68F802E7;
	Thu, 28 Oct 2021 09:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D81DAF802C8; Thu, 28 Oct 2021 09:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E79FCF800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 09:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79FCF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="QA9EplNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAlVMjw65uUje2wCNSOEnC0neXo24zasbuh8UP4+VUQF88ctD0WI/q50kC+hVboxkhkYGh+wOxRYgb5omXDi9iLrK+D2cP70XRLVi4VEtydT0UmKmVsb5NjsyAIPeMNUcyTEHtgz/a7+H0Q4A4fiuMJJDWqV8pwzRWhniy5of51UwdiWxS7a3INIJd2SldM65FBCmhGA/WnxAjAD3CRtkGAeBri3odutTASH6sHGJHKH0m+wD8OPvGx0McYXZntYRfNXkw2Ozsyuygz08g3LZ727kaRsJvBtVDhJxjJ0cJxH+lA4eUbCTqUlWs4HCDc7tAITOJfS8nqt2fdwbp/TJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlAm/TPkmrZrovqgbNRmMvoLToKV01ZOMOfvIihisEw=;
 b=bZozm7G4ZGU7fKAuWZAyCafeEgtwEgPkLDclftLDuG1QXjfGh7LDyqwM0T/Yuy46Uhvj5A46CP/xGoDZMIbO2wLlDV8hm9Z1cVlIOSyPdDkJw15YLCu0JTvgmz9uI/DzJE6AceMUCn6DcMlxBrA1U4GG/K73D294Sxj1to06m+rhSRXN+cfcuh7RqVpSyVIpqC4N80mQpoNLZE9EjvdizMTRREwfwsdRsecd4ooeA5oMDInatIbnYYl2SXcS663dwqH1W4NA2mTChS31NFbH5xEyaFEWRfSk2/ztjAooAphvroSwUO9m0iSdlOPTNKLyN/e4nH974LQYTYXpCF7vtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlAm/TPkmrZrovqgbNRmMvoLToKV01ZOMOfvIihisEw=;
 b=QA9EplNbmHhaxw9/1rx7u0fIxx3XHTNZDH/QEpzR2LF109CHIIs0JawgaCPkM34yFOoXJRTMrKWFuXcXdkplkUiwitVbT3+2P69GplgCCc840+ml2JCLxCrDzCmDbONxOFrmZUek4QP49FTFr113KmH9CBcGp9W7bydPL6iwd0k=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK2PR03MB4322.apcprd03.prod.outlook.com (2603:1096:202:1d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.12; Thu, 28 Oct
 2021 07:44:02 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6%3]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 07:44:02 +0000
Message-ID: <506e701e-8e73-b78c-7fcf-8d7839b8e842@nuvoton.com>
Date: Thu, 28 Oct 2021 15:43:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20211027025142.25898-1-CTLIN0@nuvoton.com>
 <20211027025142.25898-2-CTLIN0@nuvoton.com>
 <27e07d55-9666-9c6a-0098-4ad9ba6e9d0d@linux.intel.com>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <27e07d55-9666-9c6a-0098-4ad9ba6e9d0d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
Received: from [10.11.60.137] (60.250.207.217) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Thu, 28 Oct 2021 07:44:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 556b9c1f-b3f4-4021-9bfd-08d999e6b59e
X-MS-TrafficTypeDiagnostic: HK2PR03MB4322:
X-Microsoft-Antispam-PRVS: <HK2PR03MB4322B1DB0F0EC0CCEC5FFB2C8E869@HK2PR03MB4322.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JiRwJpBPEya0UkEf//WhGiCuTCyGGqbwB/pQvQz4Bs1LIowtuhXl+sosH8054Hk+hVupMMXiW1T5ZdOEnyRAqmFK08RF+srgY+7asoAdZTnwz7UcC9VirrGKrBxpkg8SuzztrXPQm20Z4P0k42kpVHlQbtBwx+mCRvxW6A4PjtvPtuawA/PLQG7LrBQqDFFT0zNZ5UpKWGZfCgA2ioN79UnZeHgpq0Se5E6+TqOYEMP2wm60C+4jHMqMZsuvyDBt6wUAgFYhx4zayxCL2gDJVbfeFubqDof6vErLmRk6z5SGwBF5BQ+YRoUCQsCME2/RfocIHIAWvVFe1ETOb1YRwmyBUZCUs9SndAs1Dn2CsSKknlhGbeS5eeH/XwOBDfrZ5DTMCdmwMsz75P65x6iaqX4YQYlPX3q0XBj+RdYFK1SyPFE5TK7v+4687x9rfFHxk5tpI9V2eXIg4NdQXTfB99y+z/b8n9R2cIZtecvxIywdF3bmtW1FzyNJpeZbORrMmOYJ051bZUb+FMXarl82ZLYX2c3cENo3AHVUXR/VPLawUA+G5OYRTHv03FJ9k3uvhlpR5NrObBGMnG7so9/cEfWNX8T+mUkvOnmecIbWm69HeDHOVAcp3XAb8uyjY51FJAMCkX/2ntfN/QJefB24fA5p/1utGDvyk8Th+WMQ/SUgfYzMWBX57YMLkD6Q7/d7itQKDZ0P35OALG0AbxXcZ4OgVDs2SZAGVNYwPH/tp5UAYrBMT69XsjpSbMaNY1miNdiNOXe1wPKRD6E6sQLk9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(5660300002)(38100700002)(36756003)(316002)(508600001)(53546011)(86362001)(6486002)(66556008)(4326008)(66476007)(2906002)(31696002)(8936002)(26005)(66946007)(8676002)(83380400001)(2616005)(52116002)(16576012)(956004)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzczekQvYzNoSUVkQnBmRGRWSnNvckxjUHEyQUxDM0hGYkZvdmZNVW1ieno2?=
 =?utf-8?B?SmxCNFB3QWJpR1NEZHQ4OEtvK2EvZXBLYjQ3SVRzTEM2clhRNnlTTldlWDZN?=
 =?utf-8?B?eThLaGRVMlZhQ3VveEU2dlY4T0U0THNMSmFSVHd1QmRZc1hjcXlWUlZhT3Iw?=
 =?utf-8?B?QStGRzdxbExBK25QaHNreS9OOEJ1QXNFYXVGRmJsMTlpSzBBN1FFSnBRUUk4?=
 =?utf-8?B?emFXM2pSRFFwOHl1WWRCRndkRWhQN1czbHlYUG9GdExVeFF5Qzh4dHJXakVB?=
 =?utf-8?B?YUVYeHZkLzY0UDFDRkNTM1RNMHZqWlEvTHU5Y3F6NE9BbWJXZjRsS2hZdG9Z?=
 =?utf-8?B?M0tBb1MyZGlhZWJvQisxTHIyWkNEeGtMS1ZJekJtb0w0U2gxRzV1dW5hNXcw?=
 =?utf-8?B?QnorVHpYV25nQmJzQ2ttN3k4dVl4N3dsL21DeFhrNXh6a2JJTXdpczlmQWNN?=
 =?utf-8?B?ZnQzK21DQXNzdUc1SVpLWHpVcmFHUE9qQ1hwM2hmZFJNLzFoR21tb3ZGMVhl?=
 =?utf-8?B?cHI3T3ZDemRqQkovV25zcS9rQ3E2WGRuT3BVTHlXTlRvREhHVnNMSXBGZkw2?=
 =?utf-8?B?eDRSbHpjenhGV2ZUTndYWVdpOXE4dGt5VFJIbmtlRmkvNEZTcWtYcS9sNnds?=
 =?utf-8?B?SlVaWndwTWZXa3FueFh2L1oveEZSaUd3cXl3NnNtbEhRaGo1dGo2cklkWDJl?=
 =?utf-8?B?QkJ4L2FFOVJuTWI3V2VHd0s5aFQvUGxTaE5TcjJWMkxTTG1KR2JmTlQyZFhU?=
 =?utf-8?B?NkxXR0NOUUV4NEZNMkZPMlBhdGpVQjhvc3o1ekFIM0RvR1hvUjRQVjVtNE1v?=
 =?utf-8?B?L04rS3pNZFF4ZWpMN1A2ZnVkRXZXcGdQUGRzU3RSL3NEOFRXZjM0NEFhMmow?=
 =?utf-8?B?eSswNDMyakhQWEVtZFBBZTV0dml5eEZZd2R3emphcjFFMDZrY2YyMHRONHNW?=
 =?utf-8?B?UlZUMWlPNzVhVStMR0NxWUpFbDNWZVFHWEVBbFZNVTArMUxzdDdQZHVNdGNi?=
 =?utf-8?B?Z2JPQ2MzQWhZSUxocExSdHR0R3I4aU10bkpQbVR4Wkw4YkZoZDdCUDdzZVN6?=
 =?utf-8?B?ZjY5ZDhJOXVQTnp3M1VpRXRZeFYzdVIvTHZVNERYclh5R01zN1lLVmhadTNG?=
 =?utf-8?B?d3Z5aHFoU2J6V1p0c0p1R2tnVVpiU3IrSm1ONWQ3Q2Z2YUlKV0JmbDVScWdT?=
 =?utf-8?B?dmYyWFVUSkt0d3hYbzV5QTNSaWh1NmhjaGozME1nV1BzYWpzd0tnekRlZm9N?=
 =?utf-8?B?c3kya0RCV1ZvdjViL1hJSWpXQ3JZUmR3K01yTFNwL1JqQ0tiWmFLeWxKQ21B?=
 =?utf-8?B?Q016MDN6ZGthWUp0SlRoY3VWLzhPTlIzdU94OENmZW9BeXFJc1B2c2Yydm9v?=
 =?utf-8?B?TDlHWnlJNzloaGQvSHM0NUdpdElFY2I3VXdrdUVvaXNXYzViUWhpUHo3UW5H?=
 =?utf-8?B?ZjM1Q3JrQW9JOGJScUdVeVpOOS9NOFg2MEU0Z3FpdjVOOTM2T1FtTFNGYm8r?=
 =?utf-8?B?RXlYZ0tISS9PTnhrQy9BaGt1SzFOSERlc3hrQWhZTmlPZ0RHeUZ1SXExZDZ3?=
 =?utf-8?B?TVBBb3NMTWtZb2JDMlh3cGJoNVc2cFpxbnJHK3ZxZGZFZ2t2TzlCLzJQejFB?=
 =?utf-8?B?d0FvOVRlN0dhOFV5M1hRWUxQWFpYc1lueUROb3BYWXU3UG1QcnRiLzZlc2ZF?=
 =?utf-8?B?eWI0ZHVhL3l0bWVVK0toRG1CL0xDekJycGw2cGl3YnZJYWRONWluU09XeWti?=
 =?utf-8?B?M2hWVXhNdEpkSlR0OEFQNUtRL3h5ZFBvSm1aMDY1dmtyRzhodm1HUzk3U1Ja?=
 =?utf-8?B?cHYvOFBnemY2bXBpL3ZJYlRuN3Z5QnlnUHJSRmdHR1B2RkxXcG96WVh4YXB1?=
 =?utf-8?B?VWpOUFg3WkVMdkNJSXU3enlUKyt1WHU2RTU5MGpNTHFwUmxtVjlnRmZMSHdq?=
 =?utf-8?B?VWphd1U5eW45RVpLZzBBQ1FLOXp0cXMyK2s4eWpSY2VDZXdpZWNEWkZUWjRI?=
 =?utf-8?B?RkVlYVVNVXJmNDgyazR0TjYzcWpIbFNSTk44L1Q4TGVxbzNYSjA4MEFESldk?=
 =?utf-8?B?VTdOenpZRWxmS0ZzdG8xUS9hbHo1VWJ0SlBUTUlmYkZPRGhmbUlNSC84Wnor?=
 =?utf-8?B?cWZNNlhLemFLbkZLQkEvODlDcnFnU2MzQzM3TjZ0RE84R1pJdjVZcUVlUjdT?=
 =?utf-8?Q?D7P1hrs0ScDF8dcqhESFLBk=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556b9c1f-b3f4-4021-9bfd-08d999e6b59e
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 07:44:01.9683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXn+EY2Rkck9xUHubEpjcfP27F8pc3pZdT8hOKH48FXASeequXnRVusW2QW5PVsHkVkjfy6DMcXecXm21j/Maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4322
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On 2021/10/27 =E4=B8=8B=E5=8D=88 10:02, Pierre-Louis Bossart wrote:
> typo in commit subject:
> coponment -> component
>
> please use scripts/checkpatch.pl --strict --codespell

I will be more carefully for next. I appreciate your kindly guide.


>
> On 10/26/21 9:51 PM, David Lin wrote:
>> Use set_jack ops to set jack for new machine drivers. Meanwhile,
>> the old machine drivers can still call previous export function
>> "nau8825_enable_jack_detect".
>>
>> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
>>   sound/soc/codecs/nau8825.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
>> index 67de0e49ccf4..c845f19b7c41 100644
>> --- a/sound/soc/codecs/nau8825.c
>> +++ b/sound/soc/codecs/nau8825.c
>> @@ -2416,6 +2416,12 @@ static int __maybe_unused nau8825_resume(struct s=
nd_soc_component *component)
>>      return 0;
>>   }
>>
>> +static int nau8825_set_jack(struct snd_soc_component *component,
>> +                        struct snd_soc_jack *jack, void *data)
>> +{
>> +    return nau8825_enable_jack_detect(component, jack);
>> +}
>> +
> in some cases, this function can be called with a NULL jack argument.
> See other codec drivers, e.g.
>
> int arizona_jack_set_jack(struct snd_soc_component *component,
>                         struct snd_soc_jack *jack, void *data)
> {
>       struct arizona_priv *info =3D snd_soc_component_get_drvdata(compone=
nt);
>
>       if (jack)
>               return arizona_jack_enable_jack_detect(info, jack);
>       else
>               return arizona_jack_disable_jack_detect(info);
> }

I have caught these information from some codec driver, even sof machine
driver also use snd_soc_component_set_jack to replace previous export
function for jack setting.


>
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
