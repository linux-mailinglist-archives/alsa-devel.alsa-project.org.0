Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58D95C59
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 12:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A2E7166D;
	Tue, 20 Aug 2019 12:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A2E7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566297324;
	bh=u/BSr2SRm46D4FoA6XnkkdBEhII3CkFUAggUtOpTFMQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LIpwSE0QuEMs+jfwdJqEZuH8HZHny9AgjT0Ox/9tCUhwq4BzeT66awBtJubG8oA+4
	 A/STeJ/ftf8KUu4y1G8ENJ6bxjVdXQFeDRFxc/k2QqtXtBYsP4ugygfh2PJddiIk3i
	 a6ZPZAxk2A+rkrZUV8spZ8JU78WOsDRo2yHxOSoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FE8F8036E;
	Tue, 20 Aug 2019 12:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14C0F80391; Tue, 20 Aug 2019 12:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BFD9F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 12:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BFD9F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="g6gNwASi"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46CRtP56PTzGK;
 Tue, 20 Aug 2019 12:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566297119; bh=tGIjlWo4R4Ae8siv2EZMaotG+hGJXlGdM2zBh7Grdl8=;
 h=Date:From:Subject:To:Cc:From;
 b=g6gNwASiLfwwQWeYqfu6g5HjeVFOLIxeg3X7gkSkt23XopTy4xKrI38Lq/ggoeQhZ
 EsMBMgmtKvnv68kOrGDoGy+kBUxeiwA/tY4uvFahFSiE3SRiKAWlV71PC/7nh/kfxx
 2HIrJmn20oHngmGOG/5A7dVkWmPqOXVfH3xDCGH/rotR03fqynn+4i9igQ7SjI9G1Y
 gTcUKlF7TStlZb4VxcHQge6UJdcu605RRVcgAfv1TVR8pkHGdK9LSpxcuBD9DxKb4J
 1m+Ct8VG2Pgl8fB/F2G2kE0yw9H7/hR3Ilsf5benojnZRnmNVqFJwfNz/JkYikha3l
 1Qyr4ycB1uTxg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Tue, 20 Aug 2019 12:33:29 +0200
Message-Id: <f95ae1085f9f3c137a122c4d95728711613c15f7.1566297120.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH 1/2] ASoC: wm8904: fix typo in DAPM kcontrol
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
bD4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL3dtODkwNC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9jb2RlY3Mvd204OTA0LmMgYi9zb3VuZC9zb2MvY29kZWNzL3dtODkwNC5jCmluZGV4IDVlYmRk
MWQ5YWZkZS4uNTI1ZTRlZjY1NGExIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvY29kZWNzL3dtODkw
NC5jCisrKyBiL3NvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmMKQEAgLTg2Niw3ICs4NjYsNyBAQCBz
dGF0aWMgU09DX0VOVU1fU0lOR0xFX0RFQ0wobGluX2ludl9lbnVtLCBXTTg5MDRfQU5BTE9HVUVf
TEVGVF9JTlBVVF8xLCA0LAogCQkJICAgIGxpbl90ZXh0KTsKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfa2NvbnRyb2xfbmV3IGxpbl9pbnZfbXV4ID0KLQlTT0NfREFQTV9FTlVNKCJMZWZ0IENh
cHR1cmUgSW52ZXRpbmcgTXV4IiwgbGluX2ludl9lbnVtKTsKKwlTT0NfREFQTV9FTlVNKCJMZWZ0
IENhcHR1cmUgSW52ZXJ0aW5nIE11eCIsIGxpbl9pbnZfZW51bSk7CiAKIHN0YXRpYyBjb25zdCBj
aGFyICpyaW5fdGV4dFtdID0gewogCSJJTjFSIiwgIklOMlIiLCAiSU4zUiIKQEAgLTg4Miw3ICs4
ODIsNyBAQCBzdGF0aWMgU09DX0VOVU1fU0lOR0xFX0RFQ0wocmluX2ludl9lbnVtLCBXTTg5MDRf
QU5BTE9HVUVfUklHSFRfSU5QVVRfMSwgNCwKIAkJCSAgICByaW5fdGV4dCk7CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyByaW5faW52X211eCA9Ci0JU09DX0RBUE1fRU5V
TSgiUmlnaHQgQ2FwdHVyZSBJbnZldGluZyBNdXgiLCByaW5faW52X2VudW0pOworCVNPQ19EQVBN
X0VOVU0oIlJpZ2h0IENhcHR1cmUgSW52ZXJ0aW5nIE11eCIsIHJpbl9pbnZfZW51bSk7CiAKIHN0
YXRpYyBjb25zdCBjaGFyICphaWZfdGV4dFtdID0gewogCSJMZWZ0IiwgIlJpZ2h0IgotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
