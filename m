Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA270087
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9469C17E8;
	Mon, 22 Jul 2019 15:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9469C17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800766;
	bh=UmXreH6ruT6iRMHt9qEbif8exNIn2QWE7Y8WELcf6Po=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvpfmn/OJypsDfcf9bBGeUvS9Of7N0rGcPufyrzUV2ALTElr1xfMKIS5Vwah9Cdc7
	 fUKtWwnrp/oOULrdCIKgcQZJDonOi5W5MEYlrCCcj6P6/XFeb3PSUoX4e1EU+iFIY2
	 tkeBlY9wDaZOwr88uMiw/tBSklGgeIuNaFApoGu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 035B7F803D5;
	Mon, 22 Jul 2019 15:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC24F803D5; Mon, 22 Jul 2019 15:04:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF0E3F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF0E3F800F5
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hpXz6-0005yy-7y; Mon, 22 Jul 2019 15:04:08 +0200
Message-ID: <1563800647.2311.13.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Mon, 22 Jul 2019 15:04:07 +0200
In-Reply-To: <20190722124833.28757-11-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-11-daniel.baluta@nxp.com>
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
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: fsl_sai: Add support for
	imx7ulp/imx8mq
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
dXRhOgo+IFNBSSBtb2R1bGUgb24gaW14N3VscC9pbXg4bSBmZWF0dXJlcyAyIG5ldyByZWdpc3Rl
cnMgKFZFUklEIGFuZCBQQVJBTSkKPiBhdCB0aGUgYmVnaW5uaW5nIG9mIHJlZ2lzdGVyIGFkZHJl
c3Mgc3BhY2UuCj4gCj4gT24gaW14N3VscCBGSUZPcyBjYW4gaGVsZCB1cCB0byAxNiB4IDMyIGJp
dCBzYW1wbGVzLgo+IE9uIGlteDhtcSBGSUZPcyBjYW4gaGVsZCB1cCB0byAxMjggeCAzMiBiaXQg
c2FtcGxlcy4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1
dGFAbnhwLmNvbT4KPiAtLS0KPiDCoHNvdW5kL3NvYy9mc2wvZnNsX3NhaS5jIHwgMTQgKysrKysr
KysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMK
PiBpbmRleCBmMjQ0MWI4NDg3N2UuLmIwNTgzNzQ2NWI1YSAxMDA2NDQKPiAtLS0gYS9zb3VuZC9z
b2MvZnNsL2ZzbF9zYWkuYwo+ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jCj4gQEAgLTEw
NjUsMTAgKzEwNjUsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmc2xfc2FpX3NvY19kYXRhIGZz
bF9zYWlfaW14NnN4X2RhdGEgPSB7Cj4gPiDCoAkucmVnX29mZnNldCA9IDAsCj4gwqB9Owo+IMKg
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZnNsX3NhaV9zb2NfZGF0YSBmc2xfc2FpX2lteDd1bHBf
ZGF0YSA9IHsKPiA+ICsJLnVzZV9pbXhfcGNtID0gdHJ1ZSwKPiA+ICsJLmZpZm9fZGVwdGggPSAx
NiwKPiA+ICsJLnJlZ19vZmZzZXQgPSA4LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBmc2xfc2FpX3NvY19kYXRhIGZzbF9zYWlfaW14OG1xX2RhdGEgPSB7Cj4gPiArCS51c2VfaW14
X3BjbSA9IHRydWUsCj4gPiArCS5maWZvX2RlcHRoID0gMTI4LAo+ID4gKwkucmVnX29mZnNldCA9
IDgsCj4gK307Cj4gKwo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZnNsX3Nh
aV9pZHNbXSA9IHsKPiA+IMKgCXsgLmNvbXBhdGlibGUgPSAiZnNsLHZmNjEwLXNhaSIsIC5kYXRh
ID0gJmZzbF9zYWlfdmY2MTBfZGF0YSB9LAo+ID4gwqAJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14
NnN4LXNhaSIsIC5kYXRhID0gJmZzbF9zYWlfaW14NnN4X2RhdGEgfSwKPiA+IMKgCXsgLmNvbXBh
dGlibGUgPSAiZnNsLGlteDZ1bC1zYWkiLCAuZGF0YSA9ICZmc2xfc2FpX2lteDZzeF9kYXRhIH0s
Cj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtc2FpIiwgLmRhdGEgPSAmZnNsX3Nh
aV9pbXg3dWxwX2RhdGEgfSwKPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14OG1xLXNhaSIs
IC5kYXRhID0gJmZzbF9zYWlfaW14OG1xX2RhdGEgfSwKPiA+IApUaG9zZSB0d28gbmV3IGNvbXBh
dGlibGVzIG5lZWQgdG8gYmUgZG9jdW1lbnRlZCBpbiB0aGUgRFQgYmluZGluZ3MuCgpSZWdhcmRz
LApMdWNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
