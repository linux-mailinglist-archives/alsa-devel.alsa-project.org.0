Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334D95E55E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2024 23:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24F51FF;
	Sun, 25 Aug 2024 23:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24F51FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724620299;
	bh=VkOuVGO8kEuJ+X3OxaFAvhWJTf5hAj4pLAAINeVeas8=;
	h=Date:To:From:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=F8JXjrMXrMD8hBWG8kiJO2TotGnSYrLjBGnMs0g5t7uTiFs00feXFkZ9vORntkcwJ
	 M9hxbcHM+Gp28ndJBL8qC7CbOrC/zBjskYqZ5aNqAKMNHyIrswJt1IuV+weEGayasR
	 YHKm3PpOVgjj8A5weenhPrLWHLQaStfSVDFr/yBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C575F805B5; Sun, 25 Aug 2024 23:11:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFEF8F80568;
	Sun, 25 Aug 2024 23:11:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C431F80423; Sun, 25 Aug 2024 23:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch
 [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A97CF8025E
	for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2024 23:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A97CF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=hpKQZIn3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724620254; x=1724879454;
	bh=vIE5jU/ecfF7Or4asWIaD8qexDu30K4B4JTHKJ2Vm4M=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hpKQZIn3oFVedmi39NNKX5vXACI4CHM4fR/1mU0MqnCqGe3bapdYCbKle2u/aTWrF
	 X1BPkghNQLTKnRltpw0CCS9faFZmCfiDlt0i4BzwfxZN/BbLs6HMQ18Hkryyz28WY7
	 vKk3Mi1Xxm1dgh1d4yVVqlz8CgSw2xnnGOiueM4EHG4GsHWIoXtlRHYQP98EQbJHfM
	 e1tv+IifwIhwQrno3y32HwzYf0lslrf8SWoNN/lJ8YxaNgFhuSTb0/ouOj1/rz+xHM
	 SIhFnmLZ0BDBjMlI8PZ1OkkWmpONTFNnkiXObQEBGQhVXK8WCgDO+SvF12DabvJsmf
	 up5qwBWSWcyyw==
Date: Sun, 25 Aug 2024 21:10:48 +0000
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Xerox Slayer <xeroxslayer@proton.me>
Subject: Re: [DISCUSSION] Why doesn't ALSA autogenerate/autoconfigure the mono
 profile by default?
Message-ID: 
 <2XTdcFdXbdOWeHvRDvq7UI2lcCIl_2O4AjoQAFIsy5h6h1XLmE_oNEij1z3eg1L9TsZHMGqppEYV37ULLx5zqevYaZ5bLYk6VeTQc7cSwp0=@proton.me>
In-Reply-To: 
 <-hY2k_-HP_RpNxt1vOEArHKgjIw69LG4IcnstasrAk_1knJNIpf7OhREgR7QSJky95DP4pn8-fo7Ne1YDbqQKbqNh0m_b-p2Id1cd5Kq3TU=@proton.me>
References: 
 <-hY2k_-HP_RpNxt1vOEArHKgjIw69LG4IcnstasrAk_1knJNIpf7OhREgR7QSJky95DP4pn8-fo7Ne1YDbqQKbqNh0m_b-p2Id1cd5Kq3TU=@proton.me>
Feedback-ID: 112401143:user:proton
X-Pm-Message-ID: f1a7347a5ecc2682e7c119f62994445f0b0aa7d4
MIME-Version: 1.0
Message-ID-Hash: 3YCEJ5D57RZTA6N6ADUN3MKACGOYUA36
X-Message-ID-Hash: 3YCEJ5D57RZTA6N6ADUN3MKACGOYUA36
X-MailFrom: xeroxslayer@proton.me
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YCEJ5D57RZTA6N6ADUN3MKACGOYUA36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgYW55b25lIGNvdWxkIGRpcmVjdCBtZSB0byB3aGVyZSBJ
IGNvdWxkIGFzayB0aGlzIHF1ZXN0aW9uLiBJIGFtIHNvcnJ5IGlmIHRoaXMgaXMgbm90IHdoZXJl
IEknbSBzdXBwb3NlZCB0byBhc2sgdGhpcyBxdWVzdGlvbiwgYnV0IEkgcmVhbGx5IGhhZCBubyBp
ZGVhIHdoZXJlIHRvIGFzay4KCk9uIFR1ZXNkYXksIEF1Z3VzdCAyMHRoLCAyMDI0IGF0IDExOjM4
IEFNLCBYZXJveCBTbGF5ZXIgPHhlcm94c2xheWVyQHByb3Rvbi5tZT4gd3JvdGU6Cgo+IFNvcnJ5
IGlmIHRoaXMgaXMgdGhlIHdyb25nIHBsYWNlIHRvIGRpc2N1c3MgdGhpcywgYnV0IGZyb20gd2hh
dCBJIG1hbmFnZWQgdG8gZmluZCBvdXQsIHRoaXMgaXMgcHJpbWFyaWx5IHRoZSByZXNwb25zaWJp
bGl0eSBvZiBBTFNBLgo+Cj4gVGhpcyB3YXMgcG9pbnRlZCBvdXQgYnkgYSByZWRkaXQgdXNlciwg
YW5kIHRvIGJlIGZyYW5rLCBJIHdhcyBraW5kYSBzdXJwcmlzZWQgdGhhdCB0aGlzIGlzIG5vdCBk
b25lIGJ5IGRlZmF1bHQuIFRoZSB1c2VyIGluIHF1ZXN0aW9uIGlzIGhlYXJpbmcgaW1wYWlyZWQg
KGNhbiBsaXN0ZW4gb24gb25seSBvbmUgZWFyKSwgc28gdGhlIHVzZXIgaGFzIG5vIGJlbmVmaXQg
b2YgYWN0dWFsbHkgbGlzdGVuaW5nIHRvIHN0ZXJlbyBvciBhbnkgb3RoZXIgbXVsdGljaGFubmVs
IGF1ZGlvLCB0aHVzIHdhbnRlZCB0byBqdXN0IHNldCBldmVyeXRoaW5nIHRvIG1vbm8gKGR1YWwg
bW9ubyBJIHByZXN1bWUpIGFuZCB3YXMgcHV6emxlZCB3aGVuIHRoZXJlIHdhcyBubyBzdWNoIG9w
dGlvbiBpbiBwdWxzZWF1ZGlvICh3aGljaCBwdWxscyB0aGUgcHJvZmlsZXMgZnJvbSBBTFNBKS4g
SSBkaWQgc29tZSBtb3JlIGludmVzdGlnYXRpb24gYW5kIGFzIGl0IHR1cm5zIG91dCwgdGhpcyBw
cm9maWxlIGlzIGF1dG9nZW5lcmF0ZWQsIGJ1dCBvbmx5IGlmIHRoZSBoYXJkd2FyZSBoYXMgc3Vj
aCBjYXBhYmlsaXR5IChhcyBpcyB0aGUgY2FzZSB3aXRoIGFueSBvdGhlciBwcm9maWxlKS4gWW91
IGNhbiBlbmFibGUgaXQgbWFudWFsbHkgYnkgZWRpdGluZyBjb25maWcgZmlsZXMgKGluIHdoaWNo
IGNhc2UgSSBwcmVzdW1lIHRoZSBjaGFubmVsIGRvd25jb252ZXJzaW9uIGlzIGRvbmUgaW4gc29m
dHdhcmUpLCBidXQgaXQgc2VlbWVkIG9kZCB0aGF0IG9uZSBoYXMgdG8gZ28gdGhyb3VnaCBzdWNo
IHRyb3VibGUganVzdCB0byBsaXN0ZW4gdG8gbW9ubyBzb3VuZC4KPgo+IFRodXMsIEkgdGhpbmsg
dGhlIG1vbm8gcHJvZmlsZSBzaG91bGQgYmUgdGFrZW4gYXMgYSBzcGVjaWFsIGNhc2Ugc2NlbmFy
aW8gYW5kIGJlIGF1dG9nZW5lcmF0ZWQvY29uZmlndXJlZCBieSBkZWZhdWx0LCByZWdhcmRsZXNz
IGlmIGl0J3Mgc3VwcG9ydGVkIGluIGhhcmR3YXJlIG9yIG5vdC4KPiBPbmNlIGFnYWluLCBJJ20g
c29ycnkgaWYgdGhpcyBpcyBub3QgdGhlIHBsYWNlIHRvIGFzay9kaXNjdXNzIHRoaXMsIGJ1dCB3
b3VsZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgcG9pbnRlZCBtZSB0byB3aGVyZSBJIGNhbiBhY3R1
YWxseSBkbyB0aGlzLg==
