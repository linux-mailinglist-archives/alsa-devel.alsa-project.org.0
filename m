Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC5363F7E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 12:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788BC167A;
	Mon, 19 Apr 2021 12:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788BC167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618827804;
	bh=4CzKgMWrq0j+xjikpok7iyEFlqcv2v+l/z3QqqyTEmw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=XqUyGqanDdcCS+Pkv66KmLokQfvJwnP1ngUngeR5+krHcU4VppjfQiTslHpC+lvFV
	 h4UqAgXakEDEWfRnc4JuwpWwm8CcqQ6O0vMMC13E69liCeWM+3snKSZbKiy7z182iN
	 jpHkNkMkdn3REya1O7OscsiaGprjQv0yykDZHdVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3055F80256;
	Mon, 19 Apr 2021 12:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E8B3F80227; Mon, 19 Apr 2021 12:21:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7E25F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 12:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7E25F8014D
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DW; RN=4; SR=0;
 TI=W4_6173578_DEFAULT_0AC264AF_1618827594862_o7001c175f; 
Received: from WS-web
 (yang.lee@linux.alibaba.com[W4_6173578_DEFAULT_0AC264AF_1618827594862_o7001c175f])
 by e01e01353.eu6 at Mon, 19 Apr 2021 18:21:42 +0800
Date: Mon, 19 Apr 2021 18:21:42 +0800
From: "Yang.Lee" <yang.lee@linux.alibaba.com>
To: "Takashi Iwai" <tiwai@suse.de>
Message-ID: <9f86e311-dd90-4df8-ae37-09d600e76820.yang.lee@linux.alibaba.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIXSBBTFNBOiBzZXE6IG9zczogRml4IGluY29uc2lzdGVudCBpbmRl?=
 =?UTF-8?B?bnRpbmc=?=
X-Mailer: [Alimail-Mailagent][W4_6173578][DEFAULT][Chrome]
MIME-Version: 1.0
References: <1618567244-5704-1-git-send-email-yang.lee@linux.alibaba.com>,
 <s5hlf9iqznu.wl-tiwai@suse.de>
x-aliyun-mail-creator: W4_6173578_DEFAULT_TCwTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg5LjAuNDM4OS4xMTQgU2FmYXJpLzUzNy4zNiBFZGcvODkuMC43NzQuNjg=FR
In-Reply-To: <s5hlf9iqznu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Cc: alsa-devel <alsa-devel@alsa-project.org>, tiwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCByZXZpc2UgYW5kIHN1Ym1pdCBp
dCBhY2NvcmRpbmcgdG8gdGhlIGNvbnRleHQgaW4gdGhlIGZ1dHVyZS4KCnlhbmcKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CuWPkeS7tuS6uu+8mlRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4K5Y+R6YCB5pe26Ze077ya
MjAyMeW5tDTmnIgxNuaXpSjmmJ/mnJ/kupQpIDE4OjQxCuaUtuS7tuS6uu+8mllhbmcgTGkgPHlh
bmcubGVlQGxpbnV4LmFsaWJhYmEuY29tPgrmioTjgIDpgIHvvJpwZXJleCA8cGVyZXhAcGVyZXgu
Y3o+OyB0aXdhaSA8dGl3YWlAc3VzZS5jb20+OyBhbHNhLWRldmVsIDxhbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmc+OyBsaW51eC1rZXJuZWwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+
CuS4u+OAgOmimO+8mlJlOiBbUEFUQ0hdIEFMU0E6IHNlcTogb3NzOiBGaXggaW5jb25zaXN0ZW50
IGluZGVudGluZwoKCk9uIEZyaSwgMTYgQXByIDIwMjEgMTI6MDA6NDQgKzAyMDAsCllhbmcgTGkg
d3JvdGU6Cj4gCj4gS2VybmVsIHRlc3Qgcm9ib3QgdGhyb3dzIGJlbG93IHdhcm5pbmcgLT4KPiAK
PiBzbWF0Y2ggd2FybmluZ3M6Cj4gc291bmQvY29yZS9zZXEvb3NzL3NlcV9vc3NfZXZlbnQuYzoy
OTcgbm90ZV9vbl9ldmVudCgpIHdhcm46Cj4gaW5jb25zaXN0ZW50IGluZGVudGluZwo+IAo+IEZp
eGVkIHRoZSBpbmNvbnNpc3RlbnQgaW5kZW50aW5nLgo+IAo+IFJlcG9ydGVkLWJ5OiBBYmFjaSBS
b2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBMaSA8
eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gIHNvdW5kL2NvcmUvc2VxL29zcy9z
ZXFfb3NzX2V2ZW50LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9jb3JlL3NlcS9vc3Mvc2VxX29z
c19ldmVudC5jIGIvc291bmQvY29yZS9zZXEvb3NzL3NlcV9vc3NfZXZlbnQuYwo+IGluZGV4IDdi
N2M5MjUuLjlhNDI3MTMgMTAwNjQ0Cj4gLS0tIGEvc291bmQvY29yZS9zZXEvb3NzL3NlcV9vc3Nf
ZXZlbnQuYwo+ICsrKyBiL3NvdW5kL2NvcmUvc2VxL29zcy9zZXFfb3NzX2V2ZW50LmMKPiBAQCAt
Mjk0LDcgKzI5NCw3IEBACj4gICAgICAvKiBzZXQgdm9sdW1lIHRvIHplcm8gLS0gbm90ZSBvZmYg
Ki8KPiAgICAgLy8gdHlwZSA9IFNORFJWX1NFUV9FVkVOVF9OT1RFT0ZGOwo+ICAgICAvL2Vsc2UK
PiAtICAgIGlmIChpbmZvLT5jaFtjaF0udmVsKQo+ICsgICBpZiAoaW5mby0+Y2hbY2hdLnZlbCkK
PiAgICAgIC8qIHNhbXBsZSBhbHJlYWR5IHN0YXJ0ZWQgLS0gdm9sdW1lIGNoYW5nZSAqLwo+ICAg
ICAgdHlwZSA9IFNORFJWX1NFUV9FVkVOVF9LRVlQUkVTUzsKClRoZSBsaW5lIHdhcyBhbGlnbmVk
IHdpdGggdGhlIGNvbW1lbnRlZCBpZiBibG9jay4KSWYgYW55LCB3ZSBzaG91bGQgcmF0aGVyIGNs
ZWFuIHVwIGFuZCByZS1mb3JtYXQgdGhlIHdob2xlIGJsb2NrLgooQnV0LCBPVE9ILCB5b3Ugc2hv
dWxkbid0IHJlbW92ZSB0aGUgc3R1ZmYgd2l0aG91dCB1bmRlcnN0YW5kaW5nCnRoZSBjb250ZXh0
LikKCgp0aGFua3MsCgpUYWthc2hp
