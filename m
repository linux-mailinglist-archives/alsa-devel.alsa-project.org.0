Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E775C0F1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:11:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C3D112;
	Fri, 21 Jul 2023 10:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C3D112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927081;
	bh=IHzfN2SBeEQ6tHKNnnnM8t8qWb+ccyILllCLCR+GuRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QirTbdzxwhq6rL5PESTq2TfSx6u+Lqy9OgDKGKHSaxp5LRU1v+a6y+shKA3smonF0
	 cypiEaY2FqUyC1X8t51Izhx6uDv3e1A3wuhnAUZ0ZsAPPqryDhinLttBGjPM6zRvpi
	 4zdBAia6K5OEbMhuNT/53eqg7bx7tC6EN4cMaTrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89DBCF805BF; Fri, 21 Jul 2023 10:08:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A62F805B4;
	Fri, 21 Jul 2023 10:08:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75C45F8047D; Thu, 20 Jul 2023 03:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60D77F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 03:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D77F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Gi0BqrnQ
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b8392076c9so3511351fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 18:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689818200; x=1692410200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+9TVMLeLPk1AYtk7l/JhHfKXzw9zOxiT1iUTi5/1DXI=;
        b=Gi0BqrnQF6LlrQwQhJipWCIBSZu6Bx3EPxBQgFZhae9cwqxD133Iulkq9NHn7endfE
         GtajudHL8qUZ1IzJF4n2K1YsGQeIx9gctFFuxAYYJbmT47Iw48Pf2QzpokaO8ppozmjx
         7ldR3ZrhSSRG5PJ9fvvp8dEPKp8YUFxelOSedUuF6jLF/dlxB3RNew0eVuHB69gHRirx
         6QUHM5o4vk31QtGVnGzr1W2IhjfB/Lg4MPtvd+/+64QUPtUGu2Wb+dKLC1f+Tu7+oh+G
         eGzpOe6ceaIw86w6y6ovC3oM/JI0oT9zRfQzW5/RfnCQRuzt/EdLX3JGA5ItehqnrM60
         H+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689818200; x=1692410200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9TVMLeLPk1AYtk7l/JhHfKXzw9zOxiT1iUTi5/1DXI=;
        b=KQErs5cxgxQ82n7AkSUOpFd1CP4Og1VMene4soXGg830B+U42Kl47kfddpHy1v0aYv
         UmZ+kHsThAw8j7KsRD26Yev2DahxjaNwaUwsg5gtpb7tQM3vuf/L9Y7A3MBx5RZyYtVd
         2n5su3iF8yKcmwxUWULidIjuQmMk2koq4JE5ySP6bxUl65LU9pncBqDiNuQDeVeLbvBF
         tgfGK38wNktR7zmznb/RQbE4MqVrdscMYPkvbF4vwH/jgV33SSatfF9Ea3A63NjnuZbx
         MjeTCba9uIkXtNqIrRbGrPgf7YJFOi4pi+BB7fsVgFtpmPm3plWcGxDxYbv4gnhDhMat
         r4cg==
X-Gm-Message-State: ABy/qLYHSMh//UM084tjDgGx1s88rPnTV4IK41qaRhHgdHXdJByTpA+X
	7gaKorGvw781yhZ9Ozq8tQHVhaTerh66dfGoBCk=
X-Google-Smtp-Source: 
 APBJJlEn93e5NNrheum0Y9W+5Ih/BBXg6Oo/+uU+6bLTEpwgHD5JB27FLcY66xh8/jkUS2s7ZmkZS/iwZozsbTbUsu4=
X-Received: by 2002:a2e:9901:0:b0:2b6:df6b:84c0 with SMTP id
 v1-20020a2e9901000000b002b6df6b84c0mr669966lji.25.1689818199591; Wed, 19 Jul
 2023 18:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
In-Reply-To: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
From: Racinglee <cydiaimpactor2003@gmail.com>
Date: Wed, 19 Jul 2023 18:56:28 -0700
Message-ID: 
 <CAL4Djy2b9pOLEsk0j1jGZ6oaipMM8wM9xiDPiTfO0hv_0B3sdQ@mail.gmail.com>
Subject: Re: 6.4 and higher causes audio distortion
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ALSA Development <alsa-devel@alsa-project.org>
X-MailFrom: cydiaimpactor2003@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AMV4RZGWQAW2HV2OUUV5UZIT6MKT6XIJ
X-Message-ID-Hash: AMV4RZGWQAW2HV2OUUV5UZIT6MKT6XIJ
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:45 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMV4RZGWQAW2HV2OUUV5UZIT6MKT6XIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VXBkYXRpbmcgcmVnemJvdCBhZnRlciBuZXdlciBmaW5kaW5ncyBhbmQgZGV0ZXJtaW5hdGlvbnMg
YWJvdXQgdGhlIHBvc3NpYmxlDQpjdWxwcml0IGNvbW1pdA0KDQojcmVnemJvdCB0aXRsZTogNi40
IGFuZCBoaWdoZXIgY2F1c2VzIGF1ZGlvIGRpc3RvcnRpb24NCg0KI3JlZ3pib3QgaW50cm9kdWNl
ZDogdjYuNC1yYzEuLjFiZjgzZmE2NjU0Yw0KaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTc2NzMjYzUNCg0KT24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMzo1NuKA
r0FNIEJhZ2FzIFNhbmpheWEgPGJhZ2FzZG90bWVAZ21haWwuY29tPiB3cm90ZToNCg0KPiBIaSwN
Cj4NCj4gSSBub3RpY2UgYSByZWdyZXNzaW9uIHJlcG9ydCBvbiBCdWd6aWxsYSBbMV0uIFF1b3Rp
bmcgZnJvbSBpdDoNCj4NCj4gPiBJIGhhdmUgYSBMZW5vdm8gVGhpbmtQYWQgWDEgWW9nYSBHZW4g
NyBydW5uaW5nIEFyY2ggTGludXguIExpbnV4IDYuNCBhbmQNCj4gaGlnaGVyLCBjYXVzZSBhdWRp
byBkaXN0b3J0aW9uLiBTb21ldGltZXMsIHRoaXMgb2NjdXJzIHRvIHRoZSBwb2ludCB0aGF0DQo+
IG5lYXJseSBub3RoaW5nIGlzIGRpc2Nlcm5pYmxlLiBUaGlzIGNhcnJpZXMgb3ZlciB0byB3aXJl
ZCBoZWFkcGhvbmVzLiBUaGUNCj4gaXNzdWUgb2NjdXJzIG9uIHRoZSBlbnRpcmUgbWFpbmxpbmUg
Ni40Lngga2VybmVsIHNlcmllcyBhbmQgYWxzbyB0aGUgNi40LjMNCj4gc3RhYmxlIGFuZCA2LjUg
UkMxIGtlcm5lbCwgd2hpY2ggYXJlIHRoZSBsYXRlc3QgYXQgdGhlIHRpbWUgb2Ygd3JpdGluZy4g
VGhlDQo+IGlzc3VlIG9jY3VycyBvbiBib3RoIHRoZSBBcmNoIGRpc3RyaWJ1dGVkIGtlcm5lbHMs
IGFuZCB0aGUgbWFpbmxpbmUga2VybmVscy4NCj4gPg0KPiA+IExpbnV4IGtlcm5lbHMgNi4zLngg
YXJlIG5vdCBhZmZlY3RlZCBhbmQgbmVpdGhlciBpcyB0aGUgNi4xIExUUyBrZXJuZWwNCj4gc2Vy
aWVzIHdoaWNoIGlzIHdoYXQgSSBhbSB0ZW1wb3JhcmlseSB1c2luZy4gT24gV2luZG93cyAxMC8x
MSB0b28sIHRoZQ0KPiBhdWRpbyB3b3JrcyBhcyBpdCBzaG91bGQuIFRoaXMgaW5kaWNhdGVzIHRo
YXQgbXkgaGFyZHdhcmUgaXMgbm90IGF0IGZhdWx0Lg0KPiBCbHVldG9vdGggYXVkaW8gaXMgbm90
IGltcGFjdGVkIGZyb20gbXkgdGVzdGluZywgZWl0aGVyLg0KPiA+DQo+ID4gVGhlIGRpc3RvcnRp
b24gZG9lc24ndCBzdGFydCBpbW1lZGlhdGVseS4gSXQgZWl0aGVyIG9jY3VycyBhdXRvbWF0aWNh
bGx5DQo+IGFmdGVyIGEgcmFuZG9tIGFtb3VudCBvZiB0aW1lLCBvciB3aGVuIEkgaW5jcmVhc2Uv
ZGVjcmVhc2UgdGhlIHZvbHVtZSwgb3INCj4gd2hlbiBJIHNraXAgZm9yd2FyZC9iYWNrd2FyZCB0
byBhIHNlY3Rpb24uIEluIG9yZGVyIHRvIHN0b3AgdGhlIGRpc3RvcnRpb24sDQo+IEkgaGF2ZSB0
byBlaXRoZXIgaW5jcmVhc2UvZGVjcmVhc2UgdGhlIHZvbHVtZSB1bnRpbCBpdCBzdG9wcywgb3Ig
c2tpcA0KPiBmb3J3YXJkL2JhY2t3YXJkIHVudGlsIGl0IHN0b3BzLCBvciByZXN0YXJ0IFBpcGV3
aXJlIHZpYSBzeXN0ZW1kLCBob3dldmVyDQo+IGl0IHN0YXJ0cyBhZ2FpbiBkdWUgdG8gb25lIG9m
IHRoZSBhZm9yZW1lbnRpb25lZCByZWFzb25zLg0KPiA+DQo+ID4gQXQgdGhlIHRpbWUgb2YgdGhp
cyByZXBvcnQsIEkgYW0gcnVubmluZyBQaXBld2lyZSAwLjMuNzQgYW5kIFdpcmVwbHVtYmVyDQo+
IDAuNC4xNC4gVGhpcyBhbHNvIGRvZXNuJ3Qgc2VlbSBsaWtlIGEgUGlwZXdpcmUvV2lyZXBsdW1i
ZXIgaXNzdWUsIHNpbmNlDQo+IHRoZXNlIHNhbWUgdmVyc2lvbnMgd29yayBmaW5lIG9uIHRoZSA2
LjEgTFRTIGtlcm5lbHMgd2l0aG91dCBjYXVzaW5nIGFueQ0KPiBhdWRpbyBkaXN0b3J0aW9uLg0K
PiA+DQo+ID4gSSB3cm90ZSBhYm91dCB0aGlzIG9uIHRoZSBBcmNoIExpbnV4IGZvcnVtcywgdG9v
LCBhbmQgc2VlbXMgbGlrZSBhdA0KPiBsZWFzdCB0d28gb3RoZXIgcGVvcGxlIGFyZSBmYWNpbmcg
dGhpcyBpc3N1ZS4gSGVyZSdzIHRoZSBmb3J1bSBwb3N0Og0KPiBodHRwczovL2Jicy5hcmNobGlu
dXgub3JnL3ZpZXd0b3BpYy5waHA/aWQ9Mjg3MDY4DQo+ID4NCj4gPiBGdXJ0aGVybW9yZSwgSSBm
aWxlZCBhIGJ1ZyByZXBvcnQgb24gdGhlIEFyY2ggTGludXggQnVnIFJlcG9ydGVyLCB3aGVyZQ0K
PiB0aGV5IHN1Z2dlc3RlZCB0aGF0IHRoZSBpc3N1ZSBpcyBhIGtlcm5lbCByZWdyZXNzaW9uIGFu
ZCBzaG91bGQgYmUgcmVwb3J0ZWQNCj4gdXBzdHJlYW0sIGhlcmUuIEhlcmUncyB0aGUgYnVnIHJl
cG9ydCB0aGF0IEkgZmlsZWQgb24gdGhlIEFyY2ggTGludXggQnVnDQo+IFJlcG9ydGVyIGZvciBh
bnlvbmUgaW50ZXJlc3RlZDoNCj4gaHR0cHM6Ly9idWdzLmFyY2hsaW51eC5vcmcvdGFzay83OTA4
MT9wcm9qZWN0PTEmcGFnZW51bT0xMA0KPiA+DQo+ID4gSSBoYXZlIGF0dGFjaGVkIHRoZSBkbWVz
ZyBvdXRwdXRzIG9mIHRoZSBtYWlubGluZSA2LjUgUkMxIGtlcm5lbC4NCj4gPg0KPiA+IEhlcmUn
cyBzb21lIGF1ZGlvIHJlbGF0ZWQgaGFyZHdhcmUgaW5mb3JtYXRpb24gZnJvbSBteSBkZXZpY2U6
DQo+ID4NCj4gPiBpbnhpIC1BDQo+ID4NCj4gPiBBdWRpbzoNCj4gPiBEZXZpY2UtMTogSW50ZWwg
QWxkZXIgTGFrZSBQQ0gtUCBIaWdoIERlZmluaXRpb24gQXVkaW8NCj4gPiBkcml2ZXI6IHNvZi1h
dWRpby1wY2ktaW50ZWwtdGdsDQo+ID4gQVBJOiBBTFNBIHY6IGs2LjUuMC1yYzEtMS1tYWlubGlu
ZSBzdGF0dXM6IGtlcm5lbC1hcGkNCj4gPg0KPiA+DQo+ID4gcGFjdGwgaW5mbw0KPiA+DQo+ID4g
U2VydmVyIFN0cmluZzogL3J1bi91c2VyLzEwMDAvcHVsc2UvbmF0aXZlDQo+ID4gTGlicmFyeSBQ
cm90b2NvbCBWZXJzaW9uOiAzNQ0KPiA+IFNlcnZlciBQcm90b2NvbCBWZXJzaW9uOiAzNQ0KPiA+
IElzIExvY2FsOiB5ZXMNCj4gPiBDbGllbnQgSW5kZXg6IDEzOA0KPiA+IFRpbGUgU2l6ZTogNjU0
NzINCj4gPiBVc2VyIE5hbWU6IHR1eA0KPiA+IEhvc3QgTmFtZTogTlNBLVRlcm1pbmFsLTQNCj4g
PiBTZXJ2ZXIgTmFtZTogUHVsc2VBdWRpbyAob24gUGlwZVdpcmUgMC4zLjc0KQ0KPiA+IFNlcnZl
ciBWZXJzaW9uOiAxNS4wLjANCj4gPiBEZWZhdWx0IFNhbXBsZSBTcGVjaWZpY2F0aW9uOiBmbG9h
dDMybGUgMmNoIDQ4MDAwSHoNCj4gPiBEZWZhdWx0IENoYW5uZWwgTWFwOiBmcm9udC1sZWZ0LGZy
b250LXJpZ2h0DQo+ID4gRGVmYXVsdCBTaW5rOg0KPiBhbHNhX291dHB1dC5wY2ktMDAwMF8wMF8x
Zi4zLXBsYXRmb3JtLXNrbF9oZGFfZHNwX2dlbmVyaWMuSGlGaV9faHdfc29maGRhZHNwX19zaW5r
DQo+ID4gRGVmYXVsdCBTb3VyY2U6DQo+IGFsc2FfaW5wdXQucGNpLTAwMDBfMDBfMWYuMy1wbGF0
Zm9ybS1za2xfaGRhX2RzcF9nZW5lcmljLkhpRmlfX2h3X3NvZmhkYWRzcF82X19zb3VyY2UNCj4g
PiBDb29raWU6IGY5ZGM6NWU3YQ0KPiA+DQo+ID4NCj4gPiBJIGNhbid0IGZpZ3VyZSBvdXQgd2h5
IHRoaXMgaXMgaGFwcGVuaW5nLiBLaW5kbHkgYXNrIGZvciBhbnkgbW9yZQ0KPiBpbmZvcm1hdGlv
biB0aGF0IGlzIG5lY2Vzc2FyeS4gVGhhbmsgeW91Lg0KPg0KPiBTZWUgQnVnemlsbGEgZm9yIHRo
ZSBmdWxsIHRocmVhZCBhbmQgYXR0YWNoZWQgZG1lc2cuDQo+DQo+IEFueXdheSwgSSdtIGFkZGlu
ZyBpdCB0byByZWd6Ym90IHNvIHRoYXQgaXQgZG9lc24ndCBmYWxsIHRocm91Z2gNCj4gY3JhY2tz
IHVubm90aWNlZDoNCj4NCj4gI3JlZ3pib3QgaW50cm9kdWNlZDogdjYuMy4udjYuNA0KPiBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzY3Mw0KPiAjcmVnemJv
dCA8aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTc2NzMjcmVn
emJvdD4NCj4gdGl0bGU6IFBpcGVXaXJlICsgV2lyZXBsdW1iZXIgYXVkaW8gZGlzdG9ydGlvbiBv
biBMZW5vdm8gVGhpbmtQYWQgWDEgWW9nYQ0KPiBHZW4gNw0KPiAjcmVnemJvdCBsaW5rOiBodHRw
czovL2Jicy5hcmNobGludXgub3JnL3ZpZXd0b3BpYy5waHA/aWQ9Mjg3MDY4DQo+ICNyZWd6Ym90
IGxpbms6IGh0dHBzOi8vYnVncy5hcmNobGludXgub3JnL3Rhc2svNzkwODE/cHJvamVjdD0xJnBh
Z2VudW09MTANCj4NCj4gVGhhbmtzLg0KPg0KPiBbMV06IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NjczDQo+DQo+IC0tDQo+IEFuIG9sZCBtYW4gZG9sbC4u
LiBqdXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhDQo+DQo=
