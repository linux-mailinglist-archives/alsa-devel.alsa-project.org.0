Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6A734ED
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 19:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D761A96;
	Wed, 24 Jul 2019 19:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D761A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563988613;
	bh=lNofadBNe/XVlwbAOFZTN7jpXcovEFWWd8MY9/xd9n8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peo92ob8OlkWlickTcd/RadSdaivQv3r9C182N7j8hioKmxVrPWRblfXLVwkVEcQD
	 WYj8lttey6o/tzgvl7Eh5w9bGZ1RAAv4QzcfbSrQeE3pilCabkoVAQLn7OhASu41fU
	 5lmHf3Mu/dd1Q9L4glBEHsA+ptd2CZ8SELDzjmLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E551F803D5;
	Wed, 24 Jul 2019 19:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B571F803D1; Wed, 24 Jul 2019 19:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06488F8026F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 19:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06488F8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 10:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,303,1559545200"; d="scan'208";a="160633538"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2019 10:14:54 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
 <20190723154449.GJ5365@sirena.org.uk>
 <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <81f9a74b-0848-8a45-a4d1-8ac44d11e0ad@intel.com>
Date: Wed, 24 Jul 2019 19:14:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
 fundaments overhaul
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

On 2019-07-23 20:07, Pierre-Louis Bossart wrote:
> On 7/23/19 10:44 AM, Mark Brown wrote:
>> On Tue, Jul 23, 2019 at 04:58:47PM +0200, Cezary Rojewski wrote:
>>> Skylake driver is divided into two modules:
>>> - snd_soc_skl
>>> - snd_soc_skl_ipc
>>
>> Pierre?
> 
> Sorry I was traveling and while I saw this series I never found the time 
> to review it.
> 
> I have really mixed feelings here and would like to make sure we are all 
> aligned on how we deal with the Skylake driver.
> 
> On one side I see that Cezary's team has done a genuine effort to 
> clean-up the code, show their technical skills, provide and listen to 
> review feedback, and improve the quality of upstream code. It wouldn't 
> be fair to shoot down well-intended developers who are making an honest 
> effort after years of embarrassing contributions. Intel and the Linux 
> community also have a shared interest in making sure newer kernel 
> versions improve quality and conversely that existing solutions can be 
> upgraded to improve security while also improving audio.

Thank you for the kind words.
This is not a charity, though. It's not just "Cezary's team". Throughout 
the healing process several teams have been engaged: SW Linux, SW 
Windows, FW, FDK, intel-next, system integration and even our clients. 
This is not to be treated as "wanna be". Skylake in current form is a 
disgrace to Intel's reputation. This mistake should be corrected, though 
we cannot do so without maintainers acceptance.

> On the other hand, I still see an opaque design (no obvious 
> core/platform split, mind-boggling use of topology with closed tools, 
> IPC that I still don't get), limited information on testing. I don't 
> think anyone challenges the fact that this driver is what it is, and not 
> the foundation for future upstream work. And there are about 100 
> additional clean-up/updates patches to be submitted for this driver, 
> which I don't personally have the time to look into since I am already 
> fully-booked on SoundWire work.
It's good that we agree on topology subject. It's questionable at best, 
scales poorly with newer FW releases. Quality of previous closed tools 
was on par with /skylake. Meaning there was none. These have been 
rewritten entirely, and yes it's still close source for now as without 
management agreement, my hands are tied from sharing them.

Design pattern differs from SOF one, it can be confusing if you always 
look at it from SOF perspective. There are no obvious splits - audio hw 
didn't really change that much and thus division is mainly motivated by 
DSP firmware capabilities.
Available are following buckets:
- SKL/ KBL/ KBL-R/ ABL (cAVS 1.5)
-> skl
- APL/ GLK (cAVS 1.5+)
-> skl -> bxt
- CNL/ CFL/ WHL/ CML (cAVS 1.8)
-> skl -> bxt -> cnl
- ICL/ LKF (cAVS 2.0)
- TGL/ EHL (cAVS 2.5)
-> skl -> bxt -> cnl -> icl
- more..

Each "-> xxx" denotes the xxx-sst and inheritance chain. "icl" segment 
not present on upstream. For most functionalities, DSP firmware inherits 
previous implementations in consequence making older xxx-ssts on 
software side valid too, even for topmost platforms. Reduces development 
burden, greatly.

Until core skylake is overhauled, I don't see the point of me stating: 
"tested on all buckets" - even though I do have these assembled. Will 
people believe me? Pretty sure each /skylake update in the past was 
prefixed with "tested on (...)" - and where did it lead us? Again, I 
prefer to do the ground work first, and yes we can help with CIs as we 
do have platforms connected to ours internally.

100 patches is probably an underestimation : )

> Overall my recommendations would be to:
> - give Cezary's team the benefit of the doubt for their Skylake reworks, 
> and add him as mandatory reviewer for the skylake parts. That doesn't 
> mean merging blindly but recognizing that no one else at Intel has a 
> better understanding of this code.

While not being bad myself, got the pleasure of working with best DSP 
guys in business at IGK, people I call friends. Due to the scale of a 
problem, before acting, one had to understand the history behind this. 
That took a lot of time - you can trust me on this : ). So many strings 
were pulled, so many people showed professionalism and helped us out. 
What I'm saying is despite the division which this disgrace of a 
"driver" caused, past months showed that when necessary we can unite and 
stand as One.

> - add CI support w/ Skylake devices so that we can have a better feel 
> for compilation/testing support. we've talked about having upstream 
> automatic build/hardware tests, maybe now is the time to do something 
> about it.
> - draw the line at "no new features" after e.g. 5.5 and "no new 
> platforms when SOF provides a solution". SOF was expected to reach 
> feature parity by the end of 2019 so it's not a random date I just made up.
> - I am even tempted to recommend de-featuring HDaudio codec support in 
> the Skylake driver since we already know of a broken probe that was 
> found on Linus' laptop and a slew of changes applied to SOF/legacy that 
> are missing in this driver.
> 
> Comments and feedback welcome.
> 
> -Pierre

While I can agree on the "no new features" line, the date is a loose 
subject. Honestly, I could've probably called first ~70-80 patches: "a 
fix". Validation team managed to mark half scenarios a failure 
immediately. Then developers were set loose. With enough motivation, we 
have managed to crash even the most simple scenarios. I do not call a 
folder with bunch of code not following any specification, design 
patter, lacking verification and testing and confirmed to be harmful a 
"driver". And thus, "new features" gets entirely different meaning when 
applied to /skylake.

Does not take a rocket scientist to realize the scale of a problem after 
reading commit msgs of recent series (and ones already applied). In the 
end, everything culminates with the broken architecture, which by now 
most should be aware of - based on DAPM and separated from standard PCM 
path. DAPM is a happy path, while IPCs can and do fail. Moreover, there 
are hw registers to be polled. TLDR: PCM code always assumes a success 
(it has to, after all DAPM path does not return err codes) what leads to 
undefined behavior in case of any failure of in preceding DAPM path. 
This is also why debugging /skylake is so complicated - people send us 
logs thinking: "this is the place!" when in fact the actual failure 
occurred much much earlier.

So, I leave you gentlemen with a decision to make: either there is an 
agreement and willingness to correct existing "driver", which requires a 
lot of effort (i.e.: patches) -or- it's left alone as is, dysfunctional.

And last, Pierre, I have a mixed feelings too - would like to enter 
Linux Kernel development in different circumstances. Some of us - 
including me - where even part of SOF early last year, but I believe 
there was real reason for pulling them out - /skylake has clients, it 
works there only because of heap of patches applied on top of it. 
Question is: should upstream be ignored?

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
