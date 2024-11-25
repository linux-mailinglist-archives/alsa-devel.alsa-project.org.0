Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76A9D8C88
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 19:56:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E138E7F4;
	Mon, 25 Nov 2024 19:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E138E7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732561012;
	bh=A/G0MV6Bfy77v5xqw9rKggq3c0sgzUYnVbjYD9K7s7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fU93mbcNGhMZuxQ4RVBZEAFnWHfbb6Bq96f2Wwx0tL3XgnmdtloxZSlykD6y7KBE1
	 CgYNpYQuWMOKxlDijaU4HpBpxvB+omMA2ZhT84AVcSFf31801s8Yuifjk4ADWmH1pH
	 Y2bt8/denS/RmLwtlR6CWhPGw7lNM4pj1GFe/d0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FA1CF805BB; Mon, 25 Nov 2024 19:56:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9E3F80528;
	Mon, 25 Nov 2024 19:56:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B5FF80496; Mon, 25 Nov 2024 19:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70CC2F80134
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 19:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CC2F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=glyphic.com header.i=@glyphic.com header.a=rsa-sha256
 header.s=google header.b=gQtQV0xR
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53ddeef9e4aso3193697e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Nov 2024 10:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=glyphic.com; s=google; t=1732560912; x=1733165712;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZGEqLExyXAWzgSPH+YEyiv59mc/ZOQamr+/NL+0pRg=;
        b=gQtQV0xRCWaWVSOjgzjkPGjKmlaQ5pQRVm/XXVX61dHRpk+LM+9Af8MU+hMM4IDOQB
         3efoRcVgZ54tD4kb6JJcrOxgpfZ/KzbBVtJxhy2K00o3Df/UqoWRTUtGl/iGShDohNkk
         25QW+Xthsb3s4LM85M/VlDAPWSEMedn1gTkDz3I0NIfrVkl8DpQrj/E1FjWJz9z2H7xX
         E2m6XowtKC+bQMXSyoyoe0OOjnDiEkhbuQZsBUbHICvV5mnLFMXzeAjVlnPQUQuUAYU/
         XzZ1QUIPJPIM64mRbEWG6HxhnovJHXX9BZQViaDmjaNttcIP/MVQ49AE/GDVsoDAYghj
         Zo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560912; x=1733165712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZGEqLExyXAWzgSPH+YEyiv59mc/ZOQamr+/NL+0pRg=;
        b=JRH0n2axcp2htfmuyTzyY+U7WBNCWeJ4uNcKGeYAFy6nvIhZ4GxDL76XN3sDHh8rC3
         qdmFt+7/D3kRdqmfBP5WB8BEoNptwXA5pBn9M+opGgwJSyB8Y3TFIdNtyxB7iLv6ljZu
         WC9jAzPoWSwV9dvbK9CEgf+2KIM//TH/WDENjyHHAsekCP9XH6aUwbyt06Js5+qeKq93
         iLRWd/SXARIEjPOoVji8+uSJdWiDjEzPIINZ3YCTRL8eg2MGAkES8IKZV0MzPPSf5LbA
         jbetjJA3u24y84Clb4XjufmH5N/QMGVTdHuH2qJNfpUWCNzY6RDk9snQi0qq6724mls7
         8b+g==
X-Gm-Message-State: AOJu0YxmTZk5eiSzQDpHqIleqDplfpC4qNxfYyTjV8BWvOw8rljjrIeg
	i7xnlW0Q8KJnA41qSqMCT0wGKlt4r2z9b70oPOgsKa5knZwCld03mDApvSIk9aF1y1FGPo08W+q
	V4Ba9XCy2EMQE79yhPvUkhGrk4+s43owCsb8Pmw==
X-Gm-Gg: ASbGnct2Ef1pcz8ptJ5iLX3CL8axYlHgKX9ts8iI+26TU6tzbjh5QTSJluDS+6rJAzU
	BxEFqtcgOK9in6HrY6HdPts01zp82JR0=
X-Google-Smtp-Source: 
 AGHT+IGef3t9bju0nxNLtZYxKDDsfNW3NTjPT/umnlrsVA1nv3RVykPrAlkEfSreiLDzgrQ5MbLOM4yd1miLIZZV9q4=
X-Received: by 2002:a05:6512:33c9:b0:53d:e5c0:b9bf with SMTP id
 2adb3069b0e04-53de5c0bda1mr3200224e87.52.1732560912153; Mon, 25 Nov 2024
 10:55:12 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPnksqRok7xGa4bxq9WWimVV=28-7_j628OmrWLS=S0=hzaTHQ@mail.gmail.com>
 <87bjy3zmaz.wl-tiwai@suse.de>
In-Reply-To: <87bjy3zmaz.wl-tiwai@suse.de>
From: Mark Lentczner <mark@glyphic.com>
Date: Mon, 25 Nov 2024 10:55:00 -0800
Message-ID: 
 <CAPnksqRAciV=ihW4e7mT=HY6VzpsAjn4GFx-_YOfPWXfu26JTg@mail.gmail.com>
Subject: Re: kernel snd seq bugs: SND_SEQ_EVENT_CLIENT_CHANGE &
 SND_SEQ_EVENT_PORT_CHANGE
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Message-ID-Hash: FZGRX6QGSEOUV6JJAKC23NGUWJSMFBI2
X-Message-ID-Hash: FZGRX6QGSEOUV6JJAKC23NGUWJSMFBI2
X-MailFrom: mark@glyphic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZGRX6QGSEOUV6JJAKC23NGUWJSMFBI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TG9va2luZyBhdCB0aGUgaXRlbXMgdGhhdCBjYW4gYmUgY2hhbmdlZCB3aXRoIGNsaWVudCBpbmZv
LCBvciBwb3J0IGluZm8sIEkNCnRoaW5rIHRoZXJlIGlzIGxpdHRsZSBsaWtlbGlob29kIHRoYXQg
YXBwbGljYXRpb25zIGFyZSBnb2luZyB0byBiZSBjaGFuZ2luZw0KdGhpcyBpbmZvcm1hdGlvbiBt
b3JlIHRoYW4gb25jZSBpbiB0aGUgbGlmZXRpbWUgb2YgYSBjbGllbnQsIG9yIGEgcG9ydC4NCg0K
U28gZmFyLCBteSBhcHBsaWNhdGlvbiBoYXNuJ3QgZGV0ZWN0ZWQgYW55IGNoYW5nZXMgdG8gcG9y
dCBpbmZvcm1hdGlvbg0KYWZ0ZXIgaXQgc3RhcnRzIHRyYWNraW5nIGEgcG9ydCAodGhvdWdoIGl0
IGRvZXNuJ3QgdHJhY2sgZXZlcnl0aGluZyBhYm91dCBhDQpwb3J0LikgVGhpcyBpcyBjZXJ0YWlu
bHkgYmVjYXVzZSB0aGUgcG9ydCBpbmZvIGlzIGdpdmVuIGF0IHRoZSB0aW1lIG9mIHBvcnQNCmNy
ZWF0aW9uLiBPZiB0aGUgc2V2ZXJhbCBEQVdzIHRoYXQgSSB0ZXN0ZWQsIHdoZW4geW91IGNoYW5n
ZSB0aGVpciBNSURJDQpjb25maWd1cmF0aW9uIC0gcmF0aGVyIHRoYW4gY2hhbmdlIHRoZSBwb3J0
IGluZm8gb2YgdGhlaXIgZXhpc3RpbmcgcG9ydHMsDQp0aGV5IHNpbXBseSBkZWxldGUgdGhlbSBh
bGwsIGFuZCByZWNyZWF0ZSB0aGUgcG9ydHMgYXMgbmVlZGVkLCB3aGljaCBpcw0KYnJvYWRjYXN0
aW5nIFBPUlRfRVhJVCBhbmQgUE9SVF9TVEFSVCBldmVudHMgYW55d2F5LiAgIEluIGVpdGhlciBj
YXNlLCB0aGlzDQppc24ndCBhIGJyb2FkY2FzdCBjb25jZXJuIGFzIHRoZXNlIGV2ZW50cyBhcmUg
cmVsYXRpdmVseSByYXJlLg0KDQpDbGllbnQgaW5mbyBpcyBhIGJpdCBkaWZmZXJlbnQsIGFzIHlv
dSBtdXN0IGNyZWF0ZSB5b3VyIGNsaWVudCBmaXJzdCwgdGhlbg0Kc2V0IGluZm8uIFNvIHRoZSBD
TElFTlRfU1RBUlQgZXZlbnQgd291bGQgYmUgZm9sbG93ZWQgYnkgb25lIG9yIG1vcmUNCkNMSUVO
VF9DSEFOR0UgZXZlbnRzLiBUaGlzIGlzIGV4YWNlcmJhdGVkIGJlY2F1c2UgdGhlIGhlbHBlciBm
dW5jdGlvbnMgZm9yDQpzZXR0aW5nIGNsaWVudCBuYW1lLCBldmVudCBmaWx0ZXIsIGV0Yy4uLiB3
aGljaCBlYWNoIGdldCB0aGUgY2xpZW50IGluZm8sDQpzZXQgb25lIGZpZWxkLCBhbmQgc2V0IHRo
ZSBpbmZvIGJhY2suIFNvIHRydWUsIHRoaXMgY2hhbmdlIHdvdWxkIGNhdXNlIGENCmJyb2FkY2Fz
dCBvZiBhIGZldyBldmVudHMgZWFjaCB0aW1lIGEgY2xpZW50IGlzIGNyZWF0ZWQuLi4gQnV0IGFn
YWluLCBpbg0KdGhlIHNjaGVtZSBvZiB0aGluZ3MsIGNsaWVudCBjcmVhdGlvbiBpcyBhIHJlbGF0
aXZlbHkgcmFyZSBvY2N1cnJlbmNlLg0KDQpJbiB0aGUgYWJzZW5jZSBvZiB0aGVzZSBldmVudHMs
IGFwcGxpY2F0aW9ucyBsaWtlIG1pbmUsIGhhdmUgdG8NCnBlcmlvZGljYWxseSBwb2xsIGV2ZXJ5
IGNsaWVudCBpbmZvIGFuZCBldmVyeSBwb3J0IGluZm8gdG8gc2VlIGlmIGFueXRoaW5nDQp0aGF0
IHRoZXkgY2FyZSBhYm91dCAobGlrZSBjbGllbnQgbmFtZSBvciBwb3J0IG5hbWUpIGhhcyBjaGFu
Z2VkLiBGb3Igbm93LA0Kc2luY2UgcG9ydCBpbmZvIGNoYW5nZXMgKGF0IGxlYXN0IG9mIG5hbWUg
b3IgY2FwYWJpbGl0aWVzKSBpcyBlc3NlbnRpYWxseQ0Kbm9uLWV4aXN0ZW50LCBteSBhcHBsaWNh
dGlvbiBkb2Vzbid0IGJvdGhlciB0byBwb2xsIHBvcnRzLiBBbmQgZm9yIGNsaWVudHMsDQpzaW5j
ZSB0aGUgY2hhbmdlcyBvbmx5IGhhcHBlbiByaWdodCBhZnRlciBjbGllbnQgc3RhcnQsIG15IGFw
cGxpY2F0aW9uDQpzaW1wbHkgc2xlZXBzIGEgc2hvcnQgaW50ZXJ2YWwgYWZ0ZXIgZ2V0dGluZyBD
TElFTlRfU1RBUlQsIGJlZm9yZSByZWFkaW5nDQp0aGUgY2xpZW50IGluZm8sIGdpdmluZyB0aGUg
Y2xpZW50IHByb2Nlc3MgdGltZSB0byBzZXQgdGhlIGluZm8gdXAuIENsZWFybHkNCnRoaXMgaXNu
J3Qgb3B0aW1hbCBvciBpbmZhbGlibGUgLSBidXQgaW4gcHJhY3RpY2UgaXQgd29ya3MsIGFuZCBw
b2xsaW5nDQppbmZvIGZyZXF1ZW50bHkgc2VlbXMgdG9vIGhpZ2ggYSBjb3N0Lg0KDQpMYXN0bHks
IHRoZXJlIElTIG9uZSBwbGFjZSBpbiB0aGUgY29kZSB3aGVyZSBQT1JUX0NIQU5HRSBpcyBzZW50
LiBJbg0Kc2VxX3VtcF9jbGllbnQuYyBpbiB0aGUgZnVuY3Rpb24gdXBkYXRlX3BvcnRfaW5mb3Mo
KS4gSW4gdGhhdCBjYXNlLA0KaW50ZXJlc3RpbmdseSwgYSBwb3J0X2luZm8gY2hhbmdlIGlzIG9u
bHkgY29uc2lkZXJlZCBpZiBhbmQgb25seSBpZiB0aGUNCm5hbWUgb3IgdGhlIGNhcGFiaWxpdHkg
ZmllbGRzIGFyZSBjaGFuZ2VkLiBUaGF0IGxvZ2ljIGNvdWxkIGJlIGFwcGxpZWQgdG8NCnlvdXIg
cGF0Y2ggLSBidXQgZ2l2ZW4gaG93IGluZnJlcXVlbnQgSSBzdXNwZWN0IHBvcnQgKG9yIGNsaWVu
dCkgY2hhbmdlcw0KYXJlLCBpdCBzZWVtcyBwcmVzdW1wdGl2ZSB0byBiZSBsaW1pdGluZyB3aGF0
IGZpZWxkIGNoYW5nZXMgYW4gYXBwbGljYXRpb24NCndvdWxkIGJlIGludGVyZXN0ZWQgaW4uDQoN
CkhhcHB5IHRvIGRpdmUgaW50byBhbnkgbW9yZSBkZXRhaWxzIHlvdSBtYXkgbmVlZCwNCuKAlCBN
YXJrDQo=
