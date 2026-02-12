Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBFKMjZNqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:14 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D620274C
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C562760258;
	Wed,  4 Mar 2026 16:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C562760258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637493;
	bh=AJQUBr6AEROx66BfVqJ16YjGkQ4ypItJbMN1pukm1GE=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mG3WzlL41ZG4sIDjShVq1FbwUvIyEwpx3JYRUMmp9poNsSme5QcewDOlJzHzJZt48
	 t9fxGpUJGbC1Cnbsy26DHfenksoMa0utNEf89GKNjZF4Kw9vhZziCB/PNbSNOck/Je
	 hSAnn7RYf1r6RXnYSGXk3gK+DKml8P9L3SjLarwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D718F805ED; Wed,  4 Mar 2026 16:16:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEC1F806B4;
	Wed,  4 Mar 2026 16:16:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD409F8055A; Thu, 12 Feb 2026 17:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ECFFF8003A
	for <alsa-devel@alsa-project.org>; Thu, 12 Feb 2026 17:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ECFFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X05cKyTy
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-824a3ba5222so26257b3a.2
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Feb 2026 08:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770915043; cv=none;
        d=google.com; s=arc-20240605;
        b=bjMjdzdm27ieNtmJ34P9CqMnLu5TRXWGS3titOODvzbv8ki2aJwJAUBSduaqgjuJ7H
         lD86FxvmH14TxKmtN4gr8LNJ/zSkgudXYn7rBkM2d7MZa72ah38UORlSqsVqtjHs+oZm
         kZW+NlOdWMvoy1PblO08Povc/F0slgNB4l39D/rnRaL0q/5K/ETthKPM79MApUnlpwgN
         9HihSwQhN4jZOFRIqGpWbZ2pOsuBUmsPwbjZMG09OrcTXzga2tVlUFwDOIBldQ1uAolA
         4+2tYMQwtByQmBbk8LzwjjX+WtAEzlZQKzc2pUngvTXKABnH3D3uRYnjDcUGBqFvh14I
         hRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZsZAMkMVAhoevBzr1ClW7mlNOcH0vhXlsl29Qc5noFU=;
        fh=s1h8N4U4ASgl2diPi2yKjEmsLSTuwbZjYBDYrAXLUvw=;
        b=Qttq8HGSMDt+xVafk81U2aOsALikGChHq0rv+qMU56pbYUnULpD8NfNOalqEBSNnJ7
         /UZFfMpXKlN6hqvaAMqETCzdcKTX6DJw4El+2f2FzHEJUKxUxapTi881jruMa39QO70l
         7n32bQPm24VsfXX+WVGsSiTOBihfyvBDdwkwynx2wj/HihWrNFR/seJD2tidXDLffSRN
         /4NframUxroyTtRoAOYlBYJpsJBz1R97YwBNIAfJUOfI1oLN9iG4upeU6U8GqCG/+Phs
         44I9XiAZTqvb55gceV/Cw22nJ9ZdEjGDTzTOisH7Vb3KKJUAkwysN3IomW8itCevCG7u
         vluw==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915043; x=1771519843;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZsZAMkMVAhoevBzr1ClW7mlNOcH0vhXlsl29Qc5noFU=;
        b=X05cKyTyz/nASWoq6rD9Y8DHpzSguyc5aCnkdCEdjRwSGeKwQEfyvS8eNZQIQxpFPC
         gOhTIlAhuoacRdOP0DodzxGUyWbWoyQXXzrGBJ1QHjaEHXaS+LzVKkjDPmStf6mp82lL
         ICWGdVeAgCL5XxILEfalXmDQyvkSQvRERhl65q9UZe6BX2ImejXw2Ad7bBHi9Pi+aF/N
         2A2WJ2EL9VHCkICVhVewP/H//+8GXp6JzYI/g87DMLYC2VFAfAykCJ8DjNuOIH9gpWAo
         5uPcJNumFcKlt7ujLxQmfIHLn9dGQyc9+oR3fcxgzh7d9jCaSPVheKyUHmTmK96Th+87
         /2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915043; x=1771519843;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsZAMkMVAhoevBzr1ClW7mlNOcH0vhXlsl29Qc5noFU=;
        b=tFavmG4jke/EimtPms/BSLeGgp0494+FfanWK27LT4eJIW4Sddi9Hirh5whkiwL/U8
         1gPyAYn1IslmeaT6ntvvRM1X+JL7I9NQPiA2+VyN/kxiq+UgIUxByTAFwJLbSxLay4Ik
         fDj37dLBGoAWUb7t0KKBfqzFHYuFj7EL1+sKv3u+y4VSFRrwTREZ1o2+Eo+TZbqP0die
         b67uRpQa5g+ao19NsdKloPkx9tgOfJb6x43HTDWrC4gdgs2J20lIfFYvGpuZBb5a3Wqv
         I/WsAPILZFYTBsBnLb4Ne5eY9PLUmHPsOGsOMywZO2U4BRBXgwtY5VvJF1qEuD9nrvKM
         HL+g==
X-Gm-Message-State: AOJu0YxRdD388uvm4HEzAiyxPMTaTFZkOfeLDvs4Z0eecFAd/FhjjhGa
	g4Ebj/0Hj018sclaBDsDJVcluVPx4peEav9dNo0ADQOKsiuzHbxWAcujSx+qaME6189kL4swPfC
	OMlkcDaWH3L2XCEfSFb+jGaZPUBHALjTr21jH
X-Gm-Gg: AZuq6aKFgXXJfCC/5F+UAn/497QUQYBkRFApYXe0Y2/FileKCE3gCIf9ymk+weV/VAP
	9/ao6pryoxxJbAK2hnZPs7v9ikSHbcv6BzgnaPkmU7xMcMN0B4Gigw7DAhnhowyFJqHCdMjngtL
	7wrNtn1tc0tKRlUNHIQTas3GDGnJySm1FkDJOf5I0udL3tXjZxWVKX83xVuLI/6e8SkgXSy6PC1
	UUrFPw83EEMwPz7AaesEiF+EmuGSiPl1oZdNOuBfdex2x5U0ku01NEOOTEPGHKDKtwSwRGh8INS
	Rq6garA=
X-Received: by 2002:a05:6a21:670b:b0:38d:ee4a:e80e with SMTP id
 adf61e73a8af0-39448999864mr3274274637.76.1770915042946; Thu, 12 Feb 2026
 08:50:42 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyw61hIEJlbMOpbiBUaW1vc3Np?= <maria.belen.timossi@gmail.com>
Date: Thu, 12 Feb 2026 13:50:32 -0300
X-Gm-Features: AZwV_Qj8zJZUKhnYHC23aOlhRhapOm9e_U47T4JlHkD_G1jfSLLNh3eO0XrlBbc
Message-ID: 
 <CADw5c-cVP17rD=1QPn1fA8YKKNoLzdhnMKTJ2GhPynE-k31tNQ@mail.gmail.com>
Subject: [PATCH REQUEST] Conexant SN6140: Inverted headphone jack detection on
 Lenovo ThinkPad E16 Gen 3 (17aa:5135)
To: alsa-devel@alsa-project.org
X-MailFrom: maria.belen.timossi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OLENW3S5CL4TGBTCDENTIHCDCQJMQSN6
X-Message-ID-Hash: OLENW3S5CL4TGBTCDENTIHCDCQJMQSN6
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:24 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLENW3S5CL4TGBTCDENTIHCDCQJMQSN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 726D620274C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	DATE_IN_PAST(1.00)[478];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mariabelentimossi@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,mail.gmail.com:mid,alsa-project.org:dkim]
X-Rspamd-Action: no action

SGVsbG8gQUxTQSBkZXZlbG9wZXJzLA0KDQpJJ20gcmVwb3J0aW5nIGEgYnVnIHdpdGggdGhlIENv
bmV4YW50IFNONjE0MCBjb2RlYyBvbiB0aGUgTGVub3ZvIFRoaW5rUGFkDQpFMTYgR2VuIDMgKFNT
SUQ6IDE3YWE6NTEzNSkuDQoNCkhhcmR3YXJlOg0KLSBNb2RlbDogTGVub3ZvIFRoaW5rUGFkIEUx
NiBHZW4gMyAoMjFTUzAwMFRBQykNCi0gQ1BVOiBJbnRlbCBVbHRyYSA3IDI1NUgNCi0gQXVkaW8g
Q29kZWM6IENvbmV4YW50IFNONjE0MCAodmVuZG9yOiAweDE0ZjEsIGRldmljZTogMHgxZjg3LCBz
dWJzeXN0ZW06DQoweDE3YWE1MTM1KQ0KLSBLZXJuZWwgdGVzdGVkOiA2LjE4LjcsIDYuMTcuMCwg
Ni44LjANCg0KUHJvYmxlbToNClBpbiAweDE2IChoZWFkcGhvbmUgamFjaykgYWx3YXlzIHJlcG9y
dHMgcHJlc2VuY2UgKEdFVF9QSU5fU0VOU0UgcmV0dXJucw0KMHg4MDAwMDAwMCkgZXZlbiB3aGVu
IG5vdGhpbmcgaXMgcGx1Z2dlZCBpbi4gVGhpcyBjYXVzZXM6DQotIEludGVybmFsIHNwZWFrZXJz
IGFyZSBwZXJtYW5lbnRseSBtdXRlZCAoYmVjYXVzZSBzeXN0ZW0gdGhpbmtzIGhlYWRwaG9uZXMN
CmFyZSBhbHdheXMgY29ubmVjdGVkKQ0KLSBObyBhdWRpbyBvdXRwdXQgdGhyb3VnaCB0aGUgaGVh
ZHBob25lIGphY2sgd2hlbiBoZWFkcGhvbmVzIGFyZSBhY3R1YWxseQ0KcGx1Z2dlZCBpbg0KLSBP
bmx5IHNwZWFrZXJzIHdvcmsgd2hlbiBoZWFkcGhvbmVzIGFyZSBOT1QgY29ubmVjdGVkDQoNClRo
ZSBpc3N1ZSBkb2VzIE5PVCBvY2N1ciBpbiBXaW5kb3dzLCBzdWdnZXN0aW5nIGl0J3MgYSBMaW51
eCBkcml2ZXINCmNvbmZpZ3VyYXRpb24gaXNzdWUgcmF0aGVyIHRoYW4gaGFyZHdhcmUgZmFpbHVy
ZS4NCg0KVGVjaG5pY2FsIGRldGFpbHM6DQotIHBhY3RsIHNob3dzICJhbmFsb2ctb3V0cHV0LWhl
YWRwaG9uZXMiIGFzIGFjdGl2ZSBwb3J0IGV2ZW4gd2l0aG91dA0KaGVhZHBob25lcw0KLSBTcGVh
a2VyIHBvcnQgc2hvd3MgYXMgImF2YWlsYWJpbGl0eSB1bmtub3duIg0KLSBBdXRvLW11dGUgbG9n
aWMgcGVybWFuZW50bHkgbXV0ZXMgc3BlYWtlcnMgZHVlIHRvIGZhbHNlIGphY2sgZGV0ZWN0aW9u
DQoNCkF0dGVtcHRlZCB3b3JrYXJvdW5kcyAodW5zdWNjZXNzZnVsKToNCi0gRGlzYWJsaW5nIGF1
dG8tbXV0ZSBpbiBhbHNhbWl4ZXINCi0gUmVtYXBwaW5nIHBpbnMgd2l0aCBoZGFqYWNrcmV0YXNr
DQotIE1hbnVhbCBwb3J0IHN3aXRjaGluZyB3aXRoIHBhY3RsDQotIEluc3RhbGxpbmcgbGF0ZXN0
IGZpcm13YXJlLXNvZi1zaWduZWQgYW5kIGFsc2EtdWNtLWNvbmYNCg0KUmVxdWVzdDoNCkNvdWxk
IGEgcXVpcmsgYmUgYWRkZWQgZm9yIFNTSUQgMTdhYTo1MTM1IHRvIGZpeCB0aGUgaW52ZXJ0ZWQv
ZmF1bHR5IGphY2sNCmRldGVjdGlvbj8gVGhpcyBhcHBlYXJzIHNpbWlsYXIgdG8gb3RoZXIgcmVw
b3J0ZWQgU042MTQwIGlzc3Vlcy4NCg0KQWRkaXRpb25hbCBpbmZvcm1hdGlvbiBhdmFpbGFibGUg
YXQ6DQpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9hbHNhLWRyaXZl
ci8rYnVnLzIxMzk1MTINCg0KVGhhbmsgeW91IGZvciB5b3VyIHRpbWUuDQoNCkJlc3QgcmVnYXJk
cywNCkJlbMOpbg0K
