Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE941D4E7
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 09:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0FBA16DE;
	Thu, 30 Sep 2021 09:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0FBA16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632988719;
	bh=s7jyp5qSVo52mIbzCiKb5sagU2CuoTJW+PkmqqjhVFc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iu6y2eSxiFycXPfgZmfo8b3m9+rKZBIVSawsBK16WP/fKZp9vtyQ2lpF6xSCn3nrc
	 Sc05uoTkBhceMEuJuzKSvUIFd0O4uaSspiKOZpiIYu6Ny+G8T6PY5q2oBeANHtcjZY
	 uwsnnheprcunJZzPK7t4Ppcq9WP2mGelbnlvSoKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A63F8032C;
	Thu, 30 Sep 2021 09:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA4FF804AD; Thu, 30 Sep 2021 09:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA90F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 09:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA90F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ilpxOavV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/86GhbA6XrHLNoRtVZrA2sd4YRPmcKer1nvgIWezs4D5GuarXaLqBm6SbLAwH+5epOSLRnliTzjj3gE9LRiOXTphRBwpoLmWJCG0iKwW4bkAvj3fCYD+Cr2WfffjsIziOWwYg6BjARJ/63+KoXW5UrjH8umPGwJhCP/a7xapZ0pgPIT45Jz4ZUn5kOHJyEnD4Uo2I1++SDzCX8csRFFso5VPpzbiptizSbYMWzl1WUU72Y/hnbwxZxgL+YBNTaL8U9rwTr+28BX0gqMQ2lwJ8lMn5am4V+LVXog5fx3ZHYe6cF7rsy4777y+qr7hhK4j4BpDF7M7QU68mNrochvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yt7Anovnp6T7Y1g+Z6f/bQgqyXLTnr+vok3tfV4VCoo=;
 b=WK/IWSUg1BsDBB2r9bcSulLnibvMXgA9FhoTNF7J9JJ/5cvywx2VsBSagsCSaM1hdNRUJMhuuz59MW6b1F/yB+V1YmmbhspGLngEnKyHGQu7uqkc9pwtnKflIj2j+GgM9ytfFk/lzrP3IQUTUAvH45CVOOIevGPxrNOPtwkO3msfcI9Q2VTyNqp6Bn8A7J7kHBvwTZ4NA9oGXPolV8/4Ei4yaUI7NfRY57EBINurGR1kcOIDWw8AyciZtbjDM+/w53ui43Zja26SUrkXnkXzz/OFQKcs+GObC5BnR9Pufjw+ZAIyElPJP1tOyB2+D198BNeqtpYfWBtX48OKszjobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt7Anovnp6T7Y1g+Z6f/bQgqyXLTnr+vok3tfV4VCoo=;
 b=ilpxOavVhlWKpYJVEchCLou3iZRZfZgXl7gnPoGwyc1kKdqm/BbN7QtpNtgGumagnLPRgZSyAqLlnD7W9pKCHfrl/WLTDtgouF4NijohbgKYVfJM3/JXeaF1A1+KJrFSMVPwr9lbSpT2mz/QK/hpZtU7p7m+M76mqHAOUr5W0TGoTQj0mi3o7Wfqs6LLJMkLYkp/t/DdmKKqLzZo36+XUICWNu+KbVuUYuKYq3VX7ww0SfoN8cb4ksnV3GfuOrC0mQrDuqKUQ7xL2Du+MZOvvueErmSk/MIi8vU0z1Bdo7rrxO6S4SsiVqgxOHWYkmz9hAt2+O6GsKKPbJUtZnQP0A==
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by DM6PR12MB3483.namprd12.prod.outlook.com (2603:10b6:5:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 07:57:11 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::1) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 07:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:57:11 +0000
Received: from [10.25.99.231] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 07:57:04 +0000
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
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <94861852-29ba-be9e-8c63-a70a01550b3a@nvidia.com>
Date: Thu, 30 Sep 2021 13:27:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd292a31-d556-49fa-6b16-08d983e7e89e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR12MB348355CFE590BE4AF13DDD42A7AA9@DM6PR12MB3483.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RPNFnIXlBKzayIs4Krmfh0zHtltOYK52I/aSl7c4ONWF826KrRlRrylVcZ/mv4V8T3lFdsn57YBfXdGJS/n4HQF4WicGB+at/6LdvPYiQqfrUsWO+ZAHeHAezl+NjeveVsWSzw8PZ1EhQR8t9jueu89YD8WR4wJh25J2yYQzwq6p7wXM30+5HT64v0whQ0doVD5yFKXucEO9c3lRsci5RLCvzpYExfqCAYJfaHjMqiTZiXWm4d97ea1fhv+kq6Bqga/yGIApV+UooLGA08sZI5wqTAoE0fRP8CjU6vgROUNNbQPmAm3guqipd/cE/TfHiAS7bAqqRAYP/gc9uP2CGSPlf0V326TKGCJ/OLm6ZSL05T+XvCEIOMG4e0winMuZF9jqYSU+xeB94y2goc4FwR9Ie5QjBuY1pMpH7LT0u0/dyE3r8KNdOTgpm8SMcc+dNHt+JBtPIoSqOBjIxJY/7wrf4chwk9oYUy/wnafG+l0AHJZR59+6LAcitgmFuISUYwjiPcl4qffyjcJrWxsskB1U3wkX9qQqUig0j/KS7qwkxYkQueZ//thEsHd7WLT53y1w0YLQWBLYkmFnx3t3EuRp1YeZlZQLecSH9j3iHkKvzA1SHy5ddlQnoNcReQNmDAzDZi/aIPxgi4NNh3jHnuicoNiPqE6Orkec4kVURo9xGYQdA+75cKSvXOeFhUqUvxs99abV8OXmopVfoalR1GMW+OVuxhZ1DxENjuzHRxCbdUSBsrP8l3YKYQITCaIFYT0PaPkHBguSHq+eE8iZ68+BNr1jRmEYsXB6v4Hq3eGOLE2VjESU2p3OJEZtHDt6S5awNTeN8PjVfWTsg9IuPA+mX2ikw/Qdu2dTAfhzLf5+kNmeoGPD2kgDhH4W0Ax
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(921005)(336012)(316002)(110136005)(54906003)(6666004)(4326008)(7636003)(16576012)(70206006)(5660300002)(70586007)(8936002)(2906002)(8676002)(53546011)(186003)(82310400003)(83380400001)(2616005)(7416002)(31686004)(966005)(86362001)(36860700001)(47076005)(356005)(508600001)(36756003)(16526019)(426003)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:57:11.1616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd292a31-d556-49fa-6b16-08d983e7e89e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3483
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sharadg@nvidia.com, linux-tegra@vger.kernel.org,
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



On 9/29/2021 8:22 PM, Pierre-Louis Bossart wrote:
>>>> But in addition we'd need to agree on what an 'active BE' is. Why can't
>>>> we connect a second stream while the first one is already in HW_PARAMS
>>>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>>>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>>>
>>>> And more fundamentally, the ability to add a second FE on a 'active' BE
>>>> in START state is a basic requirement for a mixer, e.g. to play a
>>>> notification on one FE while listening to music on another. What needs
>>>> to happen is only to make sure that the FE and BE are compatible in
>>>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
>>>> the BE NEW or CLOSE state is way too restrictive.
>>> Sorry for the trouble to your system.
>>>
>>> Idea was to avoid reconfiguration of the same BE DAI again, but not to
>>> stop the provision to add a subsequent FE. In fact I had tested mixing
>>> of streams coming from 10 different FEs.
> Can you describe the sequence that you used to start them? That may be
> useful to understand the criteria you used?

I have something like this:

FE1  --> Crossbar -> Mixer Input1    |
FE2  --> Crossbar -> Mixer Input2    |
...                                  | --> Mixer Output -->
... |
FE10 --> Crossbar -> Mixer Input10   |

All these FEs are started one after the other. This is an example of 
10x1. Similarly we can have 2x1, 3x1 etc.,
In our system, the crossbar [0] and mixer [1] are separate ASoC 
components. Basically audio paths consist of a group of ASoC components 
which are connected back to back.

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/tegra/tegra210_ahub.c
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/tegra/tegra210_mixer.c

>

[...]

> I don't fully understand the notion of mixer input DAI, in our case we
> have a bunch of PCM devices connected to a mixer. The mixer is not
> directly connected to a DAI.

Please see above mixer example. Since mixer is a separate ASoC 
component, it exposes 10 inputs (or DAIs) and outputs. Originally what I 
wanted to do was, for subsequent FE runs (FE2, FE3 ...) mixer output 
need not be configured again and again.

>> The problem as I see is that with this patch one can not connect a new
>> FE to a BE which is _not_ in NEW or CLOSE state.
>>
>> The FE and BE needs to be connected to have DPCM working and this patch
>> makes the code to skip the dpcm_be_connect().
>>
>> Consider this simple setup:
>>
>> FE1 -->|
>>         | --> BE -->
>> FE2- ->|
>>
>> First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.
>>
>> Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
>> made because BE is no longer in NEW/CLOSE state.
> I share Peter's analysis, there cannot be any restrictions on
> connections - at any time. A mixer input might become active and be
> added to the mix. We might have a temporary lock to delay new
> connections but cannot not reject them outright based on BE state.

Yes, I understand how this affects a system like yours. As per mixer 
example above, in our case subsequent FEs always find BE from Crossbar. 
That is why I don't see similar error.

>>> I am just
>>> curious to know, if originally you were reconfiguring the BE DAI again
>>> with same parameters (for a second FE) or some additional configuration
>>> is done?
> That's a different question - and a good one.
>
> In the case of a mixer, the propagation of hw_params is a broken
> concept. It leads to the first FE configuring the BE to define its
> preferred parameters, e.g. S16_LE format. If later on a second FE is
> started which could play S24_LE, the mixer and BE are already configured
> to a lower resolution. A mixer should really have its own parameters and
> be the start of a new 'domain' - as Lars described it several years ago
> at the audio miniconference.

Propagation is one of the problems we want to address and require help 
from DPCM experts. But the scenario you mentioned is a special case 
which need not be supported, because mixer can operate in one 
configuration at a given time and subsequent FEs should agree to the 
already running configuration. However mixer should support both S16_LE 
and S24_LE (whenever possible), but not simultaneously. At least this is 
the expecation from our systems. Yes mixer may require fixup of a 
specific config (we earlier had proposed mixer controls to configure 
mixer parameters, but the idea was disliked), but propagation may help 
avoid fixing up everywhere in the audio path where it is not really 
required. But I don't know how this can be done at the moment.

>
> For now, the only restriction that we could enforce is that the BE
> cannot be reconfigured after the prepare step.
>
> Note that our DAIs tolerate multiple calls to hw_params. If you have a
> case where the hw_params allocates resources, maybe you should consider
> moving that allocation to the prepare step, or free them if you detect a
> reconfiguration. That would be something needed even outside of the DPCM
> scope. Similarly you need to support the case where the DAI hw_free is
> called without hw_params ever being called, it's a known sequence that
> can happen if the FE hw-params fails.

Currently this does not seem to be a problem for us. Patch was to avoid 
reconfiguration which was felt to be redundant for our system.

>>>> I can send a revert with the explanations in the commit message if there
>>>> is a consensus that this patch needs to be revisited.
>>> May be this can be revisited since it appears to be a critical problem
>>> for your system. But I hope this discussion can be alive on following
>>> points for a better fix.
>>>
>>> 1. The original issue at my end was not just a configuration redundancy.
>>> I realize now that with more stream addition following error print is seen.
>>>     "ASoC: too many users playback at open 4"
>>>
>>>     This is because the max DPCM users is capped at 8. Increasing this
>>> may help (need to see what number is better), but does not address the
>>> redundancy problem.
> we haven't used more than 2 users, but it's already broken at 2 with
> race conditions left and right. I am really surprised you managed to
> have more than 2 without hitting inconsistent states - our automated
> play/stop/pause monkey tests reliably break DPCM in less than 20s.

I am not sure what is the exact difference, may be DPCM usage in our 
case is different from what you have. I have mixer tests for different 
combinations (2x1, 3x1 ...), which seem to pass. In general, we want to 
have path like this.

FE -> BE1 -> BE2 -> ... -> BEx

Each BEx could be a mixer, resampler etc., Currently DPCM core sees this 
as multiple BEs for a given FE and that is why multiple "users" are 
reported.

In the interim, may be we can have following patch to keep both systems 
working and keep the discussion going to address the oustanding 
requirements/issues?

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ab25f99..0fbab50 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct 
snd_soc_pcm_runtime *fe, int stream,
                 if (!fe->dpcm[stream].runtime && !fe->fe_compr)
                         continue;

-               if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
+               /*
+                * Filter for systems with 'component_chaining' enabled.
+                * This helps to avoid unnecessary re-configuration of an
+                * already active BE on such systems.
+                */
+               if (fe->card->component_chaining &&
+                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
                     (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
                         continue;

>
>>> 2. If reconfiguration of the same BE is not necessary for a subsequent
>>> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
>>> failure?
>> I'm not sure, but it might be possible to just skip the
>> dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
>> call at the end of the loop, but the question is under which condition?
>> Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?
>>
>> Skipping the connect does not sound right for a new FE-BE connection.
> The reconfiguration is one problem, but what also happens is that the BE
> dailink will see multiple triggers. I've been playing with refcounts to
> force consistency and make sure there is only one TRIGGER_START send to
> the dailink, and conversely there are cases where the TRIGGER_STOP is
> never sent...
Just a thought. FE links have dummy codec DAI and core wants to find a 
real BE when FE is started. May be don't fail a FE when no back end DAI 
is found (and/or find if the same BE is already connected to some FE) 
and the above problem becomes simpler?
