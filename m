Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72C768392
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 05:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7C7827;
	Sun, 30 Jul 2023 05:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7C7827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690686409;
	bh=NmFqw3ClJC8ZKIW+Ntxv/sD5fiIGSbDFCpUH4Trv+Kw=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AHpWfBd0EsRfrBLF5XiXsOQf5S0rYv7JQOq+yZLaHxcv1uJSYxCpcmssHQUTyZ7YI
	 9bM/onYssIFn8qDORECULhbpU3vJP/zTlu33DCU7V60cp/2cuALbfoo2J/o1hq1NjL
	 fQekBVvhfGqAc0hxUIpjtE7A5hLxXWLownCIKElU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B796F80520; Sun, 30 Jul 2023 05:05:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1571F80163;
	Sun, 30 Jul 2023 05:05:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB44F8016D; Sun, 30 Jul 2023 05:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 987A8F80149
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 05:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 987A8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=V80Q/pOE
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-55b22f82ac8so2947170a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Jul 2023 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690686284; x=1691291084;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNcYqtQlXpQKPqeWxLmdg5dB7w855CQ3qgqSePzZ6Tg=;
        b=V80Q/pOE5gi31O/Ld769fJM8GVmaqF7lBAFN8Aal93hLdUFkmtWzREJmQuqyANl1J0
         B+ZCnnTsWtu2q8OLTaNRS7fF8gYn6oOO8/fYQ5GTyH+k5nUKayJCj6sVLHomDE4dTrst
         AJv7tJokbaBnzaasAzokAPT8BekdY6YOwKrtri1I9vFgKWyLtcfeS1YTjacsTDoHbdZI
         E8ox6wHB3q9dlnmC/MvvsFO0D8KQG0nAVG/OKgpQaIrap0CTn34J+nY3gTkCE8vnNIGg
         HclzpcPbqkpSJGH8g44BjcTf576rEHl2rpjMnfOM5gSSB1GW7UaIPNprCgfnNamyhAIC
         AO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690686284; x=1691291084;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNcYqtQlXpQKPqeWxLmdg5dB7w855CQ3qgqSePzZ6Tg=;
        b=iHBGPioo31DdoKZdOxZ7YbQCsFBFjgIhp0ZFCvY1e64nmigMWLKwmXq1ixFzjW/l0p
         8IbuZd6h+9G+j8VJy+Eojufcl+nWNlpAekdxptN5sO39UJRRQOZpr0UjbZgS9iZHDbwn
         lngzNFiENlQ/n7cLbKYwZM9v/tdQ+DY7Cerk2FmLqwRsv5lK0ejtfTevQY+whgsUBn0l
         kVzUknT44j2MnN8zonG9Wmn2RKut9nEU4InFyQbT/V9SRY4lou+EmdEV2s+h0fxTrGi5
         /OmqdUjzgAlf/xnbBTUd0x0NpUqCtbN5Lw0DMjsItcZTDI5ZSRKVs/QBW02mo3epqx1O
         8Vxg==
X-Gm-Message-State: ABy/qLb3ttV+zRmdJzwfAh0L4LBdhKwyYmB5i+XmkUH5FOtPuAUV8jj4
	GrAUbGrkwNZfhotBgHHX3ow=
X-Google-Smtp-Source: 
 APBJJlEpO6/wwlipyMenNK9nps6iI6rK9vIpM7B0kVPpxXFeMalJXL1819lt+kwARIorHBfFhk7fuw==
X-Received: by 2002:a17:90b:3e83:b0:268:4716:d0cc with SMTP id
 rj3-20020a17090b3e8300b002684716d0ccmr7274474pjb.22.1690686283632;
        Sat, 29 Jul 2023 20:04:43 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 jd6-20020a170903260600b001b7feed285csm5899909plb.36.2023.07.29.20.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 20:04:42 -0700 (PDT)
Message-ID: <9759f20c-cb24-dde4-cca6-f893033b7802@gmail.com>
Date: Sun, 30 Jul 2023 10:04:39 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Conan <formyneeds2@tutanota.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Lenovo Thinkpad T490 Microphone Noise
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZJEBHBTIK272MU6AAT6KJJHV7KWVKAJV
X-Message-ID-Hash: ZJEBHBTIK272MU6AAT6KJJHV7KWVKAJV
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> I have reported this issue to the Arch but they redirected me to here.
> https://bugs.archlinux.org/task/79245
> 
> 
> Description:
> When I use microphone for online meetings, my sound reaches them with a high noise that prevent it from being understood. I tested the microphone on my own and yes the noise is there. I tried pulseaudio and pipewire, but neither has solved the problem. This problem is not stemming from hardware since I do not have this issue with Windows 10.
> 
> Additional info:
> * pulseaudio: 16.1-6, piprewire: 1:0.3.75-2, kernel: 6.4.6-arch1-1
> 
> Steps to reproduce:
> 1 - Open a chat app/website or online meeting tool like, Whatsapp, Signal, Zoom, etc.
> 2 - Speak to the microphone. You can use Whatsapp and Signal to listen your microphone sound.

See Bugzilla for the full thread.

The reporter chose the incorrect component when this bug was being filed
on Bugzilla (only generic `Kernel`), hence missing sound maintainers
and I had to forward it to the mailing list instead.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217730

-- 
An old man doll... just what I always wanted! - Clara
