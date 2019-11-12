Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E6F96C5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB8F1615;
	Tue, 12 Nov 2019 18:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB8F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573578784;
	bh=KfqEttEYSoxtNeV5pa8nUh5tAqE7cNiYUtwePmBTL/Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UgmRdcpQG5fD/v/VJNAExZZIo6uv9jnmu4BCs1S5ZaOa1WWaS4IWDptbhCAzdWt4Z
	 pEw6aFOhvbF4pN5eqsrkDNxK2qb6v0CpQDkrXVsiv0yTCgHe1IxkYcw/EYPfk2C/Xq
	 /3HBg6IziTPudccbTiuQ4xFUuoGMEJ+TgMv2JR0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B902F80483;
	Tue, 12 Nov 2019 18:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FD40F8048F; Tue, 12 Nov 2019 18:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B1AF802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B1AF802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 09:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="194381772"
Received: from sahn-mobl2.gar.corp.intel.com (HELO [10.254.109.48])
 ([10.254.109.48])
 by orsmga007.jf.intel.com with ESMTP; 12 Nov 2019 09:11:32 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
 <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
 <87pnhx8xjl.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xh8wyz.wl-kuninori.morimoto.gx@renesas.com>
 <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
Date: Tue, 12 Nov 2019 11:11:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 06/19] ASoC: soc-core: add
 soc_unbind_dai_link()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



>> Does it happen from soc-topology.c :: remove_link ?

it seems to happen after the topology remove link, see the traces below

> 
> I can't test, but can this patch solve your issue?

No, the problem remains after applying your suggested fix.

I added a bunch of traces and it seems we have a nasty case of corrupted 
linked lists:

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 98ef0666add2..5b0139ebe8f3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -518,11 +518,39 @@ int snd_soc_pcm_component_new(struct snd_pcm *pcm)

  void snd_soc_pcm_component_free(struct snd_pcm *pcm)
  {
-       struct snd_soc_pcm_runtime *rtd = pcm->private_data;
+       struct snd_soc_pcm_runtime *rtd;
         struct snd_soc_rtdcom_list *rtdcom;
         struct snd_soc_component *component;

-       for_each_rtd_components(rtd, rtdcom, component)
-               if (component->driver->pcm_destruct)
+       pr_err("plb: %s start\n", __func__);
+
+       if (!pcm)
+               pr_err("plb: %s PCM is NULL\n", __func__);
+
+       pr_err("plb: %s accessing private data\n", __func__);
+       rtd = pcm->private_data;
+       pr_err("plb: %s accessed private data\n", __func__);
+
+       if (!rtd)
+               pr_err("plb: %s RTD is NULL\n", __func__);
+
+       pr_err("plb: %s accessing components\n", __func__);
+       for_each_rtd_components(rtd, rtdcom, component) {
+               pr_err("plb: %s processing component\n", __func__);
+               if (!component)
+                       pr_err("plb: %s component is NULL\n", __func__);
+
+               if (!component->driver)
+                       pr_err("plb: %s component driver is NULL\n", 
__func__);
+
+               pr_err("plb: %s pcm_destruct checks\n", __func__);
+               if (component->driver->pcm_destruct) {
+                       pr_err("plb: %s pcm_destruct start\n", __func__);
                         component->driver->pcm_destruct(component, pcm);
+                       pr_err("plb: %s pcm_destruct done\n", __func__);
+               }
+               pr_err("plb: %s processing component done\n", __func__);
+       }
+
+       pr_err("plb: %s done\n", __func__);
  }

And the results show the for_each_rtd_components loop goes in the weeds.

    82.069990] sof-audio-pci 0000:00:1f.3: plb: remove_link start
[   82.069993] sof-audio-pci 0000:00:1f.3: plb: remove_link 2
[   82.069996] sof-audio-pci 0000:00:1f.3: plb: remove_link before 
snd_soc_remove_dai_link
[   82.069998] plb: snd_soc_remove_dai_link start
[   82.070016] plb: snd_soc_remove_dai_link done
[   82.070020] sof-audio-pci 0000:00:1f.3: plb: remove_link done
<removed DSP power down sequence>
[   82.179021] plb: snd_soc_pcm_component_free start
[   82.179023] plb: snd_soc_pcm_component_free accessing private data
[   82.179024] plb: snd_soc_pcm_component_free accessed private data
[   82.179025] plb: snd_soc_pcm_component_free accessing components
[   82.179025] plb: snd_soc_pcm_component_free processing component
[   82.179029] BUG: kernel NULL pointer dereference, address: 
0000000000000064
[   82.179030] #PF: supervisor read access in kernel mode
[   82.179031] #PF: error_code(0x0000) - not-present page
[   82.179032] PGD 0 P4D 0
[   82.179034] Oops: 0000 [#1] SMP NOPTI
[   82.179036] CPU: 3 PID: 768 Comm: pulseaudio Not tainted 
5.4.0-rc5-test+ #31
[   82.179036] Hardware name: Acer Swift SF314-55/MILLER_WL, BIOS V1.05 
10/03/2018
[   82.179042] RIP: 0010:snd_soc_pcm_component_free+0xc7/0x16a 
[snd_soc_core]
[   82.179043] Code: 43 08 48 c7 c6 f0 24 6e c0 4c 39 e0 0f 84 a9 00 00 
00 48 8b 2b 48 85 ed 0f 84 9d 00 00 00 48 c7 c7 00 51 6e c0 e8 d2 5d 5d 
f2 <48> 83 7d 60 00 75 13 48 c7 c6 f0 24 6e c0 48 c7 c7 20 51 6e c0 e8
[   82.179044] RSP: 0018:ffffa70180bf3d78 EFLAGS: 00010246
[   82.179046] RAX: 0000000000000034 RBX: ffffa00f7aaf3968 RCX: 
0000000000000006
[   82.179047] RDX: 0000000000000000 RSI: 0000000000000092 RDI: 
ffffa00fa5ad63d0
[   82.179048] RBP: 0000000000000004 R08: ffffa70180bf3c3d R09: 
0000000000001518
[   82.179049] R10: ffffa70180bf3c38 R11: ffffa70180bf3c3d R12: 
ffffa00fa1be4eb0
[   82.179050] R13: ffffa00fa27aa000 R14: dead000000000122 R15: 
dead000000000100
[   82.179052] FS:  00007f4e7e5ebc80(0000) GS:ffffa00fa5ac0000(0000) 
knlGS:0000000000000000
[   82.179054] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   82.179055] CR2: 0000000000000064 CR3: 0000000253d68005 CR4: 
00000000003606e0
[   82.179056] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[   82.179057] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[   82.179058] Call Trace:
[   82.179064]  snd_pcm_free+0x1a/0x50 [snd_pcm]


I have absolutely no idea what all these data structures are, just 
reporting this.

reverting "ASoC: soc-core: add soc_unbind_dai_link()" is the only 
work-around at this point. i've tested this module load/unload for hours 
without issues.

It's actually quite interesting since this snd_soc_pcm_component_free() 
calls a .pcm_destruct() callback that's not used by the SOF driver. It's 
only used on Intel platforms for the Skylake/SST driver, not sure why 
and if SOF is missing something.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
