Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590495CCF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 13:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4771669;
	Tue, 20 Aug 2019 13:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4771669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566299067;
	bh=Usn2qhrRLFKAHBUKYmywxByl335avbUeBq0xUB6CQCE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MGrG5fSw8NPQFS/SleIjLy5u/yzAgn9l9/HPAtj127rSwqm0yDdlXFTFlfNU88Kfc
	 UDCMcacazdle4Ga1ilqoKRkyIslzUKj5jxeRZzi75krg7LzOX8sOgzCdLNiFzX1yX1
	 2UWGcd5cUyQ1ZE3LZjMdzbPOg3G9vGju51BNE4iQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD19FF8036E;
	Tue, 20 Aug 2019 13:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B509F80391; Tue, 20 Aug 2019 13:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F1FAF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 13:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1FAF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="Eb4rZOLB"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46CSWz127Gz4S;
 Tue, 20 Aug 2019 13:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566298864; bh=7co5wnQ3/O79mxKwCpqnJqCBL6XFasVx/wy1++EocGA=;
 h=Date:From:Subject:To:Cc:From;
 b=Eb4rZOLBebZL0QH5VZLSOw4ImkiN+9qwGzwI4RBTmySuHQgJ3KlfXCVRyJCI3Pdbh
 ZdcELjBEZ8sRWIRoj+7Pkgqsga0KpVurAEoUUmt2QlMwD1yakiPbZ1ejdok5QKNInu
 OClzLQRYyawEklF+OQ5u2xhcu8UcgaDY7sFjOVa8/RpWFbqhFACKmLivcuOqexv+Hy
 lT4xMqBYTnE7nFL3IA8KvKIOOtlAlsmzcDKb3/ueuK/+GZrQu/skpTkFEPDbQR+RgB
 KmNlc4x4Dzsf5ayyF1dNdDr+So1k7rN2s6Xvu2dHL2WpnNtH8Bviw7yl1zGHnC5dmH
 M3j6Os4kwVAaA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Tue, 20 Aug 2019 13:02:35 +0200
Message-Id: <f95ae1085f9f3c137a122c4d95728711613c15f7.1566298834.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 zhong jiang <zhongjiang@huawei.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: wm8904: fix typo in DAPM kcontrol
	name
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

VHJpdmlhbCBmaXggZm9yIHR5cG8gaW4gIkNhcHR1cmUgSW52ZXJ0aW5nIE11eCJlcycgbmFtZS4K
ClNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5w
bD4KQWNrZWQtYnk6IENoYXJsZXMgS2VlcGF4IDxja2VlcGF4QG9wZW5zb3VyY2UuY2lycnVzLmNv
bT4KLS0tCiB2Mjogbm8gY2hhbmdlcwotLS0KIHNvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy93bTg5MDQuYyBiL3NvdW5kL3NvYy9jb2RlY3Mv
d204OTA0LmMKaW5kZXggNWViZGQxZDlhZmRlLi41MjVlNGVmNjU0YTEgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy9jb2RlY3Mvd204OTA0LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy93bTg5MDQuYwpA
QCAtODY2LDcgKzg2Niw3IEBAIHN0YXRpYyBTT0NfRU5VTV9TSU5HTEVfREVDTChsaW5faW52X2Vu
dW0sIFdNODkwNF9BTkFMT0dVRV9MRUZUX0lOUFVUXzEsIDQsCiAJCQkgICAgbGluX3RleHQpOwog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgbGluX2ludl9tdXggPQotCVNP
Q19EQVBNX0VOVU0oIkxlZnQgQ2FwdHVyZSBJbnZldGluZyBNdXgiLCBsaW5faW52X2VudW0pOwor
CVNPQ19EQVBNX0VOVU0oIkxlZnQgQ2FwdHVyZSBJbnZlcnRpbmcgTXV4IiwgbGluX2ludl9lbnVt
KTsKIAogc3RhdGljIGNvbnN0IGNoYXIgKnJpbl90ZXh0W10gPSB7CiAJIklOMVIiLCAiSU4yUiIs
ICJJTjNSIgpAQCAtODgyLDcgKzg4Miw3IEBAIHN0YXRpYyBTT0NfRU5VTV9TSU5HTEVfREVDTChy
aW5faW52X2VudW0sIFdNODkwNF9BTkFMT0dVRV9SSUdIVF9JTlBVVF8xLCA0LAogCQkJICAgIHJp
bl90ZXh0KTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHJpbl9pbnZf
bXV4ID0KLQlTT0NfREFQTV9FTlVNKCJSaWdodCBDYXB0dXJlIEludmV0aW5nIE11eCIsIHJpbl9p
bnZfZW51bSk7CisJU09DX0RBUE1fRU5VTSgiUmlnaHQgQ2FwdHVyZSBJbnZlcnRpbmcgTXV4Iiwg
cmluX2ludl9lbnVtKTsKIAogc3RhdGljIGNvbnN0IGNoYXIgKmFpZl90ZXh0W10gPSB7CiAJIkxl
ZnQiLCAiUmlnaHQiCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
