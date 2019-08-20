Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D23952F6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 03:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A562166B;
	Tue, 20 Aug 2019 03:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A562166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566263247;
	bh=krzp0pBvllPSQ1nrUFJXQkfqZ6mVcvtoj8ihI6frdec=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmoqeWdRGH15Ao5MCQNEFeU+4k3O0jZtCj++ib4+5NCeftTaSkph3NAYKG+pxGk1M
	 YPtSZ1rO0a1fFygPyVZqzo1EWmWYxuenlBLJCFLI7YZypXK0dQb/zxXP9rdeAgOCFO
	 7zvi65w+VUPHROtyLv2olkeD49pVtHKc1xtyEpOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53298F802BE;
	Tue, 20 Aug 2019 03:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6009FF802BE; Tue, 20 Aug 2019 03:05:41 +0200 (CEST)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F53F802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 02:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F53F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 17:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,406,1559545200"; d="scan'208";a="378381033"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.251.141.90])
 ([10.251.141.90])
 by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2019 17:55:34 -0700
To: Curtis Malainey <cujomalainey@google.com>, Jon Flatley <jflat@chromium.org>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
 <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
 <CACJJ=pwsV2U669QqB0E05XxWppfXR81TrDCkEunfSefJ5Mij7w@mail.gmail.com>
 <CAOReqxg+J=Sa1o+1Cmo7hrh136k2tUFCaqxPgrXE=DKfwsbTfw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e185a97e-1f09-6706-e468-3a5475d5a322@linux.intel.com>
Date: Mon, 19 Aug 2019 19:55:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxg+J=Sa1o+1Cmo7hrh136k2tUFCaqxPgrXE=DKfwsbTfw@mail.gmail.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "benzh@chromium.org" <benzh@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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


>>
> My recommendation would be to look at the machine driver and see if
> its making additional calls to the DSP driver that is not made in
> other machine drivers such as the bdw-rt5677 (Samus.) That might
> indicate an additional code path that might be getting exercised in
> your context that isn't used in samus which is causing your problems.
> If you find something you can always copy it over to samus to see if
> it causes the same breakage. So yes definitely look. Usually the
> suspend/resume paths aren't that long, but I would search the whole
> machine driver for anything that can alter state.

The only significant difference I see in the machine drivers is that the 
clock dividers are smaller in this bdw-rt5660 case, the bitclock is 4.8 
MHz v. 2.4 MHz in the other bdw-rt5677. It's not very clear to me why 
there is a need to have different clock and SSP settings, but since the 
patch that was suggested to be reverted touches the clock generation 
maybe there's a connection?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
