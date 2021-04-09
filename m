Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA0359FEF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 15:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098F8829;
	Fri,  9 Apr 2021 15:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098F8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617975358;
	bh=DO9grgWZSTNx74M95p9fHFquK06m0vGuTHdK0DBUIiM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iScPyR8IJ4tuEObACyhrxxE1olV2pvy0Jx4DHtQ+i6n83MNWXzxv+8+ZGGSYVsrBH
	 ztlwZekWUK8AaHajqx8qf+mvDBusPramoPMVngD/iVV8g2LVwtdy5xtbyAoU7fciuF
	 KrvFWSG4BcKm0V7uW211Rk98Lei1sUH2xUVkXReg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBD7F80168;
	Fri,  9 Apr 2021 15:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E239EF8016A; Fri,  9 Apr 2021 15:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F25F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 15:34:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 22843A003F;
 Fri,  9 Apr 2021 15:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 22843A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617975258; bh=QnderPzwD+/9Q+o0ZTebIJEFdXyuM/AGPrTinuyVjeM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ApLEHdJAHKmg133jp56lS3P4K0IUrxxyj1c7wexyZDRk6oLnDs74x04ZfAtdhOnmj
 +9/4vSPolOTQSWmmjQAHcbQMFYMd1LlvCk0eBDUf+K+X9uIWgAXFoY0yNk4p+j/dat
 Q6KsfcvOdo884DPHh6B29JbGk3A+axymhcDFw8pY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Apr 2021 15:34:15 +0200 (CEST)
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
To: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
 <20210408105025.GB40407@workstation> <s5h1rbl80yy.wl-tiwai@suse.de>
 <20210409022735.GA3776@workstation> <s5h5z0v67wh.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1c2da980-1f63-c6fe-a4c0-005a1ed5bc19@perex.cz>
Date: Fri, 9 Apr 2021 15:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5h5z0v67wh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 09. 04. 21 v 12:59 Takashi Iwai napsal(a):

>> 5. add any mechanism to bind lifetime of user-defined element set to user
>>    process
>>
>> At present, the lifetime of user-defined element set is bound to card
>> itself. However, it's convenient to user processes to bind the lifetime
>> to process itself. I add any mechanism for it.
>>
>> For recent years I've made some patches in house but never arrive at the
>> best one. In the patches, I utilize access flags but in general the
>> maintenance of lifetime is not easy issue. I tackle again in this time.
> 
> It sounds interesting, but I don't know how easily you can manage it.
> The driver doesn't care much about the user process lifetime, but
> mostly concentrate on the file handle...

It should be easy to trace which process created the user element and
automatically remove this element when the process close the file descriptor.
Something like 'bind lifetime of the control to the active control file
descriptor'.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
