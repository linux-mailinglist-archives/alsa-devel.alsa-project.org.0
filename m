Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2A3B167
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B4F16D4;
	Mon, 10 Jun 2019 10:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B4F16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560157137;
	bh=xUcwy/6mHT5NLIJ6WyKOFZlUk3sCBr7zrHuI1XchWlM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoeEk+GENpngR6R67CzLAhhza/lNQGwpXwN17fIP1bwOalAotDf0rjFiec6EQB6CV
	 4DXreR+ei5stKsVQOTh0hXzUcW301UAdFwirgk/HugBCzBvqbj3SAhVVTEWfhvRYLm
	 +3lnF4ge4lKzjwLm2OHU9gbIhT9SW4ABEwKpYuP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC4BF80791;
	Mon, 10 Jun 2019 10:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02F91F896E0; Mon, 10 Jun 2019 10:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BF87F8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF87F8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dLWDNPrk"
Received: by mail-wr1-x442.google.com with SMTP id r18so8288585wrm.10
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=GlDt1J1fvetPyCESKlMjIqNMRM316J8zlPWhx4LvhsY=;
 b=dLWDNPrkI87/+NMFnp/VUOiz1kzAkorqRcxWDj2CwmyrVaPmdZqEui/iYaPCvA3EBt
 YqPI7+TYFzoQSWEuLJ74QLiw7ke6fg0PByg9knMnNIJzN+tYd3RT0OFaQ1VaeWcl/XDV
 awBdJmYgsMK8KCOAC7Z2wtU68rJmTZvwuKiNyxNeML9bl9KJTutqOQmU8kuQI/TYfwbV
 AzJH+7TANCbH6cLFyWGUve2ETdV7hkG5L4N5L9qc6RVwJDemOGB1Si7ol9cFGmU175+g
 paimTa6NSc3J74RFiZVjkGCiiF/3P9cWgXEwoZ3uqJjfAI+kZ7CD2L4yRZPYmU+Mear2
 dvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GlDt1J1fvetPyCESKlMjIqNMRM316J8zlPWhx4LvhsY=;
 b=CN8uq5UBxmvWY2T+8rZ0w1KMt9CrZRMsxlbIRbppvg2lMlY7ykIbD9LKCKtagVMK5R
 eslHdZEFkj2J/M4hVQ6rr0fue1uFD8Jli5CMRH5NdDlt1c8TlsLtbuPag9DRNTyY1CMb
 GFV7XoyUCnFZKBq6fRIcdGAZDd24cSUlU6dQu67VQ4KjYq7uyQlhlCshqvNx8FDSyUfw
 0FjzhWlp2h5lAhnGHH43s+AmFYSIDP9dtROp3GqZHGKaHiVH7JJv5Yvfsbmi6bT1KzaW
 OODU9cuKpKlSHqafo4Rp2vccAEKAFL9BkL4ugUoaL6MA2pm1b3Kt6SN4HG0wNhvp5X5/
 1RUQ==
X-Gm-Message-State: APjAAAVdKIrFXrjJbWdZp4ALVNK5BaaTvabNrFWziK6t6atFYwOjX4Cd
 udibKqLPbjhxQt6Qt093kdIwVA==
X-Google-Smtp-Source: APXvYqwjc0a0DLhGA1q6cGuReETiH52r+c3VwON9VQ9q0tUiL5klLowpEXxkevN5zMVwdmaiDjiyJg==
X-Received: by 2002:adf:e691:: with SMTP id r17mr27661347wrm.67.1560157026515; 
 Mon, 10 Jun 2019 01:57:06 -0700 (PDT)
Received: from dell ([2.31.167.229])
 by smtp.gmail.com with ESMTPSA id h1sm9097423wrt.20.2019.06.10.01.57.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 01:57:06 -0700 (PDT)
Date: Mon, 10 Jun 2019 09:57:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Message-ID: <20190610085704.GM4797@dell>
References: <20190603183401.151408-1-gwendal@chromium.org>
 <20190604055908.GA4797@dell>
 <CAFqH_51gMu81f=VFQaF4u9-tAWDMocGAwM_fOPT3Cctv6KWniw@mail.gmail.com>
 <20190610082012.GK4797@dell>
 <CAFqH_50J1wqdhWw5nW+D=crfg=JjUrSh2it=JORx5Wn8LfNTQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqH_50J1wqdhWw5nW+D=crfg=JjUrSh2it=JORx5Wn8LfNTQg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgRW5yaWMgQmFsbGV0Ym8gU2VycmEgd3JvdGU6Cgo+IEhpLAo+
IAo+IFRoYW5rcyBmb3IgdGhlIGliIExlZS4KPiAKPiBEb2luZyBteSBNb25kYXkgcmViYXNlIEkg
anVzdCBub3RpY2VkIHdlIHdpbGwgaGF2ZSBhIHRyaXZpYWwgY29uZmxpY3QKPiBmb3IgdGhlIG1l
cmdlIHdpbmRvdy4KPiAKPiBNaXNzYXRnZSBkZSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPiBkZWwgZGlhIGRsLiwgMTAgZGUganVueQo+IDIwMTkgYSBsZXMgMTA6MjA6Cj4gPgo+ID4g
QXMgcmVxdWVzdGVkLgo+ID4KPiA+IEVuam95IQo+ID4KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToK
PiA+Cj4gPiAgIExpbnV4IDUuMi1yYzEgKDIwMTktMDUtMTkgMTU6NDc6MDkgLTA3MDApCj4gPgo+
ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gPgo+ID4gICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVlL21mZC5naXQgaWIt
bWZkLWNyb3MtdjUuMwo+ID4KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzYWE2
YmUzMGRhODk5NjE5YzQ0YWE2NTQzMTNiYTY2ZWI0NGU3MjkxOgo+ID4KPiA+ICAgbWZkOiBjcm9z
X2VjOiBVcGRhdGUgSTJTIEFQSSAoMjAxOS0wNi0xMCAwOToxNTowOCArMDEwMCkKPiA+Cj4gPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiBJbW11dGFibGUgYnJhbmNoIGJldHdlZW4gTUZEIGFuZCBDcm9zIGR1ZSBmb3Ig
dGhlIHY1LjMgbWVyZ2Ugd2luZG93Cj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gR3dlbmRhbCBHcmlnbm91
ICgzMCk6Cj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBsaWNlbnNlIHRlcm0KPiAKPiBU
aGF0J3MgdGhlIGNvbW1pdCB3aWxsIGhhdmUgcHJvYmxlbXMgZHVlCj4gCj4gY29tbWl0IDljOTJh
YjYxOTE0MTU3NjY0YTJmYmRmOTI2ZGYwZWI5Mzc4MzhlNDUKPiBBdXRob3I6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IERhdGU6ICAgV2VkIE1heSAyOSAwNzoxNzo1NiAy
MDE5IC0wNzAwCj4gCj4gICAgIHRyZWV3aWRlOiBSZXBsYWNlIEdQTHYyIGJvaWxlcnBsYXRlL3Jl
ZmVyZW5jZSB3aXRoIFNQRFggLSBydWxlIDI4Mgo+IAo+IFRoYXQgd2FzIGludHJvZHVjZWQgaW4g
djUuMi1yYzQKClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLiAgSG9wZWZ1bGx5IC1uZXh0IHdpbGwg
Y2F0Y2ggaXQuICBJZiBub3QsCmhvcGVmdWxseSBHaXQgd2lsbCBqdXN0ICdkbyB0aGUgcmlnaHQg
dGhpbmcnIChUTSkuCgo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBaZXJvIEJVSUxEXyBtYWNybwo+
ID4gICAgICAgbWZkOiBjcm9zX2VjOiBzZXQgY29tbWVudHMgcHJvcGVybHkKPiA+ICAgICAgIG1m
ZDogY3Jvc19lYzogYWRkIGVjX2FsaWduIG1hY3Jvcwo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBE
ZWZpbmUgY29tbWFuZHMgYXMgNC1kaWdpdCBVUFBFUiBDQVNFIGhleCB2YWx1ZXMKPiA+ICAgICAg
IG1mZDogY3Jvc19lYzogdXNlIEJJVCBtYWNybwo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBVcGRh
dGUgQUNQSSBpbnRlcmZhY2UgZGVmaW5pdGlvbgo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBtb3Zl
IEhETUkgQ0VDIEFQSSBkZWZpbml0aW9uCj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IFJlbW92ZSB6
ZXJvLXNpemUgc3RydWN0cwo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgRmxhc2ggVjIgY29t
bWFuZHMgQVBJCj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBQV01fU0VUX0RVVFkgQVBJCj4g
PiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBsaWdodGJhciB2MiBBUEkKPiA+ICAgICAgIG1mZDog
Y3Jvc19lYzogRXhwYW5kIGhhc2ggQVBJCj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBFQyB0
cmFuc3BvcnQgcHJvdG9jb2wgdjQKPiA+ICAgICAgIG1mZDogY3Jvc19lYzogQ29tcGxldGUgTUVN
UyBzZW5zb3IgQVBJCj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IEZpeCBldmVudCBwcm9jZXNzaW5n
IEFQSQo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgZmluZ2VycHJpbnQgQVBJCj4gPiAgICAg
ICBtZmQ6IGNyb3NfZWM6IEZpeCB0ZW1wZXJhdHVyZSBBUEkKPiA+ICAgICAgIG1mZDogY3Jvc19l
YzogQ29tcGxldGUgUG93ZXIgYW5kIFVTQiBQRCBBUEkKPiA+ICAgICAgIG1mZDogY3Jvc19lYzog
QWRkIEFQSSBmb3Iga2V5Ym9hcmQgdGVzdGluZwo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQg
SGliZXJuYXRlIEFQSQo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgU21hcnQgQmF0dGVyeSBG
aXJtd2FyZSB1cGRhdGUgQVBJCj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBJMkMgcGFzc3Ro
cnUgcHJvdGVjdGlvbiBBUEkKPiA+ICAgICAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgRUMt
RUMgY29tbXVuaWNhdGlvbgo+ID4gICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgQVBJIGZvciBUb3Vj
aHBhZCBzdXBwb3J0Cj4gPiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9yIEZpbmdlcnBy
aW50IHN1cHBvcnQKPiA+ICAgICAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgcndzaWcKPiA+
ICAgICAgIG1mZDogY3Jvc19lYzogQWRkIFNLVSBJRCBhbmQgU2VjdXJlIHN0b3JhZ2UgQVBJCj4g
PiAgICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBNYW5hZ2VtZW50IEFQSSBlbnRyeSBwb2ludHMKPiA+
ICAgICAgIG1mZDogY3Jvc19lYzogVXBkYXRlIEkyUyBBUEkKPiA+Cj4gPiAgaW5jbHVkZS9saW51
eC9tZmQvY3Jvc19lY19jb21tYW5kcy5oIHwgMzY1OCArKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tCj4gPiAgc291bmQvc29jL2NvZGVjcy9jcm9zX2VjX2NvZGVjLmMgICAgIHwgICAg
OCArLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjkxNSBpbnNlcnRpb25zKCspLCA3NTEgZGVsZXRp
b25zKC0pCj4gPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
