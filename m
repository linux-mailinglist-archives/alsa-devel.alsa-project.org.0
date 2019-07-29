Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F778665
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 09:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4451837;
	Mon, 29 Jul 2019 09:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4451837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564385682;
	bh=ZraSbWkwI315SesynPYsgudujzS96xMxaNeLqIEw4EU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWJ7JvfDclB/KX06z+ga0azJifbDTv2l6fy4NcJfH18UFz+Icljan3iHo/Lzad3ZW
	 Mqw9s9jpztyc60uOy/EyRtE5aQxuQ9m5gnGP/CzjGUqvcWVN/9W926bnDO9hBIsZ4B
	 slugQ7jdroKe48eOAyg+W1ECU0KM9kLPgUshvK4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 632B7F803D5;
	Mon, 29 Jul 2019 09:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE6FF8048D; Mon, 29 Jul 2019 09:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89E9AF800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 09:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E9AF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZurmccrS"
Received: by mail-ot1-x331.google.com with SMTP id o101so61560307ota.8
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 00:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKhIGJI/6Y0ysHbVS7yLjJ/u4nNwsIHSeL/uNUOXA20=;
 b=ZurmccrSP7o37KAKtr+lrJobDjQfYXDVFTBvv5x15yxre49GT1ORpBxFDcBzbOaXOQ
 eXgrMLxkIAKYOleUvOIxpuFSDXFzwPTDPbR6iP6BmfvWG7153wylgr/5Re73uLg0dy0S
 ZIx0MLLCH7sW5sSnkdsi/4D9sLE93IexQ9WjDlCCZ7cot5R7nN2rYSI5Y3htSpb2jarl
 3+tqVUBuGmVsZQPuqoTfkMvYBBfVVFnADv3jjWVHQApMzX9Nn7+RtSyhWqtibK5HnFoy
 Xm3wikiQBL2amrXq7aBF0u0RE5JutPM7z+BfrXKjc2+xtwP09Z7dSda6pH32qBV7b2v7
 mL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKhIGJI/6Y0ysHbVS7yLjJ/u4nNwsIHSeL/uNUOXA20=;
 b=jorfZADgybfR2WLv+/7xc/YLU4HfCfz1BwFg/41acLNbbFSPtEdsLeQj8qOTWR4Cmg
 0QddVVid0shEm0QhJJpPFdhdGQ9E74+Lhorc1euZHoI9pGz4iQ5hqROla2YawA0CNf/H
 kjqapUFyme1pEL6s2DRO5ZsC4aaHg5lCF772dZ3PlKeN92E8488vqa+4kICNUvnmMQ7g
 mE2fertM3IFnrhhN4I+D9M7GbiUlcu7qNLv3cd0pLqBQy2KiDg5pp1XRDxwwRiJR7C/4
 lIMHO93/oBWxE1bUdQm85FeedE77xK8mDZQybxXtG0oHy5vAE/XU130Ad3g7Z26FR3RQ
 yn/g==
X-Gm-Message-State: APjAAAWTyP51LCr+VJAstnFaS9F89Od7/gIo8Ufc9Gv4heMgHV73ewVX
 RzEC/3V91SpcjrXPJJHgsueqcUXVpWN3vvoCeVmUc+az
X-Google-Smtp-Source: APXvYqzNNT6iwkK5svEr5JPGH98YXG1cnGi5McYUISpqtNbEM6dv5hsMSYtOC0cMZlqtqLj9s11Uuft/c/zOQhhUwQU=
X-Received: by 2002:a9d:6a19:: with SMTP id g25mr86082091otn.77.1564385570422; 
 Mon, 29 Jul 2019 00:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAC0dki4GtTUbEBEuVVo0AynfRW13CdAFzc_m6Ss1POq2E3Q7bQ@mail.gmail.com>
 <b2634d02-1f09-fb4e-9674-c7932d0b8bc8@perex.cz>
In-Reply-To: <b2634d02-1f09-fb4e-9674-c7932d0b8bc8@perex.cz>
From: eleven xiang <eleven.xiang@gmail.com>
Date: Mon, 29 Jul 2019 15:32:39 +0800
Message-ID: <CAC0dki5U=e8caLhy+wrRU3Rs6m3qLnBOaOh2t+NvUtJ49+oDQw@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [alsa-lib][v1.1.19][pcm][multi plug] multi plug
 stuck in busy loop which caused high cpu loading.
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

RGVhciBKYXJvc2xhdiwKClNvIGdsYWQgdG8gcmVhZCB5b3VyIG1haWwgfgoKSSBoYXZlIHJlYWQg
dGhlIG11bHRpIHBsdWcgcGNtJ3MKKnNuZF9wY21fbXVsdGlfbWF5X3dhaXRfZm9yX2F2YWlsX21p
biooKSBmdW5jdGlvbiwKZnJvbSB5b3VyIHJlcGx5LCB0aGlzIGZ1bmN0aW9uIHdpbGwgd2FpdCBm
b3IgYXZhaWxfbWluIHJlYWR5ID8KCmFuZCBmcm9tIHRoZSBkZXRhaWwgaW1wbGVtZW50YXRpb24s
IG11bHRpIHBjbSdzCipzbmRfcGNtX211bHRpX21heV93YWl0X2Zvcl9hdmFpbF9taW4qKCkgIHdp
bGwgY2FsbCBlYWNoIHBjbSdzCiptYXlfd2FpdF9mb3JfYXZhaWxfbWluKiBmdW5jdGlvbi4KQW5k
IGhlcmUgaXMgdGhlIHByb2JsZW0sIHRoZSBoYXJkd2FyZSBwY21faHcgZGV2aWNlIGRpZG4ndCBp
bXBsZW1lbnQgdGhpcwppbnRlcmZhY2UsIHNvIGl0IHdpbGwgbm90IHdhaXQsIGp1c3Qgc2tpcCBp
dC4KCmFzIGZvciB3aHkgc25kX3BjbV93YWl0KCkgZG9lcyBub3Qgd2FpdCBldmVuIHdoZW4gYXZp
bD09MCwgd2UgZm91bmQgYmVsb3cKY29kZToKCiovLyBzbmRfcGNtX3dhaXQoKSBvbmx5IHBvbGwg
bWFzdGVyIHNsYXZlIGZkLioKc3RhdGljIGludCBzbmRfcGNtX211bHRpX3BvbGxfZGVzY3JpcHRv
cnNfY291bnQoc25kX3BjbV90ICpwY20pCnsKICAgIHNuZF9wY21fbXVsdGlfdCAqbXVsdGkgPSBw
Y20tPnByaXZhdGVfZGF0YTsKICAgIHNuZF9wY21fdCAqKnNsYXZlXzAqID0gbXVsdGktPnNsYXZl
c1ttdWx0aS0+bWFzdGVyX3NsYXZlXS5wY207CiAgICByZXR1cm4gc25kX3BjbV9wb2xsX2Rlc2Ny
aXB0b3JzX2NvdW50KCpzbGF2ZV8wKik7ICAqLy8gb25seSBjaGVjawptYXN0ZXIgc2xhdmUgcGNt
ID8/Kgp9CgpiYWNrIHRvIG91ciBpc3N1ZSwgdGhlIG1hc3RlciBzbGF2ZSB3YXMgcmVhZHkgdG8g
cmVhZCwgYnV0IHRoZSBzZWNvbmQgc2xhdmUKcGNtIHdhc24nIHQgcmVhZHksCnNvIHNuZF9wY21f
d2FpdCgpIHdpbGwgcmV0dXJuIGltbWVkaWF0ZWx5IGR1ZSB0byBtYXN0ZXIgc2xhdmUgcmVhZHku
CgpUaGFua3MKCkphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+IOS6jjIwMTnlubQ35pyI
Mjfml6Xlkajlha0g5LiL5Y2INTozOOWGmemBk++8mgoKPiBEbmUgMjUuIDA3LiAxOSB2IDExOjU5
IGVsZXZlbiB4aWFuZyBuYXBzYWwoYSk6Cj4gPiBEZWFyLAo+ID4KPiA+IEN1cnJlbnRseSwgZm9y
IEF1ZGlvIEVjaG8gQ2FuY2VsbGF0aW9uIHByb2Nlc3MsIHdlIGNvbWJpbmVkIGJvdGggbWljCj4g
c2lnbmFsCj4gPiBhbmQgcmVmZXJlbmNlIHNpZ25hbCBpbnRvIG9uZSBwY20gd2l0aCB0aGUgbXVs
dGkgcGx1Zy4KPiA+IEFuZCBib3RoIHRoZSBtaWMgYW5kIHJlZiBzaWduYWwgYXJlIGh3IHBjbSBk
ZXZpY2VzLCBhbmQgdGhleSBsaXZlZCBpbiB0aGUKPiA+IHNhbWUgc291bmQgY2FyZCBpbiBkcml2
ZXIuCj4gPgo+ID4gSGVyZSBpcyB0aGUgaXNzdWU6Cj4gPgo+ID4gMS4gdGhlIG1hc3RlciBzbGF2
ZSBwY20gZGV2aWNlIGlzIGFscmVhZHkgZm9yIHJlYWQ7Cj4gPiAyLiB0aGUgc2Vjb25kIHNhbHZl
IHBjbSBpcyBub3QgcmVhZHkgZm9yIHJlYWQsIHdoaWNoIG1lYW5zIG5vIGRhdGE7Cj4gPiAzLiB1
bmRlciB0aGlzIHNpdHVhdGlvbiwgc25kX3BjbV9yZWFkX2FyZWFzIGZ1bmN0aW9uIHdpbGwgYmUg
c3R1Y2sgaW4KPiBidXN5Cj4gPiBsb29wIGFzIGJlbG93Ogo+ID4KPiA+ICAgICAgICAgYXZhaWwg
PSBzbmRfcGNtX2F2YWlsX3VwZGF0ZShwY20pOyAqIC8vIGhlcmUgYWx3YXlzIHJldHVybgo+IGF2
YWlsPTAsCj4gPiBkdWUgdG8gdGhlIHNlY29uZCBzYWx2ZSBwY20gZGV2aWNlIHdhc24ndCByZWFk
eSoKPiA+ICAgICAgICAgaWYgKGF2YWlsIDwgMCkgewo+ID4gICAgICAgICAgICAgZXJyID0gYXZh
aWw7Cj4gPiAgICAgICAgICAgICBnb3RvIF9lbmQ7Cj4gPiAgICAgICAgIH0KPiA+ICAgICAgICAg
aWYgKGF2YWlsID09IDApIHsKPiA+ICAgICAgICAgICAgIGlmIChzdGF0ZSA9PSBTTkRfUENNX1NU
QVRFX0RSQUlOSU5HKQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gX2VuZDsKPiA+ICAgICAgICAg
ICAgIGlmIChwY20tPm1vZGUgJiBTTkRfUENNX05PTkJMT0NLKSB7Cj4gPiAgICAgICAgICAgICAg
ICAgZXJyID0gLUVBR0FJTjsKPiA+ICAgICAgICAgICAgICAgICBnb3RvIF9lbmQ7Cj4gPiAgICAg
ICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgZXJyID0gc25kX3BjbV93YWl0KHBjbSwgLTEp
OyAqIC8vIHJldHVybiBpbW1lZGlhdGVseSwgZHVlIHRvCj4gPiB0aGUgbWFzdGVyIHNsYXZlIHBj
bSB3YXMgcmVhZHkgZm9yIHJlYWQuKgo+ID4gICAgICAgICAgICAgaWYgKGVyciA8IDApCj4gPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAgICBnb3RvIF9hZ2FpbjsgKi8vIHN0
dWNrIGluIGJ1c3kgbG9vcCAhISBhZ2FpbiBhbmQgYWdhaW4gdW50aWwKPiA+IHRoZSBzZWNvbmQg
cGNtIGRhdGEgd2FzIHJlYWR5ICEhISoKPiA+Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiBpdCBzZWVt
ZWQgdGhhdCB0aGUgcm9vdCBjYXVzZSBpcyB0aGF0IHRoZSB0d28gZGV2aWNlcyBoYXZlIG9idmlv
dXMKPiA+IGludGVycnVwdCBwZXJpb2QgZ2FwICwgYW5kIHdlIGFsc28gZm91bmQgdGhhdCB0aGlz
IGlzc3VlIGNhbiBiZSBlYXNpbHkKPiA+IHJlcHJvZHVjZWQgb24gb3VyIGRldmljZSB1bmRlciBs
b3cgbWVtb3J5IGNhc2UuCj4gPgo+ID4gQ3VycmVudGx5IHdlIG1vbml0b3IgdGhpcyBnYXAgYW5k
IHJldHVybiBlcnJvciB0byB1cCBsYXllciB0bwo+ID4gY2xvc2UtYW5kLXJlb3BlbiBkZXZpY2Ug
dG8gZml4IHRoaXMgaXNzdWUuCj4gPiBTbyBJIHdvbmRlciBpZiB0aGVyZSBpcyBhbnkgZ29vZCBz
b2x1dGlvbiA/Cj4KPiBJIHRyaWVkIHRvIHJlc29sdmUgdGhpcyBzeW5jIGluIG15IGxhdGVzdCBw
Y21fbXVsdGkgdXBkYXRlcyAoYWxsIGFyZSBpbgo+IDEuMS45Cj4gYWxyZWFkeSkuIENvdWxkIHlv
dSB0cmFjZSwgd2h5IHNuZF9wY21fd2FpdCgpIGRvZXMgbm90IHJlYWxseSB3YWl0IGZvciB0aGUK
PiBzbGF2ZSB3aGVuIGF2YWlsID09IDA/IFRoZXJlIHNob3VsZCBub3QgYmUgdGhlIGJ1c3kgbG9v
cC4gVGhlCj4gc25kX3BjbV9tdWx0aV9tYXlfd2FpdF9mb3JfYXZhaWxfbWluKCkgY2FsbGJhY2sg
c2hvdWxkIGJlIGNhbGxlZCBpbnNpZGUgdGhlCj4gbXVsdGkgcGx1Z2luLgo+Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBKYXJvc2xhdgo+Cj4gLS0KPiBKYXJvc2xhdiBLeXNlbGEg
PHBlcmV4QHBlcmV4LmN6Pgo+IExpbnV4IFNvdW5kIE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsg
UmVkIEhhdCwgSW5jLgo+CgoKLS0gCkJSLAoKZWxldmVuX3hpYW5nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
