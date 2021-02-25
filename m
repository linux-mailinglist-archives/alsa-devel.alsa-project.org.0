Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F9324C1D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 09:37:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E9A1657;
	Thu, 25 Feb 2021 09:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E9A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614242265;
	bh=KFX1lROls4zs1IDaiC4/YNBzwshWmXIgig1zcmTAqYs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aG2ol+51CVkoJz/psOIyxCHJpmjApYSHvvAvzXSDdikhl4htchf6S/qc/uJ59jINV
	 vLqxTJQI31WzaS8rp2EtIJ/qWyvhcanMLFmlofnb2alDc8NX9tkO3faMo/A3y9rs5b
	 NkMuEDaiwFMX8yVfcpIzkfpD9bK9xXaBOT5s0jt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 396F2F8016D;
	Thu, 25 Feb 2021 09:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EC3FF8016A; Thu, 25 Feb 2021 09:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C762F800E4
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 09:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C762F800E4
Received: from [123.112.65.122] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lFC7w-0004Cm-QW; Thu, 25 Feb 2021 08:36:05 +0000
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210223122205.233701-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
 <ccc1fd32-5838-a2ca-39aa-75ef2d7e3b16@perex.cz>
 <s5hsg5mu4ko.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2102231918010.864696@eliteleevi.tm.intel.com>
 <cb3fe45f-97d0-3d9e-0f20-bfe78a612c5a@canonical.com>
 <alpine.DEB.2.22.394.2102241153320.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <493fabbb-70df-5246-9150-cea7775ae864@canonical.com>
Date: Thu, 25 Feb 2021 16:35:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102241153320.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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


On 2/24/21 6:17 PM, Kai Vehmanen wrote:
> Hey,
>
> On Wed, 24 Feb 2021, Hui Wang wrote:
>
>> On 2/24/21 1:51 AM, Kai Vehmanen wrote:
>>> interface all pins are exposed. Each pin does provide functionality to
>>> query whether a display is connected to it, and whether the connected
>>> display has audio capability.
>>>
>>> The maximum number of concurrent displays is described as converters.
>>> On TGL this is 4.
>> If a physical port supports DP-MST, does the 3 connections on this physical
>> port share a single converter? And each connection has an independent pcm,
>> maybe the driver should create pcm pool according to num_converter * 3.
> DP-MST is is reported per-pin, so basicly the interface can report display
> connection status for "numpins*3" endpoints so that would be 9*3 on
> Intel TGL systems.
>
> However, this doesn't affect the converters. There is still four
> converters, so 4 PCMs are enough to cover all possible combination of
> plain DP/HDMI and DP-MST. User-space can query the ELD information to
> learn the mapping from a PCM to a specific display (like e.g. Pulseaudio
> does).
>
> I sent a patch "ALSA: hda/proc - print DP-MST connections" to visualize
> these a bit better in procfs output. I put example output in the commit:
> https://lore.kernel.org/r/20201208185736.2877541-1-kai.vehmanen@linux.intel.com

Indeed, today I found a thunderbolt dock station which plays DP-MST hub 
and I connected 2 monitors on it, they are 2 sub-devices belong to a 
physical pin, and they are assigned different converters. And the procfs 
output is very clear to show it.

Thanks,

Hui.

>
> The existing driver provides a PCM for each pin, plus reserve two extra
> PCMs for DP-MST. There's merit to this design as well, but arguably
> the SOF approach is easier to understand on systems like TGL and ICL.
>
> Br, Kai
