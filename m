Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25F4B961C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 03:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465B317ED;
	Thu, 17 Feb 2022 03:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465B317ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645066291;
	bh=X+XyY15fhRDGfH2VexChedSfI7xzYdqkj9UmHtUAZGQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nnS2RHUQUqlM1filCJLY6O6heEmRirg+sP1GXWyggkuVhOoTX98X55WkR+NpfQdoz
	 sdCYKxmBLmz/AmyVr9uQwjpgyk4RE8HrHqPveQvrJMF2TXrLUoiwtXCodZTJUYbX5i
	 Kr8AWDoG0G6JU3Jrq1Rt+gmxJE+1X09q+PkqfNhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A34FCF80246;
	Thu, 17 Feb 2022 03:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E5F8F80240; Thu, 17 Feb 2022 03:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com
 [47.90.199.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F79F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 03:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F79F800C0
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R891e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DW; RN=8; SR=0;
 TI=W4_0.1.10_DEFAULT_212542AD_1645066210964_o7001c3461; 
Received: from WS-web
 (yang.lee@linux.alibaba.com[W4_0.1.10_DEFAULT_212542AD_1645066210964_o7001c3461])
 by e01e07484.eu6 at Thu, 17 Feb 2022 10:50:11 +0800
Date: Thu, 17 Feb 2022 10:50:11 +0800
From: "Yang.Lee" <yang.lee@linux.alibaba.com>
To: "perex" <perex@perex.cz>,
 "Srinivasa Rao Mandadapu" <quic_srivasam@quicinc.com>
Message-ID: <57d7ecb9-9643-414e-9483-db63acd8f5b8.yang.lee@linux.alibaba.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIIC1uZXh0XSBBU29DOiBjb2RlYzogd2NkOTM4eDogRml4IE5VTEwg?=
 =?UTF-8?B?YnV0IGRlcmVmZXJlbmNlZCBjb2NjaWNoZWNrIGVycm9y?=
X-Mailer: [Alimail-Mailagent revision 1204][W4_0.1.10][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20220216021116.94384-1-yang.lee@linux.alibaba.com>,
 <6c021509-e29f-2946-b411-64242535a370@quicinc.com>
x-aliyun-mail-creator: W4_0.1.10_DEFAULT_TCwTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzk4LjAuNDc1OC44MCBTYWZhcmkvNTM3LjM2IEVkZy85OC4wLjExMDguNTA=FR
In-Reply-To: <6c021509-e29f-2946-b411-64242535a370@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel <alsa-devel@alsa-project.org>, lgirdwood <lgirdwood@gmail.com>,
 Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, tiwai <tiwai@suse.com>,
 broonie <broonie@kernel.org>
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
Reply-To: "Yang.Lee" <yang.lee@linux.alibaba.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SXQncyBva2F5IGZvciBtZe+8jHRoYW5rcy4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCuWPkeS7tuS6uu+8mlNyaW5pdmFz
YSBSYW8gTWFuZGFkYXB1IDxxdWljX3NyaXZhc2FtQHF1aWNpbmMuY29tPgrlj5HpgIHml7bpl7Tv
vJoyMDIy5bm0MuaciDE25pelKOaYn+acn+S4iSkgMTk6MzQK5pS25Lu25Lq677yaWWFuZyBMaSA8
eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+OyBwZXJleCA8cGVyZXhAcGVyZXguY3o+CuaKhOOA
gOmAge+8mnRpd2FpIDx0aXdhaUBzdXNlLmNvbT47IGxnaXJkd29vZCA8bGdpcmR3b29kQGdtYWls
LmNvbT47IGJyb29uaWUgPGJyb29uaWVAa2VybmVsLm9yZz47IGFsc2EtZGV2ZWwgPGFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZz47IGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz47IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4K5Li744CA6aKY
77yaUmU6IFtQQVRDSCAtbmV4dF0gQVNvQzogY29kZWM6IHdjZDkzOHg6IEZpeCBOVUxMIGJ1dCBk
ZXJlZmVyZW5jZWQgY29jY2ljaGVjayBlcnJvcgoKCk9uIDIvMTYvMjAyMiA3OjQxIEFNLCBZYW5n
IExpIHdyb3RlOgpUaGFua3MgZm9yIEZpeCBZYW5nISEhCldlIGFyZSBnb2luZyB0byBwb3N0IGNv
bXBsZXRlIGNsZWFuZWQgcGF0Y2guIFNoYWxsIHdlIGlnbm9yZSB0aGlzIHBhdGNoIApmb3Igbm93
Pwo+IEVsaW1pbmF0ZSB0aGUgZm9sbG93aW5nIGNvY2NpY2hlY2sgd2FybmluZzoKPiAuL3NvdW5k
L3NvYy9jb2RlY3Mvd2NkOTM4eC5jOjQyMTA6MjEtMjQ6IEVSUk9SOiBjb21wb25lbnQgaXMgTlVM
TCBidXQKPiBkZXJlZmVyZW5jZWQuCj4KPiBSZXBvcnRlZC1ieTogQWJhY2kgUm9ib3QgPGFiYWNp
QGxpbnV4LmFsaWJhYmEuY29tPgo+IEZpeGVzOiAwMTNjYzJhZWEwZjYgKCJBU29DOiBjb2RlYzog
d2NkOTM4eDogQWRkIHN3aXRjaCBjb250cm9sIGZvciBzZWxlY3RpbmcgQ1RJQS9PTVRQIEhlYWRz
ZXQiKQo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgTGkgPHlhbmcubGVlQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IC0tLQo+ICAgc291bmQvc29jL2NvZGVjcy93Y2Q5Mzh4LmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2MvY29kZWNzL3djZDkzOHguYyBiL3NvdW5kL3NvYy9jb2RlY3Mvd2NkOTM4eC5jCj4g
aW5kZXggMjY2M2ZlMGJmNjRmLi5jNDZjNGJmZDg0ZjIgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29j
L2NvZGVjcy93Y2Q5Mzh4LmMKPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3djZDkzOHguYwo+IEBA
IC00MjA3LDcgKzQyMDcsNyBAQCBzdGF0aWMgYm9vbCB3Y2Q5Mzh4X3N3YXBfZ25kX21pYyhzdHJ1
Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwgYm9vbCBhY3Rpdgo+ICAgIHN0cnVjdCB3
Y2Q5Mzh4X3ByaXYgKndjZDkzOHg7Cj4gICAKPiAgICBpZiAoIWNvbXBvbmVudCkgewo+IC0gIGRl
dl9lcnIoY29tcG9uZW50LT5kZXYsICIlcyBjb21wb25lbnQgaXMgTlVMTFxuIiwgX19mdW5jX18p
Owo+ICsgIHByX2VycigiVGhlIHNuZF9zb2NfY29tcG9uZW50IGlzIE5VTExcbiIpOwo+ICAgICBy
ZXR1cm4gZmFsc2U7Cj4gICAgfQo+ICAgCgo=
