Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4EA85F1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 17:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A5D16C6;
	Wed,  4 Sep 2019 17:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A5D16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567609709;
	bh=YJxUAgDGdwUhVFLvyAFj8dRSX7K4HiXvprxGqOltu5Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWZ/nHkRCGHToLPgr/Xjne2vPAe2fNMi7OHPCpbHsGHG2OeFKDXIbukc51M/2IFY5
	 9JnjC/QbHeFD7zyWlxES8wx0fdAslGLo7Tgn8qaVYgk+OusGUEbkOd3rSwQVMgbI81
	 TUksLaM8t32tuOMuTQz7x+9KzYvMz8TBU9CyVm8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C98F803D6;
	Wed,  4 Sep 2019 17:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF1DF8011E; Wed,  4 Sep 2019 17:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BC65F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 17:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BC65F8011E
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x84F6OmK057013;
 Thu, 5 Sep 2019 00:06:24 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp);
 Thu, 05 Sep 2019 00:06:24 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp)
Received: from [192.168.1.2] (118.153.231.153.ap.dti.ne.jp [153.231.153.118])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x84F6N7i057007
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Thu, 5 Sep 2019 00:06:24 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
To: Mark Brown <broonie@kernel.org>
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
 <20190903174801.GD7916@sirena.co.uk>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <85c717bf-d875-016c-a303-867bdca9a645@katsuster.net>
Date: Thu, 5 Sep 2019 00:06:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903174801.GD7916@sirena.co.uk>
Content-Language: en-US
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v3 1/4] ASoC: es8316: judge PCM rate at
	later timing
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

Hello Mark,

On 2019/09/04 2:48, Mark Brown wrote:
> On Wed, Sep 04, 2019 at 01:53:19AM +0900, Katsuhiro Suzuki wrote:
> 
>> Root cause of this strange behavior is changing constraints list at
>> set_sysclk timing. It seems that is too early to determine. So this
>> patch does not use constraints list and check PCM rate limit more
>> later timing at hw_params.
> 
> hw_params is a bit late to impose constraints, you want them to be
> available to be available to the application before it gets as far as
> picking the parameters it wants so that you don't get hw_params failing
> due to an invalid configuration.  That makes everything run more
> smoothly, applications should be able to trust the constraints they got
> and some will not handle failures well.
> 
> The way this works with the variable MCLKs is that you end up in one of
> two cases (wm8731 and wm8741 do this):
> 
>     1. The system is idle, MCLK is set to 0.  In this case no constraints
>        are set and we just set MCLK to whatever is required in hw_params()
>        in the machine driver.
>     2. One direction is active, MCLK is set to whatever that needed.  In
>        this case startup() sets constraints derived from the MCLK.
> 
> There are races in this if streams are being started and torn down
> simultaneously, there's not much we can do about them with the API the
> way it is so we do have to validate in hw_params() anyway but it should
> be validation not constraint imposition.
> 
> If the system has a fixed MCLK it just sets that on probe then we always
> get the constraints applied on startup through the same code that
> handles case 2.
> 

Thank you for explanation. I agree with apply no constraints if MCLK is
set to 0, and suitable constraints if MCLK is set to other values like
as wm8731 and wm8741 drivers.

I'll change my patch set and send.


Would you tell me one more thing. I don't understand who sets MCLK to 0.
Is it needed original machine driver instead of audio-graph-card?

On my test environment (audio-graph-card + Rockchip I2S + ES8316), it
seems audio-graph-card has never called set_sysclk() with freq = 0 after
stop play/capture sound. So my env will go to bad scenario as I 
described in this patch.

Best Regards,
Katsuhiro Suzuki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
