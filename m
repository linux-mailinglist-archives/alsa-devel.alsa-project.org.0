Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947496FF6D0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6EFF07;
	Thu, 11 May 2023 18:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6EFF07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683821516;
	bh=izDcTD1cJMHLNKT06AIorcc1NjpvZuYHYf9lBo+LuX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ScVgPVAYu1km13aPNjx2GZvgxfPu5Ey1CZkMDjMSuiM7dK3rxLOC/hiPft77tmrFA
	 iugNfuelx9O4CsiT7KYvdl7D1v1XOHcdEQhCBkfnOVSs6tFS90PxQFuERdLW//RmfE
	 KYsm3MvbQT/HwcZ4fkePlmgX1yhPV4GY7TwG/R1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBEEF80544; Thu, 11 May 2023 18:11:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00074F8032D;
	Thu, 11 May 2023 18:11:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5531FF8052E; Thu, 11 May 2023 18:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BEF5F8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BEF5F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SLP0ck1o
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-61cd6191a62so39934696d6.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 09:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683821456; x=1686413456;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClXkDsvYbzoyZ76sBUquKB6r+7ukYTBpP2ycUuabvH4=;
        b=SLP0ck1oA/K1YcKQC2NNd97ncX/aiwU/LnwZXBIiCx0vKzT8QL1ELVdYaaw2bmo/ij
         41WH7gKdps5IUPsnPKl8VLqYRdSfAJSJI5PGa1fHTVidmuIznfsXYZ9z5lmtEMBxePIN
         U4sc4A31lcHrUZmhavV6VcJkU3+t0R0To0LRqbvtLcCOXSvYAr+6ceslrkrkFB3XhAlO
         w2q1kPPEDwEzNs1+rZGWWQ155l7F/B7pYjUOOoBMsA38B/U7DDmRx9Qvy9cOf632Rhmj
         II3HZiH8XmAR/iCSH3Bh/3lPaW95P0uH0YUxfjEM39N0/neLUUUrXwVo8pYvZBQcJOLT
         BEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821456; x=1686413456;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ClXkDsvYbzoyZ76sBUquKB6r+7ukYTBpP2ycUuabvH4=;
        b=MCSlXHDR2heuhhG9qlE8cmYMGwZeEMGuqXm3EgW8GJj7LteeWtx2tVmsnPwE6zhC6S
         AQifMnkiwp3OB3gR4j+CgASuAy+akfyjzUJdTDrexgTybJFHQ53xiZX1D5Ggy6pkOKxN
         1nKpSMw/ljZWbup+0juzZZym9PIodblTLRuGZuy4/P/gCm33SnuumhSxoOcWlYh6rooG
         AYLjbw2fd1rM22/C1CoLn9Bx1AvSrAl+NI8HvVY6FdQc5sFo0GqDCFiPCiWcFATPhuvR
         AXrQ20g0yOU5Bkxh4DbpCVWFFeWy0gugsFoCKGtmSA9Lzadl5irxr+uz/wnq1RHXv1qT
         nAcA==
X-Gm-Message-State: AC+VfDxcn/3y+nq74g4nEKSJKagE8iJM4E+xW/F3Ltz4VXTjSIGlDm0h
	T0rk/fQynSaqw8wP82t/mlk=
X-Google-Smtp-Source: 
 ACHHUZ7VXnLupG7mIGZwXK4ztWB6gRrAP8GuE/jCPB6bdNOknFkUasMg1CP7UM14iR3dVmTzUi92Yw==
X-Received: by 2002:a05:6214:4018:b0:5ef:3b9a:b01d with SMTP id
 kd24-20020a056214401800b005ef3b9ab01dmr27933969qvb.1.1683821455799;
        Thu, 11 May 2023 09:10:55 -0700 (PDT)
Received: from ?IPV6:2a02:2f0a:b207:af00::b5e? ([2a02:2f0a:b207:af00::b5e])
        by smtp.gmail.com with ESMTPSA id
 e15-20020a0caa4f000000b00606322241b4sm2372760qvb.27.2023.05.11.09.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 09:10:55 -0700 (PDT)
Message-ID: <3b242b34-703b-1db2-443f-84c1d6707b61@gmail.com>
Date: Thu, 11 May 2023 19:10:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: Add quirks for ASUS GU604V and
 GU603V
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Tim Crawford <tcrawford@system76.com>, Andy Chi <andy.chi@canonical.com>,
 Meng Tang <tangmeng@uniontech.com>, "Luke D. Jones" <luke@ljones.dev>,
 Philipp Jungkamp <p.jungkamp@gmx.net>, =?UTF-8?Q?Kacper_Michaj=c5=82ow?=
 <kasper93@gmail.com>, Yuchi Yang <yangyuchi66@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230509163746.6949-1-ealex95@gmail.com>
 <87h6si501i.wl-tiwai@suse.de>
Content-Language: ro-RO
From: Alexandru Sorodoc <ealex95@gmail.com>
In-Reply-To: <87h6si501i.wl-tiwai@suse.de>
Message-ID-Hash: KXYEF6637PF7YMJ6SZEM3HLMDXQSOZCF
X-Message-ID-Hash: KXYEF6637PF7YMJ6SZEM3HLMDXQSOZCF
X-MailFrom: ealex95@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXYEF6637PF7YMJ6SZEM3HLMDXQSOZCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WWVzLCBteSBiYWQNCg0KQWxleA0KDQpPbiAxMS8wNS8yMDIzIDE5OjAyLCBUYWthc2hpIEl3YWkg
d3JvdGU6DQo+IE9uIFR1ZSwgMDkgTWF5IDIwMjMgMTg6Mzc6NDYgKzAyMDAsDQo+IEFsZXhhbmRy
dSBTb3JvZG9jIHdyb3RlOg0KPj4gQEAgLTk1NDMsNiArOTU2MSw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7DQo+PiAgIAlTTkRfUENJ
X1FVSVJLKDB4MTA0MywgMHg4Mzk4LCAiQVNVUyBQMTAwNSIsIEFMQzI2OV9GSVhVUF9TVEVSRU9f
RE1JQyksDQo+PiAgIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHg4M2NlLCAiQVNVUyBQMTAwNSIs
IEFMQzI2OV9GSVhVUF9TVEVSRU9fRE1JQyksDQo+PiAgIAlTTkRfUENJX1FVSVJLKDB4MTA0Mywg
MHg4NTE2LCAiQVNVUyBYMTAxQ0giLCBBTEMyNjlfRklYVVBfQVNVU19YMTAxKSwNCj4+ICsJU05E
X1BDSV9RVUlSSygweDEwNDMsIDB4MTQ3MywgIkFTVVMgR1U2MDRWIiwgQUxDMjg1X0ZJWFVQX0FT
VVNfSEVBRFNFVF9NSUMpLA0KPj4gKwlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxNDgzLCAiQVNV
UyBHVTYwM1YiLCBBTEMyODVfRklYVVBfQVNVU19IRUFEU0VUX01JQyksDQo+PiAgIAlTTkRfUENJ
X1FVSVJLKDB4MTA0ZCwgMHg5MDczLCAiU29ueSBWQUlPIiwgQUxDMjc1X0ZJWFVQX1NPTllfVkFJ
T19HUElPMiksDQo+PiAgIAlTTkRfUENJX1FVSVJLKDB4MTA0ZCwgMHg5MDdiLCAiU29ueSBWQUlP
IiwgQUxDMjc1X0ZJWFVQX1NPTllfSFdFUSksDQo+PiAgIAlTTkRfUENJX1FVSVJLKDB4MTA0ZCwg
MHg5MDg0LCAiU29ueSBWQUlPIiwgQUxDMjc1X0ZJWFVQX1NPTllfSFdFUSksDQo+IFRoZSB0YWJs
ZSBpcyBzb3J0ZWQgaW4gUENJIFNTSUQgb3JkZXIuDQo+IENvdWxkIHlvdSB0cnkgdG8gcHV0IHRo
ZSBuZXcgZW50cmllcyBhdCB0aGUgcmlnaHQgcG9pbnQ/DQo+DQo+DQo+IHRoYW5rcywNCj4NCj4g
VGFrYXNoaQ==
