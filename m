Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49ABEDC57
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 11:19:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A49177A;
	Mon,  4 Nov 2019 11:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A49177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572862764;
	bh=pV+tsBAUILT6q3yFCKMYBC2KWeb9P5Kg4QTmqFP2q20=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y04o+/D8X/keelcUOK3h+FYhKJlbDBG599PCgkBLt8UTSOoHchsH+5PwsnNB+UHIL
	 CYlVRT9PCfBDal/LWScuwrlrurSTnXmwZyLgAG89Jrbzx7Vqf1DVWrd1Lo9L5+z9U5
	 SzZ9gP9rp0II3PwG1jPPH+eTcFqajo8XYRtieohQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E49D8F8048D;
	Mon,  4 Nov 2019 11:17:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35515F8036C; Thu, 31 Oct 2019 14:57:27 +0100 (CET)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63B4CF8015A
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B4CF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="kqiwf0p2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="C+ziwgP4"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DFFD8537E;
 Thu, 31 Oct 2019 09:47:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 31 Oct 2019 09:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=mxOfBSFmMtNDkPSOJie/vgVchS
 SSrW9932xKMGBkwl4=; b=kqiwf0p2+WFRFjYSGqu+RWMGsO6fuvkeG4l6AOf2hH
 OmBGK9yrr6PzHVze2juELULcdBZKNE6ppkVMpjVzUf8Zfoy+vY4/5FQ0SFfCToZT
 G0poaGByzujt3yA+JN/NtOgTpGalF4Ihcb2jCKziKqILdrzeMCDByYrRZThm/aD7
 Qr87hNHdk95MBJ1sCWm32Yfpg21QiqPCIS5A+JkJc08tLZF4bhW2XtLGqlsleFQ3
 oImk3TgEhDipO5AGiE+7EbOmqLkYQywJai1injDvNsFEAXhaZTZivmX8vhjfBi+8
 i+7FnBQyqLdvbLXBbdv+EFZ1Jscbnt6VzqGwJfan90qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mxOfBS
 FmMtNDkPSOJie/vgVchSSSrW9932xKMGBkwl4=; b=C+ziwgP4Lq6S/b2UlYclsf
 cuQbCIPXiREKnSeouyyA3A1XQPJ/QR6pw7welKc4QwKwFCgvWeE6UbbuN4HvThsN
 cflRjsLtfN8pFsvQDqNpVC5pTJrhJZ//A0qmPYGzzKxbzC7PbSmrRli5cU8rVr1o
 Mx8UbWcCSKlw75PxnYQaGdfHVAHhHvKp5SYbsLeiP0LM4poZmczk89Gs/gb9bT0V
 aS2mlm51A7AICQQSGkOKvlIWHHwk4OVq8PX0MJWVKPrR3jO/JuhC1924OQm4yqqe
 +VTZI7I2pDcttJdktxnpe7S9lfVhxyJma0NBFq77JX2SZyv88axtuzIhpSGoa6AA
 ==
X-ME-Sender: <xms:5OW6XXsjKac-cLE5jiB5Gs6KEGi32dXpWIY5NfBWZcKEzC1f9mghQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddthedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepkedvrd
 dvheegrdegrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5OW6XWJ9JCshUvBTeglksUS7tvVeTJb8YJ9DgWWGgrtEgodaA7PZZQ>
 <xmx:5OW6XS1WFigLB_FaKpA_heus3FTGuteKmv2H7_LDuxMpkZKNutnlOQ>
 <xmx:5OW6XekB3NUWGy1mc_3LIMg-beiVCqYpgOoFF6Fuz95srIDgSFRl_w>
 <xmx:5eW6XQG10NOZThzujco-9w-20MKWRf05yDNh3SsBIuZ5nGpUwR9IYg>
Received: from localhost (lns-bzn-32-82-254-4-138.adsl.proxad.net
 [82.254.4.138])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B85A3060065;
 Thu, 31 Oct 2019 09:47:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, broonie@kernel.org,
 lgirdwood@gmail.com
Date: Thu, 31 Oct 2019 14:47:13 +0100
Message-Id: <20191031134713.241157-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2019 11:17:36 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [alsa-devel] [PATCH] dt-bindings: sound: adau7118: Fix example
	warning
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

VGhlIEFEQVU3MTE4IGhhcyBhbiBleGFtcGxlIHdoZXJlIHRoZSBjb2RlYyBoYXMgYW4gaTJjIGFk
ZHJlc3Mgb2YgMTQsIGFuZAp0aGUgdW5pdCBhZGRyZXNzIHNldCB0byAxNCBhcyB3ZWxsLgoKSG93
ZXZlciwgd2hpbGUgdGhlIGFkZHJlc3MgaXMgZXhwcmVzc2VkIGluIGRlY2ltYWwsIHRoZSB1bml0
LWFkZHJlc3MgaXMKc3VwcG9zZWQgdG8gYmUgaW4gaGV4YWRlY2ltYWwsIHdoaWNoIGVuZHMgdXAg
d2l0aCB0d28gZGlmZmVyZW50IGFkZHJlc3Nlcwp0aGF0IHRyaWdnZXIgYSBEVEMgd2FybmluZy4g
Rml4IHRoaXMgYnkgc2V0dGluZyB0aGUgdW5pdCBhZGRyZXNzIHRvICgweCllLgoKQ2M6IE51bm8g
U8OhIDxudW5vLnNhQGFuYWxvZy5jb20+CkZpeGVzOiA5NjlkNDliMmNkYzggKCJkdC1iaW5kaW5n
czogYXNvYzogQWRkIEFEQVU3MTE4IGRvY3VtZW50YXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwKaW5kZXgg
YzNmMTBhZmJkZDZmLi42NWY2ODQ0YTBjNmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwKQEAgLTY1LDcg
KzY1LDcgQEAgZXhhbXBsZXM6CiAgICAgICAgIC8qIGV4YW1wbGUgd2l0aCBpMmMgc3VwcG9ydCAq
LwogICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgI3NpemUtY2VsbHMgPSA8
MD47Ci0gICAgICAgIGFkYXU3MTE4X2NvZGVjOiBhdWRpby1jb2RlY0AxNCB7CisgICAgICAgIGFk
YXU3MTE4X2NvZGVjOiBhdWRpby1jb2RlY0BlIHsKICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImFkaSxhZGF1NzExOCI7CiAgICAgICAgICAgICAgICAgcmVnID0gPDE0PjsKICAgICAgICAg
ICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
