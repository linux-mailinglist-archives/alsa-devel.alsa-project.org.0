Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513462BCC4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 03:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C761F17C6;
	Tue, 28 May 2019 03:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C761F17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559006235;
	bh=6kUfgeY5IZVIfrZJYICEzx5Fk/7DRDunwfjqQnysI9g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2ny95a6nRs79E8Vo0h7O64hoCVhGblIYqkEZRYhEsPIILemZB9bYDzd493XQvjhH
	 X9IbGW71eAwAMBQAFnzEtrU0KUBa70Dc0aItJOaxuY6vBXbnlVTlnjw/YAvonrg02R
	 UqT45NDrBJYMFZIyLIj5Ci6RxJbG61WA3o9wXmFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31926F896E0;
	Tue, 28 May 2019 03:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1098F896E4; Tue, 28 May 2019 03:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F2CF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 03:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F2CF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="T1pOZQOa"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="T1pOZQOa"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id ED9D16087F; Tue, 28 May 2019 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559006121;
 bh=FL1sv7z0DtNNU7NJWH/om9Nb33ulOXWRbeKjsNvPDU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=T1pOZQOa9o79lDRwxq4hN8wq8bE4IQLGgjd/td898tqVsWDc6k/RAqEpUjimGcBDQ
 gmIOinuZUMVbGjjBSWc2F4sj4GiUzdjzFQK8NJ/vPBqIfu/Ef2igV9GMTLOiUBjmdt
 A4bxg5Ho0ZGDs5sHWaxsqYDxTT1n7b8nXWEJaRK4=
Received: from [10.110.22.132] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A69A602F2;
 Tue, 28 May 2019 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559006121;
 bh=FL1sv7z0DtNNU7NJWH/om9Nb33ulOXWRbeKjsNvPDU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=T1pOZQOa9o79lDRwxq4hN8wq8bE4IQLGgjd/td898tqVsWDc6k/RAqEpUjimGcBDQ
 gmIOinuZUMVbGjjBSWc2F4sj4GiUzdjzFQK8NJ/vPBqIfu/Ef2igV9GMTLOiUBjmdt
 A4bxg5Ho0ZGDs5sHWaxsqYDxTT1n7b8nXWEJaRK4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A69A602F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
To: Mark Brown <broonie@kernel.org>
References: <1558684467-11333-1-git-send-email-bgoswami@codeaurora.org>
 <20190524112931.GB2456@sirena.org.uk>
From: Banajit Goswami <bgoswami@codeaurora.org>
Message-ID: <e65750b3-1fa6-e982-e695-4566f5e51e0c@codeaurora.org>
Date: Mon, 27 May 2019 18:15:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524112931.GB2456@sirena.org.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add a debug log to track DAPM widget
	power up/down
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

Thanks Mark for the review!

On 5/24/2019 4:29 AM, Mark Brown wrote:
> On Fri, May 24, 2019 at 12:54:27AM -0700, bgoswami@codeaurora.org wrote:
>> From: Banajit Goswami <bgoswami@codeaurora.org>
>>
>> Add a debug log to help track widgets being powered-up and powered-down
>> by DAPM.
> We already have huge amounts of trace available via tracepoints and
> having something on by default in the debug logs seems like it's going
> to get very verbose for people who aren't specifically working on audio.
> What's the advantage of adding dev_dbg() logs as well?

Having this debug statement helps collecting logs about DAPM widget power

Up/Down sequence, which helps significantly during debugging. The 
advantage of

having the dev_dbg here are-

1. Do not need to enable trace, which helps collecting logs, without 
much know-how

about audio or kernel

2. Dynamic debug (using /sys/kernel/debug/dynamic_debug) can be enabled for

either just this line of code, or, for the function containing this 
debug statement.

This way, logs can be collected just for the DAPM widget enable/disable, 
and thereby

avoid having the output logs filled with unwanted logs.

3. Though I agree with you about the additional DAPM debug logs being 
present for

someone who may not be specifically working on Audio, based on the number of

widgets in the audio path used, the number of prints should be limited 
to only widget

power on/off.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
