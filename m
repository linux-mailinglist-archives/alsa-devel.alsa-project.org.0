Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C075388608B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 19:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E293E21B4;
	Thu, 21 Mar 2024 19:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E293E21B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711045794;
	bh=zAYATeMtAMSyXywpEjHIrjoVSN0gBr394TEV8OH5uaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dm71QLO9F0wA8QfIWFITMnM5BtMs9khG6PotILhmzMNZG6RKwPLhjrS+J1vjl46qi
	 BoxXYjwuQA5k/toyANQ1p7i+aC5BlUD+Uq4yfrR9/7dFOo1YYCH2BHLP1wh+0Kaalw
	 1BnPB4tE+5j9T6IxAjNUokshA07OXxU03Cc4ZpUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CADAF80589; Thu, 21 Mar 2024 19:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 872E0F8055B;
	Thu, 21 Mar 2024 19:29:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 906ABF804E7; Thu, 21 Mar 2024 19:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CCBDF8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 19:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCBDF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hBOjIzIv
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d4a901e284so28531771fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Mar 2024 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711045743; x=1711650543;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vs5BZUwaXWyx9DjsP3hmBPa0Q/mMIBukAIBdGCnvVlg=;
        b=hBOjIzIvhnrtJzDXdc5biUa8ILtgltpQ6PEX0m0j+r9qbNLOsr0GzOpSfkdgGnjFYK
         N5vxTP9hGVU3lPVrV0Gbf4UeY7Anko99C/9rA8znVyQh3TXkEA6K4FbLaCwP3JdEAT9i
         f7reYOD2RTe6pb/CtUhwR1lTCbW6k8pM8eWOH314x7F1xqQSE0pEpV8iJDE1z0UytLgN
         HYn49fjpFTEoq02+rcu/k0R60aYxP+UsJj9yMoqztVkcCRYKIUUQlLmmJgio64FC+sN9
         LD457yRKIYzjylQK34cu5VU1aQekw1G+czhBInBU7XTYLK0MMp7jETSiEYLAYWDELSNX
         d20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711045743; x=1711650543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs5BZUwaXWyx9DjsP3hmBPa0Q/mMIBukAIBdGCnvVlg=;
        b=N03OuOo7sdGHGOcFz4VsTNVoXixaztncDWatoh7Jp1FYs4LchMLtVv71AE/0/RRXWQ
         hIChEcLkEfZDWUCvOGw1obZaiy7aTZHJ0tEbXQN21AvcnttjcLWKPLm1TDQpi7h3qLda
         6xkrcNhjw0uxEaWdJ+bk/f5pg81MJ28opju0Bt473hQAWudJCppq05SnGwbi0nbn4eeM
         0Hy+foOkN3B/Y84Ket8goVVeKScwDb7nuE0x0BdG2PPZDHXT5bNqdew3T14e+v19MAML
         7uraxrXjadjzaOTJiyJwS9d/3f75ZY7PlmfADbf4LEKuQ9lYLcb4oRNKQEJ8QtYfIaOA
         br6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW1bv3QjPui/wtqMNhpprFLEVh9dv/xEXhCBHlqID+/Ci32mUy0fKQC1iDjmHpgN7YoS+wuHZdz5POK4xRAIBvTrGK8Y39Yr2x+VY=
X-Gm-Message-State: AOJu0YxYrGfdGdHMklBEI4iTx7iPaUqqeluVJTSswJr+1lb65bpvCeMS
	g+3gopz+s2pTarliks8cCQKyYkxTuFgQaEYc2yInsNHEP4bf2AEF
X-Google-Smtp-Source: 
 AGHT+IHlLxV084PNF9KvdinqIY/5RnBQjRLaYTLjnsTeGxJShM01hzRIKLza1dnWvqk3W23qcD2dAA==
X-Received: by 2002:a2e:9556:0:b0:2d4:7004:ba8a with SMTP id
 t22-20020a2e9556000000b002d47004ba8amr259463ljh.53.1711045742805;
        Thu, 21 Mar 2024 11:29:02 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-76-118.kaisa-laajakaista.fi.
 [85.29.76.118])
        by smtp.gmail.com with ESMTPSA id
 p22-20020a2e9a96000000b002d45dd6004esm40852lji.121.2024.03.21.11.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 11:29:02 -0700 (PDT)
Message-ID: <e6994ff1-6c32-4dac-846a-5f4f18b2f996@gmail.com>
Date: Thu, 21 Mar 2024 20:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin
 during capture streams
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-14-bastien.curutchet@bootlin.com>
 <00182d1d-ef29-457f-9e3e-6e9b57592118@gmail.com>
 <0bb26153-8bcb-475f-8892-5eb925fec538@bootlin.com>
 <7925bbe5-17e8-42cb-a5f0-4f3e06810a90@gmail.com>
 <d20dc37c-13fa-43d1-af52-dce8d8dcdd75@gmail.com>
 <5467add6-0099-4e54-a4f7-12aa149d03c7@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <5467add6-0099-4e54-a4f7-12aa149d03c7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZNQGXKJMFBXX26XE5MUX5CHSY6T7XXJV
X-Message-ID-Hash: ZNQGXKJMFBXX26XE5MUX5CHSY6T7XXJV
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNQGXKJMFBXX26XE5MUX5CHSY6T7XXJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bastien,

On 3/21/24 17:14, Bastien Curutchet wrote:
>>> I think the definition of the 'ti,drive-dx' is somehow odd. It allows
>>> you to set it to 0x1234 and the DX pin will show 0x1234 when you capture
>>> 32bit. If you capture 16bit then it will transmit 0x12 (or 0x34?), no?
>>> If you have 4 channel capture then I won't speculate what will be on the
>>> DX pin ;)
>>>
>>> Would not be better to say that the DX pin will be driven low or high
>>> during capture _and_ disable the playback support?
>>
>> After some thinking, it might be still better to use the DX pin as GPIO
>> and either have a custom machine driver which would handle it (set low
>> when a capture trigger happens) or connect it in DAPM as a supply, bias
>> or something and ASoC would handle it automagically.
>>
>> I think that would be cleaner in many ways. What do you think?
>>
> I agree, that would be cleaner. I ran a few tests to see if that would
> work on my hardware. It doesn't ... So I looked back to the schematics
> and found two reasons :
>  * the DX pin needs to be in sync with the clock.

I'm not sure what this means, sync with which clock?

>  * the DX pin needs to be in a high-impedance state between two frames
>    so a pull-up can drive it back up. Actually, the DX pin is also
>    linked to the FSR pin so it provides the frame clock to the capture
>    stream.

Hrm, you are using the DX pin as FSR for the capture? Why not McBSP.FSR pin?

Looking back to the patch, one thing stood out: you are setting the
XDATDLY to 2.
You have some sort of T1 framing on the bus? The pullup will make the DX
line high in for the framing bit, right?
Or you simulate another FSR line with T1 framing DX?

The 'ti,drive-dx' sounds like a bad property for sure, you have T1
framing and driving the DX to certain level.
It is like DSP_A (1 bit delay) playing constant 0x2 ?

Can you use aplay /dev/zero and a DT property to select T1 framing for
the playback? Or that would be too coarse for timing the start of
playback and capture?

-- 
Péter
