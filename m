Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D14291D9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 16:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137CE167D;
	Mon, 11 Oct 2021 16:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137CE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633962706;
	bh=BiJAkupHilHpaAOGmRn1n4U0Ph3jG9xDd2uiQeNAPWU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLrU8pJ5xTsbSfAOppUng7qfHWneUctCJsRxYcVa+fUaBMEFjVLK/QMn+GocuHfRi
	 bhpoRxpxJBz4SGsKzZrgqKaRIGOI5JNVIGxoMslm8N0pjq2K3NKDsc5G1AGvf1LZ/o
	 p5WFYJmQnQPFKmZcpO51nLAy1nOxAl/WzbOL0jZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4CDF800C0;
	Mon, 11 Oct 2021 16:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D159F80269; Mon, 11 Oct 2021 16:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 406D6F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 16:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 406D6F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="pmJ9UMXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KicIUaYPokIRINeE333acxUqfLY2qVaCD2GrDmlGw8DwQMVQCYlFXIywMqigqgu8cou6wwfkuuU9NqexiR16krvP/9nU3k0XEln1kQrmhI0Nx7ts2D0LkS6WJaUBiVVeyER/Oqb6EPfIyglQ1PA69/u8KV2PphEMVfLIGYp3Gy7SJYcXVGDU5M8VYnxX0wtTP6I5FoZIm5LaGmVgwlTWTBPWkHhiv8OsOhwvDKtCwEvQ+RTEz8hJcHZpowqdxC9aRcXklCmApqXrcFYCStKjJlOzdwJmJvCoG4kw1QTUayocWbreQxNXv4YYbo11ReATFNSi4jW9VsLUerMr8YruwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lqx0MaDkpuBowKX6bOdcrfp4RgzBI7X5KgWz7mieUM=;
 b=OZGSSzT32H6sjjAVHdd2fzDsxYn0cscOBCx61xpm8kvDXiSiM2MpXUj/s1apC6gyR8pnVCVCPvT46qoM4wHADQ/G5RH6Cx3RKPsY6M4vTD2MEJfnxnlL9yqgtmSqdDMVyn9dXEHgke57NmuTZ7eD9csLRGAKhqYE/GzzzTOjA7O2fnJXGsSZoSWiE+RLgtUuk50OtmD49sfx5Z8UpJJugkZ6Swd8ymjMyLpKh3hTE5k8+EK9LgofLQo7HjxFLIvtNIulklPSmdRFpMTugRa21St118rIlcW+wlpJpK/+xDI70h6AwavXfdcYH019XH1edQfcve7ksEPpq9QdoVGd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lqx0MaDkpuBowKX6bOdcrfp4RgzBI7X5KgWz7mieUM=;
 b=pmJ9UMXyLYrR/j34GhWn/he/U1R+WIfwSNE+aWsa+s871Fz6cT9hzuNyEuiE8muaV7btFFkUWUZ6dLn4EnymEi1X4ZoTp97b+mPsCAduhqFLJxkfElO8F4w81dyOn/4JTX2mRZaH5lWUM4pCqjyLQ+jNPcfSkH/p5xPGyIsNuJo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Mon, 11 Oct 2021 14:30:11 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:30:11 +0000
Message-ID: <44f4fe58-4303-5997-fdab-0ce66441054d@amd.com>
Date: Mon, 11 Oct 2021 19:59:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: [PATCH 4/8] ASoC: amd: acp: Add generic machine driver
 support for ACP cards
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <YWBoc4LJPUS733ee@sirena.org.uk>
 <e6eacead-7e2a-a2c3-89af-7926c12d3c03@amd.com>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <e6eacead-7e2a-a2c3-89af-7926c12d3c03@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::19) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
Received: from [192.168.0.106] (49.205.112.171) by
 MA1PR01CA0103.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 14:30:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24298fc-e6f3-48c3-7033-08d98cc3a1e1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB405981A260C347ECF062AD9182B59@DM6PR12MB4059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4FvP1jNm8XHs3DUOdc87jUQX7aMrpkaUJZmObNkyMAYzvh+RqIek+bHDM+PjfKK4Vdu3101tDPWVT+rs+TytTFSRjwsw1AAGMMvwHsDuR61HLRcTmGXrwf383Tl9U4q2ZO+YqYhOcH9Sj3RtieBur5+tPY+xNisMzr0aInXluC9M8Fm3+fRcviXJC2dGprp8oyrvdzspJapQJjj6N8eohh3W1RirFgHFoDuRn3GHgTGSYX2bufCzuKB7e+LYmO2FKOaZmfqrSroddYIJybV5PDv5trMxQL2+XsKiIFBfG13Kz0wnQjXvrd2QMFWxlMnCbCIVaCEnmn8QlgUpjt8dRhcIekONlsxr/qiskXlWbt2zpBIakevJYBQg2b7QySAH41ME6vBH6/8ynv3atH5jz0+LMAGcPdVB6n+V09dRA66BS5bhL+57sERROJUbp8AvRu9XbLt1+gp1O/vTeHUdWQrqSOKkYN0MuRhtXuYtqU29gClnHEHcwVNldl5mekZf52LOUqxIotETz6vnsD12vrADBQinz1omy/4T+glpKOi25mZGRN4F5kjzDh4KMlOC6cgWkDQGOK5zXXIf7BxATL9LQGVylIa/WPkgqREFqi7imvKl0aRqb2g4peufzBk8m/GTzFDlmLS3FT3/YtuOlm0QTNQcs1s2ULHDqXrbxJFd1GpYm/EvCUSSUu1jnjsdMot0PWd0zkTUNeyzOG3NEWBGy6349WkE9ZEQFVyBZyIMFLDGosbwzsjz/hsyCZV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(36756003)(83380400001)(6916009)(956004)(8936002)(26005)(6486002)(2616005)(8676002)(86362001)(4326008)(508600001)(6666004)(66556008)(1006002)(38100700002)(16576012)(316002)(2906002)(186003)(66476007)(66946007)(31696002)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUEwUlh0RVU1M25kZVRHeTJqdXl4NjJVYUhadlVMRFFNRVhCYytwdit3SzdH?=
 =?utf-8?B?c1NRT3VsRW5aZGZlVmNQaTFKdzk1ZU1YZG1UblNmNlh4QWNTRUxPUVhtODVX?=
 =?utf-8?B?RjVYUXM5Y1RXQkloREhFZUs1ZVBaOXJ2UW00S3JhQlNkMlhhL052TDRLblgy?=
 =?utf-8?B?VHJlSUJtT1VVOUUxaHd2cmFTaXg3SDVqNGxrdU9CTWhpU3gva0NBYlM1UktP?=
 =?utf-8?B?TUNQUzBDdGZ5MUpVV0NoL0tzdzBwMzFHV2U1OHBUT0RsNE1WdHRpaS9wdE4r?=
 =?utf-8?B?VHp0cUNxSVUwZzdLQlRJZWRDUVRnaVpjYmsvck5KdGVLUmIxUVJYbnpVQzc2?=
 =?utf-8?B?REx5QlJyQm5rcEtJMDIzNkV4MVl6VWhaR0tuVlFoQmEyYnNXbGU2YUZxbmN1?=
 =?utf-8?B?RWxoR2tzY0NJRjkyMWcyTUFMcW9IZE5iQkZ1U1BjWGJTTFppSUxDMUFZS3NY?=
 =?utf-8?B?U05Qb0ZtNHczSFRzR2VockRROVhoandzZWxDdklrNVVuWmpuZHRDMlBreENx?=
 =?utf-8?B?WUkxVmtldFNveWp5UVd1QVI5Qk4zQWZsVk1PK3UzUUIwT0p1a3JHTEdaTFNE?=
 =?utf-8?B?enlOS0xmNXpvakhmY2d3S0pTRnI2YU5lWmwyQmpYV1Z2Q29UdVVZck1peHVS?=
 =?utf-8?B?UGJaRjFvR2RyTmpBZUVEU3I0RHFHUWJzOGdFdWREVFArWmR6RFdoSVE3YVFC?=
 =?utf-8?B?bnRldUNtUDZqN3dQRlQ2dTZGR09CWCtzUGdpdXFwYkJmZUc0UnBWMGpFd0dZ?=
 =?utf-8?B?NDQ1ejBNNFlKM0ZGc2ZlZHdOd0JjSnN4UEJMZFFKRTUrZTlmWFJrS1ZHc1RG?=
 =?utf-8?B?Y0M1VUFseWRlRDlGKy95OWNwQy9mZlpZbm4wS3RaVXArN1QxVkJTdGVrWFJ4?=
 =?utf-8?B?YnoyYTVmL054TDZWRjhMQzJLUUh5dkxFU1czWm8wa0trbGE3bHpIRk5LZkwy?=
 =?utf-8?B?bUpJRHljUmRIOThqc3ZUVTg2MUFiZ3haWjJsaksrNi9XcHcyN29ETXZJZmVa?=
 =?utf-8?B?Z282NXc1MFR2dVl4TXlVNXFuRVFVQ1JKd0s2VmpLeU5LVjBNSDFiZnlXa0FF?=
 =?utf-8?B?R0QzbitTb3JSWlZ3aDAyQkhuZXN1cERGeHdEeDBYSDZoWXo5TnNGOWg1ZitL?=
 =?utf-8?B?aGZqM1FEd3oxTUwxR0VCVnc2Tk5FYmFDUHU2clhacisvL2F4VzYxOE5WdG91?=
 =?utf-8?B?TmxSTnhXZWtYOUk2ZHg0eWExWnJHMDEzWXhKd05lUmF4Um4xOHNERjM2Zk5K?=
 =?utf-8?B?cG5CWU55RVRTWUl4QVgyTGh2RGJoVUxrWEowa0d4MVhITW5BZVQwVEFodVRQ?=
 =?utf-8?B?K0xjR1V3N0JwWGhKdTgvMzh0R3JGOWRJalFvTERyQThFeWJ0Z0tpWmsweFVK?=
 =?utf-8?B?OXZDQUlwTG9GS3JPa2FJTktzUVIvWW9hUlh5dVBTSEpKWXl4MHltUU1qL1Yw?=
 =?utf-8?B?clVmTm5GSlBrQ3cvMWdaajJ0NThQYTIvdENFWWd1WklVN2dtaUpnK3BoUTBH?=
 =?utf-8?B?MWJUMHNsVWdxSDRUR3VBYi9zMEJTenZYT1pZUUxBVDlveHFLR2NTVTUyZ09T?=
 =?utf-8?B?ejJ1cWh6RkExNEM3ZEVUaWZnZUg5eUU1Y3RHRUFjS0g4RDhBSi9yL1hBOWxl?=
 =?utf-8?B?c3RnQ3ZmY1BSWXJPVFo2anhCVDBTUlc3L2xXT091bDlVUGRtb01JeVZoTGlw?=
 =?utf-8?B?d01oTUNEVmVndEltUVQwMzJZa3MralJNU1Z4Z0tBVWI0cktpS3hYWnVuLytq?=
 =?utf-8?Q?0P49T+5Fl1YhhaDbusgGIhhBx4H70+szC4DXCeI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24298fc-e6f3-48c3-7033-08d98cc3a1e1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:30:11.6170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuUpkcEX+EgIOyuo9GVWk7K7l8viKH8jr9N0R+fVHIwMi0c9UfWEkwxOeUXcrzKrBj0An+u1lRY/CqtvgZGfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059
Cc: Alexander.Deucher@amd.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com
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

Apologies for corrupted reply format, some issue with thunderbird.

We will update all below review comments in v2 patch series

> On Thu, Sep 30, 2021 at 06:54:14PM +0530, Ajit Kumar Pandey wrote:
> 
> A couple of things here, most of these are probably fine for now
> other than the EXPORT_SYMBOL but I think you're likely to run
> into issues going forward and need to refactor.
> 
>> +	switch (drvdata->hs_codec_id) {
>> +	case RT5682:
>> +		pll_id = RT5682_PLL2;
>> +		pll_src = RT5682_PLL2_S_MCLK;
>> +		freq_in = PCO_PLAT_CLK;
>> +		freq_out = RT5682_PLL_FREQ;
>> +		clk_id = RT5682_SCLK_S_PLL2;
>> +		clk_freq = RT5682_PLL_FREQ;
>> +		wclk_name = "rt5682-dai-wclk";
>> +		bclk_name = "rt5682-dai-bclk";
>> +		drvdata->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
>> +				   | SND_SOC_DAIFMT_CBP_CFP;
>> +		snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
>> +		break;
> 
> It feels like this is going to run into scaling issues going
> forward and you're likely to need separate operations for
> different CODECs rather than just different IDs.  Similar issues
> apply for the amps, it feels like you want to be passing separate
> ops in rather than having these switch statements.
Ok will change to use separate ops in v2 patch series instead of switch 
statements.
> 
>> +	/* Do nothing for dummy codec */
>> +	if (!drvdata->hs_codec_id && drvdata->amp_codec_id)
>> +		return;
> 
> Wha the test seems to say is do nothing if there's no CODEC but
> there is an amp...
> 
>> +
>> +	clk_disable_unprepare(drvdata->wclk);
>> +}
> 
> ...though I'd expect that given that the clock API accepts NULL
> clocks you could just remove these checks and unconditionally use
> the clocks.
Ok will remove this check in v2 patch series.
> 
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS(acp_legacy_dai_links_create, SND_SOC_AMD_MACH);
> 
> EXPORT_SYMBOL_GPL_NS() - ASoC is all EXPORT_SYMBOL_GPL
> 
sure will update to use NS_GPL() in v2 patch chain
