Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C833D4BD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 14:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CA018A4;
	Tue, 16 Mar 2021 14:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CA018A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615900927;
	bh=a59Gk66SzbnZiozoalOIdSH03cGR0ze9vXyBSn6b/9g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hdhej03QBt7shRyFPn6fKGGI1bXROOwglcPe0zfXvGyGFhwU6gHGiESOHtUFzAlDC
	 wWy8IdkunqAi1Ln1Rq26dPwb7ZSDq2tUE/qSZt5iNV4tDIMYEY5Oc9CChU9dkZ6Qba
	 AXQDaqP2C8VGbcMiYI4yN8abHZ8Swbc9F2bY4T6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 098D5F80171;
	Tue, 16 Mar 2021 14:20:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BD9BF80163; Tue, 16 Mar 2021 14:20:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60057F8013F
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 14:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60057F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="iRxv9Tym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5bDAmBAeTmiS4JIzP14syL/Uyk6U8+A0Oz43Ul0flWGU0bFscdQjxlXv+pXclbpnVZKiTcvZoe105fX7h8GKeEEhur7yZdz5RCzIewI0/oUiO5VjfwL3iq+p7EzCk6qBLTCCLCCz/vh/rDqp6akeitYFcygNFomPXAz40mkOvLyN3F94zTSQwWXmBIkSOP2QgD1ONGArAZz0wlf1e/I7JzduWSlZuWuHG952HokGiBoRy3HMFYs3njS4hlbYAapAu7LmLjUTJiWyQvyL3xU+09m5+33oSgDDx6JRgzYKJft1ACLCOJ1MEmbUMgB/HeO/4sbIAwaH13FqWMB91Gb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht7mVhSpdJD0e130KyXZW/poy1BYv2e3T+jXudAhPcQ=;
 b=h+nSnpV4+r0+WI9f/GUe+Uxgoa/frOhCEmOPr3lGsoCwkSr+LP0ofIkptAnnpUlnMzcfxPns4U/RIciAOHEp+mg8Quaq2i9q+mXMQMOs/ojWWmg1UgEetUpvEB191zFMar0TBJeenCSSJuoj53XuNTXgIfsAmBu3P5ZaMbEJ+w0dasKaa2SlJUZ+D0tI5oJM//SfgprLdcV8L7kjrQwdHPAlQAI5M9OoBJkbgdgCH61gY8ZTc+DBgZYADfG4RytkgBnKI6yHDkiwwl4wcTV1g/27Qku6GsGZqXqZw+SQoTNKyaJ/LG/ejOlDlQqei17HyPma+InL4OSTpOLtGSydSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht7mVhSpdJD0e130KyXZW/poy1BYv2e3T+jXudAhPcQ=;
 b=iRxv9TymZZzKYYq1ePihFxvPka1ma/LrH3r0B/gfu/xa/gLLk4sVOIuivQBgZD/3q33N2u8496gZQebhb/xugti9AC/15drwy+7GMVzvFF2JEo01Fcm/7TsWucbZQq1eoe6vYb3ONMniytDdr+f+8Jv78p9ynkKJ2L17NNP+AK8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4540.namprd12.prod.outlook.com
 (2603:10b6:303:52::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 13:20:10 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 13:20:10 +0000
Subject: Re: [PATCH v3] ASoC: amd: add support for rt5682 codec in machine
 driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <1615824133-21553-1-git-send-email-Vijendar.Mukunda@amd.com>
 <efa02319-2abf-4fb9-efec-13b6279f3d78@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <87f41e68-3158-38f8-5e84-270ab184691b@amd.com>
Date: Tue, 16 Mar 2021 19:07:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <efa02319-2abf-4fb9-efec-13b6279f3d78@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BMXPR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::20) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 BMXPR01CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 13:20:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 919788b7-e9ea-46fd-76e6-08d8e87e3962
X-MS-TrafficTypeDiagnostic: MW3PR12MB4540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB45409ACDBF02DCF8E7348DC5976B9@MW3PR12MB4540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QRDLh3UebfxK5qGSTgL8FMgYJXeoQXG7jsu86DF4mcQ9zZkbjsWS9VECQDBnDX/ncdtFRqX7Y5iVug9oSc8dxC/nwQBZuM+JVylRh0AdGODr0d/vyzZQW4OhbYXEDVHtfzkr0c9mXOQlH13n2hLrHNZEMNKa2bnBRKGHP95TgvYa4J62zEoUzvVHRqzgvlRIarGueELOxAv0vnG9dPe1wJzqk1RHCWHK/iJgcGnXP4cLRfhCx+W1o06DApxjNL8V+RF6E+dLA+S9xOyZ+0DPiw96/mCGge0saVfNM020+d8Ghbk5J3smDdbCKUjbYN2P94gkh84suljvAIgrkYMrrcnecoceZ/rvUgHJy4WWBvkG7JQCS28W1PS/lZ0KKKd0dPXnzMWEehhsybFD3iqR0xhMPgCb29UB0Sa0v1Y+6RFCVu2TPpN6IFnz5a283L58XolUv6Sop17UGHFsVJp01oy137/m0j/8eOwXvlyeLHDg30XA73G56WbuDdQm0fOm6NlCSby4XiuQ4s7ObOwlLiCeaZJ9NHpPFISlZohMG9N8wv0bWe+HxjaXFHSY+u26taymB0Z2uHQGLtCeVwNqrplk4KpkDq+3AgMveQAHNqPRfJFm8TSBOyzeat+hK8Xf59ie2kGfXuXeQP9VNncyOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(83380400001)(52116002)(53546011)(31686004)(66556008)(316002)(36756003)(16576012)(8676002)(8936002)(31696002)(5660300002)(66946007)(6486002)(86362001)(478600001)(4326008)(26005)(2616005)(7416002)(186003)(956004)(16526019)(66476007)(2906002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0R5NUhHcmtCOWRBcyt5dEU5S2Z0eHhEWDFObmxyZTNWa3FJSktrYzV2OVFy?=
 =?utf-8?B?cldPTGY5TFhVUjYyUVZVVmoxN2R6emp6TkdPSk02cEQ5MitaeENXMW5Ja1la?=
 =?utf-8?B?TVduVjV3MkV3MHdSaE1zaGpSbWU5d2pubWxjZUZpT3U1UjM0a0lUQXczcEVI?=
 =?utf-8?B?YlVxb1J1M0MrQ090aTh4TEVZeGpmYUt1UEEyK1BzU3JDMzZIdU5sNjdNZjRv?=
 =?utf-8?B?WWEvY3hyQWJpM0MyeFN0SjJKK25wSTNMcmgxM1ZrSnVKMWIvN1dEUUZGd05t?=
 =?utf-8?B?OUJ6YXRjRHNvc3lzbkthckswRG4xS29NZ3hwdEtCOWo3bVpuRys0WnpKVjZB?=
 =?utf-8?B?d3IrUE5qUElaL0VnNTQxRmhaSmN6akUvQjgzUjhZZEROUkNQME42Q1IrNXl4?=
 =?utf-8?B?VjYyYnQzY3BhbG1GM3lCQ1I1c2lzeEhrYmd2L3g4Y0pucWhzKzRPVWx1aS9y?=
 =?utf-8?B?dEExblg0RmxPVXVuenNoQVU0TWovOEhBMGVvYXZhQk9xNHFCdlgrbEVaVjJD?=
 =?utf-8?B?ZTFnSTlYaitFcUxaUkttbEREdXJwZXE4VFpNeGljTkZYY2JUM2ZiRXZSTGdz?=
 =?utf-8?B?WUVyclp6YUcvd3B1enpEb2dxTzkrc0JBMmxvUUVta1BicXZLREdmWlhYZ2hl?=
 =?utf-8?B?M003UWk3V1JTL0IrRnRSb01XVjdkK1hQQVVrUUp2K0ZEem1yeThLMU9IdEdw?=
 =?utf-8?B?b0UvVzIzWFc1ZE5nNE5Ub1hXeVF5MVJHK3FDWmJOai9EOUxJODRIZUNmSm1H?=
 =?utf-8?B?S09ZNDJ2aXpWcWgraklIZHIzQXlWWnpXOGJITWZjL1VDUVpRV0xzRGlxZUYw?=
 =?utf-8?B?aWYvQ051OGtnUGdBS1doa3p4VjJDRkhqbUJxODY4Qmw1SGNRakFoQ0gyK1p4?=
 =?utf-8?B?TGNoK2VNZFMzNkJFZjBESERPZkdLZEphV3Znc1R3TU90YkViY3htVG10Mkxu?=
 =?utf-8?B?QXVxMklQYVFvcXdpNU9DY0lydnNETUNta0ZscG5SSUpMY2c5KzJjUDZLNHp5?=
 =?utf-8?B?eXJpQUllTzhaSFJ5TzMrNnBDRHd2THNBb2twR2pxK3Uzb1MxRU56S2pUcHJT?=
 =?utf-8?B?a3VJSmZSNFVwbmdYWFgxaHg0T1lyWVdqcVFnVlpWNjVSTm9vbFZjS3orcnJU?=
 =?utf-8?B?cUh6a2twUy8zZTRCL290ZDNKMm9paWFweUJBMWpaVHZQb1RxYVU5TGNrdWs2?=
 =?utf-8?B?WVRycUV0cEpXYVNHcTlmWW9MckxNd1M4aUtPeFV3SVZKY21kemJTTEJaS0hi?=
 =?utf-8?B?WGZxWmtNWlJpbG1FRzJZNDFid3RlZCtjdzdkUTV1elY5VHh1bzJmdi82VDZL?=
 =?utf-8?B?V2NEOUZjOTE0eCsvUlFJczJQNjJOeHBoQk8xWGh1Y2Y2NW9vaXRHdXNBV3pl?=
 =?utf-8?B?bE9EdEtrcUdqOWFVc2hvN3d2a05FL0l5S1FqbjUvWEx5UmdwV1FPdUNYRW1I?=
 =?utf-8?B?ZmFzNlRKTVdsaHZHQkFZQnJMUnZpci9JcGJlaGZjcFNtTWZSMG1xbVd1M0Nw?=
 =?utf-8?B?TmtKcnpZdGZ2NVhIL0lQcjhWTlpVWlNDcmFiRGhqYVYySWp3ek9PcnhIRkdF?=
 =?utf-8?B?U0FabnN0dHhib2JnT2xMYStYWTNKWXB5VHRDVXJrYUwwRGlTbS9HQUxzckI4?=
 =?utf-8?B?VnBvYnIvN3hJaW9FcG1EdTY3RW9Lb0VoSmYzMDBSSUJSVmFaRzJEaWFrQXVO?=
 =?utf-8?B?QmRNNExjbk5WRzRCSzdRa3JBY1d1RTBNMlNRSWd3cm9lbjNSRHhqSE5lMm4w?=
 =?utf-8?Q?jMTPBOoFXpSgZdOhfapZHiy/ZjoVQt91fmLTufF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919788b7-e9ea-46fd-76e6-08d8e87e3962
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 13:20:10.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhmrJqeYv0UDqz/y49LR6ZlnteJsVesl+QJuTuXSmsWGJFsx4qlJUsH1Fez3XpvhUUWGOHz/7Q0C9VQT9Bfiig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4540
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Alexander.Deucher@amd.com, Virendra-Pratap.Arya@amd.com,
 Murali-krishna.Vemuri@amd.com
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



On 15/03/21 9:30 pm, Pierre-Louis Bossart wrote:
> 
>> +static int rt5682_clk_enable(struct snd_pcm_substream *substream)
>> +{
>> +    int ret;
>> +    struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +
>> +    /*
>> +     * Set wclk to 48000 because the rate constraint of this driver is
>> +     * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
>> +     * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
>> +     * source so for all codecs we have to limit bclk to 64X lrclk.
>> +     */
>> +    clk_set_rate(rt5682_dai_wclk, 48000);
>> +    clk_set_rate(rt5682_dai_bclk, 48000 * 64);
>> +    ret = clk_prepare_enable(rt5682_dai_bclk);
>> +    if (ret < 0) {
>> +        dev_err(rtd->dev, "can't enable master clock %d\n", ret);
>> +        return ret;
>> +    }
>> +    return ret;
>> +}
> 
> Out of curiosity, is there a reason why you use clk_prepare_enable() for 
> the bclk but not for the wclk?These changes were shared by codec vendor as an initial patch.
We should use clk_prepare_enable() for wclk not for bclk.
We will update and share the new patch.



