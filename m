Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0400DBD70
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659CA1666;
	Fri, 18 Oct 2019 08:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659CA1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571378615;
	bh=EbmygBDpta3SqTwkMhnvMQkvb6Fwe0klmVOd9r2b8Cc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/yQz7EI6iTdSRwTKJFQTzZZE9pDeXOvCqHNZF9Prop1WpEkGMn9ospwI1Fmu8zim
	 o7lNghMJvrTJfci5uyrVn23jbII/k0isIO3P00EmwO9KGLVYWnKCkHv/q4lM3MTQ4T
	 Stw+ynl55FHGkc39q8B7Ri1G8Q+IZ1KzhCaC+aVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40267F8036C;
	Fri, 18 Oct 2019 08:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D9DF804AA; Thu, 17 Oct 2019 16:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF0F0F80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0F0F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aAX/lgCa"
Received: by mail-vs1-xe43.google.com with SMTP id v19so1763370vsv.3
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbJAFcoHHqLY58vVrIGY0ohV7fj3YmZzesRhk43UItM=;
 b=aAX/lgCaqAHtJKrpo9L1Lu3lGxnVxyOZTpVe3LVEnn3LVjA4NWARsv0RVd8v0myXO7
 8jKj9XA4IeKhCV2qMH4A8IBXJMjAlXk+h97P/zofxwus3EhG2jbgKh6H2hndUV6TTH+I
 sl/JStXAvKnC+wh7axv+kRgfx5hERmj1FFNOp0pfN8IditVibmHlcYIuurz6qE6553ZZ
 Keen26Ejj7IJoO5K1m0AnDYuFShjFnwPTsq3Kp36sib+mobm3t22K0p6p8y4jonhjLGS
 CIgOMqWLAYZG0vngcvFFbw+g/gCc9Oa2acxcLwPVIx8ZNcq7Q3BlEnU4/m8Nt8pUwT6b
 vFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbJAFcoHHqLY58vVrIGY0ohV7fj3YmZzesRhk43UItM=;
 b=D1Xo5khAqXpe2SYOKJSOaFwG2ThGWBUXyjKCzyVeMAa6Esemta/nGUtYRfjd16Vy4D
 rgf3E0CF2WdL/u8lKrGDZsJzBF8zxLBTh/QY1R0YSwgo60/Ry3ZEuSy26eKEZRr17Jx8
 FaMnkagKnM9iJE+98et4y07FygBRFwTdI9xSbZOnCJQIIIeQiCOyiUXEXDqqC5qI+nMj
 DDPeoLBc9puX1HcuNW6VkW2p0Zc/9wS9kYrCIVy17BTHDKI5EYpBSX5We6ZlVO5tJdHd
 uQPDMHT11CvtCEKXZyiyn0xQz0Ue7QUxOL992r60M13Mv77rFwpFbLU93J/K+dHnwa1j
 vCfw==
X-Gm-Message-State: APjAAAVCRNyK8o9jyx5gev+gEiIqA+Qwvn0u2EM5BbKgLHRTFQ1qFTCs
 VJQfhMPIFeUlPz7OrjiE4r6MkvPN75uojZ5Ycp8=
X-Google-Smtp-Source: APXvYqwJLV1Fmemb/1yGdq+8Hu2BTLvAGrnHJHxGxXW4PW+XhkdnHuODXp137LMZHucaE1ubfewWtf/VyHa87YRjztk=
X-Received: by 2002:a67:eb04:: with SMTP id a4mr2081129vso.146.1571323094135; 
 Thu, 17 Oct 2019 07:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
In-Reply-To: <s5hftjriy1q.wl-tiwai@suse.de>
From: =?UTF-8?Q?Szabolcs_Sz=C5=91ke?= <szszoke.code@gmail.com>
Date: Thu, 17 Oct 2019 16:38:02 +0200
Message-ID: <CAMuiEQhoGCVh_PKXsp0Ytn0XvXpWJW8PxH-DN3jK9VB8g-4YQQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Approved-At: Fri, 18 Oct 2019 08:01:49 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Ard van Breemen <ard@kwaak.net>, Manuel Reinhardt <manuel.rhdt@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
	Katana amplifiers
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

VGhhbmsgeW91IGZvciB5b3VyIGhlbHAhCgpEZW4gdG9ycyAxNyBva3QuIDIwMTkgMTA6MTlUYWth
c2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+IHNrcmV2OgoKPiBPbiBGcmksIDExIE9jdCAyMDE5IDE5
OjE5OjM2ICswMjAwLAo+IFN6YWJvbGNzIFN6xZFrZSB3cm90ZToKPiA+Cj4gPiBCT1NTIEthdGFu
YSBhbXBsaWZpZXJzIGNhbm5vdCBiZSB1c2VkIGZvciByZWNvcmRpbmcgb3IgcGxheWJhY2sgaWYg
cXVpcmtzCj4gPiBhcmUgYXBwbGllZAo+ID4KPiA+IEJ1Z0xpbms6IGh0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk1MjIzCj4gPiBTaWduZWQtb2ZmLWJ5OiBTemFi
b2xjcyBTesWRa2UgPHN6c3pva2UuY29kZUBnbWFpbC5jb20+Cj4KPiBBcHBsaWVkIG5vdy4gIFRo
YW5rcy4KPgo+Cj4gVGFrYXNoaQo+Cj4gPgo+ID4gLS0tCj4gPiAgc291bmQvdXNiL3BjbS5jIHwg
MyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3NvdW5kL3VzYi9wY20uYyBiL3NvdW5kL3VzYi9wY20uYwo+ID4gaW5kZXggMzNjZDI2
NzYzYzBlLi5kYWFkYjBjNjZlZWUgMTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC91c2IvcGNtLmMKPiA+
ICsrKyBiL3NvdW5kL3VzYi9wY20uYwo+ID4gQEAgLTM0OCw2ICszNDgsOSBAQCBzdGF0aWMgaW50
IHNldF9zeW5jX2VwX2ltcGxpY2l0X2ZiX3F1aXJrKHN0cnVjdAo+IHNuZF91c2Jfc3Vic3RyZWFt
ICpzdWJzLAo+ID4gICAgICAgICAgICAgICBlcCA9IDB4ODQ7Cj4gPiAgICAgICAgICAgICAgIGlm
bnVtID0gMDsKPiA+ICAgICAgICAgICAgICAgZ290byBhZGRfc3luY19lcF9mcm9tX2lmbnVtOwo+
ID4gKyAgICAgY2FzZSBVU0JfSUQoMHgwNTgyLCAweDAxZDgpOiAvKiBCT1NTIEthdGFuYSAqLwo+
ID4gKyAgICAgICAgICAgICAvKiBCT1NTIEthdGFuYSBhbXBsaWZpZXJzIGRvIG5vdCBuZWVkIHF1
aXJrcyAqLwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAg
ICAgICBpZiAoYXR0ciA9PSBVU0JfRU5EUE9JTlRfU1lOQ19BU1lOQyAmJgo+ID4gLS0KPiA+IDIu
MjAuMQo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
