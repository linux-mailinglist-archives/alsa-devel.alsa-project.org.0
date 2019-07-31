Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 787797CBB7
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 20:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A0B16AC;
	Wed, 31 Jul 2019 20:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A0B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564597002;
	bh=FNQfQ4eWD+oJJhwyN6IHp055u9fNd87oAG68m5RHoOU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2ik0xYq02zGBEdjnBr6cWIWZ4Lecoh0d8Fn/98b01mGC27Sdss8SK4aPPrlyltZF
	 1KIp+XPgKf5EgPXdXoPrzExSCmGdJEtNni75pN5YkHoRgK3xL1rQMqkZNiSgD0DPfg
	 W6J+2tWw2ecpnKMsWZB4nZQPbyPtR+hCZzTZoJC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 483A5F8048E;
	Wed, 31 Jul 2019 20:14:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BDF7F80483; Wed, 31 Jul 2019 20:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073F2F80133;
 Wed, 31 Jul 2019 20:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073F2F80133
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 11:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,331,1559545200"; d="scan'208";a="256234730"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2019 11:14:49 -0700
Received: from csenarat-mobl2.amr.corp.intel.com (unknown [10.254.66.62])
 by linux.intel.com (Postfix) with ESMTP id F03E95800BD;
 Wed, 31 Jul 2019 11:14:48 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, "Lin, Mengdong" <mengdong.lin@intel.com>
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
 <1718d316-4c65-a39d-53dd-7f40f0e49e28@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1e7adedf-e12a-d409-12cf-9087cf6dbf30@linux.intel.com>
Date: Wed, 31 Jul 2019 13:14:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1718d316-4c65-a39d-53dd-7f40f0e49e28@perex.cz>
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

On 7/31/19 12:29 PM, Jaroslav Kysela wrote:
> Dne 31. 07. 19 v 15:23 Liam Girdwood napsal(a):
>> + Mengdong
>>
>> On Wed, 2019-07-24 at 18:23 +0200, Jaroslav Kysela wrote:
>>>> Yeah, been thinking about this atm. It may be better to package the
>>>> binaries (firmware and topologies) as part of Linux firmware repo
>>>> (since the driver expects to load them all from lib/firmware) and
>>>> package the sources (firmware and topology) via sof tarball ?
>>>
>>> It looks good in my eyes, because topology files are another pieces
>>> of the
>>> driver from the user space perspective. The unanswered question is
>>> the UCM
>>> configuration which is linked to the topology configuration (if I
>>> understand
>>> this correctly). I proposed to place an unique identifier/version to
>>> the
>>> topology file and propagate this identifier to the user space, so the
>>> alsa-lib
>>> can pick the right UCM configuration when topology changes. The
>>> component
>>> string (snd_component_add function / struct snd_ctl_card_info ->
>>> components)
>>> can be used for this identification.
>>
>> Apologizes for the delay, Pierre and I have been discussing this
>> internally as we have to synchronise the deployment of the topologies
>> and UCMs alongside the FW.
> 
> My strong point is that the driver with the different firmware and the
> topology file behaves differently from the user space perspective. It seems
> that there is no way to propagate the firmware (and topology?) version to the
> user space at the moment.

The topology may not be enough, e.g. for all Baytrail devices we use the 
same simple topology. To pick the right UCM file you really need the 
card information which may include the DMI info or some quirks 
(mono-speaker, analog mics). The topology is quite static and doesn't 
expose anything that is board-specific or may vary between skews.

> 
>> Current thinking has changed from shipping FW + tplg via linux-firmware
>> repo to only shipping FW binaries in the FW repo and using alsa-ucm-
>> conf.git for UCMs + topologies (since the coupling between UCM and
>> topology is tighter than the FW coupling).
> 
> This is fine, but I think that we should have a check (compatibility
> verification) in the user space level, too. More precisely, each level should
> do a verification if it's compatible with the tied level (driver -> firmware
> -> topology -> ucm).

The SOF driver checks if its supported ABI level is compatible with 
firmware and topology levels (both files embed the information, which 
doesn't have to be identical).

I don't see how UCM would be checked since there's no direct interaction 
with the driver, e.g. it's used by PulseAudio or CRAS and the only 
interaction is through the control and PCM APIs. Likewise UCM has no 
knowledge about topology or firmware.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
