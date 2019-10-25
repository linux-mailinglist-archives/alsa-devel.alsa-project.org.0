Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4256E6D47
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394B51AF2;
	Mon, 28 Oct 2019 08:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394B51AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248104;
	bh=hWHZmJVa2GJ+T63cjFSf8GzCUoqun93lDs6zPwywLxE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mUCxyrnx6VapaHmepIsvNTktdAuP2Yed1ipM0fjJwg9OxaKsqYL9/N84wTisfK5WE
	 DuRlSb5N5+vGLtTcs9TW74CXzD2KAjf5zAXlahNCidRlNJ87iPKRk1SPbkimH+mLag
	 1i7k3hqokS8T1gAhn7iN5OIXfO9EthBv3rUAn/Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 484F7F80361;
	Mon, 28 Oct 2019 08:33:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C525EF8036F; Fri, 25 Oct 2019 07:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1BDF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 07:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1BDF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="MUki5QF2"
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46zsj62wkXz9sPh; Fri, 25 Oct 2019 16:14:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571980442;
 bh=XUnk/aDzI0RoSsU6UPnlmFhYiY8BJtc3RoeNDTw86bM=;
 h=From:To:Cc:Subject:Date:From;
 b=MUki5QF2/NzyA9s6I4tsE0/RhIMRunvvcWUI/eur+Y3/IFtPPa5GAwPuoJQsX84HS
 mnIMlmHusHuUlAZMruibKVWTPQOQ+ej3SD/XamhJyeeWhKmSSM6Uj2JdFYm39w3olA
 xzqHC06myjj6dleKseudkjfXnyAYyneGY+QlR9yrvnQt31J4OKDyt0F620cncHR41v
 i2Y3cI3Ytx1xdjYQ4rDviFhu94UY5i0kwXliphOuklCXrKvmpIjNEoeXmbCjVtc1Em
 F7yArYWGpmOjSVnXff5xvKf/of+78I4EUxYdXTpFBgOSOIBK3CKrCkyO8Tdr+jLgGX
 Bykg0EcXt+WCA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 16:13:53 +1100
Message-Id: <20191025051353.2878-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:33:18 +0100
Cc: linuxppc-dev@ozlabs.org, broonie@kernel.org,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH] ASoC: fsl: fsl_dma: fix build failure
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

Q29tbWl0IDRhYzg1ZGU5OTc3ZSAoIkFTb0M6IGZzbDogZnNsX2RtYTogcmVtb3ZlIHNuZF9wY21f
b3BzIikgcmVtb3ZlZApmc2xfZG1hX29wcyBidXQgbGVmdCBhIHVzYWdlLCBsZWFkaW5nIHRvIGEg
YnVpbGQgZXJyb3IgZm9yIHNvbWUKY29uZmlncywgZWcuIG1wYzg1eHhfZGVmY29uZmlnOgoKICBz
b3VuZC9zb2MvZnNsL2ZzbF9kbWEuYzogSW4gZnVuY3Rpb24g4oCYZnNsX3NvY19kbWFfcHJvYmXi
gJk6CiAgc291bmQvc29jL2ZzbC9mc2xfZG1hLmM6OTA1OjE4OiBlcnJvcjog4oCYZnNsX2RtYV9v
cHPigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiAgICBkbWEtPmRh
aS5vcHMgPSAmZnNsX2RtYV9vcHM7CiAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KClJl
bW92ZSB0aGUgdXNhZ2UgdG8gZml4IHRoZSBidWlsZC4KCkZpeGVzOiA0YWM4NWRlOTk3N2UgKCJB
U29DOiBmc2w6IGZzbF9kbWE6IHJlbW92ZSBzbmRfcGNtX29wcyIpClNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KLS0tCiBzb3VuZC9zb2MvZnNsL2Zz
bF9kbWEuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKClRoaXMgYnJlYWth
Z2UgaXMgb25seSBpbiBsaW51eC1uZXh0LgoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9mc2wvZnNs
X2RtYS5jIGIvc291bmQvc29jL2ZzbC9mc2xfZG1hLmMKaW5kZXggYTA5MjcyNjUxMGQ0Li4yODY4
YzRmOTdjYjIgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9mc2wvZnNsX2RtYS5jCisrKyBiL3NvdW5k
L3NvYy9mc2wvZnNsX2RtYS5jCkBAIC05MDEsNyArOTAxLDYgQEAgc3RhdGljIGludCBmc2xfc29j
X2RtYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCX0KIAogCWRtYS0+ZGFp
Lm5hbWUgPSBEUlZfTkFNRTsKLQlkbWEtPmRhaS5vcHMgPSAmZnNsX2RtYV9vcHM7CiAJZG1hLT5k
YWkub3BlbiA9IGZzbF9kbWFfb3BlbjsKIAlkbWEtPmRhaS5jbG9zZSA9IGZzbF9kbWFfY2xvc2U7
CiAJZG1hLT5kYWkuaW9jdGwgPSBzbmRfc29jX3BjbV9saWJfaW9jdGw7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
