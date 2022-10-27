Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F960EF8C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 07:38:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A8C245A;
	Thu, 27 Oct 2022 07:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A8C245A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666849119;
	bh=lIpg4avxHN4cTChsxmYDn5HAw3Y4WpZp8vEOiJ0dHco=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvN84JlXCTHRh4qrQ75pktGEn9T6UffMf/XsXHuU9vFhcBgkf2BegBDoo2l3ogXZR
	 SplR5nKuEq3eSo/b6FuzgH/cD7MUcjd6IzLAmEb/iCtqjz40WC42rgurZcSc3SN2c3
	 bqhUes+Jf4kmdq/jpUDIztKZF0rzMQMRIQQAUOG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A84DF80496;
	Thu, 27 Oct 2022 07:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66F9F80100; Thu, 27 Oct 2022 07:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD12F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 07:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD12F80100
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1onvaA-00010u-Qi; Thu, 27 Oct 2022 07:37:34 +0200
Message-ID: <fdca8918-730c-c36d-a3ca-4c95f16d1e8e@leemhuis.info>
Date: Thu, 27 Oct 2022 07:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Regression] Bug 216613 - Sound stopped working with v6.0.3 on
 Lenovo T14 Gen2i: ASoC: error at snd_soc_component_probe
Content-Language: en-US, de-DE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <2c028797-b313-be93-7b1e-8d838e694948@leemhuis.info>
 <f34cafd4-f224-ad10-6962-e8f6c709cb39@leemhuis.info>
 <3f207f82-e177-c833-b2b0-ca9e64a6e9a7@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <3f207f82-e177-c833-b2b0-ca9e64a6e9a7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1666849056;
 c4e95a0a; 
X-HE-SMSGID: 1onvaA-00010u-Qi
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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

[CCing Takashi in case he is interested in this and/or wants to make my
life as regression tracker a little easier in the future]

On 26.10.22 22:41, Pierre-Louis Bossart wrote:
> On 10/26/22 07:08, Thorsten Leemhuis wrote:
>> On 22.10.22 08:35, Thorsten Leemhuis wrote:
>>>
>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>> kernel developer don't keep an eye on it, I decided to forward it by
>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216613 :
>>>
>>>> After upgrade kernel from 6.0.2 to 6.0.3 on Lenovo T14 Gen2i, sound stopped working.
>>>> dmesg:
>>>>
>>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: failed to create hda codec -12
>>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: ASoC: error at snd_soc_component_probe on ehdaudio0D2: -12
>>>> paź 21 21:11:45 kernel: skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate card -12
>>>>
>>
>> #regzbot introduced: 7494e2e6c55ed19
>> #regzbot fixed-by: 02356311982b
> 
> Revert on its way:
> https://lore.kernel.org/r/20221024143931.15722-1-tiwai@suse.de

Thx, in fact it was already merged:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.0.y&id=02356311982bbb117310a27985fa8938e82c0b6e

That "#regzbot fixed-by: 02356311982b" above told my regression tracking
bot about the commit. I sadly had to do that manually, as Takashi used
the non-standard "BugLink" tag to link to the report, which Linus
doesn't want:

https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/

To quote: ```please stop making up random tags that make no sense. Just
use "Link:"```

Maybe regzbot nevertheless should resolve a tracked regression as
resolved, if it sees BugLink to a tracked regression. But I think the
real solution is: checkpatch.pl should complain.

Ciao, Thorsten
