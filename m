Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9B2D763
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 10:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58AE169A;
	Wed, 29 May 2019 10:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58AE169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559117417;
	bh=7MIgusQMRwd472s6tMSU1IGc2vUkI9O5lSZJLeE+cgs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CLXiXWlwGLnKPpIG9oDRjeK5MkAE7LqXtkCPVSr1nCSKFrZgAZp+qWc4lV1v3gFQi
	 QA/1vNCmS72Q2AF/CfytxhR3zgyccO0etLjnFifXHqLN+NckyEV78U9XT+DmSTO6y3
	 RlrML7wyBRHyZs/q9xj6zE5p4ugq6E45rB6p3UZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C66FF896E8;
	Wed, 29 May 2019 10:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2209F896E4; Wed, 29 May 2019 10:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD69F806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 10:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD69F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lightnvm-io.20150623.gappssmtp.com
 header.i=@lightnvm-io.20150623.gappssmtp.com header.b="DvHdwxZb"
Received: by mail-ed1-x544.google.com with SMTP id f37so2271226edb.13
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X55S31ao8CfYMehdctXfzJQFFMsU0ZFkppGUTIESvkI=;
 b=DvHdwxZbhyi3JQ17yrFCBVFILG9oxWRqQorXQBbfNMQbnN8YbiVPExbIjs05xuS6s4
 RrvSJHQYAs3QQ+qJk+dZfwVfVVvY+qXkg81SmYNRsZBDBf08Yof2IdKKDkQz21dEy6vm
 L+WXv2nKXsarLezipgqpzLvOPptiHdm7b5gV8jZKlwcVrkXmwf20nNW8i2JmlutHBAn5
 eSQfFQ+Fbv51uy1DIA3WxzijQ4vpMgbugqlk4yAec5p5VRJU8RtVGQRKfcpotEOKIY0d
 k9rsY0qQqW+3hNX/G+FgxYjVDC/mO884jyhyXyIXfMA9+5aUwTsqTA98ncrDK344QAuw
 7mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X55S31ao8CfYMehdctXfzJQFFMsU0ZFkppGUTIESvkI=;
 b=QcRXyg3yWYQDRNqztn4Ar20aAPypsKQPneT3E1bWmriJVh1sRE/JHye8xbOgmB/Pir
 xLvP5L+mMHdaCa965EP8g9Xvrw+S5oOBxwEjB+D45HPimNT+HSKHZeuEJrfXbbBbCobn
 2AnUW2p3auBo95zoHVT9Qs2oxkSaS07SWaT+BaoRIaYy5YBSaODCJk2k7SOF09N3bi9A
 vKcw+2AVji7lkIKYPgFVIWB8JgCbFYMeJDmvdwzhoFnEqLdXC/FfxtdTfG1Di8NYpUYj
 2ovwPYNpifM6XEeo0VYRE4BepstZGFi6lzpDzgtG4PY1XeWYnU9kwEL4ZkAb7cDH5QkZ
 5KGg==
X-Gm-Message-State: APjAAAW5xGAZn2YtNvLg7t44F3rF+oVvKRmVkAxN0J+FWgddssrqTfuS
 SxuVGSql3sAE0/hCacUkw4NkAw==
X-Google-Smtp-Source: APXvYqyxDyVCDea9bDd1l2EC8hcbEtDWlZ8Dk3yuHbGVJvqjuySoL1bR38CeVbp+JazIYUXhPBHnlQ==
X-Received: by 2002:a17:906:6d3:: with SMTP id
 v19mr69214570ejb.46.1559117307851; 
 Wed, 29 May 2019 01:08:27 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
 [2.111.91.225])
 by smtp.googlemail.com with ESMTPSA id p18sm792916ejr.61.2019.05.29.01.08.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 01:08:27 -0700 (PDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Igor Konopko <igor.j.konopko@intel.com>, David Howells
 <dhowells@redhat.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Eran Ben Elisha <eranbe@mellanox.com>, Jiri Pirko <jiri@mellanox.com>,
 "David S . Miller" <davem@davemloft.net>, Jamal Hadi Salim
 <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-2-geert@linux-m68k.org>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
Date: Wed, 29 May 2019 10:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190528142424.19626-2-geert@linux-m68k.org>
Content-Language: en-GB
Cc: linux-block@vger.kernel.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/5] lightnvm: Fix uninitialized pointer in
 nvm_remove_tgt()
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

T24gNS8yOC8xOSA0OjI0IFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gV2l0aCBnY2Mg
NC4xOgo+IAo+ICAgICAgZHJpdmVycy9saWdodG52bS9jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmG52
bV9yZW1vdmVfdGd04oCZOgo+ICAgICAgZHJpdmVycy9saWdodG52bS9jb3JlLmM6NTEwOiB3YXJu
aW5nOiDigJh04oCZIGlzIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uCj4gCj4g
SW5kZWVkLCBpZiBubyBOVk0gZGV2aWNlcyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCwgdCB3aWxsIGJl
IGFuCj4gdW5pbml0aWFsaXplZCBwb2ludGVyLCBhbmQgbWF5IGJlIGRlcmVmZXJlbmNlZCBsYXRl
ci4gIEEgY2FsbCB0bwo+IG52bV9yZW1vdmVfdGd0KCkgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVz
ZXJzcGFjZSBieSBpc3N1aW5nIHRoZQo+IE5WTV9ERVZfUkVNT1ZFIGlvY3RsIG9uIHRoZSBsaWdo
dG52bSBjb250cm9sIGRldmljZS4KPiAKPiBGaXggdGhpcyBieSBwcmVpbml0aWFsaXppbmcgdCB0
byBOVUxMLgo+IAo+IEZpeGVzOiA4NDNmMmVkYmRkZTA4NWI0ICgibGlnaHRudm06IGRvIG5vdCBy
ZW1vdmUgaW5zdGFuY2UgdW5kZXIgZ2xvYmFsIGxvY2siKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gLS0tCj4gICBkcml2ZXJzL2xp
Z2h0bnZtL2NvcmUuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYyBi
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jCj4gaW5kZXggMGRmNzQ1NDgzMmVmZTA4Mi4uYWEwMTdm
NDhlYjhjNTg4YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jCj4gQEAgLTQ5Miw3ICs0OTIsNyBAQCBzdGF0aWMgdm9p
ZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0ICp0LCBib29sIGdyYWNlZnVs
KQo+ICAgICovCj4gICBzdGF0aWMgaW50IG52bV9yZW1vdmVfdGd0KHN0cnVjdCBudm1faW9jdGxf
cmVtb3ZlICpyZW1vdmUpCj4gICB7Cj4gLQlzdHJ1Y3QgbnZtX3RhcmdldCAqdDsKPiArCXN0cnVj
dCBudm1fdGFyZ2V0ICp0ID0gTlVMTDsKPiAgIAlzdHJ1Y3QgbnZtX2RldiAqZGV2Owo+ICAgCj4g
ICAJZG93bl9yZWFkKCZudm1fbG9jayk7Cj4gCgpUaGFua3MgR2VlcnQuIFdvdWxkIHlvdSBsaWtl
IG1lIHRvIGNhcnJ5IHRoZSBwYXRjaD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
