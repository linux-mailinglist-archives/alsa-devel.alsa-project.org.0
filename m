Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B57C44E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 16:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E966A16EC;
	Wed, 31 Jul 2019 16:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E966A16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564581777;
	bh=5sCDnKZoFHa6LOk+RxIVIavLB+KLBaFJaLBPxTOUTD0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dna/h7ntccX9jfFytAiCrS+wfh7Fx69BmHR/S4YfRdP+AH45cxees7YF7/t8ExHhz
	 WKSB8LSFsqeC05uG+4wqxSaFADMuVIVEHmsxJwFZYaTuJXAT4ehxfY9oTwtUeEDu1h
	 9jiP7yoiJn2vgm/UlHMnq9CzXdv46uH1xdULIh9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6F4F8048F;
	Wed, 31 Jul 2019 16:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90C81F80440; Wed, 31 Jul 2019 16:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 301CDF80133;
 Wed, 31 Jul 2019 16:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 301CDF80133
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 07:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="372110730"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2019 07:01:02 -0700
Received: from csenarat-mobl2.amr.corp.intel.com
 (csenarat-mobl2.amr.corp.intel.com [10.254.66.62])
 by linux.intel.com (Postfix) with ESMTP id B99905800BD;
 Wed, 31 Jul 2019 07:01:01 -0700 (PDT)
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Daniel Drake <drake@endlessm.com>,
 "Lin, Mengdong" <mengdong.lin@intel.com>
References: <CAD8Lp45Bp1xVC7NjuNaANA7kAEN2Edshw+cViaTF3tRZEumgZA@mail.gmail.com>
 <cc9fa5b52138daffb09dc5b66ea9248379c9f60e.camel@linux.intel.com>
 <CAD8Lp46GW8n8K7ttOeSje_au06BsyvCp4seVwj2wNbipei5ssA@mail.gmail.com>
 <a4b17a75-d4e0-fc6b-a286-aa6b7b281b7d@linux.intel.com>
 <CAD8Lp444soO1i8mWF73eucT16yAhy2js1byWJCTV5fn=TikHBg@mail.gmail.com>
 <9e8b667f1aa2333dbcc34b5253372d1a8667551e.camel@linux.intel.com>
 <ee34f820-0753-dfbe-09c0-7147cf229cc0@perex.cz>
 <6493f195-eb5a-1a6d-2c31-e3a4123b2ad1@linux.intel.com>
 <7c940d90-297e-19c0-2f74-1843439d5ccf@perex.cz>
 <d41b02286db2a827648d1c1ec793bbd0a55e99c1.camel@linux.intel.com>
 <8dceb60b-35a5-93e9-ce01-1eb852e93f44@perex.cz>
 <0059ed8e8f2fbd7ffbc258ca53ce5efbf1885c5b.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3f6f48ac-6eac-ba98-91ac-62c19578b1fb@linux.intel.com>
Date: Wed, 31 Jul 2019 09:01:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0059ed8e8f2fbd7ffbc258ca53ce5efbf1885c5b.camel@linux.intel.com>
Content-Language: en-US
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] [Sound-open-firmware] Signed firmware availability
 for kbl/cnl
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

On 7/31/19 8:23 AM, Liam Girdwood wrote:
> + Mengdong
> 
> On Wed, 2019-07-24 at 18:23 +0200, Jaroslav Kysela wrote:
>>> Yeah, been thinking about this atm. It may be better to package the
>>> binaries (firmware and topologies) as part of Linux firmware repo
>>> (since the driver expects to load them all from lib/firmware) and
>>> package the sources (firmware and topology) via sof tarball ?
>>
>> It looks good in my eyes, because topology files are another pieces
>> of the
>> driver from the user space perspective. The unanswered question is
>> the UCM
>> configuration which is linked to the topology configuration (if I
>> understand
>> this correctly). I proposed to place an unique identifier/version to
>> the
>> topology file and propagate this identifier to the user space, so the
>> alsa-lib
>> can pick the right UCM configuration when topology changes. The
>> component
>> string (snd_component_add function / struct snd_ctl_card_info ->
>> components)
>> can be used for this identification.
> 
> Apologizes for the delay, Pierre and I have been discussing this
> internally as we have to synchronise the deployment of the topologies
> and UCMs alongside the FW.
> 
> Current thinking has changed from shipping FW + tplg via linux-firmware
> repo to only shipping FW binaries in the FW repo and using alsa-ucm-
> conf.git for UCMs + topologies (since the coupling between UCM and
> topology is tighter than the FW coupling).

more precisely, the topology file exposes stream numbers and control 
names, and if the UCM file is not aligned with topology changes then 
users will get errors thrown at them. It really makes sense to release 
topology and UCM files concurrently. We'll also need to work with 
distributions to make sure the files are updated in the right places. 
Currently topology files are in /lib/firmware/intel/sof-tplg and UCM in 
/usr/share/alsa/ucm.

> 
> Any objections to using this repo for topologies too ? I know we
> haven't yet used it for UCMs but now is probably a good point to move
> (including moving the older UCMs over too).

We'll need to figure out the license for all this, the topologies  and 
UCM files created for SOF are all BSD 3-clause but I am not clear on 
older UCM files stored in alsa-lib, I don't think there was any 
agreement that the LGPL license applied to them.

> The "make" rule would compile topologies, whilst the "make install"
> rule would install the UCM's and binary topologies in the correct
> places ?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
