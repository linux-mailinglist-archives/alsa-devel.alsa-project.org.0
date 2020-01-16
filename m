Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F6F13D975
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 13:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31B117CC;
	Thu, 16 Jan 2020 12:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31B117CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579176043;
	bh=nl1FoKnl72vSXC6VlHz45AsoRFY4aAiCgEwJisDe8rI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPYTFKP7tUxy3fhvPt3Ho7+mzkNg/k6L4Nk+qJi4Z8RP9xrLCbAlcuP2EneXVGtt2
	 Fl52nH1VNSOkZWU+easv1w+twQ38f+GhbIjNaM9NFjBXAQjZnzQzcDqkoFHZGFubH1
	 P2WsX0vfJbdPzC15B17z9XYvZHAScUaktbAZDXBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14559F80216;
	Thu, 16 Jan 2020 12:58:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BCEF8021E; Thu, 16 Jan 2020 12:58:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47CFAF8014D
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 12:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CFAF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="STPLeF4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1579175887; bh=zYDg71W3V5jZJZeAvTx3LGjzb3nEhbP5uujOVfxxwxs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=STPLeF4kta6DcsglR1IgI30Q6Q7/N4/T4lhSss8O5fOlcMJAxLlUQE/aU2wDg4OJd9GIXJLj2K68wZm8gUiUNxtHjDL3S/G6qVdWK++S61KNs8w/Y+5Xqi+twvD4+RDiCyc7ihH1whAK8I5XnPJgk3uvMb3tCRsp2HlqnZP31BCEfoWuGbatfNIu3eb9mUnNS8N8wWheZwEAmD05YFRtCnoQ0NrCIUo+ZCYR90qzpROoZoyVRqAZ17E23bk+tZ7Ml78f85004EDlo4Kkiqq8+z0KxvV4g9ys6lPGXUuYrbCcCe4m+DF8WmuiEMCi+yWnQxsDK7RtX0vJYCynpWqBwQ==
X-YMail-OSG: SJ94TsMVM1nrKpQz1G8B0niJLshoq5JSh3.2G5f0QOrgJux5B5GKTRn.1.2ivzo
 6yzzR5Z90pvoEEMGC8ViL6JUeI_aYmNXuE1dnbZk6XP5jsEFGCMP0Lq.k4BJ9HZPLQigv_fKNBJl
 LW2S2Z6X1AtxMGTT7nNXmfRvRc_4chZTStWI781zuXfpLd7d0e8k5iQ6j2D15GjWZ4Lo5vzlm7LJ
 RP7B0sHUnwHVUPdybzHQaWNpWnSX40FfB4.LmnPYclQ_mu.2NrjB2Z9BkKFwHATXBm1bAlO6mEbs
 PU0Vqtx1ycGhZUKHSspmBNF.FuN70aii4_YKr9fGiYdWgurOOzfEvqlcBFslnLMDfBA8Yi38u1wV
 bV6k.B56thhywJTvW.0e9PfoD9rLJnPODMQDJrOxIK4I0LODvTBLTjHUh3XSafBmk8cyH2JUniAr
 xSzBG2sY8mXk7MZ852ZnZvDfxCKr.RZJxjLYkCkd8t_g_ux7PpjXl5BjZPduDjI3KKJCH8h_2sqv
 iM1t8ombKGsUYAM888vLDyO2nXBdb2z.vJ2KsmrOJ2tICYI4jHvIkMsP8KV3qoeK1yGIHM5x_b4F
 pSCMhpRyuU.4yTkjRPZBC09X5AASXZegYbRmquqFAMOH9JnwbvRfMpm_9WiwP5LibUYfTxAvPILo
 .UvX9X00Dl9Ev3zJngOj8P7SC6Y.UGyNbPW1Cjs3FAIuzZShakNKzniNzEGNq14x.swptnXzrg2A
 jq0eh2hG5KhgDGPxRfrGJ6AxL5DZExdwE_G7AEbp7wLc6YzcyDi4qzdxExP2FeBIMr9BYHGnRIZP
 pqdDdTVIFK2Voi55hO4MREZKXj646nI93RghHX8P6mqHneHAEtklTbSKIxBR8nygvBMMcYpfJoa3
 Thw73fbO1TOFV1Ran9Wh3YnT8PT4pFsi27.8HYLABcnEujRRqi82tEptTetyv5u47BL2RprDoDQa
 OfEBgnrlnEThTcqoej1y0aCerTplzQUJZDDCz9.4XnZ4vIPJenUN.FeGaa4.pZ1GFCHStq99Itnf
 Ken52KS.wvNPwNVnOw2gNyCVh_fV2Lfq6Zb1aJOmdoAmTOtytztH4C78DFHya2ZhkxomTFXdJSN6
 k1agV_d8mGyLimrsXUm9ppcY8yvaehkmXpPusqtBxdwmKIpMJUA_sAYWifJl8ZUKtcMsU3nJHs4A
 UgUvMDl0W6Aw1t4_JfH7LZjdmDhnGMCFT_TkqKfdex7G5OUck_qq3.ictk_qz83apEh2yzsF9E8u
 vn7WOeRTiSFYeHD5fO1Xoutjny0PC0Fjmc4xez4DG7xswMmYTq7FcH18OyOuZQ655PV6bP07I0g.
 l1RLCcL0srtKp5TnthfoDzrp0VHCO8t4dTgDYnZpNglxgIYGJs3GodDw.Tk8CcrD.COK9TeB_u6U
 EucSkYP4_jQabq89GxUg-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 16 Jan 2020 11:58:07 +0000
Received: by smtp410.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID f13e7c39cfd6f25d2178dac3447fbf08; 
 Thu, 16 Jan 2020 11:58:01 +0000 (UTC)
To: Takashi Iwai <tiwai@suse.de>
References: <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <8653a13c-ef08-4e0f-8375-baa6a3b4faa8@yahoo.de>
 <s5hd0bmcedb.wl-tiwai@suse.de>
From: Tobias <toszlanyi@yahoo.de>
Message-ID: <c3904fd3-5e02-fa20-bf82-46b7ee324245@yahoo.de>
Date: Thu, 16 Jan 2020 12:58:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5hd0bmcedb.wl-tiwai@suse.de>
Content-Language: en-US
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Cc: alsa-devel@alsa-project.org
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

VGhhbmsgeW91IGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzLi4uCgpJIGhhdmUgdHJpZWQgd2l0aCB0
aGUgbGF0ZXN0IEtlcm5lbCA1LjQuMTEgaW4gVWJ1bnR1IDE2LjA0IGFuZAokIGRtZXNnCnN0aWxs
IHNob3dzCiJjbG9jayBzb3VyY2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlIgoKTXkgY3Vy
cmVudCBydW5uaW5nIHN0YWJsZSBzeXN0ZW0gaXMKCiQgdW5hbWUgLWEKJCBMaW51eCB0b2JpYXMt
VjEzMCA0LjE1LjAtMjMtZ2VuZXJpYyAjMjV+MTYuMDQuMSBTTVAgRnJpIERlYyAyMCAKMjA6MTY6
MTkgQ0VUIDIwMTkgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4CgppbiB3aGVyZSBJIGFw
cGxpZWQgdGhlIGNoYW5lIGRlc2NyaWJlZCBpbiBoZXJlOgpodHRwczovL2Fsc2EtdXNlci5uYXJr
aXZlLmNvbS8ydERBTzg3Zi90cm91Ymxlc2hvb3RpbmctbmV3LXVzYi1hdWRpby1kZXZpY2UjcG9z
dDExCgpKdXN0IGZvciBteSB1bmRlcnN0YW5kaW5nIHdoYXQgeW91IG5vdyBuZWVkIG1lIHRvIGRv
Li4uCmRlbGV0aW5nIHRoZSBsaW5lIGluIC9zb3VuZC91c2IvY2xvY2suYyB0aGF0IHN0YXRlcyAi
cmV0dXJuIC1FTlhJTzsiCmFuZCBjb21waWxlIHRoZSBrZXJuZWwgYWdhaW4uCgpDbGVtZXMgbWVu
dGlvbmVkIGluIGhpcyBsYXN0IHBvc3QgdG8gYWRkIGxvZ2dpbmcgYnV0IEkgaGF2ZSBubyBpZGVh
IHdoYXQgCmhlIG1lYW5zIGJ5IHRoYXQuIENhbiB5b3UgYnJpZWZseSBndWlkZSBtZSB3aGF0IEkg
d291bGQgbmVlZCB0byBkbz8KClRoYW5rcyBhZ2Fpbi4KVG9iaWFzCgpBbSAxNC4wMS4yMCB1bSAx
NToxNiBzY2hyaWViIFRha2FzaGkgSXdhaToKPiBPbiBNb24sIDEzIEphbiAyMDIwIDE0OjU4OjUz
ICswMTAwLAo+IFRvYmlhcyB3cm90ZToKPj4gSGVsbG8gZGVhciBBTFNBIGRldmVsb3BlcnMgLSBp
cyB0aGVyZSBhbnkgY2hhbmNlIHRvIGdldCB0aGUgRGVub24KPj4gTUM3MDAwIGFuZCBNQzgwMDAg
VVNCIEF1ZGlvIGRldmljZXMgc3VwcG9ydGVkPyBTZWUgcHJldmlvdXMgbWVzc2FnZQo+PiBmb3Ig
ZGV0YWlscy4KPiBXaGljaCBrZXJuZWwgZGlkIHlvdSB0cnk/ICBJT1csIGRvZXMgdGhlIHByb2Js
ZW0gc3RpbGwgcGVyc2lzdCB3aXRoCj4gdGhlIHJlY2VudCBrZXJuZWw/Cj4KPiBJZiB5ZXMsIGhv
dyB3YXMgdGhlIGxhc3QgcXVlc3Rpb24gQ2xlbWVucyBwb2ludGVkIGluIHRoZSBmb3J1bSB5b3UK
PiBjaXRlZD8KPgo+Cj4gdGhhbmtzLAo+Cj4gVGFrYXNoaQo+Cj4+IFRoYW5rcyBhIGxvdAo+PiBU
b2JpYXMKPj4KPj4KPj4KPj4gQW0gMTQuMTIuMTkgdW0gMDk6MjQgc2NocmllYiBUb2JpYXM6Cj4+
PiBIZWxsbyBkZWFyIEFMU0EgZGV2ZWxvcGVycy4KPj4+Cj4+PiBJIGhhdmUgcHVyY2hhc2VkIGEg
TUM3MDAwIGNvbnRyb2xsZXIgaW4gb3JkZXIgdG8gY29udHJvbCBNSVhYWCBvbgo+Pj4gVWJ1bnR1
IDE2LjA0LiBBY2NvcmRpbmcgdG8gdGhlIERlbm9uIHNwZWNpZmljYXRpb24gdGhlIGNvbnRyb2xs
ZXIKPj4+IHNob3VsZCBoYXZlIGJlZW4gY2xhc3MgY29tcGxpYW50IGJ1dCB0aGVyZSBpcyBhbiBp
c3N1ZSB3aXRoIHRoZQo+Pj4gQXVkaW8gaW50ZXJmYWNlIHRvIHdvcmsgcHJvcGVybHkgZ2l2aW5n
IGZvbGxvd2luZyBtZXNzYWdlIC4uLgo+Pj4KPj4+ICQgZG1lc2cKPj4+IC4uLgo+Pj4gfFvCoCDC
oDc0LjUyMjgzMV0gdXNiIDEtMS4zOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2
IHVzaW5nCj4+PiB4aGNpX2hjZAo+Pj4gW8KgIMKgNzQuNjIzNzg0XSB1c2IgMS0xLjM6IE5ldyBV
U0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0xNWU0LAo+Pj4gaWRQcm9kdWN0PTgwMDQKPj4+IFvC
oCDCoDc0LjYyMzc4OV0gdXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwg
UHJvZHVjdD0yLAo+Pj4gU2VyaWFsTnVtYmVyPTMKPj4+IFvCoCDCoDc0LjYyMzc5M10gdXNiIDEt
MS4zOiBQcm9kdWN0OiBERU5PTiBESiBNQzcwMDAKPj4+IFvCoCDCoDc0LjYyMzc5Nl0gdXNiIDEt
MS4zOiBNYW51ZmFjdHVyZXI6IERFTk9OIERKCj4+PiBbwqAgwqA3NC42MjM3OThdIHVzYiAxLTEu
MzogU2VyaWFsTnVtYmVyOiAyMDE2MDMKPj4+IFvCoCDCoDc0LjYyNTEzNF0gdXNiIDEtMS4zOiBj
bG9jayBzb3VyY2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlCj4+Pgo+Pj4gInx8fGNsb2Nr
IHNvdXJjZSA2NSBpcyBub3QgdmFsaWQsIGNhbm5vdCB1c2UiIGlzIHJlcGVhdGVkCj4+PiB1bmNv
dW50YWJsZSB0aW1lcyB0aGVuCj4+Pgo+Pj4KPj4+IHxJIGZvdW5kIGEgZGlzY3Vzc2lvbiBoZXJl
IGZvciB0aGUgTUM4MDAwIEF1ZGlvIGludGVyZmFjZSB3aGljaCB3YXMKPj4+IG5vdCB3b3JraW5n
IGFuZCBzaG93aW5nIHRoZSBzYW1lIGVycm9yIG1lc3NhZ2U6Cj4+Pgo+Pj4gaHR0cHM6Ly9hbHNh
LXVzZXIubmFya2l2ZS5jb20vMnREQU84N2YvdHJvdWJsZXNob290aW5nLW5ldy11c2ItYXVkaW8t
ZGV2aWNlI3Bvc3Q4Cj4+Pgo+Pj4KPj4+IFRoZSBzb2x1dGlvbiB3YXMgdG8gY2hhbmdlIHNvdW5k
L3VzYi9jbG9jay5jIGFuZCByZWNvbXBpbGUgdGhlIGtlcm5lbC4KPj4+IFRoaXMgaXMgbm90IHBy
YWN0aWNhbCBmb3IgZGFpbHkgdXNlIGNhc2Ugc28gSSB3b3VsZCBsaWtlIHRvIGFzayBpZgo+Pj4g
dGhlIEFMU0EgdGVhbSBjb3VsZCBwb3NzaWJseSBmaW5kIGEgcGVybWFuZW50IGZpeCBmb3Igb3Jk
aW5hcnkKPj4+IHVzZXJzLgo+Pj4KPj4+IFRvIGdldCBteSBvdXRwdXRzIGZvcgo+Pj4KPj4+IGFw
bGF5IC1sCj4+PiBhcGxheSAtTAo+Pj4gfHx8YXBsYXkgLUQgcGx1Z2h3OkNBUkQ9TUM3MDAwLERF
Vj0wIEdyaW1tYWxkaWthLU1ha2VCZWxpZXZlLndhdgo+Pj4gfGxzdXNiIC12Cj4+PiBtaXh4eCAt
LWNvbnRyb2xsZXJEZWJ1Z3x8Cj4+PiBKYWNrU2VydmVyIGVycm9yIG1lc3NhZ2V8Cj4+Pgo+Pj4g
eW91IG1heSBoYXZlIGEgbG9vayBhdCB0aGUgTWl4eHggQ29tbXVuaXR5IEZvcnVtcyBoZXJlKGp1
c3Qgb24gcGFnZSwKPj4+IHlvdSBkb24ndCBuZWVkIHRvIGZpbmQgYW5kIHJlYWQgb24gbXVsdGlw
bGUgcGFnZXMpCj4+Pgo+Pj4gaHR0cHM6Ly93d3cubWl4eHgub3JnL2ZvcnVtcy92aWV3dG9waWMu
cGhwP2Y9NyZ0PTEyOTYyJnN0YXJ0PTEwCj4+Pgo+Pj4gSWYgeW91IG5lZWQgYW55IG1vcmUgaW5m
b3JtYXRpb24gdGhlbiBwbGVhc2UgbGV0IG1lIGtub3cuCj4+Pgo+Pj4gVGhhbmtzIGEgbG90IGZv
ciB5b3VyIHN1cHBvcnQgb24gdGhpcyBtYXR0ZXIuCj4+Pgo+Pj4gQ2hlZXJzIQo+Pj4gT3NaCj4+
PiB8fAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
Pj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
