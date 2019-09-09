Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2260AD20B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 04:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB791658;
	Mon,  9 Sep 2019 04:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB791658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567997486;
	bh=YmvERlAdRPuQGyUTvAHtukm/+qalo1ETUrT13gvTan8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNKVB1DyPKyDa7+akw4G11dTPAlwynT50W/GLyrpfwam6hT4ef5rwL/lvWPDNw3rI
	 62Pqu+lBgrt2KpKpWj53oJbPSXp//I3elBEm0d5jpm7gO7dks0E1JNHmJXQPbYqps0
	 yiXGYdLEZ2cAXM1Rx+sPFX9BfDHvTF2GH5NGDQtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85738F804FD;
	Mon,  9 Sep 2019 04:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62F5FF80323; Mon,  9 Sep 2019 04:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E64B6F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 04:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E64B6F800C9
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x892nRXu066490;
 Mon, 9 Sep 2019 11:49:27 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp);
 Mon, 09 Sep 2019 11:49:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp)
Received: from [192.168.1.2] (238.8.232.153.ap.dti.ne.jp [153.232.8.238])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x892nRLX066484
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 9 Sep 2019 11:49:27 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20190907174501.19833-1-katsuhiro@katsuster.net>
 <87woei5mzj.wl-kuninori.morimoto.gx@renesas.com>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <af9678aa-bd38-7cb5-5d25-b133a269f19f@katsuster.net>
Date: Mon, 9 Sep 2019 11:49:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87woei5mzj.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] SoC: simple-card-utils: set 0Hz to sysclk
	when shutdown
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

On 2019/09/09 9:31, Kuninori Morimoto wrote:
> 
> Hi Katsuhiro
> 
>> This patch set 0Hz to sysclk when shutdown the card.
>>
>> Some codecs set rate constraints that derives from sysclk. This
>> mechanism works correctly if machine drivers give fixed frequency.
>>
>> But simple-audio and audio-graph card set variable clock rate if
>> 'mclk-fs' property exists. In this case, rate constraints will go
>> bad scenario. For example a codec accepts three limited rates
>> (mclk / 256, mclk / 384, mclk / 512).
>>
>> Bad scenario as follows (mclk-fs = 256):
>>     - Initialize sysclk by correct value (Ex. 12.288MHz)
>>       - Codec set constraints of PCM rate by sysclk
>>         48kHz (1/256), 32kHz (1/384), 24kHz (1/512)
>>     - Play 48kHz sound, it's acceptable
>>     - Sysclk is not changed
>>
>>     - Play 32kHz sound, it's acceptable
>>     - Set sysclk to 8.192MHz (= fs * mclk-fs = 32k * 256)
>>       - Codec set constraints of PCM rate by sysclk
>>         32kHz (1/256), 21.33kHz (1/384), 16kHz (1/512)
>>
>>     - Play 48kHz again, but it's NOT acceptable because constraints
>>       do not allow 48kHz
>>
>> So codecs treat 0Hz sysclk as signal of applying no constraints to
>> avoid this problem.
>>
>> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
>> ---
> 
> I'm not 100% understand your issue.
> .hw_params (= set mclk/sysclk) is not called in bad case ??
> Or it is called but Codec driver ignores it somehow ??
> 

Ah, sorry for confusing. It's not either. hw_params() of machine
driver has been called even if constraints don't have a requested
PCM rate. But it's not expected.

For example, if constraints are 32k, 21.33k, 16k, hw_params() will
be called with 32k when an user requests to play 48k sounds.


> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
> 

Best Regards,
Katsuhiro Suzuki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
