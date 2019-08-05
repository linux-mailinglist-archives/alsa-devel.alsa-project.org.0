Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC981F39
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 16:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1740167A;
	Mon,  5 Aug 2019 16:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1740167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565015911;
	bh=htf7w5BV+vNolYkAX5sanC1VrddBvSgA5xlNkCDWZHs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCp4tjsGwO6BpPNxUnGq4kirc2eo2L2Pf7xjL/Kess/8H+NVhYWyp07Ko8BOQ8wPi
	 GXCoNDZE+PnJk9BkUqWO1/vRrkj86hr7eJ8DPoXn/0x+bzVK+kPH+TJbl55DFlsD7N
	 KNtJhzM5V8sOraMr1y7wupcZYp/AkiC2FauGbejw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D63F80533;
	Mon,  5 Aug 2019 16:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F4DF80533; Mon,  5 Aug 2019 16:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034E1F800F3;
 Mon,  5 Aug 2019 16:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034E1F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 07:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="325340654"
Received: from moleksy-mobl2.ger.corp.intel.com ([10.252.24.122])
 by orsmga004.jf.intel.com with ESMTP; 05 Aug 2019 07:36:34 -0700
Message-ID: <3aee07466dcb990ce27551224a4548a8ef37e2bb.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Date: Mon, 05 Aug 2019 15:36:35 +0100
In-Reply-To: <3834d741-906e-1a6b-d6cb-cccb29f98fb4@perex.cz>
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
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Daniel Drake <drake@endlessm.com>, sound-open-firmware@alsa-project.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2019-08-02 at 21:01 +0200, Jaroslav Kysela wrote:
> > How would we get topology or FW version from the above
> > identification ?
> 
> It was just an example. We can compose the UCM filename from any
> other
> additional information passed from the kernel. Example component
> strings for
> USB and legacy HDA:
> 
> 
>   Mixer name    : 'USB Mixer'
>   Components    : 'USB0bda:58fe'
> 
>   Mixer name    : 'Realtek ALC298'
>   Components    : 'HDA:10ec0298,17aa222e,00100103'
> 
> So we should consider what to export for SOF. Perhaps string like:
> 
>   'SOFP01234567:45670123,1:1:0-6cc8d,???TPLGVER???,3:7:0'
>   'SOFP{PCIID}:{PCISUBSYS},FW-VER,TPLG-VER,TPLG-ABI-VER'
> 
> It's just a proposal for the discussion.

Ok, we will probably need TPLG-NAME in here so that we load the correct
UCM based on TPLG NAME + HW.
> 
> By the way:
> 
>   
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/149409.html
> 
> The component string extensions should be also considered for other
> Intel SOC
> drivers. It seems that the long_name is misused as the UCM
> configuration
> selector for other drivers like bytcr_rt5651.c etc. The long_name for
> the
> soundcard like 'bytcht-es8316-mono-spk-in2-mic' is not really fancy.
> This
> string is used in GUI.

Sorry, do you mean it would be better to include some more encoding
into the name to make them more unique and so that UI tools and users
can better understand the UCM file features without reading the UCM
file source ?

Thanks

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
