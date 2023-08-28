Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D378C725
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B24DF4;
	Tue, 29 Aug 2023 16:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B24DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318625;
	bh=jT8ySiepy6UCpP+BAb7N98vZUyP8Y2YkW3NyqaMOYqE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZY2aB7WW3kuz0XqX7U8nkdn9rjONg/qHKQZZxj85Y3Ed1Gya04aLu7xrvDTpXvvdw
	 28+sEqicL4akVo7H+a0UD4Q+pMKruzXSltaDsmf+qpzxhb+irT330KRKigsWjHp+b9
	 NwaAaoy0wKqBVwO/DDYQtYV60SNfgjd5xkJORS6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55861F805C9; Tue, 29 Aug 2023 16:14:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB3A0F805C8;
	Tue, 29 Aug 2023 16:14:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A52DCF80158; Mon, 28 Aug 2023 20:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32562F80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 20:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32562F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FQMNzbRk
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bd0bc8b429so22904201fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 28 Aug 2023 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693249102; x=1693853902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqhr6nNt714R0khUmJ1PlK9jKOh3kIB1C3PAzEYxM/U=;
        b=FQMNzbRka6dxp5UOIZxWkZnonb+IyAbbf5cQ3VS4ESq0RovjaljAfIFZpvK/Riuh1S
         RFC9kseReeU1yx6B/XP5OSijwufKuvXRECw3bMzTzSyP7/Oyg7DaIvM5jQvKC2455nPm
         rUYAO/Ba32WdNyBVlSmWcO8UYER1qZLcEmQGWsoquAFqxF9fntXpwdx6hKu9EgUk2uMp
         WAJZdhy/+3VwnWTxMQAzOJC62Xvf0Wo3ztGuIte+lthCw9t4yOAKgJck9kIz9dugTat3
         1Fd7lbSgBKa7NWHWj+7IpNjfZhTc1c03rQLFIjvbnK1C1GPCU9cojhGg689FLGD1Y1KV
         4qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693249102; x=1693853902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqhr6nNt714R0khUmJ1PlK9jKOh3kIB1C3PAzEYxM/U=;
        b=jqpz8m5n7+29fv2CFrHv7/7VHNWnS+fMHoS8SYKd1cu5Lp7AUWEoPLVErrsJcY9o+O
         g1iEqjOhGVB4wJLrzF2pOCAe11iBtQW85dSP19CqOxElkKkrn0135JBYdESTyiUdHwsm
         78TUN/0dJuG23R6Wqy4zpBocd4T/6mY9EjoRD19usrsk91s5g7zpPI/CqPBCed7vvrxe
         p/D0tWX23bCH3rV5uFGj6fuWh7oPItn2WyHssrad7j+XhQLKQesRAklCGoA02AlAhCOb
         dQmpcHo86eujdDZXNqEkc82CjqgKh2G5OeXrFVKhMhmpcNnfSyjCOpSS4i+eIM0/JJd8
         c9Cg==
X-Gm-Message-State: AOJu0YzXlgKii601SY73ztqd4gQa3HQ4a2nnWij2xB7tp+5tkcmrKf4S
	RjYdBBCNp4R75uA0ZXsHy+y2gvvicf44yasXgoo=
X-Google-Smtp-Source: 
 AGHT+IEmmnY46UoB9b3XZxna1C7CfpC5uv0E8tG4EbHvc/e1JQZZ5PJLv5vmWQvrPPaFQx2eBV0bO2Joq8lHK/UwIOs=
X-Received: by 2002:a2e:9397:0:b0:2bc:e1a3:fbaa with SMTP id
 g23-20020a2e9397000000b002bce1a3fbaamr10168234ljh.22.1693249101682; Mon, 28
 Aug 2023 11:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
In-Reply-To: <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
From: Ethan Geller <ethan.geller@gmail.com>
Date: Mon, 28 Aug 2023 11:58:10 -0700
Message-ID: 
 <CANvHXoiNyuV4j6e5W5RJ+gRYdJk8gj5yYY0ZU=CbJ-d-34AxhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Curtis Malainey <cujomalainey@google.com>,
 Jaroslav Kysela <perex@perex.cz>, cujomalainey@chromium.org,
	alsa-devel@alsa-project.org, tiwai@suse.com
X-MailFrom: ethan.geller@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JZDIPYUY46R763VF23GSWVFJCWULCNII
X-Message-ID-Hash: JZDIPYUY46R763VF23GSWVFJCWULCNII
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:54 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZDIPYUY46R763VF23GSWVFJCWULCNII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SSB3b3VsZCB0cmlwbGUgdGhpcyBmb3IgdGhlIHN0ZWFtT1MgY2FzZSwgd2hpY2ggaGFzIGFuIGlu
dmVyc2lvbiBvZiB0aGlzDQpwcm9ibGVtIChhIHBsYXliYWNrIGRldmljZSB0aGF0IGhhcyBhIGNv
dXBsZWQgY2FwdHVyZSBkZXZpY2UgZm9yIHNwZWFrZXINCm1hbmFnZW1lbnQpLiBDb3VwbGluZyBQ
Q00gZGV2aWNlcyBzdGF0aWNhbGx5IGluIHRoZSBVQ00gZmlsZSBhdm9pZHMgYSBjbGFzcw0Kb2Yg
c2lkZSBlZmZlY3RzIHRoYXQgY291bGQgb2NjdXIgaWYgb25lIHRyaWVkIHRvIGltcGxlbWVudCB0
aGUgc2FtZQ0KYmVoYXZpb3Igd2l0aCBleGVjIGNhbGxzIGluIEVuYWJsZS9EaXNhYmxlU2VxdWVu
Y2UuDQoNCk9uIE1vbiwgQXVnIDI4LCAyMDIzIGF0IDExOjM14oCvQU0gUGllcnJlLUxvdWlzIEJv
c3NhcnQgPA0KcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0K
Pg0KPg0KPiBPbiA4LzI4LzIzIDEyOjU5LCBDdXJ0aXMgTWFsYWluZXkgd3JvdGU6DQo+ID4gT24g
U2F0LCBBdWcgMjYsIDIwMjMgYXQgNDoyOOKAr0FNIEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVy
ZXguY3o+IHdyb3RlOg0KPiA+Pg0KPiA+PiBPbiAyNC4gMDguIDIzIDIzOjMzLCBjdWpvbWFsYWlu
ZXlAY2hyb21pdW0ub3JnIHdyb3RlOg0KPiA+Pj4gRnJvbTogQ3VydGlzIE1hbGFpbmV5IDxjdWpv
bWFsYWluZXlAY2hyb21pdW0ub3JnPg0KPiA+Pj4NCj4gPj4+IFNvbWV0aW1lcyB1c2Vyc3BhY2Ug
bWF5IHdhbnQgdG8gdXNlIGEgcmVmZXJlbmNlIGNoYW5uZWwgdG8gY2FuY2VsIGVjaG9zDQo+ID4+
PiB3aGVuIHVzaW5nIHZpZGVvIGNoYXQsIHRoaXMgdmFsdWUgaWRlbnRpZmllcyB0aGUgZGV2aWNl
IHdoaWNoIGNhcnJpZXMNCj4gPj4+IHRoYXQgY2hhbm5lbC4NCj4gPj4NCj4gPj4gVGhlIFVDTSBt
b2RpZmllciBzaG91bGQgYmUgdXNlZCBmb3IgdGhpcyAtIHNlZSAiRWNobyBSZWZlcmVuY2UiDQo+
IGNvbW1lbnRzIGluDQo+ID4+IHVzZS1jYXNlLmguDQo+ID4+DQo+ID4+IE5vdGUgdGhhdCB0aGlz
IGFsbG93cyBhZGRpdGlvbmFsIHNldHVwIChpbiBTZXF1ZW5jZXMpIGZvciB0aGlzIHN0cmVhbS4N
Cj4gPj4NCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSmFyb3NsYXYNCj4gPg0KPiA+IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIG1vZGlmaWVy
cyB3ZXJlIHN0YXRlIG1hbmlwdWxhdG9ycyB0aGF0DQo+ID4gYWN0ZWQgdXBvbiBleGlzdGluZyBk
ZXZpY2VzL3BjbXMgYW5kIGRpZCBub3QgZGVzaWduYXRlIHRoZWlyIG93biBQQ00uDQo+ID4gVGhh
dCBpcyBhdCBsZWFzdCBob3cgd2UgdXNlIHRoZW0gaW4gQ1JBUy4NCj4gPg0KPiA+IEFyZSB0aGVy
ZSBhbnkgZXhhbXBsZXMgb2YgaG93IHRvIGRlc2lnbmF0ZSBhIFBDTT8gSSBkb24ndCBzZWUgYW55
DQo+ID4gbW9kaWZpZXJzIGF0IGFsbCBpbiB1Y20tY29uZiByZXBvLg0KPg0KPiBJIHdpbGwgc2Vj
b25kIEN1cnRpcycgcmVxdWVzdCBmb3IgY2xhcmlmaWNhdGlvbnMuDQo+DQo+IEkgbmFpdmVseSB0
aG91Z2h0IHRoYXQgbW9kaWZpZXJzIHdvdWxkIGJlIHVzZWQgdG8gZS5nLiBzZWxlY3QgYSAnRGVl
cA0KPiBCdWZmZXInIG91dHB1dCBmb3IgbG93LXBvd2VyIHBsYXliYWNrLCBvciBkaWZmZXJlbnQg
Y2FwdHVyZSBzdHJlYW1zDQo+IGJhc2VkIG9uIHRoZSBuZWVkcyBvZiB0aGUgYXBwbGljYXRpb25z
LiBJdCdzIG5vdCB1bmNvbW1vbiBmb3IgY2FwdHVyZQ0KPiBhcHBsaWNhdGlvbnMgdG8gcmVxdWVz
dCBkaWZmZXJlbnQgUENNIHN0cmVhbXMgZm9yIHJhdywgQUVDIHByb2Nlc3NlZCwNCj4gQUVDK05T
IHByb2Nlc3NlZCBkYXRhLg0KPg0KPiBFY2hvIHJlZmVyZW5jZSBpcyBub3QgcmVhbGx5IHNvbWV0
aGluZyB0aGF0IHZhcmllcyBiYXNlZCBvbiBhbnkNCj4gcXVhbGlmaWVycy4gQW5kIHNwZWNpZmlj
YWxseSBpbiB0aGUgQ2hyb21lIGNhc2Ugd2Ugd2FudCB1c2Vyc3BhY2UgdG8NCj4gb3BlbiB0aGUg
UENNIGVjaG8gcmVmZXJlbmNlIGRldmljZSB3aGVuZXZlciB0aGUgcGxheWJhY2sgaXMgdXNlZC4g
U28NCj4gaXQncyBub3QgcmVhbGx5IGEgdXNlLWNhc2UgZGVwZW5kZW50IHRoaW5nIGJ1dCBtb3Jl
IGEgd2F5IHRvIGV4cHJlc3MgYQ0KPiBkZXBlbmRlbmN5IGJldHdlZW4gUENNIGRldmljZXMuDQo+
DQoNCg0KLS0gDQpTaW5jZXJlbHksDQpFdGhhbiBHZWxsZXIgPGh0dHA6Ly9ldGhhbmdlbGxlci5j
b20+DQpMaW5rZWRJbiA8aHR0cDovL3d3dy5saW5rZWRpbi5jb20vcHViL2V0aGFuLWdlbGxlci8z
YS80MTMvNzY4Pg0K
