Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE541DDAA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA2616BA;
	Thu, 30 Sep 2021 17:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA2616BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633016237;
	bh=aM7G64kyV4htl/WPJ5P4GgnFXyjNi+3iSOsph9uZGpc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW8bWuRx6IxCqc4+Pt0gDoB17ACesEbwm11Z7eaaBgWdINRNMsJfw4/fw+uuVs1mB
	 7qq61H9wOuuYyV1/D7DYEjDbjdzf66UypOtHrHejVS7BPilMCcBt6v8gN9EURPl+D8
	 nY0Cr1K9fSXFZ0YVqak63PDooyKYw4y/4YMwcaqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C781AF804BC;
	Thu, 30 Sep 2021 17:36:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFE4F804AD; Thu, 30 Sep 2021 17:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88D17F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D17F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="e//20gF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTolLhezci7iYFXBqciti4xcM5SqaKkLANTT9UL6Pyehpnn3JZ8I+rSAnpnDOg8KXxUbkXR67nYzrR6geCyZ4YLBvAFMtdDsDZ8LXfyYquC7Y9SqMS1LHyrD7v94bs9U9g1+P9AbvuFNB50nZNGyAH82EpoV1ClbjetOJozXRQgBxM8EhbDcdXsGPWijOcaz/ugn43BXNN5MI90QMR+xpu56c3KdQ3sYKjYQxTj3Me5OinDfZS/pHw0ulE4BDmdEpStkpke8m6Z2DEIwbwkS3XGORN7U60zXm18CBaxi3BKgIyg+aB8v7GYAjyqFkxohKaRG7Hbtb9elXmhFSO8bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yQxEB1gqDVe5DEGhWqKCWvl1GPa8h75yS/FUBN+DP8Y=;
 b=J4CT+SWD7TsR+Mtfb/uTG2CA0w5bTuA3+EiRqxV82FzAhtbKlVAkKPwQ2dpVba8oxcqmuANW/hPHF0grgR2fvlT0aSEVBaMQnY6Jxi9u4RJuHmtnkdc5YREKfV1IPlBAAvPMpDMn13Xyh1lkNIEpPP+9GJ3waY6kULF5zkKA8Qb9wCiJ7pdbehx4f99uzm5Ra0WftF89jKXtmmSjS34EuYsmFLXnCTXJNEIG6tWNw17lFWy4X/fsaM9XRQ02+NyT6lM/5Bg9/Nz5KvhSFMIgMhr1CEhnkK9O447yzsq5rFfzRqrQyuKo4O10hjigVsTGWntSRgFxjshC98kFEHZOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQxEB1gqDVe5DEGhWqKCWvl1GPa8h75yS/FUBN+DP8Y=;
 b=e//20gF5h7pRWXKfBNB60YUu2CbeIe8kRwZOzlrrsDoT7EZxq6cdRoekTkF44wJsXlUKuggCJLbcxjrnRn1rpVF/6n+ERySfYFBoP/fX1gEg2z8uMp3CwFXgu6LSmmylPyd4NUTTPHokd99dJ9/Peyd4AjnE1JiEZiaVEmw4jNDCYHTyk8klFcANPWAueBnxWMqszU/dS4iRfJZZJ46KmxUtSuw8FT2H2tjDHCUyFaoPoJPoNipHPl56j5tVMbTKTETmHvFjfvR01VcLfAmRH7hCxB6pnZnm2Yf5lKAGndh1J100GFxJwNWOVb3UIoZTxqdRsh+njWW1zvJ18qv4lQ==
Received: from BN6PR17CA0017.namprd17.prod.outlook.com (2603:10b6:404:65::27)
 by CY4PR12MB1480.namprd12.prod.outlook.com (2603:10b6:910:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Thu, 30 Sep
 2021 15:35:49 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::70) by BN6PR17CA0017.outlook.office365.com
 (2603:10b6:404:65::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 15:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 15:35:48 +0000
Received: from [10.25.99.231] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 15:35:42 +0000
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
 <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
 <94861852-29ba-be9e-8c63-a70a01550b3a@nvidia.com>
 <b68d3c04-07b5-966c-5cd3-8cc715cc470e@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <78e175f3-29cb-f059-427f-51210278c42a@nvidia.com>
Date: Thu, 30 Sep 2021 21:05:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b68d3c04-07b5-966c-5cd3-8cc715cc470e@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58d5a670-c462-4788-dedb-08d98427fa81
X-MS-TrafficTypeDiagnostic: CY4PR12MB1480:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1480A18F3330C8F1FCCFE407A7AA9@CY4PR12MB1480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YtMXAv6rMUwwydCmFO3svSuNOd1/V7f3uQOHh8oxgoLloZX3SFvgWp1e7BQ6m8IHg+hxYaSAzEbQKJsGGEmB+Hl1XSOIu+qLCVllvId0OEUKHXgJB6NLz3fqit86BSM0NT+4m3xWOMDW9cEr+WoY/YnMo2lwS2wgeUqT19MKKJbtx07yeBHw/Z/S59C69HAb82TsafMoLYPQwh50lFbzvvBbK6sCkgfzqajArNK4GI+5EJ/FY0ShNRWQELoaI4oT1TpiPcMqm2AIax2cA0fsTDK+HINUDZez7rmx0/U4FnCjkP2eo0/Tmk2o99XqV7Tt/cQZQBGV0LM4lT9GCWXaG1g/58EJXthxy4WLzh/JHx0nCBquoQZUQhGZocVXAnLnFLjs8aFuK2xyBnQU6SZRQ7qRqybfom3NDrlYJpgAXdbbHmN789DO9nyKgtXJoEcmtfe5Lzjq4OJNqjEBRAUozQy03S8i97xJIWkCcZ0X/36ZHgJYV4KIM9C4GBD0izAcahe/DuFayjLjPvQJ2XCFZWI+fjxoR8hQhs8q2rzgpszkBbPiWJ9qrqvPHzHTQAhlGmigwHKHgoeMRVGEQteyGbEQCTm64VPaeqkEniPyAC8LBYZvcARyYFw3PuBjrvxhOUiAn/fePSi3PVqr8a5MCUuENbmxaKw2P/0FAOxkr2tXq7/D82tKyFyuppbio+kty77qGQwiglTeaxilpyTZcyOaFsrX/g6CNY6gZha+a4UwkuPQDXZVXIZ3bZ02hq3
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70206006)(53546011)(36906005)(6666004)(82310400003)(16526019)(83380400001)(356005)(336012)(16576012)(70586007)(316002)(186003)(8936002)(7416002)(47076005)(426003)(26005)(36756003)(2906002)(4326008)(7636003)(508600001)(110136005)(30864003)(54906003)(921005)(86362001)(5660300002)(2616005)(8676002)(31686004)(31696002)(36860700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:35:48.9352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d5a670-c462-4788-dedb-08d98427fa81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1480
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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



On 9/30/2021 8:04 PM, Pierre-Louis Bossart wrote:
>>>>>> But in addition we'd need to agree on what an 'active BE' is. Why
>>>>>> can't
>>>>>> we connect a second stream while the first one is already in HW_PARAMS
>>>>>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>>>>>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>>>>>
>>>>>> And more fundamentally, the ability to add a second FE on a
>>>>>> 'active' BE
>>>>>> in START state is a basic requirement for a mixer, e.g. to play a
>>>>>> notification on one FE while listening to music on another. What needs
>>>>>> to happen is only to make sure that the FE and BE are compatible in
>>>>>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only
>>>>>> checking
>>>>>> the BE NEW or CLOSE state is way too restrictive.
>>>>> Sorry for the trouble to your system.
>>>>>
>>>>> Idea was to avoid reconfiguration of the same BE DAI again, but not to
>>>>> stop the provision to add a subsequent FE. In fact I had tested mixing
>>>>> of streams coming from 10 different FEs.
>>> Can you describe the sequence that you used to start them? That may be
>>> useful to understand the criteria you used?
>> I have something like this:
>>
>> FE1  --> Crossbar -> Mixer Input1    |
>> FE2  --> Crossbar -> Mixer Input2    |
>> ...                                  | --> Mixer Output -->
>> ... |
>> FE10 --> Crossbar -> Mixer Input10   |
>>
>> All these FEs are started one after the other. This is an example of
>> 10x1. Similarly we can have 2x1, 3x1 etc.,
>> In our system, the crossbar [0] and mixer [1] are separate ASoC
>> components. Basically audio paths consist of a group of ASoC components
>> which are connected back to back.
> Not following. Can you explain how starting FE1 does not change the
> state of the mixer output then?
>
> Or is each 'Crossbar' instance a full-blown BE? In that case you have a
> 1:1 mapping between FE and BE, a *really* simple topology...

Yes 'Crossbar' exposes multiple ports and it is 1:1 mapping with FE. 
Starting FE1 does configure mixer output.

>>> I don't fully understand the notion of mixer input DAI, in our case we
>>> have a bunch of PCM devices connected to a mixer. The mixer is not
>>> directly connected to a DAI.
>> Please see above mixer example. Since mixer is a separate ASoC
>> component, it exposes 10 inputs (or DAIs) and outputs. Originally what I
>> wanted to do was, for subsequent FE runs (FE2, FE3 ...) mixer output
>> need not be configured again and again.
>>
>>>> The problem as I see is that with this patch one can not connect a new
>>>> FE to a BE which is _not_ in NEW or CLOSE state.
>>>>
>>>> The FE and BE needs to be connected to have DPCM working and this patch
>>>> makes the code to skip the dpcm_be_connect().
>>>>
>>>> Consider this simple setup:
>>>>
>>>> FE1 -->|
>>>>          | --> BE -->
>>>> FE2- ->|
>>>>
>>>> First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.
>>>>
>>>> Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
>>>> made because BE is no longer in NEW/CLOSE state.
>>> I share Peter's analysis, there cannot be any restrictions on
>>> connections - at any time. A mixer input might become active and be
>>> added to the mix. We might have a temporary lock to delay new
>>> connections but cannot not reject them outright based on BE state.
>> Yes, I understand how this affects a system like yours. As per mixer
>> example above, in our case subsequent FEs always find BE from Crossbar.
>> That is why I don't see similar error.
> Not following either.

May be it is understandable now with above crossbar point?

>>>>> I am just
>>>>> curious to know, if originally you were reconfiguring the BE DAI again
>>>>> with same parameters (for a second FE) or some additional configuration
>>>>> is done?
>>> That's a different question - and a good one.
>>>
>>> In the case of a mixer, the propagation of hw_params is a broken
>>> concept. It leads to the first FE configuring the BE to define its
>>> preferred parameters, e.g. S16_LE format. If later on a second FE is
>>> started which could play S24_LE, the mixer and BE are already configured
>>> to a lower resolution. A mixer should really have its own parameters and
>>> be the start of a new 'domain' - as Lars described it several years ago
>>> at the audio miniconference.
>> Propagation is one of the problems we want to address and require help
>> from DPCM experts. But the scenario you mentioned is a special case
>> which need not be supported, because mixer can operate in one
>> configuration at a given time and subsequent FEs should agree to the
>> already running configuration. However mixer should support both S16_LE
>> and S24_LE (whenever possible), but not simultaneously. At least this is
>> the expecation from our systems. Yes mixer may require fixup of a
>> specific config (we earlier had proposed mixer controls to configure
>> mixer parameters, but the idea was disliked), but propagation may help
>> avoid fixing up everywhere in the audio path where it is not really
>> required. But I don't know how this can be done at the moment.
> What I am saying is that the mixer should be pre-configured with the
> desired resolution/sample rate, and some adaptation needs to happen if
> the FE provides data in a different format.
>
> This is similar to what sound servers typically do on their sinks, they
> define ONE configuration. Dynamic changes are annoying and result in
> corner cases where the quality can vary depending on which FE is started
> first.

When there are multiple FEs running, yes it is better to run on a 
pre-agreed configuration to minimize the side effects of race between 
FEs. Also there should also be a provision where mixer params directly 
depend on FEs. For example, a 2x1 mixer can mix two 16-bit streams at 
one time and the other time it can mix two 32-bit streams.


[...]

>>>>>> I can send a revert with the explanations in the commit message if
>>>>>> there
>>>>>> is a consensus that this patch needs to be revisited.
>>>>> May be this can be revisited since it appears to be a critical problem
>>>>> for your system. But I hope this discussion can be alive on following
>>>>> points for a better fix.
>>>>>
>>>>> 1. The original issue at my end was not just a configuration
>>>>> redundancy.
>>>>> I realize now that with more stream addition following error print
>>>>> is seen.
>>>>>      "ASoC: too many users playback at open 4"
>>>>>
>>>>>      This is because the max DPCM users is capped at 8. Increasing this
>>>>> may help (need to see what number is better), but does not address the
>>>>> redundancy problem.
>>> we haven't used more than 2 users, but it's already broken at 2 with
>>> race conditions left and right. I am really surprised you managed to
>>> have more than 2 without hitting inconsistent states - our automated
>>> play/stop/pause monkey tests reliably break DPCM in less than 20s.
>> I am not sure what is the exact difference, may be DPCM usage in our
>> case is different from what you have. I have mixer tests for different
>> combinations (2x1, 3x1 ...), which seem to pass. In general, we want to
>> have path like this.
>>
>> FE -> BE1 -> BE2 -> ... -> BEx
>>
>> Each BEx could be a mixer, resampler etc., Currently DPCM core sees this
>> as multiple BEs for a given FE and that is why multiple "users" are
>> reported.
> This sort of flow vastly exceeds the capabilities of DPCM, which is
> already badly broken with one BE and 2 FEs... I think what you want is
> what Lars described at the audio miniconf with 'domains'.

May be the core would require enhancements to fully support such scheme. 
But so far the system is running well for below path:
FE -> BE1 (crossbar) -> BE2 (I2S) -> BE3 (external codec)

I could introduce more BEs like resampler or mixer in the path and 
results seem to be good.

BTW, I don't know what 'domains' mean. I will be curious to know what 
this exactly is. If someone is already using it, a usage reference can help.

>> In the interim, may be we can have following patch to keep both systems
>> working and keep the discussion going to address the oustanding
>> requirements/issues?
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index ab25f99..0fbab50 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct
>> snd_soc_pcm_runtime *fe, int stream,
>>                  if (!fe->dpcm[stream].runtime && !fe->fe_compr)
>>                          continue;
>>
>> -               if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
>> +               /*
>> +                * Filter for systems with 'component_chaining' enabled.
>> +                * This helps to avoid unnecessary re-configuration of an
>> +                * already active BE on such systems.
>> +                */
>> +               if (fe->card->component_chaining &&
>> +                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
>>                      (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
>>                          continue;
> that wouldn't work. We need to support the STOP and START cases as well.
>

I meant with flag 'fe->card->component_chaining', which is currently 
used by Tegra audio only.

>>>>> 2. If reconfiguration of the same BE is not necessary for a subsequent
>>>>> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
>>>>> failure?
>>>> I'm not sure, but it might be possible to just skip the
>>>> dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
>>>> call at the end of the loop, but the question is under which condition?
>>>> Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?
>>>>
>>>> Skipping the connect does not sound right for a new FE-BE connection.
>>> The reconfiguration is one problem, but what also happens is that the BE
>>> dailink will see multiple triggers. I've been playing with refcounts to
>>> force consistency and make sure there is only one TRIGGER_START send to
>>> the dailink, and conversely there are cases where the TRIGGER_STOP is
>>> never sent...
>> Just a thought. FE links have dummy codec DAI and core wants to find a
>> real BE when FE is started. May be don't fail a FE when no back end DAI
>> is found (and/or find if the same BE is already connected to some FE)
>> and the above problem becomes simpler?
> That would be just moving the problem. In our case we would be silently
> playing on a dummy output just because the correct output was not found
> due to state handling issues.

OK. In our case, application would report error since the frames would 
never get consumed for given FE due to unavailable BE.

