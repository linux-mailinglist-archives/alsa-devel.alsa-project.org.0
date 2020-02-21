Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B716876E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 20:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583F616D1;
	Fri, 21 Feb 2020 20:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583F616D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582313278;
	bh=vbyeog0wyLT6LYgyN2XZ6RUSz34xo/tO1uekq1eS154=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyZo8AFE9cYYqSzftvOy4o+lBLBDI7Ujnfs+CxI4IrtJtr/9LlUO+v+zkwAGx/Pys
	 SDa/Bb2PklOdVEvXwDyoZDsbnl+32SA8JAExi5SF5E9uUtuoJv9j8HAHebzQwO8ZG5
	 XPuTGsceVSGgYlnttfOsaOEfE00pcTHyNMlarEzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7228BF80240;
	Fri, 21 Feb 2020 20:26:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5B0F8025F; Fri, 21 Feb 2020 20:26:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99CFCF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 20:26:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 73822A003F;
 Fri, 21 Feb 2020 20:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 73822A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582313171; bh=S7v7nGoRV4gEQKHB/18s7GflYzdSqDmoByxwPJHZRTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F71PN91Fdm0WwVp6N8f9tkTSAVCOaEx2akkzyXboriqi45nvBe8ts2gw0yyWKJfcy
 uNYNXnnMd4utW6TGlThSWk5jVtc/lZ18v9GQDtFhQHk4MQrUkjaP2u4jKZzHF35qw1
 BETAVJUXeh/teHszxB7fjo+584xejiyffORcjfCY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 21 Feb 2020 20:26:05 +0100 (CET)
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com
References: <20200221100739.3883842-1-perex@perex.cz>
 <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
 <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
 <1ebd94a8-a461-4b5b-dc30-53f35a7fca47@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <aa6805c3-212b-13ce-3d91-dcd377b4a491@perex.cz>
Date: Fri, 21 Feb 2020 20:26:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1ebd94a8-a461-4b5b-dc30-53f35a7fca47@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 21. 02. 20 v 20:23 Pierre-Louis Bossart napsal(a):
> 
>> Ok, it's really weird that we cannot determine the firmware/driver
>> combination which cause the DSP lock. I would propose to block the older
>> firmware load <1.4 (or 1.4.2 which has the correct firmware version!)
>> then (at least with a big warning or module option which is off by
>> default) for the newer kernels.
> 
> The driver has no information on firmware version until the FW_READY
> IPC, so we can't block the load. And with the firmware handling
> happening in a work queue, blocking will not result in a failed probe.
> IIRC those timing issues are only for the HDaudio link DMA, I don't
> think we had issues with DMIC or SSP.
> A warning urging people to update the firmware is probably easier to
> implement.
> 

It makes sense. At least a hint that something may be wrong. I believe that it 
might help to identify issues.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
