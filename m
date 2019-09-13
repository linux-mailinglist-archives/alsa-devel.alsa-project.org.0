Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EBB227C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 16:47:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4400E1672;
	Fri, 13 Sep 2019 16:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4400E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568386079;
	bh=B5PfBW9AoYY0CcMs9Dl1L6X4BFAoaRM5DILZ7OJaENo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HND8siD5IHCO9e4TCm2WwRg7I1EEgB4DVa9z0OzowSIq1OsqiWLZFLDi6/AzfO8E+
	 bDKvx0GTomqASvtcYDthI9LOQUoy6FQDnu+aTYfSxI2aOljUtuGbFTtSLLL7Ee/qKm
	 tF6ablU+hNA0FaHEpCpFGR1vRK42vIrMcp3FDjnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7454CF804AB;
	Fri, 13 Sep 2019 16:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69CD7F8036A; Fri, 13 Sep 2019 16:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBF3AF80143
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 16:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF3AF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gGEVF7Ko"
Received: by mail-wr1-x442.google.com with SMTP id u16so32408117wrr.0
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C0BmgB/sd5/VsBAY9AHPnlGPl1BNkW4BY4bf4naCTho=;
 b=gGEVF7KofIj74MTNNyNlZCvWhhUkS9SlD9M1COpfX2ydWO3474Fa7dmB2KgOyCkvxg
 g+fLcTmU1TwQx1dMxqpCT8KUlKiIp7tpJ14uftGsc4qrFI+lp0iNOv2d0x6E7ZnwE6sq
 CC6krb4azk7xtvYQv7dCUMUnEvFvYfAoR8e0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0BmgB/sd5/VsBAY9AHPnlGPl1BNkW4BY4bf4naCTho=;
 b=Csx28nQZ8BQiyo/XLydI9GyzGPYinUxgqsBT3vlHfuebW95v6gkCxY3nqZrmV8iUBX
 MZj8UliRtHwNDZwh/3D0A2oF+oPrnKbLN7gOVL3fc5a4rctI5J1sAbOlXQQwuHBU3Ogf
 2JYlKfq7oQPnjv1gAzF4/v2Xn/6tXoF8g77ZgYpzLlXgfg+gyvQmhyyJzf0Mr+wVfV5Z
 AMf7bC1bg+UaAAI7nqQ1wS72dOlxPB2ywgh0WMrom6ziiWM9CoJ2oxPfpovHPa0ilFi0
 MzCOIPQWlHt8Rb/yfhXbUn7VWg8ua9MY5TYzA4lQcut5WXmA0CiWYtObd1w6sTeWOAqb
 TlCw==
X-Gm-Message-State: APjAAAUqJM7hl05FTzTvIzBcZA+RAuYB7/jRTQlcn/KOk/icB3n/cd++
 b/kCipWiUqfl7U3nC6/HozLfMsn911JgQhTm7GC7rw==
X-Google-Smtp-Source: APXvYqw24qMeqt8Xt640qydkwYCEPBZphtaXbeNPw+dKo07zp30dTEa0aGcnyhnOcVlvvLR8LCpraiKRDOUuZGsoNvQ=
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr710513wrv.248.1568385967865; 
 Fri, 13 Sep 2019 07:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190912022740.161798-1-yuhsuan@chromium.org>
 <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
In-Reply-To: <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 13 Sep 2019 22:45:56 +0800
Message-ID: <CAGvk5PpCOG0Jii_vksrewZ_Dfmc+OVM9C6pkCYLY=n+ac-wVaA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927:
 Add dmic format constraint
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3ISBJZiBJJ20gbm90IG1pc3Rha2VuLCB0aGUgbWljcm9waG9u
ZSBpcyBhdHRhY2hlZCB0bwpleHRlcm5hbCBjb2RlYyhydDU1MTQpIGluc3RlYWQgb2YgUENIIG9u
IEthYnlsYWtlIHBsYXRmb3JtLiBTbyB0aGVyZSBzaG91bGQKYmUgYSBURE0gYmV0d2VlbiBETUlD
cyBhbmQgUENILiBXZSBjYW4gc2VlIGluIHRoZQprYWJ5bGFrZV9zc3AwX2h3X3BhcmFtcyBmdW5j
dGlvbiwKdGhlcmUgYXJlIHNvbWUgb3BlcmF0aW9ucyBhYm91dCBzZXR0aW5nIHRkbSBzbG90X3dp
ZHRoIHRvIDE2IGJpdHMuClRoZXJlZm9yZSwgSSB0aGluayBpdCBvbmx5IHN1cHBvcnRzIFMxNl9M
RSBmb3JtYXQgZm9yIERNSUNzLiBJcyBpdCBjb3JyZWN0PwoKUGllcnJlLUxvdWlzIEJvc3NhcnQg
PHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4g5pa8IDIwMTnlubQ55pyIMTLm
l6Ug6YCx5ZubCuS4i+WNiDk6MDLlr6vpgZPvvJoKCj4gT24gOS8xMS8xOSA5OjI3IFBNLCBZdS1I
c3VhbiBIc3Ugd3JvdGU6Cj4gPiAyNCBiaXRzIHJlY29yZGluZyBmcm9tIERNSUMgaXMgbm90IHN1
cHBvcnRlZCBmb3IgS0JMIHBsYXRmb3JtIGJlY2F1c2UKPiA+IHRoZSBURE0gc2xvdCBiZXR3ZWVu
IFBDSCBhbmQgY29kZWMgaXMgMTYgYml0cyBvbmx5LiBXZSBzaG91bGQgYWRkIGEKPiA+IGNvbnN0
cmFpbnQgdG8gcmVtb3ZlIHRoYXQgdW5zdXBwb3J0ZWQgZm9ybWF0Lgo+Cj4gSHVtbSwgd2hlbiB5
b3UgdXNlIERNSUNzIHRoZXkgYXJlIGRpcmVjdGx5IGNvbm5lY3RlZCB0byB0aGUgUENIIHdpdGgg
YQo+IHN0YW5kYXJkIDEtYml0IFBETS4gVGhlcmUgaXMgbm8gbm90aW9uIG9mIFRETSBvciBzbG90
Lgo+Cj4gSXQgY291bGQgdmVyeSB3ZWxsIGJlIHRoYXQgdGhlIGZpcm13YXJlL3RvcG9sb2d5IG9u
bHkgc3VwcG9ydCAxNiBiaXQgKEkKPiB2YWd1ZWx5IHJlY2FsbCBhbm90aGVyIGNhc2Ugd2hlcmUg
MjQgYml0cyB3YXMgYWRkZWQpLCBidXQgdGhlCj4gZGVzY3JpcHRpb24gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIHdvdWxkIG5lZWQgdG8gYmUgbW9kaWZpZWQgdG8gbWFrZSB0aGUKPiByZWFzb24gZm9y
IHRoaXMgY2hhbmdlIGNsZWFyZXIuCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1Ic3VhbiBI
c3UgPHl1aHN1YW5AY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAgIHNvdW5kL3NvYy9pbnRlbC9i
b2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYyB8IDMgKysrCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2lu
dGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jCj4gYi9zb3VuZC9zb2MvaW50
ZWwvYm9hcmRzL2tibF9ydDU2NjNfcnQ1NTE0X21heDk4OTI3LmMKPiA+IGluZGV4IDc0ZGRhODc4
NGYxYTAxLi42N2IyNzZhNjVhOGQyZCAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9i
b2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYwo+ID4gKysrIGIvc291bmQvc29jL2lu
dGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jCj4gPiBAQCAtNDAwLDYgKzQw
MCw5IEBAIHN0YXRpYyBpbnQga2FieWxha2VfZG1pY19zdGFydHVwKHN0cnVjdAo+IHNuZF9wY21f
c3Vic3RyZWFtICpzdWJzdHJlYW0pCj4gPiAgICAgICBzbmRfcGNtX2h3X2NvbnN0cmFpbnRfbGlz
dChydW50aW1lLCAwLCBTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5FTFMsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgZG1pY19jb25zdHJhaW50cyk7Cj4gPgo+ID4gKyAgICAgcnVudGltZS0+aHcu
Zm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFOwo+ID4gKyAgICAgc25kX3BjbV9od19j
b25zdHJhaW50X21zYml0cyhydW50aW1lLCAwLCAxNiwgMTYpOwo+ID4gKwo+ID4gICAgICAgcmV0
dXJuIHNuZF9wY21faHdfY29uc3RyYWludF9saXN0KHN1YnN0cmVhbS0+cnVudGltZSwgMCwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSwgJmNvbnN0cmFp
bnRzX3JhdGVzKTsKPiA+ICAgfQo+ID4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
