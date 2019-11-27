Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FC10B6D2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 20:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD6E16B1;
	Wed, 27 Nov 2019 20:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD6E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574883197;
	bh=WDYBIzaXkj/FhdDnj5/102L8J8+2tnQ+ev2TTSwR9t4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvbw5Ic48RB8HdbcvX8CyXGlv/gCB62mwejFk6YfiDrj8I7yHmLgDgSk6joTMtqvx
	 KLI/MsSyTXw1v4maHfq14jhG6QiflO5512Y7ujkRer8GawwkXA2xMYXyS0eWawy+aR
	 GB8sNpiZ9wl/ywYZYdv9m6B75dl4FFc/APOKLxcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A8CF8013B;
	Wed, 27 Nov 2019 20:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF83FF8014D; Wed, 27 Nov 2019 20:31:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21DBF80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 20:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21DBF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JsN3c+Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574883086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0o5hXLzf4Gz9+Kied9Sca31iVNywS7wAEpffC3McYWY=;
 b=JsN3c+SiZr9ps+ocMPOzpW7cjIYNYnecpY+N1gUWnz+1rG0tQsAVgSt6dHAHUCQ+bepN1z
 pHfT1pTflq4Ty6uGzgyw5fTsHJlFIMUy7c4LYrLrMCwX3UsYXhPrgIG32OkfH55UXiTsva
 OPUyeWeHo/j37XUM/92xKiL9ZYpYNQ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-DmPjUhELMo-yuXdCWlRuJA-1; Wed, 27 Nov 2019 14:31:23 -0500
Received: by mail-wm1-f69.google.com with SMTP id y133so2797208wmd.8
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 11:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=es423QAUOYhpLCJOhf/BcuYv17PRuMgJ5AMF5w383Vo=;
 b=Weuy+vqiVOBQGVuyJIeCCZ9JXG14KDHyD9F8RcXV7z1k6IAvouSrWy9mT2TU75SXol
 HMENK86e8q1KSjEMHl8HkFqEC7opM4nBE4o0T6hYx/npGwDgQ6zqTYeGMpaW30AFmUPE
 xOCK2IbhhCbjvboXyYYwbWZyk4xHMye9Xt7u4Egf6O1j4bkAr7AeFO5pI+ceJ/hEFiVU
 n4p1R1RI8BibdxgTsYTLXS4nf5V49+W001mlnU/RHHMLH2Lg4oh6SRNyIbDfj4jxEvUj
 qOueQqg07Lq6Xitp4CzOvr5gWv2+Iz/2tFani6Vicgzfp8eyfGcqAS1j3fFG0St7kibB
 GC6A==
X-Gm-Message-State: APjAAAV+TyMGmlWZXFK9Q/jCKmU+vm7JDm+ch95GKRlkxCiWPvR4lHHp
 0ddw6TKaNHnAcAeVvK4JxK1Y44qGEIOngJYyT6Aj18ic4/NEW27b9K6eIPs7kP8Dt9jsDw5ZZ07
 I8JQVPzL7zLZNwkxHmtigaFc=
X-Received: by 2002:a1c:a512:: with SMTP id o18mr5658195wme.4.1574883082223;
 Wed, 27 Nov 2019 11:31:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUmUFwp114OO4nUoJP5xdWpuw6pysaY1YGp2pPEMTQtNrIjRCvC5br3KZ4AgYwJkD90E2cRA==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr5658175wme.4.1574883081902;
 Wed, 27 Nov 2019 11:31:21 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id c10sm7806184wml.37.2019.11.27.11.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 11:31:21 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Micha=c5=82_Matysiak?=
 <matysiakmichal@gmail.com>
References: <20191127142637.GB33700@prime> <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
 <20191127185237.GA7486@prime> <s5h8so1m8am.wl-tiwai@suse.de>
 <s5h4kypm867.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <81af92d6-a7ad-b947-1265-e3d3f7c43b4a@redhat.com>
Date: Wed, 27 Nov 2019 20:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5h4kypm867.wl-tiwai@suse.de>
Content-Language: en-US
X-MC-Unique: DmPjUhELMo-yuXdCWlRuJA-1
X-Mimecast-Spam-Score: 0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] kernel oops related to the new HDA audio handling
	for DP MST
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

SGksCgpPbiAyNy0xMS0yMDE5IDIwOjI3LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gV2VkLCAy
NyBOb3YgMjAxOSAyMDoyNDo0OSArMDEwMCwKPiBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+Cj4+IE9u
IFdlZCwgMjcgTm92IDIwMTkgMTk6NTI6MzcgKzAxMDAsCj4+IE1pY2hhxYIgTWF0eXNpYWsgd3Jv
dGU6Cj4+Pgo+Pj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MDA6MTdQTSArMDEwMCwgVGFr
YXNoaSBJd2FpIHdyb3RlOgo+Pj4+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTY6NTc6MDQgKzAxMDAs
Cj4+Pj4gVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIDI3IE5vdiAyMDE5
IDE2OjQ2OjAwICswMTAwLAo+Pj4+PiBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
IEhpIFRha2FzaGksCj4+Pj4+Pgo+Pj4+Pj4gT24gMjctMTEtMjAxOSAxNTozOSwgVGFrYXNoaSBJ
d2FpIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTU6MjY6MzcgKzAxMDAsCj4+
Pj4+Pj4gTWljaGHFgiBNYXR5c2lhayB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSGkKPj4+Pj4+
Pj4KPj4+Pj4+Pj4gUmVjZW50bHkgSSd2ZSBlbmNvdW50ZXJlZCB0aGlzIGVycm9yIGFuZCBhcyBI
YW5zIGRlIEdvZWRlJ3MgcmVxdWVzdCBJJ20KPj4+Pj4+Pj4gcmVwb3J0aW5nIHRoaXMgYmFjayB0
byB5b3UuIFRoaXMgaGFwcGVucyB3aGlsZSBib290aW5nIG15IGxhcHRvcAo+Pj4+Pj4+PiBjb25u
ZWN0ZWQgdG8gZG9ja2luZyBzdGF0aW9uIGFuZCB3aXRob3V0IHVzaW5nIG9uZS4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4ga2VybmVsOiBXQVJOSU5HOiBDUFU6IDEgUElEOiAzMzAgYXQgc291bmQvaGRhL2hk
YWNfY29tcG9uZW50LmM6MjkwIHNuZF9oZGFjX2Fjb21wX2luaXQrMHhkZS8weDEzMCBbc25kX2hk
YV9jb3JlXQo+Pj4+Pj4+PiBUaGVyZSBhcmUgMiBtb3JlICJjdXQgaGVyZSIsIGJ1dCB0aGV5J3Jl
IGFsbW9zdCBpZGVudGljYWwgc28gSSd2ZSBvbmx5Cj4+Pj4+Pj4+IGluY2x1ZGVkIG9uZSBpbiB0
aGlzIGVtYWlsLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBEb24ndCBrbm93IHdoYXQgd2lsbCBiZSB2YWx1
YWJsZSB0byB5b3UsIGJ1dCBJJ20gd2lsbGluZyB0byBoZWxwIHRlc3QKPj4+Pj4+Pj4gdGhpcyBh
bmQgZG8gd2hhdCBJJ20gdG9sZC4gU28sIGhvdyBjYW4gSSBoZWxwPwo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBNb3JlIGluZm8gYWJvdXQgdGhpcyBwYXJ0aWN1bGFyIGtlcm5lbCBhbmQgaXNzdWUsIHRoYXQg
bGVkIHRvIHRoaXMgaXMgYXQ6Cj4+Pj4+Pj4+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9z
aG93X2J1Zy5jZ2k/aWQ9MTc1Nzg5MQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkbWVzZyBvdXRwdXQ6Cj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IG1pY3JvY29kZTogbWljcm9j
b2RlIHVwZGF0ZWQgZWFybHkgdG8gcmV2aXNpb24gMHgyZiwgZGF0ZSA9IDIwMTktMDItMTcKPj4+
Pj4+Pj4gTm92IDI2IDE4OjA1OjQ1IGtlcm5lbDogTGludXggdmVyc2lvbiA1LjQuMC0wLnJjOC5n
aXQwLjEucmhiejE3NTc4OTEuZmMzMS54ODZfNjQgKG1vY2tidWlsZEBidWlsZGh3LTEwLnBoeDIu
ZmVkb3JhcHJvamVjdC5vcmcpIChnY2MgdmVyc2lvbiA5LjIuMSAyMDE5MDgyNyAoUmVkIEhhdCA5
LjIuMS0xKSAoR0NDKSkgIzEgU01QIFdlZCBOb3YgMjAgMTQ6NTA6MzQgVVRDIDIwMTkKPj4+Pj4+
Pj4gTm92IDI2IDE4OjA1OjQ1IGtlcm5lbDogQ29tbWFuZCBsaW5lOiBCT09UX0lNQUdFPShoZDAs
Z3B0Mikvdm1saW51ei01LjQuMC0wLnJjOC5naXQwLjEucmhiejE3NTc4OTEuZmMzMS54ODZfNjQg
cm9vdD0vZGV2L21hcHBlci9mZWRvcmEtcm9vdCBybyByZXN1bWU9L2Rldi9tYXBwZXIvZmVkb3Jh
LXN3YXAgcmQubHZtLmx2PWZlZG9yYS9yb290IHJkLmx1a3MudXVpZD1sdWtzLWVmZDhiNDM4LThm
NTYtNDA1YS04Y2VhLTg4ZjgzY2EzOGQyYiByZC5sdm0ubHY9ZmVkb3JhL3N3YXAgcmhnYiBxdWll
dAo+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4gLi4uCj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+PiBOb3YgMjYg
MTg6MDY6MTYga2VybmVsOiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+
Pj4+Pj4gTm92IDI2IDE4OjA2OjE2IGtlcm5lbDogV0FSTklORzogQ1BVOiAwIFBJRDogNDYxIGF0
IHNvdW5kL2hkYS9oZGFjX2NvbXBvbmVudC5jOjI5MCBzbmRfaGRhY19hY29tcF9pbml0KzB4ZGUv
MHgxMzAgW3NuZF9oZGFfY29yZV0KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgc2hvdWxkIGhhdmUgYmVl
biBhbHJlYWR5IGZpeGVkIGJ5IHRoZSByZWNlbnQgY29tbWl0Cj4+Pj4+Pj4gNWE4NThlNzljOTEx
MzMwNjc4YjVhOWJlOTFhMjQ4MzBlOTRhMGRjOQo+Pj4+Pj4+ICAgICAgIEFMU0E6IGhkYSAtIERp
c2FibGUgYXVkaW8gY29tcG9uZW50IGZvciBsZWdhY3kgTnZpZGlhIEhETUkgY29kZWNzCj4+Pj4+
Pj4gd2hpY2ggaXMgYWxyZWFkeSBpbmNsdWRlZCBpbiBMaW51cyB0cmVlLiAgUGxlYXNlIGNoZWNr
IGl0Lgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywgSSd2ZSBzdGFydGVkIGEgc2NyYXRjaCBrZXJuZWwg
YnVpbGQgd2l0aCB0aGUgcmVsZXZhbnQgcGF0Y2hlcyBhZGRlZCwKPj4+Pj4+IGZvciB0aGUgRmVk
b3JhIHVzZXJzIGhpdHRpbmcgdGhpcyB0byB0ZXN0Lgo+Pj4+Pj4KPj4+Pj4+IFRoZSByZWFzb24g
dGhleSBzdGFydGVkIGxvb2tpbmcgaW50byB0aGVpciBkbWVzZyBpcyB0aGF0IHRoZWlyIG52aWRp
YSBHUFUgKGh5YnJpZCBnZnggc2V0dXApCj4+Pj4+PiB3aWxsIG5vIGxvbmdlciBzdXNwZW5kIHdp
dGggcmVjZW50IGtlcm5lbHMsIHRoaXMgaXMgd2l0aCBhIDUuNCBrZXJuZWwgd2hpY2ggYWxyZWFk
eSBoYXMgdGhlCj4+Pj4+Pgo+Pj4+Pj4gIkFMU0E6IGhkYSAtIEZvcmNlIHJ1bnRpbWUgUE0gb24g
TnZpZGlhIEhETUkgY29kZWNzIgo+Pj4+Pj4KPj4+Pj4+IEZpeCBhbmQgZm9yIGdvb2QgbWVhc3Vy
ZSBJJ3ZlIGFscmVhZHkgZ2l2ZW4gdGhlbSBhIHRlc3Qga2VybmVsIHdpdGggdGhlOgo+Pj4+Pj4g
IkFMU0E6IGhkYTogQWxsb3cgSERBIHRvIGJlIHJ1bnRpbWUgc3VzcGVuZGVkIHdoZW4gZEdQVSBp
cyBub3QgYm91bmQgdG8gYSBkcml2ZSIKPj4+Pj4+Cj4+Pj4+PiBwYXRjaCBhZGRlZC4gQnV0IGxv
b2tpbmcgYXQgdGhlIGZpeCBmb3IgdGhlIG9vcHMgSSdtIG5vdCBzdXJlIGlmIGZpeGluZwo+Pj4+
Pj4gdGhlIG9vcHMgaXMgYWxzbyBnb2luZyB0byBmaXggdGhlIGlzc3VlIHdpdGggdGhlIGRHUFUg
bm8gbG9uZ2VyIHN1c3BlbmRpbmc/Cj4+Pj4+Cj4+Pj4+IEkgZ3Vlc3MgaXQncyBpcnJlbGV2YW50
IHdpdGggdGhhdCBwcm9ibGVtLCBhcyB0aGlzIGtlcm5lbCB3YXJuaW5nIChub3QKPj4+Pj4gcmVh
bGx5IGFuIE9vcHMpIGlzIGp1c3QgYWJvdXQgc2tpcHBpbmcgdGhlIG11bHRpcGxlIGF1ZGlvIGNv
bXBvbmVudAo+Pj4+PiByZWdpc3RyYXRpb24uICBBbmQgdGhlIGF1ZGlvIGNvbXBvbmVudCBpc24n
dCB1c2VkIGluIG5vdXZlYXUgc2lkZSBvbgo+Pj4+PiA1LjQueCBhdCBhbGwsIGFuZCBpdCdzIGp1
c3QgYSBwbGFjZWhvbGRlci4gIEJ1dCB3aG8ga25vd3MgdGhlIGJsYWNrCj4+Pj4+IG1hZ2ljIGJl
aGluZCB0aGUgc2NlbmUgOikKPj4+Pgo+Pj4+IC4uLiBhbmQgaWYgdGhpcyBzdGlsbCBkb2Vzbid0
IGZpeCB0aGUgcHJvYmxlbSwgcGxlYXNlIGNoZWNrIHRoZQo+Pj4+IHJ1bnRpbWUgUE0gc3RhdGUg
b2YgYWxsIEhELWF1ZGlvIGNvZGVjIGRldmljZXMgYW5kIEhELWF1ZGlvIGNvbnRyb2xsZXIKPj4+
PiBkZXZpY2UuICBEbyBhbGwgc2hvdyB0aGUgcnVudGltZS1zdXNwZW5kZWQgYnV0IHRoZSBwb3dl
ciBjb25zdW1wdGlvbgo+Pj4+IGlzIGhpZ2g/ICBPciBpcyBzb21lIGRldmljZSBibG9ja2VkPwo+
Pj4+Cj4+Pj4gQmFzaWNhbGx5IHRoZSBhdWRpbyBjb250cm9sbGVyIGNvcnJlc3BvbmRpbmcgdG8g
dGhlIGRHUFUgc2hvdWxkIGhhdmUKPj4+PiBjaGlwLT5idXMua2VlcF9wb3dlciA9IDAsIHdoaWNo
IGFsbG93cyB0aGUgcnVudGltZSBQTS4gIFRoaXMgZmxhZyBpcwo+Pj4+IGNsZWFyZWQgYXQgYXp4
X3Z4X2dwdV9ib3VuZCgpIG9ubHkgZm9yIHRoZSBkR1BVLiAgRm9yIHRoZSBwcmltYXJ5IEdQVSwK
Pj4+PiB3ZSBuZWVkIHRvIGtlZXAgdGhlIGxpbmsgcG93ZXIgdW5sZXNzIHRoZSBub3RpZmljYXRp
b24gaXMgZG9uZSB2aWEgdGhlCj4+Pj4gYXVkaW8gY29tcG9uZW50IChsaWtlIGk5MTUgb3IgYW1k
Z3B1KS4gIEkgYWxyZWFkeSBzdWJtaXR0ZWQgYSBwYXRjaCB0bwo+Pj4+IGVuYWJsZSB0aGUgYXVk
aW8gY29tcG9uZW50IGZvciBub3V2ZWF1IGluIHRoZSBwYXN0LCBidXQgaXQncyBpZ25vcmVkLAo+
Pj4+IHNvIGZhci4KPj4+Pgo+Pj4+Cj4+Pj4gdGhhbmtzLAo+Pj4+Cj4+Pj4gVGFrYXNoaQo+Pj4K
Pj4+IEhpIFRha2FzaGkKPj4+Cj4+PiBPbiBsaW51eC1uZXh0LTIwMTkxMTI3IHdhcm5pbmcgaW5k
ZWVkIGRpc2FwcGVhcmVkLiBUaGFua3MhCj4+Pgo+Pj4gUmVzdCBvZiBwcm9ibGVtcyBkaWQgbm90
LiBUaGlzIGlzIG15IG91dHB1dCBmcm9tIGFsc2EtaW5mby5zaAo+Pj4gaHR0cDovL2Fsc2EtcHJv
amVjdC5vcmcvZGIvP2Y9OTFiYjc4OWEwMWY5ZWVkOTJkMDUzNGZlODk1MTYxOTMxMmIzNTVkYQo+
Pj4gRG9uJ3Qga25vdyBpZiBpdCdzIGhlbHBmdWwsIHNvIEknbGwgbGVhdmUgaXQgaGVyZS4gUG93
ZXIgY29uc3VtcHRpb24gaXMKPj4+IGhpZ2gsIGJlY2F1c2UgcnVudGltZS1zdXNwZW5kZWQgaXMg
bm90IGVuYWJsZWQvYWN0aXZlIChhbmQgY2Fubm90IGJlCj4+PiBmb3JjZWQpIHdpdGhvdXQgcmVt
b3ZpbmcgbnZpZGlhJ3MgYXVkaW8uCj4+Cj4+IFdoYXQgaWYgeW91IHBhc3MgcG93ZXJfc2F2ZT0x
IHRvIHNuZC1oZGEtaW50ZWwgb3B0aW9uPwo+Pgo+PiAgICBlY2hvIC1uIDEgPiAvc3lzL21vZHVs
ZS9zbmRfaGRhX2ludGVsL3BhcmFtZXRlcnMvcG93ZXJfc2F2ZQo+IAo+IGFuZCB0aGUgZm9sbG93
aW5nLCB0b286Cj4gICAgICBlY2hvIC1uIDEgPiAvc3lzL21vZHVsZS9zbmRfaGRhX2ludGVsL3Bh
cmFtZXRlcnMvcG93ZXJfc2F2ZV9jb250cm9sbGVyCj4gCj4gT3RoZXJ3aXNlIHRoZSBjb250cm9s
bGVyIGRldmljZSB3aWxsIGtlZXAgb24uCgpUaGFuayB5b3UgZm9yIGhlbHBpbmcgdXMgZ2V0dGlu
ZyB0byB0aGUgcm9vdCBvZiB0aGlzLgoKVGhlc2UgYm90aCBkZWZhdWx0IHRvIDEgcmVzcC4gWSBv
biBGZWRvcmEga2VybmVscywgc28gSSBkbyBub3QgdGhpbmsKdGhhdCB0aGlzIHdpbGwgaGVscCwg
YXMgdGhleSBhcmUgYm90aCBhbHJlYWR5IDEvWS4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
