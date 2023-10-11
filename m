Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D947C93CD
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC2CE7E;
	Sat, 14 Oct 2023 11:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC2CE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275797;
	bh=Jz4OlK8SO7WuNQt+Df4xaT9gbzfEepuwWgV21H1UNuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JLgCmryg2tGzwa38XwIfEZqfPkRFqnixCsORRUab2AXUdYVrIzhni8R63VbtGrPOn
	 KFrKP4O9y3ll/LogqWdjrTea83i3AWkCj8V93RWxHhiDEbi1mnYxvnWW/tk80jPGaE
	 BdHUblSrPha9vZO93aVrft3pdRzz0jquhVbZHlr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8588F805C1; Sat, 14 Oct 2023 11:27:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5CDF805B2;
	Sat, 14 Oct 2023 11:27:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B2A2F802BE; Wed, 11 Oct 2023 05:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2966F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 05:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2966F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ivc8Er/d
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5859b1c92a0so4796137a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Oct 2023 20:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696996737; x=1697601537;
 darn=alsa-project.org;
        h=in-reply-to:from:content-language:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEyu6E8jF0cZwmaZteltmY/shCbPk8pZ1SswHOZY1R4=;
        b=ivc8Er/d1n9hfFg+mrE3hrYEfvowf+q1mBR4ISSQ0y4csnTv7ud+5zqA4Fwcosc7Iw
         2C1oQE22RhKs1EjWL09f1zw41bEHccRiDdPqpB9ew6dvtid931acLlljw8EZK57KT8+o
         g4mnQM/0O3rzNB0sQ4rI2htGmQR2FdKfvWj3DXuLissXpFkc/TfrYVo16VvNDNEqAwwz
         zVOJQlAWalkPziOmUtK3ogkn8TuSuEdoyCra9bO6fudPmEZ5c6mxqwpt/oPLWOz6pBtB
         +z9asmnjKXNvEkfYs/VvtGYMvZwwduaI6CbY1BRMVuZcrIh/Eix/ZLBGNJt83zWsmpLU
         ciEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696996737; x=1697601537;
        h=in-reply-to:from:content-language:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QEyu6E8jF0cZwmaZteltmY/shCbPk8pZ1SswHOZY1R4=;
        b=jG4E/BxP96tz0x9fVUDS8fPUI10BwhXoxkBupwtZPlNEvhEF4HO+KoWyKzH3hjQh75
         k/32hJHB6VReV/sw4s0BISzJD8F6hfZVh2OsIzEUbxD6d+KnXi0tBoMwUKNPbEwH3PTJ
         B6ALGOiwZZmVKrE3qqAtCRx6ZV7bCLsbPNkeYkLM9XCq8NrvuKrioLtJKFxT93dVCxwO
         EkWqbR+S45THcDzbDoleDUwiRqDkyMvZft+wOZqP4flen/rkXMWZDk8Hto/rj6+RxhEc
         fT4ZfuKy+wxrYyKkFkONFwSS/1HcZMUCYhpprO7PhtJRMCeKnbb/xZiUsYoBq2dM0Xu6
         t10Q==
X-Gm-Message-State: AOJu0Yze7N3YOBG6oEMLc+UXpQDN/XcPkbNyr+Vc2Oew426uHiRk2tQU
	W0uEdQrW3nOyK7zbuJVkLNY=
X-Google-Smtp-Source: 
 AGHT+IEWwp4rl+923ewnlWsBDSDre4takEfOg5ZojuT3s27P8A+vin7amYwKBjYsL7zpFOenVqV/5A==
X-Received: by 2002:a17:902:864c:b0:1bd:da96:dc70 with SMTP id
 y12-20020a170902864c00b001bdda96dc70mr19381021plt.49.1696996736959;
        Tue, 10 Oct 2023 20:58:56 -0700 (PDT)
Received: from [192.168.1.11] (203-174-143-14.can.static-ipl.aapt.com.au.
 [203.174.143.14])
        by smtp.gmail.com with ESMTPSA id
 jf3-20020a170903268300b001c755810f89sm12678359plb.181.2023.10.10.20.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 20:58:56 -0700 (PDT)
Message-ID: <c857c071-27bb-4b4c-936e-716946126b65@gmail.com>
Date: Wed, 11 Oct 2023 14:58:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hda/realtek: Add SND_PCI_QUIRK entry for the Dell XPS
 9530 laptop for dual speakers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 brett@worth.au, alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <9c7b08fc-7f00-4894-a5b2-f3fc5f99e022@gmail.com>
 <2cfbeaab-9bdc-499b-8525-2296c0481cf4@linux.intel.com>
 <46f10d4e-4de4-478b-939f-9d0fc2dfb04a@linux.intel.com>
Content-Language: en-AU
From: Brett Worth <brett.worth@gmail.com>
In-Reply-To: <46f10d4e-4de4-478b-939f-9d0fc2dfb04a@linux.intel.com>
X-MailFrom: brett.worth@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RU5F7QCFC5S7BRNGVG2ZCAW3J76OOUTN
X-Message-ID-Hash: RU5F7QCFC5S7BRNGVG2ZCAW3J76OOUTN
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:25:25 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: brett@worth.au
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RU5F7QCFC5S7BRNGVG2ZCAW3J76OOUTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMTAvMTAvMjMgMDQ6NTEsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOg0KPiBmZWVkYmFj
ayB3YXMgcXVpY2ssIHRoaXMgcGF0Y2ggZG9lc24ndCBzZWVtIHRvIHNvbHZlIHRoZSBwcm9ibGVt
DQoNCk9LLsKgIFRoYW5rcy7CoCBUaGlzIHdpbGwganVzdCBoYXZlIHRvIHN0YXkgYnJva2VuLg0K
DQpCcmV0dA0KDQotLSANCi0tIC8pIF8gXyBfL18vIC8gLyAvX18gXyBfLy8NCiAgIC9fKS88Lz0g
LyAvIChfKF8vL18vLzwgLy8vDQo=
