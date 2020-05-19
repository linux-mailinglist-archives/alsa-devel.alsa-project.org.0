Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F51D989E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 15:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B810D1751;
	Tue, 19 May 2020 15:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B810D1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589896431;
	bh=ftoKrY+DLW5raDNRfTaKhF/w0JQMDTTMmHXZA1XJKuA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oclKHl4szHdoNuNJct6Zdu8f056FUk/Tw2sGoDc8QWRrrlAP+3F19buAKmbS6BGaw
	 NFZgEklkG2aejCZZ3EBw+lDENyTiEo2QWZ0DXdnhIkZdyuYGSsmnwplfydm/JovzuX
	 bi5CMlfqiF7IPxt3bTX/N5PkIwVe09ecAlO8570A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B46F80132;
	Tue, 19 May 2020 15:52:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 540E4F801A3; Tue, 19 May 2020 15:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65702F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 15:52:00 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 021F6A003F;
 Tue, 19 May 2020 15:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 021F6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1589896320; bh=gPXx9q7/T9F6ybUT9hbbbAkodQz652PopgfG0hm41FQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cdgzA8b1kveT+s0E2xvN+yg3HoJXUVgZB6tCadlUoHciaugT8WZvXsw3iyXfc3liE
 fprwb/Pel1kUdnyXnXwTrZcNnOVVJLCKlz9DEaI8uHA063gY6I75ScGiWN5jWVEdj8
 BztPV0F64oBlIUzwNDSt3XUc4GyoBTVZvHU6ipP4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 May 2020 15:51:56 +0200 (CEST)
Subject: Re: Lock-free dmix considered harmful
To: Takashi Iwai <tiwai@suse.de>, Maarten Baert <maarten-baert@hotmail.com>
References: <HE1P191MB015371D61AF81262BD242966E2BD0@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
 <s5hzha4dom3.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e69389e9-2b03-7ef1-8ea6-144f8285b80a@perex.cz>
Date: Tue, 19 May 2020 15:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5hzha4dom3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Dne 19. 05. 20 v 15:46 Takashi Iwai napsal(a):
> 
>> Because of these reasons I think it would be better to drop the lock-free implementation entirely and just use the existing non-concurrent architecture-independent implementation from pcm_dmix_generic.c. Aside from being faster, it would also eliminate a lot of architecture-dependent code and inline assembly. Should I submit a patch for this?
> 
> The advantage of lockless dmix implementation isn't about its CPU usage
> but the nature where a stream isn't prevented by other streams, which
> assures the very low latency, too.  That is, with the generic dmix, a
> stream can be still halted when another stream stalls in the middle,
> and there is no way to recover from it.
> 
> So, IMO, we can start with a dynamic configuration to choose the
> behavior and add a configure option to choose the implementations.
> The default behavior should be still an open question, though.

I fully agree here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
