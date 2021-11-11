Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1744D479
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 10:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1462A1661;
	Thu, 11 Nov 2021 10:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1462A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636624630;
	bh=GEWhCdjYEYIjRd4WaXUYdzd3ioEe5X8vRhPxrFYSlhI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZERma063WiQeM8+HuORFxrCTPDp9MMXJqQKe93lq0igmTQOdEiHpwx4moFHuSkBU
	 aGrMXsdGN1tVs+6AJvQwrxU4J5VCYEn+q+FzZXOf5bNpMnc+UdwGA+mCULIMBMp1u7
	 hzO4ltYgFh07Cqv6gzgp4wP+O86NKBgZH+kSbGsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69106F802E3;
	Thu, 11 Nov 2021 10:55:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54AFCF802D2; Thu, 11 Nov 2021 10:55:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C839F800C1
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 10:55:42 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6CD63A0042;
 Thu, 11 Nov 2021 10:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6CD63A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1636624537; bh=CB0c+O3YofCMPKBMJkhCd8jsyzatJFR2+4bRtLEqYPk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=rlmy8yRzEqCt1w7lrwhe/G1VQhTkQhdRKqoGDU2PzwR4TNSrp339sFChp50jYrtUD
 v8nun9lUxxPeC+W+lwpmxVl9+Ya748fs7hKUT2xx/E7DfWpfHbFPP31H4Xx0H5Z3FR
 4XZaEM8J5ugw0erBZBmzVSb5WfyIwD/sd1kXknnM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Nov 2021 10:55:26 +0100 (CET)
Message-ID: <3654e59d-52bd-5442-39d1-f017f5a14b2b@perex.cz>
Date: Thu, 11 Nov 2021 10:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
To: shumingf@realtek.com, broonie@kernel.org, tiwai@suse.de,
 lgirdwood@gmail.com
References: <20211111091914.20917-1-shumingf@realtek.com>
 <7e82a4cd-ed51-e853-7338-eb570c88cb68@perex.cz>
In-Reply-To: <7e82a4cd-ed51-e853-7338-eb570c88cb68@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Yijun.Shen@dell.com,
 flove@realtek.com
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

On 11. 11. 21 10:34, Jaroslav Kysela wrote:
> On 11. 11. 21 10:19, shumingf@realtek.com wrote:
>> From: Shuming Fan <shumingf@realtek.com>
>>
>> Add the profile name to let userspace pick correct UCM profile
> 
> It's no longer necessary to force the card names in the drivers. UCM can match
> the USB vendor / device IDs from the 'components' string, too.
> 
> I think that we should abandon this way of the UCM configuration selection for
> new devices with device IDs. The kernel already exports necessary information
> to select the right UCM configuration in the user space.

Untested example:

https://github.com/perexg/alsa-ucm-conf/commit/74ced65440b5011bbec1680b2804c8a9c82b5152

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
