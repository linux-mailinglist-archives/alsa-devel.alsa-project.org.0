Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D9A5CAA
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 21:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB9216E5;
	Mon,  2 Sep 2019 21:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB9216E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567452075;
	bh=UYljgo+NT1flmT/DQfsC7ntneAgvEai0J5mfCIp0ORo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vq+4Lp+prnK0zGHdyNhh1ymO+JbcvqnBjhHTKHXOfb2HVp47Tp2IWOPYmjmjA0faB
	 7mR7r+mq+a5xjANcJYNVz5DOvyG6gV1G6TTlb+RHt8wMNOVRRsgCQvYE/KjK6OU4Av
	 AIEigtTP07HxBfdow7VJ2aNHyaKPlEVPIU/v4OyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FEEEF803D0;
	Mon,  2 Sep 2019 21:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD482F803D0; Mon,  2 Sep 2019 21:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B78F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 21:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B78F8011E
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x82JJAia011666;
 Tue, 3 Sep 2019 04:19:11 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp);
 Tue, 03 Sep 2019 04:19:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp)
Received: from [192.168.1.2] (118.153.231.153.ap.dti.ne.jp [153.231.153.118])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x82JJAlm011657
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 3 Sep 2019 04:19:10 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
To: Mark Brown <broonie@kernel.org>
References: <20190831162650.19822-1-katsuhiro@katsuster.net>
 <20190902120248.GA5819@sirena.co.uk>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <1a3c5934-4731-d474-e9d5-795e8337b180@katsuster.net>
Date: Tue, 3 Sep 2019 04:19:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902120248.GA5819@sirena.co.uk>
Content-Language: en-US
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: es8316: judge PCM rate at
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

Thanks a lot for your comments.

On 2019/09/02 21:02, Mark Brown wrote:
> On Sun, Sep 01, 2019 at 01:26:48AM +0900, Katsuhiro Suzuki wrote:
>> This patch change the judge timing about playing/capturing PCM rate.
>>
>> Original code set constraints list of PCM rate limits at set_sysclk.
>> This strategy works well if system is using fixed rate clock.
>>
>> But some boards and SoC (such as RockPro64 and RockChip I2S) has
>> connected SoC MCLK out to ES8316 MCLK in. In this case, SoC side I2S
>> will choose suitable frequency of MCLK such as fs * mclk-fs when
>> user starts playing or capturing.
> 
> The best way to handle this is to try to support both fixed and variable
> clock rates, some other drivers do this by setting constraints based on
> MCLK only if the MCLK has been set to a non-zero value.  They have the
> machine drivers reset the clock rate to 0 when it goes idle so that no
> constraints are applied then.  This means that if the machine has a
> fixed clock there will be constraints, and that constraints get applied
> if one direction has started and fixed the clock, but still allows the
> clock to be varied where possible.
> 

In my understanding, fixed and variable clock both use set_sysclk() for 
telling their MCLK to codec driver. For fixed MCLK cases we need to
apply constraint but for variable MCLK cases we should not set
constraints at set_sysclk(). How can we identify these two cases...?

For example, if machine sets very low MCLK once, the driver applies low
Fs constraints which I2S driver cannot support to. After that this sound
card cannot play/capture any Fs rate. It seems set_sysclk() is not
called if Fs does not match constraints. So we have no chance to
reconfigure MCLK by set_sysclk().


Best Regards,
Katsuhiro Suzuki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
