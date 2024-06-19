Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875391DEF3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AF421B6;
	Mon,  1 Jul 2024 14:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AF421B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836453;
	bh=0y52aFi5LxlFuEK0T3Q8ippzJ2nbJbeWsIC1oLzLqI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dGw7kpnvtK2TbieUKXOU8UJcOMwCHtUjG7a1dNKQyWi9vCZo/qcGWjkkcW+vXd4vL
	 UI2froM3dteKXGPO2cg+ZHfFMLhEH5fbZfhNxlOR+icqDBxawKkymKa330+FpaNyUY
	 2xtrr17Y7B/NqdexTqm3pd5gBcsdmRm8N5Gu7s7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D216F805FE; Mon,  1 Jul 2024 14:19:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6EAF805FA;
	Mon,  1 Jul 2024 14:19:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E16AF8023A; Wed, 19 Jun 2024 20:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B46D6F800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 20:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B46D6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QYApHrPV
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-63bca6db118so2947787b3.3
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718820600; x=1719425400;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jphMjEIhup6ZcrgT3CDw4gO6VwMafTSMCvv0b5vAY9g=;
        b=QYApHrPVr6rljLZ1VjS/Uy1j1l5gLb4iftxLVVgKNvihpemqh/2vFJe6HXX2P2Dcw9
         eRLwnTAi7NtStb/mr8EIu1SSBDLtoyDJfH39JLrKput46f5p5Pv8Zew7wj8OaV9JwAE9
         ZE8Sb1Lb2BQKNEjSIeplA4L3QScVvPF2/kSz9Z/klX4o12VdCHjgqOhHLVclG6w0h11F
         lM+xtHDFezjRL4lMThmTBMwzY3itwOaurjtO7/bxFQS9fz0L+c7sHbIwsbTLsAbqR0v7
         P2njDq3taVqYVxrA0+ErKhC3BFIBLqdUqyoSPcxwer+LSrawfFVH2I7OIEGktsN5GRwI
         8mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718820600; x=1719425400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jphMjEIhup6ZcrgT3CDw4gO6VwMafTSMCvv0b5vAY9g=;
        b=J+2mhkALYj1un3yAA3FtNMKkJ52fW+Vxo/rPy8Yn7TWF3dqTljr4hDkz9vNl42NaeE
         gk0i65bi5jYMYBNqDtjfMD0F6lmFZtt/X2WFcdyhqDLd5bS/2tPlrr1NrFOqp+i1GuNb
         4jzmPEvC3oU3mvdqK3eJbV9DpvI7JSlUX+YRw08en0KEzxUeXeRXi5ZuNGBguIbb/rYZ
         tzscVf8dMG5lxV1hSs+A2HbuDMmvzIN51Cpne0MHlcHi+p9LfpJ2Bcu8eBDCpjq9+P4P
         MLbLgvf5LSq2YawAuy3nRbc3mx83Grzd5vzc1Bs4CCVGApeDL3Spiu8eZRdT6H1I+uKR
         JGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0kt2AvuX8wUKq3SHlku1iQO7ZgJ8OSb5pEJeMavvRVrlKmNmk2RJ6j15//sprpVRdZ2VeWnXVWqqWn+0Msd91xKSLVba2nSrf5U=
X-Gm-Message-State: AOJu0YzBJhBlTK/kUHc8ZNva9xVoBe9/HUwpuncYwLc1psunG16doHNL
	q8v6vUbAtTQs+f1r8xOwmgnUWCsMJVNmQW2WM2qfpIPstPKMn0IvA78U7OmRAhRm6jHtDxysuuo
	I/70sQ9RimJTlj6hTQFV3Wp6FRx8=
X-Google-Smtp-Source: 
 AGHT+IFNbGRlRax4g9sxKBcsp3F32zzBOg4gppUXe4N9FrZ14Ui2UV9o7HS/1QY73oToKwY/mD0Dth0Cm+2BDFo/4sE=
X-Received: by 2002:a0d:f185:0:b0:61b:3345:a349 with SMTP id
 00721157ae682-63a8d44ac47mr30657897b3.3.1718820599803; Wed, 19 Jun 2024
 11:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
 <CAPMW_r+vsHvwtqPrUJad0-VSoEiPxX_swMy8VqtR8+kt60aDag@mail.gmail.com>
In-Reply-To: 
 <CAPMW_r+vsHvwtqPrUJad0-VSoEiPxX_swMy8VqtR8+kt60aDag@mail.gmail.com>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Wed, 19 Jun 2024 23:39:48 +0530
Message-ID: 
 <CAPMW_r+G_vizcm3hThTLQujty_bPji3M6QZbos5JCKsR5i6p3g@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
 skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
X-MailFrom: av2082000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3N7LYFV3TLMLOX7HRYR3LSHE44ADZCMZ
X-Message-ID-Hash: 3N7LYFV3TLMLOX7HRYR3LSHE44ADZCMZ
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:19:46 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3N7LYFV3TLMLOX7HRYR3LSHE44ADZCMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pg0KPg0KPiBPbiBXZWQsIDE5IEp1biAyMDI0IGF0IDIzOjI4LCBBbWl0IFZhZGhhdmFuYSA8YXYy
MDgyMDAwQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+PiBIaSBSaWNhcmRvLA0KPj4NCj4+IEkgaGF2
ZSByZWJ1aWx0IGl0IGFnYWluLCBhbmQgdGhlcmUgYXJlIG5vIGFueSB3YXJuaW5ncyBvciBlcnJv
cnMuDQo+Pg0KPj4gVGhhbmtzDQo+PiBBbWl0IHYNCj4+DQo+PiBPbiBNb24sIDE3IEp1biAyMDI0
IGF0IDIyOjQxLCBSaWNhcmRvIEIuIE1hcmxpZXJlIDxyaWNhcmRvQG1hcmxpZXJlLm5ldD4NCj4+
IHdyb3RlOg0KPj4NCj4+PiBPbiAxNyBKdW4gMjQgMDI6MDIsIEFtaXQgVmFkaGF2YW5hIHdyb3Rl
Og0KPj4+ID4gVGhlIHBsYWNlbWVudCBvZiB0aGUgYHNlZ2Rpc3RfY29kZXNgIGFycmF5IGRvY3Vt
ZW50YXRpb24gd2FzIGNvcnJlY3RlZA0KPj4+ID4gdG8gY29uZm9ybSB3aXRoIGtlcm5lbCBkb2N1
bWVudGF0aW9uIGd1aWRlbGluZXMuIFRoZSBgQHNlZ2Rpc3RfY29kZXNgDQo+Pj4gPiB3YXMgcGxh
Y2VkIGluY29ycmVjdGx5IHdpdGhpbiB0aGUgc3RydWN0IGBzZWdkaXN0X2NvZGVgIGRvY3VtZW50
YXRpb24NCj4+PiA+IGJsb2NrLCB3aGljaCBsZWQgdG8gYSBwb3RlbnRpYWwgbWlzaW50ZXJwcmV0
YXRpb24gb2YgdGhlIGNvZGUNCj4+PiBzdHJ1Y3R1cmUuDQo+Pj4gPg0KPj4+ID4gVGhlIGBzZWdk
aXN0X2NvZGVzYCBhcnJheSBkb2N1bWVudGF0aW9uIHdhcyBtb3ZlZCBvdXRzaWRlIHRoZSBzdHJ1
Y3QNCj4+PiA+IGJsb2NrLCBhbmQgYSBzZXBhcmF0ZSBjb21tZW50IGJsb2NrIHdhcyBwcm92aWRl
ZCBmb3IgaXQuIFRoaXMgY2hhbmdlDQo+Pj4gPiBlbnN1cmVzIHRoYXQgY2xhcml0eSBhbmQgcHJv
cGVyIGFsaWdubWVudCB3aXRoIGtlcm5lbCBkb2N1bWVudGF0aW9uDQo+Pj4gPiBzdGFuZGFyZHMg
YXJlIG1haW50YWluZWQuDQo+Pj4gPg0KPj4+ID4gQSBrZXJuZWwtZG9jIHdhcm5pbmcgd2FzIGFk
ZHJlc3NlZDoNCj4+PiA+ICAgICAuL2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYzo0OTogd2Fybmlu
ZzogRXhjZXNzIHN0cnVjdCBtZW1iZXINCj4+PiAnc2VnZGlzdF9jb2RlcycgZGVzY3JpcHRpb24g
aW4gJ3NlZ2Rpc3RfY29kZScNCj4+PiA+DQo+Pj4gPiBTaWduZWQtb2ZmLWJ5OiBBbWl0IFZhZGhh
dmFuYSA8YXYyMDgyMDAwQGdtYWlsLmNvbT4NCj4+PiA+IC0tLQ0KPj4+ID4gQ2hhbmdlcyBpbiB2
MjoNCj4+PiA+ICAgICAtIFJlbW92ZWQgYHN0YXRpYyBjb25zdGAga2V5d29yZCBmcm9tIGBzZWdk
aXN0X2NvZGVgIHN0cnVjdHVyZQ0KPj4+IGRlY2xhcmF0aW9uLg0KPj4+ID4NCj4+PiA+ICBkcml2
ZXJzL3NsaW1idXMvc3RyZWFtLmMgfCA4ICsrKysrLS0tDQo+Pj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+PiA+DQo+Pj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zbGltYnVzL3N0cmVhbS5jIGIvZHJpdmVycy9zbGltYnVzL3N0cmVhbS5jDQo+
Pj4gPiBpbmRleCAxZDZiMzg2NTc5MTcuLjg2M2FiMzA3NWQ3ZSAxMDA2NDQNCj4+PiA+IC0tLSBh
L2RyaXZlcnMvc2xpbWJ1cy9zdHJlYW0uYw0KPj4+ID4gKysrIGIvZHJpdmVycy9zbGltYnVzL3N0
cmVhbS5jDQo+Pj4gPiBAQCAtMTgsMTUgKzE4LDE3IEBADQo+Pj4gPiAgICogICAgICAgICAgIGFu
ZCB0aGUgZmlyc3Qgc2xvdCBvZiB0aGUgbmV4dCAgY29uc2VjdXRpdmUgU2VnbWVudC4NCj4+PiA+
ICAgKiBAc2VnZGlzdF9jb2RlOiBTZWdtZW50IERpc3RyaWJ1dGlvbiBDb2RlIFNEWzExOjBdDQo+
Pj4gPiAgICogQHNlZ19vZmZzZXRfbWFzazogU2VnbWVudCBvZmZzZXQgbWFzayBpbiBTRFsxMTow
XQ0KPj4+ID4gLSAqIEBzZWdkaXN0X2NvZGVzOiBMaXN0IG9mIGFsbCBwb3NzaWJsZSBTZWdtZXQg
RGlzdHJpYnV0aW9uIGNvZGVzLg0KPj4+ID4gICAqLw0KPj4+ID4gLXN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc2VnZGlzdF9jb2RlIHsNCj4+PiA+ICtzdHJ1Y3Qgc2VnZGlzdF9jb2RlIHsNCj4+PiA+ICAg
ICAgIGludCByYXRlbTsNCj4+PiA+ICAgICAgIGludCBzZWdfaW50ZXJ2YWw7DQo+Pj4gPiAgICAg
ICBpbnQgc2VnZGlzdF9jb2RlOw0KPj4+ID4gICAgICAgdTMyIHNlZ19vZmZzZXRfbWFzazsNCj4+
PiA+DQo+Pj4gPiAtfSBzZWdkaXN0X2NvZGVzW10gPSB7DQo+Pj4gPiArfTsNCj4+PiA+ICsNCj4+
PiA+ICsvKiBzZWdkaXN0X2NvZGVzIC0gTGlzdCBvZiBhbGwgcG9zc2libGUgU2VnbWVudCBEaXN0
cmlidXRpb24gY29kZXMuICovDQo+Pj4gICAgICAgXiBpc24ndCBhICdAJyBjaGFyYWN0ZXIgbWlz
c2luZyBoZXJlPw0KPj4+DQo+Pj4gTWFrZSBzdXJlIHRvIHJlLWJ1aWxkIHRoZSBkb2NzIGFuZCBz
ZWUgd2hldGhlciBpdCBsb29rcyBmaW5lLg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+IC0gICAgICAg
UmljYXJkby4NCj4+Pg0KPj4+DQo+Pj4NCj4+PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNlZ2Rp
c3RfY29kZSBzZWdkaXN0X2NvZGVzW10gPSB7DQo+Pj4gPiAgICAgICB7MSwgICAgIDE1MzYsICAg
MHgyMDAsICAgMHhkZmZ9LA0KPj4+ID4gICAgICAgezIsICAgICA3NjgsICAgIDB4MTAwLCAgIDB4
Y2ZmfSwNCj4+PiA+ICAgICAgIHs0LCAgICAgMzg0LCAgICAweDA4MCwgICAweGM3Zn0sDQo+Pj4g
PiAtLQ0KPj4+ID4gMi4yNS4xDQo+Pj4gPg0KPj4+ID4NCj4+Pg0KPj4NCg==
