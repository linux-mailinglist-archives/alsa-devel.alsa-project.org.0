Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D64AB7F7A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B5461BF2;
	Thu, 15 May 2025 09:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B5461BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294528;
	bh=lPgD5AnRzTGKfThhJH2COIuyZWl5CnWWRUNEfOgaOys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NIgYgup8Cjl+ovdrOkZlvLN6iBf3HX/txnas5jP4q+Ol35ig28PWA4dT22Gwy7/Dd
	 ODvW9ci1rG+dJB4unctdqIWWTH92rpIafVhUSA0v1ndZoR5QB3SMmIVUNK0+6v0pAr
	 PdKAL8wxJRF0aoBlOoos0iSVbV+qYfGgkZtChAeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60628F89824; Sun, 11 May 2025 16:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4861CF89828;
	Sun, 11 May 2025 16:33:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0578EF8A1C3; Tue,  6 May 2025 12:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_FONT_LOW_CONTRAST,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E60ECF89F15
	for <alsa-devel@alsa-project.org>; Tue,  6 May 2025 12:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60ECF89F15
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256
 header.s=google header.b=eXp66uQb
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30c416cdcc0so53566981fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 06 May 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1746526298; x=1747131098;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=maDj2dL9vOGF8Aklpv291L7Hh/17tOLUCSbcAt8E3ZA=;
        b=eXp66uQbXW3c4smUEVbQ00nBSfRfbjFzKWyRqgAucTiqrYXUD6aR3orZaldKSqYtBm
         uLn3VBdtDYdYMmpLtkNlYSa1BWxVQqYyBjgDnFAAvGWjzhbdC/+r8phUy7NoK3tYlHXN
         406PlVJARnjpRFJkUS4jiMQqFNIcBQwj1u0bKeIyl/IHcpzNddf7bnLhclbag0b8YdVm
         GYUPXEDHaUJJaHMptMGXTt5YFV3ZIcPgPQLJd9YJJuxPX7zzYkSBLXmKwBWqJDFkcAsV
         cpp/GFbSr0rTZMIkDmQDIzHXAmhfxz4pQsx+fzU7N60iK5oKyh5ifI9yjK5+tS3WKcqn
         p8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526298; x=1747131098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maDj2dL9vOGF8Aklpv291L7Hh/17tOLUCSbcAt8E3ZA=;
        b=nJQg2PDl5sKOQlhL9+/XBmhWTJ93WUo9+Pfy8TdlYjaOf9M99EmfcSX3jEI0ai62NK
         8eQZTqUL1PaVBythjlJgJCNS3HU0zxS+iHkRw2MsXMpSu7/7l/4Pok4xmlDnVRKPRFeh
         u2R9uEwoFTPuhxI0UbI6smSCNNvbZfMt8MBUJmHTEuW7/2zv4kAiDy/xn/nQfXajcCsJ
         Hgh7iO7hTZqzJJDJskHZ1RhJ5kJineYBBmgLr+zvIcd5bKOGZgF98JT9Id7TWXRf83me
         DoLpUd/rBe4bx1Cn94G60j6G0zrA9tnrx0M0fM3bq7Y9TtyjX+xGrQAuv4Dqq6ML0nBn
         XdFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1kcCH5Mpo8mjY7PldICdHgqDSNpAtGN5n8RrKoKDQ8lepb9EZT4AE9vNt0mxee6TgEiOp7Oe2EMS@alsa-project.org
X-Gm-Message-State: AOJu0YxMnWRC3wjObfW+GiwNo39C/0LUrilK6BxuqF/k6XIWWIZiMYo7
	6kS2aPsVmLaGLxI9emF8fc8QRS5eu/2ezP4aXzXkkQHjWRjrddTFOGqTYf5a2oXUYIcGraA0VGo
	y+ou8zJEv7TF/rtF9MhnNwOipciySP99DWWFVmg==
X-Gm-Gg: ASbGncvkKO6uzD6cFky0/SXc+00dZIDQMF761Dc7ObLBWzFOZLw2lIggZ/U2NT6VnLJ
	2b/DaBabTVRVjTmQEWO8zUzn5X1D6TQ1duP5J49VqAxDIGd9onobjoYCCdU4b2yhUiWADCg7dTs
	1x9RASSKAPUtzgY8tnayp8yvHYM+3LuCF5DN4GMYzX2ntcx1STXAugvw1p
X-Google-Smtp-Source: 
 AGHT+IGd5MBfB1oDqNMoMlwoQeK6baK1Kody2GKXe6l2b+NCGyA5VsVP+SgH7Dz+37jileLoPWWwN3kywGq/yY2vAPc=
X-Received: by 2002:a05:651c:b12:b0:30b:efa5:69a2 with SMTP id
 38308e7fff4ca-32349058cd7mr33542031fa.19.1746526298087; Tue, 06 May 2025
 03:11:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAPXr0uxh0c_2b2-zJF=N8T6DfccfyvOQRX0X0VO24dS7YsxzzQ@mail.gmail.com>
 <aBHgOsqA4qfe7LbN@c757f733ca9e>
 <CAPXr0uxJg0kMu_N7Gxb14kVdhkFGXO_KbK5RxfAcY9dEA8vrEA@mail.gmail.com>
In-Reply-To: 
 <CAPXr0uxJg0kMu_N7Gxb14kVdhkFGXO_KbK5RxfAcY9dEA8vrEA@mail.gmail.com>
From: Ezra Khuzadi <ekhuzadi@uci.edu>
Date: Tue, 6 May 2025 03:11:26 -0700
X-Gm-Features: ATxdqUHtOY2jL6izi15S3RbFjorM8wSzzCLHmCaCtYiCPBVnPNu9VFxSdEI5P3Q
Message-ID: 
 <CAPXr0uw7Dj9ckM_pLDkUaAH3vid9BmePrACOYZv-N549AUEHfw@mail.gmail.com>
Subject: Re: sound/pci/hda: add quirk for HP Spectre x360 15-eb0xxx
To: kernel test robot <lkp@intel.com>, sound-dev@vger.kernel.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	alsa-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, tiwai@suse.de, "perex@perex.cz" <perex@perex.cz>
X-MailFrom: ekhuzadi@uci.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PIOYC5N5Y7R55ZRP2RZ3KQDO7IU2QSLR
X-Message-ID-Hash: PIOYC5N5Y7R55ZRP2RZ3KQDO7IU2QSLR
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:06 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIOYC5N5Y7R55ZRP2RZ3KQDO7IU2QSLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwgSmFyb3NsYXYsIGFsbCBtYWludGFpbmVycywNCg0KQ291bGQgeW91IHBsZWFz
ZSByZXZpZXcgaXQgb3IgbGV0IG1lIGtub3cgaWYgYW55IGNoYW5nZXMgYXJlIG5lZWRlZD8gVGhp
cw0KaXMgbXkgZmlyc3Qga2VybmVsIHBhdGNoIGFzIGEgc3R1ZGVudCwgYW5kIEnigJlkIGFwcHJl
Y2lhdGUgYW55IGZlZWRiYWNrLg0KDQpUaGFua3MsDQpFenJhIEtodXphZGkNCg0KDQpPbiBXZWQs
IEFwciAzMCwgMjAyNSBhdCAxOjQz4oCvQU0gRXpyYSBLaHV6YWRpIDxla2h1emFkaUB1Y2kuZWR1
PiB3cm90ZToNCg0KPiBzb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYzogYWRkIHF1aXJrIGZv
ciBIUCBTcGVjdHJlIHgzNjAgMTUtZWIweHh4DQo+DQo+IEFkZCBzdWJzeXN0ZW0gSUQgMHg4NmU1
IGZvciBIUCBTcGVjdHJlIHgzNjAgMTUtZWIweHh4IHNvIHRoYXQNCj4gQUxDMjg1X0ZJWFVQX0hQ
X1NQRUNUUkVfWDM2MF9FQjEgKEdQSU8gYW1wLWVuYWJsZSwgbWljLW11dGUgTEVEIGFuZA0KPiBw
aW5jb25maWdzKSBpcyBhcHBsaWVkLg0KPg0KPiBUZXN0ZWQgb24gSFAgU3BlY3RyZSB4MzYwIDE1
LWViMDA0M2R4IChWZW5kb3IgMHgxMGVjMDI4NSwgU3Vic3lzDQo+IDB4MTAzYzg2ZTUpDQo+IHdp
dGggbGVnYWN5IEhEQSBkcml2ZXIgYW5kIGhkYS12ZXJiIHRvZ2dsZXM6DQo+DQo+ICAgJCBjYXQg
L3Byb2MvYXNvdW5kL2NhcmQwL2NvZGVjIzAgXA0KPiAgICAgICB8IHNlZCAtbiAtZSAnMSw1cDsv
VmVuZG9yIElkOi9wOy9TdWJzeXN0ZW0gSWQ6L3AnDQo+ICAgQ29kZWM6IFJlYWx0ZWsgQUxDMjg1
DQo+ICAgVmVuZG9yIElkOiAweDEwZWMwMjg1DQo+ICAgU3Vic3lzdGVtIElkOiAweDEwM2M4NmU1
DQo+DQo+ICAgJCBkbWVzZyB8IGdyZXAgLWkgcmVhbHRlaw0KPiAgIFsgICAgNS44Mjg3MjhdIHNu
ZF9oZGFfY29kZWNfcmVhbHRlayBlaGRhdWRpbzBEMDogQUxDMjg1OiBwaWNrZWQgZml4dXANCj4g
ICAgICAgICBmb3IgUENJIFNTSUQgMTAzYzo4NmU1DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEV6cmEg
S2h1emFkaSA8ZWtodXphZGlAdWNpLmVkdT4NCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4NCj4gLS0tDQo+ICBzb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyB8IDEgKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jDQo+IGlu
ZGV4IDg3NzEzN2NiMDlhYy4uODJhZDEwNWU3ZmE5IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYw0KPiArKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsu
Yw0KPiBAQCAtMTA1NjMsNiArMTA1NjMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9xdWly
ayBhbGMyNjlfZml4dXBfdGJsW10gPQ0KPiB7DQo+ICAgIFNORF9QQ0lfUVVJUksoMHgxMDNjLCAw
eDg2YzcsICJIUCBFbnZ5IEFpTyAzMiIsDQo+IEFMQzI3NF9GSVhVUF9IUF9FTlZZX0dQSU8pLA0K
PiArICBTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NmU1LCAiSFAgU3BlY3RyZSB4MzYwIDE1LWVi
MHh4eCIsDQo+IEFMQzI4NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBfRUIxKSwNCj4gICAgU05EX1BD
SV9RVUlSSygweDEwM2MsIDB4ODZlNywgIkhQIFNwZWN0cmUgeDM2MCAxNS1lYjB4eHgiLA0KPiBB
TEMyODVfRklYVVBfSFBfU1BFQ1RSRV9YMzYwX0VCMSksDQo+ICAgIFNORF9QQ0lfUVVJUksoMHgx
MDNjLCAweDg2ZTgsICJIUCBTcGVjdHJlIHgzNjAgMTUtZWIweHh4IiwNCj4gQUxDMjg1X0ZJWFVQ
X0hQX1NQRUNUUkVfWDM2MF9FQjEpLA0KPiAgICBTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NmY5
LCAiSFAgU3BlY3RyZSB4MzYwIDEzLWF3MHh4eCIsDQo+IEFMQzI4NV9GSVhVUF9IUF9TUEVDVFJF
X1gzNjBfTVVURV9MRUQpLA0KPg0KPiBPbiBXZWQsIEFwciAzMCwgMjAyNSBhdCAxOjMz4oCvQU0g
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGksDQo+
ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+ID4NCj4gPiBGWUk6IGtlcm5lbCB0ZXN0
IHJvYm90IG5vdGljZXMgdGhlIHN0YWJsZSBrZXJuZWwgcnVsZSBpcyBub3Qgc2F0aXNmaWVkLg0K
PiA+DQo+ID4gVGhlIGNoZWNrIGlzIGJhc2VkIG9uDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJs
ZS1rZXJuZWwtcnVsZXMuaHRtbCpvcHRpb24tMV9fO0l3ISFDekF1S0o0Mkd1cXVWVFRtVm1QVmlZ
RXZTZyFQaUNtREpzYmtQNDhIWTZhZHkwcmJDMjFyR3VzdVktSWpKNjFKcVFucDk5R2RIc2JjNXVF
UUR3Vi1ROVRlS0s3UjRUSEZWN2ZYUSQNCj4gPg0KPiA+IFJ1bGU6IGFkZCB0aGUgdGFnICJDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZyIgaW4gdGhlIHNpZ24tb2ZmIGFyZWEgdG8NCj4gaGF2ZSB0
aGUgcGF0Y2ggYXV0b21hdGljYWxseSBpbmNsdWRlZCBpbiB0aGUgc3RhYmxlIHRyZWUuDQo+ID4g
U3ViamVjdDogc291bmQvcGNpL2hkYTogYWRkIHF1aXJrIGZvciBIUCBTcGVjdHJlIHgzNjAgMTUt
ZWIweHh4DQo+ID4gTGluazoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3N0YWJsZS9DQVBYcjB1eGgwY18yYjItekpGKjNETjhUNkRmY2NmeXZP
UVJYMFgwVk8yNGRTN1lzeHp6USo0MG1haWwuZ21haWwuY29tX187SlNVISFDekF1S0o0Mkd1cXVW
VFRtVm1QVmlZRXZTZyFQaUNtREpzYmtQNDhIWTZhZHkwcmJDMjFyR3VzdVktSWpKNjFKcVFucDk5
R2RIc2JjNXVFUUR3Vi1ROVRlS0s3UjRTeVJMSWJlUSQNCj4gPg0KPiA+IC0tDQo+ID4gMC1EQVkg
Q0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiA+DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2lfXzshIUN6QXVLSjQyR3Vx
dVZUVG1WbVBWaVlFdlNnIVBpQ21ESnNia1A0OEhZNmFkeTByYkMyMXJHdXN1WS1Jako2MUpxUW5w
OTlHZEhzYmM1dUVRRHdWLVE5VGVLSzdSNFFkVFF5UG1nJA0KPiA+DQo+ID4NCj4gPg0KPg0K
