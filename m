Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88939282EE3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 04:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB899183E;
	Mon,  5 Oct 2020 04:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB899183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601865631;
	bh=g3qWI3RVW10wuYJAug7FEaMeA3L8EsDY9LHBbv1Y9UI=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cudGcVNVl0stykfuTQ2VQ5nQt7TMatO5IP8oJQMydXXOxDNhms0Daj2nLOJDBZkbe
	 FGD5/9X+qlVGEhui4qPS7mv45nIEQK0PK6pkxvqR9e46VJCRT5GoBu9Ii4EerWdsfz
	 +eFcKLJ+p8kKkUXXJvqtlSR3gmGcfRi1VNNBl/uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB7F4F80260;
	Mon,  5 Oct 2020 04:38:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFEEF8025A; Mon,  5 Oct 2020 04:38:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from host.schells.com (host.schells.com [162.211.87.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EB63F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 04:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EB63F800C9
Received: from ip72-222-173-254.ph.ph.cox.net ([72.222.173.254]
 helo=benji.seadrac.com) by host.schells.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alsa@scripple.org>) id 1kPGOc-0003w9-NY
 for alsa-devel@alsa-project.org; Sun, 04 Oct 2020 19:38:38 -0700
Received: from [IPv6:::1] (localhost [IPv6:::1])
 by benji.seadrac.com (Postfix) with ESMTP id 95099239FD3
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 19:38:37 -0700 (MST)
From: alsa@scripple.org
Subject: Loopback device respond to changing parameters on the other end.
To: alsa-devel@alsa-project.org
Message-ID: <44f29dca-c238-d90c-4221-0f5265d61019@schells.com>
Date: Sun, 4 Oct 2020 19:38:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: cs@schells.com
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

Hello,

Let me open by saying I am not an experienced ALSA developer so 
hopefully I'm just missing something really easy here.

I'm trying to use some DSP programs that insert themselves into the 
audio chain via the ALSA loopback device.  My understanding is that 
whichever program opens the loopback device first sets the parameters, 
so the DSP
program has to know what parameters any playback program is going to use 
before it opens its end of the loopback device.  And it has to know when 
to release the loopback device so that another (or the same) playback 
program can open the loopback device with possibly different parameters. 
  (The DSP program also needs to the know the audio parameters just to 
do the right thing of course.)

I'm not sure how best to accomplish this.  I don't want any form of 
auto-format conversion such as using a resampling or format conversion 
plugin.  I want the DSP program to access the raw PCM stream however it 
was configured by the playback program.

I was thinking I could use the PCM hook system to accomplish what I 
want.  Capture the SND_PCM_HOOK_TYPE_CLOSE (and possibly even use the
hook init) to tell the DSP program to close its end of the loopback 
device.  Capture the SND_PCM_HOOK_TYPE_HW_PARAMS to configure the DSP
program with the appropriate parameters and tell it to open the loopback 
device with those new parameters.

The init/close part is easy, but I can't figure out how to access the 
hw_params about to take effect from inside the hook function.  If I'm 
understanding the code correctly the hook function is called from 
_snd_pcm_hw_params_internal before the PCM interface is actually setup. 
And snd_pcm_hooks_hw_params chooses not to pass the snd_pcm_hw_params_t 
structure to the hook function itself, only the snd_pcm_t handle.  But 
since the snd_pcm_t hasn't actually been configured I don't see how to 
get the new hw_params from it.  The hook system does set the new 
hw_params on the pcm private_data/generic slave device, but I'm not sure 
how to access that from just libasound2.  (Meaning without the full 
alsa_lib set of includes that define _snd_pcm and such.)

I really hoping one can access snd_pcm_hw_params_t inside the hook 
function.  It seems the information really should be there given the 
callback is triggered by a change to those parameters.

Alternatively, is there a better way to automatically
configure the read end of the loopback device to match the parameters of 
the write end?  (One that doesn't required modifying every playback 
program to announce their intentions to the DSP program.)

Thanks,
scripple
