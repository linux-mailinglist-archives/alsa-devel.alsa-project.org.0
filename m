Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F0D4A23
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 23:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505961671;
	Fri, 11 Oct 2019 23:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505961671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570831138;
	bh=mtJjBEoNSFixpx+/ooKafbphFWUK3Xh0DphOZoUxIyQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXwMvGjot+TguHisPOAbJUK2/H0ODav4v6rWnCeKGrYeLM8ftb9tC2pCD5wqeDLHG
	 FEEghjZdPPS2ldSTIDfV+cVgDYRG/e/p6M98dCGd0BgD4K4uc4XNc+5e2dhtOHigi/
	 Y218Elp82FlxtceMRlHicR9w1yZbK+baWbS4TAVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD349F802DF;
	Fri, 11 Oct 2019 23:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BF3F802BE; Fri, 11 Oct 2019 23:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B71F8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 23:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B71F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="PitfJ/xB"
Received: by mail-yb1-xb34.google.com with SMTP id r68so3579872ybf.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 14:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ZEn+HxsNkJ8Ya2WpjYSzNbsBt01GEUsD9GVZ4B1LGw=;
 b=PitfJ/xB2jKltd4EESpXZ+DS3R15o5WtZJmx1RWIZwMlYO+MQbcLtvM2x/blWZLD+a
 rB9yN4EBdUsYDeixq/zGs815pNJI3KHKp1zKsyktKG04mOmGOZf1uE/zX+fehhMUSw7+
 jqOc4M8OQhpRSKchOxcJ1PT8rLfYvFwBnRjuMmGOrVcdi3Hd//Edz+fbwTSQGq3zA0+H
 t4eKwyXkYSeJgWe2/c01AHs+lFXrvy2vqWMdjwYPtVsSQpZY4jaMC9zDhvCGu3XET7Cs
 M8AY3eroxtHHaJLCZGesnW/X7bMM5vdUOivsXZlxZqATNHuQZxvHvU+4LGWZBlmKlZGp
 9TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZEn+HxsNkJ8Ya2WpjYSzNbsBt01GEUsD9GVZ4B1LGw=;
 b=BAbEmgjfscs8X5Do6/4Y819gBJV2i1u/54jRUmXnQ7hk/Bn1wlOuXplB0FZ153RhxN
 fFDuoMwsug1E5OBo2IKegPAU+EDFgvDpBmxvqpj92S5OUMG3wUZnoM+c1Ynr9Q9N7lR7
 cvHMQPpP0o8Qm6ByDamy85TQiyDUt1nr4uI5TUR0upThrTaZx0+89MjWXA/WX2c8AZHc
 sIDiOO2EIdR92si1lBTwmV1tQlaTAx0W0Nmh9LYVcYySrL8rBGXwIeUc0TyT4/3NlB85
 adrWLYmyVCwznds9+Jm1boTKNHPerLWpMzKjINCJninW7tNDFN3jqryAf00Or0vUeLJJ
 Ju8Q==
X-Gm-Message-State: APjAAAVVHqH+Ms+ZucFMqM4S7ri1XOHGEbS1pOOKkMK2RRJ4jNsA6xe9
 P0P5bRYwdb6oi2Ruibq0NK+dB8+8oU8GuCy/RQdQSQ==
X-Google-Smtp-Source: APXvYqwrCpR0OLE1jJfcdWXKX+y+WWqvQPnqvPIL0+0UfQyvUqfBxWNodE4oW9l5OP/SLNjCEspbgg0b12oPbKVA95k=
X-Received: by 2002:a25:5f43:: with SMTP id h3mr11296746ybm.278.1570831025895; 
 Fri, 11 Oct 2019 14:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZAen_Aa7SMdnPY4ezzbYtUypShto7ENGV_FhnsNhnxmBQ@mail.gmail.com>
In-Reply-To: <CAEnQRZAen_Aa7SMdnPY4ezzbYtUypShto7ENGV_FhnsNhnxmBQ@mail.gmail.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 11 Oct 2019 14:56:54 -0700
Message-ID: <CAFQqKeV+Q0vrHZDMniteEratq09p50CpQHHygJJLvCe+zSHA3Q@mail.gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] Question about FE & BE DPCM
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMjowNSBQTSBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFs
dXRhQGdtYWlsLmNvbT4Kd3JvdGU6Cgo+IEhpIE1vcmltb3RvLXNhbiwKPgo+IEknbSByZWFsbHkg
Y29uZnVzZWQgb24gd2hhdCBleGFjdGx5IGlzIEZyb250IEVuZCBhbmQgQmFjayBFbmQuCj4KPiBJ
cyBGRSBhIERBSSBvciBhIERBSSBsaW5rIG9yIHBhcnQgb2YgYSBEQUkgbGluaz8KPgo+IEluIHNp
bXBsZS1jYXJkLmMgdGhlcmUgaXMgc2ltcGxlX2RhaV9saW5rX29mX2RwY20gZnVuY3Rpb246Cj4K
PiBzdHJ1Y3Qgc25kX3NvY19kYWlfbGlua19jb21wb25lbnQgKmNvZGVjcyA9IGRhaV9saW5rLT5j
b2RlY3M7Cj4KPiDCuyAgICAgICAvKiBCRSBpcyBkdW1teSAqLwo+IMK7ICAgICAgIMK7ICAgICAg
IGNvZGVjcy0+b2Zfbm9kZcK7wrsgICAgICAgPSBOVUxMOwo+IMK7ICAgICAgIMK7ICAgICAgIGNv
ZGVjcy0+ZGFpX25hbWXCuyAgICAgICA9ICJzbmQtc29jLWR1bW15LWRhaSI7Cj4gwrsgICAgICAg
wrsgICAgICAgY29kZWNzLT5uYW1lwrsgICDCuyAgICAgICA9ICJzbmQtc29jLWR1bW15IjsKPgo+
IMK7ICAgICAgIMK7ICAgICAgIC8qIEZFIHNldHRpbmdzICovCj4gwrsgICAgICAgwrsgICAgICAg
ZGFpX2xpbmstPmR5bmFtaWPCuyAgICAgIMK7ICAgICAgID0gMTsKPiDCuyAgICAgICDCuyAgICAg
ICBkYWlfbGluay0+ZHBjbV9tZXJnZWRfZm9ybWF0wrsgICA9IDE7Cj4KPiBTbywgZnJvbSBoZXJl
IGl0IGxvb2tzIGxpa2UgQkUvRkUgYXJlIGNvbXBvbmVudHMgYmVpbmcgcGFydCBvZiB0aGUgc2Ft
ZQo+IGxpbmsuCj4KPiBBbm90aGVyIHRoaW5nIGlzOgo+Cj4gYXNvY19zaW1wbGVfY2Fub25pY2Fs
aXplX3BsYXRmb3JtIGZ1bmN0aW9uIHdoZXJlIGl0IGRvZXMgc2F5Ogo+Cj4gwrsgICAgICAgICog
RFBDTSBCRSBjYW4gYmUgbm8gcGxhdGZvcm0uCj4gwrsgICAgICAgICogQWxsb2NlZCBtZW1vcnkg
d2lsbCBiZSB3YXN0ZSwgYnV0IG5vdCBsZWFrLgo+IMK7ICAgICAgICAqLwo+IMK7ICAgICAgIGlm
ICghZGFpX2xpbmstPnBsYXRmb3Jtcy0+b2Zfbm9kZSkKPiDCuyAgICAgICDCuyAgICAgICBkYWlf
bGluay0+bnVtX3BsYXRmb3JtcyA9IDA7Cj4KPiBCdXQgSSBkbyB3YW50IHRvIGNyZWF0ZSBhIEJF
IHdpdGggYSBwbGF0Zm9ybS4gU28sIHNob3VsZCBJIHRyeSB0bwo+IHJldmVydCB0aGUgZm9sbG93
aW5nCj4gcGF0Y2g6Cj4KPiBjb21taXQgNzk0ZmNlZThkYTNjMGM4YTAxYjA4ZWNhZDFjMTgxY2Iw
YTYyMjg2OAo+IEF1dGhvcjogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4
QHJlbmVzYXMuY29tPgo+IERhdGU6ICAgV2VkIEp1bCAxMCAxNzowMToxMiAyMDE5ICswOTAwCj4K
PiAgICAgQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6IGNhcmUgbm8gUGxhdGZvcm0gZm9yIERQQ00K
Pgo+ICAgICBjb21taXQgMzQ2MTQ3Mzk5ODhhZCAoIkFTb0M6IHNvYy1jb3JlOiBzdXBwb3J0IGRh
aV9saW5rIHdpdGgKPiAgICAgcGxhdGZvcm1zX251bSAhPSAxIikgc3VwcG9ydHMgbXVsdGkgUGxh
dGZvcm0sIGFuZAo+ICAgICBjb21taXQgOWYzZWI5MTc1MzQ1MSAoIkFTb0M6IHNpbXBsZS1jYXJk
LXV0aWxzOiBjb25zaWRlciBDUFUtUGxhdGZvcm0KPiAgICAgcG9zc2liaWxpdHkiKSByZW1vdmVk
IG5vIFBsYXRmb3JtIGZyb20gc2ltcGxlLWNhcmQuCj4KPiAgICAgTXVsdGkgUGxhdGZvcm0gaXMg
bm93IGNoZWNraW5nIGJvdGggUGxhdGZvcm0gbmFtZS9vZl9ub2RlIGFyZSBOVUxMCj4gY2FzZS4K
PiAgICAgQnV0IGluIG5vcm1hbCBjYXNlLCBEUENNIGJlIGRvZXNuJ3QgaGF2ZSBQbGF0Zm9ybS4K
Pgo+Cj4KPiBCYXNpY2FsbHksIHdoYXQgSSB3YW50IHRvIGRvIGlzOiBhZnRlciB0aGUgREFJIGxp
bmsgaXMgY3JlYXRlZCB0byBjYWxsOgo+IHNuZF9zb2NfZml4dXBfZGFpX2xpbmtzX3BsYXRmb3Jt
X25hbWUgZnVuY3Rpb24gdG8gc2V0IGEgcHJvcGVyIG5hbWUKPiBmb3IgQkUgcGxhdGZvcm0uCj4K
PiBUaGUgcHJvYmxlbSBpcyB0aGF0IGFib3ZlIG1lbnRpb25lZCBwYXRjaCBzZXRzIGRhaV9saW5r
LT5udW1fcGxhdGZvcm1zID0gMDsKPiBzbyBldmVuIHRoZSBuYW1lIGlzIHNldCB0aGUgcGxhdGZv
cm0gY29tcG9uZW50IGlzIG5vdCBwcm9iZWQuCgoKSGkgRGFuaWVsLApIYXZlIHlvdSBsb29rZWQg
aW50byBob3cgU09GIGRvZXMgaXQgYXQgdGhlIHRpbWUgdGhlIGRhaV9saW5rIGVsZW0gaW4KdG9w
b2xvZ3kgaXMgcGFyc2VkPwpodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9i
bG9iLzVlZGNmZGYzOTA3MzU0ZGU3YTI2MGE0NTFiYTYxMWYyMmM1ZTZhMDcvc291bmQvc29jL3Nv
Zi90b3BvbG9neS5jI0wyOTI2CgpJcyB0aGlzIHdoYXQgeW91IGFyZSBhc2tpbmcgYWJvdXQ/CgpU
aGFua3MsClJhbmphbmkKCj4KPiB0aGFua3MsCj4gRGFuaWVsLgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
