Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924F1D49AD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 11:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C29D1666;
	Fri, 15 May 2020 11:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C29D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589535184;
	bh=KKntYkql7TiuH/0XFuXLsJRDf2vWNNIAbzU4mLYBS/s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfpTJWdGKs6QiRFzokZ/yWl1BpWhdbiaOK6rgnxW/BeifQOV9+cYdOEMtAcV3deE3
	 yAOCe3cVuvFe9/wIYk19xJ4oUYIUWy+KF1XMbQrnxVqU1pWeJwVeAEsLyDpRow8W5n
	 Z2qmEG5Chwuo7/GY43FHDG1qOS+8omba7gGrLm1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F997F80253;
	Fri, 15 May 2020 11:31:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5FAF80247; Fri, 15 May 2020 11:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4165AF800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 11:31:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 19E6AA0042;
 Fri, 15 May 2020 11:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 19E6AA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1589535065; bh=MZ3WhTdbJo0ZPJ+o1cwVqjMwYaFP9BgnkqanhewWYuU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PjUdau40OfvDTnmHt9dgKMWAuHci2F8LXEOo9nMfN/y9JCGOrFx8fvblnrUPPj0l8
 vIyD+knHL5u52qs2A9AlbGPDzXgJP6QJwKkesTUYJQ2zeGQikKPATtlIXYyD9iHb66
 EROLBakhgWLvIbCDpmIrt13sX8ruNJw48uhgHujI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 15 May 2020 11:30:54 +0200 (CEST)
Subject: Re: [PATCH] ALSA: pcm: fix incorrect hw_base increase
To: "Lu, Brent" <brent.lu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1589515779-20987-1-git-send-email-brent.lu@intel.com>
 <20200515070446.GA1226131@kroah.com>
 <BN6PR1101MB21327687327440F1DB7CB75F97BD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ce215f76-89c3-3543-c6ed-bc9b81af50a0@perex.cz>
Date: Fri, 15 May 2020 11:30:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB21327687327440F1DB7CB75F97BD0@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 paulhsia <paulhsia@chromium.org>
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

Dne 15. 05. 20 v 11:04 Lu, Brent napsal(a):
>>
>> Is this a bugfix needed for older kernels as well?  When did this issue show
>> up?
>>
>> thanks,
>>
>> greg k-h
> 
> It happens when DMA stop moving data from host to DSP/DAI for a long time
> (> half of buffer time). I know host driver should do something about it. But if
> not, the HWSYNC will keep increasing the hw_base and hw_ptr and confuses
> user space program.

I'm afraid, but with this code, you turn off the hw_ptr jiffies code. It would 
be better to fix the driver in this case (return the updated / estimated DMA 
pointer, increase DMA buffer size etc.). This "lag" is unacceptable.

						Jaroslav

> 
> Regards,
> Brent
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
