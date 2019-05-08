Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A543171BA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 378AD1862;
	Wed,  8 May 2019 08:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 378AD1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557297397;
	bh=7fqPWWlDJY7V9nvS1rIuArAyc4jZ8VZFuRogWkBcuIY=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRH9wmvTBWUrCOcefp30qCQMq51/nZbY3GqDtJqEEvjPRUnjdrJkBVJzAwjl4mo6J
	 acvTRBp0GCtKo/Eq2HEJ6GIty2b5hltj7CB+EL2sWla1+Bigt/X3R/OzG4mdt1hnYH
	 Z+1wwMwmvxwFE2jy9A+vr+HfSh1hCIbUkq42/dnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8CAF89705;
	Wed,  8 May 2019 08:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62D1EF896FD; Wed,  8 May 2019 08:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9672F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9672F80796
Received: from 212.199.233.220.static.exetel.com.au ([220.233.199.212]
 helo=[192.168.1.51])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1hOG9n-0001fl-QQ; Wed, 08 May 2019 16:34:24 +1000
To: Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org
References: <bdc0a30f-c6f3-8ccb-f556-1d1a6a68f3b9@flatmax.org>
 <1c0e5dbe-d5d5-c505-3b62-77e5fab8ee3d@ladisch.de>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <50359ba4-cd36-5712-af4c-ad175df94ef3@flatmax.org>
Date: Wed, 8 May 2019 16:34:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1c0e5dbe-d5d5-c505-3b62-77e5fab8ee3d@ladisch.de>
Content-Language: en-AU
Subject: Re: [alsa-devel] cs4265 : alsactl store and "C data buffer" fails
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Clemens for your guidance.

It worked !!!

I have posted the patch.

On 7/5/19 4:08 pm, Clemens Ladisch wrote:
> Matt Flax wrote:
>> When alsactl store is run with a cs4265 chip, the following error occurs (from https://github.com/Audio-Injector/Ultra/issues/25) :
>>
>> $ sudo alsactl store
>> alsactl: get_control:256: Cannot read control '2,0,0,C Data Buffer,0': Input/output error
> This sounds like a bug in cs4265_readable_register(); try replacing CS4265_SPDIF_CTL2
> with CS4265_MAX_REGISTER.
>
>
> Regards,
> Clemens
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
