Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC5470898
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 20:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D462F1837;
	Mon, 22 Jul 2019 20:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D462F1837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563820195;
	bh=VQ5EIk3H2gk5RRATJiMCfTqVxmBT1WDSlxjMOHrjCyo=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cv5RzW+a21JiSixqZsRYibbsOxJJMqolGexAP2MsGmms4Rp+IH3PeMlM69eTdll+W
	 mEYQA24Uc82kP1h/qm5kzQPt/M3DQ6kh6eeE4mgvb7dShLTqC9kGEZWz+WODtmtR9G
	 mYLoA9l4svFIE8xSZew4RkffpB3SVHaGFe4nY0YA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88DCFF803F3;
	Mon, 22 Jul 2019 20:27:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C22AF803D6; Mon, 22 Jul 2019 20:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FE9F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 20:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FE9F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="lvyAAgFU"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sqmn3gY4zGX;
 Mon, 22 Jul 2019 20:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563819961; bh=o11/fvUHST61XsrhzX92oopWdvyJlkrWA428U/YRagA=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=lvyAAgFUyqGWin5itnIdpHStuHlrNYCc/+LrEafpbcPXkotEsQAg2iZQGZOrEjMFy
 8vymqegj6X+Q7nWusjeWvCQRSODIPt2Y0V/TAJALFWSZVzh7huolo9p/yScGstra+b
 Zeu6NhN+ZJdf0HAxOK3WUckTtdXO88GWD2BlqHDx4mEJfHnwV3Z8sx9QUHuyWCmrWT
 VTIVZV18rkuzkByf5nI/dcEmIAs/j+ciE8m1S+zxKsA62U4yDG3UhrY8oaa+Gqvja6
 GY2FV4Wrq2XUDG4oDhlXudGZX6kGZQVrZYyKgirWPcLrzsqfPZ1iiIZhPDZuB4bhvY
 M32d+ddYEd/zg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 20:27:20 +0200
Message-Id: <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in Kconfig
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

QWxsb3cgU1NDIHRvIGJlIHVzZWQgb24gcGxhdGZvcm1zIGRlc2NyaWJlZCB1c2luZyBhdWRpby1n
cmFwaC1jYXJkCmluIERldmljZSBUcmVlLgoKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WC
YXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgotLS0KIHNvdW5kL3NvYy9hdG1lbC9LY29uZmln
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL0tjb25maWcgYi9zb3VuZC9zb2MvYXRtZWwvS2Nv
bmZpZwppbmRleCAwNmMxZDVjZTY0MmMuLjllZjlkMjViYjUxNyAxMDA2NDQKLS0tIGEvc291bmQv
c29jL2F0bWVsL0tjb25maWcKKysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcKQEAgLTI1LDcg
KzI1LDcgQEAgY29uZmlnIFNORF9BVE1FTF9TT0NfRE1BCiAJZGVmYXVsdCB5IGlmIFNORF9BVE1F
TF9TT0NfU1NDX0RNQT15IHx8IChTTkRfQVRNRUxfU09DX1NTQ19ETUE9bSAmJiBTTkRfQVRNRUxf
U09DX1NTQz15KQogCiBjb25maWcgU05EX0FUTUVMX1NPQ19TU0NfRE1BCi0JdHJpc3RhdGUKKwl0
cmlzdGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxlciB1c2lu
ZyBETUEiCiAKIGNvbmZpZyBTTkRfQVRNRUxfU09DX1NTQwogCXRyaXN0YXRlCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
