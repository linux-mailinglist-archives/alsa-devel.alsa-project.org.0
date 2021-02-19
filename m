Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7231F4A6
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 06:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2521A1658;
	Fri, 19 Feb 2021 06:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2521A1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613711994;
	bh=JaJHNr+Ji+KBUCsAVRQ12p6OZLpZis1K20HdVeJywug=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYU3gMQfsg4SEYkmb2WgMkbFmdRk5TzDolQnxLFp9rigMpkmXJOb5WAzAuLX76lEW
	 Lon6vTeZGXJJCEFPo0GHm2TCoEiHibuBdBSFIntdeJvFydevPgkFQa/h+6ln7L0C2F
	 BRGbiuZ7LEk9NLH7lMdf7mmSbmotFHH+sw7Dlr6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F38F800C7;
	Fri, 19 Feb 2021 06:18:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF0FF8020B; Fri, 19 Feb 2021 06:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id A913EF800C7
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 06:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A913EF800C7
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 19 Feb 2021 13:18:00
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.145.131]
Date: Fri, 19 Feb 2021 13:18:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Tom Rix" <trix@redhat.com>
Subject: Re: Re: [PATCH] ASoC: Intel: Skylake: Fix missing check in
 skl_pcm_trigger
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20200917(3e19599d)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <e53684a9-afda-8c06-1b54-7327e95b0b01@redhat.com>
References: <20210215151356.15252-1-dinghao.liu@zju.edu.cn>
 <e53684a9-afda-8c06-1b54-7327e95b0b01@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4644524e.89b27.177b8b932a0.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDnHggISi9g9W6ZAQ--.53589W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgIBBlZdtScDEwABsP
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kjlu@umn.edu,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

PiAKPiBPbiAyLzE1LzIxIDc6MTMgQU0sIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gV2hlbiBjbWQg
PT0gU05EUlZfUENNX1RSSUdHRVJfU1RPUCwgd2Ugc2hvdWxkIGFsc28gY2hlY2sKPiA+IHRoZSBy
ZXR1cm4gdmFsdWUgb2Ygc2tsX2RlY291cGxlZF90cmlnZ2VyKCkganVzdCBsaWtlIHdoYXQKPiA+
IHdlIGhhdmUgZG9uZSBpbiBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1BBVVNFX1JFTEVBU0UuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUgPGRpbmdoYW8ubGl1QHpqdS5lZHUuY24+
Cj4gPiAtLS0KPiA+ICBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgfCAzICsrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jIGIvc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXBjbS5jCj4gPiBpbmRleCBiMWNhNjRkMmY3ZWEuLmE1YjFmMzMzYTUwMCAxMDA2NDQK
PiA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYwo+ID4gKysrIGIvc291
bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jCj4gPiBAQCAtNTE2LDYgKzUxNiw5IEBAIHN0
YXRpYyBpbnQgc2tsX3BjbV90cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtLCBpbnQgY21kLAo+ID4gIAkJCXJldHVybiByZXQ7Cj4gCj4gSXMgdGhlcmUgYW55IGFkZGl0
aW9uYWwgZXJyb3IgaGFuZGxpbmcgdG8gYmUgZG9uZSBmb3IgdGhlCj4gCj4gc2tsX3N0b3BfcGlw
ZSB0aGF0IGp1c3QgaGFwcGVuZWQgPwo+IAoKSSB0aGluayB0aGUgY2hlY2sgaXMgZW5vdWdoIGhl
cmUuCgpSZWdhcmRzLApEaW5naGFv
