Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B1D2435F9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 10:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FEC1668;
	Thu, 13 Aug 2020 10:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FEC1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597307425;
	bh=YGOM9ZeZbM0deu9QI8LBN+8h8dy7MxZUEc33FfZnvgw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NY7uAs60OBORwjEdggIT/MGBJw1M4guLAWUQ5/kIqJVNKbLAWNCEkYS6yvcL8Y0WZ
	 lybe7oEsWy8OS/GB+EItzzakwhJKetsAEOmhRJAASWJMgkWIYdfQ+hCgvJ2KmFZMrz
	 cRg97jECU/SUewiNidgf1JBlGYuYSbXk/dCbk3kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AEA0F80161;
	Thu, 13 Aug 2020 10:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06079F8015B; Thu, 13 Aug 2020 10:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F2BFF80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 10:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2BFF80100
Received: by ajax-webmail-mail-app2 (Coremail) ; Thu, 13 Aug 2020 16:28:20
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Thu, 13 Aug 2020 16:28:20 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
Subject: Re: Re: [PATCH] ASoC: intel: Fix memleak in sst_media_open
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <bf70ec51-6ee6-6d1e-1e5b-8e7191f08eba@linux.intel.com>
References: <20200809085654.16483-1-dinghao.liu@zju.edu.cn>
 <bf70ec51-6ee6-6d1e-1e5b-8e7191f08eba@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2cd5b1ba.56e0c.173e6ef2bec.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgB3f+ek+TRf_sXOAQ--.32012W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgcLBlZdtPihowAAsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbAvS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVACI402YVCY1x02628vn2kIc2xKxwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4
 AK64vIr41lV2xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY
 6xC20s026xCaFVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s
 026x8GjcxK67AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIAIbV
 CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4U
 MIAIbVCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kjlu@umn.edu,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
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

ID4gCj4gT24gOC85LzIwIDM6NTYgQU0sIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gV2hlbiBwb3dl
cl91cF9zc3QoKSBmYWlscywgc3RyZWFtIG5lZWRzIHRvIGJlIGZyZWVkCj4gPiBqdXN0IGxpa2Ug
d2hlbiB0cnlfbW9kdWxlX2dldCgpIGZhaWxzLiBIb3dldmVyLCBjdXJyZW50Cj4gPiBjb2RlIGlz
IHJldHVybmluZyBkaXJlY3RseSBhbmQgZW5kcyB1cCBsZWFraW5nIG1lbW9yeS4KPiA+IAo+ID4g
Rml4ZXM6IDAxMjEzMjdjMWE2OGIgKCJBU29DOiBJbnRlbDogbWZsZC1wY206IGFkZCBjb250cm9s
IGZvciBwb3dlcmluZyB1cC9kb3duIGRzcCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEaW5naGFvIExp
dSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4gICBzb3VuZC9zb2MvaW50ZWwv
YXRvbS9zc3QtbWZsZC1wbGF0Zm9ybS1wY20uYyB8IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2MvaW50ZWwvYXRvbS9zc3QtbWZsZC1wbGF0Zm9ybS1wY20uYyBiL3NvdW5kL3NvYy9p
bnRlbC9hdG9tL3NzdC1tZmxkLXBsYXRmb3JtLXBjbS5jCj4gPiBpbmRleCA0OWI5ZjE4NDcyYmMu
Ljc5ZmVkZjllM2RhMSAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9hdG9tL3NzdC1t
ZmxkLXBsYXRmb3JtLXBjbS5jCj4gPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYXRvbS9zc3QtbWZs
ZC1wbGF0Zm9ybS1wY20uYwo+ID4gQEAgLTMzMCw4ICszMzAsMTAgQEAgc3RhdGljIGludCBzc3Rf
bWVkaWFfb3BlbihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPiA+ICAgCXJ1
bnRpbWUtPnByaXZhdGVfZGF0YSA9IHN0cmVhbTsKPiA+ICAgCj4gPiAgIAlyZXRfdmFsID0gcG93
ZXJfdXBfc3N0KHN0cmVhbSk7Cj4gPiAtCWlmIChyZXRfdmFsIDwgMCkKPiA+ICsJaWYgKHJldF92
YWwgPCAwKSB7Cj4gPiArCQlrZnJlZShzdHJlYW0pOwo+ID4gICAJCXJldHVybiByZXRfdmFsOwo+
ID4gKwl9Cj4gPiAgIAo+ID4gICAJLyogTWFrZSBzdXJlLCB0aGF0IHRoZSBwZXJpb2Qgc2l6ZSBp
cyBhbHdheXMgZXZlbiAqLwo+ID4gICAJc25kX3BjbV9od19jb25zdHJhaW50X3N0ZXAoc3Vic3Ry
ZWFtLT5ydW50aW1lLCAwLAo+ID4gCj4gCj4gQWx0ZXJuYXRlIHN1Z2dlc3Rpb24gdG8gZml4IHRo
aXMsIGl0J3Mgbm90IGdyZWF0IHdoZW4gd2UgbWl4IGdvdG9zIGFuZCAKPiByZXR1cm5zLgo+IAo+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvYXRvbS9zc3QtbWZsZC1wbGF0Zm9ybS1wY20u
YyAKPiBiL3NvdW5kL3NvYy9pbnRlbC9hdG9tL3NzdC1tZmxkLXBsYXRmb3JtLXBjbS5jCj4gaW5k
ZXggNDliOWYxODQ3MmJjLi5iMWNhYzdhYmRjMGEgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL2lu
dGVsL2F0b20vc3N0LW1mbGQtcGxhdGZvcm0tcGNtLmMKPiArKysgYi9zb3VuZC9zb2MvaW50ZWwv
YXRvbS9zc3QtbWZsZC1wbGF0Zm9ybS1wY20uYwo+IEBAIC0zMzEsNyArMzMxLDcgQEAgc3RhdGlj
IGludCBzc3RfbWVkaWFfb3BlbihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gCj4gKnN1YnN0cmVh
bSwKPiAKPiAgICAgICAgICByZXRfdmFsID0gcG93ZXJfdXBfc3N0KHN0cmVhbSk7Cj4gICAgICAg
ICAgaWYgKHJldF92YWwgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0X3ZhbDsKPiAr
ICAgICAgICAgICAgICAgZ290byBvdXRfcG93ZXJfdXA7Cj4gCj4gICAgICAgICAgLyogTWFrZSBz
dXJlLCB0aGF0IHRoZSBwZXJpb2Qgc2l6ZSBpcyBhbHdheXMgZXZlbiAqLwo+ICAgICAgICAgIHNu
ZF9wY21faHdfY29uc3RyYWludF9zdGVwKHN1YnN0cmVhbS0+cnVudGltZSwgMCwKPiBAQCAtMzQw
LDggKzM0MCw5IEBAIHN0YXRpYyBpbnQgc3N0X21lZGlhX29wZW4oc3RydWN0IHNuZF9wY21fc3Vi
c3RyZWFtIAo+ICpzdWJzdHJlYW0sCj4gICAgICAgICAgcmV0dXJuIHNuZF9wY21faHdfY29uc3Ry
YWludF9pbnRlZ2VyKHJ1bnRpbWUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9Q
Q01fSFdfUEFSQU1fUEVSSU9EUyk7Cj4gICBvdXRfb3BzOgo+IC0gICAgICAga2ZyZWUoc3RyZWFt
KTsKPiAgICAgICAgICBtdXRleF91bmxvY2soJnNzdF9sb2NrKTsKPiArb3V0X3Bvd2VyX3VwOgo+
ICsgICAgICAga2ZyZWUoc3RyZWFtKTsKPiAgICAgICAgICByZXR1cm4gcmV0X3ZhbDsKPiAgIH0K
ClRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UhIFRoaXMgaXMgYmV0dGVyIGFuZCBJIHdpbGwgc2Vu
ZCAKYSBuZXcgcGF0Y2ggc29vbi4gCgpSZWdhcmRzLApEaW5naGFv
