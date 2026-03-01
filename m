Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDRTE5ghqGkrogAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:12:08 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1161FF883
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7384160236;
	Wed,  4 Mar 2026 13:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7384160236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772626327;
	bh=HOhJa9//ej2+q4QV4W5vhdYgAU5pJ9lnX2tLITe7WOY=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jcjTRUuUbMNPDPJTjur3eDV0LcU9oSIWJe5UWm/3ZAFt9P55CU00fXrqgDlvZEWme
	 qqzS7Q1hjQ/tm2fqM4Hpscouet5dbs76CXfc9nbv/a2uUD0hnvQkSaw8dpLKcgxmIa
	 6d2Q3OZpWYzWN5xBjUh0+YOciuNJqGtFj5d/KrGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E134F80652; Wed,  4 Mar 2026 13:11:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B38BF80655;
	Wed,  4 Mar 2026 13:11:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58315F80524; Sun,  1 Mar 2026 10:43:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9382F8045D
	for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2026 10:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9382F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OlnwQtX4
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b936331786dso366641766b.3
        for <alsa-devel@alsa-project.org>;
 Sun, 01 Mar 2026 01:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772358204; cv=none;
        d=google.com; s=arc-20240605;
        b=Wr+p8RqRyCy4MNIXhjoffE07uuvR2XD2J99cvs2W4RqNLv2TgHqu3h4bf1QUEUHzfJ
         /JvHs+8Q7LDZS7n+ykfbx5OXYD4c5+Z6cJ0uKNFboFudZAyC7/lOiLQmKiMgxwMGGoI8
         PEjA/hr8Up1vqeWps5TBk6Zhn8vr1LTBzWQJKfA7JuI3Bi9mr1t6qfUqQftmS7QLjEa3
         yWvl6sUUrRCZLKz/Jubn5iTNQuOUaysNX2XbFi2Mc/jtPUnEbeb2VY8R8etnOCfRllar
         5N9iUOE8VSQw+q52aU8r6OLNtjKLa9jIkWSE4HTfEh5qF6wqVKxMTCQ3ujpI4ufeB3o9
         uFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nci6TsPBvusZQQ2zj6XGdcv69CR1WabA4RWnbj7jqF4=;
        fh=s1h8N4U4ASgl2diPi2yKjEmsLSTuwbZjYBDYrAXLUvw=;
        b=KyBNqQl9HyYuiNxOIZvpDBtVtBZEKnbFQ8VDrkNuqSoSDhsKpHY/2I5mCsq6ruR65w
         7AReXxCEG1PaW5zEdwEgAbTsdhTVR+4KTITjHRlK40ZGuj/3oyF31PrOhFEgpLbLPWJu
         SectsO0i44vuYhLfv7THrEBhw+ULmvsv0ocq6mPVisjQyh2A5fsGYHNtmksYBxanu0Gd
         +kLn5lSjqV7NtMq1vS97fNE7UwI3BmUh8RPDLzf7nxohUkdLjdSqTi+gSjB/u+XlJolA
         neUVU36WIlmCeODsZdLV/j5dYxdf9o43T735+Z+e/Y7ATLUkBVvZTblCfR/xx0gjlmIE
         DRrA==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772358204; x=1772963004;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nci6TsPBvusZQQ2zj6XGdcv69CR1WabA4RWnbj7jqF4=;
        b=OlnwQtX4L25OEIkbWVF2Fj4miKuHbRxHN2xx744PwUiU9xqwqQxddJr9rA7tP2GOez
         +FSIyjcN8V1ZqOVuXj6KGf9XePzUju/Jw8mqCcjoFJHWlEHIjx9b4BrrfKKjtRAnZ5un
         fDrmvcCPgHSnXhcQq7R08m6IKwdcsEz5lLONkMBt5CZvg98sgdX5m89jWZXP/qvcywf6
         TujQbkLyv/Y/1XGtYQ+hxOS2ST+7ShJJBguEX2rhakW2t1XJ1lUckijvMJY6h5O4EpXK
         0V/sjC+Hau1UJaMzND2rIAsMKHs4MaJj4k2ElkYo0HYa5iCyWSH3Im5yC7lAftPvayE0
         giPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772358204; x=1772963004;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nci6TsPBvusZQQ2zj6XGdcv69CR1WabA4RWnbj7jqF4=;
        b=SKKmIAfrTsrLlp5W+EZxqHH2ld7Nt7LMypskQ9BGSTJ/N86mza4ehVNKjClUL86P30
         Ja2zX/RqWXCN3CLryfUT8BYymdKYn5MaxEpMqfTjCwCrHGiw5PJiCb7ZEMQwqTQ1tvZ6
         qvFBT7ukTacA0DIFAZYCbhsPxVflmh1Kv8JpkmZWQDMePMQx79k4mBEUcsIQjlWBNwkO
         ZFW9aqKLQDAW9kkZryTlVGV2rpGpNgi05V2sXP0ZE5wvH0MCzWOa0Q6ToH+pMprYaf/b
         aPONg1R4uaW5I23L+W8c07beHCwPjYO2jJd1MUs9dnN0VwAIRDBlm1Mc/cg26nEF9062
         FVag==
X-Gm-Message-State: AOJu0YzHxH0EXelKQ9FWFOknwSYRHXDWmHaaZChkWZA3Iy/wShfnXuuq
	XYxEZyo9oTBeHgamKJuGfeyAOCYcnmxydU2hlM2qBN4xdiYILmlzLV/oiQMEuB8QdOKOuCdm5qf
	P0XCC2jxdc5ibPaJr1725RiioKmEW/Rwr69o4WDQ=
X-Gm-Gg: ATEYQzz9KtFZikJzxd7jHLHYdM6EtFx0xrk0+VdPcCGbD6m1+nHzizbJCS6bK1QqGbY
	XqsVVUYXAYqpj5jqtU+J5khITevGMk4rwa4Xjhrk4MEp0gLunl9YemrcchmcazEGfRHjJdo9k2U
	gn2C6Mt/sMW/ggzcNOWWpnQ8rfSDSktc6Gf+BUkr0zZnCz0UsmgkAlb4BcofKy6LdN1ak/9/Knn
	zL8r9PzOaXrhvsvASh7uIpyHQ3z3yJniYq4e9wq8cwNyQqavYWF/pNXVo7E+NGAAjM14Ga37Lnm
	COFM6mSgUxpxPUmGcMA/myYSyuJcVMowdUp+ed4=
X-Received: by 2002:a17:907:6d15:b0:b8f:848b:4456 with SMTP id
 a640c23a62f3a-b93763852c1mr547921966b.13.1772358204174; Sun, 01 Mar 2026
 01:43:24 -0800 (PST)
MIME-Version: 1.0
From: Andrzej Hankus <andrzejh07@gmail.com>
Date: Sun, 1 Mar 2026 10:43:12 +0100
X-Gm-Features: AaiRm53TL7xHOcGihGTP18lyn_2OMvvuzDCVoHEOy4i_Ev3L8mBwHFKP7UercKg
Message-ID: 
 <CACB9z7kjs8rhLstEc8fV29BCTb5dd881JwGozoKdO5cwCb=YwQ@mail.gmail.com>
Subject: ALSA Bug Report: TAS2781 speaker amps not working on ASUS ROG Strix
 SCAR 16 G635LX (2025)
To: alsa-devel@alsa-project.org
X-MailFrom: andrzejh07@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LB53V4HWABOMU4L6PZCKBS5YAIM3CW5H
X-Message-ID-Hash: LB53V4HWABOMU4L6PZCKBS5YAIM3CW5H
X-Mailman-Approved-At: Wed, 04 Mar 2026 12:11:00 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LB53V4HWABOMU4L6PZCKBS5YAIM3CW5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: EE1161FF883
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	DATE_IN_PAST(1.00)[74];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[gmail.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrzejh07@gmail.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:-];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[alsa-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

SUhlbGxvLA0KSSB3b3VsZCBsaWtlIHRvIHJlcG9ydCB0aGUgZm9sbG93aW5nIGJ1Zy4NCg0KIyMg
U3VtbWFyeQ0KDQpJbnRlcm5hbCBzcGVha2VycyBwcm9kdWNlIG9ubHkgdGhpbiwgaGlnaC1waXRj
aGVkIGF1ZGlvICh0d2VldGVycyBvbmx5KSBvbg0KdGhlIEFTVVMgUk9HIFN0cml4IFNDQVIgMTYg
RzYzNUxYICgyMDI1IG1vZGVsKS4gVGhlIFRBUzI3ODEgd29vZmVyDQphbXBsaWZpZXJzIGFyZSBu
ZXZlciBpbml0aWFsaXplZCBiZWNhdXNlIHRoZSBIREEgY29tcG9uZW50IGJpbmRpbmcgYmV0d2Vl
bg0KdGhlIEFMQzI4NSBjb2RlYyBmaXh1cCBhbmQgdGhlIFRBUzI3ODEgSTJDIHNpZGUtY29kZWMg
ZHJpdmVyIGZhaWxzIHNpbGVudGx5Lg0KDQojIyBIYXJkd2FyZQ0KDQotICoqTGFwdG9wOioqIEFT
VVMgUk9HIFN0cml4IFNDQVIgMTYgRzYzNUxYICgyMDI1KQ0KLSAqKlBsYXRmb3JtOioqIEludGVs
IE1ldGVvciBMYWtlICg4MDAgU2VyaWVzIEFDRSkNCi0gKipBdWRpbyBDb2RlYzoqKiBSZWFsdGVr
IEFMQzI4NQ0KLSAqKlBDSSBTU0lEOioqIGAxMDQzOjNlZjBgDQotICoqQW1wbGlmaWVyczoqKiBU
ZXhhcyBJbnN0cnVtZW50cyBUQVMyNzgxIMOXIDMgKEFDUEkgZGV2aWNlIGBUWE5XMjc4MTowMGAp
DQotICoqU3BlYWtlciBsYXlvdXQ6KiogMiB0d2VldGVycyAoQUxDMjg1IGRpcmVjdCkgKyAyIHdv
b2ZlcnMgKFRBUzI3ODEgc21hcnQNCmFtcHMpDQoNCiMjIFNvZnR3YXJlDQoNCi0gKipEaXN0cm86
KiogQ2FjaHlPUw0KLSAqKktlcm5lbDoqKiA2LjE5LjUtMy1jYWNoeW9zDQotICoqQXVkaW8gc2Vy
dmVyOioqIFBpcGVXaXJlDQoNCiMjIFByb2JsZW0gRGVzY3JpcHRpb24NCg0KVGhlIGtlcm5lbCBh
cHBsaWVzIGZpeHVwIGAweDExOWAgZm9yIFBDSSBTU0lEIGAxMDQzOjNlZjBgLCB3aGljaCBtYXBz
IHRvDQpgQUxDMjg3X0ZJWFVQX1RBUzI3ODFfSTJDYC4gVGhlIGBzZXJpYWwtbXVsdGktaW5zdGFu
dGlhdGVgIGRyaXZlcg0Kc3VjY2Vzc2Z1bGx5IGNyZWF0ZXMgMyBJMkMgc3ViLWRldmljZXMgZm9y
IGBUWE5XMjc4MTowMGAuIEhvd2V2ZXIsIHRoZQ0KVEFTMjc4MSBIREEgSTJDIHNpZGUtY29kZWMg
ZHJpdmVyIChgc25kX2hkYV9zY29kZWNfdGFzMjc4MV9pMmNgKSBuZXZlcg0KYmluZHMgdG8gYW55
IG9mIHRoZSAzIEkyQyBkZXZpY2VzLiBUaGUgY29tcG9uZW50IG1hdGNoaW5nIGJldHdlZW4gdGhl
IEhEQQ0KY29kZWMgYW5kIHRoZSBzaWRlLWNvZGVjIGFwcGVhcnMgdG8gZmFpbC4NCg0KIyMjIFN1
c3BlY3RlZCBSb290IENhdXNlDQoNClRoZSBmaXh1cCBgQUxDMjg3X0ZJWFVQX1RBUzI3ODFfSTJD
YCBjaGFpbnMgdG8gYHRhczI3ODFfZml4dXBfdGlhc19pMmNgLA0Kd2hpY2ggc2V0cyB1cCBIREEg
Y29tcG9uZW50IG1hdGNoaW5nIGZvciBBQ1BJIElEIGBUSUFTMjc4MWAuIEhvd2V2ZXIsIHRoaXMN
CmxhcHRvcCB1c2VzIHRoZSBvZmZpY2lhbCBBQ1BJIElEIGBUWE5XMjc4MWAuIFRoZSBmaXh1cCBz
aG91bGQgaW5zdGVhZCB1c2UNCmB0YXMyNzgxX2ZpeHVwX3R4bndfaTJjYCB0byBtYXRjaCB0aGUg
Y29ycmVjdCBBQ1BJIElELg0KDQojIyMgUHJvcG9zZWQgRml4DQoNClRoZSBxdWlyayBlbnRyeSBm
b3IgU1NJRCBgMTA0MzozZWYwYCBzaG91bGQgcG9pbnQgdG8gYSBmaXh1cCB0aGF0IGNhbGxzDQpg
dGFzMjc4MV9maXh1cF90eG53X2kyY2AgaW5zdGVhZCBvZiBgdGFzMjc4MV9maXh1cF90aWFzX2ky
Y2AsIG9yDQphbHRlcm5hdGl2ZWx5IGEgbmV3IGBBTEMyODVfRklYVVBfQVNVU19UQVMyNzgxX1RY
TldfSTJDYCBmaXh1cCBzaG91bGQgYmUNCmNyZWF0ZWQuDQoNCk90aGVyIG5lYXJieSBBU1VTIFNT
SUQgZW50cmllcyB0aGF0IHVzZSBgVFhOVzI3ODFgIGRldmljZXMgKGUuZy4sDQpgMTA0MzozZWUw
YCwgYDEwNDM6M2YwMGAsIGAxMDQzOjNmMTBgLCBgMTA0MzozZjIwYCwgYDEwNDM6M2YzMGApIG1h
eSBoYXZlDQp0aGUgc2FtZSBpc3N1ZS4NCg0KIyMgRGlhZ25vc3RpYyBFdmlkZW5jZQ0KDQojIyMg
ZG1lc2cgKHJlbGV2YW50IGxpbmVzKQ0KDQpgYGANClsgICAxMy4yMDk2NjddIFNlcmlhbCBidXMg
bXVsdGkgaW5zdGFudGlhdGUgcHNldWRvIGRldmljZSBkcml2ZXINClRYTlcyNzgxOjAwOiBlcnJv
ciAtRU5YSU86IElSUSBpbmRleCAwIG5vdCBmb3VuZA0KWyAgIDEzLjIwOTc1OV0gU2VyaWFsIGJ1
cyBtdWx0aSBpbnN0YW50aWF0ZSBwc2V1ZG8gZGV2aWNlIGRyaXZlcg0KVFhOVzI3ODE6MDA6IGVy
cm9yIC1FTlhJTzogSVJRIGluZGV4IDAgbm90IGZvdW5kDQpbICAgMTMuMjA5ODEwXSBTZXJpYWwg
YnVzIG11bHRpIGluc3RhbnRpYXRlIHBzZXVkbyBkZXZpY2UgZHJpdmVyDQpUWE5XMjc4MTowMDog
ZXJyb3IgLUVOWElPOiBJUlEgaW5kZXggMCBub3QgZm91bmQNClsgICAxMy4yMDk4MjddIFNlcmlh
bCBidXMgbXVsdGkgaW5zdGFudGlhdGUgcHNldWRvIGRldmljZSBkcml2ZXINClRYTlcyNzgxOjAw
OiBJbnN0YW50aWF0ZWQgMyBJMkMgZGV2aWNlcy4NClsgICAxMy42NzM0NjddIHNuZF9oZGFfY29k
ZWNfYWxjMjY5IGhkYXVkaW9DMUQwOiBBTEMyODU6IHBpY2tlZCBmaXh1cCAgZm9yDQpQQ0kgU1NJ
RCAxMDQzOjNlZjANClsgICAxMy42NzM5NzRdIHNuZF9oZGFfY29kZWNfYWxjMjY5IGhkYXVkaW9D
MUQwOiBhdXRvY29uZmlnIGZvciBBTEMyODU6DQpsaW5lX291dHM9MiAoMHgxNC8weDE3LzB4MC8w
eDAvMHgwKSB0eXBlOnNwZWFrZXINClsgMzU5OS4zODU1NDddIHRhczI3ODEtaGRhIGkyYy1UWE5X
Mjc4MTowMC10YXMyNzgxLWhkYS4wOg0KdGFzZGV2aWNlX3BybWdfbG9hZDogRmlybXdhcmUgaXMg
TlVMTA0KYGBgDQoNCk5vdGU6IFRoZSBmaXh1cCBuYW1lIGFmdGVyICJwaWNrZWQgZml4dXAiIGlz
IGJsYW5rLCBidXQgZml4dXAgSUQgYDB4MTE5YCBJUw0KYXBwbGllZCAoY29uZmlybWVkIHZpYSBo
ZXhkdW1wIG9mIHRoZSBjb21waWxlZCBxdWlyayB0YWJsZSBpbiB0aGUga2VybmVsDQptb2R1bGUp
Lg0KDQojIyMgSTJDIGRldmljZXMgcHJlc2VudCBidXQgdW5ib3VuZA0KDQpgYGANCiQgbHMgL3N5
cy9idXMvaTJjL2RldmljZXMvIHwgZ3JlcCBUWE5XDQppMmMtVFhOVzI3ODE6MDAtdGFzMjc4MS1o
ZGEuMA0KaTJjLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjENCmkyYy1UWE5XMjc4MTowMC10YXMy
NzgxLWhkYS4yDQoNCiQgbHMgL3N5cy9idXMvaTJjL2RldmljZXMvaTJjLVRYTlcyNzgxOjAwLXRh
czI3ODEtaGRhLjAvZHJpdmVyDQpsczogY2Fubm90IGFjY2VzczogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQ0KKG5vIGRyaXZlciBib3VuZCB0byBhbnkgb2YgdGhlIDMgZGV2aWNlcykNCmBgYA0K
DQojIyMgRmlybXdhcmUgZmlsZXMgZXhpc3QNCg0KYGBgDQokIGxzIC91c3IvbGliL2Zpcm13YXJl
L1RBUzJYWFgzRUYwKg0KL3Vzci9saWIvZmlybXdhcmUvVEFTMlhYWDNFRjAwLmJpbi56c3QgLT4N
CnRpL2F1ZGlvL3RhczI3ODEvVEFTMlhYWDNFRjAwLmJpbi56c3QNCi91c3IvbGliL2Zpcm13YXJl
L1RBUzJYWFgzRUYwMS5iaW4uenN0IC0+DQp0aS9hdWRpby90YXMyNzgxL1RBUzJYWFgzRUYwMS5i
aW4uenN0DQpgYGANCg0KIyMjIFRBUzI3ODEgSTJDIGRyaXZlciBzdXBwb3J0cyBUWE5XMjc4MQ0K
DQpgYGANCiQgc3RyaW5ncyBzbmQtaGRhLXNjb2RlYy10YXMyNzgxLWkyYy5rbyB8IGdyZXAgVFhO
Vw0KVFhOVzI3ODENCmFsaWFzPWFjcGkqOlRYTlcyNzgxOioNCmBgYA0KDQojIyMgQ29kZWMgaW5m
bw0KDQpgYGANCiQgY2F0IC9wcm9jL2Fzb3VuZC9jYXJkMS9jb2RlYyMwIHwgaGVhZCAtNg0KQ29k
ZWM6IFJlYWx0ZWsgQUxDMjg1DQpBZGRyZXNzOiAwDQpBRkcgRnVuY3Rpb24gSWQ6IDB4MSAodW5z
b2wgMSkNClZlbmRvciBJZDogMHgxMGVjMDI4NQ0KU3Vic3lzdGVtIElkOiAweDEwNDMzZWYwDQpS
ZXZpc2lvbiBJZDogMHgxMDAwMDINCmBgYA0KDQojIyMgUmVsZXZhbnQgbG9hZGVkIG1vZHVsZXMN
Cg0KYGBgDQpzbmRfaGRhX2NvZGVjX2FsYzI2OQ0Kc25kX2hkYV9zY29kZWNfdGFzMjc4MV9pMmMN
CnNuZF9oZGFfc2NvZGVjX3RhczI3ODFfc3BpDQpzbmRfaGRhX3Njb2RlY190YXMyNzgxDQpzbmRf
aGRhX3Njb2RlY19jb21wb25lbnQNCnNuZF9zb2NfdGFzMjc4MV9pMmMNCnNuZF9zb2NfdGFzMjc4
MV9mbXdsaWINCnNuZF9zb2NfdGFzMjc4MV9jb21saWJfaTJjDQpzbmRfc29jX3RhczI3ODFfY29t
bGliDQpgYGANCg0KIyMgV2hhdCBoYXMgYmVlbiBydWxlZCBvdXQNCg0KLSBQaXBlV2lyZSBpcyB3
b3JraW5nIGNvcnJlY3RseQ0KLSBBbGwgQUxTQSBtaXhlciBjaGFubmVscyBhcmUgdW5tdXRlZCBh
bmQgYXQgZnVsbCB2b2x1bWUNCi0gQmFzcyBTcGVha2VyIHN3aXRjaCBpcyBvbg0KLSBUQVMyNzgx
IGRyaXZlciBtb2R1bGVzIGFyZSBsb2FkZWQNCi0gRmlybXdhcmUgZmlsZXMgZm9yIHRoaXMgU1NJ
RCBleGlzdCBpbiBsaW51eC1maXJtd2FyZQ0KLSBUaGlzIGlzIG5vdCBhIHVzZXJzcGFjZSBjb25m
aWd1cmF0aW9uIGlzc3VlDQoNCiMjIFN0ZXBzIHRvIFJlcHJvZHVjZQ0KDQoxLiBJbnN0YWxsIGFu
eSBMaW51eCBkaXN0cmlidXRpb24gb24gQVNVUyBST0cgU3RyaXggU0NBUiAxNiBHNjM1TFggKDIw
MjUpDQoyLiBCb290IHdpdGgga2VybmVsIDYuMTkueA0KMy4gT2JzZXJ2ZSBvbmx5IHR3ZWV0ZXIg
b3V0cHV0LCBubyBiYXNzL3dvb2ZlciBhdWRpbw0KNC4gQ2hlY2sgZG1lc2cgZm9yIGJsYW5rIGZp
eHVwIG5hbWUgYW5kICJGaXJtd2FyZSBpcyBOVUxMIg0KNS4gVmVyaWZ5IG5vIGRyaXZlciBpcyBi
b3VuZCB0byB0aGUgVEFTMjc4MSBJMkMgZGV2aWNlcw0KDQojIyBBZGRpdGlvbmFsIE5vdGVzDQoN
ClRoZSBgLUVOWElPOiBJUlEgaW5kZXggMCBub3QgZm91bmRgIGVycm9ycyBkdXJpbmcgVFhOVzI3
ODEgaW5pdGlhbGl6YXRpb24NCigzIG9jY3VycmVuY2VzIGZvciAzIGRldmljZXMpIG1heSBiZSBh
IHNlcGFyYXRlIEFDUEkgdGFibGUgaXNzdWUgYnV0IGRvIG5vdA0KcHJldmVudCBkZXZpY2UgaW5z
dGFudGlhdGlvbi4NCg0KVGhlICJGaXJtd2FyZSBpcyBOVUxMIiBtZXNzYWdlIGF0IHRpbWVzdGFt
cCAzNTk5cyAoNjAgbWludXRlcyBhZnRlciBib290KQ0KaW5kaWNhdGVzIGEgbGF0ZSBwbGF5YmFj
ayBhdHRlbXB0IHJlYWNoZWQgdGhlIFRBUzI3ODEgY29kZSBwYXRoIGRlc3BpdGUgdGhlDQpkcml2
ZXIgbmV2ZXIgaGF2aW5nIHByb3Blcmx5IHByb2JlZC4NCg==
