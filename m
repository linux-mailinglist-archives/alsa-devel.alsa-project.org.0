Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA466742
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 08:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1A81669;
	Fri, 12 Jul 2019 08:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1A81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562914306;
	bh=GrhiVyGWjxmKOe4VuAJddwdISKoPGDNZyoWOtU62uiQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CX5Jm4VYr7EOkyMVJ/xtWBATj9vZM82FPXfpBv19jLVLX28QtD7a8ltpbZ7I93e8O
	 n4JxkR5VXJ+DzjmaM+zKT1oFnlq5cCh6Nkmrf9xYDcPPITH6h/KDM07KxgETMNWEXf
	 aZLhgqQ31b8OJblIGfF+0ysHFIbvdZuqss9Fmaa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B73F802A0;
	Fri, 12 Jul 2019 08:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89741F802A0; Fri, 12 Jul 2019 08:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AA0F800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 08:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AA0F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vGQqyIOY"
Received: by mail-wr1-x444.google.com with SMTP id y4so8733811wrm.2
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w6KPAYksxry2lo97mu+mH03EQf9/7RwkqOjl8tWuMxI=;
 b=vGQqyIOYW6Rlo4rVs+kRcFn9u6+ZS4vdJ6ZkOE8f/B77WWwe8kVO7L8OdP1GFUe/0u
 OWB/YsaMmMYPjzEYVcaJrhcuakXj0FvMM9xyzUmp/HPuYqhnm9rLBEYL6JP32YqaGtMJ
 IqBxSDu+W9f7sY2Seim4gAaEMDg2Ni0HCZBbYpwNkmLR2tiXbZf5ZRSAnx9ZXbN1pCYp
 rFyIJXp98rV2uXxitAuNiJxKfAMP5M5giB4vQ1CXJ4gPHnZFYKDPzpgOJeaW/ETFDeC8
 XDA5afB5B46hWUvyYcgVhcri5S3DGPPDPwXXNhVwXouDLqPD4GJ9MoNQz5EFwKYQY2RZ
 wpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w6KPAYksxry2lo97mu+mH03EQf9/7RwkqOjl8tWuMxI=;
 b=IQF3p3CepzmNhsPWswDPOQyhSvHxA4ct97GZZo5ftKUDT2GgAbRhT7ibIWDgIeAspm
 bgHFcZjkxn0LE4/E05O1gduI2ES6za3FgIAm0WLePCdfuZr2a5fwBgx6B2G/t3UNvzBd
 zkVzIflDmFHFxgkdS2MShq83K1XKpvOMySXMh8wB21KOvakRF05UrENgIKLGz5Ge3mpc
 iJ0NoOxGnusQUOzCYeEBFPVBX1YRcy3MNtucaGA2Iyzs7exKsVh9xiGb32soac6c51Jc
 7KNCsxQ754SdIElIyzton0sGQyY5aqjfLb0V0v/ppVYMtglM17BbubFgMOU4Ajdi/oHW
 VrYA==
X-Gm-Message-State: APjAAAUojgRNoOeOvxTI3EXihvdVS2HK6XRUWgKrRAndR7qADagivMdx
 xlBMlb4D+BdctdXc+W5cBhNWzBg+jxJg4WgQzsI=
X-Google-Smtp-Source: APXvYqzwV5M4NVozHcXw2QN+ZU9f+VdbqB5VH1mWvvZTlW9KmPIiiRAkpJL4y9FrVgpw5szQIQWVZJbSZ724oKANrls=
X-Received: by 2002:adf:db46:: with SMTP id f6mr9560509wrj.212.1562914195286; 
 Thu, 11 Jul 2019 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZB2SnyzdZw_qEn+gofDi293m2d8nq5gmMBkyn52v2GRkw@mail.gmail.com>
 <87o9205d2n.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o9205d2n.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Jul 2019 09:49:43 +0300
Message-ID: <CAEnQRZCEJUJiYpFfU+3BRGLqerONtdMGYDhmzWTJ3hjU6XifQg@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] How to treat old style platform components
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

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMzoxMSBBTSBLdW5pbm9yaSBNb3JpbW90bwo8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4KPiBIaSBEYW5pZWwKPgo+IFRo
YW5rIHlvdSBmb3IgY29udGFjdGluZyBtZQo+Cj4gPiBzdGF0aWMgc3RydWN0IHNuZF9zb2NfY29t
cG9uZW50X2RyaXZlciBpbXhfc29jX3BsYXRmb3JtID0gewo+ID4gLm9wc8K7ICAgwrsgICAgICAg
PSAmaW14X3BjbV9vcHMsCj4gPiAgLnBjbV9uZXfCuyAgICAgICA9IGlteF9wY21fbmV3LAo+ID4g
fTsKPiA+Cj4gPiBUaGVuIHNvbWV3aGVyZSBpbiB0aGUgREFJIGRyaXZlciB3ZSBjYWxsOgo+ID4K
PiA+IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQoZGV2LCAmaW14X3NvY19wbGF0Zm9y
bSwgTlVMTCwgMCk7Cj4gPgo+ID4gSSdtIHVzaW5nIHNpbXBsZS1jYXJkIHdpdGggdGhlIGZvbGxv
d2luZyBjb25maWd1cmF0aW9uOgo+ID4KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tZXZrLmR0cyNuNDEKPiA+Cj4gPiBBZnRlciBsYXRlc3Qg
Y2hhbmdlcyBpdCBzZWVtcyB0aGF0IGlteF9wY21fb3BzLT5vcGVuKCkgZnVuY3Rpb24gaXMgbm8K
PiA+IGxvbmdlciBjYWxsZWQuCj4KPiBRdWljayBxdWVzdGlvbgo+IGFib3ZlICJpbXhfc29jX3Bs
YXRmb3JtIiBhbmQgRFQncyAic2FpMyIgYXJlIGltcGxlbWVudGVkIGF0IHNhbWUgZHJpdmVyID8K
PgoKWWVzLCB0aGFua3MhIFdpdGggYmVsb3cgcGF0Y2ggZXZlcnl0aGluZyB3b3JrcyBhZ2Fpbi4K
Cj4gSWYgc28sIEkgZ3Vlc3MgeW91ciBrZXJuZWwgZG9lc24ndCBoYXZlIHRoaXMgY29tbWl0ID8K
PiBJZiBub3QsIHBsZWFzZSBpbmNsdWRlIGl0Lgo+Cj4gICAgICAgICA5ZjNlYjkxNzUzNDUxMWYy
ZTI3NWI3Y2Y2M2VkNzYzNzRhZGU3N2JjCj4gICAgICAgICAoIkFTb0M6IHNpbXBsZS1jYXJkLXV0
aWxzOiBjb25zaWRlciBDUFUtUGxhdGZvcm0gcG9zc2liaWxpdHkiKQo+Cj4gU29ycnkgdG8gYm90
aGVyIHlvdS4KClRoYW5rcyEhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
