Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF859783
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96271692;
	Fri, 28 Jun 2019 11:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96271692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561714315;
	bh=ZwFuPeQRZBxgxhNkGRuL2PF9cPBxlIQ5OfPDHMs2VA4=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvARNXc9SKxJ6+n5M3UmkfAqAz2+JWAjb/kMqJjhrTTYWR48zsfNeoEWxMWof+/UN
	 xPVTn0vLQDuouJNLP/1V75CxhFy+5i1awXuopvJ/MW31ebXkc94xaXV6GeKBqNVuVF
	 yofWQh3O0pHvHpnzeDaQitOy9xw4sKsPomirRvRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7850FF896CC;
	Fri, 28 Jun 2019 11:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4798FF896B9; Fri, 28 Jun 2019 11:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BBBF80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BBBF80C0B
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hgnCg-0006xc-VC
 for alsa-devel@alsa-project.org; Fri, 28 Jun 2019 09:29:59 +0000
Received: by mail-pl1-f200.google.com with SMTP id 65so3195122plf.16
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 02:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JpLW+K7OayxQr1MZdjTeCDDOvE1m5y/oiZWdTifSQTI=;
 b=uDnyTPSdcPq3yREkHPO6kuSBpcMHqMw+8XUFs/abVw6w6mpTS6cMKwlLV2Czz+M7Fi
 sL8XH7rE9+DZWbVzI05DvIMqMwulqv8knoqJ0VUbvThXdoiUY51MDixAqE0mk1x6zwi5
 iaUMeqB5e5V8fRIIwyAAzFksYUEaRWgeGk/E8fo9QjPVMRblpH09gHj7b59KrC4nuDJQ
 ZHq5JrkgG2flpOje94VHozJBaxofIIfk6KhLCQt9CbNsYOqEV3kQUuoMwEqDPAjHiEBJ
 N5jF02Gq8mQ3xkjxe6Qj3FPIsVFS1lQQNc4GtbSEpoPbA+IIO2B6PBTf1jAvzU1c9W3q
 FOYw==
X-Gm-Message-State: APjAAAVzcqNIeieviNwP9Ku/yo8rkbJ0SWs0nkHlvBMcOEOqswv1TumO
 MFT5aOKVy5nWw5eOYRB5UE9K+DDt0uFjaJKYSVmP1r8FryLtq7VYRfBGWVIyLig+0ppFp0BlfYK
 vl8X5CmcKxOKcKFOWdlI8iqpsfteBoka4hxjRD/JA
X-Received: by 2002:a63:f510:: with SMTP id w16mr8533929pgh.0.1561714197653;
 Fri, 28 Jun 2019 02:29:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYH4t/nUWH2KIkPbH0ff+IhP9Mn6sDdMJfBw1QPf53pEGNjrIVHvUMiEdDczOlcSjtmdb4Pw==
X-Received: by 2002:a63:f510:: with SMTP id w16mr8533897pgh.0.1561714197221;
 Fri, 28 Jun 2019 02:29:57 -0700 (PDT)
Received: from 2001-b011-380f-3511-c09f-cbfd-7c09-2630.dynamic-ip6.hinet.net
 (2001-b011-380f-3511-c09f-cbfd-7c09-2630.dynamic-ip6.hinet.net.
 [2001:b011:380f:3511:c09f:cbfd:7c09:2630])
 by smtp.gmail.com with ESMTPSA id y19sm1671911pfe.150.2019.06.28.02.29.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 02:29:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hh88a6pig.wl-tiwai@suse.de>
Date: Fri, 28 Jun 2019 17:29:54 +0800
Message-Id: <4E6239D9-3A70-4D66-9F88-453EB268DA2A@canonical.com>
References: <156097935391.32250.14918304155094222078.malonedeb@chaenomeles.canonical.com>
 <156113479576.29306.8491703251507627705.malone@gac.canonical.com>
 <B0FDD5B2-EA6F-4ABC-8BF5-6231AA31EB70@canonical.com>
 <s5hh88a6pig.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: conmanx360@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] ca0132 audio in Ubuntu 19.04 only after Windows 10
 started, missing ctefx-r3di.bin
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

YXQgMTc6MTMsIFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4gd3JvdGU6Cgo+IE9uIEZyaSwg
MjggSnVuIDIwMTkgMDg6MzU6NTEgKzAyMDAsCj4gS2FpLUhlbmcgRmVuZyB3cm90ZToKPj4gSGkg
Q29ubm9yLAo+Pgo+PiBUaGUgYnVnIHdhcyBmaWxlZCBhdCBMYXVuY2hwYWQgWzFdLCBJIHRoaW5r
IHRoZSBtb3N0IG5vdGFibGUgZXJyb3IgaXMKPj4gWyAgICAzLjc2ODY2N10gc25kX2hkYV9pbnRl
bCAwMDAwOjAwOjFmLjM6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvcgo+PiBjdGVmeC1yM2RpLmJp
biBmYWlsZWQgd2l0aCBlcnJvciAtMgo+Pgo+PiBUaGUgZmlybXdhcmUgaXMgaW5kZWVkIGxpc3Rl
ZCBpbiBwYXRjaF9jYTAxMzIuYywgYnV0IGxvb2tzIGxpa2UKPj4gdGhlcmXigJlzIG5vICBjb3Jy
ZXNwb25kaW5nIGZpbGUgaW4gbGludXgtZmlybXdhcmUuCj4KPiBGWUksIHRoZSBmaXJtd2FyZSBp
cyBmb3VuZCBpbiBhbHNhLWZpcm13YXJlIGdpdCByZXBvIGZvciBub3cuCgpHb3QgaXQsIHRoYW5r
cyBmb3IgdGhlIGluZm8uIERpZG7igJl0IGtub3cgdGhlcmXigJlzIGFsc2EtZmlybXdhcmUgcmVw
by4KCkthaS1IZW5nCgo+Cj4KPiBUYWthc2hpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
