Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68EE6561
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Oct 2019 21:42:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F7718F6;
	Sun, 27 Oct 2019 21:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F7718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572208952;
	bh=Q9mR7x4dSyxd4/SLngBwxj6V7lSb8xbPht1CmO4cyFA=;
	h=References:From:To:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dqg/KNXo/Pcqpx90NZhlZfIOIb21Zveuy4obHNMCB3rU7+B1yimra6NJrX3sUTCNS
	 tvPiLkDcV4aNXJv8a3o8mHjIV+iymgNw2y915G3CBwRNuuj880KX1qtrIO/xfUOnP7
	 KJj7Svb/zXyqS2KOvwkRI7uFsSr1qAyszsRDtp1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A39F0F80145;
	Sun, 27 Oct 2019 21:40:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6C1EF80392; Sun, 27 Oct 2019 21:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C1F2F80145
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 21:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1F2F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="DdxdYJyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572208824;
 bh=fdTyo7vV8Ygs0smEv7TKyxgVnbINnmuc14/pBYAD8O8=;
 h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
 b=DdxdYJybEKNcEHdVTcA1wfPlnCCpi1JHbOYWZZAemoHJOzTYBUio3G+LJoNXm8a64
 UgqUGuMfQhAiekzGUTH/L6t4t+ahJzVnX1nts4XgLxKsFePHpCjjU5Z+7SK/n3rUF0
 RsAPqQ1h30OVdhNFgxJMb3EcTSXQ217i+84HgWjA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.56.174]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M1lTm-1i95w53Zko-00toSL; Sun, 27
 Oct 2019 21:40:24 +0100
References: <20191027191206.30820-1-navid.emamdoost@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org
Message-ID: <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
Date: Sun, 27 Oct 2019 21:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191027191206.30820-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:VhIY9yFjZXbtQ6qV9/ZOcz6TJkURhYZR0SJqiaWNfE+L5z/1UZi
 FkcIk7wdeyuAg3vJyvl+YjZTzpOuaSfJ/6njo9prBrAPchWMajontD35RmGAtTFoI7XhHaK
 20SqfpbEJs5FP9naT28l0uRKY6X4bMampz53e5NiDgKMxIooGACVij6M3MkvzOXFqAr5AGC
 XiBoA30vqGtcAsp/BgUnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRaZ95qpk3o=:sdaI6nuqkPpaGsXk7urmt/
 nJwu1TKvvqna9hJhB+uQoDCoqNJOxpYT1gdXDrH2rBPA7jfEIkrkPPPgXrP839FtEkoKH/TZ5
 Us/RO6Kloaw0aoqaUQ3BDUOh4tq7WBNQKpcMM/poQdDrr2fgjbn7mvQ3yAf0UBB1ifRCmrtmy
 JFmsg6C6iqCBqg8hDYi/k1ZjsoNZFJoUQyB4205DGA2bSJwT0KevQ7CPi87sTblobtSECHFwZ
 A0AnLKsbOG83MyLCA0qUcZV7dcuVHWJ1u2gnTyxhIFZto1+4RYRl1b1Z35VMDEIEIzYHgi5fT
 lWq6hJ1qrdahOHxi3YSy313Ow+vQjp+hH5pXlPjUwhLK40mUEuoaDrcQVrJr8WzqVlG/KULaC
 RquFECUAjI6HkTLj5fAAZ+kpLjPpxdzyJ6Y6O/6Pb9gZL1KsQ1FtN2kTqrL3/C2K32Jnt0W51
 OkKgghCf0XN4XNh9OpJ8e7HZQWEeExZis19h80Yn0bx5O/PXTCjLfcDTLnDJ7wnG9YPPqCYAx
 ZisbQrXTzQ0iiV9ZVqdShmFwZrPA+JHp3uLsTvncff7INl/bFnB7S9hC5g+L/FeOnsDk8VfRH
 bzZijdAfufaX9LDQxBCzb2gYu+KPcKYz1kfDpasrsfkq1me/TPqruGzG9mdgwilbikB7tcC5x
 932Dw53qZjWEJ+HPDwQvVQZK0YLI90io44TH/Iwak3vZZlR1wB7FklNWx5t8TmTNgwwkw3JmG
 O/m3UodBonyHdYxa5PWpH4jgPCUXnyq5zpk3cFnpjctMzkyyGl4v6oYv64jfrSTfTHYcrEmBO
 AeyP07O15rWVeZQtY/ocncYO3xV1IhYvOERCKDBeyg6bJGdWdRacs942RdWRhc7de2oXPj1fq
 83QdBUdqh55dgCqgHnNhJVwCs1W5jQRU+YGiQM9Om6hQdCx6tEc2gh0dNQuKFhGVKPmSUSghT
 jnLL8WAKvs+uHZsL14SBv7IIawSmKAHC8B08q83rc3O/hzTTkCBziei7p3+dMjFQlyt5IZdqU
 VSdcBfYVItKzhp5+bvj7QUKCbf2tzjSgVL/2j2LMfmbD8+aHa5vZ2JEGrU0W1spHxxl2u3naT
 6C4Geo3TiC0c4a/Kcm/FjK1cYsG65g7YyHitZH7F0pVviLLGkwIi0sYYV4JoLyiM8S7Sd9LM9
 nwV33epE/vSxDluY3B9VCQiaqyNzr2W/mtD9cR5xCKGA1CxHr5m54zjzM6Cc6oNwyqKwMv1vy
 r1MksjdnZVLsP501JJnOpNPf4Kz6D3eaW0kgqjxp8qar/GGgY3C+GeFdRlH0=
Cc: kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: pci: Fix memory leak in
	snd_korg1212_create
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

4oCmCj4gKysrIGIvc291bmQvcGNpL2tvcmcxMjEyL2tvcmcxMjEyLmMK4oCmCj4gQEAgLTIzOTgs
OCArMjQwMywxMCBAQCBzdGF0aWMgaW50IHNuZF9rb3JnMTIxMl9jcmVhdGUoc3RydWN0IHNuZF9j
YXJkICpjYXJkLCBzdHJ1Y3QgcGNpX2RldiAqcGNpLAo+Cj4gICAgICAgICAgZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUoc25kX2tvcmcxMjEyX2NvbnRyb2xzKTsgaSsrKSB7Cj4gICAgICAgICAg
ICAgICAgICBlcnIgPSBzbmRfY3RsX2FkZChrb3JnMTIxMi0+Y2FyZCwgc25kX2N0bF9uZXcxKCZz
bmRfa29yZzEyMTJfY29udHJvbHNbaV0sIGtvcmcxMjEyKSk7Cj4gLSAgICAgICAgICAgICAgICBp
ZiAoZXJyIDwgMCkKPiArCQlpZiAoZXJyIDwgMCkgewo+ICsJCQlzbmRfa29yZzEyMTJfZnJlZShr
b3JnMTIxMik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKwkJfQoK
SSBzdWdnZXN0IHRvIGFkZCBhIGp1bXAgdGFyZ2V0IGFjY29yZGluZyB0byB0aGUgTGludXggY29k
aW5nIHN0eWxlCnNvIHRoYXQgZHVwbGljYXRlIGV4Y2VwdGlvbiBoYW5kbGluZyBjb2RlIGNhbiBi
ZSByZWR1Y2VkLgoKIAlyZXR1cm4gMDsKCitmcmVlX2tvcmc6CisJc25kX2tvcmcxMjEyX2ZyZWUo
a29yZzEyMTIpOworCXJldHVybiBlcnI7CiB9CgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
