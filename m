Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6AE1CF4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 15:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B59D1655;
	Wed, 23 Oct 2019 15:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B59D1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571838103;
	bh=SoTt2hzYlypJhbvd/4yKXoLnV6sPutSai7mF42z8zss=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emZRn+w2YKIKXT3UQmM/4p7eBkfSvzThK9r10HoXKvTaO9FVUMRNAnb21ECp2r8jj
	 OS7I7K1g5zI1m4m5lHU2VGZeiDxfAsrU6dsbxkJRVQEPO4mNw4KriD0IcBTVLyfcpn
	 8xEGKu301SMF6txI2Q7SFhxeC/Vaiu9u+f2OAXrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DACBFF80368;
	Wed, 23 Oct 2019 15:39:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B69F80368; Wed, 23 Oct 2019 15:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C5AF802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 15:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C5AF802DF
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0o3X-1i2hmN0esX-00wjHB for <alsa-devel@alsa-project.org>; Wed, 23 Oct
 2019 15:39:50 +0200
Received: by mail-qt1-f172.google.com with SMTP id c17so29299678qtn.8
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWfJSAt0/f7wtM6/C7g5PJWhhqmBKi6tPFkMHQZcYyDj8QZG//o
 JSM2lvreMPFsJrxwv+N1vZZDCJXKM1rKb1F8mIU=
X-Google-Smtp-Source: APXvYqyt7m8OnGbGOfKvN6UapNf8Y0PixnD+b/5MFVO15QeK4AzpoE5xCHBxjuJT4OWklHgs4L5FWsrmt4sucJ53v+g=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr9289234qtk.304.1571837989082; 
 Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191023131049.GG11048@pi3>
In-Reply-To: <20191023131049.GG11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:39:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:/psy1I++9ss8+KSXq8rajBnglla0BwKSFGE0ZKQirhw068UB6z4
 JTsPMrhflIrvvvX/A0wVk0N2edLf8JXCj6IM0EWeJGG9dzSOkdTzT1Q3OFYqpZ8GlLJs6nw
 egn4iOIS42u7OGimVIGF+OoAcb6+pwlATtIW82HTWrevMEZxzu3O/Mk0LA6xUPAhdKUJ1uU
 X9v8drZelnGVxDaGmMiVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CrOxP9Zp5jU=:h9HfkiPXXZ/4xxe0h3B3PQ
 jBrnf88/8ROzEis7N6/20Ivnqd+56NW5v0BsDOrXmOOGQNNZvvgZJ+ThVbJc1FGEnDCVBCICu
 LGziI2JX4B1BCftsWrDJ/JPcrwijfSmDfsRdhNQQbZrkpb1NPMXbp78SarieGDy6Ox293i7hs
 7TFJun05SGruAPII4rSwzD8k9Z76x5pPT9IpP6mNfqVgHqSfveC/T8b7FfJY4PJHJDoYF7xKe
 fgs9WtpMGtDmBVQRxwa5OoUu+6sAsGMWUgZ8YTMf3QHOFMSSKDd6ORxyWYgLdBlWxUrIQ0I4x
 poISjKr3yi6HZKx6IObHwzUG5rCNBigL+vw2K+W0HnKjM77cgMy11btsFG4+m6lmcOc3rmty8
 GMsf/8rfpqTL8ff0bXKHS3puAc8UVgGAZ5/Y1tQf/R9nPNXoUbop49UMoqKSTBjqEnWbCBOeJ
 F6Icj+uy/ixH8LvW5akkbN6hsxALB9WIasznTqFSjP2g4sp6ZQbFnNjUy+9oL6tH0b8C9I8Hc
 LjHUKTIZxUYjG9a67zhs+EYUXh8zinzCvib/+JatnbvcHGLZiOzjIb2mj0B2DLbubW7EY0Iq1
 f0FDRkFq3xt+L8AANaBuj/ENNm+AQJ3q8S+lwuWnRzACJQ/0fYIFcnamGkNiFoavIaLrxOI+H
 8sPv99ImkUSUT5dlJctNDI4TW3VBFmmBgDYkfCygi2UKJ4JQRk/AITjKcS8zOpRxW4EYksbxL
 kmufSRw1Gxis8iQXgBi7oWrgYX1jgbjgnOGnt/IjebYRDu7nfRGVexEWvr+v2BY+2P0YnmHFA
 0g6+bpH5NBrhGG2ljF6Fjx5vGHW+ddqbdtvkiX8Ohuh4aNoFFYfMcLQLSgBiCEr03DBKsZG7/
 5CImmvbgGQ3st5S4JQbA==
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Kukjin Kim <kgene@kernel.org>,
 linux-serial@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Linux PM list <linux-pm@vger.kernel.org>, Lihua Yao <ylhuajnu@163.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/36] ARM: samsung platform cleanup
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

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoxMSBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDEwOjI4OjAyUE0g
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBUaGUgY29udGVudHMgYXJlIGF2YWlsYWJs
ZSBmb3IgdGVzdGluZyBpbgo+ID4KPiA+IGdpdDovL2tlcm5lbC5vcmc6L3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hcm5kL3BsYXlncm91bmQuZ2l0IHMzYy1tdWx0aXBsYXRmb3JtCj4KPiBXaGVu
IHNlbmRpbmcgdjIsIGNhbiB5b3UgQ2M6Cj4KPiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFq
LmNobWllbEBnbWFpbC5jb20+Cj4gTGlodWEgWWFvIDx5bGh1YWpudUBvdXRsb29rLmNvbT4KPiAo
b3IgTGlodWEgWWFvIDx5bGh1YWpudUAxNjMuY29tPiBpZiBvdXRsb29rLmNvbSBib3VuY2VzKQo+
IFNlcmdpbyBQcmFkbyA8c2VyZ2lvLnByYWRvQGUtbGFid29ya3MuY29tPgo+IFN5bHdlc3RlciBO
YXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPgo+IFRoZXNlIGFyZSBmb2xrcyB3aGlj
aCB0byBteSBrbm93bGVkZ2UgaGFkIHdvcmtpbmcgUzNDIGFuZCBTNVAgYm9hcmRzCj4gc28gbWF5
YmUgdGhleSBjb3VsZCBwcm92aWRlIHRlc3RpbmcuCgpPaywgd2lsbCBkby4gSSd2ZSB1cGxvYWRl
ZCB0aGUgbW9kaWZpZWQgdmVyc2lvbiBiYXNlZCBvbiB5b3VyIGNvbW1lbnRzIHRvCnRoZSBhYm92
ZSBVUkwgZm9yIG5vdy4KCkknbGwgcHJvYmFibHkgZ2l2ZSBpdCBhIGxpdHRsZSBtb3JlIHRpbWUg
YmVmb3JlIHJlc2VuZGluZywgYnV0IHRoZXkKY291bGQgYWxyZWFkeQpzdGFydCB0ZXN0aW5nIHRo
YXQgdmVyc2lvbi4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldyEKCiAgICAgIEFybmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
