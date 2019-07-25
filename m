Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A4374FC2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 854A41DFE;
	Thu, 25 Jul 2019 15:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 854A41DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564062034;
	bh=YO85hIEX3v2JMM5bEP+bOFEMySsaJr+68OuReTgcMWY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Op3koGGnMXLLlHMV6rFT0iWagHgclqtV+rzzJfIDvLQ4PyokEVM8vY8c9THAswhvU
	 UuRAbWk/YO9axkI11YSMQAMHZqS3qTa4a3x3Vg85Y9LGj97VKWYbGCPPoL+soq9Aq8
	 bpDcCCr8qbNNILI/adO9X+M71RmtfOiw0X546XRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD149F8044B;
	Thu, 25 Jul 2019 15:39:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 674DBF80448; Thu, 25 Jul 2019 15:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 087D7F800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:39:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AC4FDA0040;
 Thu, 25 Jul 2019 15:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AC4FDA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564061943; bh=aIo+H9ZEo/KT2nBmp3UcUYVGpxtA1yhraYZ0gZrTfPo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xq7jqGfqlW9N1BqrZ6LSYwkJYzhE1YTXWDXL78MmhbSWi5cHHpJ44TqWzV3bdj7lK
 soV5u0hS3bwtxn0m7lxIv8gHvb97CrqarlmHo1z5vFMbYCeBPZfaSkN72jfpxflCfJ
 VKKryKmOqb3qKoGpgPOxC9dsuab1Eoaw2DPOfej0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 25 Jul 2019 15:38:58 +0200 (CEST)
To: Mark Brown <broonie@kernel.org>
References: <20190725110808.19938-1-perex@perex.cz>
 <20190725131908.GE4213@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <29ebff2c-a47a-d0a9-acf5-ee637df26400@perex.cz>
Date: Thu, 25 Jul 2019 15:38:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725131908.GE4213@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Makefile - fix the top-level
 kernel module names (add snd- prefix)
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

Dne 25. 07. 19 v 15:19 Mark Brown napsal(a):
> On Thu, Jul 25, 2019 at 01:08:08PM +0200, Jaroslav Kysela wrote:
>> Use the proper module name. The objs assignments are already there.
> 
> This breaks the build for me:
> 
>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
> make[3]: *** No rule to make target 'sound/soc/sof/snd-sof-acpi-dev.o', needed by 'sound/soc/sof/built-in.a'.  Stop.
> 

Oops. I sent the v2 of the patch.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
