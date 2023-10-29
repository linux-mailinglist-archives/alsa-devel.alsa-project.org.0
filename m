Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFF7E0659
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2FA6E87;
	Fri,  3 Nov 2023 17:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2FA6E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028651;
	bh=N0PTEvoQmQHIBIIRHAnAwLti98TWmJOaxmD05MI2XJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=POyI1eiZ8PWgE4jEDBJ1v07+f7NLP4sVz1Vk3LVcbySL6GYoiVu6FLo1zeUcRBuWR
	 WIZ0xmJ0okAUr3kc6xkXwJtbLXMb9/yIMmQoMjsFnFq92OECFSqvIkFnQmGBEjytgv
	 bT3+dma9x0nqlwdT3Ius4py/EmLjr2RXPucPaUq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8541CF80494; Fri,  3 Nov 2023 17:23:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF115F80425;
	Fri,  3 Nov 2023 17:23:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E84F8016D; Mon, 30 Oct 2023 00:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 292B2F8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 00:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 292B2F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kpriAXbm
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ce2c71c61fso2316696a34.1
        for <alsa-devel@alsa-project.org>;
 Sun, 29 Oct 2023 16:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698621974; x=1699226774;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x7k6gDSkXfEUuZH60p+WcUqpWVKEo8eymSWEFQyhZlg=;
        b=kpriAXbmsTYRtcc6GjL0ICOXGHDJ33OCawa+eud/wSHFp4bcyTS07inGuqem4p1EDh
         KG/YjX6WMT/pkRttEnW7FH6F3E8PfgT0tDm3g+vpPifnuoOKd//SzFFEN1xidEUj06Nv
         DtETj665KHcabXcAclUsMPymVvlneJ6eUIQEj7xUOuWuQzzxnaYYKfXM/Z6XBzwz+081
         x71I4ulAmYFvj3Jpt5OoRieBmMrgThdVA0ZQ0bt66lBMiIY0OTbgcUUcBZKrmtncnBXI
         B3FEPgd+oYMTv6e8Mb5ktF4CUe0H/C3KA6hc0WCKy0cZNQqlWLlQLtDU/yX3Q6wq4IF3
         TVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698621974; x=1699226774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7k6gDSkXfEUuZH60p+WcUqpWVKEo8eymSWEFQyhZlg=;
        b=v7yQlCfp1c99RvJ+KAhBb0unvSyVgkWP0BeOuHiksPtULEKEagqe9rc3/OKx84S6pW
         12kkB2P0NjQjwK/H3lnx4ChIBbNCkCaeQ0VbulCFp6YrmLWTHRh07QweyizqL+mZfVXm
         ioyOw8C6tOXR0VclO0FnRnUUwz0k9ALCAzm2T/dmT+RfXRlZgZjupz/iT+Nnjn3JRX6h
         8m79wBlZ+U+t18Cc5c8zpiI98fbdCEB6vq6yiTsst4ejWIRdmYtKIoa+kXJ7avsyRj6B
         WVAWK4qTywrVCaxfPCC6DH9I4Kd2IQ0DhlBqajVmdlo/FOoQ/jXOuCnFGB85DJAQ526S
         45AA==
X-Gm-Message-State: AOJu0Yz4QqehNLrwntbv0QiFvmmpBlJRe0ZtQgv8SPYkeyzbS9pFRuIl
	ptoXEQ+acfjn9TZHLKCEYTuIzphUZfL5/3Max6g=
X-Google-Smtp-Source: 
 AGHT+IFF5a1//ZEs2+UHjXxUCkLUZuunNasNMn6hAMqvbxtiyoxhop7G6CGzcZtw7yDxxZsgzSehiT2ssx7ZhNk1MlI=
X-Received: by 2002:a9d:6d8a:0:b0:6c6:1e39:e5c6 with SMTP id
 x10-20020a9d6d8a000000b006c61e39e5c6mr7580578otp.36.1698621974501; Sun, 29
 Oct 2023 16:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230913053343.119798-1-poseaydone@ya.ru>
 <c36c2c196670a36f32cc776869e91f710c237400.camel@gmail.com>
 <282881698597547@mail.yandex.ru>
In-Reply-To: <282881698597547@mail.yandex.ru>
From: Matthew Pisoni <mmpisoni@gmail.com>
Date: Sun, 29 Oct 2023 18:26:03 -0500
Message-ID: 
 <CAJgVWNcgcmFJWeYkSGWBjsd5kqGO7wRgtW3f6dmvcEsAPac+=w@mail.gmail.com>
Subject: Re: [PATCH] patch_realtek: Splitting the UX3402 into two separate
 models.
To: =?UTF-8?B?0JDRgNGB0LXQvdC40Lkg0JrQvdGP0LfQtdCy?= <poseaydone@ya.ru>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Luke D. Jones" <luke@ljones.dev>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Chi <andy.chi@canonical.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
 Matthew Anderson <ruinairas1992@gmail.com>,
	Luka Guzenko <l.guzenko@web.de>, Yuchi Yang <yangyuchi66@gmail.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-MailFrom: mmpisoni@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5JFDRTMPHIIT54ZYB5SPD4UY5CNCWYBO
X-Message-ID-Hash: 5JFDRTMPHIIT54ZYB5SPD4UY5CNCWYBO
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:23:17 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JFDRTMPHIIT54ZYB5SPD4UY5CNCWYBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T2theSBzbyBob3cgd291bGQgSSBnbyBhYm91dCBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgbGluZSBh
ZGRlZCB0byB0aGUNCnBhdGNoX3JlYWx0ZWsgZmlsZT8NCg0KU05EX1BDSV9RVUlSSygweDEwNDMs
IDB4MWY2MiwgIkFTVVMgVVg3NjAyWk0iLA0KQUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIpDQoN
Ckl0IHdvcmtzIG9uIG15IG1hY2hpbmUgSSBvd24gdGhhdCBtb2RlbCBJIHdvdWxkIGp1c3QgbGlr
ZSBpdCBhZGRlZCBhcyBvdGhlcg0KbW9kZWxzIGhhdmUgYmVlbiBzbyBJIGRvbid0IG5lZWQgdG8g
Y29udGludWUgdG8gcGF0Y2ggdGhlIGtlcm5lbCBtb2R1bGUNCndoZW4gaXQncyBhbHJlYWR5IGJl
ZW4gZWZmZWN0aXZlbHkgZml4ZWQgZm9yIG90aGVycy4NClRoaXMgdGhyZWFkIGxvb2tlZCBsaWtl
IHlvdSBhbGwgd2VyZSBkaXNjdXNzaW5nIG1vZGlmaWNhdGlvbnMgdG8gdGhhdCBmaWxlDQpmb3Ig
dGhpcyBpc3N1ZSBzbyBJIHRob3VnaHQgaXQgbWlnaHQgYmUgYSBnb29kIHBsYWNlIHRvIHN0YXJ0
Lg0KDQpUaGFuayB5b3UhDQoNCg0KT24gU3VuLCBPY3QgMjksIDIwMjMsIDExOjQyIEFNINCQ0YDR
gdC10L3QuNC5INCa0L3Rj9C30LXQsiA8cG9zZWF5ZG9uZUB5YS5ydT4gd3JvdGU6DQoNCj4gVGhl
IHByb2JsZW0gd2l0aCB0aGlzIGxhcHRvcCBpcyB0aGF0IGZvciBkaWZmZXJlbnQgbW9kZWxzLCBk
aWZmZXJlbnQNCj4gdmFsdWVzIGFyZSByZXF1aXJlZCwgc28gSSBoYWQgdG8gcHV0IHRoZW0gaW4g
dHdvIGRpZmZlcmVudCB0aXRsZXMuDQo+DQo+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGEgcHJv
YmxlbSB3aXRoIHlvdXIgZGV2aWNlLCBidXQgSSB0aGluayBpdCB3b3VsZA0KPiBiZSBiZXR0ZXIg
dG8gd3JpdGUgYSBtb3JlIHByZWNpc2UgbW9kZWwgbmFtZS4NCj4NCj4gQmVzdCB3aXNoZXMsDQo+
IEFyc2VuaXkgS255YXpldg0KPg0KPg0KPiAyOC4xMC4yMDIzLCAwNzozNywgInBpekZ1bmsiIDxt
bXBpc29uaUBnbWFpbC5jb20+Og0KPg0KPg0KPiBIb3cgY2FuIEkgZ2V0IG15IG1vZGVsIG51bWJl
ciBhZGRlZCB0byB0aGUgcGF0Y2hfcmVhbHRlayBmaWxlPyBJdA0KPiBzdWZmZXJzIHRoZSBzYW1l
IGlzc3VlIGFzIHRoZSBVWDM0MDIgYW5kIHRoZSBsaW5lIHRoYXQgbmVlZHMgdG8gYmUNCj4gYWRk
ZWQgZm9yIG15IG1vZGVsIGxhcHRvcCBpczoNCj4NCj4gU05EX1BDSV9RVUlSSygweDEwNDMsIDB4
MWY2MiwgIkFTVVMgVVg3NjAyIiwNCj4gQUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIpDQo+DQo+
IFNpbmNlIEkgc2VlIHlvdSdyZSBiZWluZyBtb3JlIHNwZWNpZmljIGhlcmUgaW4gc3BsaXR0aW5n
IHRoZSBtb2RlbA0KPiBudW1iZXJzLCB0ZWNobmljYWxseSBteSBmdWxsIG1vZGVsIG51bWJlciBp
czogIlVYNzYwMlpNIi4NCj4NCj4gQWdhaW4sIHdoZW4gSSBwYXRjaCB0aGlzIGxvY2FsbHkgaXQg
d29ya3MgZm9yIG15IG1vZGVsIG51bWJlciwgYnV0IGFzDQo+IG9mIHlldCBvbmx5IHRoZSBvdGhl
ciBhZmZlY3RlZCBBU1VTIGxhcHRvcCBtb2RlZGxzIHdpdGggbXkgaXNzdWUgaGF2ZQ0KPiBmb3Vu
ZCB0aGVpciB3YXkgaW50byB0aGUga2VybmVsLg0KPg0KPiBUaGFua3MhDQo+DQo+DQo+DQo+IC0t
DQo+DQo+DQo=
