Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64496155F2E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 21:17:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B994016BD;
	Fri,  7 Feb 2020 21:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B994016BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581106655;
	bh=uREwwcPEB6ZFX+jiFiR74K+0x96NxUqHgSF7lrQUnIE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecL60dB7hBaAuivbTmqE+0IM7F6dExrgnd2yLcBx7N73hDQbnY6B2+WW/f1oT3H+k
	 Ouh06RMqWce1071i/OVpwbmargfkySh7z0NH9k5gpDb76DVbGk9qd+or3IBun6j2yC
	 OYBXRaV3pTmbailZMzih86S7ALiqtx3bCSDshVL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE359F80148;
	Fri,  7 Feb 2020 21:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 895EEF8014C; Fri,  7 Feb 2020 21:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from sonic302-21.consmr.mail.ir2.yahoo.com
 (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322E6F800B2
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 21:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322E6F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="guDq+ZpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1581106548; bh=/XRyJW7bxyfEwQv+jc1o4VH8Wxerv+PDVD3n5++B0hw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=guDq+ZpVxiPPEFEI/MY1kiAgK3GaG7nOh+SiOqSYqKmwfGBOI0yoUnEbmvvJRhajb8N4KD7z1FCEzAWOGYlQTkQaHj6wo0fVkTykwNvCiWWPodKJwP0J72kEuNWEb21PReS2uw2jMBVvBpsswiBznyEGrfELHTkD941+9CK+vHBB1NoG/3yITGUhInN2Dl2Hwo0EctDi11x0lZ1bkJX8ixOilz27PanqLywEWrF+Z+8KcYUyilJToGG7UW/Wf43al6dvcScNsBoQSBSa56rtRuHqylmjlDsA9UC+GJguz/GumAiVM3EHqL74xQeyolqw0r6awnEac1Vax+C/qQp/mA==
X-YMail-OSG: 793w7nUVM1n7JCYoCdiL3l2XNRF9qyfeF5.Tc0mMnI6AIVJ8I8siwaVRnp9_VnS
 2Qmrk9oF4PchoNFrbzps5MlaFO69C_7lTcqQRkaMZ4iC18vop1ii_chanDw8fBSgZryEtbbtzank
 zNRuSikYj1w1l4QzobrlVZznAdI0OYO2S4hHZbG_4ra6U7KL_8BPhVGeIEJaYgZ60E2ueL5cxRsj
 Eyv3dts0iyfyU5Rixop9SflwO6U1yKY4BTOqdW1SuVHrkmGWxtj3JXhaEVWuuIWsZtBr5T.dqeW7
 aJA0iuVxThbyiSsWU1KOrMj_3bLK09FeF0H02l0v.m0CdiDmuB3UuoF4vK43LNqrYQZf13vaMO3v
 75kFfDT9nowH7ddBL6ZtlOGRgJWILVOEckqmwtkhye2gmODb8KwSC8ZL_DjBpQrFGh5bQNXeAIwd
 m5Bmg_eTitYFz1gm0.ysnlwJbhHpuMidCznUy.4I4WIn2TjAu3M1tpG1kVzX0eUwNChMUBDw7Cuv
 NjCUwuzoix9hj13XELhE0Fa00LOUQiLtMkED7WkC4fcFA0C5sumBIrAjOW3S0ffDhUoQsa2Gtcrw
 YyohBDbaojoR8Z_f4fJF_EcWOHxCrcO0pbc5eYD05bpeKI7Mgr8iCkDtNWMkrPWVXK_vezjQlclH
 mbE1xmd8ygozrTWNh5FMqM6.apNJKa7esfSAm.lL8vzCHEoMAU.w93r8ymTs52icjZy_SX_JyAJv
 5EFKKWEDwzLxxajOawzMDb2esBnx_mvWjLckYr0vVTzTEpsCVStEDNtmcpMD3_SRcJ_KbncXhcDc
 1LqYvCXvh9Q1G9TlDDd4sK5V.lhvbwIL.YVvfG85HPmy3nurZEAsY8qoWrGsKVLRerquqKNO6D_y
 l1Zhh4yj6Hqjlog9o4MSoESwiEnycRXBFQAPC03VFWU5ytGDBvG5aBK9JQzPDXbu9pgiuAiA9BqT
 LJo3wlcn9_XwAsHIDNcUWocZSSmMk7XXIt3Cc90yeUSMnEm3V_rEXZoHLFmGmHpy9UenlyvjgEt2
 xmegtMS1JrfmgN2_VjhoOLezJTKfcdOk_gb.1lK9LKhtao0CwA_jlD1o1n1_bchcn3u40YeibfnC
 g4t4o6wcPnxmEBERHcNgO4TP3lz8KnrCDjKupIgljd5ri9Haj1VfEDFvEkFGz6kI5DL4Bt8E2XYi
 gjLwYDL.mQai.xXaZKVfjvz8aCSANJGR7Dj9lf.NhZfyeBwLGCrIDzEA_ab_4vyPwlsDNdT.7C.S
 wcETN47KXKT4N_aMQUACxeUoOHOY0xuje3M2bL95qC4GEzAY7t38PQc0iENUQhQy14fgu80a.4gS
 L.TkD19yYnLaoLt26cka9uVR9aCq6wnO7YTeCy5INo0ZtQhPO0UqyJRq.bBxR3qLtQewDjXa4u1G
 K077kXD1MRkLMV0biuQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Fri, 7 Feb 2020 20:15:48 +0000
Received: by smtp407.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 94f5be95fb90701648cd85ab95a5334c; 
 Fri, 07 Feb 2020 20:15:46 +0000 (UTC)
To: Alexander Tsoy <alexander@tsoy.me>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
 <1697977016.25666627.1579681629054@mail.yahoo.com>
 <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
 <6cb1135be692d460256de2cf65b0a023eea1295e.camel@tsoy.me>
 <05edff76-729f-0ffa-9a2b-908fa42c24d8@yahoo.de>
 <84ddb2438f13cc8c4a08aaffbca9faaec679c067.camel@tsoy.me>
 <s5htv42vmmt.wl-tiwai@suse.de>
 <73ec40e6-3b76-0bc3-8bd2-6146e0499fdc@yahoo.de>
 <154d6930f2b816819650f69fa86bf71b59c65251.camel@tsoy.me>
 <22fd2407-4935-1eb6-c59c-95a9b6d324d0@yahoo.de>
 <b4712d597701376f35018d7a410179a3c88ba939.camel@tsoy.me>
From: Tobias <toszlanyi@yahoo.de>
Message-ID: <0f942c46-b269-47f5-9fd7-598c61d05814@yahoo.de>
Date: Fri, 7 Feb 2020 21:15:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b4712d597701376f35018d7a410179a3c88ba939.camel@tsoy.me>
Content-Language: en-US
X-Mailer: WebService/1.1.15185 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
 controller
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

QWxleGFuZGVyIC0gaGVyZSBjb21lcyB0aGUgZG1lc2cgb3V0cHV0IHlvdSBhcmUgbG9va2luZyBm
b3I6CgogwqDCoCAzNS4xNzU4NTVdIHVzYiAxLTI6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2Ug
bnVtYmVyIDYgdXNpbmcgeGhjaV9oY2QKW8KgwqAgMzUuMTk2NjQ3XSB1c2IgMS0yOiBOZXcgVVNC
IGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MTVlNCwgCmlkUHJvZHVjdD04MDA0LCBiY2REZXZpY2U9
MTEuMTAKW8KgwqAgMzUuMTk2NjQ5XSB1c2IgMS0yOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBN
ZnI9MSwgUHJvZHVjdD0yLCAKU2VyaWFsTnVtYmVyPTMKW8KgwqAgMzUuMTk2NjUwXSB1c2IgMS0y
OiBQcm9kdWN0OiBERU5PTiBESiBNQzcwMDAKW8KgwqAgMzUuMTk2NjUwXSB1c2IgMS0yOiBNYW51
ZmFjdHVyZXI6IERFTk9OIERKClvCoMKgIDM1LjE5NjY1MV0gdXNiIDEtMjogU2VyaWFsTnVtYmVy
OiAyMDE2MDMKW8KgwqAgMzUuMTk4MjkxXSB1c2IgMS0yOiB1YWNfY2xvY2tfc291cmNlX2lzX3Zh
bGlkKCk6IGVycjogMSA7IGRhdGE6IDAKW8KgwqAgMzUuMTk4MjkyXSB1c2IgMS0yOiBjbG9jayBz
b3VyY2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlClvCoMKgIDM1LjE5ODM3MF0gdXNiIDEt
MjogdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZCgpOiBlcnI6IDEgOyBkYXRhOiAwClvCoMKgIDM1
LjE5OTA1Ml0gdXNiIDEtMjogdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZCgpOiBlcnI6IDEgOyBk
YXRhOiAwClvCoMKgIDM1LjE5OTA1M10gdXNiIDEtMjogY2xvY2sgc291cmNlIDY1IGlzIG5vdCB2
YWxpZCwgY2Fubm90IHVzZQpbwqDCoCAzNS4xOTkxMzJdIHVzYiAxLTI6IHVhY19jbG9ja19zb3Vy
Y2VfaXNfdmFsaWQoKTogZXJyOiAxIDsgZGF0YTogMAouLi4KLi4uCnJlcGVhdGVkIHNldmVyYWwg
MTAwIHRpbWVzLgoKSG9wZSB0aGlzIGlzIHVzZWZ1bCBkYXRhIGZvciB5b3UuCgpDaGVlcnMhClRv
YmlhcwoKCkFtIDA3LjAyLjIwIHVtIDIwOjExIHNjaHJpZWIgQWxleGFuZGVyIFRzb3k6Cj4g0JIg
0J/RgiwgMDcvMDIvMjAyMCDQsiAxOTo0OSArMDEwMCwgVG9iaWFzINC/0LjRiNC10YI6Cj4+IERl
YXIgQWxleGFuZGVyIC0gdW5mb3J0dW5hdGVseSB0aGUgcGF0Y2ggZG9lc24ndCB3YW50IHRvIGJl
IGFwcGxpZWQuCj4gSXQgc2VlbXMgSSBjb3BpZWQgaXQgZnJvbSBsZXNzIHdpdGggZGlmZmVyZW50
IHRhYiB3aWR0aC4gVGhlIHBhdGNoCj4gYmVsb3cgc2hvdWxkIGJlIE9LLgo+Cj4+ICQgcGF0Y2gg
LXAxIDwgLi4vZGVub24tNC5wYXRjaAo+PiBwYXRjaGluZyBmaWxlIHNvdW5kL3VzYi9jbG9jay5j
Cj4+IEh1bmsgIzEgRkFJTEVEIGF0IDE4Ny4KPj4gMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBz
YXZpbmcgcmVqZWN0cyB0byBmaWxlCj4+IHNvdW5kL3VzYi9jbG9jay5jLnJlago+Pgo+PiBJIGd1
ZXNzIGl0IHdhcyBub3QgeW91ciBpbnRlbnRpb24gb25seSBhZGRpbmcgb25lIGxpbmUgdG8KPj4g
L3NvdW5kL3VzYi9jbG9jay5jLiBzbyB3aGF0IGFtIEkgbWlzc2luZyBoZXJlPwo+IE5vLCBpdCB3
YXMgaW50ZW50aW9uYWwuIFRoaXMgcGF0Y2gganVzdCBhZGRzIHByaW50aW5nIG9mIHNvbWUgaW5m
byBJCj4gbmVlZCBpbiB0aGUgZm9sbG93aW5nIGZvcm1hdDoKPgo+IHVhY19jbG9ja19zb3VyY2Vf
aXNfdmFsaWQoKTogZXJyOiBYIDsgZGF0YTogWAo+Cj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNi
L2Nsb2NrLmMgYi9zb3VuZC91c2IvY2xvY2suYwo+IGluZGV4IDAxOGIxZWNiNTQwNC4uNjVlZTVj
MjRjNWQxIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3VzYi9jbG9jay5jCj4gKysrIGIvc291bmQvdXNi
L2Nsb2NrLmMKPiBAQCAtMTg3LDYgKzE4Nyw4IEBAIHN0YXRpYyBib29sIHVhY19jbG9ja19zb3Vy
Y2VfaXNfdmFsaWQoc3RydWN0IHNuZF91c2JfYXVkaW8gKmNoaXAsCj4gICAJCQkgICAgICBzbmRf
dXNiX2N0cmxfaW50ZihjaGlwKSB8IChzb3VyY2VfaWQgPDwgOCksCj4gICAJCQkgICAgICAmZGF0
YSwgc2l6ZW9mKGRhdGEpKTsKPiAgIAo+ICsJZGV2X2luZm8oJmRldi0+ZGV2LCAiJXMoKTogZXJy
OiAlZCA7IGRhdGE6ICVkXG4iLCBfX2Z1bmNfXywgZXJyLCBkYXRhKTsKPiArCj4gICAJaWYgKGVy
ciA8IDApIHsKPiAgIAkJZGV2X3dhcm4oJmRldi0+ZGV2LAo+ICAgCQkJICIlcygpOiBjYW5ub3Qg
Z2V0IGNsb2NrIHZhbGlkaXR5IGZvciBpZCAlZFxuIiwKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
