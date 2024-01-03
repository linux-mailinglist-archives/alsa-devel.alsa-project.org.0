Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0A823E8A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:24:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC0B1505;
	Thu,  4 Jan 2024 10:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC0B1505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704360282;
	bh=/5bgf22M1H4gEa2wvfFBtYv7XCVrvFkGCa34kl4ES58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q80Qc1fm5cpFnO/5UZHZKAUI17vPUu+lzm/mXyVwXfAUOtyip9eJY8m6J7soEa+sB
	 fXIeWWrT5jlEK1AMnQ59HX3Cz4B1fHab6BpM08LwaC14uWWUpkh05aR+UDueXN4TLd
	 3TcW+R3wtwcopO9RK88I7uu8mJxdNpVDVIUJezx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA77F80654; Thu,  4 Jan 2024 10:22:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB11F80656;
	Thu,  4 Jan 2024 10:22:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27B04F80537; Wed,  3 Jan 2024 17:19:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E2AEF80086
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 17:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2AEF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HvgmVCiQ
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28c5af37d3aso1877132a91.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704298781; x=1704903581;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UjaYUrFsVj9+pKwf8/dS9l24/1mpBbioEanyM6G1CzE=;
        b=HvgmVCiQQXAYsvFjhOT/7Ac8gL00n0QqaNzBGZ2LcOOBbki8nGOcW0FKmFOPW1kpjp
         5G+niOFBeaeXPfrKK76JP2YaYVn/e21VV4y7YKC98/fGS0KDrU3kt58rcZwzSZZT6J5s
         l2osBmku+mI8ZIZY0hGiWj2xIefTFzgm1xcn3b/AuYG6sLko59hojtc0CpPKu8AFzbs4
         2nRrzx+8ByzNXrofk8/DxH01zlplR0N1dJ5WhYeC0PUVRCBFgCCrY3pgTngFHfyZJlwI
         7FlBp7UNwXHm2IbtM6fZjitJvqJYyOBkqE7Myqcf8pTzvqZ1h8Dp/tX64Bm4ApUCu/ou
         J4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704298781; x=1704903581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjaYUrFsVj9+pKwf8/dS9l24/1mpBbioEanyM6G1CzE=;
        b=pAB0DK9cf5J/AlmEDRyyHKHVS4mlqyYKKTpdb9ppAaGyCo/uSAO8mZ2+ZMd+ASc8iQ
         jkDArBtEhYw1UR85zUnBxEWLTh5q1a+p8XBMgurarK7m1N1BVoK5+lKcFtY6UsKuDPGr
         YtuJzUrsq3N40dsP9OplqNvtAP+mCnS5P5zwab8GOyrpawpdBqIWahSqbY0325KTP9Xs
         QeAYoGWWfD3fohQnpJmKM7tAL7xMxJnv0yxYwMVElEYu/oiS9Vj/TWN4h08caNBLaDod
         +j/dt/fVyUQYE2ZYjpPO/wMUX0bvJfE4DW+E8gy7MTW2F6J7xLSAKU9pQbinLePRdDvB
         2Rgg==
X-Gm-Message-State: AOJu0YzKHUBfwgWbUKRAy5iMs8K17LkThWkUIWhtyCdpBi8j2DBAcj/W
	qGMy5HoQ+wE/T9GbFJiGRTEe64lMxRECI3Igy44=
X-Google-Smtp-Source: 
 AGHT+IGCANTT7wChZVAZrUrw+oXjA/AWofXkhjngdbnxV/OTv7WyfBnzW3ImCncOVMjLhDuZMtcnmu5f2ByJU01zeEY=
X-Received: by 2002:a17:90a:e0f:b0:28c:5a9:de71 with SMTP id
 v15-20020a17090a0e0f00b0028c05a9de71mr28573383pje.4.1704298780851; Wed, 03
 Jan 2024 08:19:40 -0800 (PST)
MIME-Version: 1.0
References: <NnE33wh--3-9@tutanota.com>
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
 <CAEnG5GAsD_Db7G3TGkfA+bjO64V6tJuGph1dLOnvGhYicvLW_Q@mail.gmail.com>
 <CAJX_Q+1OoXdBAv=tMFdD1-Kfg0sDdnDjbYDpU9g8YfOeECwukA@mail.gmail.com>
In-Reply-To: 
 <CAJX_Q+1OoXdBAv=tMFdD1-Kfg0sDdnDjbYDpU9g8YfOeECwukA@mail.gmail.com>
From: Matthew Anderson <ruinairas1992@gmail.com>
Date: Wed, 3 Jan 2024 10:19:31 -0600
Message-ID: 
 <CAEnG5GADVZeFe55dPyEDbQA_jeNqQLNvCRPK4vBCMPCq25gmdA@mail.gmail.com>
Subject: Re: Fwd: No sound drivers on HP Envy x360 ey0xxx
To: tanure@linux.com
Cc: voreck-lukas@tutanota.com, Bagasdotme <bagasdotme@gmail.com>,
	Alsa Devel <alsa-devel@alsa-project.org>, Andy Chi <andy.chi@canonical.com>,
	David Rhodes <david.rhodes@cirrus.com>, Faenkhauser <faenkhauser@gmail.com>,
	James Schulman <james.schulman@cirrus.com>, Kailang <kailang@realtek.com>,
	L Guzenko <l.guzenko@web.de>, Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>, Luke <luke@ljones.dev>,
	Overloader <overloader@tutanota.com>,
 Patches <patches@opensource.cirrus.com>,
	Perex <perex@perex.cz>, Rf <rf@opensource.cirrus.com>,
	Sbinding <sbinding@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
	Tiwai <tiwai@suse.com>, Tsengalb99 <tsengalb99@gmail.com>,
	Vitalyr <vitalyr@opensource.cirrus.com>, Yangyuchi66 <yangyuchi66@gmail.com>
X-MailFrom: ruinairas1992@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ADWDW6TOHFF6B7DLSCZ7MLWBMUIG3S2G
X-Message-ID-Hash: ADWDW6TOHFF6B7DLSCZ7MLWBMUIG3S2G
X-Mailman-Approved-At: Thu, 04 Jan 2024 09:22:48 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADWDW6TOHFF6B7DLSCZ7MLWBMUIG3S2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhleSBoYXZlIHNvbWV0aGluZyB3b3JraW5nIGFyb3VuZCBpdCBvbiBXaW5kb3dzLiBJdCdzIHRo
ZSBzYW1lIGlzc3VlIHdlJ3ZlDQpoYWQgdG8gd29yayBhcm91bmQgb24gQXN1cyBkZXZpY2VzIHN1
Y2ggYXMgdGhlIFJPRyBBbGx5Lg0KDQogWW91IGNhbiB1c2UgRFNEVCBvdmVycmlkZXMgdG8gZW5h
YmxlIGF1ZGlvIG9uIExpbnV4IGJ1dCB0aGlzIGlzIGRhbmdlcm91cw0KYW5kIG5vdCByZWNvbW1l
bmRlZCBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5IG9mIGtub3dpbmcgdGhlIHNhZmUgdmFsdWVzIHRv
DQp1c2UuDQoNCkFzdXMgZXZlbnR1YWxseSBwdXNoZWQgYW4gdXBkYXRlIGFkZGluZyB0aGUgbWlz
c2luZyBpbmZvcm1hdGlvbiBmb3IgdGhlIFJPRw0KYWxseSBzbyBpdCdzIG5vIGxvbmdlciBhbiBp
c3N1ZS4gVGhpcyBpcyB0aGUgcHJvcGVyIHNvbHV0aW9uLg0KDQpPbiBXZWQsIEphbiAzLCAyMDI0
LCA5OjU24oCvQU0gTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToNCg0KPg0K
Pg0KPiBPbiBXZWQsIDMgSmFuIDIwMjQsIDExOjQ3IE1hdHRoZXcgQW5kZXJzb24sIDxydWluYWly
YXMxOTkyQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+DQo+PiBUaGUgaXNzdWUgaXMgdGhhdCBIUCBk
b2VzIG5vdCBwcm92aWRlIHRoZSBEU0QgaW5mb3JtYXRpb24gaW4gdGhlIEJJT1MgZm9yDQo+PiB0
aGUgQ2lycnVzIEFtcC4gSSd2ZSBhbHJlYWR5IGVtYWlsZWQgSFAgaW5mb3JtaW5nIHRoZW0gb2Yg
dGhlIGlzc3VlLiBJIHRvbw0KPj4gaGF2ZSBhIG5ld2VyIEhQIEVudnkgWDM2MCB3aGljaCBoYXMg
dGhlIHNhbWUgcHJvYmxlbS4NCj4+DQo+PiBPbiBXZWQsIEphbiAzLCAyMDI0LCA4OjI44oCvQU0g
THVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToNCj4+DQo+Pj4NCj4+Pg0KPj4+
IE9uIFdlZCwgMyBKYW4gMjAyNCwgMDg6MjMgLCA8dm9yZWNrLWx1a2FzQHR1dGFub3RhLmNvbT4g
d3JvdGU6DQo+Pj4NCj4+Pj4gSSBob3BlIEknbSByZXNwb25kaW5nIGNvcnJlY3RseQ0KPj4+Pg0K
Pj4+PiBPbiBidWd6aWxsYSBJIHdhcyBhc2tlZCB0byBhdHRhY2ggZG1lc2cgYW5kIGxzcGNpIG91
dHB1dC4gSSdtIHNlbmRpbmcNCj4+Pj4gYm90aCBhcyBhdHRhY2htZW50cyAoY2F1c2Ugb2YgdGhl
aXIgbGVuZ3RoKSBhbmQgaG9wZSBpdCB3b3JrcywgaXQncyBteQ0KPj4+PiBmaXJzdCB0aW1lIHdv
cmtpbmcgd2l0aCB0aGVzZSBtYWlsaW5nIGxpc3RzLg0KPj4+Pg0KPj4+DQo+Pj4gSGksDQo+Pj4N
Cj4+PiBUaGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgdG8gc3RhcnQgaXMgdGhlIERTRFQgZHVtcCBm
cm9tIHlvdXIgQmlvcy4NCj4+PiBUaGF0IHNob3VsZCBkZXNjcmliZSB0aGUga2V5IHBvaW50cyBh
Ym91dCB0aGUgaGFyZHdhcmUgY29uZmlndXJhdGlvbi4NCj4+Pg0KPj4+IFRoYW5rcw0KPj4+IEx1
Y2FzIFRhbnVyZQ0KPj4+DQo+Pg0KPiBBcmUgeW91IHN1cmU/DQo+IEhvdyB0aGUgY2FuICBXaW5k
b3dzIGRyaXZlciBiZSBsb2FkZWQgd2l0aG91dCB0aGF0Pw0KPg0KPj4NCg==
