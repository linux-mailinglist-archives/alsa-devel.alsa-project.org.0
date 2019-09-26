Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE43BEDDF
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 10:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECAD1723;
	Thu, 26 Sep 2019 10:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECAD1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569487982;
	bh=4CENquCbGKSftwoOItWAYVFVaS4eVj39917eTdparGs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z8r8NkiFP/hMtEWi7hzOkiebMOWtGe0GBYYooRIpqDGASr5naFEzlOjB4iGTabvDw
	 g5fL/uLPIpYoG/XQjOtQocMU8MVEm4qyL5g8loZh5mjdY35QL+G7nPJq0kkv2rWcrw
	 Nl28MGqi0Opaa0Rro9hDQgPqQ//mN5H2jmX2jCVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C81F8048D;
	Thu, 26 Sep 2019 10:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57DE2F803F4; Thu, 26 Sep 2019 10:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3AAF80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 10:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3AAF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk
 header.i=@rasmusvillemoes.dk header.b="d7KxK0sC"
Received: by mail-lj1-x243.google.com with SMTP id l21so1300548lje.4
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 01:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JxTQ4Xr3344cpWCG4BIW/1ZqVwik7sHCKiCTOE2X9m4=;
 b=d7KxK0sCAAvz6z6Y8/K09q831hikJED/i8jll4bvn33Ys1TzPK/1bPUSAbJeeZTEWU
 uVlRKsN5TIDvkYtTaSbySKPWBn2tBkB9jCWPz2EGcVuwRVsw3t3O/McRsLnocDiEewNh
 Fl1fBmxfKpOeIzHAZxfu7QTM+DZ2L1UikE3bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JxTQ4Xr3344cpWCG4BIW/1ZqVwik7sHCKiCTOE2X9m4=;
 b=BpEDJ7rm7lEVs5coP1mBAoz0htOc8oRtVca043lGkpIYuwYc9O32M+lfjTLHwF20q9
 kXwRYcr14Y9mgAmgh2TPi36UUIKXkzxW3owUJaYS+G2h1CPLkCuxT5ftTqqHlkfFFddS
 toWcSihBL9nlTwwVqN1ETN2QeLbBsevMEiq0y1wV708d6z5TuDjPQCA4oSdDadQkk5BH
 AKCjt6nuht9UyJLWZmf10e3nKUvxFSLgtdL+b55SRAY0F1r/0+SWcCM9LIF0L90x8yaE
 HYJDfvT3M1H6BdOfB/NP9laC+X6g2zf7FrmCwVmfexWlsXP0svTjKcZk5cTldQ4wmMiT
 zI0A==
X-Gm-Message-State: APjAAAUQhGJGGHRBfvlMbOz2dB6osmNPyx3eyVjdWh3TAp9xXWy9AJJ7
 KBraXFMzPggbQoIM5e+uwlt8AkKqb0o4Wplc
X-Google-Smtp-Source: APXvYqzssLLp7ITRItmffAgBPI/U1AAur6UajisezavY9OYf/UxAeld/gv0f7dgMumw1Ows7Xglchg==
X-Received: by 2002:a2e:808c:: with SMTP id i12mr1775624ljg.78.1569487871273; 
 Thu, 26 Sep 2019 01:51:11 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id t27sm393173lfl.48.2019.09.26.01.51.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 01:51:10 -0700 (PDT)
To: Stephen Kitt <steve@sk2.org>
References: <cover.1563889130.git.joe@perches.com>
 <ed4611a4a96057bf8076856560bfbf9b5e95d390.1563889130.git.joe@perches.com>
 <20190925145011.c80c89b56fcee3060cf87773@linux-foundation.org>
 <c0c2b8f6ac9f257b102b5a1a4b4dc949@sk2.org>
 <8039728c-b41d-123c-e1ed-b35daac68fd3@rasmusvillemoes.dk>
 <24bb53c57767c1c2a8f266c305a670f7@sk2.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f257526e-7d6e-6665-b539-da113b0f83ba@rasmusvillemoes.dk>
Date: Thu, 26 Sep 2019 10:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <24bb53c57767c1c2a8f266c305a670f7@sk2.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, jannh@google.com,
 Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-hardening@lists.openwall.com,
 Nitin Gote <nitin.r.gote@intel.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [alsa-devel] [PATCH V2 1/2] string: Add stracpy and stracpy_pad
	mechanisms
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMjYvMDkvMjAxOSAxMC4yNSwgU3RlcGhlbiBLaXR0IHdyb3RlOgo+IExlIDI2LzA5LzIwMTkg
MDk6MjksIFJhc211cyBWaWxsZW1vZXMgYSDDqWNyaXTCoDoKPj4gT24gMjYvMDkvMjAxOSAwMi4w
MSwgU3RlcGhlbiBLaXR0IHdyb3RlOgo+Pj4gTGUgMjUvMDkvMjAxOSAyMzo1MCwgQW5kcmV3IE1v
cnRvbiBhIMOpY3JpdMKgOgo+Pj4+IE9uIFR1ZSwgMjMgSnVsIDIwMTkgMDY6NTE6MzYgLTA3MDAg
Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGU6Cj4+Pj4KPj4KPj4gUGxlYXNlIGRv
bid0LiBBdCBsZWFzdCBub3QgZm9yIHRoZSBjYXNlcyB3aGVyZSB0aGUgc291cmNlIGlzIGEgc3Ry
aW5nCj4+IGxpdGVyYWwgLSB0aGF0IGp1c3QgZ2l2ZXMgd29yc2UgY29kZSBnZW5lcmF0aW9uIChi
ZWNhdXNlIGdjYyBkb2Vzbid0Cj4+IGtub3cgYW55dGhpbmcgYWJvdXQgc3Ryc2NweSBvciBzdHJs
Y3B5KSwgYW5kIHdoaWxlIGEgcnVuLXRpbWUgKHNpbGVudCkKPj4gdHJ1bmNhdGlvbiBpcyBiZXR0
ZXIgdGhhbiBhIHJ1bi10aW1lIGJ1ZmZlciBvdmVyZmxvdywgd291bGRuJ3QgaXQgYmUKPj4gZXZl
biBiZXR0ZXIgd2l0aCBhIGJ1aWxkIHRpbWUgZXJyb3I/Cj4gCj4gWWVzLCB0aGF0IHdhcyB0aGUg
cGxhbiBvbmNlIEpvZSdzIHBhdGNoIGdldHMgbWVyZ2VkIChpZiBpdCBkb2VzKSwgYW5kIG15Cj4g
cGF0Y2ggd2FzIG9ubHkgYW4gZXhhbXBsZSBvZiB1c2luZyBzdHJhY3B5LCBhcyBhIHN0ZXAgb24g
dGhlIHJvYWQuIEkgd2FzCj4gaW50ZW5kaW5nIHRvIGZvbGxvdyB1cCB3aXRoIGEgcGF0Y2ggY29u
dmVydGluZyBzdHJhY3B5IHRvIHNvbWV0aGluZyBsaWtlCj4gaHR0cHM6Ly93d3cub3BlbndhbGwu
Y29tL2xpc3RzL2tlcm5lbC1oYXJkZW5pbmcvMjAxOS8wNy8wNi8xNAo+IAo+IF9fRk9SVElGWV9J
TkxJTkUgc3NpemVfdCBzdHJzY3B5KGNoYXIgKmRlc3QsIGNvbnN0IGNoYXIgKnNyYywgc2l6ZV90
IGNvdW50KQo+IHsKPiDCoMKgwqDCoHNpemVfdCBkZXN0X3NpemUgPSBfX2J1aWx0aW5fb2JqZWN0
X3NpemUoZGVzdCwgMCk7Cj4gwqDCoMKgwqBzaXplX3Qgc3JjX3NpemUgPSBfX2J1aWx0aW5fb2Jq
ZWN0X3NpemUoc3JjLCAwKTsKPiDCoMKgwqDCoGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChjb3Vu
dCkgJiYKPiDCoMKgwqDCoMKgwqDCoCBfX2J1aWx0aW5fY29uc3RhbnRfcChzcmNfc2l6ZSkgJiYK
PiDCoMKgwqDCoMKgwqDCoCBfX2J1aWx0aW5fY29uc3RhbnRfcChkZXN0X3NpemUpICYmCgpFaD8g
SXNuJ3QgdGhlIG91dHB1dCBvZiBfX2J1aWx0aW5fb2JqZWN0X3NpemUoKSBieSBkZWZpbml0aW9u
IGEKY29tcGlsZS10aW1lIGNvbnN0YW50IC0gd2hhdGV2ZXIgdGhlIGNvbXBpbGVyIGhhcHBlbnMg
dG8ga25vdyBhYm91dCB0aGUKb2JqZWN0IHNpemUgKG9yIGEgc2VudGluZWwgMCBvciAtMSBkZXBl
bmRpbmcgb24gdGhlIHR5cGUgYXJndW1lbnQpPwoKPiAKPiAjZGVmaW5lIHN0cmFjcHkoZGVzdCwg
c3JjKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ICh7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqBzaXplX3QgY291bnQgPSBBUlJBWV9TSVpFKGRlc3Qp
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqBzaXplX3QgZGVzdF9z
aXplID0gX19idWlsdGluX29iamVjdF9zaXplKGRlc3QsIDApO8KgwqDCoMKgwqDCoMKgIFwKPiDC
oMKgwqDCoHNpemVfdCBzcmNfc2l6ZSA9IF9fYnVpbHRpbl9vYmplY3Rfc2l6ZShzcmMsIDApO8Kg
wqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoEJVSUxEX0JVR19PTighKF9fc2FtZV90eXBlKGRlc3Qs
IGNoYXJbXSkgfHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9fc2FtZV90eXBlKGRlc3QsIHVuc2lnbmVkIGNoYXJbXSkgfHzCoMKgwqDCoMKg
wqDCoCBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3NhbWVfdHlwZShkZXN0LCBz
aWduZWQgY2hhcltdKSkpO8KgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKg
wqDCoChfX2J1aWx0aW5fY29uc3RhbnRfcChjb3VudCkgJibCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqAgX19idWlsdGluX2NvbnN0YW50X3Aoc3JjX3Np
emUpICYmwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoCBfX2J1aWx0
aW5fY29uc3RhbnRfcChkZXN0X3NpemUpICYmwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiDCoMKgwqDCoCBzcmNfc2l6ZSA8PSBjb3VudCAmJsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgIHNyY19zaXplIDw9IGRlc3Rfc2l6
ZSAmJsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoCBz
cmNbc3JjX3NpemUgLSAxXSA9PSAnXDAnKSA/wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+IMKgwqDCoMKgwqDCoMKgICgoKHNpemVfdCkgc3RyY3B5KGRlc3QsIHNyYykp
ICYgMCkgKyBzcmNfc2l6ZSAtIDHCoMKgwqAgXAo+IMKgwqDCoMKgOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDC
oMKgwqDCoCBzdHJzY3B5KGRlc3QsIHNyYywgY291bnQpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gfSkKPiAKPiBhbmQgYm90aCBvZiB0aGVzZSBnZXQgb3B0aW1pc2VkIHRvIG1v
dnMgd2hlbiBjb3B5aW5nIGEgY29uc3RhbnQgc3RyaW5nCj4gd2hpY2ggZml0cyBpbiB0aGUgdGFy
Z2V0LgoKQnV0IGRvZXMgaXQgY2F0Y2ggdGhlIGNhc2Ugb2Ygb3ZlcmZsb3dpbmcgYSBjaGFyW10g
bWVtYmVyIGluIGEgc3RydWN0CnBhc3NlZCBieSByZWZlcmVuY2UgYXQgYnVpbGQgdGltZT8gSSdt
IHN1cnByaXNlZCB0aGF0Cl9fYnVpbHRpbl9vYmplY3Rfc2l6ZShkZXN0LCAwKSBzZWVtcyB0byBi
ZSAoc2l6ZV90KS0xLCB3aGVuIGRlc3QgaXMKcy0+bmFtZSAod2l0aCBzdHJ1Y3QgcyB7IGNoYXIg
bmFtZVs0XTsgfTspLiBTbyBJJ20gbm90IHZlcnkgY29uZmlkZW50CnRoYXQgYW55IG9mIHRoZSBm
YW5jeSBmb3J0aWZ5IGxvZ2ljIGFjdHVhbGx5IHdvcmtzIGhlcmUgLSB3ZSBfcmVhbGx5XwpzaG91
bGQgaGF2ZSBzb21lIEtidWlsZCBpbmZyYXN0cnVjdHVyZSBmb3Igc2F5aW5nICJ0aGlzIC5jIGZp
bGUgc2hvdWxkCm5vdCBjb21waWxlIiBzbyB3ZSBjYW4gdGVzdCB0aGF0IHRoZSBmb3J0aWZpY2F0
aW9ucyBhY3R1YWxseSB3b3JrIGluIHRoZQpzaW1wbGUgYW5kIGNvbW1vbiBjYXNlcy4KCj4gSSB3
YXMgZ29pbmcgYXQgdGhpcyBmcm9tIHRoZSBhbmdsZSBvZiBpbXByb3ZpbmcgdGhlIGV4aXN0aW5n
IEFQSXMgYW5kCj4gdGhlaXIgcmVzdWx0aW5nIGNvZGUuCgpJJ20gbm90IGFnYWluc3Qgc3RyYWNw
eSgpIGFzIGEgd3JhcHBlciBmb3Igc3Ryc2NweSgpLCBidXQgd2Ugc2hvdWxkIG1ha2UKc3VyZSB0
aGF0IHdoZW5ldmVyIHdlIGNhbiBmYWlsIGF0IGJ1aWxkIHRpbWUgKGkuZS4sIGJvdGggc291cmNl
IGFuZCBkc3QKbGVuZ3RocyBrbm93biksIHdlIGRvIC0gYW5kIGluIHRoYXQgY2FzZSBhbHNvIGxl
dCB0aGUgY29tcGlsZXIgb3B0aW1pemUKdGhlIGNvcHkgKG5vdCBvbmx5IHRvIGRvIHRoZSBpbW1l
ZGlhdGUgbW92cywgYnV0IHRoYXQgYWxzbyBnaXZlcyBpdAp3aWRlciBvcHBvcnR1bml0eSB0byBy
ZW1vdmUgaXQgY29tcGxldGVseSBhcyBkZWFkIHN0b3JlcyBpZiB0aGUKc3Vycm91bmRpbmcgY29k
ZSBlbmRzIHVwIGRlYWQgLSB3aXRoIGEgY2FsbCB0byBzb21lIHN0cnNjcHkoKSwgZ2NjCmNhbm5v
dCBlbGltaW5hdGUgdGhhdCkuIElmIHN0cmFjcHkoKSBjYW4gYmUgbWFkZSBzdWZmaWNpZW50bHkg
bWFnaWMgdGhhdAppdCBmYWlscyBhdCBidWlsZCB0aW1lIGZvciB0aGUgc3RyaW5nIGxpdGVyYWwg
Y2FzZXMsIGZpbmUsIGxldCdzIG5vdCBhZGQKeWV0IGFub3RoZXIgQVBJLiBPdGhlcndpc2UsIEkg
dGhpbmsgdGhlIHN0YXRpY19zdHJjcHkoKSBpcyBhIG11Y2ggbW9yZQpyZWFkYWJsZSBhbmQgcmVs
aWFibGUgQVBJIGZvciB0aG9zZSBjYXNlcy4KCklmIEknbSByZWFkaW5nIHlvdXIgc3RyYWNweSgp
IG1hY3JvIGNvcnJlY3RseSwgeW91J3JlIGV4cGxpY2l0bHkKcmVxdWVzdGluZyBhIHJ1bi10aW1l
IHRydW5jYXRpb24gKHRoZSBzcmNfc2l6ZSA8PSBkZXN0X3NpemUgY2hlY2sKY2F1c2luZyBhcyB0
byBmYWxsIGJhY2sgdG8gc3Ryc2NweSkgcmF0aGVyIHRoYW4gZmFpbGluZyBhdCBidWlsZCB0aW1l
LgoKUmFzbXVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
