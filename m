Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA224B4FFC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 13:24:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172711689;
	Mon, 14 Feb 2022 13:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172711689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644841482;
	bh=/O1/0Ncq6Khjr222vp/kkSCB9hqv4XlDdDlNAKTnb7w=;
	h=From:Subject:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+0jpEoPH5yXY7hU1LbgEIeJ4JCY5FkQ/Gt7EjeycFibqTCpIJSOjRCfGu51l5e86
	 33/+Ovsxya6Y4yuWlekt9fw411+mjZNdA3MIIAqA/anbqGWB0P3nOfMWz9Gaoet8Al
	 AF1Mt/rgtwxREYCQytJdGSbJLCLtl5sMSYN5Nso4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE52F80430;
	Mon, 14 Feb 2022 13:23:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F074F80310; Mon, 14 Feb 2022 13:23:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09AF8F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09AF8F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="nIcNRzDR"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="psMg/UCq"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id CBFDAA1A3D403
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1644841406; bh=/O1/0Ncq6Khjr222vp/kkSCB9hqv4XlDdDlNAKTnb7w=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=nIcNRzDR4eBo2XHb6vOIFzK4hPAp3a4NRGBQEvjJ3k5cXzeHfgBkqXRqFFfJZ0evl
 c3rjCjiwE2OR8K/AhSJa5eC3l2x5GZHmPmTAQ0y0kR6lCNtObTPH+P1tznNlHWolnI
 YaxQaKnbgAS/lCggULaaF+5Lx38BPutMaITe1T+M=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vh0feuZv2n9M for <alsa-devel@alsa-project.org>;
 Mon, 14 Feb 2022 13:23:21 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 10B1DA1A3D401
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1644841401; bh=/O1/0Ncq6Khjr222vp/kkSCB9hqv4XlDdDlNAKTnb7w=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=psMg/UCqYZ3ryMjGCcJX/Jj0TO7AIkCRhA3qyh0VwMVvcVwidDIo5WSWBd7XTpBdX
 lAZK87uq7ivsHAarFYj3QeoiVWP1kPI3pXuVAuFV0aSx4vrjJqtuCieOcNvI7q9200
 Shmr4Kmk4IOkWGh6KT1cynPcbH6S4VgMf9GkjNOY=
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH] ALSA: pcm: accept the OPEN state for snd_pcm_stop()
To: ALSA development <alsa-devel@alsa-project.org>
References: <20220113113130.1961332-1-perex@perex.cz>
 <s5hmtjz7q16.wl-tiwai@suse.de>
 <40388d17-0c5e-5d10-2f8a-ba75e2b7b9c7@perex.cz>
 <s5hk0f37nrq.wl-tiwai@suse.de>
 <1794d3b3-9838-ae90-bb54-79e2b4d14197@perex.cz>
Message-ID: <d358cda1-d1d6-ac70-7c18-e57cc97b72ed@ivitera.com>
Date: Mon, 14 Feb 2022 13:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1794d3b3-9838-ae90-bb54-79e2b4d14197@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dne 13. 01. 22 v 16:08 Jaroslav Kysela napsal(a):
> On 13. 01. 22 14:45, Takashi Iwai wrote:
> 
>>> Also ideally, there may be a check in hw_params, if parameters
>>> (buffers) are changed, but the implementation is not so easy. Maybe we
>>> can allow OPEN ->
>>> PREPARE transition for this case, so the applications may just restart
>>> the streaming in the most light way.
>>
>> Hmm.  Reading more about those restrictions and requirements, I feel
>> that this might be better implemented in the gadget driver side
>> locally at first.  Basically we can handle similarly: add a new local
>> flag, set it at the stream stop, and return an error at prepare until
>> hw_params gets reconfigured.  This might be even smaller changes?
> 
> Pavel reported that stop to SETUP is not enough for sox, but it's true 
> that the driver may fail in the prepare() callback until the standard 
> stream operation is not recovered. I think that sox is trying to recover 
> and it succeeds - then the I/O timeout occurs.
> 
> Ref: 
> https://lore.kernel.org/alsa-devel/9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com/ 
> 
> 
> The gadget driver (drivers/usb/gadget/function/u_audio.c) has empty 
> prepare callback at the moment.
> 
> Pavel, could you try to add the no-stream flag management to the gadget 
> driver and return an error in the prepare callback in this case?

My apology for the delay. I can make the changes to the gadget to be 
prepared for the alsa change. Let me recap to see if I understand your 
plan correctly:

* Currently the stopped stream is indicated by unsetting prm->active 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/554237f2bb62c4fcf01372e4c63d3e0062f27bac/drivers/usb/gadget/function/u_audio.c#502 
.

* A hw_params_set flag indicating that hw params have been configured 
should be set at 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/554237f2bb62c4fcf01372e4c63d3e0062f27bac/drivers/usb/gadget/function/u_audio.c#423 
. Where should it be unset? At snd_pcm_ops.stop (currently empty), at 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/554237f2bb62c4fcf01372e4c63d3e0062f27bac/drivers/usb/gadget/function/u_audio.c#494 
for active = false, or somewhere else?

* A check should be added to snd_pcm_ops.prepare which fails if the 
hw_params_set flag is unset. What error type should the fail return?

Thanks a lot for help.

Best regards,

Pavel.
