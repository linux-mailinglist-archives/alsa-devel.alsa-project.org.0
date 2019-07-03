Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C35E747
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 17:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23AB016AC;
	Wed,  3 Jul 2019 16:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23AB016AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562166040;
	bh=5UPyfUC2QTKyTAoVyVpseiknZfc+i2GZs8R/5a4w4bo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odpdemvaX6km1vyzsaS/haCCXVGN+N5WAYY9GAX7GoXKzMO9A8cA/RikudsArQlL9
	 vX6TKv/v4ucmsyWBDlFChVcbab1TGbyJ23Qkwr+dZ1q5iIaW9RoHWqh+lxruYVH33h
	 1Oun9O74GSdmbvXKNyOybJutsf5u07Xflz9RPwhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 414B4F800F1;
	Wed,  3 Jul 2019 16:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEF9F800EA; Wed,  3 Jul 2019 16:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E35CDF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 16:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E35CDF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rP81x57R"
Received: by mail-qt1-x841.google.com with SMTP id w17so506638qto.10
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a662vhOsHnFz4Y9zmRoUex7/pczenDh3Ci8ob4LVgWw=;
 b=rP81x57RHiIoDvcKVdfIbI/IQmaDCgy02rwGpu2kDqCq/2Q/CmGgOYVBSDgdPj5NqO
 Q22F551Om9gMJ3buc/dpsYgF056TZqQtazDNTq51WT0Qtr1r3bJm6MegqUoNvoPwl2wA
 IlbGTyBo9mW3MkrKqEc4APDhZjmLkytwqBCS3o1sotAOxt8khT/yv/Rj3HvL3XZEYOXr
 RgkZ7lrtEvSpUe/+Vgr658ndHwH2JwzfGkOgEOZ3v3HlYmkAZdwzvuOuHqkmwb4IF3vh
 moQLKrCoyGtW7tLKbUmL4Bh/Re5kskFzUggF2tZ5SOGdppJDDW/M3iy1kNT7HemDkcMA
 LcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a662vhOsHnFz4Y9zmRoUex7/pczenDh3Ci8ob4LVgWw=;
 b=baWYHj+MY1ynjdTaLmqMv7x/2bxpoBvsSAUpLJjso0SQu8O0bXH1ii4pHHlI2IkJO2
 TGXz/3CR2qs9Az0Gxr6CWDCMm+v0TjXsn1f4/lPeqfdcp7ILjkyoQHrjvuZAepGZcsX9
 Uuoh+pgAhyEfMbTgc5+EHjh7QxiA0zVhqEaF76PLCz5Dhw0dy9h0livmwKfrJjFjIILc
 Hq3jDMvmr4j1wR+MBFxKkfRT7sXbhPmmqPb+PVYyMNW/2oKpmYY2H2HPDno7AEMsScSq
 ALPywk2/pCm05H8gkAx2Azq5BSixX+nLPh3ImCv8kMWfW03bBNg0ndJlgCRPAc/5tgHf
 A68w==
X-Gm-Message-State: APjAAAV1g6RjtviMrMqBeOUomzVX0slbTFNd7EVt2du7XS0LrkZtNSJU
 qt2VcaP3qAmHbs94ruoOCIIp5Qh66gGkM5i74W8=
X-Google-Smtp-Source: APXvYqxuXD87vqmtFZRsgM0sSJGQpOtEVCvP3zGJTMc+/6qxBmr7IWKbLwZaGtgj9SKgfDlnbGfxR2NsASeWpOD5DkE=
X-Received: by 2002:a25:768f:: with SMTP id r137mr12406439ybc.8.1562165928725; 
 Wed, 03 Jul 2019 07:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190703131842.26082-1-huangfq.daxian@gmail.com>
 <547c68b0-f55f-ca1d-c5b3-f6a5f89d93a9@opensource.cirrus.com>
In-Reply-To: <547c68b0-f55f-ca1d-c5b3-f6a5f89d93a9@opensource.cirrus.com>
From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Wed, 3 Jul 2019 22:58:43 +0800
Message-ID: <CABXRUiQH2c5knAxnegNc1J2uyqy3OVU=qEorcZkUtMoJhvb_8Q@mail.gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 30/30] sound/soc: Use kmemdup rather than
	duplicating its implementation
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

T2ssIEkgd2lsbCBzZXBhcmF0ZSB0aGVtIGludG8gdHdvIHBhdGNoZXMgaW4gdGhlIHYyIHBhdGNo
IHNldC4gQWxzbywKdGhlcmUgaXMgYSB0eXBvIGluIHRoZSB2MShtZW1zZXQgc2hvdWxkIGJlIG1l
bWNweSkuCgpSaWNoYXJkIEZpdHpnZXJhbGQgPHJmQG9wZW5zb3VyY2UuY2lycnVzLmNvbT4g5pa8
IDIwMTnlubQ35pyIM+aXpemAseS4iSDkuIvljYg5OjU15a+r6YGT77yaCj4KPiBPbiAwMy8wNy8x
OSAxNDoxOCwgRnVxaWFuIEh1YW5nIHdyb3RlOgo+ID4ga21lbWR1cCBpcyBpbnRyb2R1Y2VkIHRv
IGR1cGxpY2F0ZSBhIHJlZ2lvbiBvZiBtZW1vcnkgaW4gYSBuZWF0IHdheS4KPiA+IFJhdGhlciB0
aGFuIGttYWxsb2Mva3phbGxvYyArIG1lbXNldCwgd2hpY2ggdGhlIHByb2dyYW1tZXIgbmVlZHMg
dG8KPiA+IHdyaXRlIHRoZSBzaXplIHR3aWNlIChzb21ldGltZXMgbGVhZCB0byBtaXN0YWtlcyks
IGttZW1kdXAgaW1wcm92ZXMKPiA+IHJlYWRhYmlsaXR5LCBsZWFkcyB0byBzbWFsbGVyIGNvZGUg
YW5kIGFsc28gcmVkdWNlIHRoZSBjaGFuY2VzIG9mIG1pc3Rha2VzLgo+ID4gU3VnZ2VzdGlvbiB0
byB1c2Uga21lbWR1cCByYXRoZXIgdGhhbiB1c2luZyBrbWFsbG9jL2t6YWxsb2MgKyBtZW1zZXQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICAgc291bmQvc29jL2NvZGVjcy93bTAwMTAuYyAgICAgICAgICAg
ICB8IDQgKy0tLQo+ID4gICBzb3VuZC9zb2MvaW50ZWwvYXRvbS9zc3Qvc3N0X2xvYWRlci5jIHwg
MyArLS0KPgo+IFNob3VsZCBiZSBvbmUgcGF0Y2ggcGVyIGZpbGUgYXMgdGhlIGRyaXZlcnMgYXJl
IG5vdCByZWxhdGVkIHRvIGVhY2gKPiBvdGhlciBhdCBhbGwsIGFuZCBpZiBvbmUgbmVlZGVkIGEg
cmV2ZXJ0IHlvdSBjb3VsZG4ndCByZXZlcnQgdGhpcwo+IHBhdGNoIGJlY2F1c2UgaXQgd291bGQg
cmV2ZXJ0IGJvdGggZHJpdmVycy4KPgo+IEJ1dCBhcGFydCBmcm9tIHRoYXQsIGZvciB3bTAwMTAu
YzoKPiBBY2tlZC1ieTogUmljaGFyZCBGaXR6Z2VyYWxkIDxyZkBvcGVuc291cmNlLmNpcnJ1cy5j
b20+Cj4KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mvd20wMDEwLmMgYi9zb3Vu
ZC9zb2MvY29kZWNzL3dtMDAxMC5jCj4gPiBpbmRleCA3MjdkNjcwM2M5MDUuLjgwNzgyNmYzMGY1
OCAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3Mvd20wMDEwLmMKPiA+ICsrKyBiL3Nv
dW5kL3NvYy9jb2RlY3Mvd20wMDEwLmMKPiA+IEBAIC01MTUsNyArNTE1LDcgQEAgc3RhdGljIGlu
dCB3bTAwMTBfc3RhZ2UyX2xvYWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQp
Cj4gPiAgICAgICBkZXZfZGJnKGNvbXBvbmVudC0+ZGV2LCAiRG93bmxvYWRpbmcgJXp1IGJ5dGUg
c3RhZ2UgMiBsb2FkZXJcbiIsIGZ3LT5zaXplKTsKPiA+Cj4gPiAgICAgICAvKiBDb3B5IHRvIGxv
Y2FsIGJ1ZmZlciBmaXJzdCBhcyB2bWFsbG9jIGNhdXNlcyBwcm9ibGVtcyBmb3IgZG1hICovCj4g
PiAtICAgICBpbWcgPSBremFsbG9jKGZ3LT5zaXplLCBHRlBfS0VSTkVMIHwgR0ZQX0RNQSk7Cj4g
PiArICAgICBpbWcgPSBrbWVtZHVwKCZmdy0+ZGF0YVswXSwgZnctPnNpemUsIEdGUF9LRVJORUwg
fCBHRlBfRE1BKTsKPiA+ICAgICAgIGlmICghaW1nKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9
IC1FTk9NRU07Cj4gPiAgICAgICAgICAgICAgIGdvdG8gYWJvcnQyOwo+ID4gQEAgLTUyNyw4ICs1
MjcsNiBAQCBzdGF0aWMgaW50IHdtMDAxMF9zdGFnZTJfbG9hZChzdHJ1Y3Qgc25kX3NvY19jb21w
b25lbnQgKmNvbXBvbmVudCkKPiA+ICAgICAgICAgICAgICAgZ290byBhYm9ydDE7Cj4gPiAgICAg
ICB9Cj4gPgo+ID4gLSAgICAgbWVtY3B5KGltZywgJmZ3LT5kYXRhWzBdLCBmdy0+c2l6ZSk7Cj4g
PiAtCj4gPiAgICAgICBzcGlfbWVzc2FnZV9pbml0KCZtKTsKPiA+ICAgICAgIG1lbXNldCgmdCwg
MCwgc2l6ZW9mKHQpKTsKPiA+ICAgICAgIHQucnhfYnVmID0gb3V0Owo+ID4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9pbnRlbC9hdG9tL3NzdC9zc3RfbG9hZGVyLmMgYi9zb3VuZC9zb2MvaW50ZWwv
YXRvbS9zc3Qvc3N0X2xvYWRlci5jCj4gPiBpbmRleCBjZTExYzM2ODQ4YzQuLmNjOTVhZjM1YzA2
MCAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9hdG9tL3NzdC9zc3RfbG9hZGVyLmMK
PiA+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9hdG9tL3NzdC9zc3RfbG9hZGVyLmMKPiA+IEBAIC0y
ODgsMTQgKzI4OCwxMyBAQCBzdGF0aWMgaW50IHNzdF9jYWNoZV9hbmRfcGFyc2VfZncoc3RydWN0
IGludGVsX3NzdF9kcnYgKnNzdCwKPiA+ICAgewo+ID4gICAgICAgaW50IHJldHZhbCA9IDA7Cj4g
Pgo+ID4gLSAgICAgc3N0LT5md19pbl9tZW0gPSBremFsbG9jKGZ3LT5zaXplLCBHRlBfS0VSTkVM
KTsKPiA+ICsgICAgIHNzdC0+ZndfaW5fbWVtID0ga21lbWR1cChmdy0+ZGF0YSwgZnctPnNpemUs
IEdGUF9LRVJORUwpOwo+ID4gICAgICAgaWYgKCFzc3QtPmZ3X2luX21lbSkgewo+ID4gICAgICAg
ICAgICAgICByZXR2YWwgPSAtRU5PTUVNOwo+ID4gICAgICAgICAgICAgICBnb3RvIGVuZF9yZWxl
YXNlOwo+ID4gICAgICAgfQo+ID4gICAgICAgZGV2X2RiZyhzc3QtPmRldiwgImNvcGllZCBmdyB0
byAlcCIsIHNzdC0+ZndfaW5fbWVtKTsKPiA+ICAgICAgIGRldl9kYmcoc3N0LT5kZXYsICJwaHlz
OiAlbHgiLCAodW5zaWduZWQgbG9uZyl2aXJ0X3RvX3BoeXMoc3N0LT5md19pbl9tZW0pKTsKPiA+
IC0gICAgIG1lbWNweShzc3QtPmZ3X2luX21lbSwgZnctPmRhdGEsIGZ3LT5zaXplKTsKPiA+ICAg
ICAgIHJldHZhbCA9IHNzdF9wYXJzZV9md19tZW1jcHkoc3N0LCBmdy0+c2l6ZSwgJnNzdC0+bWVt
Y3B5X2xpc3QpOwo+ID4gICAgICAgaWYgKHJldHZhbCkgewo+ID4gICAgICAgICAgICAgICBkZXZf
ZXJyKHNzdC0+ZGV2LCAiRmFpbGVkIHRvIHBhcnNlIGZ3XG4iKTsKPiA+Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
