Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BE2CF53
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 21:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD17E1685;
	Tue, 28 May 2019 21:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD17E1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559071042;
	bh=y3GbITWDa3JlUdk5B+umb4D8Bo6CFYSkYfPEx4e8YkI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGjVOXZTobajfgffb10wqYqLCHPI5Yui0ZnaYkD+B43WivkVfrADUNdDSQoAOapuh
	 KydgQYk37117tVh8j2l2HWV5jM6v5GFAt7l95d7ooFzOnztOA+XW0w3WCuj7ICq0lr
	 jQ2MQdVvBIsO47P/vgAJ4cV8xhuFQqI8DDm7QuE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20366F89706;
	Tue, 28 May 2019 21:15:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37B44F8072E; Tue, 28 May 2019 21:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0A7EF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 21:15:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A7550A003F;
 Tue, 28 May 2019 21:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A7550A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1559070931; bh=FCFFlQ6OS8XT19cO8Mrmn3PZ3gN/MhCZpl/3m4yuybU=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=ROJ01sAoahomPnIZAAA5k/zcXQn/x1HAglsBQ44pMuYzbzpF+paLSuwvR/Z3a/cFP
 VcsS21Jki2X6IhBowV34FIQNHfHC/Dd+jKW4dKbVOqzjJ2cdRb8DHQg5XjgmfV5PWj
 JBvMSUgJMmN/XpjtLLKX7VH9NO5ANWXJ1tBbUdqc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 28 May 2019 21:15:28 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
 <9d5ef75c-9b28-3998-865d-a958b7aaaa75@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b11570d9-6b46-e162-eb91-22e81bfa17bd@perex.cz>
Date: Tue, 28 May 2019 21:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9d5ef75c-9b28-3998-865d-a958b7aaaa75@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: [alsa-devel] SOF firmware/ucm/topology packaging (was: CA0132
	firmware)
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

I believe that we need to discuss this more.

Dne 28. 05. 19 v 18:59 Pierre-Louis Bossart napsal(a):
> 
> 
> On 5/28/19 11:38 AM, Jaroslav Kysela wrote:
>
>> The same situation is for the SoC SOF firmware files (drivers are
>> in kernel, firmware files are missing). Perhaps, we can release those files
>> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
> 
> for SOF there are 4 cases
> 
> 1. developers/integrators build from scratch themselves from the public 
> tree.
> 2. integrators build from scratch with their own secret sauce added.
> 3. distros want a binary since they don't want to build from source 
> and/or don't have access to all the DSP tools
> 4. distros needs a binary signed with the Intel production key (e.g. to 
> run on devices initially designed for Windows).

Do you mean that the firmware should be signed because the hardware is doing a
check, if the hardware vendor enables it and rejects the unsigned binaries?

> So far we were mostly dealing with case 1. Case 2 is allowed by the SOF 
> permissive license and there's no need to look into this. We are 
> planning releases for the last two cases, with a cadence aligned with 
> kernel updates. It's not fully clear to me if the linux-firmware tree is 
> the 'right' solution since ideally we'd want to have firmware, topology 
> and UCM files released at the same time.

Do you plan to create a new package for this? I can eventually offer the space
/ docker build system on the ALSA server, if you like. The github releases
work fine, too. The question is, if it's the right way. It seems that the
firmware/topology files are read-only chunks used by the driver (standard
usage) and the UCM config is for alsa-lib (the user space). It might make
probably sense to add compatibility IDs to link/check the correct parts
together at runtime and keep the standard (binary) code distribution for the
most of users (linux-firmware / alsa-lib).

Speaking for distributions, we need to correctly identify the driver which
will load the proper firmware files. From notes posted to the alsa-devel ML,
it seems that there are three drivers for similar hardware (sound bridges) now
and it is not easy to identify the proper driver, because the similar PCI ID
is registered in all of them:

1) legacy HDA
2) sound/soc/intel
3) sound/soc/sof/intel

Do not forget that the distributions include all driver modules in their
universal kernels. It seems like a problem for the Intel hardware at the
moment. Perhaps, you may give us some recommendations / hints.

Totaly another topic is the on-demand installation of firmware files (and
eventually ALSA configuration files). The linux-firmware package has over
180MB now and it's growing. It makes sense to install only useable firmware
files - ommit the files for hardware / drivers which are not detected and
used. It's probably a topic for linux-firmware rather then the ALSA project.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
