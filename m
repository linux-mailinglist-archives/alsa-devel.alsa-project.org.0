Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E12C027B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD9A169C;
	Mon, 23 Nov 2020 10:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD9A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606124915;
	bh=3WeLx8mvBBO/pZgZ4BKiRFRlyykGBzrTqSWoGUp/JMg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmT850baLytAAE+i5ixH5WK8DXwoR/Ad6AXjNL+SpiYpcND0B4C8EaxCPPfNdQPh1
	 45XKcNz/UNrJ2cYFyY1VyjoiLl5AnCJyZosTwS861D5Z71GHlJtv2KSZbo2eChz7+o
	 JMnicZKaT/VQPUZ7GGG7njqycBtng0JeATcZ6szE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54965F8015B;
	Mon, 23 Nov 2020 10:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26EEF80113; Mon, 23 Nov 2020 10:46:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F839F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 10:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F839F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="KT+O73CF"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="phbX3w8s"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 5CCA9A9ACCF14;
 Mon, 23 Nov 2020 10:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1606124811; bh=3WeLx8mvBBO/pZgZ4BKiRFRlyykGBzrTqSWoGUp/JMg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=KT+O73CF2RVrcAtLzgWqeoOsLG9FGagVBduiWPqaYfrA9j36fRcoNaE8rQEfMaa7s
 xpOVMgsyt4EJJAVEPFupWU9XnyQc54VE4OtYEAxtncKUzjwZEqIL8yjTZYxnR6n+Ke
 ZZuthRv2RzPeOUQC2O7SyiBFdnk75d6at7dUkMpM=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-9PPCPF7-o8; Mon, 23 Nov 2020 10:46:46 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id E50BFA9ACCFD1;
 Mon, 23 Nov 2020 10:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1606124806; bh=3WeLx8mvBBO/pZgZ4BKiRFRlyykGBzrTqSWoGUp/JMg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=phbX3w8sEHKxIA6xF8wR9pVK5tuAlUQI07pdQxTuyfvnWEbWxTg77MPwel9UqvM0Z
 lm2cq/n6FWepaOTEOQngwcaZINdmNaZdAcnwkfpkKEzBk4/7WKsfrsMms4vyMaiE+b
 VIkSkBQW27IxuBvcCyd00HLPoOMTyFu5Ry9isBJ0=
Subject: Re: [PATCH 39/41] ALSA: usb-audio: Add implicit_fb module option
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20201123085347.19667-1-tiwai@suse.de>
 <20201123085347.19667-40-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <1bbcb89c-0a85-4493-85e2-2bee42580c7b@ivitera.com>
Date: Mon, 23 Nov 2020 10:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123085347.19667-40-tiwai@suse.de>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


Dne 23. 11. 20 v 9:53 Takashi Iwai napsal(a):
> A new module option, implicit_fb, is added to specify the driver
> looking for the implicit feedback sync.  This can be useful for a
> device that could be working better in the implicit feed back mode and
> user wants to test it quickly.  When this works, we can add the quirk
> entry easily.

Hi Takashi, thanks a lot for this extremely practical feature, along
with all the very useful patches.

With regards,

Pavel.
