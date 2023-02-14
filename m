Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6266960B8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81315826;
	Tue, 14 Feb 2023 11:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81315826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370480;
	bh=y+1SrtZh1SYMh/rPHRgBUoCWXycjFe1fQ9arGjETOeI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IwKmqi8uRpWdW/Y7VBQUl7EHikRJ7lki8UDXXWPrqu1cPSqZdBf1dS0496uKdTOXl
	 IOz3rZCOfH5jIu5Fu+BZQH4peBWswIUUYFDA14Jl+YVtznsP59KmpsPCTUUssNXaKs
	 /QtB03pOOxPjH53H78tYTUAaJTA1T+05ilyge5e0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2965DF8001E;
	Tue, 14 Feb 2023 11:27:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6A3F801C0; Tue, 14 Feb 2023 11:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9FA0F800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FA0F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=q5LCfPQ1
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 91B133F16D
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676370417;
	bh=AdLZtxAJ2gGpEWWnY7Mx63xDdGK8/99Or5btaUZoUwI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To;
	b=q5LCfPQ1HaZ+oEEngkWyAvpyB+hSS9QoRgsPvt5A2SQajzeLGpM7j0fzo8fT6RjXg
	 KVKGbyUKsjydBMCqCY6wMDnGWfDMNsoLKqdz8nCT2Vv/A3w0X100Qw+1uvvv+DCjr6
	 sqN1lYWA1spSenjaSG4Rb9fSwYi8km059xeF2926uU9rv+jOCoGh3lOLn5g155dOU7
	 noemzd5LVOrwmlDkKy8BkydTVYetNdxO/ZLbKB3C7ELTxw785JScHEmfiZ8ZEnCVJh
	 2pxEOnhoCIo5FakTBnAKhFiNpRJfhjWsbLFVUF3/4+3VT+NTOSC5CCtt3P8kL7VmnZ
	 iKAwykrCTvYfQ==
Received: by mail-pg1-f199.google.com with SMTP id
 i189-20020a636dc6000000b004fb98476498so2308199pgc.8
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 02:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdLZtxAJ2gGpEWWnY7Mx63xDdGK8/99Or5btaUZoUwI=;
        b=u6R4HiprmHFRvhDL/1sLrrMeEJEUFS5uiN6gNrDj+/3T2x8wV6FzH78FIqA0Gcwt4n
         ZAHdmWMI+uYJHf5cC5vqG+R4wUsNhF6h/kvk4oXFQ8a0g6FLGrlwD1ABR5ZurDPKKFIw
         ut3b3zuWNDC9ANDpn6xTtBYx0b3Iv2jdoLOFPXh6LDqZ2FFY4UY9NUgWD6jUzqkRo3aG
         DB/rbjwGV3UVZvmLxhuc+aMkzRyVq2GNdSZ+P55TzG0IfNjHwi5w71dJhRkVyC8tPqfn
         JjVJ+mi8sJDicb8Pw05q7/T7UyKkNEi+SYEMK0nEnpl84Sivy+BdeWSge0XFyuX07Esw
         3Nvg==
X-Gm-Message-State: AO0yUKXNiaP4K8IFZO+lWv2T4x4vaAFnkFgiNhPGid1NiL/XhbZ9eBqY
	bM7aKH4MX3sV6Zi1WZSbP4BO5Upol1eh3dAlpNdhRXzMZyZyQPRaHoQk/Y9Q5rTJ+fXoQti0Nwn
	1jWhAglakWW1a2tqtBgQrusEjfIEwH8YLNx4XURqS
X-Received: by 2002:a17:903:3093:b0:19a:67c0:53fb with SMTP id
 u19-20020a170903309300b0019a67c053fbmr1752393plc.56.1676370415868;
        Tue, 14 Feb 2023 02:26:55 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set9/5hd8VkDnGjlrUIqL3VtPYVDVKBxepTy99/rBO2CTYEGfdXbYhcx5qoE7JhhtYqJxVzsjPw==
X-Received: by 2002:a17:903:3093:b0:19a:67c0:53fb with SMTP id
 u19-20020a170903309300b0019a67c053fbmr1752380plc.56.1676370415592;
        Tue, 14 Feb 2023 02:26:55 -0800 (PST)
Received: from [10.102.88.184] (118-163-61-247.hinet-ip.hinet.net.
 [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id
 x22-20020a1709027c1600b0019907b82a24sm9883697pll.273.2023.02.14.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 02:26:55 -0800 (PST)
Message-ID: <2d9fee29-9678-22de-5134-a00c7770b7a5@canonical.com>
Date: Tue, 14 Feb 2023 18:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: fix mute/micmute LEDs don't work
 for a HP platform.
To: Takashi Iwai <tiwai@suse.de>
References: <20230214035853.31217-1-andy.chi@canonical.com>
 <87y1p08rxp.wl-tiwai@suse.de>
Content-Language: en-US
From: Andy Chi <andy.chi@canonical.com>
In-Reply-To: <87y1p08rxp.wl-tiwai@suse.de>
Message-ID-Hash: UOSGGJR5BEUW5G2FOL236XCGGFTYWXKL
X-Message-ID-Hash: UOSGGJR5BEUW5G2FOL236XCGGFTYWXKL
X-MailFrom: andy.chi@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Takashi Iwai <tiwai@suse.com>, Tim Crawford <tcrawford@system76.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 =?UTF-8?Q?Kacper_Michaj=c5=82ow?= <kasper93@gmail.com>,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOSGGJR5BEUW5G2FOL236XCGGFTYWXKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMi8xNC8yMyAxODoyNSwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KDQo+IE9uIFR1ZSwgMTQgRmVi
IDIwMjMgMDQ6NTg6NTEgKzAxMDAsDQo+IEFuZHkgQ2hpIHdyb3RlOg0KPj4gVGhlcmUgaXMgYSBI
UCBwbGF0Zm9ybSBuZWVkcyBBTEMyMzZfRklYVVBfSFBfR1BJT19MRUQgcXVpcmsgdG8NCj4+IG1h
a2UgbWljLW11dGUvYXVkaW8tbXV0ZSB3b3JraW5nLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgQ2hpPGFuZHkuY2hpQGNhbm9uaWNhbC5jb20+DQo+IEFwcGxpZWQgdGhpcyBvbmUgKGJ1dCB0
aGUgc2Vjb25kIG9uZSBsb29rcyBkdWJpb3VzKS4NClNvcnJ5LCBJJ2xsIHNlbmQgb3V0IHYyIHRv
IGZpeCB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+DQo+DQo+IHRoYW5rcywNCj4NCj4gVGFrYXNoaQ==
