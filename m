Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBF3E112C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 11:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C624C169D;
	Thu,  5 Aug 2021 11:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C624C169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628155139;
	bh=twWaoUaptfUXFZXH8zdIZVEbZGyokJpBLoOKnPm8YUc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMOtdgqz/7bNuNJhn0LlSYO/3rghZbS/t9aG+U0OeXbt5Bex/+ZR07PCX5RzVypbq
	 xF84X1wjpZjN0TkduVMwtkXJs+szXmwKUUgRymI5ey/ljItD/jqi+4wsnKpX4O3GVZ
	 UYocm2bf6QETSH6EHtduVIu4fNrw4Sd9E+SnhaLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C49F80169;
	Thu,  5 Aug 2021 11:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F929F804E6; Thu,  5 Aug 2021 11:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD4AF80169
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 11:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD4AF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H9MbDpON"
Received: by mail-wr1-x42d.google.com with SMTP id n12so5588518wrr.2
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzThuEjTrYhg1qOmjws2RuEPYFGd40kLfkIG1ZhFyqU=;
 b=H9MbDpONaMfqEQsHonMKiW0qkmxYLMwS0uRUZg6wtXAdVU5M/dJLOsFiJe5OER+G1p
 IFQupaw/WaJxRHlv064WK/6b2o0QsZxtImi+8S22GS74wVbd37V2WeDQfMiWJTJlw+wJ
 oopRPsr0AIOCDAPlEj9HWzlN8FaRlH5HJI5fDhhURhHhxQYvTYoQVCzpIRS+UhF7Vdcj
 /I1SZFFnYCwuv2tbAaJ7RZ6coY/XmZ+vSq8Kfsjaddy5+fmq2x6h8Mg1DZL1TY8EaMOR
 QTypTYgGMOvWudH0T1SP1QaR3ZNYKrsTA1NUmQy+GNoNEzpLNMkofeSPXk6EFmZOHrNG
 h8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzThuEjTrYhg1qOmjws2RuEPYFGd40kLfkIG1ZhFyqU=;
 b=jUoCpBibnmxgQZQ3IpOfqm8O2iEujCwkxqAo6J0zeRIDEl8UR1MW8Ytyp2pHoQ+bU3
 xD+S9HQDYC0FRELrKJuJZoV38Yj4SzbTBsnkXuCs/E9FI/JAmL7ukhol/6CE0c+FXqTl
 +kcn2hcmbFZfW1YrjKar94HMEzrHMGMzuMwavvYeZuVu9Q0Y5pkE8x77TV0ichPAD0c/
 NlfqTBPEnM0iJ0WpS/ZwzYtPh8hLTAVBBFymaBlWwBTmxPyXcvxPLsm4d8erynLQm2UH
 O1A5CK5VnxCcnLnsc3PtLSTaba6QOOXPb8CaJumsoKogDrHYmjCr0xo8C88hBmlnId9h
 4aRg==
X-Gm-Message-State: AOAM5320M09KaXoQXG4ZLEOfG7/VTeFdexIUtJUA1KScpIu2pQa64y+A
 s6fLSqt0bOp/cZFHtb06G4YXoQ==
X-Google-Smtp-Source: ABdhPJxWILAsnwsT+9R3gsOKWSUR18ggJyUkK0YIVKtH9k/P3tlswSZoHeyJCACfIZYqUmV1QJxxTw==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr4026181wrh.74.1628155045815; 
 Thu, 05 Aug 2021 02:17:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id d16sm5400324wrx.76.2021.08.05.02.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:17:25 -0700 (PDT)
Subject: Re: [PATCH v3 12/20] ASoC: dt-bindings: q6dsp-clocks: add q6prm
 clocks compatible
To: Mark Brown <broonie@kernel.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-13-srinivas.kandagatla@linaro.org>
 <20210804180249.GH26252@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c07fc981-8eed-8333-fd4a-4521efc8da6c@linaro.org>
Date: Thu, 5 Aug 2021 10:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804180249.GH26252@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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

Thanks Mark for the review,

On 04/08/2021 19:02, Mark Brown wrote:
> On Tue, Aug 03, 2021 at 01:54:03PM +0100, Srinivas Kandagatla wrote:
> 
>> +    enum:
>> +      - qcom,q6afe-clocks
>> +      - qcom,q6prm-clocks
> 
> Again, what do these mean?  One of the goals with DT bindings
> documentation is to be able to relate hardware to bindings.
> 
Old Elite QDSP framework has service called "Audio Front End" aka q6afe 
which is responsible for managing the LPASS Audio clocks. So We endup 
with "qcom,q6afe-clocks" in the past to represent this.


With New AudioReach framework this functionality is now managed by 
"Proxy Resource Manager" aka q6prm.

I will rename "qcom,q6prm-clocks" to "qcom,q6prm-lpass-clocks"

to be more explicit about the hardware LPASS (Low Power Audio Sub 
System)IP here.

--srini
