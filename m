Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F74BDAC3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 17:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69BC171E;
	Mon, 21 Feb 2022 17:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69BC171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645459994;
	bh=HSK0maLb/Qn+If9FPJjJV1tniZ9qm90PxO/fNh09qUg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psW6UxLwPU61QfmvB8FcZYXOjRdek6h8o9l0GVIYpqz2FIPhKbywfoPemoPg1S9RM
	 f8wuNLpHQduT/ShZl5WWKsdr5mrM2wmirP33Qy+gdZAxdrV3tDbGw91e3sEVRqIPmu
	 Ncbz2kXXNp7l4RZHfggyRfd9xapHTrWmVvbyyFS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F86F80149;
	Mon, 21 Feb 2022 17:12:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F10F8013D; Mon, 21 Feb 2022 17:12:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B34B3F800D1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 17:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B34B3F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yR2PUefh"
Received: by mail-wr1-x433.google.com with SMTP id j22so1879796wrb.13
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zlMFpcP0zNNriVnT5doP/SyJTwdm7nH+VKFwP5oEA8M=;
 b=yR2PUefhHHXddq0ZZeBLi0plQyYgvn0D8x3KItsVGFh6ni4JOUJbjnoBJqWJ/9qpHp
 RGN3lyzVFfzJqFUgngJEy08hEqOjt0iSgamn1nDIDemPbWeCXMif4BfBmIMKpKFGfLmv
 AXUWG2HqimBK1BM08WiBrEGwp2YT8BLO3YYndzkgujGRwykzkBUuqQptkpw28rBrY0Qq
 GWNptMlkuoIlcXdZT1WuIicQWe+xs6vKUlyxkItsmx/60HD7/t3uXhmp+JkpWg0+MycQ
 kcyxccYPfTha0/+REIyv4f5xIC3B04Eu6vXwRhxr3If4ld1wbjoH1UkRUoguOZ++3EmC
 uS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zlMFpcP0zNNriVnT5doP/SyJTwdm7nH+VKFwP5oEA8M=;
 b=u8hyMNdof91zDvXAq/jKqBictt63IWO38wysDW1bmSTFXFLFRnRCB6uX1FvPqYcqKa
 ASK5vYKcu6RIRb1BEMA9hdOkklmm5GeiaU8JjfV+e+5OYKq0k82nOWtumwXLseyN8kdQ
 pw+ZxQVpFl55/OZPysAMnsC5ii67FyMrulC4MEL5IutwxE1rcpV6VlIJVuSNRUYnhPBj
 YWkUWEjU34oplSSBhrv9zoCByjr3q4InulOCsjqZ/5eFEv+BZzOVpZNJzwE9ja5ME+5A
 yZb/oV/+Tb5Fn8Q1u0CcsrVcbpbZJTapOYg5Xw/Rx4ohT6hZJQXuwtnPJG8xdy3MQUmi
 liqw==
X-Gm-Message-State: AOAM532YJE4/5ujeUyjJvcE9rNvu9g5XrgBf3oZBeUnMqH5nnyQ+gVUE
 6AWLsRGjd7hOTw7XpVjZGrnjrw==
X-Google-Smtp-Source: ABdhPJyDpq3A74100QuIQ6OMl/1/0C5WUkzHL4jQxF7X3+yOs91rMUhAVfAZD1S8e2lUJuD1eJ/Pow==
X-Received: by 2002:a5d:64c3:0:b0:1e5:94d3:5bf2 with SMTP id
 f3-20020a5d64c3000000b001e594d35bf2mr16370510wri.488.1645459919309; 
 Mon, 21 Feb 2022 08:11:59 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id 24sm7818702wmf.48.2022.02.21.08.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 08:11:58 -0800 (PST)
Message-ID: <d8f1db40-33ce-671c-2041-5f12608afee5@linaro.org>
Date: Mon, 21 Feb 2022 16:11:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/10] ASoC: codecs: tx-macro: setup soundwire clks
 correctly
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
 <YhOx+nQ/G+HNRXbq@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YhOx+nQ/G+HNRXbq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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



On 21/02/2022 15:38, Mark Brown wrote:
> On Mon, Feb 21, 2022 at 01:10:36PM +0000, Srinivas Kandagatla wrote:
>> For SoundWire Frame sync to be generated correctly we need both MCLK
>> and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain on,
>> however after adding pm runtime support its possible that NPl clock could be
>> turned off even when SoundWire controller is active.
>>
>> Fix this by enabling mclk and npl clk when SoundWire clks are enabled.
> 
> A lot of these commit messages sound like earlier patches in the series
> introduced bugs which isn't going to be ideal for bisection.
Yes that is true, I did think about sending this as a fix.

Adding a fix tag would not really make any functional difference as we 
will be hitting the issue only when we enable pm runtime in codec and
SoundWire controller, so I did add this as part of pm runtime patches.

Without runtime pm the clocks are left always on, so it worked so far.


--srini
