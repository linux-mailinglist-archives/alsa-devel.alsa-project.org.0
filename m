Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1224800D9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 21:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF9716C3;
	Fri,  2 Aug 2019 21:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF9716C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564773954;
	bh=s6fr+o8xdGQ0OoT52Kma16oyShhgD5KgsS/m45Mf2ag=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7H/KJUSAhvNmhF/WE3Ly0Wj8n0aKBXNRmYDVcVBiI36bLWZRqZ1xe+6gR7c6gAsb
	 76MprlK54RcUhi0W2Tns2NmrcNPwP4juAADvu8AlYMgf+ZFr0dDA+Z0ZSy+QnAkOow
	 uJOIx0zJBdHFZ9YocwnMlEfJjTFCoGAyAfSUyn2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75696F8048E;
	Fri,  2 Aug 2019 21:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 412A2F8048F; Fri,  2 Aug 2019 21:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C247F80214;
 Fri,  2 Aug 2019 21:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C247F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 12:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,339,1559545200"; d="scan'208";a="167322449"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2019 12:24:01 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id BDA0058046F;
 Fri,  2 Aug 2019 12:24:00 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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
 <1e7adedf-e12a-d409-12cf-9087cf6dbf30@linux.intel.com>
 <b7fae370-de17-f73c-c2a4-852acf6b31bc@perex.cz>
 <e59de17f39d65f0cef1249517ef1fdd374f399dd.camel@linux.intel.com>
 <3834d741-906e-1a6b-d6cb-cccb29f98fb4@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <52e5c627-44c0-146b-2652-0e2790bac74b@linux.intel.com>
Date: Fri, 2 Aug 2019 14:24:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3834d741-906e-1a6b-d6cb-cccb29f98fb4@perex.cz>
Content-Language: en-US
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org, Daniel Drake <drake@endlessm.com>
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


>> Would we also use semantic versioning to align the UCM with the
>> topology and FW ? Currently we use semantic versioning for topology and
>> FW.
> 
> If we have the versions exported to ther user space, the UCM configuration
> loader / parser can use this information to select or verify the right UCM
> configuration. The semantic versioning in UCM files sounds good to me, too.

My understanding semantic versioning is that it provides means to handle 
minor differences where a new capability is ignored in backwards 
compatible ways. This is what we use for SOF structures between driver 
and firmware, new fields might be added but used or not depending on 
versions.

For UCM, the interaction with other layers is limited to stream numbers 
and control names, so I am not sure what semantic versioning and 
backwards compatibility would mean here? I am all for it, but I don't 
get how it would work.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
