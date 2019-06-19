Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC164B6E0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 13:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A906C1692;
	Wed, 19 Jun 2019 13:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A906C1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560943008;
	bh=pvoijNgUXcr8sVRNcK1q5Qkvj/JdC31uUEPxEjyOTWo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcStC8HfYTzxu3PEfMMF5Bl6R3Xdtd+B/1VREV1q3pF9zeV4DBp0hVRtYMrMru4R/
	 fUeVZJ0H8YokkWVykfn9miFWY/1sntLjTVvzAzK8k2ZG6yzjfTLgKK71p6o/bUY+Do
	 N4LhLdhlQ1+dQhEdV9JPZCk4swcuUWlqpPKk0FFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B949F896B8;
	Wed, 19 Jun 2019 13:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A027F896B8; Wed, 19 Jun 2019 13:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_84,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC925F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 13:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC925F808AF
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 00DF7C80EEB;
 Wed, 19 Jun 2019 13:14:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlAKkvAnSKiK; Wed, 19 Jun 2019 13:14:57 +0200 (CEST)
Received: from [10.11.2.101] (unknown [188.193.2.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rs@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id B4D41C80EE8;
 Wed, 19 Jun 2019 13:14:57 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20190615034207.22723-1-rs@tuxedocomputers.com>
 <s5h4l4od9b2.wl-tiwai@suse.de>
From: Richard Sailer <rs@tuxedocomputers.com>
Message-ID: <9fc98708-d0c3-27c8-beab-a3f842e0e5d6@tuxedocomputers.com>
Date: Wed, 19 Jun 2019 13:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <s5h4l4od9b2.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, jeremy@system76.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek: Add quirks for several
 Clevo notebook barebones
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

> 
> Your sign-off is missing.  Could you resubmit with it?

No problem, will send it this evening or in the next few days.

> 
>> This is strange since the System76 Oryx Pro also seems to be a P960 and
>> P970 barebone, so the original fixup should also not have worked for
>> them. @Jeremy: What's your take on this?
> 
> ... and it's better if this mystery is clarified, too.

Agreed, don't want to break their hardware. Thats why I asked and added
jeremy in the CC. I hope he will answer in the next 1-2 weeks.

> 
> We don't have to list up necessarily the detailed model names here.
> Though, it's OK in this form as it's done concisely.
> 
Okay, good to know for the future.


Thanks,
-- Richard
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
