Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729D729D58
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34198950;
	Fri,  9 Jun 2023 16:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34198950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322349;
	bh=lHn97RWkSBDgcIRxA2jfnsNCE/0l9/MxzCnsnieZfRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRRC/IL0aBoL5djsnsqQjewK6uOKUVHZqzyN9QErboAgbyFe5pMRLq5UkGcR/7+a4
	 SZa3orlGcdExl+T9KhBvSJ5KPyR+jhsuFWgvSGT7y+X2pQMEHcRBtrF7ca5rb0vSu3
	 BvyIWiSUO/K930Ii1zQf81i/UW/bnikSwnhFCNVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53352F8061F; Fri,  9 Jun 2023 16:47:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82307F8061E;
	Fri,  9 Jun 2023 16:47:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97670F80199; Thu,  8 Jun 2023 12:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDAAFF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 12:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDAAFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=4tyzkukr
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f654d713c0so150835e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686218455;
 x=1688810455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsOWfs49wC5N4v4NWtXmUnjFbzqZWXOVySuGPn3htMg=;
        b=4tyzkukruKe8ZPA7RPnB00YrCnc3YfBJt40uG0nLFHL/S2MxEM1ID/0mg1wM6qR0Ap
         O6/bzxhLWfWakDYYZSaELapb2cid4mN9Qnf2sxD64w4Inu9p5V0q7j0Kb3j5FjK6MiEi
         9rSVcTKSTVnpx2CbhZ1k9pwKoDK+tf+kjFRRemHmgKPM8VlM5XJXahH2nLusHzlp1cL2
         lJ+1UPZmC9MQjEgSw97kO1BYmj2wLUR5IIp58Ih7u9fTwzaxTuQ6ZQQfqXUg6UNVatUT
         AKCn8JIS+6M9f9RI39+UNwbBbt1dKCMmz6jGVlDbdIifcAXhzBsnbyl6U4DkjmiB+V+E
         C6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218455; x=1688810455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsOWfs49wC5N4v4NWtXmUnjFbzqZWXOVySuGPn3htMg=;
        b=kVlRGZ/RVRGeBHJyRHEVXZBHsZPZttVC9U0G1NRJil34ckW6I1ob8DWomfJHujZQME
         CzkcUh2J7DsysNqAV1HweAvBXT7oVt0O8BJrN3O9JeGqvhFpxTvqGlU9jLgXGlklNe5D
         QilwBFr3Lxdx3n9reASRGAa8dceOq1bMIiCMa3tctslYL+kNCGPZDqldBwa19Qd70Siq
         BoNebbujRC/hB5wBcr9k6KxVx3bf/3xXhvGA+UzqrjwvyME+q0gsjppNcbF5JMM0U3oP
         Ah1HbpZ9lm0zEC/2nKjVFi9kwXuNUoseImNmQPWiDUO1vEado1MmNcAFnF1ugPu6eHu2
         u+eQ==
X-Gm-Message-State: AC+VfDz3c6h96zHG5ldfoAkt93UwpgFGN+UBLFa5olj0KNrCWrCQ3NE5
	dNJhD0+te34Xycw9oLyY00EVAQ==
X-Google-Smtp-Source: 
 ACHHUZ7LlWK64M5lFh/5PM74dhnqSCP79zYgwvl4PUklZhQtn1sfsWVhk/BVkBSv4bhXZyQ+/Lckrg==
X-Received: by 2002:a19:a40e:0:b0:4f1:4504:2679 with SMTP id
 q14-20020a19a40e000000b004f145042679mr2891573lfc.41.1686218455474;
        Thu, 08 Jun 2023 03:00:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f60eb72cf5sm4786261wmc.2.2023.06.08.03.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:00:55 -0700 (PDT)
Message-ID: <f4547bf6-5e95-331b-5d8e-b6d71209859d@baylibre.com>
Date: Thu, 8 Jun 2023 12:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros
 for registers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
 <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
 <a8b454e3-dded-02d6-b97a-6a7aa3420cf1@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a8b454e3-dded-02d6-b97a-6a7aa3420cf1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WCDX4T7OX3WLBNXZWRENIA3GGOZUROIO
X-Message-ID-Hash: WCDX4T7OX3WLBNXZWRENIA3GGOZUROIO
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCDX4T7OX3WLBNXZWRENIA3GGOZUROIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 11:57, AngeloGioacchino Del Regno wrote:
>>> -    int test_done_1, test_done_2;
>>> +    u8 test_done_1, test_done_2;
>>>       int cycle_1, cycle_2;
>>
>> Shouldn't be unsigned too ?
>>
>> I'm wondering if it would be better (probably in another patch) to 
>> change the data type of the other variables too, to match their 
>> use-case. (maybe it's already the case, I'm just wondering)
>>
> 
> In theory, yes, cycle_1 and 2 should be unsigned, but the signedness of 
> this
> variable is getting used in the calibration logic later, as in the for loop
> they are both being reinitialized to -1 ... so I couldn't just switch 
> 'em to
> unsigned.

Understood, thanks for your explanation.

-- 
Regards,
Alexandre

