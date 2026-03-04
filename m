Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB/fLCRNqGnUswAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:56 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F7202721
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D157060234;
	Wed,  4 Mar 2026 16:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D157060234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637475;
	bh=0+Beeyas2F4pSlu0FOyXWb6ekGHX7ra4jCx0JNyNH9o=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n67MbtddMy+NSrBlEYkJ/U2UgoRPAvlcSepYE/j6EyeZsGHAospgJAgzappSxONP+
	 IaxXUXjnJ4w6uvfAwkrj7+V0bcyDvolsUyFD0bAir41HC7JEBzCv5iZsTU2tdZCK7t
	 szoZ71i8U5jRfW1hDc2dzI3vINOYEn4PG5zCE260=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F7EF80681; Wed,  4 Mar 2026 16:16:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F38DAF805DA;
	Wed,  4 Mar 2026 16:16:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2779F805BD; Wed,  4 Mar 2026 12:08:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_GMAIL_RCVD,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C5F4F80093
	for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2026 12:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5F4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CxcDevU/
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3870778358aso81136641fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Mar 2026 03:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622484; cv=none;
        d=google.com; s=arc-20240605;
        b=CsQUuwcXeXjRP71SqJI8zXVYdyT7TOeKuDdeWwtzCxgln76uttltzQp4uGtnBcjKJz
         DjKyi6WTLrYElw3ky79koJYvstg9HtQYWtWIc1TAErGNC5zpfBvFGUDq7U2iahGT2bWw
         g3tciPL5RFJMmAJ180EwWX3KHYo1Kn3fmNLYg6Iwvur1Z04QKg7f3IWzbhW/n3wibv4t
         9dJoms6ffCu5QZf138aj/9IUIlLuMSL5DuFOQBlpqYHlNyhgsR6VI83/QS0Vu+FAt/lt
         YNO5NqmPz8kSyWW2y2120xVJh/Kc092QcCTBJMmUmwQW4IvxoLDqSZBfFcot45e2w7a+
         TxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jqe+qF7pPv32ybqRlcQM1bD/5lO9svM/V95KUChsmL0=;
        fh=NfFBHPgSbMcuzKkLMdP5uRhj9GC46ezPKPbbsbgYGVY=;
        b=DDn86k+UT4rlLhfmA1MDVJQ2C+zM0UaLipefNn9Edl9ighDWeiT2uHH9mh1gSlEdWS
         06dQf0t0Qe674lO31smKQFczFXNH5+hlRC3UQXg8i5Qr52YMAUbnu+MdMwG8UxubMROZ
         ruqzlxQgW//Yg3CiIf6fTWkxhTsX2WAOI3Fr2j+eduwAOxIt0lfbLTSegY8KkvmwPBn0
         iYAsbCa6GQNRGgDgJPyxZ+iT0x+7qZGw5RlCpG0wO6PKCNKxbxbBULQnAX5vtRNzo4rf
         crXQdV+a5pcJ9uRqcEhj32P4T+nzys+uv8ZI0yyohvql9CmS5h9VUiqtkjGrabs3dQ+b
         iBsQ==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772622484; x=1773227284;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jqe+qF7pPv32ybqRlcQM1bD/5lO9svM/V95KUChsmL0=;
        b=CxcDevU/807XJ1pG6uTRcLAv9tAkjTncp4B68KWs6UwWZTcozz+8tLQT67yctvQp9Y
         UScMfzufpyDAGhZQ4WGtjb8RipDLf8W93fGp9XRsys8bYWCq90n7kbWg9IhgJvoolrM8
         NE6iUA+SHUzpiPRaCM1VKMKJ8Va/H5wQ5UqiEM5pxM3/hMVZSbLIFCSrBkVUUEz8lRMK
         anMu1H4eIlsKfb+yeiikuZZV5QUHSliTOXVjhB1OmsxXbWTrxkFpegGBifBSpVNvRAko
         /5JQ1cVBRw95Ba2jYHBZSpgCyEGX4sznf4KvEP0pHwo44gmgbOQSSiGOCji+Bl/psseM
         My2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622484; x=1773227284;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqe+qF7pPv32ybqRlcQM1bD/5lO9svM/V95KUChsmL0=;
        b=D8VvKzo2LCBXIfFEaZpjBDkfodvvkzAQDEuPBN0+BhTX4Zpq0PJVvUftsxVEmoe0Yy
         GzhMjCPPmKV5oG4zjbfFuz1BvvbNcHlgRx+8Tht+owhpJ1ZGSW15iNboMAZ7x0akEKPi
         QEVFLF8gbT3JiqcjFiAwOn64ZX7BWiyCscMl0p2ZxYESCYd2b0qIMEhs/maZ6Iev7jg8
         M0N8M1cB3HjHksSSxvL5+WIF/oN+Vn1brVwuRHTkQLDLfBXdN+irgKnP0Rho4Bp/hR3A
         guMypaxuZWj6GJENCX7cOk8NWsDCLIQcynC4Z5ecPccaUcsKTuq2CrOIgoqzwHWZkcz1
         ZbGg==
X-Gm-Message-State: AOJu0YySupQ1ZGG5qfxC4yFgRdmehhOWI0s6nVdKVM88BxKaN2JKMTaT
	ARU+W1M0LzyFa/dBBhZ5hd24KqX6Vr48yNS1BsP6WZMUurJWq5U1nv9Unp69UKKtNABWr0R6kmo
	usv6rWGInPP1DZ7ol6j0lN2aSw8kv8jpXvku/
X-Gm-Gg: ATEYQzzGz2/yrkhd+GnnPh7RJL63QgnTRgRq6Ifyr5/FwQbpuLTy34rw0NiayA2Wjx1
	RaC6rnvUooHzMLexo5aY7wd3bXewzTZOYoHMZwSsxsPZnQCqeTv8b2hZTDzRb/upYh4Y8xxQZ45
	UBffGStVRmE7PvBEC2b/Y5MKbJa66bSIae1wJATLyKrFpvaFiOIPEZhMIZgLIvT6AH+qjitMYok
	SHX/+jNz4u3edAHJ0nv9oQNVp6Rr6k/R3sKJJDMv7tFFM5/5uF0LMxJHRAaj9u94ep5NnIkum9S
	vsQ+QxCvpRMjMeuOX9LndmINd/LAcL5y4IBdnNBtQ0nIELkyubxus/qfWOs4bGMt
X-Received: by 2002:a2e:9e46:0:b0:38a:b47:e522 with SMTP id
 38308e7fff4ca-38a2c5b6be0mr10182861fa.19.1772622483513; Wed, 04 Mar 2026
 03:08:03 -0800 (PST)
MIME-Version: 1.0
From: Shawn Adams <0xshawnadams@gmail.com>
Date: Wed, 4 Mar 2026 03:07:52 -0800
X-Gm-Features: AaiRm52T-V7gZgbi2WFcDNkTeO2ioWfQgySJKFyHNp2IRQd66pcnMPFuTsHBbxE
Message-ID: 
 <CA+MEaFgBubsYk0yoAax-kJW-C3av=umUQOFPrHQFuNSHm_p7aw@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add HP Laptop 17-cp2xxx DMI entry and fix _WOV
 fallthrough
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com, Basavaraj.Hiregoudar@amd.com
X-MailFrom: 0xshawnadams@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation
Message-ID-Hash: XL63QDKECSETJRZE6EI2A7MTY4M2EASC
X-Message-ID-Hash: XL63QDKECSETJRZE6EI2A7MTY4M2EASC
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:06 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XL63QDKECSETJRZE6EI2A7MTY4M2EASC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 639F7202721
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[gmail.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[0xshawnadams@gmail.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,mrsaturn:email]
X-Rspamd-Action: no action

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSmFkZSA8amFkZUBNclNhdHVybj4NCkRhdGU6IFdlZCwgNCBN
YXIgMjAyNiAwMzowMzo0MCAtMDgwMA0KU3ViamVjdDogW1BBVENIXSBBU29DOiBhbWQ6IHljOiBB
ZGQgSFAgTGFwdG9wIDE3LWNwMnh4eCBETUkgZW50cnkgYW5kIGZpeA0KIF9XT1YgZmFsbHRocm91
Z2gNCg0KVGhlIEhQIExhcHRvcCAxNy1jcDJ4eHggKFBDSSBzdWJzeXN0ZW0gSUQgMTAzQzo4RDQ0
KSBoYXMgYW4gaW50ZXJuYWwNCmRpZ2l0YWwgbWljcm9waG9uZSBjb25uZWN0ZWQgdmlhIHRoZSBB
Q1A2eCBQRE0gcGF0aCwgYnV0IGl0IGRvZXMgbm90DQphZHZlcnRpc2UgdGhlIEFjcERtaWNDb25u
ZWN0ZWQgQUNQSSBwcm9wZXJ0eS4gSW5zdGVhZCwgaXRzIF9XT1YgbWV0aG9kDQpyZXR1cm5zIDAg
KHdha2Utb24tdm9pY2UgZGlzYWJsZWQpLCBjYXVzaW5nIHRoZSBkcml2ZXIgdG8gcmV0dXJuDQot
RU5PREVWIGJlZm9yZSByZWFjaGluZyB0aGUgRE1JIHF1aXJrIHRhYmxlIGNoZWNrLg0KDQpGaXgg
dGhpcyBieSBjaGFuZ2luZyB0aGUgX1dPVj09MCBlYXJseSByZXR1cm4gdG8gYSBnb3RvIHRoYXQg
ZmFsbHMNCnRocm91Z2ggdG8gdGhlIERNSSB0YWJsZSBjaGVjaywgY29uc2lzdGVudCB3aXRoIGhv
dyBfV09WIG1ldGhvZCBhYnNlbmNlDQppcyBhbHJlYWR5IGhhbmRsZWQuIFRoaXMgYWxsb3dzIERN
SS1iYXNlZCBxdWlya3MgdG8gZW5hYmxlIERNSUMgc3VwcG9ydA0Kb24gbWFjaGluZXMgd2hlcmUg
X1dPViBpcyBwcmVzZW50IGJ1dCBkaXNhYmxlZC4NCg0KQWxzbyBhZGQgYSBETUkgZW50cnkgZm9y
IHRoZSBIUCBMYXB0b3AgMTctY3AyeHh4IHRvIGVuYWJsZSBpbnRlcm5hbA0KbWljcm9waG9uZSBz
dXBwb3J0IG9uIHRoaXMgcGxhdGZvcm0uDQoNClRlc3RlZCBvbjogSFAgTGFwdG9wIDE3LWNwMjAy
NWR4DQogIC0gU3Vic3lzdGVtIElEOiAxMDNDOjhENDQNCiAgLSBDb2RlYzogUmVhbHRlayBBTEMy
MzYNCiAgLSBLZXJuZWw6IDYuMTcuMC0xNC1nZW5lcmljIChVYnVudHUgMjUuMTApDQoNClNpZ25l
ZC1vZmYtYnk6IEphZGUgPGphZGVATXJTYXR1cm4+DQotLS0NCiBzb3VuZC9zb2MvYW1kL3ljL2Fj
cDZ4LW1hY2guYyB8IDIwICsrKysrKysrKysrKystLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
YW1kL3ljL2FjcDZ4LW1hY2guYyBiL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jDQppbmRl
eCBYWFhYWFhYLi5ZWVlZWVlZIDEwMDY0NA0KLS0tIGEvc291bmQvc29jL2FtZC95Yy9hY3A2eC1t
YWNoLmMNCisrKyBiL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jDQpAQCAtNjYxLDYgKzY2
MSwxMyBAQA0KICBETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIkJyYXZvIDE1IEM3VUNYIiks
DQogIH0NCiAgfSwNCisgew0KKyAuZHJpdmVyX2RhdGEgPSAmYWNwNnhfY2FyZCwNCisgLm1hdGNo
ZXMgPSB7DQorIERNSV9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiSFAiKSwNCisgRE1JX01BVENI
KERNSV9QUk9EVUNUX05BTUUsICJIUCBMYXB0b3AgMTctY3AyeHh4IiksDQorIH0NCisgfSwNCiAg
e30NCiB9Ow0KDQpAQCAtNjkzLDcgKzcwMCw3IEBADQogIGlmICghQUNQSV9GQUlMVVJFKHJldCkp
IHsNCiAgd292X2VuID0gZG1pY19zdGF0dXM7DQogIGlmICghd292X2VuKQ0KLSByZXR1cm4gLUVO
T0RFVjsNCisgZ290byBjaGVja19kbWlfZW50cnk7DQogIH0gZWxzZSB7DQogIC8qIEluY2FzZSBv
ZiBBQ1BJIG1ldGhvZCByZWFkIGZhaWx1cmUgdGhlbiBqdW1wIHRvIGNoZWNrX2RtaV9lbnRyeSAq
Lw0KICBnb3RvIGNoZWNrX2RtaV9lbnRyeTsNCg==
