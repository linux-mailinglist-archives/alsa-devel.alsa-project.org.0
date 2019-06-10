Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66733B12D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA0C16C2;
	Mon, 10 Jun 2019 10:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA0C16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560156438;
	bh=6XOJKyX68uQDTWDgWvBY8djbU04lBhxCztnC6rcZUmQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaMRS32p2xxPRyL9f6/9j+gAy8gKXE7VtAMI8Q/Zuff1bcsh7azybPTNaMpfL41n8
	 mMi7eyLVnUdGRSrDj+z0KUxL09QudOxgP27UX4kRmzBbnpqrcDXaLpR8UXbaNyWo2v
	 zwcUhkP7HdrPQR9UdXAEVHPFWfeIML6AZo6UlHfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9967F896E3;
	Mon, 10 Jun 2019 10:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBE9F896E0; Mon, 10 Jun 2019 10:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9F9F80791
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9F9F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bRZsnI/y"
Received: by mail-qk1-x742.google.com with SMTP id d15so5060374qkl.4
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mg3aSfJBuVduU4VNPluxDXCyjmsixqOgJYW+XgD2lXY=;
 b=bRZsnI/y5+a24CCyEpHu5g85JrLnk+kCQ4csaKYuDD7NjNGXJQ4RYET471WVVRsWLr
 KpYKWOJgJN2lDFoNg6eLa2OFmx9gIujjclUYuTWPLDiT34u1HBr6tV5NYwltlf3s6Buk
 fhsLiGivPOQjpGY+/mcGsKuhM/fKEAGXT3y6MGbiZkbryYw/+R5XOnsOq7WW7ouRkia5
 KqA6n9IpuzZQTiKOPqNeXckHSY1X7CW2EWRedosL/YXvu4g2Eo2ZML7R0YCHzw4ea3xv
 5jGwYUju2d3e/4/41/Vu34qCW88ne5PMxYpi0cmom7wgfSCMFCX+WnkyxTDBUP0XQm4m
 pnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mg3aSfJBuVduU4VNPluxDXCyjmsixqOgJYW+XgD2lXY=;
 b=Ob33qi7mrTnBzprxP4epwH80MpviWzxapA+06QI6a5raJmGrbvJfBvws8ddmk0nWCD
 1SnC8p9LYMdHu0vS8rAFVIVMFUTYroNmafqv/HoDSooXBhErYvUTTSkrSW8sl15tKzTF
 4rwd2EX4CSB964df15x359PJ2zU3vP913/CACY3pYWCL6tA1wEFp0dbeE2eg2EDI8qVo
 FlaFViVol5Pacfk1a/IqBH5+Amb85oXbgtjBnTSdmMrWkD0z4rmdkmBNpY+JKdgRoUw1
 obEgSE1jUdINoyExJjSaMmrfc92zUQmdu1ixpP9w4hdWkmAfZ8wmNns2gP4CJyb5veYW
 9zAA==
X-Gm-Message-State: APjAAAV/5cc+PPRTO/mcCu29lplZ6UdMhzZGCCBdCNpJGX8jWoElvg8/
 IcZ5+v/xGdky36+GCuPcJGcbLM+qQUtnS8Jd2FU=
X-Google-Smtp-Source: APXvYqwOdQ8P2Ew3Mk3oGOxjm0eqXygeSpRp3gbJMPVswit25JDiJQ7ZHeMuJkIf6k835tU672Pnazl1f0Z1doVdvP0=
X-Received: by 2002:a37:5fc2:: with SMTP id
 t185mr12884844qkb.206.1560156326605; 
 Mon, 10 Jun 2019 01:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190603183401.151408-1-gwendal@chromium.org>
 <20190604055908.GA4797@dell>
 <CAFqH_51gMu81f=VFQaF4u9-tAWDMocGAwM_fOPT3Cctv6KWniw@mail.gmail.com>
 <20190610082012.GK4797@dell>
In-Reply-To: <20190610082012.GK4797@dell>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 10 Jun 2019 10:45:15 +0200
Message-ID: <CAFqH_50J1wqdhWw5nW+D=crfg=JjUrSh2it=JORx5Wn8LfNTQg@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 fabien.lahoudere@collabora.com, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [GIT PULL] Immutable branch between MFD and Cros
 due for the v5.3 merge window
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

SGksCgpUaGFua3MgZm9yIHRoZSBpYiBMZWUuCgpEb2luZyBteSBNb25kYXkgcmViYXNlIEkganVz
dCBub3RpY2VkIHdlIHdpbGwgaGF2ZSBhIHRyaXZpYWwgY29uZmxpY3QKZm9yIHRoZSBtZXJnZSB3
aW5kb3cuCgpNaXNzYXRnZSBkZSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiBkZWwg
ZGlhIGRsLiwgMTAgZGUganVueQoyMDE5IGEgbGVzIDEwOjIwOgo+Cj4gQXMgcmVxdWVzdGVkLgo+
Cj4gRW5qb3khCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGExODgzMzlj
YTVhMzk2YWNjNTg4ZTU4NTFlZDdlMTlmNjZiMGViZDk6Cj4KPiAgIExpbnV4IDUuMi1yYzEgKDIw
MTktMDUtMTkgMTU6NDc6MDkgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2xlZS9tZmQuZ2l0IGliLW1mZC1jcm9zLXY1LjMKPgo+IGZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byAzYWE2YmUzMGRhODk5NjE5YzQ0YWE2NTQzMTNiYTY2ZWI0NGU3MjkxOgo+
Cj4gICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBJMlMgQVBJICgyMDE5LTA2LTEwIDA5OjE1OjA4ICsw
MTAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IEltbXV0YWJsZSBicmFuY2ggYmV0d2VlbiBNRkQgYW5kIENyb3Mg
ZHVlIGZvciB0aGUgdjUuMyBtZXJnZSB3aW5kb3cKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBHd2VuZGFsIEdyaWdu
b3UgKDMwKToKPiAgICAgICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBsaWNlbnNlIHRlcm0KClRoYXQn
cyB0aGUgY29tbWl0IHdpbGwgaGF2ZSBwcm9ibGVtcyBkdWUKCmNvbW1pdCA5YzkyYWI2MTkxNDE1
NzY2NGEyZmJkZjkyNmRmMGViOTM3ODM4ZTQ1CkF1dGhvcjogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+CkRhdGU6ICAgV2VkIE1heSAyOSAwNzoxNzo1NiAyMDE5IC0wNzAwCgog
ICAgdHJlZXdpZGU6IFJlcGxhY2UgR1BMdjIgYm9pbGVycGxhdGUvcmVmZXJlbmNlIHdpdGggU1BE
WCAtIHJ1bGUgMjgyCgpUaGF0IHdhcyBpbnRyb2R1Y2VkIGluIHY1LjItcmM0CgpKdXN0IHRvIGxl
dCB5b3Uga25vdy4KIEVucmljCgo+ICAgICAgIG1mZDogY3Jvc19lYzogWmVybyBCVUlMRF8gbWFj
cm8KPiAgICAgICBtZmQ6IGNyb3NfZWM6IHNldCBjb21tZW50cyBwcm9wZXJseQo+ICAgICAgIG1m
ZDogY3Jvc19lYzogYWRkIGVjX2FsaWduIG1hY3Jvcwo+ICAgICAgIG1mZDogY3Jvc19lYzogRGVm
aW5lIGNvbW1hbmRzIGFzIDQtZGlnaXQgVVBQRVIgQ0FTRSBoZXggdmFsdWVzCj4gICAgICAgbWZk
OiBjcm9zX2VjOiB1c2UgQklUIG1hY3JvCj4gICAgICAgbWZkOiBjcm9zX2VjOiBVcGRhdGUgQUNQ
SSBpbnRlcmZhY2UgZGVmaW5pdGlvbgo+ICAgICAgIG1mZDogY3Jvc19lYzogbW92ZSBIRE1JIENF
QyBBUEkgZGVmaW5pdGlvbgo+ICAgICAgIG1mZDogY3Jvc19lYzogUmVtb3ZlIHplcm8tc2l6ZSBz
dHJ1Y3RzCj4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgRmxhc2ggVjIgY29tbWFuZHMgQVBJCj4g
ICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgUFdNX1NFVF9EVVRZIEFQSQo+ICAgICAgIG1mZDogY3Jv
c19lYzogQWRkIGxpZ2h0YmFyIHYyIEFQSQo+ICAgICAgIG1mZDogY3Jvc19lYzogRXhwYW5kIGhh
c2ggQVBJCj4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgRUMgdHJhbnNwb3J0IHByb3RvY29sIHY0
Cj4gICAgICAgbWZkOiBjcm9zX2VjOiBDb21wbGV0ZSBNRU1TIHNlbnNvciBBUEkKPiAgICAgICBt
ZmQ6IGNyb3NfZWM6IEZpeCBldmVudCBwcm9jZXNzaW5nIEFQSQo+ICAgICAgIG1mZDogY3Jvc19l
YzogQWRkIGZpbmdlcnByaW50IEFQSQo+ICAgICAgIG1mZDogY3Jvc19lYzogRml4IHRlbXBlcmF0
dXJlIEFQSQo+ICAgICAgIG1mZDogY3Jvc19lYzogQ29tcGxldGUgUG93ZXIgYW5kIFVTQiBQRCBB
UEkKPiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9yIGtleWJvYXJkIHRlc3RpbmcKPiAg
ICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBIaWJlcm5hdGUgQVBJCj4gICAgICAgbWZkOiBjcm9zX2Vj
OiBBZGQgU21hcnQgQmF0dGVyeSBGaXJtd2FyZSB1cGRhdGUgQVBJCj4gICAgICAgbWZkOiBjcm9z
X2VjOiBBZGQgSTJDIHBhc3N0aHJ1IHByb3RlY3Rpb24gQVBJCj4gICAgICAgbWZkOiBjcm9zX2Vj
OiBBZGQgQVBJIGZvciBFQy1FQyBjb21tdW5pY2F0aW9uCj4gICAgICAgbWZkOiBjcm9zX2VjOiBB
ZGQgQVBJIGZvciBUb3VjaHBhZCBzdXBwb3J0Cj4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgQVBJ
IGZvciBGaW5nZXJwcmludCBzdXBwb3J0Cj4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgQVBJIGZv
ciByd3NpZwo+ICAgICAgIG1mZDogY3Jvc19lYzogQWRkIFNLVSBJRCBhbmQgU2VjdXJlIHN0b3Jh
Z2UgQVBJCj4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgTWFuYWdlbWVudCBBUEkgZW50cnkgcG9p
bnRzCj4gICAgICAgbWZkOiBjcm9zX2VjOiBVcGRhdGUgSTJTIEFQSQo+Cj4gIGluY2x1ZGUvbGlu
dXgvbWZkL2Nyb3NfZWNfY29tbWFuZHMuaCB8IDM2NTggKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQo+ICBzb3VuZC9zb2MvY29kZWNzL2Nyb3NfZWNfY29kZWMuYyAgICAgfCAgICA4
ICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkxNSBpbnNlcnRpb25zKCspLCA3NTEgZGVsZXRpb25z
KC0pCj4KPiAtLQo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IExpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZAo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
