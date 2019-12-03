Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1033A110661
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 22:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C611675;
	Tue,  3 Dec 2019 22:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C611675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575407817;
	bh=ByYw5Y9moSQFUMlHrVZs3ggNQyLahTNlO078Ll1Vqew=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuDBgcWFiMuGgWhVxR80bl58aT/rbG+UBSUzIUJd5OSla4yHJIbH/V/Yxj5eZFjJ3
	 KQpjRtnfYj7lvSmxTcXAuMlmfNNvRx23lNHShl0ayXBirFLk6bAkgbGzvi4xNozXJa
	 ZmIU61ovm3ZYqRy1EJvfxtJtQ7c3vZLiq8N4VYw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B0FBF80228;
	Tue,  3 Dec 2019 22:15:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A48CF80228; Tue,  3 Dec 2019 22:15:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 923F7F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 22:15:04 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 97AE9A0046;
 Tue,  3 Dec 2019 22:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 97AE9A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1575407704; bh=QHsW2oKJ+x1HJCl6rtx2qn2kojgbzFkD6YvBwOgDWPg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=izHLwYwBlqd+qZE8sF170XV5lrVNHU1YMb+iGJh/f5HGfgdDV/jBMPMDLn9o0eLjo
 ow/agszxeZwxVrhGFFrli4JMF4u55n+jnayweEBWHsZLusMlBEg7J4fqqMNcJSq0G/
 Z/as7QsJC49dci7KbWAmMlBPvB5wKBPzkQ+pbLuY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Dec 2019 22:14:59 +0100 (CET)
To: Curtis Malainey <cujomalainey@google.com>, =?UTF-8?Q?Mads_L=c3=b8nsethag?=
 =?UTF-8?Q?en?= <mads@ab3.no>
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
 <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
 <CAOReqxj3P4Kvf5YwTXoEzHd9hURBOP4ySEjURsO7LjK+vbpQTw@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2f0297fa-4aab-b463-4652-208ee77b6cb8@perex.cz>
Date: Tue, 3 Dec 2019 22:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxj3P4Kvf5YwTXoEzHd9hURBOP4ySEjURsO7LjK+vbpQTw@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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

RG5lIDAzLiAxMi4gMTkgdiAyMTo0MyBDdXJ0aXMgTWFsYWluZXkgbmFwc2FsKGEpOgo+IE9uIFRo
dSwgTm92IDI4LCAyMDE5IGF0IDE6MTMgQU0gTWFkcyBMw7huc2V0aGFnZW4gPG1hZHNAYWIzLm5v
PiB3cm90ZToKPiAKPj4gT24gMjUuMTEuMjAxOSAyMDoyNSwgQ3VydGlzIE1hbGFpbmV5IHdyb3Rl
Ogo+Pj4gSGVsbG8gQUxTQSBEZXZzLAo+Pj4KPj4+IEkgYW0gbG9va2luZyB0byBnZXQgc29tZSBm
ZWVkYmFjay9pZGVhcyBvbiBhIHBvc3NpYmxlIGNoYW5nZSB0bwo+Pj4gaGVhZHNldCBidXR0b24g
bWFwcGluZy4gTG9jYWxseSB3ZSBhcmUgY2FycnlpbmcgcGF0Y2hlcyB0aGF0IGltcGxlbWVudAo+
Pj4gdGhlIG1hcHBpbmdzIGluIHRoZSBtYWNoaW5lIGRyaXZlciAod2hpY2ggd2UgdW5kZXJzdGFu
ZCB5b3UgZG8gbm90Cj4+PiB3YW50IHVwc3RyZWFtLikgV2UgYXJlIGxvb2tpbmcgdG8gc2VlIGlm
IHdlIGNhbiBhZGQgYSBuZXcgQVBJCj4+PiAoc29tZXRoaW5nIGxpa2UgYSBzeXNmcyBwYXRoIHBv
dGVudGlhbGx5KSB0byBoYXZlIHVzZXJzcGFjZSBwYXNzIGluCj4+PiB0aGUgbWFwcGluZywgaWYg
aXQgY2hvb3NlcyB0bywgc28gdGhlIG1hcHBpbmcgY2FuIHN0aWxsIGJlIGRvbmUgaW4gdGhlCj4+
PiBrZXJuZWwuIFRoYXQgd2F5IHdlIGNhbiBjYXJyeSBqdXN0IHRoZSBjb25maWcgbG9jYWxseSBh
bmQgcmVtb3ZlIHNvbWUKPj4+IG9mIHRoZSBrZXJuZWwgcGF0Y2hlcyB3ZSBhcmUgY2Fycnlpbmcg
bG9jYWxseS4gVGhhbmtzLgo+Pj4KPj4+IEN1cnRpcwo+Pj4KPj4KPj4gSGkgTWFkcywKPiAKPiBB
cG9sb2dpZXMsIGFwcGFyZW50bHkgbXkgc3BhbSBmaWx0ZXIgZ3JhYmJlZCB5b3VyIGVtYWlsIGZy
b20gbWUgKGJhY2sgdG8KPiBhZGp1c3RpbmcgdGhlIHJ1bGVzLikKPiAKPj4gU29ycnkgZm9yIHRo
ZSB0b3AgcG9zdGluZyBpbiBteSBsYXN0IG1haWwuCj4+Cj4+IEkganVzdCB3b25kZXJlZCwgZG8g
dGhpcyBoYXZlIGFueXRoaW5nIHRvIGRvIHdpdGggaGVhZHBob25lcyB0aGF0IGhhcwo+PiBwaHlz
aWNhbCBidXR0b25zIG9uIHRoZSBoZWFkcGhvbmUgd2lyZSBpdHNlbGY/IEUuZyB0aGUgQm9zZSBR
QzI1IGlzIGEKPj4gcGFpciBvZiBoZWFkcGhvbmVzIHRoYXQgaGFzIGZvdXIgYnV0dG9ucyBvbiB0
aGUgd2lyZSwgYW5kIGFzIGZhciBhcyBJCj4+IGNhbiBzZWUgdGhlcmUncyBubyB3YXkgb2YgZ2V0
dGluZyB0aG9zZSBidXR0b25zIHRvIHdvcmsgaW4gdmFuaWxsYSBMaW51eAo+PiBmb3Igbm93LCBi
dXQgaXQgd29ya3MgaW4gQW5kcm9pZCBhbmQgV2luZG93cyAxMC4KPj4KPiAKPiBObyB0aGlzIGlz
IHJlbGF0ZWQgdG8gQ2hyb21lT1MgZGV2aWNlIGhlYWRzZXQgYnV0dG9uIG1hcHBpbmcsIGJ1dCBo
b3BlZnVsbHkKPiBhbmRyb2lkIHdpbGwgcGljayB0aGlzIHVwIGFzIHdlbGwuCj4gWWVzLCB0aGVz
ZSBidXR0b25zIGFyZSB0aGUgb25lcyBJIGFtIGRpc2N1c3NpbmcuIEN1cnJlbnRseSBpbiBDaHJv
bWVPUyAoYW5kCj4gbGlrZWx5IGluIEFuZHJvaWQgYXMgd2VsbCkgd2UgY2FycnkgcGF0Y2hlcyBz
dWNoIGFzCj4gaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9t
aXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvMTAzMzQ2NS8KPiBJdCBhcHBlYXJzIHNvbWUgaGF2
ZSBzdGFydGVkIGxhbmRpbmcKPiB1cHN0cmVhbSBhZTA5YTQ3ODNiOWNhZjkzMDdmMzAzZWYwMzlm
ODI5N2NlMDM3MWZlICgiQVNvQzogSW50ZWw6IEhlYWRzZXQKPiBidXR0b24gc3VwcG9ydCBpbiBr
YWJ5bGFrZSBtYWNoaW5lIGRyaXZlciIpIGJ1dCBpdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBoYWQK
PiBhIHdheSBmb3IgdXNlcnNwYWNlIHRvIGNvbmZpZ3VyZSB0aGVzZSBidXR0b25zIHNpbWlsYXIg
dG8gaG93IHdlIGhhbmRsZQo+IFVDTXMuCgpUaGUgcXVlc3Rpb24gd2h5IHlvdSBuZWVkIHRvIGNo
YW5nZSB0aGlzIHNldHRpbmdzIGluIHRoZSB1c2VyIHNwYWNlLiBJIHRoaW5rIAp0aGF0IHRoZSBk
ZXZpY2UgdHJlZSB3YXMgZGVzaWduZWQgZXhhY3RseSB0byBkZXNjcmliZSB0aGlzIGh3IHBsYXRm
b3JtIApzcGVjaWZpYyBzZXR0aW5ncy4gQW5vdGhlciBwb3NzaWJpbGl0eSBpcyB0byB1c2UgdGhl
IGtlcm5lbCBtb2R1bGUgb3B0aW9uIHRvIApjb25maWd1cmUgdGhlIHNldHRpbmdzIGZyb20gdGhl
IHVzZXIgc3BhY2UuIEJ1dCBpdCdzIGp1c3QgYW4gaWRlYS4gWW91IGFyZSAKcHJvYmFibHkgbG9v
a2luZyBmb3IgYW4gaW50ZXJmYWNlIHdoaWNoIGNhbiBiZSB1c2VkIHdoZW4gdGhlIGRyaXZlciBp
cyBydW5uaW5nLgoKCQkJCQlKYXJvc2xhdgoKLS0gCkphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVy
ZXguY3o+CkxpbnV4IFNvdW5kIE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5j
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
