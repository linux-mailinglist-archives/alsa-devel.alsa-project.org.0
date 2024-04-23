Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF8AF360
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 18:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CAA11060;
	Tue, 23 Apr 2024 18:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CAA11060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713888068;
	bh=3Qvx6ZIZdmr8NJplnmb0hbaXLf/X2TLHnkAAFtsM10Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TALmrGy7yB2HPbkVSgOs5wpxzCyU1j2x2wHkUIoj9kZtVO3SNU6G/3ri78HNVvqDM
	 GpIivbJsewFEEQ2hZ6BCvket4xnvPEnTHJLOxIB0P7bz07eG6vcJfye/O/xzNXOM5a
	 id6UrS2HtNs5AoCl54XIr495m8Q/rxBJ0AY9lwGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E365EF8057D; Tue, 23 Apr 2024 18:00:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70703F80589;
	Tue, 23 Apr 2024 18:00:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76CEF80423; Tue, 23 Apr 2024 18:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F90BF8003C
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 17:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F90BF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AQBDRRrQ
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso78988271fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713887998; x=1714492798;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVOk/dzku39M7HZHzSD7vBdGj96SEMQyCyLR6xoJWus=;
        b=AQBDRRrQ/6KUn8+V0LhOUQv1smtjWCwTtX0n71tS8LjG5AqDL5f8dlvuZVdXSeZpC5
         anVJekgErl3cprUkwIjLXnpCthLU76EiNozNGVN1fKNVSTut0O8rVH3CDGMaBw/aFbgP
         1TWKSO9DHkUJRwZgVgnqny+pZqFinbdCHUMMEoWMBlZC+yvvaxRLPSjkPDjOJ1gMdkfb
         bBon05U018ERatM9mkoM6imBnyljtDL1M5dT1swIVHI5GFXMxZWYLNERlRQLPcpsiQ4d
         yxM8tzMcw7xOIaViRTEsvj2xU6iiPnrXGm4DNot6DcBsJTelboN6LuIDp/fLmWhWxeQc
         wvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713887998; x=1714492798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVOk/dzku39M7HZHzSD7vBdGj96SEMQyCyLR6xoJWus=;
        b=qV7fGCNC5VSU5PuyuwfOhc8RxnJv0+B6vbOwupYhU4udZRjshdhEwdg3SQcBRpxU7r
         TqfhtbRq370LQ910IDm09DlYMNGhC1HPsANu+DEgQYR61UJtutcjK8JYjIUbsXFQhkPd
         AVEYEnXkTXeTJWHBHw2YdxJcxgosIqCMVnSXR2ieMjH8PVOhK2EolpRkOjMGtykVnBEo
         IfHcFC7wD+Ca6yU15vBhOQGbIuyscvhEerPRk+hX8ZMnZW6QMv0fH5S9N3oA9yhqd6ys
         DZYDWZwDqYJgsimIx7j58J/wZCezLdAYQQSd26LOsIgJ5wRRyBzk0j9rw99LrQrTgbE8
         76jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVjIfTqSOQUSUJfXyIpydZFD4f4imDdpofc3POF6qz9DPsIiOR9ujeAHKMxzkvhU+wInMVej9OCFWEAtr2bro/CVwsqzV3sN+b1Ag=
X-Gm-Message-State: AOJu0YyDv7Xka7MRvKdgpf1qHp61FRi//Oarr+IUWRp0DhG+4Az9trxf
	nXFUJ5lfqgvx+wlcSMrvlUuLXgJzXcqFAyBIW/CJV1xTY/F7uNFksL8Qocmo5GU=
X-Google-Smtp-Source: 
 AGHT+IE7rfyobENugLknJtFA4JtMXmdI87sZdOD2xUpd2VfgYAUPzUpKbTcfy6qEYe07Zp9bNAsYCg==
X-Received: by 2002:a05:651c:1682:b0:2dc:bd10:2944 with SMTP id
 bd2-20020a05651c168200b002dcbd102944mr7462872ljb.53.1713887997962;
        Tue, 23 Apr 2024 08:59:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 bi8-20020a05600c3d8800b0041a9c441f69sm4188267wmb.16.2024.04.23.08.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 08:59:57 -0700 (PDT)
Message-ID: <fc3d849d-3a7e-439a-8d71-2b70ac75ae86@linaro.org>
Date: Tue, 23 Apr 2024 16:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <ZieihZRKe7OtP-nV@hovoldconsulting.com>
 <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
 <ZifMlc_rLV6_LhUy@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZifMlc_rLV6_LhUy@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3X6ECXV4BWBHBP7JXYED2KG4PRJ3OAEY
X-Message-ID-Hash: 3X6ECXV4BWBHBP7JXYED2KG4PRJ3OAEY
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3X6ECXV4BWBHBP7JXYED2KG4PRJ3OAEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23/04/2024 15:58, Johan Hovold wrote:
>> It is absolutely possible to run all the streams in parallel from the
>> Audio hardware and DSP point of view.
>>
>> One thing to note is, On Qualcomm DP IP, we can not read/write registers
>> if the DP port is not connected, which means that we can not send data
>> in such cases.
>>
>> This makes it challenging to work with sound-servers like pipewire or
>> pulseaudio as they tend to send silence data at very early stages in the
>> full system boot up, ignoring state of the Jack events.
> This bit sounds like it can and should be worked around by the driver to
> avoid hard-coding policy which would prevent use cases such as the ones
> mentioned above.
This is not simple as you say. We have to fit these into a proper DPCM.
Either we have a dummy Backend connected for each of these pcm 
sub-devices when DP port is not connected and then switch back to DP 
when its connected.

Or somehow find a way to not let the pipewire talk to devices which are 
not connected.


thanks,
srini

