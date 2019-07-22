Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BA470056
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 719D416AC;
	Mon, 22 Jul 2019 14:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 719D416AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800332;
	bh=0Douq5PA1Q0j2v2q14Z33NO9Wx13stTYrwpBc5BCz+Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HK106NXAkP2hSVmSigixrPk0ArvoT1lYzhWJAL13e+2TozI7vxWeHwu3ZVoqYCs9Y
	 c99EX7U6t2Ryadfs1cJy3k6kumwuGMXHLEdCVI+Bjdhhrjco2yR/OwGsUoT9Se7we4
	 ZeIH+mGeFfM+/wxMy0/huaUozUXW9/zNKAJgOJeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B053F80481;
	Mon, 22 Jul 2019 14:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E51F0F80446; Mon, 22 Jul 2019 14:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D99F803F3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D99F803F3
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hpXr7-0005EL-1U; Mon, 22 Jul 2019 14:55:53 +0200
Message-ID: <1563800148.2311.9.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Mon, 22 Jul 2019 14:55:48 +0200
In-Reply-To: <20190722124833.28757-6-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-6-daniel.baluta@nxp.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 05/10] ASoC: fsl_sai: Add support to enable
 multiple data lines
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

QW0gTW9udGFnLCBkZW4gMjIuMDcuMjAxOSwgMTU6NDggKzAzMDAgc2NocmllYiBEYW5pZWwgQmFs
dXRhOgo+IFNBSSBzdXBwb3J0cyB1cCB0byA4IFJ4L1R4IGRhdGEgbGluZXMgd2hpY2ggY2FuIGJl
IGVuYWJsZWQKPiB1c2luZyBUQ0UvUkNFIGJpdHMgb2YgVENSMy9SQ1IzIHJlZ2lzdGVycy4KPiAK
PiBEYXRhIGxpbmVzIHRvIGJlIGVuYWJsZWQgYXJlIHJlYWQgZnJvbSBEVCBmc2wsZGxfbWFzayBw
cm9wZXJ0eS4KPiBCeSBkZWZhdWx0IChpZiBubyBEVCBlbnRyeSBpcyBwcm92aWRlZCkgb25seSBk
YXRhIGxpbmUgMCBpcyBlbmFibGVkLgo+IAo+IE5vdGU6Cj4gV2UgY2FuIG9ubHkgZW5hYmxlIGNv
bnNlY3V0aXZlIGRhdGEgbGluZXMgc3RhcnRpbmcgd2l0aCBkYXRhIGxpbmUgIzAuCgpXaHkgaXMg
dGhlIHByb3BlcnR5IGEgYml0bWFzayB0aGVuPyBUbyBtZSB0aGlzIHNvdW5kcyBsaWtlIHdlIHdh
bnQgdG8KaGF2ZSB0aGUgbnVtYmVyIG9mIGxhbmVzIGluIHRoZSBEVCBhbmQgY29udmVydCB0byB0
aGUgYml0bWFzayBpbnNpZGUKdGhlIGRyaXZlci4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
QmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4gLS0tCj4gwqBzb3VuZC9zb2MvZnNsL2Zz
bF9zYWkuYyB8IDEwICsrKysrKysrKy0KPiDCoHNvdW5kL3NvYy9mc2wvZnNsX3NhaS5oIHzCoMKg
NiArKysrLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgYi9zb3VuZC9z
b2MvZnNsL2ZzbF9zYWkuYwo+IGluZGV4IDc2ODM0MTYwODY5NS4uZDBmYTAyMTg4YjdjIDEwMDY0
NAo+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jCj4gKysrIGIvc291bmQvc29jL2ZzbC9m
c2xfc2FpLmMKPiBAQCAtNjAxLDcgKzYwMSw3IEBAIHN0YXRpYyBpbnQgZnNsX3NhaV9zdGFydHVw
KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+IMKgCj4gPiDCoAlyZWdtYXBf
dXBkYXRlX2JpdHMoc2FpLT5yZWdtYXAsIEZTTF9TQUlfeENSMyh0eCksCj4gPiDCoAkJCcKgwqDC
oEZTTF9TQUlfQ1IzX1RSQ0VfTUFTSywKPiA+IC0JCQnCoMKgwqBGU0xfU0FJX0NSM19UUkNFKTsK
PiA+ICsJCQnCoMKgwqBGU0xfU0FJX0NSM19UUkNFKHNhaS0+c29jX2RhdGEtPmRsX21hc2tbdHhd
KTsKPiDCoAo+ID4gwqAJcmV0ID0gc25kX3BjbV9od19jb25zdHJhaW50X2xpc3Qoc3Vic3RyZWFt
LT5ydW50aW1lLCAwLAo+ID4gwqAJCQlTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSwgJmZzbF9zYWlf
cmF0ZV9jb25zdHJhaW50cyk7Cj4gQEAgLTg4Nyw2ICs4ODcsMTQgQEAgc3RhdGljIGludCBmc2xf
c2FpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiDCoAkJfQo+ID4gwqAJ
fQo+IMKgCj4gPiArCS8qIGFjdGl2ZSBkYXRhIGxpbmVzIG1hc2sgZm9yIFRYL1JYLCBkZWZhdWx0
cyB0byAxIChvbmx5IHRoZSBmaXJzdAo+ID4gKwnCoCogZGF0YSBsaW5lIGlzIGVuYWJsZWQKPiAr
CcKgKi8KCkNvbW1lbnQgc3R5bGUgbm90IGluIGxpbmUgd2l0aCBMaW51eCBjb2Rpbmcgc3R5bGUu
CgpSZWdhcmRzLApMdWNhcwoKPiArCXNhaS0+ZGxfbWFza1tSWF0gPSAxOwo+ID4gKwlzYWktPmRs
X21hc2tbVFhdID0gMTsKPiA+ICsJb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJmc2ws
ZGxfbWFzayIsIFJYLCAmc2FpLT5kbF9tYXNrW1JYXSk7Cj4gPiArCW9mX3Byb3BlcnR5X3JlYWRf
dTMyX2luZGV4KG5wLCAiZnNsLGRsX21hc2siLCBUWCwgJnNhaS0+ZGxfbWFza1tUWF0pOwo+ICsK
PiA+IMKgCWlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gPiDCoAlpZiAoaXJxIDwg
MCkgewo+ID4gwqAJCWRldl9lcnIoJnBkZXYtPmRldiwgIm5vIGlycSBmb3Igbm9kZSAlc1xuIiwg
cGRldi0+bmFtZSk7Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5oIGIvc291
bmQvc29jL2ZzbC9mc2xfc2FpLmgKPiBpbmRleCBiMWFiZWVkMmY3OGUuLjZkMzJmMDk1MGVjNSAx
MDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuaAo+ICsrKyBiL3NvdW5kL3NvYy9m
c2wvZnNsX3NhaS5oCj4gQEAgLTEwOSw4ICsxMDksOCBAQAo+ID4gwqAjZGVmaW5lIEZTTF9TQUlf
Q1IyX0RJVl9NQVNLCTB4ZmYKPiDCoAo+IMKgLyogU0FJIFRyYW5zbWl0IGFuZCBSZWNlaXZlIENv
bmZpZ3VyYXRpb24gMyBSZWdpc3RlciAqLwo+ID4gLSNkZWZpbmUgRlNMX1NBSV9DUjNfVFJDRQlC
SVQoMTYpCj4gPiAtI2RlZmluZSBGU0xfU0FJX0NSM19UUkNFX01BU0sJR0VOTUFTSygxNiwgMjMp
Cj4gPiArI2RlZmluZSBGU0xfU0FJX0NSM19UUkNFKHgpCSgoeCkgPDwgMTYpCj4gPiArI2RlZmlu
ZSBGU0xfU0FJX0NSM19UUkNFX01BU0sJR0VOTUFTSygyMywgMTYpCj4gPiDCoCNkZWZpbmUgRlNM
X1NBSV9DUjNfV0RGTCh4KQkoeCkKPiA+IMKgI2RlZmluZSBGU0xfU0FJX0NSM19XREZMX01BU0sJ
MHgxZgo+IMKgCj4gQEAgLTE3Niw2ICsxNzYsOCBAQCBzdHJ1Y3QgZnNsX3NhaSB7Cj4gPiDCoAl1
bnNpZ25lZCBpbnQgc2xvdHM7Cj4gPiDCoAl1bnNpZ25lZCBpbnQgc2xvdF93aWR0aDsKPiDCoAo+
ID4gKwl1bnNpZ25lZCBpbnQgZGxfbWFza1syXTsKPiArCj4gPiDCoAljb25zdCBzdHJ1Y3QgZnNs
X3NhaV9zb2NfZGF0YSAqc29jX2RhdGE7Cj4gPiDCoAlzdHJ1Y3Qgc25kX2RtYWVuZ2luZV9kYWlf
ZG1hX2RhdGEgZG1hX3BhcmFtc19yeDsKPiA+IMKgCXN0cnVjdCBzbmRfZG1hZW5naW5lX2RhaV9k
bWFfZGF0YSBkbWFfcGFyYW1zX3R4OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
