Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C43E111E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 11:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA6811685;
	Thu,  5 Aug 2021 11:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA6811685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628155073;
	bh=kvUf3St7FsnFtbZpvNwEZ2eDqu4Ewe0jHTVXyj7Zgl8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAd4rLhdrJA220NkbZ63rHxk9o/Wn0pAvn4YEymvLfa/5eoo3GTOnFnpDEcU52erV
	 G6zyteR55LvCNOfTcjyaf9QIs3t/zkRWdAuEj4/+sunW6CNfr7mXp9tiHuII0Lv42K
	 Ht5/f1g40RC6Q/iLxOKeji+eS9vlNBa4/qAYZ7Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23171F8010A;
	Thu,  5 Aug 2021 11:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52232F802E8; Thu,  5 Aug 2021 11:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026E5F8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 11:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026E5F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Po3+CQsZ"
Received: by mail-wr1-x42b.google.com with SMTP id h14so5552682wrx.10
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cVPGDe3gc+dI1+XOmxoTsyotwnBpNA+nPuGg+fvhZXU=;
 b=Po3+CQsZm3CjeNmFer/8eDr1YBaxp6FI3Vl+9D+mJ7OqfU6DSw5bA7aIdTOnVJ2/cU
 GgK788yPXj24ZQ/yh83bjxE98WzvNc0bkkPBO61A1FZDXfB/ECvRAxy5xMAj3JSPaA9T
 WtPvVUcczjlzvdTFMDzU+qCIB9QN0+QM+TqEODuKd7dhzeoNcFdGn1v/J9g67k3NKg7O
 hQ6YMMVYYQNcxOiMiV5ahUub8tdho7UkI9WGX8jJJJAmKzNIpywJfdjTE1pqVMeM1+aO
 675z+04Ll5bQw/nHjzuL8NMlcZAP0Y7mtnXmx5tRBtqhgaMWcgKyorsdPPJAiWLoT8Wz
 Pq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cVPGDe3gc+dI1+XOmxoTsyotwnBpNA+nPuGg+fvhZXU=;
 b=Q3rHCVu9ALapYHe/NQWFPlV1bbOxCZXvddpdG+Vvmdz1iHlUODXm19/7isgf+3EGw+
 toLCCGaAvY/Y1CaED0q2x/KfDawcQkBO06qJD6TP8APAFPFgNyxT+szmR7aGK3LitaMR
 JkCLTjirvskXfZU5q7L3D4hVD7grz0FhrU4tUZ9yHnhsqUZmJhT2ZSqPrTl9EJFNZlaU
 Qt8+OvQ5jVgvLIVIH0O/yViloBe2+VzNeo1PJpZ6nqKxWGuFfTev4b3mNZ3SO8AQ9yEi
 19sbJYMgLzwq39Q/VNJIZ/w0JfeXSo6ZDUtsE3r7RsmPi62vy5VELFub8oJ5egTD9JQP
 Fp/w==
X-Gm-Message-State: AOAM532y57fVybQd7CqcaRzcumJykLEaRwiV7BIl0XduyIsA3IkrAPej
 MXxfin7+md4IVVZ8A7qse7Pcqw==
X-Google-Smtp-Source: ABdhPJzTVGNWaleTQSh+YFiBIjYiiP9jkSVe4o/dgjfeoHqArO18reePB839Dcw+cTEPcSVcVMp3AQ==
X-Received: by 2002:adf:e60c:: with SMTP id p12mr3991216wrm.285.1628154975964; 
 Thu, 05 Aug 2021 02:16:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y66sm4976594wmy.39.2021.08.05.02.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:16:15 -0700 (PDT)
Subject: Re: [PATCH v3 05/20] ASoC: dt-bindings: replace q6afe bindings with
 q6dsp-audio-ports
To: Mark Brown <broonie@kernel.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-6-srinivas.kandagatla@linaro.org>
 <20210804175334.GE26252@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <225bc8df-0d78-09d6-4dc9-8cc2145f095f@linaro.org>
Date: Thu, 5 Aug 2021 10:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804175334.GE26252@sirena.org.uk>
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

On 04/08/2021 18:53, Mark Brown wrote:
> On Tue, Aug 03, 2021 at 01:53:56PM +0100, Srinivas Kandagatla wrote:
>> DSP Audio Ports bindings have been documented with DSP services bindings
>> which makes it difficult to reuse them, so pull them out in to a dedicated
>> bindings.
>> Also as part of this change convert them into yaml format.
> 
>> This patch also removes q6afe bindings as dsp services are now documented in
>> apr bindings.
> 
> This feels like it's multiple changes stuffed into one commit which
> makes it difficult to review, especially since I'm having a hard time
> connecting the code changes with the description.  For example this says
> it removes the "q6afe bindings" but we seem to be adding some in the
> newly added YAML file.  At the very least the commit message needs to be
> improved but I think this probably needs to be split out into separate
> changes each doing one thing.
This patch is doing yaml conversion + removing the "qcom,q6afe" 
compatible from the existing bindings + header file renaming.

I agree, will split the header file renaming and yaml conversions as two 
  patches, that should probably help. I will also update the commit 
message with more details.


--srini
> 
