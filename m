Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E5AA1C90
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97E041671;
	Thu, 29 Aug 2019 16:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97E041671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088384;
	bh=QQMuwT0E+GIIn+r+v3E8e4FpTQFv1Z5kv0z9WGz4cns=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BYEaYwC/sqXt65LwTmKUQ2pCMnboVlfuSoGO8X/Lwdi6RWAieGInMJKCCWyFa5tit
	 doK3+NlqbhoRcWR3Utfu/nFaFBi54dUYHrU3YCDrZj6cfgAElYolmmln46V4gOgJw3
	 xK8ylbKdUhxBAEpIb2aTfuG7VUdF8AUJL7AZDKnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DF1F89721;
	Wed, 28 Aug 2019 10:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4167DF89720; Wed, 28 Aug 2019 10:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF43F8038F
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 10:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF43F8038F
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2tGU-0005iM-1A
 for alsa-devel@alsa-project.org; Wed, 28 Aug 2019 08:25:14 +0000
Received: by mail-pf1-f200.google.com with SMTP id v134so1484045pfc.18
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 01:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yDQMhkjBqvMckIaETJ30I1V3/odVpy6UAuG1t5GavCg=;
 b=sHzyoKJgNVmRQkwy20rBisKV8ddL2uuSQ06kNIzpzRljzowEIgI5XizdSG1ewiVz4b
 p0YY6kTwugV67i2Yo5VIZKJXIm5Mw12YiVAOaUqMlD7C+I5I9Vj4epE3hJNu70n4oGD3
 vnxdfGyus6JccjvZs22opT50W/nIMVWzFEVjKYX5QRUOBXIoM524crIXh1YUdYcZwHGU
 hzX1R6F0j7hl6mtcQuyH6IV9a73R+wqpfF/zhSmBBuyJECX7aIQOMsi4gBuNZ75VTYnO
 6ty/bDlthdy7RWH7+zCAJFvg0qYBAWN+oHWrdYXyzb3LUSQsOe0nPONZkqcu38rm20Ab
 Sz1g==
X-Gm-Message-State: APjAAAVZLXqQ0nZP2JLPRB4obfoLWI8CNRv2BW2WZWY5mofoQhA1KkAq
 aO8kUInvRnA5mobjSmVJPacG9Dj+xaGGepf+dAQuQlj8UmP7JUAU7aHoF6nQQM+GXXlh+HHgzoB
 1ED45KKm4IU+j4qxPR8DwU2O9omeytXD/oTT5a65X
X-Received: by 2002:a17:902:6b81:: with SMTP id
 p1mr3053430plk.91.1566980712817; 
 Wed, 28 Aug 2019 01:25:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyg3xPhlxpHv0Jw3q47+NdHNvNzyyatg4MSCzNk9Lkvz07TQuVYjHaH9aQx5W+/tAUeIxm73Q==
X-Received: by 2002:a17:902:6b81:: with SMTP id
 p1mr3053407plk.91.1566980712363; 
 Wed, 28 Aug 2019 01:25:12 -0700 (PDT)
Received: from 2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:f8f8:a260:49a8:d1ed])
 by smtp.gmail.com with ESMTPSA id y9sm1820302pfn.152.2019.08.28.01.25.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 01:25:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190827223125.GB9987@google.com>
Date: Wed, 28 Aug 2019 16:25:08 +0800
Message-Id: <66C43B81-0A08-437F-B099-1C757A42E912@canonical.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <20190827134756.10807-2-kai.heng.feng@canonical.com>
 <20190827223125.GB9987@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgQmpvcm4sCgphdCAwNjozMSwgQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiB3
cm90ZToKCj4gT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDk6NDc6NTZQTSArMDgwMCwgS2FpLUhl
bmcgRmVuZyB3cm90ZToKPj4gSXQncyBhIGNvbW1vbiBwcmFjdGljZSB0byBsZXQgZEdQVSB1bmJv
dW5kIGFuZCB1c2UgUENJIHBvcnQgUE0gdG8KPj4gZGlzYWJsZSBpdHMgcG93ZXIgdGhyb3VnaCBf
UFIzLiBXaGVuIHRoZSBkR1BVIGNvbWVzIHdpdGggYW4gSERBCj4+IGZ1bmN0aW9uLCB0aGUgSERB
IHdvbid0IGJlIHN1c3BlbmRlZCBpZiB0aGUgZEdQVSBpcyB1bmJvdW5kLCBzbyB0aGUgZEdQVQo+
PiBwb3dlciBjYW4ndCBiZSBkaXNhYmxlZC4KPgo+IEp1c3QgYSB0ZXJtaW5vbG9neSBxdWVzdGlv
bjoKPgo+IEkgdGhvdWdodCAidXNpbmcgUENJIHBvcnQgUE0iIG1lYW50IHVzaW5nIHRoZSBQQ0kg
UG93ZXIgTWFuYWdlbWVudAo+IENhcGFiaWxpdHkgaW4gY29uZmlnIHNwYWNlIHRvIGRpcmVjdGx5
IGNoYW5nZSB0aGUgZGV2aWNlJ3MgcG93ZXIKPiBzdGF0ZSwgZS5nLiwgaW4gcGNpX3Jhd19zZXRf
cG93ZXJfc3RhdGUoKS4KCldoYXQgSSBtZWFudCBpcyB0byB1c2UgcGNpZXBvcnQua28gZGlyZWN0
bHkuCgo+Cj4gQW5kIEkgdGhvdWdodCB1c2luZyBfUFMzLCBfUFIzLCBldGMgd291bGQgYmUgcGFy
dCBvZiAicGxhdGZvcm0gcG93ZXIKPiBtYW5hZ2VtZW504oCdPwoKT2ssIHdpbGwgdXBkYXRlIHRo
ZSB3b3JkaW5nLgoKPgo+IEFuZCBBRkFJQ1QsIF9QUjMgbWVyZWx5IHJldHVybnMgYSBsaXN0IG9m
IHBvd2VyIHJlc291cmNlczsgaXQgZG9lc24ndAo+IGRpc2FibGUgcG93ZXIgaXRzZWxmLgoKWWVz
LCB0aHJvdWdoIGl0cyBfUFMzIGFuZCBfT0ZGLiBJ4oCZbGwgdXBkYXRlIHRoZSB3b3JkaW5nLgoK
S2FpLUhlbmcKCj4KPj4gQ29tbWl0IDM3YTNhOThlZjYwMSAoIkFMU0E6IGhkYSAtIEVuYWJsZSBy
dW50aW1lIFBNIG9ubHkgZm9yCj4+IGRpc2NyZXRlIEdQVSIpIG9ubHkgYWxsb3dzIEhEQSB0byBi
ZSBydW50aW1lLXN1c3BlbmRlZCBvbmNlIEdQVSBpcwo+PiBib3VuZCwgdG8ga2VlcCBBUFUncyBI
REEgd29ya2luZy4KPj4KPj4gSG93ZXZlciwgSERBIG9uIGRHUFUgaXNuJ3QgdGhhdCB1c2VmdWwg
aWYgZEdQVSBpcyB1bmJvdW5kLiBTbyBsZXQgcmVsYXgKPj4gdGhlIHJ1bnRpbWUgc3VzcGVuZCBy
ZXF1aXJlbWVudCBmb3IgZEdQVSdzIEhEQSBmdW5jdGlvbiwgdG8gc2F2ZSBsb3RzIG9mCj4+IHBv
d2VyLgo+Pgo+PiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4NDA4
MzUKPj4gU2lnbmVkLW9mZi1ieTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmlj
YWwuY29tPgo+PiAtLS0KPj4gIHNvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgfCAzICsrLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyBiL3NvdW5kL3BjaS9oZGEvaGRhX2lu
dGVsLmMKPj4gaW5kZXggOTlmYzA5MTczMzliLi5kNGVlMDcwZTFhMjkgMTAwNjQ0Cj4+IC0tLSBh
L3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKPj4gKysrIGIvc291bmQvcGNpL2hkYS9oZGFfaW50
ZWwuYwo+PiBAQCAtMTI4NSw3ICsxMjg1LDggQEAgc3RhdGljIHZvaWQgaW5pdF92Z2Ffc3dpdGNo
ZXJvbyhzdHJ1Y3QgYXp4ICpjaGlwKQo+PiAgCQlkZXZfaW5mbyhjaGlwLT5jYXJkLT5kZXYsCj4+
ICAJCQkgIkhhbmRsZSB2Z2Ffc3dpdGNoZXJvbyBhdWRpbyBjbGllbnRcbiIpOwo+PiAgCQloZGEt
PnVzZV92Z2Ffc3dpdGNoZXJvbyA9IDE7Cj4+IC0JCWhkYS0+bmVlZF9lbGRfbm90aWZ5X2xpbmsg
PSAxOyAvKiBjbGVhcmVkIGluIGdwdV9ib3VuZCBvcCAqLwo+PiArCQkvKiBjbGVhcmVkIGluIGdw
dV9ib3VuZCBvcCAqLwo+PiArCQloZGEtPm5lZWRfZWxkX25vdGlmeV9saW5rID0gIXBjaV9wcjNf
cHJlc2VudChwKTsKPj4gIAkJY2hpcC0+ZHJpdmVyX2NhcHMgfD0gQVpYX0RDQVBTX1BNX1JVTlRJ
TUU7Cj4+ICAJCXBjaV9kZXZfcHV0KHApOwo+PiAgCX0KPj4gLS0gCj4+IDIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
