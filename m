Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8624341F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 08:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B001668;
	Thu, 13 Aug 2020 08:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B001668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597301169;
	bh=Dd/FuObZ8or7UIoJHmCmkBm+qHyvPSdfVvhgYcz4I4Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfTbL5KeSS9LhShV8GMVhtjrF6o43h03AFQHwoY4DyndaOF9imh27GTTUukN1D6YY
	 0s1mtFAZXzk/sSLypq01qZg8sqlXLN+oAmeiQqbKfZRyHhns4dBYLcJHzJEwuoYz3j
	 qZoxHEkSO890ooo+DZmmQ1BEkLNB4iewDu9k4ZYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBBBF80161;
	Thu, 13 Aug 2020 08:44:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F0AF8015B; Thu, 13 Aug 2020 08:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id CC90DF80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 08:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC90DF80100
Received: by ajax-webmail-mail-app2 (Coremail) ; Thu, 13 Aug 2020 14:44:05
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Thu, 13 Aug 2020 14:44:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Takashi Iwai" <tiwai@suse.de>
Subject: Re: Re: [PATCH] ALSA: echoaudio: Fix memory leak in snd_echo_resume()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <s5h7du76lew.wl-tiwai@suse.de>
References: <20200810061500.9329-1-dinghao.liu@zju.edu.cn>
 <s5h7du76lew.wl-tiwai@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <cdb962d.569f9.173e68fb9e9.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgAn0J014TRfJyDOAQ--.37912W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgULBlZdtPicfgABsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbWvS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
 Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
 82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
 v26r106r15MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
 JwCS07vEFIxGxcIEc7CjxVA2Y2ka0xkIwI1lV2xY6x02cVAKzwCS07vEc2IjII80xcxEwV
 AKI48JMIAIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCS07vEIx
 AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY
 6IIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU=
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, kjlu@umn.edu, Takashi Iwai <tiwai@suse.com>,
 Mark Hills <mark@xwax.org>, Dan Carpenter <dan.carpenter@oracle.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Cj4gT24gTW9uLCAxMCBBdWcgMjAyMCAwODoxNDo1OCArMDIwMCwKPiBEaW5naGFvIExpdSB3cm90
ZToKPiA+IAo+ID4gV2hlbiByZXN0b3JlX2RzcF9yZXR0aW5ncygpIGZhaWxzLCBjaGlwIHNob3Vs
ZCBiZSBmcmVlZAo+ID4ganVzdCBsaWtlIHdoZW4gaW5pdF9odygpIGFuZCByZXF1ZXN0X2lycSgp
IGZhaWxzLgo+ID4gCj4gPiBGaXhlczogNDdiNWQwMjhmZGNlOCAoIkFMU0E6IEVjaG9hdWRpbyAt
IEFkZCBzdXNwZW5kIHN1cHBvcnQgIzIiKQo+ID4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUg
PGRpbmdoYW8ubGl1QHpqdS5lZHUuY24+Cj4gCj4gQWN0dWFsbHkgaXQncyByYXRoZXIgd3Jvbmcg
dG8gY2FsbCBzbmRfZWNob19mcmVlKCkgaW4gdGhlIHJlc3VtZSBlcnJvcgo+IHBhdGguICBUaGlz
IG1heSBsZWFkIHRvIGFuIE9vcHMgYXQgdGhlIG5leHQgdGltZSB0aGUgc3lzdGVtIGdvZXMgdG8K
PiByZXN1bWUuICBUaGF0IHNhaWQsIHdlIHNob3VsZCBkcm9wIHNuZF9lY2hvX2ZyZWUoKSBjYWxs
cyBpbiBvdGhlcgo+IGVycm9yIHBhdGhzIGluIHNuZF9lY2hvX3Jlc3VtZSgpIGluc3RlYWQuCj4g
CgpUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNlISBJIHdpbGwgc2VuZCBhIG5ldyBwYXRjaCB0byBm
aXggdGhpcyBzb29uLgoKUmVnYXJkcywKRGluZ2hhbw==
