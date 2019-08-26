Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAC9CC49
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 11:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0885F1678;
	Mon, 26 Aug 2019 11:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0885F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566810679;
	bh=kL92qN9CkDvlyOPQQZkeXNV6CUFNavKh7BYp8uEzXAg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2QOCdCvSt98BK6cPTjTnPzRS3eiBBeeajFArY+2rmViMx1M6q1mCFjDT4js7Kare
	 xopXtzU1sgH0j3EPRAk4iahrdM3LGGw4shQrjO0JS1K+WppMF+rJu9oTR0ym8ScQY4
	 ynIee2MAAxEwKHq6n3Ar9vDSIzEbn0bJ84fdIvgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F897F80376;
	Mon, 26 Aug 2019 11:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADA89F802BC; Mon, 26 Aug 2019 11:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B61F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B61F8014A
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B793F5946B
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 09:09:26 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id f11so9225328edn.9
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 02:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0e8rI6csadbpI9hF/1H0WuciLZJiYzd48jgfPspvsFs=;
 b=TNvozS7TCeQOBE4NTG1EfLci5MtbNrVKCPaC/uOlW+cIMOzyTWIZJBPz1PLt2FUsg7
 liGZD75KFw8SQ+5kqb0RyIfX0nTvvm28JbsXp/oN7pPBw9woIVu4OgZPi9FbeWopRSKL
 hFY9VreAxqtNPpMBn1QLPdJxwDZ9hx+Ed4LZZhU+5fsCeLrmE3Doo6M25KkhNzpOCFc3
 riBRzfLPA02cbhPwsZQhORkoMfIb8l9x9TZsmCOIRZ5VV3hOYUfU9PqqJ6H8yIcSA4v3
 19PddA6RGPJwQJ4dZBz9m013UJSENt4qQQIl26UYIX6xVaZykC34ujeFzChlVa0f1JFf
 ENNg==
X-Gm-Message-State: APjAAAVotk+SJ+69TXcyRPFVZq4wx/Vd6lXchOD7wlVJVnIP9vsFc0lR
 q5rLB9GaxeJYwGya93h10bFKs4kwWRler4RHEHhoe18lbC0D8HS8MsOzY1sbtaKO3i5YyTpT+o9
 58PYkBDX7NgXOeoVGaWhh9y4=
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr15163047ejm.259.1566810565520; 
 Mon, 26 Aug 2019 02:09:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp2vfIUvIpKKX1pS84n5oMSQ3uHxvsZ2FZQ1JSa8hTE/fMToPfSu8EKVTRzGNrm5Nkkj3CMg==
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr15163037ejm.259.1566810565379; 
 Mon, 26 Aug 2019 02:09:25 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id w19sm1168567edt.41.2019.08.26.02.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2019 02:09:24 -0700 (PDT)
To: Daniel Drake <drake@endlessm.com>
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
 <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
 <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <eeee149c-4d9b-8b2e-780b-a41e2c87ec02@redhat.com>
Date: Mon, 26 Aug 2019 11:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
Content-Language: en-US
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: es8316: limit headphone mixer volume
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

SGksCgpPbiAyNi0wOC0xOSAwNDo1MywgRGFuaWVsIERyYWtlIHdyb3RlOgo+IE9uIE1vbiwgQXVn
IDI2LCAyMDE5IGF0IDE6MzggQU0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+IE9uIDI0LTA4LTE5IDIzOjA0LCBLYXRzdWhpcm8gU3V6dWtpIHdyb3RlOgo+Pj4g
VGhpcyBwYXRjaCBsaW1pdHMgSGVhZHBob25lIG1peGVyIHZvbHVtZSB0byA0IGZyb20gNy4KPj4+
IEJlY2F1c2Ugb3V0cHV0IHNvdW5kIHN1ZGRlbmx5IGJlY29tZXMgdmVyeSBsb3VkbHkgd2l0aCBt
YW55IG5vaXNlIGlmCj4+PiBzZXQgdm9sdW1lIG92ZXIgNC4KPiAKPiBUaGF0IHNvdW5kcyBsaWtl
IHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBsaW1pdGVkIGluIFVDTS4KPiAKPj4gSGlnaGVyIHRo
ZW4gNCBub3Qgd29ya2luZyBtYXRjaGVzIG15IGV4cGVyaWVuY2UsIHNlZSB0aGlzIGNvbW1lbnQg
ZnJvbQo+PiB0aGUgVUNNIGZpbGU6IGFsc2EtbGliL3NyYy9jb25mL3VjbS9jb2RlY3MvZXM4MzE2
L0VuYWJsZVNlcS5jb25mIDoKPj4KPj4gIyBTZXQgSFAgbWl4ZXIgdm9sIHRvIC02IGRCICg0Lzcp
IGxvdWRlciBkb2VzIG5vdCB3b3JrCj4+IGNzZXQgIm5hbWU9J0hlYWRwaG9uZSBNaXhlciBWb2x1
bWUnIDQiCj4gCj4gV2hhdCBkb2VzICJkb2VzIG5vdCB3b3JrIiBtZWFuIG1vcmUgcHJlY2lzZWx5
PwoKSUlSQyBnYXJibGVkIHNvdW5kLgoKPiBJIGNoZWNrZWQgdGhlIHNwZWMsIHRoZXJlIGlzIGlu
ZGVlZCBzb21ldGhpbmcgd3JvbmcgaW4gdGhlIGtlcm5lbCBkcml2ZXIgaGVyZS4KPiBUaGUgZGIg
c2NhbGUgaXMgbm90IGEgc2ltcGxlIHNjYWxlIGFzIHRoZSBrZXJuZWwgc291cmNlIHN1Z2dlc3Rz
Lgo+IAo+IEluc3RlYWQgaXQgaXM6Cj4gMDAwMCDigJMgLTEyZEIKPiAwMDAxIOKAkyAtMTAuNWRC
Cj4gMDAxMCDigJMgLTlkQgo+IDAwMTEg4oCTIC03LjVkQgo+IDAxMDAg4oCTIC02ZEIKPiAxMDAw
IOKAkyAtNC41ZEIKPiAxMDAxIOKAkyAtM2RCCj4gMTAxMCDigJMgLTEuNWRCCj4gMTAxMSDigJMg
MGRCCj4gCj4gU28gcGVyaGFwcyB3ZSBjYW4gZml4IHRoZSBrZXJuZWwgdG8gZm9sbG93IHRoaXMg
dGFibGUgYW5kIHRoZW4gdXNlIFVDTQo+IHRvIGxpbWl0IHRoZSB2b2x1bWUgaWYgaXRzIHRvbyBo
aWdoIG9uIGEgZ2l2ZW4gcGxhdGZvcm0/CgpZZXMgdGhhdCBzb3VuZHMgbGlrZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8uIEthdHN1aGlybyBjYW4geW91IGNvbmZpcm0gdGhhdAp1c2luZyB0aGlzIHRh
YmxlIGFsbG93cyB1c2luZyB0aGUgZnVsbCBzY2FsZSA/IG5vdGUgdGhhdCB0aGUgZnVsbCBzY2Fs
ZSBub3cKaGFzIDkgc3RlcHMgcmF0aGVyIHRoZW4gOC4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
