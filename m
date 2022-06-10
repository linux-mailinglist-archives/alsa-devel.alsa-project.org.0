Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A8546A32
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B1F1A00;
	Fri, 10 Jun 2022 18:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B1F1A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654877802;
	bh=Xr8epkSUPli03TY3+GMWElhYFtkvjA5wP2k3Y/aG6wk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgikYqmQmvcUVtyk7XRowMkqi7niH8MTkamA7LqgCQQTafKtffic4S8EvtCH9ejJz
	 EG+ljvsF7OaGXVZ5JFvrJ10wW/whe9tVp2Dns8ma/+ZrGNBXYCCXWLLb05LzIhBC/A
	 oEiBmpDkaypQzBhdAe8aXXE77CS4VCmMYJB4bnZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C6BF800DF;
	Fri, 10 Jun 2022 18:15:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60702F804D2; Fri, 10 Jun 2022 18:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B456F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 18:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B456F800DF
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id zhIDnDopVE80KzhIDn3fuF; Fri, 10 Jun 2022 18:15:30 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 10 Jun 2022 18:15:30 +0200
X-ME-IP: 90.11.190.129
Message-ID: <d53ad0e2-e32d-1b46-b626-e82b44230704@wanadoo.fr>
Date: Fri, 10 Jun 2022 18:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: samsung: i2s: Check before clk_unregister() not
 needed
Content-Language: fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yihao Han <hanyihao@vivo.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220527065412.3677-1-hanyihao@vivo.com>
 <2bcf706b-10d5-9369-ff8a-2a3263f9fa70@linaro.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2bcf706b-10d5-9369-ff8a-2a3263f9fa70@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 29/05/2022 à 10:06, Krzysztof Kozlowski a écrit :
> On 27/05/2022 08:54, Yihao Han wrote:
>> clk_unregister() already checks the clk ptr using
>> !clk || WARN_ON_ONCE(IS_ERR(clk)) so there is no need to check it
>> again before calling it.
>>
> 
> No, this explanation does not make sense. clk_unregister() warns and
> this code is not equivalent.
> 
> 
> 
> Best regards,
> Krzysztof
> 

Hi,

Moreover, as pointed out by greg in [1] on some plateform the assertion 
in the commit description is wrong. His message is about clk_disable() 
but, IIUC, it makes sense for clk_unregister() as well. See [2] on the 
sh plateform.

CJ

[1]: https://lore.kernel.org/all/YqMIUOTU%2Fk5XpW3I@kroah.com/
[2]: 
https://elixir.bootlin.com/linux/v5.18.3/source/drivers/sh/clk/core.c#L452
