Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF93235A4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 03:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F890167C;
	Wed, 24 Feb 2021 03:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F890167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614133480;
	bh=jzxPu+ul7ugk6xJeYxdIolNC8f0mg+WZso6Bgz7icPI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GLHwz8kqW5F5Id6Q5OI2gPric/pJjiied0XO6FJRha7Na3pI1Dov4fpbtwC5EfIq3
	 VjYbMYFCBE+1yrmlmgGOaHdJ+xM51w0caHueRXI0wG/6p0Kz6wMMKpV4MqKuR5sK8h
	 qj1zauF2bGL5tYm1xa9Tt8gi/CrUTjzqEKKHIlC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1472BF80167;
	Wed, 24 Feb 2021 03:23:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F18AFF8016A; Wed, 24 Feb 2021 03:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C367F80167
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 03:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C367F80167
Received: from [123.112.65.229] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lEjpF-0002iB-Q2; Wed, 24 Feb 2021 02:22:54 +0000
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20210223122205.233701-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
 <ccc1fd32-5838-a2ca-39aa-75ef2d7e3b16@perex.cz>
 <s5hsg5mu4ko.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2102231918010.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <cb3fe45f-97d0-3d9e-0f20-bfe78a612c5a@canonical.com>
Date: Wed, 24 Feb 2021 10:22:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102231918010.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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


On 2/24/21 1:51 AM, Kai Vehmanen wrote:
> Hi,
>
> On Tue, 23 Feb 2021, Takashi Iwai wrote:
>
>> On Tue, 23 Feb 2021 17:25:23 +0100, Jaroslav Kysela wrote:
>>> A dumb question: Does TGL really support up to 11 separate displays or it's
>>> just to handle 11 connections and the number of maximal simultanenous
>>> connected displays is lower? In the later case, the dynamic allocation makes
>> That's the latter.  And, the fixed assignment was merely for
>> compatibility with legacy usage, and supposed to be 3 fixed ones or
>> so.  Extending to that high number wasn't intended when the mechanism
>> was introduced.  We should have noticed it at ICL support (which has
>> up to 6 devices).
> yes, exactly. The pins relate to physical ports. There are more pins now
> to cater for various DP-over-USB-C topologies (versus just native HDMI and
> DP ports). Most product have less physical ports connected, but on the HDA
> interface all pins are exposed. Each pin does provide functionality to
> query whether a display is connected to it, and whether the connected
> display has audio capability.
>
> The maximum number of concurrent displays is described as converters.
> On TGL this is 4.
If a physical port supports DP-MST, does the 3 connections on this 
physical port share a single converter? And each connection has an 
independent pcm,  maybe the driver should create pcm pool according to 
num_converter * 3.
>
> With SOF, we didn't have legacy userspace, so the HDMI/DP PCMs are already
> exposed differently and only a small number (3 or 4) of PCMs are created
> depending on hardware generation. Now the question is how we move
> snd-hda-intel to similar model with minimal distraction to existing
> user-space.

Let's do some change on TGL first, let us see if it will break some 
user-space apps, then we could evaluate how to handle it.

Thanks,

Hui.

> Br, Kai
