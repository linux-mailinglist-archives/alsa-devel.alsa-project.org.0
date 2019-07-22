Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F87005A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA8D117E8;
	Mon, 22 Jul 2019 14:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA8D117E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800374;
	bh=qrEfUDChfNd6bi8jILV6uY5nvyT9unYCbb/fsuvFKWI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPw9H7wrquTorUSjDHbqHlFtZoCyIyipPpPOpngZslt9SCjsdObCejr4AEXqfvrBn
	 6A4vYoCmBBPYFL+x89nolxcBjJbNaFTWR+n65iA4q8s3snzmhdJuZj+wRy9q2CRN56
	 B4O9W5nAAHhGjXZea7hzWrMisKnZMPqeX/wQbOeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD87F8048E;
	Mon, 22 Jul 2019 14:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E28AF80483; Mon, 22 Jul 2019 14:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D971F803F4
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D971F803F4
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hpXs2-0005L4-03; Mon, 22 Jul 2019 14:56:50 +0200
Message-ID: <1563800209.2311.10.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Mon, 22 Jul 2019 14:56:49 +0200
In-Reply-To: <20190722124833.28757-7-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-7-daniel.baluta@nxp.com>
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
Subject: Re: [alsa-devel] [PATCH 06/10] ASoC: dt-bindings: Document dl_mask
	property
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
dXRhOgo+IFNBSSBzdXBwb3J0cyB1cCB0byA4IGRhdGEgbGluZXMuIFRoaXMgcHJvcGVydHkgbGV0
IHRoZSB1c2VyCj4gY29uZmlndXJlIGhvdyBtYW55IGRhdGEgbGluZXMgc2hvdWxkIGJlIHVzZWQg
cGVyIHRyYW5zZmVyCj4gZGlyZWN0aW9uIChUeC9SeCkuCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4gLS0tCj4gwqBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLXNhaS50eHQgfCA1ICsrKysrCj4gwqAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9mc2wtc2FpLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9mc2wtc2FpLnR4dAo+IGluZGV4IDJlNzI2Yjk4
Mzg0NS4uNTlmNGQ5NjVhNWZiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9mc2wtc2FpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9mc2wtc2FpLnR4dAo+IEBAIC00OSw2ICs0OSwxMSBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+IMKgCj4gPiDCoMKgwqAtIGJpZy1lbmRpYW4JCTogQm9vbGVhbiBw
cm9wZXJ0eSwgcmVxdWlyZWQgaWYgYWxsIHRoZSBTQUkKPiA+IMKgCQkJwqDCoHJlZ2lzdGVycyBh
cmUgYmlnLWVuZGlhbiByYXRoZXIgdGhhbiBsaXR0bGUtZW5kaWFuLgo+ID4gK8KgwqAtIGZzbCxk
bF9tYXNrCQk6IGxpc3Qgb2YgdHdvIGludGVnZXJzIChiaXRtYXNrLCBmaXJzdCBmb3IgUlgsIHNl
Y29uZAo+ID4gKwkJCcKgwqBmb3IgVFgpIHJlcHJlc2VudGluZyBlbmFibGVkIGRhdGFsaW5lcy4g
Qml0IDAKPiA+ICsJCQnCoMKgcmVwcmVzZW50cyBmaXJzdCBkYXRhIGxpbmUsIGJpdCAxIHJlcHJl
c2VudHMgc2Vjb25kCj4gPiArCQkJwqDCoGRhdGEgbGluZSBhbmQgc28gb24uIERhdGEgbGluZSBp
cyBlbmFibGVkIGlmCj4gPiArCQkJwqDCoGNvcnJlc3BvbmRpbmcgYml0IGlzIHNldCB0byAxLgoK
Tm8gdW5kZXJzY29yZXMgaW4gcHJvcGVydHkgbmFtZXMsIHBsZWFzZS4gQWxzbyB0aGlzIHNob3Vs
ZCBkb2N1bWVudCB0aGUKZGVmYXVsdCB2YWx1ZSB1c2VkIGJ5IHRoZSBkcml2ZXIgd2hlbiB0aGUg
cHJvcGVydHkgaXMgYWJzZW50LgoKUmVnYXJkcywKTHVjYXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
