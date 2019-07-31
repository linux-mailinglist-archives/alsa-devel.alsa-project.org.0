Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CA57BD6D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0AB16D2;
	Wed, 31 Jul 2019 11:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0AB16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564566069;
	bh=UNCYre6SA54my1f9r2UqqE1uV5Td9uLnmQK+51vxZHo=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arfS7AY0xexYO63QfyZbjd3l3BjJ2QMsjyVTAgbBwHo1ukgfIhABYIK4tYYARlERH
	 7ThUXPhfhuX9qIKZZT65YCSAs2zjDW0AVcQdP+GbiXw7kk0rJG7zYpvvd3fOa1V79k
	 sZMxogHFArB8IpgVd2opt1thQPrmaKU70XzX+vdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF78F80518;
	Wed, 31 Jul 2019 11:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95B57F8048E; Wed, 31 Jul 2019 10:41:57 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13D20F80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 10:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D20F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dvsn.net header.i=@dvsn.net
 header.b="IQXxbAn3"
Received: by mail-wm1-x341.google.com with SMTP id l2so58974153wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dvsn.net; s=dvsn;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tEIapp+Ki4NKrMVbT+946ImkWxUBVv6m7FyZvOAD6fM=;
 b=IQXxbAn3V5BRWZLN/PGYp8MvWW745mQSghb8P8rjQ/Pr2IFmTQTHZG50B9lt6M9uKt
 760ADRZTTresfmwv9QY9BdjB1d25I70cEThRLD4Wl6fDdNEeYSkKvT/R+1jGi0jgfi6R
 GPnhhOlYPNDt+ep2O/ceOTiMEYDUDh5YnEMl3VjRQO7NINcOiuUBjFqL8ex5Ophp9N/6
 q70E0ZlSn9RtiRBY9ebhMPMqA2vX/mFUe2nG2tMsMRBH9JKNLlMgiuVKuQrietIak8gX
 Mr3f6KPn588wY5SSqaqoNHz06yNjV1O9VNjAjwwHi6AIKIuMq1Hm1cGQCBzSyT8I4vuk
 ILXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tEIapp+Ki4NKrMVbT+946ImkWxUBVv6m7FyZvOAD6fM=;
 b=HZ5KDzTJZW4vMujp0R3ob1NQAN8plFat+hssm1L/HsfxAL31PfD+k3j6/75fL6U/ic
 KkQZdl7hWZfWb9aMC/qLnd0/ZaqvmEMX8AQI+zgCmlVlDQU9jyNMBditLLQY4Pa+pLzC
 u4FNuOMNjSgYGdhJOUF1kD3aN6zzy9rnaCuSKHFJM6a8kqDjJmOkMIKify5uInRNOoIW
 uZpqlIsKRHjzUBUEvAcLbLAYBjMWsSpJh4v+GZJcSi4TCNoOEbbRzwBLXOfLra34K8E/
 b8hVtx6+JWxUJD+QLGIPCqwlMfX324hUL3fcucWgD8LUr/6L0exGpDmqSTsgUXYS+uID
 wUaw==
X-Gm-Message-State: APjAAAWqWyVD0pIgeBQMpYptlIb8pvXr5sDIgvq4y6TIhMd3LnhdJezc
 MuSikccklnPqdrljhwKFm9Fe1kOyhZU=
X-Google-Smtp-Source: APXvYqwS/gyGWnLgwiCKoLpnsqsvIIEtC7l33SZmkqMP5+G/wQFkMyYpqhPiOfxIXhlPj9zt4LbYRA==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr110506275wmu.137.1564562175553; 
 Wed, 31 Jul 2019 01:36:15 -0700 (PDT)
Received: from andymacbookpro.lan ([146.87.63.139])
 by smtp.gmail.com with ESMTPSA id w14sm53789449wrk.44.2019.07.31.01.36.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 01:36:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Andrew Davison <andy@dvsn.net>
In-Reply-To: <s5hwoge9ifo.wl-tiwai@suse.de>
Date: Wed, 31 Jul 2019 09:36:13 +0100
Message-Id: <4EDB552A-AE60-4270-8CE2-33A3CE1F4F5D@dvsn.net>
References: <CAPk8ziH=P8ST6Ao54NycgiZePDr=T0+L6uVxA=c+pvhjZZCbPA@mail.gmail.com>
 <s5hwoge9ifo.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:41 +0200
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Patch Update for OpenFrame Sigmatel STAC9202
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

SGkgVGFrYXNoaSwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVzcG9uc2UuIFdl4oCZ
dmUgbWFuYWdlZCB0byB1c2UgdGhpcyBjb25maWd1cmF0aW9uIHZpYSBoZGEtamFjay1yZXRhc2s6
CgpbY29kZWNdCjB4ODM4NDc2MzIgMHgwMDAwMDEwMCAwCgpbcGluY2ZnXQoweDA3IDB4MDFjNWUx
NTAKMHgwOCAweDAxNDUxMTMwCjB4MGEgMHg5MDE3MDE1MAoweDBiIDB4MDJhMTkwMjAKMHgwYyAw
eDAxODEzMDIxCjB4MGQgMHgwMzIxNDAzZgoweDEwIDB4NTAwNzAxZjAKMHgxMSAweDkwMzMwMTIy
CjB4MTUgMHg1MGEwMDFmMQoKVGhpcyBjb3JyZWN0cyB0aGUgYmVoYXZpb3VyIG9mIHRoZSBIUCBk
ZXRlY3Rpb24gYW5kIG11dGVzIChhbmQgdW5tdXRlcykgdGhlIGNvcnJlY3Qgb3V0cHV0cywgYnV0
IGxlYXZlcyB1cyB3aXRoIGEgY3JhY2tsaW5nIHNvdW5kIGZyb20gdGhlIGludGVybmFsIHNwZWFr
ZXJzIHdoaWNoIHNvdW5kcyBsaWtlIHN5c3RlbSBpbnRlcmZlcmVuY2Ugbm9pc2UuIEl04oCZcyBh
cyBpZiBzb21ldGhpbmcgaGFzIGJlZW4gbGVmdCBmbG9hdGluZyBhbmQgdGhlIGFtcGxpZmljYXRp
b24gZm9yIHRoZSBpbnRlcm5hbCBzcGVha2VycyBoYXMgbm90IGJlZW4gc2h1dCBvZmYuIEnigJlt
IG1ha2luZyB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgMHhmZmJj
MDEwMCB5b3UgbWVudGlvbi4KCldoYXQgd291bGQgYmUgb3VyIG5leHQgY291cnNlIG9mIGFjdGlv
biB0byBjb3JyZWN0IHRoZSBjcmFja2xpbmc/CgpUaGFua3MgYWdhaW4sCgogICAgIEFuZHkuCgoK
Cj4gT24gMTkgSnVsIDIwMTksIGF0IDE2OjAyLCBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+
IHdyb3RlOgo+IAo+IE9uIFdlZCwgMTkgSnVuIDIwMTkgMTQ6MjU6MzcgKzAyMDAsCj4gQW5keSBE
YXZpc29uIHdyb3RlOgo+PiAKPj4gSGkgYWxsLAo+PiAKPj4gV291bGQgYW55Ym9keSBvbiB0aGlz
IGxpc3QgaGF2ZSBhIGxpdHRsZSB0aW1lIHRvIGludmVzdGlnYXRlIHRoaXMgcGF0Y2ggYW5kCj4+
IGJyaW5nIGl0IHVwIHRvIGRhdGUgZm9yIGFwcGxpY2F0aW9uIGFnYWluc3QgdGhlIGxhdGVzdCA1
LjEga2VybmVsLCBvcgo+PiBpbmRlZWQgYW55dGhpbmcgYmVpbmcgYWN0aXZlbHkgZGV2ZWxvcGVk
Pwo+PiAKPj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vYW5keWR2c24vYzBjMTU5Zjk5YmYxOWQ1
YjMwYjVlNWUxNTZkY2FjM2UKPj4gCj4+IFRoaXMgYXBwbGllcyBjb3JyZWN0bHkgYWdhaW5zdCB0
aGUgMi42LjMzIGtlcm5lbCwgYnV0IEkgSSBsYWNrIHRoZQo+PiBuZWNlc3NhcnkgQUxTQSBrbm93
bGVkZ2UgYW5kIHByb2dyYW1taW5nIHNraWxscyB0byBtYWtlIHRoZSBhcHByb3ByaWF0ZQo+PiBj
b3JyZWN0aW9ucyBmb3IgYW55dGhpbmcgbW9yZSByZWNlbnQuCj4+IAo+PiBBbHRlcm5hdGl2ZWx5
LCBhbnkgb3RoZXIgYWR2aWNlIG9uIHdoZXJlIEkgY291bGQgc2VlayBoZWxwIHdpdGggdGhpcyB3
b3VsZAo+PiBiZSBtdWNoIGFwcHJlY2lhdGVkLiBJdCBpcyB0aGUgb25seSBvdXRzdGFuZGluZyBr
ZXJuZWwgaXNzdWUgZm9yIHRoaXMKPj4gZGV2aWNlIGFuZCB3b3VsZCBsb3ZlIHRvIGhhdmUgaXQg
Zml4ZWQuCj4gCj4gT2ggd2VsbCwgdGhhdCdzIGEgcGF0Y2ggYWdhaW5zdCB0aGUgcHJldHR5IG9s
ZCBjb2RlIGJhc2UuLi4KPiAKPiBGaXJzdCBvZiBhbGwsIHlvdSBuZWVkIHRvIGlkZW50aWZ5IHdo
aWNoIGNoYW5nZXMgYXJlIG1pc3NpbmcuCj4gQmFzaWNhbGx5IHlvdXIgcGF0Y2ggZG9lczoKPiAt
IFRoZSBwaW4gY29uZmlndXJhdGlvbiBvdmVycmlkZSAob3BlbnBlYWs5MjAyX3Bpbl9jb25maWdz
W10pCj4gLSBHUElPIHBpbiAjMCAobmVlZHMgY2xlYXI/KQo+IAo+IEJvdGggY291bGQgYmUgZG9u
ZSBldmVuIHdpdGhvdXQgcGF0Y2hpbmcgdGhlIGtlcm5lbC4gIEknZCBzdGFydCBqdXN0Cj4gc2V0
dGluZyB1cCB0aGUgcGluIGNvbmZpZ3MgYW5kIGFkanVzdCBHUElPIG1hbnVhbGx5IHZpYSBoZGEt
dmVyYiB0bwo+IHNlZSB3aGF0IGFjdHVhbGx5IGl0IGRvZXMuCj4gCj4gQSB0cmlja3kgcGFydCBp
cyB0aGUgc3RyYW5nZSBjb2RlIHRoYXQgaXMgcGVla2luZyB0aGUgMHhmZmJjMDEwMAo+IGFkZHJl
c3MuICBJIGRvbid0IGtub3cgZXhhY3RseSB3aGF0IGl0IGRldGVjdHMsIGJ1dCBzb21lIHBpbiBj
b25maWdzCj4gYXJlIGNoYW5nZWQgYWNjb3JkaW5nIHRvIHRoZSB2YWx1ZSByZWFkIHRoZXJlLiAg
VGhpcyBjYW4ndCBiZQo+IGltcGxlbWVudGVkIGluIHRoZSB1cHN0cmVhbSBjb2RlIGluIHRoYXQg
d2F5LCBidXQgd2UgbWF5IHByb3ZpZGUgdHdvCj4gZGlmZmVyZW50IG1vZGVscyBzbyB0aGF0IHVz
ZXIgY2FuIHNpbXBseSBjaG9vc2UsIGZvciBleGFtcGxlLgo+IAo+IAo+IFRha2FzaGkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
