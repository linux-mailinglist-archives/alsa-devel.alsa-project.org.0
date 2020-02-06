Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224C154190
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 11:08:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA7D169A;
	Thu,  6 Feb 2020 11:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA7D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580983698;
	bh=xzRccpbUVAZDYZeCITluaB+fU2tjc12nOSb3QGlvZQI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bU7S97qC0CFUpBz3ZPWIAnF/4jLcC6K7DwkFrdm5PWB/NOSeZRm61tjtyogK0tESf
	 VEtsHc5J/XiQ/6MYVNBjCxjP/bUwhSm+iormmyWTChvBv6RTm8x+/47pc7CzNS35k9
	 FYvZvQ/0Yj22xJPt8YnjdpiwIwrRS/PFm1/0NByU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F55CF80059;
	Thu,  6 Feb 2020 11:06:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC63CF80162; Thu,  6 Feb 2020 11:06:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from sonic304-21.consmr.mail.ir2.yahoo.com
 (sonic304-21.consmr.mail.ir2.yahoo.com [77.238.179.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11549F80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 11:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11549F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="Le7/k72h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1580983585; bh=XXGzW1tL43BEmRqOcViBAP2uOKG1w3CMfof2V2pPShk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=Le7/k72hnF73YiRMevnbPtcNWGj+kPOSQE1iOrkQR0ZqFxWxIg19Eg/hSY0nhKeW3HREdrfYgUtjfKdtIKk4PMbPrZ8oQ4p4R+LXjhe4bOBhbHx4FUBzMFNDbRd6meo/Bo5SYPmB2fQwkek76bbQiPeo1Mw2P0FOs4ZMtQ8GoaCPk169PAzZ61S/XXXt2/6ORK/oVEgqjxrF0nV1rZ2g23/oaj1GBQbdyZ6qRH45ENwEcHtkGLQ62wENqVPU2iTy2iGzqGu+mbujMoOsI1YIMYbwMB58y8aKImbHlYHLGyCCqpk54Ooj6hLnMF6qGCcFfCYH3AmN34DkE8N6m/L3IA==
X-YMail-OSG: G9.GYTAVM1mZOmZRDUkTvitM3Ul.N2MeZcVR49SnnGQHcok_trIkff06AR9aGue
 kIiEKvu7RUdgdV7TUEwLrsi_4FIk1JnY19Zv7otZCXbDxYkLvjQFqhsKiZSehfOJRoit4CNZ7pEu
 tYfJ.fC12DFogQHX_oRoi5H8KC7UAzHZ.VQvHJ5.lmiAuhV6wQVxzurr.n97ShnUtgK6fh9d35jr
 KtNxVeT2xnUlg4Sk8ftH19YDnKIZHFnisS5QbkUP9BsxLCMjfjzeBKHtCLLN06PA8Y.EhvgKaBud
 EiwVM0KUPAVBc6e_U9IiWNtQV5N3xAV68xL9bRY00tG3gZc5BhAIhEl7fJ4DOTIXgOe0Lxs6L5h3
 0lLLo0PbKv7unvAug8ReXJU24Bs4EpSTzi91259GJUKbYWfv3RTjYvHz.SkFTufkW_mv0kp6ddTy
 5VZdyqFO59_ui.6JJ7K_vtp2gvUQ3UAUVS1SJ1F9.7__7KOHmPR4e3UqqsjoycDeqBpQITm042hC
 F.74Fy8Ku9TSnFuKV.0L3jVHa9sr5wBSb.X1gWYrzByXG3Uz0rvZQE85PFlfq3PhxFSh0Xu0Ai05
 djGabNsKSNBfS8SXGlxzw4Z4MGTPuHiGKnHmO8W1ukHcV6z3CE7JjC12jEsoUC416kiiUUMD24hi
 vFVd4vtqrzKiCJBieBZ2tqoYUlHCOEEQooRkSLRC_Qu.zEUJ_rIVo_vbuFlMzCbeqLVovhLq42Lo
 _TyMt9NnhSkxK8fhHDanMqCLiKYT70F59DFovZx.NYXYziiDooPLzpkWAZ4OYiPoPsn_ViA7K1As
 A82rDALCc6Wqa1P7LqIe4ZYRBLkgMYynA7vAlLVjNe4ZxsbSpP4Kl0chaOGVe0ZeZlc_LmTAWfv2
 zGdpOpcG3wFde6aFFNTwkOQgt7AZfUtEuy62Vwsn0gcd6OluKkGkSD7RFwLm3_yJSmbuty2q52hC
 8DxsOIcqxhvyQqcMailUfpXvWQgykxRukXaG0JoWw2KGO3m0ZZ27YRNQN9BwK_qpeUv6F.FD4Uz_
 _GejxRZZi5F3dUPnepHnE8XyN9YDnzYpcm861l3urspYc1TQb_BCfFW66kni2RdSxIevqPvRpYlJ
 Apn98jsd_ABMeAapbVOZjkWe9KiUSkifhMaOnxIqZ0jDrY57IjRfEFCupbeSk7VUv4ps3NDtVjY5
 vfhw7qWq_RafP711S7Hts3XY8T.Gfqo3QPZqStsmTylElQqjpf8sbBF6J0yxNwThBgVMM3aqxmy2
 P9.jiBcasrDT.wgtEAwy5AnQPHv6bSoSnjjl_kmWtQ4yT76YIveHTzzxNM8CEVii89zzAWhWvKYc
 H0ydFuqjGxnDVxcZfrTI.jCddgj4UGivrA8MUx0LezKBdjqlLjnMLgkpienh6U3fnAx85iJR_Dqb
 TPwzNZ7MbWJr_PJ1E2w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Thu, 6 Feb 2020 10:06:25 +0000
Received: by smtp403.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 5f14cd1c893c15b22b404bc8979d0e8f; 
 Thu, 06 Feb 2020 10:06:24 +0000 (UTC)
To: Alexander Tsoy <alexander@tsoy.me>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
 <1697977016.25666627.1579681629054@mail.yahoo.com>
 <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
 <6cb1135be692d460256de2cf65b0a023eea1295e.camel@tsoy.me>
From: Tobias <toszlanyi@yahoo.de>
Message-ID: <05edff76-729f-0ffa-9a2b-908fa42c24d8@yahoo.de>
Date: Thu, 6 Feb 2020 11:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6cb1135be692d460256de2cf65b0a023eea1295e.camel@tsoy.me>
Content-Language: en-US
X-Mailer: WebService/1.1.15185 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Cc: Takashi Iwai <tiwai@suse.de>
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

VGhhbmsgeW91IHNvIG11Y2ggQWxleGFuZGVyIQpJIHVzZWQgbGF0ZXN0IEtlcm5lbCBhbmQgcGF0
Y2hlZCBhcyB5b3Ugc3VnZ2VzdGVkLiBUaGUgRGV2aWNlIGlzIHdvcmtpbmcgCm5vdyBnaXZpbmcg
c291bmQgb24gYWxsIDQgY2hhbm5lbHMsIGV2ZW4gdGhvdWdoIGRtZXNnIHN0aWxsIHNob3dzIHRo
ZSAKZXJyb3IgbWVzc2FnZSBhcyB5b3UgY2FuIHNlZSBoZXJlOgoKdW5hbWUgLWE6CkxpbnV4IHRv
Ymlhcy1WMTMwIDUuNS4yICMxIFNNUCBUaHUgRmViIDYgMDk6NDE6NTcgQ0VUIDIwMjAgeDg2XzY0
IHg4Nl82NCAKeDg2XzY0IEdOVS9MaW51eAoKZG1lc2c6ClvCoMKgIDYyLjkxODc3N10gdXNiIDEt
MS4zOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2lfaGNkClvC
oMKgIDYyLjkzOTI5M10gdXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MTVlNCwgCmlkUHJvZHVjdD04MDA0LCBiY2REZXZpY2U9MTEuMTAKW8KgwqAgNjIuOTM5Mjk1XSB1
c2IgMS0xLjM6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIApTZXJp
YWxOdW1iZXI9MwpbwqDCoCA2Mi45MzkyOTddIHVzYiAxLTEuMzogUHJvZHVjdDogREVOT04gREog
TUM3MDAwClvCoMKgIDYyLjkzOTI5OF0gdXNiIDEtMS4zOiBNYW51ZmFjdHVyZXI6IERFTk9OIERK
ClvCoMKgIDYyLjkzOTI5OV0gdXNiIDEtMS4zOiBTZXJpYWxOdW1iZXI6IDIwMTYwMwpbwqDCoCA2
Mi45NDIyMzJdIHVzYiAxLTEuMzogY2xvY2sgc291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90
IHVzZQpbwqDCoCA2Mi45NDM5OThdIHVzYiAxLTEuMzogY2xvY2sgc291cmNlIDY1IGlzIG5vdCB2
YWxpZCwgY2Fubm90IHVzZQpbwqDCoCA2My4wMTMzMDZdIHVzYiAxLTEuMzogY2xvY2sgc291cmNl
IDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90IHVzZQpbwqDCoCA2My4wMjg5MTJdIHVzYiAxLTEuMzog
Y2xvY2sgc291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90IHVzZQpbwqDCoCA2My4wMjk2NzVd
IHVzYiAxLTEuMzogY2xvY2sgc291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90IHVzZQpbwqDC
oCA2My4wMzc4MTNdIHVzYiAxLTEuMzogY2xvY2sgc291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fu
bm90IHVzZQpbwqDCoCA2My4wNjM4NjVdIHVzYiAxLTEuMzogY2xvY2sgc291cmNlIDY1IGlzIG5v
dCB2YWxpZCwgY2Fubm90IHVzZQoKSSBjaGVja2VkIGluIGZpbGUgL3NvdW5kL3VzYi9jbG9jay5j
IHRoYXQgd2l0aGluIGZ1bmN0aW9ucwoKc3RhdGljIGludCBfX3VhY19jbG9ja19maW5kX3NvdXJj
ZQpzdGF0aWMgaW50IF9fdWFjM19jbG9ja19maW5kX3NvdXJjZQoKdGhlcmUgaXMgYW5vdGhlciBj
aGVjayB0aGF0IHBvc3NpYmx5IGdpdmVzIHRoZSB3YXJuaW5nLgoKTWF5YmUgdGhlIHdhcm5pbmcg
ImNhbm5vdCB1c2UiIHNob3VsZCBub3QgYmUgZGlzcGxheWVkIHdoZW4gYSBEZW5vbiAKQXVkaW8g
ZGV2aWNlIGlzIGF0dGFjaGVkIGFzIGl0IGlzIG1pc2xlYWRpbmcuCgpUaGFua3MgYSBsb3QgZm9y
IHlvdXIgbmV4dCBwYXRjaCB0aGF0IEkgd291bGQgbGlrZSB0byB0ZXN0LgpUb2JpYXMKCgoKQW0g
MDUuMDIuMjAgdW0gMjA6MDcgc2NocmllYiBBbGV4YW5kZXIgVHNveToKPiDQkiDQn9C9LCAwMy8w
Mi8yMDIwINCyIDExOjIzICswMTAwLCBUb2JpYXMg0L/QuNGI0LXRgjoKPj4gRGVhciBBbGV4YW5k
ZXIgLSB1bmZvcnR1bmF0ZWx5IEkgZGlkIGhvdCBoZWFyIGJhY2sgZnJvbSB5b3UuIEkgZ3Vlc3MK
Pj4gdGhpcyBtYXkgbm90IGJlIHlvdXIgaGlnaGVzdCBwcmlvcml0eSBidXQgc3RpbGwgLSBkbyB5
b3UgaGF2ZSBhbnkKPj4gb3RoZXIKPj4gaWRlYSB0byBtYWtlIHRoZSBNQzcwMDAgc291bmQgZGV2
aWNlIHdvcmtpbmc/IFRoYW5rcyBhIGxvdC4KPiBJIHRoaW5rIGl0IHNob3VsZCBiZSBzYWZlIHRv
IGlnbm9yZSBjbG9jayB2YWxpZGl0eSBjaGVjayByZXN1bHQgaWY6Cj4gLSBvbmx5IG9uZSBzaW5n
bGUgc2FtcGxlIHJhdGUgaXMgc3VwcG9ydGVkOwo+IC0gdGhlIGNsb2NrIHNvdXJjZSBpcyBpbnRl
cm5hbCwKPiAtIHRoZXJlIGlzIG5vIGNsb2NrIHNlbGVjdG9yLgo+Cj4gQ291bGQgeW91IHRyeSB0
aGUgZm9sbG93aW5nIHBhdGNoPwo+Cj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNiL2Nsb2NrLmMg
Yi9zb3VuZC91c2IvY2xvY2suYwo+IGluZGV4IDAxOGIxZWNiNTQwNC4uNjM2YzM0MGQ0ZjlmIDEw
MDY0NAo+IC0tLSBhL3NvdW5kL3VzYi9jbG9jay5jCj4gKysrIGIvc291bmQvdXNiL2Nsb2NrLmMK
PiBAQCAtMTk3LDYgKzE5NywzOCBAQCBzdGF0aWMgYm9vbCB1YWNfY2xvY2tfc291cmNlX2lzX3Zh
bGlkKHN0cnVjdCBzbmRfdXNiX2F1ZGlvICpjaGlwLAo+ICAgCXJldHVybiBkYXRhID8gdHJ1ZSA6
ICBmYWxzZTsKPiAgIH0KPiAgIAo+ICsvKgo+ICsgKiBBc3N1bWUgdGhlIGNsb2NrIGlzIHZhbGlk
IGlmIGNsb2NrIHNvdXJjZSBzdXBwb3J0cyBvbmx5IG9uZSBzaW5nbGUgc2FtcGxlCj4gKyAqIHJh
dGUsIGl0cyB0eXBlIGlzIG5vdCBleHRlcm5hbCBhbmQgdGhlcmUgaXMgbm8gY2xvY2sgc2VsZWN0
b3IuIFRoaXMgaXMgbmVlZGVkCj4gKyAqIGZvciBzb21lIERlbm9uIERKIGNvbnRyb2xsZXJzLCB0
aGF0IGFsd2F5cyByZXBvcnQgdGhhdCBjbG9jayBpcyBpbnZhbGlkLgo+ICsgKi8KPiArc3RhdGlj
IGJvb2wgdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZF9xdWlyayhzdHJ1Y3Qgc25kX3VzYl9hdWRp
byAqY2hpcCwKPiArCQkJCQkgICAgc3RydWN0IGF1ZGlvZm9ybWF0ICpmbXQsCj4gKwkJCQkJICAg
IGludCBjbG9jaykKPiArewo+ICsJaWYgKGZtdC0+cHJvdG9jb2wgPT0gVUFDX1ZFUlNJT05fMykg
ewo+ICsJCXN0cnVjdCB1YWMzX2Nsb2NrX3NvdXJjZV9kZXNjcmlwdG9yICpjc19kZXNjID0KPiAr
CQkJc25kX3VzYl9maW5kX2Nsb2NrX3NvdXJjZV92MyhjaGlwLT5jdHJsX2ludGYsIGNsb2NrKTsK
PiArCj4gKwkJaWYgKCFjc19kZXNjKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJCXJldHVy
biAoZm10LT5ucl9yYXRlcyA9PSAxICYmCj4gKwkJCShmbXQtPmNsb2NrICYgMHhmZikgPT0gY3Nf
ZGVzYy0+YkNsb2NrSUQgJiYKPiArCQkJKGNzX2Rlc2MtPmJtQXR0cmlidXRlcyAmIDB4MSkgIT0g
VUFDM19DTE9DS19TT1VSQ0VfVFlQRV9FWFQpOwo+ICsJfSBlbHNlIHsgLyogVUFDX1ZFUlNJT05f
MiAqLwo+ICsJCXN0cnVjdCB1YWNfY2xvY2tfc291cmNlX2Rlc2NyaXB0b3IgKmNzX2Rlc2MgPQo+
ICsJCQlzbmRfdXNiX2ZpbmRfY2xvY2tfc291cmNlKGNoaXAtPmN0cmxfaW50ZiwgY2xvY2spOwo+
ICsKPiArCQlpZiAoIWNzX2Rlc2MpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJcmV0dXJu
IChmbXQtPm5yX3JhdGVzID09IDEgJiYKPiArCQkJKGZtdC0+Y2xvY2sgJiAweGZmKSA9PSBjc19k
ZXNjLT5iQ2xvY2tJRCAmJgo+ICsJCQkoY3NfZGVzYy0+Ym1BdHRyaWJ1dGVzICYgMHgzKSAhPSBV
QUNfQ0xPQ0tfU09VUkNFX1RZUEVfRVhUKTsKPiArCX0KPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQg
X191YWNfY2xvY2tfZmluZF9zb3VyY2Uoc3RydWN0IHNuZF91c2JfYXVkaW8gKmNoaXAsIGludCBl
bnRpdHlfaWQsCj4gICAJCQkJICAgdW5zaWduZWQgbG9uZyAqdmlzaXRlZCwgYm9vbCB2YWxpZGF0
ZSkKPiAgIHsKPiBAQCAtNTc3LDcgKzYwOSw4IEBAIHN0YXRpYyBpbnQgc2V0X3NhbXBsZV9yYXRl
X3YydjMoc3RydWN0IHNuZF91c2JfYXVkaW8gKmNoaXAsIGludCBpZmFjZSwKPiAgIAo+ICAgdmFs
aWRhdGlvbjoKPiAgIAkvKiB2YWxpZGF0ZSBjbG9jayBhZnRlciByYXRlIGNoYW5nZSAqLwo+IC0J
aWYgKCF1YWNfY2xvY2tfc291cmNlX2lzX3ZhbGlkKGNoaXAsIGZtdC0+cHJvdG9jb2wsIGNsb2Nr
KSkKPiArCWlmICghdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZChjaGlwLCBmbXQtPnByb3RvY29s
LCBjbG9jaykgJiYKPiArCSAgICAhdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZF9xdWlyayhjaGlw
LCBmbXQsIGNsb2NrKSkKPiAgIAkJcmV0dXJuIC1FTlhJTzsKPiAgIAlyZXR1cm4gMDsKPiAgIH0K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
