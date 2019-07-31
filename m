Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEEE7CA51
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 19:31:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01E8716C0;
	Wed, 31 Jul 2019 19:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01E8716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564594264;
	bh=xmPOtiXGuVZzLVRPM+CiUimoEocQXCu53sLmSMhXF1s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IL/Pw4A0cuAcFj/7ERwn3UxfIot61cvuy542pM6ozkKhhIdPLO4p2t9TnVP2TcX1h
	 lnriCj7uvYwx6bMKE9g7nbn6zTHYSve4FmfMVXMe6WNEZLYxcsHG91W4nwMP0XwNVW
	 w1rGw3qNzZ62WJQcb75poy7RLZBA6NcEuRooQ++k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B808EF800C0;
	Wed, 31 Jul 2019 19:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AAC8F80483; Wed, 31 Jul 2019 19:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57062F80133;
 Wed, 31 Jul 2019 19:29:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6B0D5A003F;
 Wed, 31 Jul 2019 19:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6B0D5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564594150; bh=l5i+Ujao0+zuRSet4fUsmJGQSs2O9lGlnhE29oHcKLM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zj1Y+awZy1fQ2lN9UmOlh9erS1G4N6+w1RDVYaONfI0nplhzBTGz3NJfHFQ/PKeng
 sn8m1ZTOWBEtSKZGEiHRX4XMsPW5Cn17EmwJcGSDN21vEEfrOW1u8+CqwIm44FBrHd
 te+kf6otCvMf46Zl0KCbSQgZ8bZQwlMm+vXAcf9M=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 31 Jul 2019 19:29:03 +0200 (CEST)
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1718d316-4c65-a39d-53dd-7f40f0e49e28@perex.cz>
Date: Wed, 31 Jul 2019 19:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 31. 07. 19 v 15:23 Liam Girdwood napsal(a):
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

My strong point is that the driver with the different firmware and the
topology file behaves differently from the user space perspective. It seems
that there is no way to propagate the firmware (and topology?) version to the
user space at the moment.

> Current thinking has changed from shipping FW + tplg via linux-firmware 
> repo to only shipping FW binaries in the FW repo and using alsa-ucm-
> conf.git for UCMs + topologies (since the coupling between UCM and
> topology is tighter than the FW coupling).

This is fine, but I think that we should have a check (compatibility
verification) in the user space level, too. More precisely, each level should
do a verification if it's compatible with the tied level (driver -> firmware
-> topology -> ucm).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
