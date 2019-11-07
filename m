Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D0F2CF3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 12:03:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903B71677;
	Thu,  7 Nov 2019 12:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903B71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573124595;
	bh=y5MhVUqKVLbkYIpJqDz8+gacAaI8ohbA7CMlG8wYObU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFBVFOEXJt6bjHhNwYEm30U5sHNPvOfF5lizLZHr6GH+XJa+KR6RN1UUgTxWDevRt
	 YJKu/kLuhMde5cGPMmRJTsseeBBHyou4Z5flzF1fhL35lPylHC8RLsvt/QXrZprv0D
	 9UF0t2P4wcU4TK8bs4ZitoHFxblapgYubFkv2o4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE10DF800F3;
	Thu,  7 Nov 2019 12:01:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB774F8049B; Thu,  7 Nov 2019 12:01:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74063F80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 12:01:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A6657A0042;
 Thu,  7 Nov 2019 12:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A6657A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573124485; bh=t+lUUgt5cYqhY9RLjMx4p1zgBJph/TtqrSuKcbV9PDY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xGrKwuQxbQ9GH3M87E3BC8hJ08yLDi7efqQrNH+dDLHYqNq3IhD5WuTye+VxKiUKZ
 qlDZm+V4nSnvnAGO9zh11dl3UvbEmh8X56OhujsRRp3pYABDYAlYgg+JisQIB89SlD
 kPyz6Kl1ax4DGJKdgxoamxXyaAS2fle65SwM7Ohw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  7 Nov 2019 12:01:20 +0100 (CET)
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <60c63704-44ce-d80b-ccbd-b23d748b009b@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c53c36a7-bb55-abca-0e4f-9574d8fe3660@perex.cz>
Date: Thu, 7 Nov 2019 12:01:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <60c63704-44ce-d80b-ccbd-b23d748b009b@intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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

RG5lIDA3LiAxMS4gMTkgdiAxMToxOCBDZXphcnkgUm9qZXdza2kgbmFwc2FsKGEpOgo+IE9uIDIw
MTktMTEtMDUgMjA6MzYsIEphcm9zbGF2IEt5c2VsYSB3cm90ZToKPj4gSGkgYWxsLAo+Pgo+PiAg
IMKgwqDCoMKgSSBtYWtlIHNvbWUgaW50ZXJuYWwgdWNtIGNvZGUgY2xlYW51cHMgaW4gYWxzYS1s
aWIgYW5kIGFkZGVkIHRocmVlCj4+IG1ham9yIGV4dGVuc2lvbnMgdG8gYWxsb3cgbW9yZSBjb21w
bGV4IGNvbmZpZ3VyYXRpb25zIHdoaWNoIHdlIHJlcXVpcmUKPj4gZm9yIHRoZSBTT0Yga2VybmVs
IGRyaXZlci4KPj4KPj4gICDCoMKgwqDCoFRoZSBmaXJzdCB0aGluZyBpcyB0aGUgYWRkZWQgc3Vi
c3RpdHV0aW9uIGZvciB0aGUgdmFsdWUgc3RyaW5nczoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29t
L2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvZjFlNjM3YjI4NWU4ZTA0ZTY3NjEyNDhhMDcw
ZjU4ZjNhOGZkZTZmYwo+Pgo+Pgo+PiAgIMKgwqDCoMKgVGhlIHNlY29uZCB0aGluZyBpcyB0aGUg
SWYgYmxvY2s6Cj4+Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1saWIv
Y29tbWl0Lzk4NTcxNWNlODE0OGRjN2VmNjJjOGUzZDhjZTVhMGMyYWM1MWY4ZGYKPj4KPj4KPj4g
ICDCoMKgwqDCoFRoZSB0aGlyZCB0aGluZyBpcyB0aGUgY2FyZCAvIGhhcmR3YXJlIGxpa2Ugc3Bl
Y2lmaWVyIHBhc3NlZCBhcyB0aGUKPj4gdWNtIG5hbWUgdG8gc25kX3VzZV9jYXNlX21ncl9vcGVu
KCkgdG8gc3VwcG9ydCBtdWx0aXBsZSBjYXJkIGluc3RhbmNlczoKPj4KPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvNjAxNjRmYzU4ODZjZGM2Y2E1NWVl
ZWQwYzJlM2Y3NTFhN2QyYjJjMAo+Pgo+Pgo+PiAgIMKgwqDCoMKgQWxsIHRob3NlIHBhdGNoZXMg
KHdpdGggb3RoZXIgY2xlYW51cHMpIGFyZSBpbiB0aGUgdWNtMiBicmFuY2ggb24KPj4gZ2l0aHVi
IGZvciBjb21tZW50czoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNh
LWxpYi9jb21taXRzL3VjbTIKPj4KPj4gICDCoMKgwqDCoFRoZSBwcm9wb3NlZCBTT0YgVUNNIGNv
bmZpZyBkaWZmIGlzIGhlcmU6Cj4+Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3Qv
YWxzYS11Y20tY29uZi9jb21taXQvNzIzYjZkYTg4MTcyMTQ4ODIyOTE1NGU5MjNlZDM2NDEzOTU1
YTA1MQo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYv
Y29tbWl0cy91Y20yCj4+Cj4+ICAgwqDCoMKgwqBJIGFkZGVkIGV2ZXJ5dGhpbmcgdG8ga2VlcCB0
aGUgaW50ZXJmYWNlIGJhY2t3YXJkIGNvbXBhdGlibGUsIHNvCj4+IHRoZSBjdXJyZW50IGFwcGxp
Y2F0aW9ucyBzaG91bGQgbm90IG9ic2VydmUgYW55IGRpZmZlcmVudCBiZWhhdmlvci4gVGhlCj4+
IGFwcGxpY2F0aW9ucyBsaWtlIHB1bHNlYXVkaW8gc2hvdWxkIHVzZSB0aGUgJ2h3OkNBUkRfSU5E
RVgnIHNwZWNpZmllcgo+PiBmb3IgdGhlIG9wZW4gY2FsbCBpbiB0aGUgZnV0dXJlIGFuZCBzbmRf
dXNlX2Nhc2VfcGFyc2VfY3RsX2VsZW1faWQoKQo+PiBoZWxwZXIgZm9yIHRoZSBlbGVtZW50IGNv
bnRyb2wgbmFtZXMuCj4+Cj4+ICAgwqDCoMKgwqBJZiB5b3UgaGF2ZSBhbm90aGVyIGlkZWFzIHRv
IGFkZHJlc3MgdGhvc2UgaXNzdWVzLCBwbGVhc2UsIGxldCBtZQo+PiBrbm93Lgo+Pgo+PiAgIMKg
wqDCoMKgQlRXLCBNYXJrOiBUaGUgU09GIFVDTSBjb25maWdzIHJlbGllcyBvbiB0aGUgZHJpdmVy
IG5hbWUgY2hhbmdlcywKPj4gc28gaXQgbWlnaHQgYmUgd29ydGggdG8gc2VuZCAiQVNvQzogaW50
ZWwgLSBmaXggdGhlIGNhcmQgbmFtZXMiIHBhdGNoIHRvCj4+IDUuNCB0byBtYWtlIHRoaW5ncyBz
dGFibGUgbW9yZSBxdWlja2x5Ogo+Pgo+PiAgIMKgwqDCoMKgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zb3VuZC5naXQvY29tbWl0Lz9oPWZv
ci01LjUmaWQ9ZDc0NWNjMWFiNjU5NDViMmQxN2VjOWM1NjUyZjM4Mjk5YzA1NDY0OQo+Pgo+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGFua3MsCj4+ICAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSmFyb3NsYXYKPj4KPiAKPiAKPiBUaGFua3MgZm9y
IHlvdXIgd29yaywgSmFyb3NsYXYuCj4gCj4gSG93ZXZlciwgSSBoYXZlIHNvbWUgY29uY2VybnMg
aGVyZS4gRmlyc3QsIGNvdWxkIHlvdSBlbGFib3JhdGUgb24gIndlCj4gcmVxdWlyZSBmb3IgdGhl
IFNPRiBrZXJuZWwgZHJpdmVyIj8KClBsZWFzZSwgbG9vayBoZXJlOgoKaHR0cHM6Ly9naXRodWIu
Y29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2NvbW1pdC9hODI1MzQ2NWFlZjJkZjQ5NGNj
ZDViMTEwMzQxMmIwMzE4YmU1ODJlI2RpZmYtYTJiYTM0YWVlMWE1NWMyZmQ2NjRkNzg2MjQ0Nzcx
NzNMMzcKClRoZSBIREEgZHJpdmVyIHNvbWV0aW1lcyBtYW5hZ2VzIGRpZmZlcmVudCBKYWNrQ29u
dHJvbCBuYW1lcyBkZXBlbmRpbmcgb24gdGhlIAp1c2VkIGNvZGVjIGFuZCBpdCB3b3VsZCBiZSB0
aGUgcmVhbCBtYWludGVuYW5jZSBtZXNzIHRvIHVzZSB0aGUgRE1JIGluZm8gKGxvbmcgCmNhcmQg
bmFtZSkgZm9yIGFsbCBwb3NzaWJsZSBjb25maWd1cmF0aW9ucy4KCkFsc28sIGlmIHlvdSBsb29r
IHRvIHRoZSBjdXJyZW50IGNvbmZpZ3MsIG1hbnkgZHVwbGljYXRpb25zIGNhbiBiZSByZW1vdmVk
IAp3aXRoIHRoZSBJZiBldmFsdWF0aW9ucy4KCj4gVGhlIHN1YnN0aXR1dGlvbnMgYW5kIG11bHRp
LWluc3RhbmNlIHN1cHBvcnQgaXMgcHJvYmFibHkgd2FybWx5IHdlbGNvbWVkCj4gYnkgbWFueSwg
YnV0ICJJZiIgYmxvY2tzIGFyZSB3aGF0IHdvcnJpZXMgbWUuIEVzcGVjaWFsbHkgdGhlIG5lc3Rl
ZAo+ICJJZnMiLiBBcyBUYWthc2hpIHBvaW50ZWQgYWxyZWFkeSBvdXQsIFVDTSAtIHdoaWNoIGlz
IGN1cnJlbnRseSBpcwo+IHZpZXdlZCBhcyBhIHNpbXBsZSBjb25maWd1cmF0aW9uIHN5bnRheCAt
IGlzIGJlY29taW5nIGEgbGFuZ3VhZ2Ugb24gaXRzCj4gb3duLiBJZiB3ZSBhcmUgdG8ga2VlcCBl
eHRlbmRpbmcgVUNNIG9uIGFuZCBvbiwgd2UgbWlnaHQgYXMgd2VsbCBzd2l0Y2gKPiB0byBKU09O
LyBYTUwvIFlBTUwgZW50aXJlbHkgaW5zdGVhZCBvZiBkZXZlbG9waW5nIG91ciBvd24gdGhpbmd5
LgoKVGhlIGNvbmZpZ3VyYXRpb24gc3ludGF4IGl0c2VsZiBpcyByZWFsbHkgY2xvc2UgdG8gSlNP
TiwgaXQncyBqdXN0IGFib3V0IHRoZSAKcnVuLXRpbWUgZXZhbHVhdGlvbiBvZiBzb21lIGJsb2Nr
cyBhdCB0aGUgbG9hZCB0aW1lLiBUaGUgZGlmZmVyZW50IHN0YXRpYyAKc3ludGF4IGZvcm1hdCBk
b2VzIG5vdCBoZWxwIHVzIHNvIG11Y2guCgo+ICJJZiIgYmxvY2sgY291bGQganVzdCBiZSB3aGF0
J3MgbmVlZGVkIHRvIG9wZW4gbmV3IHBhbmRvcmEgYm94LCBhbGxvd2luZwo+IGZvciB2ZXJ5IGNv
bXBsZXggYW5kIG5vIGxvbmdlciBlYXN5LXRvLXJlYWQgY29uZmlnIGZpbGVzLiBJbiBnZW5lcmFs
LCBpZgo+IG9uZSBpcyB0byBlbmxpc3QgYW4gIklmIiwgd2h5IG5vdCBkZWZpbmUgdHdvIFVDTXMg
aW5zdGVhZD8KCkZvciBIREEsIFVTQiBvciBhbmQgZHJpdmVycyB3aXRoIG1hbnkgaGFyZHdhcmUg
dmFyaWFudHMsIHRoZSBtYW5hZ2luZyBvZiAKdGhvdXNhbmRzIG9mIGZpbGVzIHdpbGwgYmUgdGhl
IHJlYWwgbmlnaHRtYXJlLiBBbHNvLCBhdCBzb21lIHBvaW50LCBJIHdvdWxkIApsaWtlIHRvIGNy
ZWF0ZSB0aGUgdXNlIGNhc2UgY29uZmlncyBmb3IgYWxsIGhhcmR3YXJlLCB0aHVzIHB1bHNlYXVk
aW8gb3IgYW55IApvdGhlciBzZXJ2ZXIgKG1heWJlIHBpcGV3aXJlIGluIHRoZSBmdXR1cmUpIGNh
biB1c2UgdGhlIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gCnRvIGFic3RyYWN0IGZ1bGx5IHRoZSBo
YXJkd2FyZSB3aXRob3V0IHRoZWlyIG93biBwcm9maWxlcyBvciBzby4uLiBUaGUgZ29hbCBpcyAK
dG8gaGF2ZSB0aGlzIGluIHRoZSBvbmUgcGxhY2UuCgo+IE1vcmVvdmVyLCBJIHNlZSB5b3UgbWVu
dGlvbmluZyB0aGUgY2FyZC1uYW1lIGRlcGVuZGVuY3kuIFRoaXMgc291bmRzCj4gcmF0aGVyIGlu
dmFzaXZlLiBTZXBhcmF0aW9uIG9mIGRpZmZlcmVudCBjb25maWctdmVyc2lvbnMgd291bGQgYmUg
cmVxdWlyZWQuCgpXaGF0IGRvIHlvdSBtZWFuIHdpdGggdGhpcz8KCgkJCQkJSmFyb3NsYXYKCj4g
Cj4gQ3phcmVrCj4gCgoKLS0gCkphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+CkxpbnV4
IFNvdW5kIE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5jLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
