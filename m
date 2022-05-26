Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2AF534AC1
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 09:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE11516A9;
	Thu, 26 May 2022 09:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE11516A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653549865;
	bh=gTRIrivmTiZCIlMBsLpQ2xVHf8I5OOjoxwVqqlOB3SA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nv/NnNonpiwOWg/2NRr1/sT+eLsAzYnXn4U9vhBGme1eV1J8VSWz4NTzyz/VG4hQ1
	 goRYBP4TeFhGOakdyTK9Lqe0P/n6HPUck3Ew3VFt7jTEGhDChO0ALyGOMkEwIK98D7
	 n3AG4FYphvFguy7gzanhrbnb1/XN+hzM3DnEEPnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C00F8007E;
	Thu, 26 May 2022 09:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C275F8014B; Thu, 26 May 2022 09:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C63DF800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 09:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C63DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="SIqcQL0r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqC4hgb3YLTuOrsHPASz0Q2nQfNBt270xe9MmJJz9g94kda/Qa8ptPnyqYF+ID0Z+Vy2661pC9+N0x3JWQVOS2BiD1a/rSHIHPlIK0K94fgHm64qewPQ21TaUxxkjxrkoP7TkOCX70XNsPXMlVVOzq3cWKa03NJHCVNytsMQWkIYWzdDngaDr4kRzGCfvwKnuQ//SlsunqhRBJDA/yg3Lj04jmeVCgODWDPrIp1TN/CJ+b8MNl05JQRTKe8SHQeKR9rxCkIdbq+IF4KLf37IcK2PrLuZn+4UAwKsJXEE5bGoPM7ZIOmYvHTwsxZVb7L8KLl+dOUrnzPwZgDMUNzBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEV4aXvuwL4VhkPPY+pl3i0dEsGpAndS/pJ4BBTwWnY=;
 b=QFQMZnMsrdaRpUQMW89Cptid2gW4z2OWlmNC2Nno23NsIPzUpP4TbKdYdjy56qBe3pUG3tjFCQpf4j57e4IiSbURwqMlBis4QHbrEj9QNTc+eW9xzngxi2Wz0aT/Ei/G7uMNTQYJrI4hidv/fi9xanMV5Wz66q+uaubme1DXbFE0JN/OMo6zsJP35HbA9yl+XFjrvlTGGL6KljJsEg6fbEb0ZMdgIswtWgyt2CWbdAISriDvHd22irgw6GKe6U3PdsMc/ocgTrmz8WDFBcesimgnYli8gaDyv4x6jyCUzpQ/HS/TD9a7SadTtLiV3/Way8XtjIpTaJfoH/lPlVSx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEV4aXvuwL4VhkPPY+pl3i0dEsGpAndS/pJ4BBTwWnY=;
 b=SIqcQL0rw/zfb+Wn74ycdQIeNkw0Z6inVwL0jqMUKCvqVFfs2i+sih8oCAYwDSam6HiL0SpRTvf3ivLeMbzx6UV8bKA6/b24W1m7tuyWkPmB7cUxeljgRNIrwra5i7P+btqfzuRMb+VAEY/IBxtkfC7U2q99IHrCVrofYrVIKw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18)
 by BY5PR12MB4967.namprd12.prod.outlook.com (2603:10b6:a03:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 26 May
 2022 07:23:16 +0000
Received: from DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949]) by DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 07:23:15 +0000
Subject: Re: [PATCH v4 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
 <20220525203415.2227914-2-Vsujithkumar.Reddy@amd.com>
 <895302ec-f9e5-2b6a-835a-08e73ef8ace3@linux.intel.com>
From: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>
Message-ID: <f7239bab-5af3-ad7d-db3e-1bd6e1eb30d9@amd.com>
Date: Thu, 26 May 2022 12:53:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <895302ec-f9e5-2b6a-835a-08e73ef8ace3@linux.intel.com>
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To DM6PR12MB4171.namprd12.prod.outlook.com
 (2603:10b6:5:21f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d45438ec-e966-4f97-e512-08da3ee899a1
X-MS-TrafficTypeDiagnostic: BY5PR12MB4967:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4967163EDC3572F2C594AD6292D99@BY5PR12MB4967.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UkypLd8wSktpUXBTHpMEDaWef2zurePTCvT1aB2SNjHt928s48QMlTHkkvBo5LVnL16lUzXh8DcO56zug+8NNvW4ErufpwILxEagQaiZqOFGydlWiV7LfHFn0XtefCcOm8M+fIFGYBFLFpbl8iSMqsrsdtPWTs/p+rVKDEy9GueA4sToTc58mSYkIVDDno06yjwh+41MdE0SyqEdfORxloFAjuYD0/hv1O1PZ9MyCA1Vtm/yJaEz4/8DByBPoBdkcPHtVVbNtDxlEKY2FnCu0RLw8O8u5BcOUEmKCYei2/Yyg5iVuoTzFMEyK5OYZx2udTV060S6UHmMi6HXGJ+3dTwgSY3h1lx1KD+bQjIPsP90yo/0KCHzaePI0ZVwh8mPxtvDAbnCXkp4/KV1ZUE9unqR2DlxEaP5yOOhc/Jwc9UI3fSVO9uGm5nkps+qX5MRmXpf3OW1CG5AOu4A1ZU2bmf/6YIpZ51SnE4+BD0OvebJqAe2LrNizELjsHNhYgZvsSGD7KAoZ6YGBtTJvPx3f8R2FiWBXHlpuHJY42IoHDvebouMkZYn10fvzcSnpqCuo6+CWCix/Qn3TY2Ai2WAG8kiIfAeBrdoRt2iYNa+fiWldT1+2/Vgvgv4vPLB8vpB8v6Qm7b/DcywKdhyMOaX9jcG+seWrOLAR53BatvBQNJyvxSEn+ME/ve23CSGy6YtjTfwG8C4SJ1pmmcnFOL4u9Y93CG2I3EdilnGi5zPmoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4171.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(5660300002)(83380400001)(6666004)(86362001)(31696002)(6512007)(508600001)(26005)(33964004)(53546011)(6486002)(2616005)(6506007)(4326008)(2906002)(186003)(54906003)(316002)(8676002)(36756003)(66476007)(66556008)(66946007)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdadW9BdUs3bkh3L1NTbVhwVm1CNXphdVV3aTF3NjhXMVNlbGtJWTljWUtR?=
 =?utf-8?B?VlhobzhST2twVVg1SkpNSDBHRHJ4VW5VcXdqd2d5MnRhNUNaQTZEUTN4RXhS?=
 =?utf-8?B?R1RjZEw1dFNEM1ZqVGlUN2pkQ1NVVlU2eVJHUURiWGVmYUhFK2dCSlptaURT?=
 =?utf-8?B?ZmVNTVdKcWlvVmJ1U2pWZUFQSysxeEFraGZFV0JvbDhZRjErMVhQVHJ5eVdE?=
 =?utf-8?B?L3dQT3FBL0lOVjRaV2Y0OWJSUTJQVGlKRGZrK3JSdzZhTGV5TjZKeHFHTi9l?=
 =?utf-8?B?ZHZMSVc1d2djNmdCR25jbmxPdWg2VUt2TExNZ3RETEplRmNGazJEencwVTNY?=
 =?utf-8?B?ZUZGYlNQTytRNnhiWWVvQk9UYjR2WkZmb29FNFlDTThXVlpzbCtPZHpITVNn?=
 =?utf-8?B?UlFFb2puK3lVWm9jcTdBa0tKV1VnSUdFTmFWRjRtUmRWSDZmdzNuL3J1VE10?=
 =?utf-8?B?NlR5NFA2OU8vWXovRFczc2NXN2d0SHB2dnRIOVVzNUVVUXJSalYwZG83dFNM?=
 =?utf-8?B?OGJZdmVTNGk2dnJOOHIwc0tmSW9teWYybGFrNzZSdFJXblNWTzFpMWVJeGN3?=
 =?utf-8?B?anFVUWM1dTB6Y0pZMk9nWEZGWm9lNE5GdXRNa05sZXd0bWxqWXVYWHVoNUJI?=
 =?utf-8?B?eVY0REVUZjdZRE04cGN2WUVxajBQYWNUTG9kZnZRMTZtcklUamZxMk50Q0do?=
 =?utf-8?B?UG5SdzYxWmNRVWdIcGd4TXU1VUJDRXU2bGs3SlVZN3Z0dktIYlArQVN3Smh3?=
 =?utf-8?B?S2ErZzI4b2QyYlFHTHpDN0dzWFU3enFCUUcwajlySXVPVCtTYTk0YjdLYnVC?=
 =?utf-8?B?MWNHeXBtekQvNXM5R2EvSGdyczJZMTRiVSs2UERvMGphQldjSjBWUkdGSmp0?=
 =?utf-8?B?UmtqczIzN3pqZTdEMVdUQnUyLzR6aVd6Z1BkWEl1OVZnZzhIV0V3aEdvaHpL?=
 =?utf-8?B?WE1MZzhBclRaK1FoeDVDUmVJK2tNTDRjY2ZTblhxdGtUR2JTaVVtRXpBL2Nt?=
 =?utf-8?B?S3dIbFFMYWx0NTNCeEYydmZrU2E3Ry9kQkp6UU1YcVIyTWRxR1NVVWpGTG03?=
 =?utf-8?B?cGdMTHh2Z1FKN0RHNUd1M1hES1VRajFYVHB5aFNyQmNGbW8xMk5GSkVWbjg4?=
 =?utf-8?B?Y3ZkS3FiQTZtWjhBOHppMUJGeEVqY0pqREFWcklYWkFsK1p3dGx3dG9rbEpy?=
 =?utf-8?B?dklLQ0Fzd2dvdkEvZjlIamZ6R1VEWXdxNTNCSU04d0hEeWVmZTBtOExwQXJV?=
 =?utf-8?B?UGxCQ0loM2hDSHpjZDBsNnVadG5Cd1NhNkhnSVZvWGQ3UUd6OFVPWXh0Z3V0?=
 =?utf-8?B?NzVyanlpK2xBYWNWYkdxeGdMeFQvNDEvcmZGTE04T3BVTDBFa2xxMXlHelk0?=
 =?utf-8?B?dG0wcTN3TVY4MnBJOVY5NnREa3h2S2w4anduak9nZGNYT013M21ZT1NmQU1v?=
 =?utf-8?B?ZW92Q01jVlF5S25zUzdNQ3pSeDFheXBsd2ZOWTVhc2Z0S3Bsdy9OU2pZNlhH?=
 =?utf-8?B?SXpHWDM1MjhQNFMwZDNqWTRiTXNFOUUzYkRQUjZ5Sit0bXNFNkZtbjFuZjRF?=
 =?utf-8?B?Skt5KzAzNVowVWRrYWlaMkZNZXJ2RE9SQXRmWUdWeTlkczdNcXJXbEZLbFY4?=
 =?utf-8?B?U3ZQS0duY1ZxNU5oM09NREVRMzZEWGhOSlpFUEQya3NHSnFsS3JUQ1ovVFZW?=
 =?utf-8?B?cUNpOC9BUmpMQ2d1Y3c4R1FESTU1VXRFdEc3R0RaU0Zra1F1NFNTbmtodDdB?=
 =?utf-8?B?RVBaclNFR25NbStyb2JZNnpyLzNjN3NXNVVrMjdSdlROaktwK2JRQlA1bzlx?=
 =?utf-8?B?cmJUY09WbktCbXJFaGhBUnByU0huK0s2NW0xV1Vkcjc1VFl0SE5BMXpxRWtX?=
 =?utf-8?B?L1JnelpTZUx1Q0RxU1Rrd2hkY0hLT01xSkE5VVE0M2ZQcnJ4ZlZWYmhPRnFE?=
 =?utf-8?B?MjUrdGxKenpRWGlCMlNiTm0yMkliUjNpSmJuYWIxOG5Nc3kzNjhLMVlUY211?=
 =?utf-8?B?ajVReGoza2VIbnd5MWlNc0trWWNXS081Mk9nSUpKcGR4NlFiUWx3MERkNnly?=
 =?utf-8?B?VkEyTGRSWkxHcFBwSitFSldBd0hOQkFiWFhiQnNoTWh5Y0JoeHJhNEdSdUo1?=
 =?utf-8?B?MzdpQ2xKbDE4b1krdWVyNjZ5ZFRGVDA4eHNCNElMSllaK0FrSGsydEtxNm8x?=
 =?utf-8?B?QTVIWTVLZ2kwdDQ3MUpSVWhnQjRrWk8vdEpta1R2Unp0bmRja2prV2Y0cFBx?=
 =?utf-8?B?L0ZtcUloSlNCenJvcnQ2ZmYxeEExck5rTFU2UWpPUm12NEVzR3hjUTdqNjN4?=
 =?utf-8?B?U1NsMWpzNXJmOStXdHBMVVcramNuNE5LbDRla0N2V1B6eFZUR3pqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45438ec-e966-4f97-e512-08da3ee899a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 07:23:15.8455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPZjDP+eb7RgzLfbWrSB2fmab6yplfahgxSIsuGRPY1kqtkmM0UffUkd0qEEHaYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4967
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 ajitkumar.pandey@amd.com, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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


On 5/26/2022 2:55 AM, Pierre-Louis Bossart wrote:
>> +struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
>> +     {
>> +             .id = "AMDI1019",
>> +             .drv_name = "rmb-dsp",
>> +             .pdata = &acp_quirk_data,
>> +             .fw_filename = "sof-rmb.ri",
>> +             .sof_tplg_filename = "sof-acp-rmb.tplg",
>> +     },
>> +     {
>> +             .id = "10508825",
>> +             .drv_name = "nau8825-max",
>> +             .pdata = &acp_quirk_data,
>> +             .machine_quirk = snd_soc_acpi_codec_list,
>> +             .quirk_data = &amp_max,
>> +             .fw_filename = "sof-rmb.ri",
>> +             .sof_tplg_filename = "sof-acp-rmb.tplg",
> this looks rather odd, you have two entries in the table that point to
> the exact same pair of firmware and topology files. This is either
> intentional and missing a comment, or a copy-paste mistake, or some of
> these fields are not required.
This is intentional only ,will update this once platforms are confirmed, 
will add  comments
>
>> -     clk_disable_unprepare(drvdata->wclk);
>> +     if (!drvdata->soc_mclk)
>> +             clk_disable_unprepare(drvdata->wclk);
>>   }
> mclk and wclk are different concepts usually.
Our intention here we don't want to enable /disable wclk(clock) when soc 
is a clock master.
>
>
>>   struct acp_card_drvdata {
>> @@ -49,6 +51,7 @@ struct acp_card_drvdata {
>>        unsigned int dai_fmt;
>>        struct clk *wclk;
>>        struct clk *bclk;
>> +     bool soc_mclk;
> I wonder if soc_mclk means 'soc_clock_provider' ?
yes
> it looks like a configuration instead of a real/physical clock?
yes ,its just a flag to know whether soc is in a clock master mode or not.
