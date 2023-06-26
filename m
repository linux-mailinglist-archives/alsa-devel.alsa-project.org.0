Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88873DE27
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 312931530;
	Mon, 26 Jun 2023 13:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 312931530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780242;
	bh=ntd24MNPnoCeWI+1HQmyn3XBvNNsutpG1LO49w5HdGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rl7ABg4oJlyLQU/0BFD0ZIgneGKCgrRFXdzTFrfqOsSGIATCvV7pSo6v8sz6r2jLb
	 1XjHy9guk/bS6pz4QeuBQGUiv62YKesMBilkHQLMTtErmAWQLg6zPGrm7dZVz8bi8s
	 n0SJ6SuRajfeCgYd1uG5uDSA1HvA9IRuUhTv684I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3249F806AC; Mon, 26 Jun 2023 13:43:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F18F806A2;
	Mon, 26 Jun 2023 13:43:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F9F8F80246; Mon, 26 Jun 2023 09:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AAA7F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 09:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAA7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=TScTdyEv
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fa96fd79f0so10523955e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687764684; x=1690356684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq/DjSWUkyIjAmDfzLS/0nShPtP2MT90LERX57DkFOc=;
        b=TScTdyEvudbgIxb4/Zgd3CVAhjW/YTzsj9FXkXzA1clyEPcT5Sg8Z28JpVCWGUlIt1
         HFwp/bWoaPRK6gFIYPBsMXLq582+3hW6Kkv0zrnGk++rFL2tKYFsUDP+KoeD6MsAMbTu
         FlzhMDwg3f4tCvvfIdoi2eQpVLZZoLqHlYS++t0GMcIW2AcHGQZHpezM9ncmOeNhCSTY
         pRWTQ5Wz11djG6Dlcx1NFCMX3uh5vV+B9syLldQ9I0/fd+LSNNr5XQalClO7CTRGhwMM
         I3dYVgpiB0bnBBUJe+kCMRx9tkNT5tkipg1nlSgZxlunY8CgSmE/l6Khcx4qJYa3NLur
         9Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687764684; x=1690356684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rq/DjSWUkyIjAmDfzLS/0nShPtP2MT90LERX57DkFOc=;
        b=iMmr+QSsbFaAOZiPD01yYSGIRzkxFVMGu9Aol+9NaUtPaLUvMLWlSiDby3Yyegquah
         h3WUkBUiDCc5SG7Wdd9DPGYie5Z6HXAe9AXmIYW1x+BCczqaCj0gtSCDc2/d5OG2XZRh
         nxnq8JTD3cgo3PjgA7Xzx2fgu4Uwayli5/IBpqFjTW52RwB++Drs4NP1LREEndVHLHig
         EFd8Qft79vrK6w0LYGwTges6wv8gmqLZosfrWp6uDKCI/JWLi1XSb+Mt1zBaO1YwyuYF
         cuk5yMLYK5WEDA0439vftImhQJX3HNbiMBpxRREzAumDcJmY9E0ROuImrbKpxt61kf94
         R9Ig==
X-Gm-Message-State: AC+VfDzAcER6u/q6nUrgGdD0H3myS9SAQS9ruzcuTSsfv/T3HM3+fnFq
	kuXrLyROlU8MsqEUiEuSPwtknC9lsbzulVznq/0=
X-Google-Smtp-Source: 
 ACHHUZ4aQVd0QT85zeVuPNtp2gtZctZmdSuNQ2vHD/AiEX6j5mKLdzUMqu0/jYv042c1cc9pyY/CNq9Zql/Wyy6fq3g=
X-Received: by 2002:a05:600c:2903:b0:3fa:7f25:31f with SMTP id
 i3-20020a05600c290300b003fa7f25031fmr8758726wmd.40.1687764683989; Mon, 26 Jun
 2023 00:31:23 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
 <877crqwvi1.wl-tiwai@suse.de>
In-Reply-To: <877crqwvi1.wl-tiwai@suse.de>
From: Tuo Li <islituo@gmail.com>
Date: Mon, 26 Jun 2023 15:31:18 +0800
Message-ID: 
 <CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	Linux Kernel <linux-kernel@vger.kernel.org>, baijiaju1990@outlook.com
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WLZ62DY24POJHIU7ZZ57GONG7P4PETCZ
X-Message-ID-Hash: WLZ62DY24POJHIU7ZZ57GONG7P4PETCZ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:25 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLZ62DY24POJHIU7ZZ57GONG7P4PETCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSENCg0KQmVzdCB3aXNoZXMsDQpUdW8g
TGkNCg0KT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMzowOOKAr1BNIFRha2FzaGkgSXdhaSA8dGl3
YWlAc3VzZS5kZT4gd3JvdGU6DQoNCj4gT24gTW9uLCAyNiBKdW4gMjAyMyAwNTo0MjoyOSArMDIw
MCwNCj4gVHVvIExpIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBIZWxsbywNCj4gPg0KPiA+IE91ciBz
dGF0aWMgYW5hbHlzaXMgdG9vbCBmaW5kcyBhIHBvc3NpYmxlIGRhdGEgcmFjZSBpbiBBTFNBIGlu
IExpbnV4DQo+IDYuNC4wLg0KPiA+DQo+ID4gSW4gc29tZSBmdW5jdGlvbnMsIHRoZSBmaWVsZCBz
bmRfY2FyZC50b3RhbF9wY21fYWxsb2NfYnl0ZXMgaXMgYWNjZXNzZWQNCj4gPiB3aXRoIGhvbGRp
bmcgdGhlIGxvY2sgc25kX2NhcmQubWVtb3J5X211dGV4LiBIZXJlIGlzIGFuIGV4YW1wbGU6DQo+
ID4NCj4gPiAgIGRvX2ZyZWVfcGFnZXMoKSAtLT4gTGluZSA1Nw0KPiA+ICAgICBtdXRleF9sb2Nr
KCZjYXJkLT5tZW1vcnlfbXV0ZXgpOyAtLT4gTGluZSA2MSAoTG9jaw0KPiBjYXJkLT5tZW1vcnlf
bXV0ZXgpDQo+ID4gICAgIGNhcmQtPnRvdGFsX3BjbV9hbGxvY19ieXRlcyAtPSBkbWFiLT5ieXRl
czsgIC0tPiBMaW5lIDYzDQo+IChBY2Nlc3MgIGNhcmQtPg0KPiA+IHRvdGFsX3BjbV9hbGxvY19i
eXRlcykNCj4gPg0KPiA+IEhvd2V2ZXIsIGluIHRoZSBmdW5jdGlvbiBkb19hbGxvY19wYWdlcygp
Og0KPiA+DQo+ID4gICBpZiAobWF4X2FsbG9jX3Blcl9jYXJkICYmDQo+ID4gICAgIGNhcmQtPnRv
dGFsX3BjbV9hbGxvY19ieXRlcyArIHNpemUgPiBtYXhfYWxsb2NfcGVyX2NhcmQpIC0tPiBMaW5l
IDQxDQo+ID4NCj4gPiB0aGUgdmFyaWFibGUgY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzIGlz
IGFjY2Vzc2VkIHdpdGhvdXQgaG9sZGluZw0KPiA+IHRoZSBsb2NrIGNhcmQtPm1lbW9yeV9tdXRl
eCwgYW5kIHRodXMgYSBkYXRhIHJhY2UgY2FuIG9jY3VyLg0KPiA+DQo+ID4gSW4gbXkgb3Bpbmlv
biwgdGhpcyBkYXRhIHJhY2UgbWF5IGJlIGhhcm1mdWwsIGJlY2F1c2UgdGhlIHZhbHVlIG9mDQo+
ID4gY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzIG1heSBiZSBjaGFuZ2VkIGJ5IGFub3RoZXIg
dGhyZWFkIGFmdGVyDQo+ID4gdGhlIGlmIGNoZWNrLiBUaGVyZWZvcmUsIGl0cyB2YWx1ZSBtYXkg
YmUgdG9vIGxhcmdlIGFmdGVyIExpbmUgNTEgYW5kIGNhbg0KPiA+IGNhdXNlIG1lbW9yeSBidWdz
IHN1Y2ggYXMgYnVmZmVyIG92ZXJmbG93Og0KPiA+DQo+ID4gICBjYXJkLT50b3RhbF9wY21fYWxs
b2NfYnl0ZXMgKz0gZG1hYi0+Ynl0ZXM7ICAtLT4gTGluZSA1MQ0KPiA+DQo+ID4gSSBhbSBub3Qg
cXVpdGUgc3VyZSB3aGV0aGVyIHRoaXMgcG9zc2libGUgZGF0YSByYWNlIGlzIHJlYWwgYW5kIGhv
dyB0bw0KPiA+IGZpeCBpdCBpZiBpdCBpcyByZWFsLg0KPiA+DQo+ID4gQW55IGZlZWRiYWNrIHdv
dWxkIGJlIGFwcHJlY2lhdGVkLCB0aGFua3MhDQo+ID4NCj4gPiBSZXBvcnRlZC1ieTogQmFzc0No
ZWNrIDxiYXNzQGJ1YWEuZWR1LmNuPg0KPg0KPiBJdCdzIGEgYml0IHJhY3kgaW5kZWVkLCBidXQg
dGhlIGVmZmVjdCBpcyBhbG1vc3QgbmVnbGlnaWJsZS4gIFRoZSBzaXplDQo+IGNoZWNrIHRoZXJl
IGlzIG1lcmVseSBhIHNhbml0eSBjaGVjaywgYW5kIGFsbG9jYXRpbmcgbW9yZSBieXRlcw0KPiBk
b2Vzbid0IG1lYW4gdG8gY29uZmxpY3QgYWdhaW5zdCBhbnl0aGluZyBwcmFjdGljYWxseS4NCj4N
Cj4gVGhhdCBzYWlkLCBpdCdzIGEgYmV0dGVyLXRvLWJlLWFkZHJlc3NlZCBidWcsIGJ1dCBub3Ro
aW5nIHRvbw0KPiBzZXJpb3VzLg0KPg0KPg0KPiB0aGFua3MsDQo+DQo+IFRha2FzaGkNCj4NCg==
