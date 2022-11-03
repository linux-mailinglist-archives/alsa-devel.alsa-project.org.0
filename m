Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A20618055
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 16:01:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847E7163F;
	Thu,  3 Nov 2022 16:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847E7163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667487678;
	bh=EtzumMG2w2djCrYXZlGM5awMP+oQZFwAVHccn1008I4=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCLylQiiTbhStaM0xUfv5TSYTIm30HOpaDcBtjyqwJ6zt+KnZP4nrNfsQgzsDFFjf
	 cu9QZ/MZxsO4pla7mD9McdfaSCGBtvheiLSbqDeGGTdNd/Hmixm2sxXS20PavkEAPi
	 5haGuZ+hjTlG0o4iVHd0KzIoSQ0VlQckFJrXkdxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F11F80155;
	Thu,  3 Nov 2022 16:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D09DF8051E; Thu,  3 Nov 2022 16:00:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A870F801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 16:00:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A870F801D5
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oqbhY-0005Y3-F7; Thu, 03 Nov 2022 16:00:16 +0100
Message-ID: <63521d44-bba4-5795-fd44-fb55b9ced99f@leemhuis.info>
Date: Thu, 3 Nov 2022 16:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>, Jason Montleon <jmontleo@redhat.com>
References: <87v8nwmgso.wl-tiwai@suse.de>
 <20221103131144.2942-1-jmontleo@redhat.com> <87k04cmavy.wl-tiwai@suse.de>
 <87iljwmarm.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH v2 1/2] ASoC: rt5514: fix legacy dai naming
In-Reply-To: <87iljwmarm.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1667487620;
 e7311772; 
X-HE-SMSGID: 1oqbhY-0005Y3-F7
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev, tiwai@suse.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org
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

On 03.11.22 14:24, Takashi Iwai wrote:

> - Link (or BugLink tag) to pointing to the kernel bugzilla URL

No, not BugLink. To quote Linus from here:
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/

```
> BugLink: https://lore.kernel.org/r/20220610205038.GA3050413@paulmck-ThinkPad-P17-Gen-1
> BugLink: https://lore.kernel.org/r/CAMdYzYpF4FNTBPZsEFeWRuEwSies36QM_As8osPWZSr2q-viEA@mail.gmail.com

[...]

please stop making up random tags that make no sense.

Just use "Link:"
```

Ciao, Thorsten
