Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78C7A94AD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36536E75;
	Thu, 21 Sep 2023 15:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36536E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302614;
	bh=zMZcNWK9HNfyrc1rkicahXZTiS+QWThMbaBf2CDi/NI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gxcoggNQlrPg2C8iiDXox/FOnz758rp8dRALACc94vInV2uUWibVUqKSkmcFDX6xq
	 EwvRiQ3gogvBzJIyGS7EgxKR91gHVdmuiIAWHoIteM9aeiQPLSciF0vJzWAw63Cdml
	 qAFdBCwZGeO6NL08dvQt8lJnS30FFY53+KH9oBNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B760F805B4; Thu, 21 Sep 2023 15:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B96CCF805AF;
	Thu, 21 Sep 2023 15:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D6F8F8025A; Tue, 19 Sep 2023 19:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74EE4F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 19:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74EE4F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D1eSSIVD
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40506bfca64so8981545e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144229; x=1695749029;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uv9oI1kx1D03B9nZ62QaXDHAZdBJSbt6nu5tpkEgEhM=;
        b=D1eSSIVD8K/fd91kXruc2tMra2Ymq6DRPAMS4BxLvQJjd/kZObuZsyvMk4OUXQRk1i
         P5An7Ft9rgq0mkkUjdMgWVek/wsRqMUfA3pjaH0rzzk0UzLLf74iuu9X4KctqoTDfLG6
         jG0hC2UmKXewNk4ZRhjjyvwWyRYtExzFbXi1OtRiYKjlN8ZQixB+PKCDr+tosgqAbc58
         EHGdVuau4vw2xwIifXAP81RtRZ9OhRMa1JMdvPWx23N5bZT+GKrXSdseTUwQh+ybKe88
         fi+8HJaUKjSB8hbK7LOe7rMhdSzsIxe91T/4qKj9N27jZCkw1WL7mpYZ2vQ5IJiZ72SH
         F94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144229; x=1695749029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv9oI1kx1D03B9nZ62QaXDHAZdBJSbt6nu5tpkEgEhM=;
        b=POYhmjdaGANr6Xa00GhFz7hKJZP4sbuwYhy6gf9nZo9A9hMoEumDQUyuihgDhloiOQ
         gHymVFLOOkIOvIAoQvqzabQPtCRsePuQNDG6PBfcpIuglG+rV63JZ3jyuP4jjMJ6Qeuy
         NC2z0O4IWAbioZpAipjcRxfKcP3i9GnkpANQs9ngQSIIT/JV0qxsZ2aYmQDsSA27Jbqv
         +RqMEqZc+rXcmq/1mPql3Bw0e/KHKnds0M9HuSEU710crEt8Rf5xHGlW1FT5/eEtPl0o
         V+KhSF98QW2Azo2Qa3RrYLAAT+8QT+zQqO6ZblIXGCEftV1HjvV6wviXp7Mb2I9Z8125
         078A==
X-Gm-Message-State: AOJu0YyCrbYa+w/VCZxTZ+PwLBDPl0028X/vHfyjkhDfeCg0dUcOp0/9
	R3NyMiSdEtlLTtwHfQeyBmObLftQt5Q=
X-Google-Smtp-Source: 
 AGHT+IFbuYLnQDU+g1YuQ0nUvdT/9Kj7fr+QDbe9EoyulaT930lf1yy5Za03DAYAyZkDFaBPLs0v4A==
X-Received: by 2002:a05:600c:4f12:b0:404:72f9:d59a with SMTP id
 l18-20020a05600c4f1200b0040472f9d59amr412653wmq.0.1695144228965;
        Tue, 19 Sep 2023 10:23:48 -0700 (PDT)
Received: from [10.0.0.25] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a05600c21cd00b00402ff8d6086sm15748972wmj.18.2023.09.19.10.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 10:23:48 -0700 (PDT)
Message-ID: <5e729667-f08b-d358-eff7-65c5d88e4352@gmail.com>
Date: Tue, 19 Sep 2023 21:23:46 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
 <2023091955-dried-popsicle-f3d8@gregkh>
 <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
 <2023091917-zippy-alienate-3efc@gregkh>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023091917-zippy-alienate-3efc@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PLRYQCQFJNWHNCTM35VALFXMZ26ECK4O
X-Message-ID-Hash: PLRYQCQFJNWHNCTM35VALFXMZ26ECK4O
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:21:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLRYQCQFJNWHNCTM35VALFXMZ26ECK4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/19/23 12:53, Greg KH wrote:
> On Tue, Sep 19, 2023 at 12:46:34PM +0400, Ivan Orlov wrote:
>> By the way, is there any way to detect such issues automatically? I've seen
>> that the kernel test robot detects a lot of similar stuff, perhaps there is
>> any tools/linters which can be set up locally?
> 
> Not that I know of, sorry, I rely on the kernel test robot for lots of
> these things :)
> 
> But, the robot is running all open tests, so dig into the public repo of
> it to see what it is using and perhaps run those tests locally?  Lots of
> them are just different build options and running sparse.
> 

Alright, I will take a look on the sources. Thank you for the advice! :)

