Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3AF357BF7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 07:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DD0828;
	Thu,  8 Apr 2021 07:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DD0828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617860746;
	bh=c6Ii7OpohczAty+IXuRyPeC8Dr2Wa9waFOnnflxFtZM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsN2i3BjHL90Va1A4id+Q0NliQ1QpJ+663OY4JEceC3Ls/4C6rCidXu7n8HAkTPrl
	 zSEF7JWCc+CKOEx8R59aC52Mrwh01Up1qCoOCvRHyInzC0eiJbu26ZnWRTVfU47Pi5
	 VVILNZhY1x9KIh/7xezBo8yXvIvzc3qaKnskjc+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E267CF800BD;
	Thu,  8 Apr 2021 07:44:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E4B3F8020B; Thu,  8 Apr 2021 07:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_30, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id DEFB1F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 07:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEFB1F800BD
Received: by ajax-webmail-mail-app4 (Coremail) ; Thu, 8 Apr 2021 13:44:04
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.72.8]
Date: Thu, 8 Apr 2021 13:44:04 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Mark Brown" <broonie@kernel.org>
Subject: Re: Re: [PATCH] ASoC: codecs: Fix rumtime PM imbalance in
 tas2552_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <20210407125147.GD5510@sirena.org.uk>
References: <20210407065402.17729-1-dinghao.liu@zju.edu.cn>
 <20210407125147.GD5510@sirena.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <8ef359a.40bbb.178b0024d3e.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCH2Q0kmG5giemaAA--.34955W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoGBlZdtTQGhAAxsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, kjlu@umn.edu, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
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

PiBPbiBXZWQsIEFwciAwNywgMjAyMSBhdCAwMjo1NDowMFBNICswODAwLCBEaW5naGFvIExpdSB3
cm90ZToKPiAKPiA+IC0JcG1fcnVudGltZV9zZXRfYWN0aXZlKCZjbGllbnQtPmRldik7Cj4gPiAt
CXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZjbGllbnQtPmRldiwgMTAwMCk7Cj4g
PiAtCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKCZjbGllbnQtPmRldik7Cj4gPiAtCXBtX3J1
bnRpbWVfZW5hYmxlKCZjbGllbnQtPmRldik7Cj4gPiAtCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1
c3koJmNsaWVudC0+ZGV2KTsKPiA+IC0JcG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZCgm
Y2xpZW50LT5kZXYpOwo+ID4gLQo+ID4gIAlkZXZfc2V0X2RydmRhdGEoJmNsaWVudC0+ZGV2LCBk
YXRhKTsKPiA+ICAKPiA+ICAJcmV0ID0gZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgm
Y2xpZW50LT5kZXYsCj4gPiBAQCAtNzMzLDYgKzcyNiwxMyBAQCBzdGF0aWMgaW50IHRhczI1NTJf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ICAJaWYgKHJldCA8IDApCj4gPiAg
CQlkZXZfZXJyKCZjbGllbnQtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBjb21wb25lbnQ6ICVk
XG4iLCByZXQpOwo+ID4gIAo+ID4gKwlwbV9ydW50aW1lX3NldF9hY3RpdmUoJmNsaWVudC0+ZGV2
KTsKPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoJmNsaWVudC0+ZGV2LCAx
MDAwKTsKPiA+ICsJcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJmNsaWVudC0+ZGV2KTsKPiAK
PiBJdCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IGp1c3QgbW92aW5nIHRoZSBvcGVyYXRpb25zIGFm
dGVyIHRoZQo+IHJlZ2lzdHJhdGlvbiBpcyBhIGdvb2QgZml4IC0gb25jZSB0aGUgY29tcG9uZW50
IGlzIHJlZ2lzdGVyZWQgd2UgY291bGQKPiBzdGFydCB0cnlpbmcgdG8gZG8gcnVudGltZSBQTSBv
cGVyYXRpb25zIHdpdGggaXQgd2hpY2ggQUZBSVIgd29uJ3QgY291bnQKPiByZWZlcmVuY2VzIGFu
ZCBzbyBvbiBwcm9wZXJseSBpZiBydW50aW1lIFBNIGlzbid0IGVuYWJsZWQgc28gaWYgd2UgbGF0
ZXIKPiBlbmFibGUgcnVudGltZSBQTSB3ZSBtaWdodCBoYXZlIHRoZSByZXN0IG9mIHRoZSBjb2Rl
IGluIGEgY29uZnVzZWQgc3RhdGUKPiBhYm91dCB3aGF0J3MgZ29pbmcgb24uCgpUaGFua3MgZm9y
IHlvdXIgYWR2aWNlLiBJIGNoZWNrZWQgdGhlIHVzZSBvZiBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJf
Y29tcG9uZW50KCkgCmluIHRoZSBrZXJuZWwgYW5kIGZvdW5kIHNvbWV0aW1lcyBydW50aW1lIFBN
IGlzIGVuYWJsZWQgYmVmb3JlIHJlZ2lzdHJhdGlvbiAKYW5kIHNvbWV0aW1lcyBhZnRlciByZWdp
c3RyYXRpb24uIFRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIEkgd2lsbCBzZW5kIGEgbmV3CnBhdGNo
IHRvIGZpeCB0aGlzIGluIGVycm9yIGhhbmRsaW5nIHBhdGguCgpSZWdhcmRzLApEaW5naGFvCg==

