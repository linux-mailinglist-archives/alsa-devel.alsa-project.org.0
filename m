Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D113C5A8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 15:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1FFB17AF;
	Wed, 15 Jan 2020 15:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1FFB17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579097811;
	bh=SVVDwFn4gVqtGqjILOICHmsRnxz9VlkFAfCNuxpmuUU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWJELIlZHM0Leg2EeD69aU7qV1WfhSymsj644Y3YgKEzgPMWjBdb0CZmaYmnZs0nc
	 vlKV2KhmjQ96HH62uhSN88A4NY/6QlGMRweX9crKrnrKZDNSUBGKvndEYoqzvcLy6O
	 UlN0zPuZ+l+x0xuLXCNIaBF2sjoe4QcS0Z+pMXE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D2DCF8014B;
	Wed, 15 Jan 2020 15:15:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A71A9F801EB; Wed, 15 Jan 2020 15:15:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E06DF800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 15:14:58 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9EED6A0040;
 Wed, 15 Jan 2020 15:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9EED6A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1579097697; bh=Z6ZddNF8ebt7qH7i7Uos4iG6kI651L+g+C/dCGB/r4w=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=DExYLSFjkCvyhMNazNm+Y8gomzgsBw2G7+EjrFfw73EtzS4uWwOykn5JdQURITvL/
 9LsP9B34JUOl+DPOxj3+eH0wDCpPMY3k/x8p6OwECps11PA1KMfWojTslJi3ex2RNY
 zRPRTZ14txjo4/l9fUf5ygsJBcgJOjSuHOEqK8v8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 15 Jan 2020 15:14:55 +0100 (CET)
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
References: <7ae52bb6-1af4-897f-7de1-34196d0ed1f0@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1b9a57ab-b3e1-c811-241a-3e149f92d7dd@perex.cz>
Date: Wed, 15 Jan 2020 15:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <7ae52bb6-1af4-897f-7de1-34196d0ed1f0@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] arecord: buffer-size dependency on period-size and
 other params
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RG5lIDE1LiAwMS4gMjAgdiAxNDo0NyBSYWp3YSwgTWFyY2luIG5hcHNhbChhKToKPiBIZWxsbywK
PiAKPiBJIGhhdmUgc3BvdHRlZCBzdHJhbmdlIGJlaGF2aW9yIG9mIGFsc2EtbGliIHdoZW4gSSB0
cnkgdG8gc2V0Cj4gYnVmZmVyLXNpemUgaW4gYXJlY29yZC4gSXQgbG9va3MgbGlrZSB0aGUgc2l6
ZSBvZiB0aGUgYnVmZmVyIGlzIHZlcnkKPiBkZXBlbmRlbnQgb24gb3RoZXIgcGFyYW1ldGVycyBs
aWtlIHBlcmlvZC1zaXplIGFuZCByYXRlIGZvciBleGFtcGxlLiBBdAo+IGZpcnN0IGl0IHNvdW5k
cyBsaWtlIG5vcm1hbCBiZWhhdmlvdXIsIGFmdGVyIGFsbCBidWZmZXIgc2l6ZSBzbWFsbGVyCj4g
dGhhbiBwZXJpb2Qgc2l6ZSBkb2VzbuKAmXQgbWFrZSBtdWNoIHNlbnNlLiBIb3dldmVyIHdoYXQg
aWYgd2UgZ28gaW4gdGhlCj4gcmV2ZXJzZSBkaXJlY3Rpb24gYW5kIHNldCBidWZmZXItc2l6ZSBt
dWNoIGxhcmdlciB0aGFuIHBlcmlvZCBzaXplPyBUaGVuCj4gSSBzZWUgbm8gcmVhc29uIHRvIGZv
cmJpZCBzdWNoIHJlcXVlc3QgKGF0IGxlYXN0IG9uIHRoZSB1c2VyIHNwYWNlCj4gbGV2ZWwpLiBT
byB0byBiZSBzcGVjaWZpYyBJIGlzc3VlIHN1Y2ggY29tbWFuZDogYXJlY29kIC1EcGx1Z2h3OjAs
OCAtcgo+IDE2MDAwIC1jIDIgLWYgUzI0X0xFIC0tYnVmZmVyX3NpemUgMTI4MDAwMCB0bXAud2F2
IC12dnYuIFRoZSBhcmVjb3JkCj4gcmVzcG9uc2UgZm9yIHRoaXMgaXMgYnVmZmVyIHNpemUgb2Yg
MzE5OTIgZnJhbWVzLCAyNTU5MzYgYnl0ZXMuIE5vdyBsZXQKPiBtZSBhbHNvIHRlbGwgdGhlIGJ1
ZmZlciBzaXplIG9mIDEyODAwMDAgYnl0ZXMgaXMgdGhlIG1heGltdW0gYnVmZmVyIHNpemUKPiBv
dXIgZHJpdmVyIGFsbG93cywgbGlrZXdpc2UgbWF4IHBlcmlvZCBpcyAyNjg4MDAgYnl0ZXMuIE5v
dyBpZiBpbnNpZGUKPiBvdXIgZHJpdmVyIEkgZG91YmxlIG1heCBwZXJpb2Qgc2l6ZSBsaW1pdCBJ
IGdldCBidWZmZXIgc2l6ZSBhY2NvcmRpbmdseQo+IGJpZ2dlci4gU2ltaWxhcmx5LCBpZiBJIGNo
YW5nZSB0aGUgZm9ybWF0IGluIHRoZSBjb21tYW5kIGxpbmUgcmVxdWVzdAo+IGZyb20gUzI0X0xF
IHRvIGkuZSBTMTZfTEUgdGhlbiBhZ2FpbiBJIHdpbGwgZ2V0IGJ1ZmZlciBzaXplIGNsb3NlciB0
byBteQo+IHJlcXVlc3QgKGJpZ2dlcikuIFNvIGJlbG93IGFyZSBteSBxdWVzdGlvbnM6Cj4gCj4g
ICAxLiBXaHkgYWxzYS1saWIgYmVoYXZlcyBpbiBhIHdheSBJIGRlc2NyaWJlZCBhYm92ZT8gV2h5
IEkgY2FuIG5vdAo+ICAgICAgY29udHJvbCBidWZmZXIgc2l6ZSBpbmRlcGVuZGVudGx5IGZyb20g
b3RoZXIgcGFyYW1ldGVycyAocHJvdmlkaW5nCj4gICAgICBpdCBoYXMgcGh5c2ljYWwgc2Vuc2Up
Lgo+ICAgMi4gSXQgbG9va3MgbGlrZSBhbHNhLWxpYiBmaXJzdCBjYWxjdWxhdGVzIGluaXRpYWwg
YnVmZmVyLXNpemUgYmFzZSBvbgo+ICAgICAgb3RoZXIgaW5wdXQgcGFyYW1zIGxpa2UgbWVudGlv
bmVkIHBlcmlvZCBzaXplIG9yIHNhbXBsaW5nIHJhdGUgYW5kCj4gICAgICB0aGVuIGFzayBkcml2
ZXIgdG8gcmVmaW5lIGl0IGFjY29yZGluZyB0byBpdHMgY2FwYWJpbGl0aWVzLiBJcyB0aGF0Cj4g
ICAgICB0aGUgY2FzZT8KClllcy4gSXQgYXBwZWFycyBsaWtlIGFuIGlzc3VlIGluIHRoZSByZWZp
bmUgbWVjaGFuaXNtLgoKPiAgIDMuIEkgYWxzbyB0cmllZCB0byBkdW1wIGh3IGNhcGFiaWxpdGll
cyBieSBhZGRpbmcg4oCTZHVtcC1ody1wYXJhbSBmbGFnCj4gICAgICB0byBteSBjb21tYW5kIGxp
bmUgcmVxdWVzdCBhbmQgaGVyZSB5ZXQgYW5vdGhlciBzdXJwcmlzZSDigJMgaW4gYSByb3cKPiAg
ICAgIGRlZGljYXRlZCBmb3IgYnVmZmVyIHNpemUgaXQgc2F5cyDigJxCVUZGRVJfU0laRSBbMTIg
NDI5NDk2NzI5NF3igJ0uCj4gICAgICBXaGVyZSBpcyB0aGlzIOKAnDQyOTQ5NjcyOTTigJ0gY29t
ZXMgZnJvbSwgYW5kIG9uIHdoYXQgYmFzaWNzIGlzIGl0Cj4gICAgICBjYWxjdWxhdGVkPyBJIHdv
dWxkIGV4cGVjdCBhdCB0aGUgYmFyZSBtaW5pbXVtIGl0IHNob3VsZCBhc2sgZHJpdmVyCj4gICAg
ICBidXQgaW4gdGhlIHNuZF9wY21faHdfcGFyYW1fZHVtcCgpIGZ1bmN0aW9uIEkgZG9u4oCZdCBz
ZWUgYW55Cj4gICAgICBjb21tdW5pY2F0aW9uIHdpdGggdGhlIGRyaXZlci4KClRoaXMgdmFsdWUg
bWF5IGJlIC0yIChvciAtRU5PRU5UKSAtIG5vIGlkZWEuIEl0IG1heSBhbHNvIGJlIGFuIG92ZXJm
bG93IHNvbWV3aGVyZS4KCkkgd291bGQgc3RhcnQgdG8gdXNlIG9ubHkgdGhlIGRpcmVjdCAnaHc6
WCcgZGV2aWNlIGZvciB0ZXN0cy4gSWYgaXQgd29ya3MsIHRoZSAKcHJvYmxlbSBpcyB3aXRoIHRo
ZSBwbHVnIHBsdWdpbiAoYXV0b21hdGljIGZvcm1hdCBjb252ZXJzaW9uIGluc2lkZSBhbHNhLWxp
YikuIApUaGVyZSBhcmUgc2V2ZXJhbCBkZWJ1ZyBkZWZpbmVzIGluIHNyYy9wY20vcGNtX3BhcmFt
cy5jIC4gWW91IG1heSB1c2UgCkxEX1BSRUxPQUQgdG8gZGVidWcgdGhpcyBwcm9ibGVtLgoKCQkJ
CQkJSmFyb3NsYXYKCi0tIApKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpMaW51eCBT
b3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
