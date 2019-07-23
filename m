Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B371EBA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 20:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB23518B0;
	Tue, 23 Jul 2019 20:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB23518B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563905362;
	bh=FOBsfQIaCgXt3/zyJ42SUKjSQRJQ0SFVgk+cqLjo8ec=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcnpdjPQtwpV6oCynfFKHa0DQYqBP4OGvZksTnSccQSYg9LicNQwnAlGSb87G66bw
	 UYKRGnk0m8/M23/9f8WGWbcg0zGJ0AKN09Z3KvMQHBDmJ75vpzNQM+Af445dQDBP/6
	 bWcrhSgR/KpST28dTN5F4gwJ2+x1DKbq/0PhDXMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D30F80447;
	Tue, 23 Jul 2019 20:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21AB2F80447; Tue, 23 Jul 2019 20:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D60F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 20:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D60F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 11:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="177367397"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2019 11:07:29 -0700
Received: from xiliu-mobl1.amr.corp.intel.com (unknown [10.252.200.163])
 by linux.intel.com (Postfix) with ESMTP id 4AF97580144;
 Tue, 23 Jul 2019 11:07:29 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
 <20190723154449.GJ5365@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
Date: Tue, 23 Jul 2019 13:07:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723154449.GJ5365@sirena.org.uk>
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

On 7/23/19 10:44 AM, Mark Brown wrote:
> On Tue, Jul 23, 2019 at 04:58:47PM +0200, Cezary Rojewski wrote:
>> Skylake driver is divided into two modules:
>> - snd_soc_skl
>> - snd_soc_skl_ipc
> 
> Pierre?

Sorry I was traveling and while I saw this series I never found the time 
to review it.

I have really mixed feelings here and would like to make sure we are all 
aligned on how we deal with the Skylake driver.

On one side I see that Cezary's team has done a genuine effort to 
clean-up the code, show their technical skills, provide and listen to 
review feedback, and improve the quality of upstream code. It wouldn't 
be fair to shoot down well-intended developers who are making an honest 
effort after years of embarrassing contributions. Intel and the Linux 
community also have a shared interest in making sure newer kernel 
versions improve quality and conversely that existing solutions can be 
upgraded to improve security while also improving audio.

On the other hand, I still see an opaque design (no obvious 
core/platform split, mind-boggling use of topology with closed tools, 
IPC that I still don't get), limited information on testing. I don't 
think anyone challenges the fact that this driver is what it is, and not 
the foundation for future upstream work. And there are about 100 
additional clean-up/updates patches to be submitted for this driver, 
which I don't personally have the time to look into since I am already 
fully-booked on SoundWire work.

Overall my recommendations would be to:
- give Cezary's team the benefit of the doubt for their Skylake reworks, 
and add him as mandatory reviewer for the skylake parts. That doesn't 
mean merging blindly but recognizing that no one else at Intel has a 
better understanding of this code.
- add CI support w/ Skylake devices so that we can have a better feel 
for compilation/testing support. we've talked about having upstream 
automatic build/hardware tests, maybe now is the time to do something 
about it.
- draw the line at "no new features" after e.g. 5.5 and "no new 
platforms when SOF provides a solution". SOF was expected to reach 
feature parity by the end of 2019 so it's not a random date I just made up.
- I am even tempted to recommend de-featuring HDaudio codec support in 
the Skylake driver since we already know of a broken probe that was 
found on Linus' laptop and a slew of changes applied to SOF/legacy that 
are missing in this driver.

Comments and feedback welcome.

-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
