Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085719C022
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837A01672;
	Sat, 24 Aug 2019 22:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837A01672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678732;
	bh=N1i3q8pYO7WidR3zys9QYk4/YjGmYuG9U4tI+GPPHtY=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpb0/53Y6SlFBp6jKChlO6c0UvRLTqT2GWrpWGV+0jevR8HwmUsqRrLSMTLGWyC3a
	 RYXJeBADZjv5PUnOK5Oc/83xAtdOhvmHNLAly6r4ZJH9sfca8J1/11RMeKl+i+TZ/e
	 ekouPN2KjnXEqKEq3mclLPKcrxiZL0hyw5zckBpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89BAF80638;
	Sat, 24 Aug 2019 22:27:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E087F80391; Sat, 24 Aug 2019 22:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCF82F8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF82F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="i9L0Zee5"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8sF1j5szcY;
 Sat, 24 Aug 2019 22:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678321; bh=GwOHzkGm8clrvcWeJl2STu4OSTCx3WLNVMtfiTxNuU0=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=i9L0Zee55MalxIEpKvOUzzET/ECH4QJvMh9/INDvMqLDNQCRyHC0e79/AGq6lF3xM
 oe9LpME1uZtJ51Ks/ywYRTemHFZiLnNeTgoDOojYvKMM9OjxnD+D+jZ7a+yp9yOQXS
 cDegMH5mHN0ZYq/FIYb1gJ76n2vQ5wz2HbdO29mXq9h4cKijGWtF6GsjsOPj9t/smm
 JS0MeW9j42p44Yz57L2ML+8QtJNDqbXwkanUX6jN/EnO/3NpA5PZXM1wJAIlDJ3eyd
 sz5vtClDHhE2cA1BqGW33Nf2H5QXzeoZ92s6630CzPDmXZKbVuu0HCcxvPgpBkEWU8
 k8KUMWSdVO9jw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:56 +0200
Message-Id: <5f1fd1b8f646c5ced1d838c381b6973e5abccd53.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Rob Herring <robh-dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 5/6] misc: atmel-ssc: get LRCLK pin
	selection from DT
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

U3RvcmUgTFJDTEsgcGluIHNlbGVjdGlvbiBmb3IgdXNlIGJ5IEFTb0MgREFJIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4K
Ci0tLQogIHYyOiBzcGxpdCBmcm9tIEFTb0MgaW1wbGVtZW50YXRpb24KCi0tLQogZHJpdmVycy9t
aXNjL2F0bWVsLXNzYy5jICB8IDkgKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5o
IHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL2F0bWVsLXNzYy5jIGIvZHJpdmVycy9taXNjL2F0bWVsLXNzYy5jCmluZGV4
IGFiNDE0NGVhMWYxMS4uMTMyMmUyOWJjMzdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2MvYXRt
ZWwtc3NjLmMKKysrIGIvZHJpdmVycy9taXNjL2F0bWVsLXNzYy5jCkBAIC0yMTAsNiArMjEwLDE1
IEBAIHN0YXRpYyBpbnQgc3NjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAkJc3NjLT5jbGtf
ZnJvbV9ya19waW4gPQogCQkJb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiYXRtZWwsY2xrLWZy
b20tcmstcGluIik7CisJCXNzYy0+bHJjbGtfZnJvbV90Zl9waW4gPQorCQkJb2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAiYXRtZWwsbHJjbGstZnJvbS10Zi1waW4iKTsKKwkJc3NjLT5scmNsa19m
cm9tX3JmX3BpbiA9CisJCQlvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJhdG1lbCxscmNsay1m
cm9tLXJmLXBpbiIpOworCisJCWlmIChzc2MtPmxyY2xrX2Zyb21fdGZfcGluICYmIHNzYy0+bHJj
bGtfZnJvbV9yZl9waW4pIHsKKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgImJvdGggTFJDTEsgZnJv
bSBSSy9USyBvcHRpb25zIGZvdW5kIGluIERUIG5vZGUiKTsKKwkJCXJldHVybiAtRUlOVkFMOwor
CQl9CiAJfQogCiAJcmVncyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNF
X01FTSwgMCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oIGIvaW5jbHVk
ZS9saW51eC9hdG1lbC1zc2MuaAppbmRleCA2MDkxZDJhYmMxZWIuLmZiZTFjMmZmYWE4MSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9hdG1lbC1zc2MuaAorKysgYi9pbmNsdWRlL2xpbnV4L2F0
bWVsLXNzYy5oCkBAIC0yMSw2ICsyMSw4IEBAIHN0cnVjdCBzc2NfZGV2aWNlIHsKIAlpbnQJCQl1
c2VyOwogCWludAkJCWlycTsKIAlib29sCQkJY2xrX2Zyb21fcmtfcGluOworCWJvb2wJCQlscmNs
a19mcm9tX3RmX3BpbjsKKwlib29sCQkJbHJjbGtfZnJvbV9yZl9waW47CiAJYm9vbAkJCXNvdW5k
X2RhaTsKIH07CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
