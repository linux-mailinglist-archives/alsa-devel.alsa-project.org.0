Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F299517D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A763F52;
	Tue,  8 Oct 2024 16:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A763F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397467;
	bh=YvVMFtVjvDArRFzL3Hyhs9iR/sAz/FplSkcy0ovY7O8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hFcmFzY2Cpi0wI2mxXXe3cj2xCys8ghHDa8NEchrPBVZJ6qP8I6ncLavNobVU1ZqR
	 BM2PgykEpLZlVwqBE27BKBQscZjBEFJxIX/g8iVCCd/w0/+LrsQMCYIifuT5AK/wMm
	 Vn1XIX7zhaqrvgP7OVn547GzQGZxSqvRVbImCc64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F842F8075B; Tue,  8 Oct 2024 16:21:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E31BCF80760;
	Tue,  8 Oct 2024 16:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601CFF80517; Fri,  4 Oct 2024 01:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 882F9F80107
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 01:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882F9F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T97g8dru
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fac187eef2so20510721fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Oct 2024 16:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727997826; x=1728602626;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lM6/cRjw24jsdYXllFmZ+qj9mScZSJdtpIdRZX4FPC0=;
        b=T97g8dru9YX+hIKSbATOo6JcFAo4UzhmgiK9fL5h4wIhrkGtxIGGlV+dIGOKa8czAf
         wA70etGW7hZzmiMhUr9VpTE+PKGeXJyFMO2rHMf4HdqD2agfg+rMfefeV0MQYrV9orYp
         Qg43b4GaVDowBUgbw9psw05cjrRI97UIwuHb453cBH/UnD3jsDLQpo5WS4EL3VhRanbh
         Egp7NuFQpaog3J8q1zfbUTmfoHcLNQfzrTM2IJBpx6+Jk2aReZIoBBBO1e0nLtPZy0UQ
         png2JaUfGqoaACMrg85xAMZ4JDXd3QgdLYDS5Rvbb1vODO2CpuKilWQL9+PJU6FvraPv
         7dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727997826; x=1728602626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM6/cRjw24jsdYXllFmZ+qj9mScZSJdtpIdRZX4FPC0=;
        b=fenAN/WxPkwIkBbSrETtqTJ2W+gT9+72awgs+IQISLN+LezBSGJYwkQaKI24YFCi1r
         doUhVEtiXhNDiKPcD6bCpSV71iLZvkusQO7kpp6LMFHqwia+h0t32xS3itCVeX3yqjA2
         1Vq9+uQcYWGToY1V8gSw145u9ysShU0jTmzcAEGJhETyPdLmmpK+2uI3nL4blXf+o3Rs
         D9M2uaL27+VKhcCFz0RshVEl5YMymosztvRQMCqvTEwv58IPTqbomkckswVwJrJO8Kbx
         sMRNjwqrltZAf8IhlkqIcNLpUAQ4H/UmYHrfQleB+lGIW0ARMCkMbMn51w7I32WswYuk
         8E9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXRbfVcYwnLQhROnWjs1ygtpANOAtsTRzldmfyP8fdDpC5kCuU84gdYDQERbyFzey0X/+Oa1uZEBPy@alsa-project.org
X-Gm-Message-State: AOJu0Yya5RIk8Ae9ecp6k/2HV4jhEMgPTttye1GH+uHBk3G9Lxmdw3mh
	B1Hps1dhRJ/f3UK8vt7VMzKN1rYQbYlYqQ+4+YzSmUsOguGo7bI3l7I7ygViVrUyHPcU5ij12iK
	jH8vpeOmqArn4pkX8aW9JaWAZSEI=
X-Google-Smtp-Source: 
 AGHT+IF111/avT/ZUgvDlcWF0WgW/Ql5MK8ft68v8OAFkAShZMh8tbH5og4vSOKw69JoYfLYb9feiaYAMK2GTgNEHOU=
X-Received: by 2002:a05:651c:2211:b0:2fa:ce00:3689 with SMTP id
 38308e7fff4ca-2faf3c2fe60mr3247111fa.6.1727997825817; Thu, 03 Oct 2024
 16:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240930105039.3473266-1-oder_chiou@realtek.com>
 <87frphgrzw.wl-tiwai@suse.de>
In-Reply-To: <87frphgrzw.wl-tiwai@suse.de>
From: parsa poorsh <parsa.poorsh@gmail.com>
Date: Fri, 4 Oct 2024 02:53:33 +0330
Message-ID: 
 <CAAqP8TUQ21v0AxSh_e4-GS-i2W=ONyT+hWpEOBMUJW7YQOw24Q@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix the push button function for
 the ALC257
To: Takashi Iwai <tiwai@suse.de>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
	kailang@realtek.com, flove@realtek.com, jennifer_chen@realtek.com,
	geans_chen@realsil.com.cn
X-MailFrom: parsa.poorsh@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FKYZBVSQ6ZSGV345MVBMUFSNL4MJ3DAQ
X-Message-ID-Hash: FKYZBVSQ6ZSGV345MVBMUFSNL4MJ3DAQ
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:21:18 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FKYZBVSQ6ZSGV345MVBMUFSNL4MJ3DAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

aSBmb3VuZCBvdXQgdGhhdCB1c2luZyB0aGUgZm9sbG93aW5nIGNvbW1hbmQgc3VwcHJlc3NlcyB0
aGUgbm9pc2UgZm9yIGEgZmV3DQpzZWNvbmRzLCB0aGVuIGl0IGNvbnRpbnVlczoNCiQgY2F0IC9w
cm9jL2Fzb3VuZC9jYXJkKi9jb2RlYyogfCBncmVwICJWZW5kb3IgSWQiDQpWZW5kb3IgSWQ6IDB4
MTBlYzAyNTcNClZlbmRvciBJZDogMHg4MDg2MjgxYw0KDQppcyB0aGVyZSBhbnkgc3VnZ2VzdGlv
bnMgd2hhdCBtaWdodCBiZSB0aGUgcmVhbCBjYXVzZSBvZiBub2lzZT8NCmkgZG9uJ3QgaGF2ZSBt
dWNoIGV4cGVyaWVuY2UgZG9pbmcga2VybmVsIGRldmVsb3BtZW50LCBzbyBJIHdvdWxkDQphcHBy
ZWNpYXRlIGl0IGlmIHNvbWVvbmUgZ3VpZGVkIG1lIGluIHRoZSBjb3JyZWN0IGRpcmVjdGlvbiB0
byBmaXggdGhpcw0KDQpPbiBNb24sIFNlcCAzMCwgMjAyNCwgMTc6MzAgVGFrYXNoaSBJd2FpIDx0
aXdhaUBzdXNlLmRlPiB3cm90ZToNCg0KPiBPbiBNb24sIDMwIFNlcCAyMDI0IDEyOjUwOjM5ICsw
MjAwLA0KPiBPZGVyIENoaW91IHdyb3RlOg0KPiA+DQo+ID4gVGhlIGhlYWRzZXQgcHVzaCBidXR0
b24gY2Fubm90IHdvcmsgcHJvcGVybHkgaW4gY2FzZSBvZiB0aGUgQUxDMjU3Lg0KPiA+IFRoaXMg
cGF0Y2ggcmV2ZXJ0ZWQgdGhlIHByZXZpb3VzIGNvbW1pdCB0byBjb3JyZWN0IHRoZSBzaWRlIGVm
ZmVjdC4NCj4gPg0KPiA+IEZpeGVzOiBlZjk3MThiM2Q1NGUgKCJBTFNBOiBoZGEvcmVhbHRlazog
Rml4IG5vaXNlIGZyb20gc3BlYWtlcnMgb24NCj4gTGVub3ZvIElkZWFQYWQgMyAxNUlBVTciKQ0K
PiA+IFNpZ25lZC1vZmYtYnk6IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQo+
DQo+IEFzIGl0J3MgYSByZWdyZXNzaW9uLCB0aGUgcmV2ZXJ0IGlzIGZpbmUuICBOb3cgYXBwbGll
ZCB0byBmb3ItbGludXMNCj4gYnJhbmNoLg0KPg0KPiBNZWFud2hpbGUsIHdlJ2QgbmVlZCB0byBm
aXggZm9yIElkZWFQYWQgMyBpbiBhIGRpZmZlcmVudCB3YXkuDQo+IGUuZy4gYWRkIGEgcXVpcmsg
ZW50cnkgdG8gc2V0IGFsY19lYXBkX3NodXR1cCBvciBzby4NCj4gQWRkaW5nIFBhcnNhIHRvIENj
IGZvciB0aGUgZnVydGhlciB3b3JrLg0KPg0KPg0KPiB0aGFua3MsDQo+DQo+IFRha2FzaGkNCj4N
Cj4gPiAtLS0NCj4gPiAgc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgfCAxICsNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMNCj4gYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYw0KPiA+IGluZGV4IGY3ODdmZjQxODJkNC4uODZkYjFhNGVjMjRjIDEwMDY0NA0KPiA+IC0t
LSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jDQo+ID4gKysrIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMNCj4gPiBAQCAtNTg3LDYgKzU4Nyw3IEBAIHN0YXRpYyB2b2lkIGFs
Y19zaHV0dXBfcGlucyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykNCj4gPiAgICAgICBzd2l0Y2gg
KGNvZGVjLT5jb3JlLnZlbmRvcl9pZCkgew0KPiA+ICAgICAgIGNhc2UgMHgxMGVjMDIzNjoNCj4g
PiAgICAgICBjYXNlIDB4MTBlYzAyNTY6DQo+ID4gKyAgICAgY2FzZSAweDEwZWMwMjU3Og0KPiA+
ICAgICAgIGNhc2UgMHgxOWU1ODMyNjoNCj4gPiAgICAgICBjYXNlIDB4MTBlYzAyODM6DQo+ID4g
ICAgICAgY2FzZSAweDEwZWMwMjg1Og0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4NCg==
