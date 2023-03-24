Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA86C7819
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 07:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707A0EAF;
	Fri, 24 Mar 2023 07:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707A0EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679640327;
	bh=SxCTHbZjYVB5iz0oHfFGj2NdMETYHYd97m7RFFDOs4c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mgOGQVf5sRTczF5h/BduUNC5Dc1PZg6gF8ainknWYl/s8h8/FJoDg/OtO7qsMxrgO
	 qpASWLeGDmLjDR7plXH/5jGJANkvtX/eIznbD9Qc7FA+UJL9LVlRy7UkhphcrvXu8x
	 P6bz3TJjpYt30HMt2OPacDux+6ggQ4MWSCt6tBJ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 688ACF8027B;
	Fri, 24 Mar 2023 07:44:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 698FFF802E8; Fri, 24 Mar 2023 07:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D1F7F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 07:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1F7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IVLY4ihY
Received: by mail-ed1-x52e.google.com with SMTP id b20so3995114edd.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679640222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgbEes8ceG/tgVaAXlVTgP+CsmCv+C77+gH5pG0psKU=;
        b=IVLY4ihYnrndXdYOkJDh+BcgYmhsm8NV81lXqqFK+2D/qIjD5oSO8COFkDO9Rp2NET
         NxrQe0JWjOWFPByQZyryFugPTiR4WfnkaNb5+ttulTNUah5C6TCRUCH2FgdtQLi3ITyV
         N6YrR9CDjxNZeQ5Upg5GRGMxUJetIzygEWo96dQuZRhO60P9ZyfGK16JI4gxclMn4SUZ
         8fByWAWY7OaLJ9yT8krVUlNIezGuPzdr1JyDSLzizOwfrW8VpV/ovNo9so1mvBw+qvU8
         6D6kjOZkGxZ+TWn4+501ubpVbYtzhby9PweeDFgS466GU5yIF4pmls7aBJROCyRqzRAU
         4CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679640222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgbEes8ceG/tgVaAXlVTgP+CsmCv+C77+gH5pG0psKU=;
        b=oNR5i9uvi/BV6vuEj9pP59NrT7jfDdtWyLlkT88hEu7oq2JNE9jXzfLZR7wB8/6PGw
         vNnC2tOznj6+jxzmNBtol5bjV6wMIXI+/tmbkpZaveO3XXj2a+c49mmEnrjeI6syIDhZ
         jjBmOJKS6T+tAWLxM9HyDQEDo9US2iKD/Q4WOnGYjdNfsP1yuGGQZh1BEsBehoT/m9t/
         z77fMvs9yYvLCrFQgEX3PCS4kB+C8J3agh8HK2k+7aEh9GXOvV4XMn8Tuof+aUFrz1cn
         tmnvHw/c0WfFDfyoMlv14ZbhxFBZetzcPSzS+oOyPBqMmjt36IhKdRsmIHEBV3JPQHtG
         9zXA==
X-Gm-Message-State: AAQBX9euXuXRrkxgpVodAB5k1cVRyy0aqbAij9p7X1jmHvKICBuKMPHF
	noCx+5AHUdtmWBq8q5whfqCujw==
X-Google-Smtp-Source: 
 AKy350bupkWhK9wHoFfP9guobvfEexGlu6Qt6let3DJABjnFlfznwyic3HUOKnPkz25A7qQOzT8sEg==
X-Received: by 2002:a17:906:507:b0:907:9bda:93b9 with SMTP id
 j7-20020a170906050700b009079bda93b9mr1549066eja.17.1679640222055;
        Thu, 23 Mar 2023 23:43:42 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 bu6-20020a170906a14600b00933c52c2a0esm7236006ejb.173.2023.03.23.23.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 23:43:41 -0700 (PDT)
Message-ID: <4b448582-fe11-7f24-36ac-16fd8a22c139@linaro.org>
Date: Fri, 24 Mar 2023 06:43:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <5dc11c47-bae6-2f4e-4ffd-58c4f462fd68@linux.intel.com>
 <101cfc2d-59d7-4f37-9dd1-e83d1b803bc5@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <101cfc2d-59d7-4f37-9dd1-e83d1b803bc5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XMJOC2WJSKNC5KTZ7TWWSTSB4M4NZ6LQ
X-Message-ID-Hash: XMJOC2WJSKNC5KTZ7TWWSTSB4M4NZ6LQ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMJOC2WJSKNC5KTZ7TWWSTSB4M4NZ6LQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 24/03/2023 00:14, Mark Brown wrote:
> On Thu, Mar 23, 2023 at 01:11:11PM -0500, Pierre-Louis Bossart wrote:
> 
>>> The trigger is run in atomic context, can you really write safely to a
>>> SoundWire device there?
> 
>> Mark, I've seen that comment from you several times, and I wonder if I
>> am missing something: the triggers for SoundWire managers and dailinks
>> are typically nonatomic - at least for the Cadence-based solution the
>> trigger is based on a bank switch that may happen with a delay and with
>> a wait_for_completion(). Sending a command over the SoundWire channel is
>> also typically not atomic, there's usually a wait_for_completion() as well.
> 
> Ah, you're setting the nonatomic flag on your links to disable the
> locking.  The default for trigger operations is to run them with local
> interrupts disabled.  It looks like at least some of the Qualcomm stuff
> does that too.
Yes, by default dailinks are marked as nonatomic in Qualcomm case aswell.

--srini
