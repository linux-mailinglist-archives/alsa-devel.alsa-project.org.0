Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435B759517
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879B1112;
	Wed, 19 Jul 2023 14:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879B1112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689769723;
	bh=RQ8j9UaDE0yiK8kG7GAZdB5U5dfP0S0JjuRsJexhSRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2Bx6zJDLFJuERFk1gFGUr0PkOVtGvt+YkZqWyPV8uDkCAySwKPasggYUnSo7PvZZ
	 7/FQQawruFzza+YINVN9E5S5WQcHmbY1MjI9eKCs0iHHTwwfHcwuCYJWha/Wi9G2kw
	 IpIRi6qVobAI70odZ/Um8nKVhdQxaZdUBtmmVS4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DE59F800D2; Wed, 19 Jul 2023 14:27:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77495F800D2;
	Wed, 19 Jul 2023 14:27:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FEDF8047D; Wed, 19 Jul 2023 14:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A802F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 14:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A802F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vt-edu.20221208.gappssmtp.com header.i=@vt-edu.20221208.gappssmtp.com
 header.a=rsa-sha256 header.s=20221208 header.b=08//KQ1/
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc6ab5ff5so63655995e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20221208.gappssmtp.com; s=20221208; t=1689769654;
 x=1690374454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L94K6WyARVPwNDJ8yzI/aYs7/AJGGaufkp/ftL3Uaes=;
        b=08//KQ1/iHimg1tlkl2AbYgu3POMySwuqrc1vaI9axXSZryDE6tO4EjCxjSQ9+KYqB
         xwByJ2PVwRwS8/w0JnvfIptKMPMSBLbJk7Q7WdNCc1d81noKn1bUMAjhyRY+RTFaD0qb
         Wa5Liiq8gAmeqUyUex8HG3YbOQzLIHk2+G9ACyJ7PtLKpB9bhDK2mZpg4Ihvun+ybzec
         7oED2dJ9OyHKs3t1TdZwIbMvWZYDYHdHmYkIDmSJ6u+gFN3bVJNT+RGLbCQKqqKmreM5
         JShRhz4rbRbFPQ2ESiNnIqnZcPd2SGmUgFHWUPIfwtMvx/D78NuJpVGfX+Oq7CBg28p3
         0Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689769654; x=1690374454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L94K6WyARVPwNDJ8yzI/aYs7/AJGGaufkp/ftL3Uaes=;
        b=ll1NtuQoU9ZGFprpk7WpxbEtW7w7OE36Alqytk7Q4vTWayPthau+WZ3xKz8gOfsQUg
         zXHnEH+TsVINqD1fE9TRUjx1OW3EnlFEts78nIkTT9KcTOZDBRwVuoNonyGe6wDhIWDi
         ppimsuG2rMur8OxhlZVL8FDbfW3rBy2SShAqWsce1/9FcKmEGAVosSiej2d84AJc1/Z/
         1n1okm56DCgdehOXhHeoetvC7xhSqe/7KlZQPBtlZjVF3MbY1oo4Aqwxa0cb5jT14gDs
         DObTvbnU/gDbNcvfqUjm/8e0SCAz2LsvfhX/J9SwvoyWBrZMcHoyPZBMKAdwBRaGqJFI
         KFMg==
X-Gm-Message-State: ABy/qLaX67yEmN7IwHLxWHJ86+Hh5PP5SBIBU5+oX+30UZ+mjtdMoI1v
	Mpu17ktOUQzUZcaEJAfSJGCY6X3JxKSLVCDbxi4E7BXas21KaMQH
X-Google-Smtp-Source: 
 APBJJlFffpQPASAZxl5U2p+B2cbUqRSxYKvWkgX7WvUtPVKhtMXefv7Sds77NmhL0ll1Dj/eWKRBfolgu9aPdIp/fsU=
X-Received: by 2002:adf:d4c9:0:b0:313:fff0:ff44 with SMTP id
 w9-20020adfd4c9000000b00313fff0ff44mr3870993wrk.38.1689769653872; Wed, 19 Jul
 2023 05:27:33 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
 <ZLbH+qC2j9FQ5pTE@geday> <ZLddxy5Bxgudk9vi@geday>
 <CAJrgGbbe5rmCS0UK7_Qc=+PR1LCBSU-oRRX2zB_Ljsq2J15oFw@mail.gmail.com>
 <87r0p4l3x7.wl-tiwai@suse.de>
In-Reply-To: <87r0p4l3x7.wl-tiwai@suse.de>
From: Ico Bukvic <ico@vt.edu>
Date: Wed, 19 Jul 2023 08:27:21 -0400
Message-ID: 
 <CAJrgGbZm+haEO-_mpu6Sf45UPRYzuNZzVxQT27ZzAfH7VWPoHQ@mail.gmail.com>
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
To: Takashi Iwai <tiwai@suse.de>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>, alsa-devel@alsa-project.org
Message-ID-Hash: CLS2WOTKW7IFZQIYAQ425KLSW3DTD44F
X-Message-ID-Hash: CLS2WOTKW7IFZQIYAQ425KLSW3DTD44F
X-MailFrom: ico@vt.edu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLS2WOTKW7IFZQIYAQ425KLSW3DTD44F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmsgeW91LCBUYWthc2hpLg0KDQpPbiBSYXNwYmVycnkgUGkgNDAwIChvbmUgd2l0aCBidWls
dC1pbiBrZXlib2FyZCwgYWx0aG91Z2ggYW55IFJQaSBvciBMaW51eA0KY29tcHV0ZXIgd2l0aCBI
RE1JIG1vbml0b3Igd2l0aCBsb3Vkc3BlYWtlcnMgd2lsbCBkbyksIG9wZW4gcGQtbDJvcmsgKGEN
CnZhcmlhbnQgb2YgcHVyZS1kYXRhIGF2YWlsYWJsZSBhdCBodHRwOi8vYml0Lmx5L3BkLWwyb3Jr
OyBwdXJlLWRhdGEgYWxzbw0KaGFzIHRoaXMgc2FtZSBwcm9ibGVtKSBhbmQgZW5hYmxlIERTUC4g
RG8gdGhlIHNhbWUgYWZ0ZXIgY2hhbmdpbmcgYXVkaW8NCnNldHRpbmdzIHZpYSB0aGUgUHJlZmVy
ZW5jZXMgd2luZG93IChFZGl0LT5QcmVmZXJlbmNlcyksIHdoZXJlIHlvdSBjYW4NCnN3aXRjaCBh
bW9uZyBiYWNrZW5kcyAoQUxTQSB2cyBQb3J0YXVkaW8sIHZzIEpBQ0s7IEpBQ0sgZG9lcyBub3Qg
d29yayB3aXRoDQphbnkgc2V0dGluZykuIElmIHlvdSBoYXZlIHByb3BlciBhdWRpbyBzZXR0aW5n
cyAoMCBpbiwgMiBvdXQsIGFuZCBhDQpzdXBwb3J0ZWQgU1IsIHIuZy4gNDQsMWtIeiksIHlvdSB3
aWxsIGhlYXIgdGhlIGJ1enosIGFuZCB3aWxsIGFsc28gaGVhciB0aGUNCmRlc2lyZWQgYXVkaW8g
cHJvZHVjZWQgKGUuZy4gYnkgcnVubmluZyBNZWRpYS0+QXVkaW8gVGVzdGVyKSBmYWludGx5LCB3
aXRoDQpidXp6IGJyaW5nIGF0IHRoZSBmb3JlZnJvbnQuIE9yLCB5b3Ugd2lsbCBoZWFyIGV2ZXJ5
dGhpbmcgT0sgKGRlZmF1bHQgUHVsc2UNCnNldHRpbmdzKSwgb3Igbm90aGluZy4gQUxTQSBhbmQg
UG9ydEF1ZGlvIHNldHRpbmdzIGFyZSBkZWZhdWx0DQpSYXNwYmlhbihSUGkpL1VidW50dSAoZGVz
a3RvcCkuIFRoYW5rIHlvdS4NCg0KQmVzdCwNCg0KSWNvDQoNCi0tIA0KSXZpY2EgSWNvIEJ1a3Zp
YywgRC5NLkEuDQpEaXJlY3RvciwgQ3JlYXRpdml0eSArIElubm92YXRpb24NCkluc3RpdHV0ZSBm
b3IgQ3JlYXRpdml0eSwgQXJ0cywgYW5kIFRlY2hub2xvZ3kNCg0KVmlyZ2luaWEgVGVjaA0KQ3Jl
YXRpdmUgVGVjaG5vbG9naWVzIGluIE11c2ljDQpTY2hvb2wgb2YgUGVyZm9ybWluZyBBcnRzIOKA
kyAwMTQxDQpCbGFja3NidXJnLCBWQSAyNDA2MQ0KKDU0MCkgMjMxLTYxMzkNCmljb0B2dC5lZHUN
Cg0KY2kuaWNhdC52dC5lZHUNCmwyb3JrLmljYXQudnQuZWR1DQppY28uYnVrdmljLm5ldA0KDQpP
biBXZWQsIEp1bCAxOSwgMjAyMywgMDQ6MDggVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3
cm90ZToNCg0KPiBPbiBXZWQsIDE5IEp1bCAyMDIzIDA3OjU4OjE3ICswMjAwLA0KPiBJY28gQnVr
dmljIHdyb3RlOg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciBhIGZvbGxvdy11cC4gSG93IHdvdWxk
IG9uZSBzZXQgc3VjaCBhIGZsYWcgaW4gYWxzYT8gVXNpbmcNCj4gPiBhbHNhY3RsIG9yIGJ5IGVk
aXRpbmcgYSBjb25maWcgZmlsZT8gVGhlIGFwcCBpbiBxdWVzdGlvbiBzZWVrcyB0byBvcGVuDQo+
IHRoZQ0KPiA+IGF1ZGlvIGhhcmR3YXJlIGRpcmVjdGx5IHRvIG1pbmltaXplIGxhdGVuY3kuIEFu
eSBleGFtcGxlcyBhcmUNCj4gYXBwcmVjaWF0ZWQuDQo+DQo+IENvdWxkIHlvdSBzaG93IGhvdyBl
eGFjdGx5IHlvdSBkaWQgdGVzdD8NCj4NCj4gVGhlIGZhY3QgdGhhdCBQQSB3b3JrcyBpbXBsaWVz
IHRoYXQgdGhlIGRldmljZSBpcyBiYXNpY2FsbHkgd29ya2luZw0KPiB3aGVuIHJ1bm5pbmcgd2l0
aCBhIHByb3BlciBzZXR1cCAoZS5nLiB3aXRoIGhkbWk6KiBQQ00sIGV0Yy4pDQo+DQo+DQo+IFRh
a2FzaGkNCj4NCj4gPg0KPiA+IEJlc3QsDQo+ID4NCj4gPiBJY28NCj4gPg0KPiA+IC0tDQo+ID4g
SXZpY2EgSWNvIEJ1a3ZpYywgRC5NLkEuDQo+ID4gRGlyZWN0b3IsIENyZWF0aXZpdHkgKyBJbm5v
dmF0aW9uDQo+ID4gRGlyZWN0b3IsIEh1bWFuLUNlbnRlcmVkIERlc2lnbiBpUGhEDQo+ID4gSW5z
dGl0dXRlIGZvciBDcmVhdGl2aXR5LCBBcnRzLCBhbmQgVGVjaG5vbG9neQ0KPiA+DQo+ID4gVmly
Z2luaWEgVGVjaA0KPiA+IENyZWF0aXZlIFRlY2hub2xvZ2llcyBpbiBNdXNpYw0KPiA+IFNjaG9v
bCBvZiBQZXJmb3JtaW5nIEFydHMg4oCTIDAxNDENCj4gPiBCbGFja3NidXJnLCBWQSAyNDA2MQ0K
PiA+ICg1NDApIDIzMS02MTM5DQo+ID4gaWNvQHZ0LmVkdQ0KPiA+DQo+ID4gY2kuaWNhdC52dC5l
ZHUNCj4gPiBsMm9yay5pY2F0LnZ0LmVkdQ0KPiA+IGljby5idWt2aWMubmV0DQo+ID4NCj4gPg0K
PiA+DQo+ID4gT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTE6NTHigK9QTSBHZXJhbGRvIE5hc2Np
bWVudG8gPA0KPiA+IGdlcmFsZG9nYWJyaWVsQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiA+
IE9uIFR1ZSwgSnVsIDE4LCAyMDIzIGF0IDAyOjEyOjMxUE0gLTAzMDAsIEdlcmFsZG8gTmFzY2lt
ZW50byB3cm90ZToNCj4gPiA+ID4gT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTI6MjI6MzVQTSAt
MDQwMCwgSWNvIEJ1a3ZpYyB3cm90ZToNCj4gPiA+ID4gPiBIaSBhbGwsDQo+ID4gPiA+DQo+ID4g
PiA+IEhpIEljbyBhbmQgZnJpZW5kcywNCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkg
aGF2ZSBhIGNvbnN1bWVyLWxldmVsIHNldHVwIGF1ZGlvIHF1ZXN0aW9uLiBNeSByZXNlYXJjaCBw
cm9qZWN0DQo+IHVzZXMNCj4gPiA+IGENCj4gPiA+ID4gPiBSYXNwYmVycnkgUGkgaW4gY29uanVu
Y3Rpb24gd2l0aCBhIHNtYWxsIHBvcnRhYmxlIG1vbml0b3IgdGhhdCBoYXMNCj4gPiA+IGJ1aWx0
LWluDQo+ID4gPiA+ID4gbG91ZHNwZWFrZXJzIHRoYXQgYXJlIHRvIGJlIHVzZWQgdmlhIEhETUkg
Y29ubmVjdGlvbi4gVGhlIGdvYWwNCj4gaGVyZSBpcw0KPiA+ID4gPiA+IHBvcnRhYmlsaXR5IGFu
ZCBtaW5pbWFsIGNvc3QuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBDdXJpb3VzbHksIHdoZW4gdHJ5
aW5nIHRvIGNvbm5lY3QgdG8gbW9uaXRvcidzIGxvdWRzcGVha2VycyAodmlhDQo+IEhETUkpDQo+
ID4gPiA+ID4gdXNpbmcgQUxTQSwgbm8gbWF0dGVyIHdoYXQgc2V0dGluZ3MgSSBwaWNrLCBhdCB3
b3JzdCBJIGNhbm5vdCBnZXQNCj4gPiA+ID4gPiBhdWRpbyBvdXQsIGFuZCBhdCBiZXN0LCBnZXQg
YSBidXp6eSBzb3VuZCB3aG9zZSB3YXZlZm9ybSBpcyBpbiB0aGUNCj4gPiA+IGF0dGFjaGVkDQo+
ID4gPiA+ID4gaW1hZ2UuIFRoZSBzb3VuZCBpcyBjbGVhcmx5IHBlcmlvZGljIGFuZCBpbXB1bHNl
LWxpa2UuIEl0IGhhcHBlbnMNCj4gPiA+IGV2ZXJ5IDU5DQo+ID4gPiA+ID4gc2FtcGxlcy4gQ2hh
bmdpbmcgc2FtcGxlIHJhdGUgaW5jcmVhc2VzIHBpdGNoLCBzdWdnZXN0aW5nIDU5DQo+IHNhbXBs
ZXMNCj4gPiA+IHJlbWFpbg0KPiA+ID4gPiA+IGNvbnN0YW50IHJlZ2FyZGxlc3Mgb2YgdGhlIHNh
bXBsaW5nIHJhdGUuIFdoZW4gcGxheWluZyB0aGUgYWN0dWFsDQo+ID4gPiBhdWRpbywNCj4gPiA+
ID4gPiB5b3UgY2FuIGhlYXIgaXQgaW4gdGhlIGJhY2tncm91bmQsIGJ1dCB0aGlzIGJ1enogaXMg
ZWFzaWx5DQo+ID4gPiBvdmVycG93ZXJpbmcgaXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+
ID4gSWNvLCBqdXN0IGEgd2lsZCBndWVzcyBidXQgYXJlIHlvdSBzdXJlIHlvdSBhcmUgbm90IGNh
cHR1cmluZyB0aGUgcmF3DQo+ID4gPiBTUERJRg0KPiA+ID4gPiBzaWduYWwgZ29pbmcgdGhyb3Vn
aCBIRE1JIGluc3RlYWQgb2YgTGluZWFyIFBDTSBhdWRpbyBzaWduYWw/DQo+ID4gPg0KPiA+ID4g
SGVyZSdzIGEgY29tbWVudCBmcm9tIHRoZSBWQzQgSERNSSBkcml2ZXI6DQo+ID4gPg0KPiA+ID4g
ICogSERNSSBhdWRpbyBpcyBpbXBsZW1lbnRlZCBlbnRpcmVseSB3aXRoaW4gdGhlIEhETUkgSVAg
YmxvY2suICBBDQo+ID4gPiAgKiByZWdpc3RlciBpbiB0aGUgSERNSSBlbmNvZGVyIHRha2VzIFNQ
RElGIGZyYW1lcyBmcm9tIHRoZSBETUEgZW5naW5lDQo+ID4gPiAgKiBhbmQgdHJhbnNmZXJzIHRo
ZW0gb3ZlciBhbiBpbnRlcm5hbCBNQUkgKG11bHRpLWNoYW5uZWwgYXVkaW8NCj4gPiA+ICAqIGlu
dGVyY29ubmVjdCkgYnVzIHRvIHRoZSBlbmNvZGVyIHNpZGUgZm9yIGluc2VydGlvbiBpbnRvIHRo
ZSB2aWRlbw0KPiA+ID4gICogYmxhbmsgcmVnaW9ucy4NCj4gPiA+DQo+ID4gPiBBbmQgdGhlcmUn
cyB0aGlzIHBlcmhhcHMgY2xvc2VseSByZWxhdGVkIG9sZCBpc3N1ZSB3aXRoIHRoZSB2ZW5kb3IN
Cj4gPiA+IGtlcm5lbCBhbmQgQW5kcm9pZDoNCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnlwaS9saW51eC9pc3N1ZXMvNDY1NA0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiBDaGFu
Z2luZyBzYW1wbGUgcmF0ZSBvciBiaXQgZGVwdGgsIG9yIGJ1ZmZlcmluZywgbWFrZXMgbm8NCj4g
ZGlmZmVyZW5jZS4NCj4gPiA+ID4gPiBTZWxlY3RpbmcgOCBjaGFubmVscyBmb3Igb3V0cHV0IChv
bmUgb2YgSERNSSdzIHN0YW5kYXJkcywgYXMgZmFyDQo+IGFzIEkNCj4gPiA+IGNhbg0KPiA+ID4g
PiA+IHRlbGwpLCBzb21ldGltZXMgbWFuYWdlcyB0byBvdXRwdXQgYSB0aW55IGNodW5rIG9mIGEg
Z29vZCBhdWRpbw0KPiA+ID4gc2FtcGxlLCBhbmQNCj4gPiA+ID4gPiB0aGVuIGdvZXMgc2lsZW50
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm93LCBldmVuIG1vcmUgY3VyaW91c2x5LCB3aGVuIHVz
aW5nIHRoZSBwb3J0YXVkaW8gYmFja2VuZCBhbmQNCj4gPiA+IGNvbm5lY3RpbmcNCj4gPiA+ID4g
PiB0byB0aGUgZGVmYXVsdCBwdWxzZWF1ZGlvIHNpbmssIHdvcmtzIGp1c3QgZmluZS4gV2hhdCBj
b3VsZCBiZQ0KPiBjYXVzaW5nDQo+ID4gPiB0aGlzDQo+ID4gPiA+ID4gZGlzY3JlcGFuY3k/DQo+
ID4gPiA+DQo+ID4gPiA+IFBlcmhhcHMgUG9ydEF1ZGlvIGlzIGZvcmNpbmcgdGhlIExpbmVhciBQ
Q00gYml0cyBvbiB0aGUgdW5kZXJseWluZw0KPiBBTFNBDQo+ID4gPiA+IGJhY2tlbmQgc29tZWhv
dywgc2VlIGZvciBleGFtcGxlOg0KPiA+ID4gPiBodHRwczovL2Zvc3NpZXMub3JnL2xpbnV4L2Fs
c2EtbGliL3NyYy9jb25mL3BjbS9pZWM5NTguY29uZg0KPiA+ID4gPiBCdXQgdGhpcyBpcyBqdXN0
IHdpbGQgc3BlY3VsYXRpb24sIGl0IG1heSBvciBtYXkgbm90IGJlIHRoZSBjYXNlIHdpdGgNCj4g
PiA+ID4geW91ciByZXBvcnQuIEl0J3MgYmVzdCBpZiB5b3UgYXNrIFRha2FzaGkgSXdhaSBhbmQg
SmFyb3NsYXYgS3lzZWxhDQo+ID4gPiA+IGRpcmVjdGx5IHRocm91Z2ggdGhlIGxpc3Qgd2l0aCBD
YzogaW4gY2FzZSBub2JvZHkgZWxzZSBoYXMgYW55IG1vcmUNCj4gPiA+ID4gaWRlYXMgb2Ygd2hh
dCBjb3VsZCBiZSB0aGUgcm9vdCBjYXVzZSBvZiB5b3VyIHJlcG9ydC4NCj4gPiA+DQo+ID4gPiBZ
b3UncmUgcHJvYmFibHkgc2VuZGluZyBQQ00gZGF0YSB0byBIRE1JLCB3aGljaCBleHBlY3RzIFNQ
RElGIGZyYW1lcw0KPiA+ID4gaW5zdGVhZCwgYW5kIFBvcnRBdWRpbyArIFB1bHNlQXVkaW8gc2Vl
bXMgdG8gYmUgYXdhcmUgb2YgdGhpcy4gVGhhdCdzDQo+IG15DQo+ID4gPiB0aGVvcnkgYXQgbGVh
c3QuIFNldHRpbmcgdGhlIG5lY2Vzc2FyeSBiaXRzIGFuZCBuZWNlc3NhcnkgSUVDOTU4IGZvcm1h
dA0KPiA+ID4gb24geW91ciBBTFNBIHBsYXliYWNrIG1heSByZXNvbHZlIHlvdXIgaXNzdWUuDQo+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBHb29kIGx1Y2ssDQo+ID4gPiA+IEdlcmFsZG8gTmFzY2lt
ZW50bw0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQmVzdCwNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEljbw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiBJdmljYSBJY28g
QnVrdmljLCBELk0uQS4NCj4gPiA+ID4gPiBEaXJlY3RvciwgQ3JlYXRpdml0eSArIElubm92YXRp
b24NCj4gPiA+ID4gPiBEaXJlY3RvciwgSHVtYW4tQ2VudGVyZWQgRGVzaWduIGlQaEQNCj4gPiA+
ID4gPiBJbnN0aXR1dGUgZm9yIENyZWF0aXZpdHksIEFydHMsIGFuZCBUZWNobm9sb2d5DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBWaXJnaW5pYSBUZWNoDQo+ID4gPiA+ID4gQ3JlYXRpdmUgVGVjaG5v
bG9naWVzIGluIE11c2ljDQo+ID4gPiA+ID4gU2Nob29sIG9mIFBlcmZvcm1pbmcgQXJ0cyDigJMg
MDE0MQ0KPiA+ID4gPiA+IEJsYWNrc2J1cmcsIFZBIDI0MDYxDQo+ID4gPiA+ID4gKDU0MCkgMjMx
LTYxMzkNCj4gPiA+ID4gPiBpY29AdnQuZWR1DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBjaS5pY2F0
LnZ0LmVkdQ0KPiA+ID4gPiA+IGwyb3JrLmljYXQudnQuZWR1DQo+ID4gPiA+ID4gaWNvLmJ1a3Zp
Yy5uZXQNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+DQo+DQo=
