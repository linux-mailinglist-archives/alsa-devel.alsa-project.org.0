Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88C2830B7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 09:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED41E1828;
	Mon,  5 Oct 2020 09:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED41E1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601882081;
	bh=2EX4piA/SgdYtX3F7rH0VHjPRUAhfAqRTNEDOgeubHU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPGbc4sIH7bCthfZ2Have/MVeUrnJ6T11lfRvV76VKFCqJx5TcFuYrQHF8be3plXV
	 4g/rwhGHSv9B9WxyOZ3y8ESDZZm0VxG3xDyP6gmNWpW3QMYrg8faxWVfGp4kpIIx6V
	 sVtl2QbNURbQ4xf05fVBVv8bL3iMr6GXVW8PLLgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2652AF80121;
	Mon,  5 Oct 2020 09:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA0AF8025A; Mon,  5 Oct 2020 09:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C61F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 09:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C61F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Q+deUAm7"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="TDgNMw/8"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 24E03A4BC17A5;
 Mon,  5 Oct 2020 09:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1601881966; bh=2EX4piA/SgdYtX3F7rH0VHjPRUAhfAqRTNEDOgeubHU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Q+deUAm7uVFRFjX2LmGdaf8kQzHgTwym0ohcCaSO+nyxTOgOl/GNKjEmiSO0wW+X1
 lr7IpaXI+VrnyJiQx4joYKs23us0/635VOLD3E9Ud/EoN9MFvgwWrhvXVU7S1SmgPk
 GdR9D22CIiM+jiUD5utxPc1bmHwzA52YriStt0jQ=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLTxUiuWDbKE; Mon,  5 Oct 2020 09:12:46 +0200 (CEST)
Received: from [192.168.100.21] (unknown [192.168.100.21])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id E8CD6A4BC17A0;
 Mon,  5 Oct 2020 09:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1601881965; bh=2EX4piA/SgdYtX3F7rH0VHjPRUAhfAqRTNEDOgeubHU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=TDgNMw/8Ncp+bIhltUAa9gd+W+35sT5m/XJbeR2GROUF6RCAlJ1fy1vjogWTZtPEH
 d9Gbnrf+owhYmMpnaX/LbZrwUJaJX8utz8MoYly7roL37C0bi/DiCCRdKDWulFANLf
 Fwv7wrIY5UculTZ0JUzmTfXJlJoq2UingMi9olSU=
Subject: Re: Loopback device respond to changing parameters on the other end.
To: alsa@scripple.org, alsa-devel@alsa-project.org
References: <44f29dca-c238-d90c-4221-0f5265d61019@schells.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <691bd7f1-cf08-014a-6d8d-da7c50fdab91@ivitera.com>
Date: Mon, 5 Oct 2020 09:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <44f29dca-c238-d90c-4221-0f5265d61019@schells.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: cs-CZ
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



Dne 05. 10. 20 v 4:38 alsa@scripple.org napsal(a):
> Hello,
> 
> Let me open by saying I am not an experienced ALSA developer so 
> hopefully I'm just missing something really easy here.
> 
> I'm trying to use some DSP programs that insert themselves into the 
> audio chain via the ALSA loopback device.  My understanding is that 
> whichever program opens the loopback device first sets the parameters, 
> so the DSP
> program has to know what parameters any playback program is going to use 
> before it opens its end of the loopback device.  And it has to know when 
> to release the loopback device so that another (or the same) playback 
> program can open the loopback device with possibly different parameters. 
>   (The DSP program also needs to the know the audio parameters just to 
> do the right thing of course.)
> 
> I'm not sure how best to accomplish this.  I don't want any form of 
> auto-format conversion such as using a resampling or format conversion 
> plugin.  I want the DSP program to access the raw PCM stream however it 
> was configured by the playback program.
> 
> I was thinking I could use the PCM hook system to accomplish what I 
> want.  Capture the SND_PCM_HOOK_TYPE_CLOSE (and possibly even use the
> hook init) to tell the DSP program to close its end of the loopback 
> device.  Capture the SND_PCM_HOOK_TYPE_HW_PARAMS to configure the DSP
> program with the appropriate parameters and tell it to open the loopback 
> device with those new parameters.
> 

There used to be a notification module parameter (pcm_notify) which 
closed the other loopback side if params changed 
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-March/165454.html

I am afraid it remains to be fixed.

Best regards,

Pavel.
