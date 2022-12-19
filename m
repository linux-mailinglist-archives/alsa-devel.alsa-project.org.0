Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0565096B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 10:42:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BB262BC7;
	Mon, 19 Dec 2022 10:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BB262BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671442967;
	bh=+wQWfOxKiIAGEQHOA5KQ2bJp+NVkB6j058dJn539MEU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zw42YmbN/lHCVUnwJWE9jO8yXgXRRHHSG2jtU4laJPY5gaa1RR8ahVU85fIvoBCwz
	 LJS60HzVZu38aeTOsbc/XUwOBxC7MPUeThoHlM2Jo6be6yZ23U8pqoo1cNgDUw/3St
	 1tL6MHucQTTcL2ZNDOkHqNpRqJztFrhQ86z1d2s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1083AF801C0;
	Mon, 19 Dec 2022 10:41:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9B96F80423; Mon, 19 Dec 2022 10:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D0AF8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 10:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D0AF8025E
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p7CeT-0001HF-Qv; Mon, 19 Dec 2022 10:41:41 +0100
Message-ID: <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
Date: Mon, 19 Dec 2022 10:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671442906;
 63d41143; 
X-HE-SMSGID: 1p7CeT-0001HF-Qv
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, tiwai@suse.de,
 yung-chuan.liao@linux.intel.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 ranjani.sridharan@linux.intel.com, Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, this is your Linux kernel regression tracker.

On 14.12.22 14:32, Mark Brown wrote:
> On Fri, 09 Dec 2022 13:45:27 +0200, Kai Vehmanen wrote:
>> This patchset is an alternative solution to problems
>> reported by Ricardo Ribalda <ribalda@chromium.org> and
>> Zhen Ni <nizhen@uniontech.com>, as discussed in
>>
>> - "[PATCH] ALSA: core: Fix deadlock when shutdown a frozen userspace"
>>  https://mailman.alsa-project.org/pipermail/alsa-devel/2022-November/209248.html
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/2] ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
>       commit: 2aa2a5ead0ee0a358bf80a2984a641d1bf2adc2a
> [2/2] ASoC: SOF: Revert: "core: unregister clients and machine drivers in .shutdown"
>       commit: 44fda61d2bcfb74a942df93959e083a4e8eff75f
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> [...]

I noticed a regression report in bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=216820

```
> My laptop started to hang on hibernation (sleep and shutdown are
> fine). I bisected it to commit 83bfc7e793b555291785136c3ae86abcdc046887,
> which appears to be related to ALSA.
```

That's a commit the second patch from this series reverts. To my
untrained eyes it thus looks a lot like these change will resolve the
reported issue, which made me wonder:

* these patches afaics are not yet in mainline, is the plan to still
send it this cycle?

* there are no "CC: <stable..." tags in these patches. Is the plan to
manually ask for a backport? Or how can we get the regression fixed in
older releases?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
