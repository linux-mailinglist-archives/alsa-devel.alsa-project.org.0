Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBE758D5B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 08:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E9E4201;
	Wed, 19 Jul 2023 08:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E9E4201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689746451;
	bh=noV19Aw32hEKjnUSsd+iLnvUkxhhXyA4t1QlejXaXv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ej0BO5HSUKEjllyF0SLEYxXqMQO095JPKQJb1KYyrp+jdnBS+Xq6O8Kk4yRfaAFUP
	 UyWKcYMUOL1FUNtwtoE/mwr7WkIhCKuUFlTuw6aFdFWreH5L7lj58CDaKE1YYIgfrZ
	 vODa9FgnkBblRTgK6JGRDwDsLIiFyNZqf2fq+9Cs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C0ADF8047D; Wed, 19 Jul 2023 07:59:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC3AF8032D;
	Wed, 19 Jul 2023 07:59:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8D6F8047D; Wed, 19 Jul 2023 07:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 778CFF8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 07:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778CFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vt-edu.20221208.gappssmtp.com header.i=@vt-edu.20221208.gappssmtp.com
 header.a=rsa-sha256 header.s=20221208 header.b=aB6Wuarn
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso59913215e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 22:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20221208.gappssmtp.com; s=20221208; t=1689746309;
 x=1692338309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrFbAvW15nMf/OkWg/k0ACAJ3fr80Fi1Df4ZluO+JV4=;
        b=aB6WuarnG3LL1UUaBgXaK1kw6TEtS9Xgaglb5ABDWnpkl/Fv/KOECsdSyPYzbEyyFd
         sh0s6sWyoxZCiCVqSqVDrgUdc/f7X0pJe1BtGtEEeELdf39SXui8jmN0P9xKpQpWZPHs
         s4rCAizA2OsT7tFXcM/k1HgRI+dr7jTEmNcpJmxmab/Jk/523kkWFYM2FxdEW3VJiYel
         y4fxPKhECGwgsDPbeRaWLqx3bIwFmNZ1Kc5epmqBWeyHYarXNiYxPXcL6qZPidgtMQu1
         Ay9qWjJW8UR8tVPOLdvuWOVzLN/HozJRE0JfMrFemweAHF5k11fGVs8uXP/Oo6sbrGnm
         Zy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689746309; x=1692338309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrFbAvW15nMf/OkWg/k0ACAJ3fr80Fi1Df4ZluO+JV4=;
        b=eORwEBjrr8HP3WjHG50SghYlMjgfeNLH1UaH0ffwghvHtx2hUQlKYdwADsmdxj/6xg
         +nBcbP6B7zKpae1wPoV3GpOZPrjQ9ImfoZzwmsVdJENKjOvWHaUf8Eo/B2qitpOr7WhU
         E0fz1rw6vIGbE271w9qE9ibTyoCITYyM2tsEyflm45vfBSLn98h5nvoj1Q/8IsJ/92W1
         uxAvDJv13riUzxTUv8oktua1xjYZFu+9cfWyPrlWzjq4Fk87e2Yz4IlTKAhK74j1KWaw
         Di3OX1YpWTbhjXtGva0ZrGL5eXAhQhvzY1sxhpMCjixx0x3AXX6gPeVh6JS5hixhvK/b
         3RuQ==
X-Gm-Message-State: ABy/qLYOV65Qvwpu6GPAOxhAw87Skp+Rhpx6ZqAGq9B5GBRudGJ/A1GA
	QZTMeoNzf+EaEgR/1HVS/7mfxpkOKHIij2BnIDtobg==
X-Google-Smtp-Source: 
 APBJJlGozdeatSG/pdW9cLJzP93TxMKyqR5we7kymTwSlVqy/NLIUsifqGU4i7R9HYBkI4fCfwMRDA+5rJNHHE4aFuI=
X-Received: by 2002:adf:dc45:0:b0:315:83d4:7dd6 with SMTP id
 m5-20020adfdc45000000b0031583d47dd6mr1269915wrj.5.1689746309034; Tue, 18 Jul
 2023 22:58:29 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
 <ZLbH+qC2j9FQ5pTE@geday> <ZLddxy5Bxgudk9vi@geday>
In-Reply-To: <ZLddxy5Bxgudk9vi@geday>
From: Ico Bukvic <ico@vt.edu>
Date: Wed, 19 Jul 2023 01:58:17 -0400
Message-ID: 
 <CAJrgGbbe5rmCS0UK7_Qc=+PR1LCBSU-oRRX2zB_Ljsq2J15oFw@mail.gmail.com>
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: alsa-devel@alsa-project.org
Message-ID-Hash: VHQOUTCLDV23QER4OSQCPWNHNK3JJGLU
X-Message-ID-Hash: VHQOUTCLDV23QER4OSQCPWNHNK3JJGLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHQOUTCLDV23QER4OSQCPWNHNK3JJGLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmsgeW91IGZvciBhIGZvbGxvdy11cC4gSG93IHdvdWxkIG9uZSBzZXQgc3VjaCBhIGZsYWcg
aW4gYWxzYT8gVXNpbmcNCmFsc2FjdGwgb3IgYnkgZWRpdGluZyBhIGNvbmZpZyBmaWxlPyBUaGUg
YXBwIGluIHF1ZXN0aW9uIHNlZWtzIHRvIG9wZW4gdGhlDQphdWRpbyBoYXJkd2FyZSBkaXJlY3Rs
eSB0byBtaW5pbWl6ZSBsYXRlbmN5LiBBbnkgZXhhbXBsZXMgYXJlIGFwcHJlY2lhdGVkLg0KDQpC
ZXN0LA0KDQpJY28NCg0KLS0gDQpJdmljYSBJY28gQnVrdmljLCBELk0uQS4NCkRpcmVjdG9yLCBD
cmVhdGl2aXR5ICsgSW5ub3ZhdGlvbg0KRGlyZWN0b3IsIEh1bWFuLUNlbnRlcmVkIERlc2lnbiBp
UGhEDQpJbnN0aXR1dGUgZm9yIENyZWF0aXZpdHksIEFydHMsIGFuZCBUZWNobm9sb2d5DQoNClZp
cmdpbmlhIFRlY2gNCkNyZWF0aXZlIFRlY2hub2xvZ2llcyBpbiBNdXNpYw0KU2Nob29sIG9mIFBl
cmZvcm1pbmcgQXJ0cyDigJMgMDE0MQ0KQmxhY2tzYnVyZywgVkEgMjQwNjENCig1NDApIDIzMS02
MTM5DQppY29AdnQuZWR1DQoNCmNpLmljYXQudnQuZWR1DQpsMm9yay5pY2F0LnZ0LmVkdQ0KaWNv
LmJ1a3ZpYy5uZXQNCg0KDQoNCk9uIFR1ZSwgSnVsIDE4LCAyMDIzIGF0IDExOjUx4oCvUE0gR2Vy
YWxkbyBOYXNjaW1lbnRvIDwNCmdlcmFsZG9nYWJyaWVsQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4g
T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMDI6MTI6MzFQTSAtMDMwMCwgR2VyYWxkbyBOYXNjaW1l
bnRvIHdyb3RlOg0KPiA+IE9uIFR1ZSwgSnVsIDE4LCAyMDIzIGF0IDEyOjIyOjM1UE0gLTA0MDAs
IEljbyBCdWt2aWMgd3JvdGU6DQo+ID4gPiBIaSBhbGwsDQo+ID4NCj4gPiBIaSBJY28gYW5kIGZy
aWVuZHMsDQo+ID4NCj4gPiA+DQo+ID4gPiBJIGhhdmUgYSBjb25zdW1lci1sZXZlbCBzZXR1cCBh
dWRpbyBxdWVzdGlvbi4gTXkgcmVzZWFyY2ggcHJvamVjdCB1c2VzDQo+IGENCj4gPiA+IFJhc3Bi
ZXJyeSBQaSBpbiBjb25qdW5jdGlvbiB3aXRoIGEgc21hbGwgcG9ydGFibGUgbW9uaXRvciB0aGF0
IGhhcw0KPiBidWlsdC1pbg0KPiA+ID4gbG91ZHNwZWFrZXJzIHRoYXQgYXJlIHRvIGJlIHVzZWQg
dmlhIEhETUkgY29ubmVjdGlvbi4gVGhlIGdvYWwgaGVyZSBpcw0KPiA+ID4gcG9ydGFiaWxpdHkg
YW5kIG1pbmltYWwgY29zdC4NCj4gPiA+DQo+ID4gPiBDdXJpb3VzbHksIHdoZW4gdHJ5aW5nIHRv
IGNvbm5lY3QgdG8gbW9uaXRvcidzIGxvdWRzcGVha2VycyAodmlhIEhETUkpDQo+ID4gPiB1c2lu
ZyBBTFNBLCBubyBtYXR0ZXIgd2hhdCBzZXR0aW5ncyBJIHBpY2ssIGF0IHdvcnN0IEkgY2Fubm90
IGdldA0KPiA+ID4gYXVkaW8gb3V0LCBhbmQgYXQgYmVzdCwgZ2V0IGEgYnV6enkgc291bmQgd2hv
c2Ugd2F2ZWZvcm0gaXMgaW4gdGhlDQo+IGF0dGFjaGVkDQo+ID4gPiBpbWFnZS4gVGhlIHNvdW5k
IGlzIGNsZWFybHkgcGVyaW9kaWMgYW5kIGltcHVsc2UtbGlrZS4gSXQgaGFwcGVucw0KPiBldmVy
eSA1OQ0KPiA+ID4gc2FtcGxlcy4gQ2hhbmdpbmcgc2FtcGxlIHJhdGUgaW5jcmVhc2VzIHBpdGNo
LCBzdWdnZXN0aW5nIDU5IHNhbXBsZXMNCj4gcmVtYWluDQo+ID4gPiBjb25zdGFudCByZWdhcmRs
ZXNzIG9mIHRoZSBzYW1wbGluZyByYXRlLiBXaGVuIHBsYXlpbmcgdGhlIGFjdHVhbA0KPiBhdWRp
bywNCj4gPiA+IHlvdSBjYW4gaGVhciBpdCBpbiB0aGUgYmFja2dyb3VuZCwgYnV0IHRoaXMgYnV6
eiBpcyBlYXNpbHkNCj4gb3ZlcnBvd2VyaW5nIGl0Lg0KPiA+ID4NCj4gPg0KPiA+IEljbywganVz
dCBhIHdpbGQgZ3Vlc3MgYnV0IGFyZSB5b3Ugc3VyZSB5b3UgYXJlIG5vdCBjYXB0dXJpbmcgdGhl
IHJhdw0KPiBTUERJRg0KPiA+IHNpZ25hbCBnb2luZyB0aHJvdWdoIEhETUkgaW5zdGVhZCBvZiBM
aW5lYXIgUENNIGF1ZGlvIHNpZ25hbD8NCj4NCj4gSGVyZSdzIGEgY29tbWVudCBmcm9tIHRoZSBW
QzQgSERNSSBkcml2ZXI6DQo+DQo+ICAqIEhETUkgYXVkaW8gaXMgaW1wbGVtZW50ZWQgZW50aXJl
bHkgd2l0aGluIHRoZSBIRE1JIElQIGJsb2NrLiAgQQ0KPiAgKiByZWdpc3RlciBpbiB0aGUgSERN
SSBlbmNvZGVyIHRha2VzIFNQRElGIGZyYW1lcyBmcm9tIHRoZSBETUEgZW5naW5lDQo+ICAqIGFu
ZCB0cmFuc2ZlcnMgdGhlbSBvdmVyIGFuIGludGVybmFsIE1BSSAobXVsdGktY2hhbm5lbCBhdWRp
bw0KPiAgKiBpbnRlcmNvbm5lY3QpIGJ1cyB0byB0aGUgZW5jb2RlciBzaWRlIGZvciBpbnNlcnRp
b24gaW50byB0aGUgdmlkZW8NCj4gICogYmxhbmsgcmVnaW9ucy4NCj4NCj4gQW5kIHRoZXJlJ3Mg
dGhpcyBwZXJoYXBzIGNsb3NlbHkgcmVsYXRlZCBvbGQgaXNzdWUgd2l0aCB0aGUgdmVuZG9yDQo+
IGtlcm5lbCBhbmQgQW5kcm9pZDoNCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xp
bnV4L2lzc3Vlcy80NjU0DQo+DQo+ID4NCj4gPiA+IENoYW5naW5nIHNhbXBsZSByYXRlIG9yIGJp
dCBkZXB0aCwgb3IgYnVmZmVyaW5nLCBtYWtlcyBubyBkaWZmZXJlbmNlLg0KPiA+ID4gU2VsZWN0
aW5nIDggY2hhbm5lbHMgZm9yIG91dHB1dCAob25lIG9mIEhETUkncyBzdGFuZGFyZHMsIGFzIGZh
ciBhcyBJDQo+IGNhbg0KPiA+ID4gdGVsbCksIHNvbWV0aW1lcyBtYW5hZ2VzIHRvIG91dHB1dCBh
IHRpbnkgY2h1bmsgb2YgYSBnb29kIGF1ZGlvDQo+IHNhbXBsZSwgYW5kDQo+ID4gPiB0aGVuIGdv
ZXMgc2lsZW50Lg0KPiA+ID4NCj4gPiA+IE5vdywgZXZlbiBtb3JlIGN1cmlvdXNseSwgd2hlbiB1
c2luZyB0aGUgcG9ydGF1ZGlvIGJhY2tlbmQgYW5kDQo+IGNvbm5lY3RpbmcNCj4gPiA+IHRvIHRo
ZSBkZWZhdWx0IHB1bHNlYXVkaW8gc2luaywgd29ya3MganVzdCBmaW5lLiBXaGF0IGNvdWxkIGJl
IGNhdXNpbmcNCj4gdGhpcw0KPiA+ID4gZGlzY3JlcGFuY3k/DQo+ID4NCj4gPiBQZXJoYXBzIFBv
cnRBdWRpbyBpcyBmb3JjaW5nIHRoZSBMaW5lYXIgUENNIGJpdHMgb24gdGhlIHVuZGVybHlpbmcg
QUxTQQ0KPiA+IGJhY2tlbmQgc29tZWhvdywgc2VlIGZvciBleGFtcGxlOg0KPiA+IGh0dHBzOi8v
Zm9zc2llcy5vcmcvbGludXgvYWxzYS1saWIvc3JjL2NvbmYvcGNtL2llYzk1OC5jb25mDQo+ID4g
QnV0IHRoaXMgaXMganVzdCB3aWxkIHNwZWN1bGF0aW9uLCBpdCBtYXkgb3IgbWF5IG5vdCBiZSB0
aGUgY2FzZSB3aXRoDQo+ID4geW91ciByZXBvcnQuIEl0J3MgYmVzdCBpZiB5b3UgYXNrIFRha2Fz
aGkgSXdhaSBhbmQgSmFyb3NsYXYgS3lzZWxhDQo+ID4gZGlyZWN0bHkgdGhyb3VnaCB0aGUgbGlz
dCB3aXRoIENjOiBpbiBjYXNlIG5vYm9keSBlbHNlIGhhcyBhbnkgbW9yZQ0KPiA+IGlkZWFzIG9m
IHdoYXQgY291bGQgYmUgdGhlIHJvb3QgY2F1c2Ugb2YgeW91ciByZXBvcnQuDQo+DQo+IFlvdSdy
ZSBwcm9iYWJseSBzZW5kaW5nIFBDTSBkYXRhIHRvIEhETUksIHdoaWNoIGV4cGVjdHMgU1BESUYg
ZnJhbWVzDQo+IGluc3RlYWQsIGFuZCBQb3J0QXVkaW8gKyBQdWxzZUF1ZGlvIHNlZW1zIHRvIGJl
IGF3YXJlIG9mIHRoaXMuIFRoYXQncyBteQ0KPiB0aGVvcnkgYXQgbGVhc3QuIFNldHRpbmcgdGhl
IG5lY2Vzc2FyeSBiaXRzIGFuZCBuZWNlc3NhcnkgSUVDOTU4IGZvcm1hdA0KPiBvbiB5b3VyIEFM
U0EgcGxheWJhY2sgbWF5IHJlc29sdmUgeW91ciBpc3N1ZS4NCj4NCj4gPg0KPiA+IEdvb2QgbHVj
aywNCj4gPiBHZXJhbGRvIE5hc2NpbWVudG8NCj4gPg0KPiA+ID4NCj4gPiA+IEJlc3QsDQo+ID4g
Pg0KPiA+ID4gSWNvDQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IEl2aWNhIEljbyBCdWt2aWMsIEQu
TS5BLg0KPiA+ID4gRGlyZWN0b3IsIENyZWF0aXZpdHkgKyBJbm5vdmF0aW9uDQo+ID4gPiBEaXJl
Y3RvciwgSHVtYW4tQ2VudGVyZWQgRGVzaWduIGlQaEQNCj4gPiA+IEluc3RpdHV0ZSBmb3IgQ3Jl
YXRpdml0eSwgQXJ0cywgYW5kIFRlY2hub2xvZ3kNCj4gPiA+DQo+ID4gPiBWaXJnaW5pYSBUZWNo
DQo+ID4gPiBDcmVhdGl2ZSBUZWNobm9sb2dpZXMgaW4gTXVzaWMNCj4gPiA+IFNjaG9vbCBvZiBQ
ZXJmb3JtaW5nIEFydHMg4oCTIDAxNDENCj4gPiA+IEJsYWNrc2J1cmcsIFZBIDI0MDYxDQo+ID4g
PiAoNTQwKSAyMzEtNjEzOQ0KPiA+ID4gaWNvQHZ0LmVkdQ0KPiA+ID4NCj4gPiA+IGNpLmljYXQu
dnQuZWR1DQo+ID4gPiBsMm9yay5pY2F0LnZ0LmVkdQ0KPiA+ID4gaWNvLmJ1a3ZpYy5uZXQNCj4g
Pg0KPiA+DQo+DQo=
