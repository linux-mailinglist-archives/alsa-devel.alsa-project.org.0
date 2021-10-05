Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00249421EE8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 08:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8DA3E;
	Tue,  5 Oct 2021 08:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8DA3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633415913;
	bh=1Z4h0bn89KK3pDmcxyqYRKcIKcsPSEPmTAwSe56k8gY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgDqfYLRlam5sDdpki1stL+6S6d1A8ygZAqjK9ii5VhsULZN1M4VS7BB3rSz47MDU
	 8UJEpnOoWnE6I6GQ7QYCxvOqljpSmzsFXfFyA3K0p7BTZ7qXx0G5Q493Pym2UJv/EE
	 r09YKXnyLKBvWAGAjfuEtEhxsk0i/Dg3k4oMY7SA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C59C3F8020D;
	Tue,  5 Oct 2021 08:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF5DF8027D; Tue,  5 Oct 2021 08:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A5BDF80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 08:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A5BDF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="c++TjnWt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg8GveeAC4PFkFSJLd7jzvaCI9eJf0Wsd8VFY45bXd5euG6easGjkYQSruD5ga6ULuaWG4TmTM7PiNxkhDaiyxdWpOBI4Up1uS2BYoVIeTRYQliXoZhQaqkbWkKeP/Rd9OKg+qomIdsu5vqMtfUPV7p6Zydk0WCHeIwLxndpOvndn8IzD6kIeubLrLePkcb/oQH03YYbZY6ndYYOaWSZCN5zvWzQKR7RKQwjNMcwPeJaknLC3GgcTKmRK4lBYgEcDoi/v2/jb71qfkQKyQ7768spcjywTVIAFtQe2qvg1jEMr+zg0ZfF3GB7kaUJyhYR9WB3W4ZL2H3V15C8hd87bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxKDVMU+mJ298M/aRGqKT9Yz0OQQJfBrwKaLVLhtEII=;
 b=PpNx4QZWZnsrIuzbuU65SmgtixjqJEVj7ExMB6l4rt3FRng15FLkxyWsO9vKpHqbE1RHnuwTSmwOyHCpEq1ogM4McsXle5uQGbB9oxrDjodTPCyIdasnNTjTH4pji+4LWz7liGysL9ohb6TVWx/ARiuRyrSv/4WDptxXQd+5ZprDlnrs/Zh+FsLnA/qGv0O+/pjQ4ouL3yDZUqoKShJNJOitvWI2FKTdphxpOtyzg9FXw0Vvg3HBuo1Z6zgUvzusmZaCmD3r9oy43FuYakKWncrhPO4VU2oVpIHu8OlAoLwnU5v3j+xsawCJwmY8wQVUMG0mZS9l5H11rTJnA2GXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxKDVMU+mJ298M/aRGqKT9Yz0OQQJfBrwKaLVLhtEII=;
 b=c++TjnWtdYxqV7w0FuLW6QaKuHqes27kH3X60rWbmE7kFu0Lr0IlXO265cY+wi4YclnbOQCHDGa7eQJeHT55NEqFbOOCT4rZpxoAFPWN6WNMDZbkN6oSIA1fypnycG6e821lHr7V6iEJo3E3oFe0xesuWBDJh/r5R0xqOrd9cPYLh8mDvtXUoEoEqvXUtfYD9QdxUk3fbDkMg7sX7qTPIWUzlZBsDab6QUSRm0EM8Fd4P0zUDSO7ppFQryIW/H0OJMmNrFC4dZjg8OR1DLrRbhnATMCCG7iyWq+2vbCZfa+0wjLGFcBZ3L70AEIHev4s9kvUlQpMEjTRetUam+usKQ==
Received: from DS7PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:3b8::25)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 06:37:01 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::2e) by DS7PR03CA0020.outlook.office365.com
 (2603:10b6:5:3b8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Tue, 5 Oct 2021 06:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 06:37:00 +0000
Received: from [10.25.98.154] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct
 2021 06:36:57 +0000
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
Date: Tue, 5 Oct 2021 12:06:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8cc1782-0c3f-41fc-918e-08d987ca8968
X-MS-TrafficTypeDiagnostic: BL0PR12MB5505:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5505D72747B16EAECCA6F68AA7AF9@BL0PR12MB5505.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5AbgiFTZ5oAIbLE5/Zd6AR9gPts6I1rDUEQ9sE3Xo5s+xFoeHV9IS+yOOd9s5MUWho2QXoQBHCUbOoFDe2rVDt9011cCLQ48XVD7kC3eIU6iJN1HS/GzIb1DZ8+1/xRcGmL6lp+/aSqSTHHw2kGRNSOhMOHw5wqqw77tv5GkzHb9qpeqLBFtgJJBDo5ScyIpneuAvr2wwwwGCaOd963SwbQXlXBgHjyN4GYxrM9Qv5w/Sld6Ca6embWZIlsBlQS0lrBi0BQWh9bqtyZyRaUFx0iDl7oW6ipRXW7CgLeq/zQc4ypi8weTzT60RXawHsqmilSsUyhkVentONGxFpzbi38LhiB1xLuS451ytJ0C2ldksCUnI6U2hdYidcpyJ72866qin55+71HbRLw4Wq32RqYh7n21NWEApNMK/m8myRQ3pbKhadCRQvYOic/J4zfbQq6YyJH50RzlBKqnr8Rf29AKawW4cbZ6/now1XTZmvfli4J/TOxxgKMWWT/EEqrCeZwSr0HOR0oc2zSogIK5eqTiVg1bQYh6fVV90ZPSwZWiyPxa7A7p/4gR7mD1hUEZ64pF9MTSlLTCZQhwcsSzNRFjoa57Qq0ty+IcsqLzxOb81BjOdjlYhu8m/EDbaUXwh8kTWkDUg2C74tpRYGCyr7H5s2gRevFeKa/nCnYS68qHKJ74+5sxL0ilGptUT6Enw6EmGYXLGo627Xjh4twIFzj9xelleU6QgsZEtVO7UNiqSUFp+tuPtoZtMAoujkG1CjM+U6waclWjk0ouMxFiUy2zAiEeRKpns5zK5ac18aXeW2cpSGT7EFQzjejQOFJMWs1dm5oLCHsA2HwuCqOpYEi5/JONZanCJV7ekFQ7A4=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(186003)(83380400001)(36756003)(31696002)(16526019)(47076005)(36860700001)(2906002)(82310400003)(356005)(7636003)(336012)(316002)(70586007)(508600001)(110136005)(966005)(6666004)(426003)(26005)(8936002)(16576012)(8676002)(2616005)(4326008)(54906003)(5660300002)(53546011)(86362001)(31686004)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 06:37:00.7008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cc1782-0c3f-41fc-918e-08d987ca8968
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 vkoul@kernel.org, broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



On 10/5/2021 4:24 AM, Pierre-Louis Bossart wrote:
> External email: Use caution opening links or attachments
>
>
> We've been adding a 'deep buffer' PCM device to several SOF topologies
> in order to reduce power consumption. The typical use-case would be
> music playback over a headset: this additional PCM device provides
> more buffering and longer latencies, leaving the rest of the system
> sleep for longer periods. Notifications and 'regular' low-latency
> audio playback would still use the 'normal' PCM device and be mixed
> with the 'deep buffer' before rendering on the headphone endpoint. The
> tentative direction would be to expose this alternate device to
> PulseAudio/PipeWire/CRAS via the UCM SectionModifier definitions.
>
> That seemed a straightforward topology change until our automated
> validation stress tests started reporting issues on SoundWire
> platforms, when e.g. two START triggers might be send and conversely
> the STOP trigger is never sent. The SoundWire stream state management
> flagged inconsistent states when the two 'normal' and 'deep buffer'
> devices are used concurrently with rapid play/stop/pause monkey
> testing.
>
> Looking at the soc-pcm.c code, it seems that the BE state
> management needs a lot of love.
>
> a) there is no consistent protection for the BE state. In some parts
> of the code, the state updates are protected by a spinlock but in the
> trigger they are not. When we open/play/close the two PCM devices in
> stress tests, we end-up testing a state that is being modified. That
> can't be good.
>
> b) there is a conceptual deadlock: on stop we check the FE states to
> see if a shared BE can be stopped, but since we trigger the BE first
> the FE states have not been modified yet, so the TRIGGER_STOP is never
> sent.
>
> This patchset suggests a transition from a spinlock to a mutex, an
> extended protection when walking through the BE list, and the use of a
> refcount to decide when to trigger the BE. With these patches I am
> able to run our entire validation suite without any issues with this
> new 'deep buffer' topology, and no regressions on existing solutions [1]
>
> One might ask 'how come we didn't see this earlier'? The answer is
> probably that the .trigger callbacks in most implementations seems to
> perform DAPM operations, and sending the triggers multiple times is
> not an issue. In the case of SoundWire, we do use the .trigger
> callback to reconfigure the bus using the 'bank switch' mechanism. It
> could be acceptable to tolerate a trigger multiple times, but the
> deadlock on stop cannot be fixed at the SoundWire layer alone.
>
> I chose to send this patchset as an RFCv2 to gather more feedback and
> make use others know about DPCM issues. We're going to spend more time
> on this but if others can provide feedback/test results it would be
> greatly appreciated.
>
> Opens:
>
> 1) is this the right solution? The DPCM code is far from simple, has
> notions such as SND_SOC_DPCM_UPDATE_NO and 'trigger_pending' that I
> have no background on.
>
> 2) There are other reports of kernel oopses [2] that seem related to
> the lack of protection. I'd be good to confirm if this patchset solve
> these problems as well.
>
> [1] https://github.com/thesofproject/linux/pull/3146
> [2] https://lore.kernel.org/alsa-devel/002f01d7b4f5$c030f4a0$4092dde0$@samsung.com/
>
> changes since RFC v1:
> Removed unused function
> Removed exported symbols only used in soc-pcm.c, used static instead
> Use a mutex instead of a spinlock
> Protect all for_each_dpcm_be() loops
> Fix bugs introduced in the refcount


> Pierre-Louis Bossart (5):
>    ASoC: soc-pcm: remove snd_soc_dpcm_fe_can_update()
>    ASoC: soc-pcm: don't export local functions, use static
>    ASoC: soc-pcm: replace dpcm_lock with dpcm_mutex
>    ASoC: soc-pcm: protect for_each_dpcm_be() loops with dpcm_mutex
>    ASoC: soc-pcm: test refcount before triggering

Thank you Pierre-Louis for adding me to this thread.

I did a quick test of your patches on my Tegra board and seeing issues 
with multiple streams. For instance, I ran it for a 2x1 mixer 
configuration and hitting below:

[  277.661886] BUG: scheduling while atomic: aplay/1306/0x00000100
[  287.713193] BUG: spinlock cpu recursion on CPU#0, aplay/1307
[  287.719138]  lock: 0xffff00008cc820f0, .magic: dead4ead, .owner: 
aplay/1306, .owner_cpu: 0
[  287.727319] CPU: 0 PID: 1307 Comm: aplay Tainted: G W         
5.15.0-rc3-next-20210927-00026-gffdabce987b1 #12
[  287.737783] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[  287.744228] Call trace:
[  287.746656]  dump_backtrace+0x0/0x1c0
[  287.750300]  show_stack+0x18/0x28
[  287.753604]  dump_stack_lvl+0x7c/0xa8
[  287.757236]  dump_stack+0x18/0x34
[  287.760536]  spin_dump+0x70/0x90
[  287.763732]  do_raw_spin_lock+0xd8/0x120
[  287.767615]  _raw_spin_lock_irq+0x60/0x80
[  287.771581]  snd_pcm_stream_lock_irq+0x20/0x48 [snd_pcm]
[  287.776853]  snd_pcm_drain+0x1ec/0x348 [snd_pcm]
[  287.781421]  snd_pcm_common_ioctl+0xacc/0x1938 [snd_pcm]
[  287.786685]  snd_pcm_ioctl+0x2c/0x48 [snd_pcm]
[  287.791101]  __arm64_sys_ioctl+0xb0/0xf0
[  287.794982]  invoke_syscall+0x44/0x108
[  287.798683]  el0_svc_common.constprop.3+0x74/0x100
[  287.803416]  do_el0_svc+0x24/0x90
[  287.806687]  el0_svc+0x20/0x60
[  287.809705]  el0t_64_sync_handler+0x94/0xb8
[  287.813839]  el0t_64_sync+0x180/0x184


And in some case just below:

[ 1074.212276] BUG: scheduling while atomic: aplay/12327/0x00000100
[ 1095.227509] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[ 1095.233443] rcu:     0-...0: (1 GPs behind) 
idle=4af/1/0x4000000000000004 softirq=19902/19902 fqs=2626
[ 1095.242528] rcu:     2-...0: (1 GPs behind) 
idle=9d5/1/0x4000000000000000 softirq=22707/22707 fqs=262


