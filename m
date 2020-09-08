Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA0261109
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80F2174B;
	Tue,  8 Sep 2020 13:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80F2174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599566440;
	bh=Rd+ytoBq+rj3XkiGm2+ZQQMccmVLWdUxn7Fl2skZKrU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSEuJSONHllpPL61ccYdsu20Rrdq3X1lAzHs87VyNCvyPvXwgDwcUm4lOc1eK5PGt
	 RfC0XViGJCAwnKx4tC2FggpcoibbB34K1Q8iLZbO1Kb80XdaOKhccqJeo8SMaoon8p
	 ihgVikHtwe+Zaietms1WvacUh0ttOhX2+KaTFkSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3CDF8026F;
	Tue,  8 Sep 2020 13:58:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CA5F80264; Tue,  8 Sep 2020 13:58:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E070DF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:58:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BDCF7A0040;
 Tue,  8 Sep 2020 13:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BDCF7A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599566329; bh=Nbb52axGQkpd+7mzAiOkmvpMt9BrP1xSBJs/FBqExE8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mYG4ef51jfoK/iiwUwq6QRywvsF1C7gp+QbmGLJ7QY/1S7VFLREYoupbZ538Y2YDO
 EfOuQq0alwf2EMcD4NdgbdNM1MTm0R4tL9heDz0ONA1OGf9frBAO0HATCOCSIKVHhA
 fw9OFxfkGqWnLogJ8mTm0Kp/w9DEtP8kl5ouInKQ=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 13:58:33 +0200 (CEST)
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
 <20200819090637.GE2639@vkoul-mobl>
 <8d60fa6f-bb7f-daa8-5ae2-51386b87ccad@linux.intel.com>
 <20200821050758.GI2639@vkoul-mobl>
 <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
 <20200828080024.GP2639@vkoul-mobl>
 <77ecb4bc-10d6-8fbd-e97f-923d01a5e555@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3e4dee4b-1309-2d3e-ae20-e2dcbadb2f40@perex.cz>
Date: Tue, 8 Sep 2020 13:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <77ecb4bc-10d6-8fbd-e97f-923d01a5e555@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

Dne 28. 08. 20 v 17:14 Pierre-Louis Bossart napsal(a):
> 
> 
> 
>> Is this timeout for suspend or resume? Somehow I was under the
>> assumption that it is former? Or is the result seen on resume?
>>
>> Rereading the race describe above in steps, I think this should be
>> handled in step c above. Btw is that suspend or runtime suspend which
>> causes this? Former would be bigger issue as we should not have work
>> running when we return from suspend call. Latter should be dealt with
>> anyway as device might be off after suspend.
> 
> This happens with a system suspend. Because we disable the interrupts, 
> the workqueue never completes, and we have a timeout on system resume.
> 
> That's why we want to prevent the workqueue from starting, or let it 
> complete, but not have this zombie state where we suspend but there's 
> still a wait for completion that times out later. The point here is 
> really  making sure the workqueue is not used before suspend.
> 

Vinod, there is no acceptance progress on this. The patch is really straight
and for the Intel controller. They know what they're doing. I would apply
this. The code can be refined at anytime. It's a fix. I tested it and I can
confirm, that it fixes the issue. It's a vital patch for 5.10 to enable
finally SoundWire drivers for the Intel hardware.

Acked-by: Jaroslav Kysela <perex@perex.cz>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
