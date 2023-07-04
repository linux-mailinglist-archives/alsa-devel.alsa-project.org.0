Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27890746828
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 05:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE6820C;
	Tue,  4 Jul 2023 05:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE6820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688443087;
	bh=/32k9ZMI98/LKRG6cigpFB8Frk8BYOXjlt/Cph+qkuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QQLXe1QRe9nrwv2atUNYcEYrVstH8pgYpv+edOg2BiAW0vGBfo3rz1M3B6BT8cor3
	 X7kkXbKmpB/N6OMNYc9Wrws6Yuelcf3PBTjG6kmDcdmfAD1bQh3qpR9eEWlW0rZ8if
	 Sy0W667BolsByG8qp37vRb6nI66q2k/gBh9VT670=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ACD0F80124; Tue,  4 Jul 2023 05:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC060F80124;
	Tue,  4 Jul 2023 05:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC37F80125; Tue,  4 Jul 2023 05:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F6F9F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 05:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F6F9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=YyGgvrhe
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-67ef5af0ce8so4222200b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Jul 2023 20:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688442912; x=1691034912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwx03+riSgIcGhZD5uDgqJNL+XswzICedgftjqxmi8w=;
        b=YyGgvrheaTlxvcr3I0f7KosN48kRGYJdOoB64Y31i/+uRTb2o5s/AmjK4gFf1gylk7
         usjhzcO5RbWFA43quUIOh1ZXdhE+P80fnP94r+65DG/ZuFLzw6D8geVhnfQ/+ys1GDRT
         jPDc2zmG6ZqcP0QzorU7h83tm5m6Fuv8v0gy2v1Zyw+As1eH9FC3aUod1AOvcVv70v8l
         zKIC17lXTGrDascs2KjOEkY+NB4dgykiuLw8Auz3GZ0kEYjmrhsHuhiChHtZpm/WSxdT
         nwPHQLM9WEOvdtL6xQHeks9KZUwkpWUQz1uB+93J5nz1sJX/yuaTeFtziCjEqAfIKdyv
         e93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688442912; x=1691034912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rwx03+riSgIcGhZD5uDgqJNL+XswzICedgftjqxmi8w=;
        b=l+ZiWWxudnSNcsMo+NxgVDrVCH38rNOC+ALfFG6qHEz/ntlUkwb6kp9SNnPZZaZZBA
         uXfa94btIPB+/vRVe8kcDNjFWZo6l2GE6fb74gDzgFXiFUXhpjLVufoHmDSD3OYfmV34
         oPMQTkGt38cZpgFZ39VeVKPnCJyZjPx8eDb6MSk+0fDF1OAX6/ValwDz414OnGQJdRMH
         AQiRDctU/AeJkbJbYZUcwE/XmS873UJlzdciZDtY8Th7i9etkwgiRE9nkSdSpa/h1ukW
         RcI8PoU8vLMW9H9V7XaEGXUINknNXu36laOWg5ccwcHtm0+RAl55KpLtQOS43bOQhYFE
         1dEg==
X-Gm-Message-State: ABy/qLZbXtPrr8BIIpuLZN01zN0spYnQ2ZGAwAc4flFyirJgiaS955Ok
	JYPoOkA0Jyarwn7HWEzK/KB+zCKcSLgPYKka1Wo=
X-Google-Smtp-Source: 
 APBJJlECTqsP4VOOhEVFKTXcQ9cu/zS70LO3Sa2iX7IOYlpTvj/R73lBjP3r91snhiJsMvSM466YQTaisv6jjoddZWk=
X-Received: by 2002:a05:6a00:22cb:b0:682:616a:f910 with SMTP id
 f11-20020a056a0022cb00b00682616af910mr16501287pfj.20.1688442912125; Mon, 03
 Jul 2023 20:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
 <8735255dqn.wl-tiwai@suse.de>
In-Reply-To: <8735255dqn.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Jul 2023 11:55:00 +0800
Message-ID: 
 <CAA+D8AMFKBVEstiKq6sE0rByy4SEmSROFOj-cnJENFygVXW9xQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Takashi Iwai <tiwai@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	Jacopo Mondi <jacopo@jmondi.org>
Message-ID-Hash: HMBZQN76IHXCHQ3FVL4CIEP5C354X5JX
X-Message-ID-Hash: HMBZQN76IHXCHQ3FVL4CIEP5C354X5JX
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HMBZQN76IHXCHQ3FVL4CIEP5C354X5JX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA5OjI14oCvUE0gVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNl
LmRlPiB3cm90ZToNCg0KPiBPbiBNb24sIDAzIEp1bCAyMDIzIDE1OjEyOjU1ICswMjAwLA0KPiBI
YW5zIFZlcmt1aWwgd3JvdGU6DQo+ID4NCj4gPiBPbiAwMy8wNy8yMDIzIDE0OjUzLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBKdWwgMDMsIDIwMjMgYXQgMDI6MDc6MTBQTSArMDIw
MCwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiA+ID4+IFNoZW5naml1IFdhbmcgd3JvdGU6DQo+ID4g
Pg0KPiA+ID4+PiBUaGVyZSBpcyBubyBzdWNoIG1lbW9yeSB0byBtZW1vcnkgaW50ZXJmYWNlIGRl
ZmluZWQgaW4gQUxTQS4gIFNlZW1zDQo+ID4gPj4+IEFMU0EgaXMgbm90IGRlc2lnbmVkIGZvciBN
Mk0gY2FzZXMuDQo+ID4gPg0KPiA+ID4+IFRoZXJlIGlzIG5vIHJlc3RyaWN0aW9uIHRvIGltcGxl
bWVudCBtZW1vcnktdG8tbWVtb3J5IGNhcHR1cmUgaW4gQUxTQQ0KPiA+ID4+IGZyYW1ld29yay4g
IEl0J2QgYmUgYSBtYXR0ZXIgb2YgdGhlIHNldHVwIG9mIFBDTSBjYXB0dXJlIHNvdXJjZSwgYW5k
DQo+ID4gPj4geW91IGNhbiBjcmVhdGUgYSBjb3JyZXNwb25kaW5nIGtjb250cm9sIGVsZW1lbnQg
dG8gc3dpdGNoIHRoZSBtb2RlIG9yDQo+ID4gPj4gYXNzaWduIGEgZGVkaWNhdGVkIFBDTSBzdWJz
dHJlYW0sIGZvciBleGFtcGxlLiAgSXQncyBqdXN0IHRoYXQgdGhlcmUNCj4gPiA+PiB3YXMgbGl0
dGxlIGRlbWFuZCBmb3IgdGhhdC4NCj4gPiA+DQo+ID4gPiBZZWFoLCBpdCdzIG5vdCBhIHRlcnJp
YmxlIGlkZWEuICBXZSBtaWdodCB1c2UgaXQgbW9yZSBpZiB3ZSBldmVyIGdldA0KPiA+ID4gYmV0
dGVyIHN1cHBvcnQgZm9yIERTUCBhdWRpbywgcm91dGluZyBiZXR3ZWVuIHRoZSBEU1AgYW5kIGV4
dGVybmFsDQo+ID4gPiBkZXZpY2VzIGlmIGRyaXZlbiBmcm9tIHRoZSBDUFUgd291bGQgYmUgYSBt
ZW1vcnkgdG8gbWVtb3J5IHRoaW5nLg0KPiA+ID4NCj4gPiA+PiBJJ20gbm90IG11Y2ggYWdhaW5z
dCBhZGRpbmcgdGhlIGF1ZGlvIGNhcHR1cmUgZmVhdHVyZSB0byBWNEwyLA0KPiA+ID4+IHRob3Vn
aCwgaWYgaXQgcmVhbGx5IG1ha2VzIHNlbnNlLiAgQnV0IGNyZWF0aW5nIGEgY3JhZnRlZCAvZGV2
L2F1ZGlvKg0KPiA+ID4+IGRvZXNuJ3QgbG9vayBsaWtlIGEgZ3JlYXQgaWRlYSB0byBtZSwgYXQg
bGVhc3QuDQo+ID4gPg0KPiA+ID4gSSd2ZSBzdGlsbCBub3QgbG9va2VkIGF0IHRoZSBjb2RlIGF0
IGFsbC4NCj4gPg0KPiA+IE15IG1haW4gY29uY2VybiBpcyB0aGF0IHRoZXNlIGNyb3NzLXN1YnN5
c3RlbSBkcml2ZXJzIGFyZSBhIHBhaW4gdG8NCj4gPiBtYWludGFpbi4gU28gdGhlcmUgaGF2ZSB0
byBiZSBnb29kIHJlYXNvbnMgdG8gZG8gdGhpcy4NCj4gPg0KPiA+IEFsc28gaXQgaXMga2luZCBv
ZiB3ZWlyZCB0byBoYXZlIHRvIHVzZSB0aGUgVjRMMiBBUEkgaW4gdXNlcnNwYWNlIHRvDQo+ID4g
ZGVhbCB3aXRoIGEgc3BlY2lmaWMgYXVkaW8gY29udmVyc2lvbi4gUXVpdGUgdW5leHBlY3RlZC4N
Cj4gPg0KPiA+IEJ1dCBpbiB0aGUgZW5kLCB0aGF0J3MgYSBkZWNpc2lvbiBJIGNhbid0IG1ha2Uu
DQo+ID4NCj4gPiBTbyBJIHdhaXQgZm9yIHRoYXQgZmVlZGJhY2suIE5vdGUgdGhhdCBpZiB0aGUg
ZGVjaXNpb24gaXMgbWFkZSB0aGF0IHRoaXMNCj4gPiBjYW4gdXNlIFY0TDIsIHRoZW4gdGhlcmUg
aXMgcXVpdGUgYSBsb3QgbW9yZSB0aGF0IG5lZWRzIHRvIGJlIGRvbmU6DQo+ID4gZG9jdW1lbnRh
dGlvbiwgbmV3IGNvbXBsaWFuY2UgdGVzdHMsIGV0Yy4gSXQncyBhZGRpbmcgYSBuZXcgQVBJLCBh
bmQgdGhhdA0KPiA+IGNvbWVzIHdpdGggYWRkaXRpb25hbCB3b3JrLi4uDQo+DQo+IEFsbCBhZ3Jl
ZWQuICBFc3BlY2lhbGx5IGluIHRoaXMgY2FzZSwgaXQgZG9lc24ndCBoYXZlIHRvIGJlIGluIFY0
TDINCj4gQVBJLCBhcyBpdCBzZWVtcy4NCj4NCj4gKFRob3VnaCwgdGhlIHN1cHBvcnQgb2YgYXVk
aW8gb24gVjRMMiBtaWdodCBiZSB1c2VmdWwgaWYgaXQncyBjbG9zZWx5DQo+IHRpZWQgd2l0aCB0
aGUgYSBzdHJlYW0uICBCdXQgdGhhdCdzIGFub3RoZXIgc3RvcnkuKQ0KPg0KDQphdWRpbyBpcyBh
IHN0cmVhbSwgIGZvciB0aGlzIG0ybSBhdWRpbyBjYXNlLCBWNEwyIGlzIHRoZSBiZXN0IGNob2lj
ZQ0KSSBmb3VuZC4NCg0KSSBrbm93IHRoZXJlIGlzIEFQSSBjaGFuZ2UgZm9yIFY0TDIsICBidXQg
VjRMMiBpcyBhIGdvb2QgZnJhbWV3b3JrDQpmb3IgbWVtb3J5IHRvIG1lbW9yeSwgIEkgdGhpbmsg
aXQgaXMgd29ydGggdG8gZG8gdGhpcyBjaGFuZ2UuDQoNCmlmIGltcGxlbWVudCB0aGlzIE0yTSBj
YXNlIGluIEFMU0EsICB3ZSBtYXkgbmVlZCB0byBjcmVhdGUgYSBzb3VuZA0KY2FyZCBhbmQgb3Bl
biBpdCB0d2ljZSBmb3IgcGxheWJhY2sgYW5kIGNhcHR1cmUsICBpdCBpcyBjb21wbGljYXRlZA0K
dG8gZG8gdGhpcywgIGFuZCBJIGFtIG5vdCBzdXJlIGlmIHRoZXJlIGlzIGFueSBvdGhlciBpc3N1
ZSBiZXNpZGVzIHRoZXNlLg0KSSBjYW4ndCBmaW5kIGFuIGV4YW1wbGUgaW4gdGhlIEFMU0EgZnJh
bWV3b3JrIGZvciB0aGlzIGNhc2UuDQoNCmJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2ppdQ0KDQo+
DQo+DQo+IHRoYW5rcywNCj4NCj4gVGFrYXNoaQ0KPg0K
