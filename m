Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CF838A24
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 10:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE1B85D;
	Tue, 23 Jan 2024 10:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE1B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706001593;
	bh=7VuZmFxUpB1lVSDCAJTO+tJjNkrL3UwBXwDgvhvIjBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIp3GR9q+Ysb0lUMfxWSTLQrvEJgrOI7ArxdZ5cwCY2cBLhfVuhlP55Nuh8sQRW1A
	 p2gRAxIoZvgCKfmKE4aL0V8ogTYM1otJI4E3YQ4lRQLOLHONp9VrAC2ZKuJZEb8x/W
	 eWckHY/4faW49WneMQlqsGc+C0eb52sq9SQtHBQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74594F8057C; Tue, 23 Jan 2024 10:19:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7D7F80548;
	Tue, 23 Jan 2024 10:19:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3E5F8028D; Tue, 23 Jan 2024 10:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85EA4F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 10:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85EA4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dd4Nm8+h
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a30e445602cso1459066b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 01:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706001545; x=1706606345;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBk1RWkyZJiPgH1O/EL2UlH0Vp2cg0BsBTQsF+HbtdY=;
        b=dd4Nm8+hwmuynZlxpwYDygR+gK00XaOV2dFS0B2ZUH7JiocN5u4yobIsCdsuodE4zd
         T+fSagRPCO7i5sWpYldKiIb+i14XXAmQ2CjLIykIrM2usZ/bFv+aPzZI6pD8wW09n/xI
         Rv+LnFe3Hsk6yToVv4fLplmu99c85nmSvedSTw4sH8cr34b3ax8zR6xknWxWYd749BBH
         /U2CouM+ORyKgvXbic4GDJCzFyFldJ5tl1USzQSS1/8Tm3Cw+IOpeJoOfIucg5EHN8i+
         TkJmTvGnnb54FQmKLtLNPLqh5sOFh7MYiR11pIuuvCQagowx1UNVU+eMYSg6wWGGSxmj
         l88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001545; x=1706606345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBk1RWkyZJiPgH1O/EL2UlH0Vp2cg0BsBTQsF+HbtdY=;
        b=QtEPUkIuQccPiBOHNMr8aixqfedFhvVrAshP5aw9huwtWFwKw1OQFzdy65SbyEE3zG
         8fWDJeqxfN5qkRJtKUzG5l917IW2dXujPsvQT97X67s15v4t3KY96S+29dmsNhL0yzlP
         RGcgetZyoadFb3NVoufxUwRTITW63il9eCoNsMirOrEm4Dt4RyBdQ8D+fZX/XFMVCryz
         HS27cy0Fo0BVe8JTODmd7y1Vzc9VsHVunRZhK6eyKw/en2cBcedlww+WHPHcwnwWMaBL
         GLhMgnHt33piAuSJ6wpm03ULCE9sgccLy16ZTb/6S1p6kRaXiKRcunRLl91SQX/7kG5l
         S8bA==
X-Gm-Message-State: AOJu0YycI1YvTZ3DVYrFTS9o1ZkV2t8OQsSou7cXokr1wjBvqW5JP2/X
	8vNJOduXuEGtUxSMLpVkOxGUfT4aPD0A+9uVX38Zc/NGj3jZ0a92jwMUKHlNqQAGMw==
X-Google-Smtp-Source: 
 AGHT+IHRUTpVvFWRf1iwvev0Rm6Uh+KZ4ise7148syZG/xVFOrpQRNim4YJA769VELvuqY15kf+c3w==
X-Received: by 2002:a17:906:8925:b0:a2a:c113:2677 with SMTP id
 fr37-20020a170906892500b00a2ac1132677mr4955188ejc.61.1706001545141;
        Tue, 23 Jan 2024 01:19:05 -0800 (PST)
Received: from ?IPV6:2a02:908:1980:b9c0::6a53? ([2a02:908:1980:b9c0::6a53])
        by smtp.gmail.com with ESMTPSA id
 tl9-20020a170907c30900b00a30461c31efsm2068398ejc.177.2024.01.23.01.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 01:19:04 -0800 (PST)
Message-ID: <98e5bf78-a85f-44c1-8277-20d90d6093b7@gmail.com>
Date: Tue, 23 Jan 2024 10:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Julian Sikorski <belegdol+github@gmail.com>
References: <20240123084935.2745-1-belegdol+github@gmail.com>
 <87msswmn3g.wl-tiwai@suse.de>
From: Julian Sikorski <belegdol@gmail.com>
In-Reply-To: <87msswmn3g.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2KK6TPS7K3GU2YNEYPWJ2LQXVET2OMQ3
X-Message-ID-Hash: 2KK6TPS7K3GU2YNEYPWJ2LQXVET2OMQ3
X-MailFrom: belegdol@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KK6TPS7K3GU2YNEYPWJ2LQXVET2OMQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Am 23.01.24 um 10:10 schrieb Takashi Iwai:
> On Tue, 23 Jan 2024 09:49:35 +0100,
> Julian Sikorski wrote:
>>
>> The device fails to initialize otherwise, giving the following error:
>> [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
>>
>> Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
> 
> Thanks, I applied now.
> 
> But at the next time, try to check the following:
> 
> - Use a proper subject prefix; each subsystem has an own one, and this
>    case would be "ALSA: usb-audio: Add a quirk..."
> 
> - Use the same mail address for both author and sign-off
>    
> - Put Cc-to-stable in the patch description instead of actually
>    sending to it now
> 
> 
> Takashi
Thank you and apologies for the mistakes. I will try to do better next time.

Best regards,
Julian
