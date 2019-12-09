Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC65117469
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 19:39:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19AE165D;
	Mon,  9 Dec 2019 19:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19AE165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575916755;
	bh=v+72pmE7V+zFPv63kxvrGYi1FSf08ltTqydWQwBxAlU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOGzsqIo/6dCzm6gEXmTmGxKgcHf9fXbjy/QmQOXI/Mx/ss9EZrmsWcL1O+kERx5W
	 2xsW6OX1BuiswYEF3ahYuHGufXnM9fJD8gh4daKgiuxjNhsZhycQGcFOGzJzL3m1Qf
	 C2SIAMfmkbDFUlAMw0FovRN0FmN+pqTOM+z61h9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5119F80245;
	Mon,  9 Dec 2019 19:35:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D806F80259; Mon,  9 Dec 2019 19:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id 16122F800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16122F800C4
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 710322E5CDD;
 Mon,  9 Dec 2019 18:29:04 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  9 Dec 2019 19:35:02 +0100
Message-Id: <20191209183511.3576038-3-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 02/10] dt-bindings: i2c: Add documentation for
	ad242x i2c controllers
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

VGhpcyBkZXZpY2UgbXVzdCBiZSBwbGFjZWQgYXMgYSBzdWItZGV2aWNlIG9mIGFuIEFEMjQyeCBN
RkQgbm9kZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4K
LS0tCiAuLi4vYmluZGluZ3MvaTJjL2FkaSxhZDI0MngtaTJjLnlhbWwgICAgICAgICAgfCAzMSAr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYWRp
LGFkMjQyeC1pMmMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pMmMvYWRpLGFkMjQyeC1pMmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvYWRpLGFkMjQyeC1pMmMueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLmRlZDkyZjhhNzkxYgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYWRpLGFkMjQyeC1pMmMueWFtbApAQCAt
MCwwICsxLDMxIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0Qt
Mi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvaTJjL2FkaSxhZDI0MngtaTJjLnlhbWwjIgorJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKKwordGl0bGU6IEFuYWxvZyBEZXZpY2Vz
IEFEMjQyeCBJMkMgY29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBEYW5pZWwgTWFjayA8
ZGFuaWVsQHpvbnF1ZS5vcmc+CisKK2FsbE9mOgorICAtICRyZWY6IC9zY2hlbWFzL2kyYy9pMmMt
Y29udHJvbGxlci55YW1sIworCitkZXNjcmlwdGlvbjogfAorICBUaGlzIG1vZHVsZSBpcyBwYXJ0
IG9mIHRoZSBBRDI0MnggTUZEIGRldmljZS4gRm9yIG1vcmUgZGV0YWlscyBhbmQgYW4gZXhhbXBs
ZQorICByZWZlciB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2FkMjQy
eC55YW1sLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAt
IGFkaSxhZDI0Mjh3LWkyYworCisgIGNsb2NrLWZyZXF1ZW5jeToKKyAgICAkcmVmOiAnL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyJworICAgIGRlZmF1bHQ6IDEwMDAwMAor
ICAgIGVudW06IFsxMDAwMDAsIDQwMDAwMF0KKyAgICBkZXNjcmlwdGlvbjogU3BlY2lmaWVzIHRo
ZSBJwrJDIGNsb2NrIGZyZXF1ZW5jeSBpbiBIei4KKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJs
ZQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
