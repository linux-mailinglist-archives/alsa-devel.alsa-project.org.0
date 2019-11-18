Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CD1006F5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 15:03:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65721694;
	Mon, 18 Nov 2019 15:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65721694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574085836;
	bh=5/sXDh7oljsHIt0D/ZWgdqtLi8dD1Iz38iCUYOivHu4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qJHopLY7wFsc+3uZEp2FirGheVpBwrrsDM7jNoU+XR0SfpKAiHnSfXRxyg0VyrYtT
	 ZCTQHnMU2/GhtFQYPAYQLOT3opreg7MTpH49cH+2Z7/2dvU/4UaLygRBw29OBBAxid
	 yc6HPdl/PVYQpEh5pTsHTc9uD+RzIQBN6XjtTs/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8ABF8013C;
	Mon, 18 Nov 2019 15:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18862F8013B; Mon, 18 Nov 2019 15:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5408EF800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 15:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5408EF800F1
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 7E6343C04C0;
 Mon, 18 Nov 2019 15:02:02 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIyVSefni55j; Mon, 18 Nov 2019 15:01:53 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id F06A53C04C1;
 Mon, 18 Nov 2019 15:01:51 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 18 Nov 2019 15:01:51 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jiada Wang
 <jiada_wang@mentor.com>, Mark Brown <broonie@kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 18 Nov 2019 15:01:26 +0100
Message-ID: <20191118140126.23596-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.72.93.184]
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] [PATCH] ASoC: rsnd: fix DALIGN register for SSIU
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

RnJvbTogTmlsa2FudGggQWhpcnJhbyA8YW5pbGthbnRoQGpwLmFkaXQtanYuY29tPgoKVGhlIGN1
cnJlbnQgZHJpdmVyIG9ubHkgc2V0cyAweDc2NTQzMjEwIGFuZCAweDY3NDUyMzAxIGZvciBEQUxJ
R04uClRoaXMgZG9lc27igJl0IHdvcmsgd2VsbCBmb3IgVERNIHNwbGl0IGFuZCBleC1zcGxpdCBt
b2RlIGZvciBhbGwgU1NJVS4KVGhpcyBwYXRjaCBwcm9ncmFtcyB0aGUgREFMSUdOIHJlZ2lzdGVy
cyBiYXNlZCBvbiB0aGUgU1NJVSBudW1iZXIuCgpDYzogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlu
b3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgpDYzogSGlyb3l1a2kgWW9rb3lhbWEgPGhpcm95
dWtpLnlva295YW1hLnZ4QHJlbmVzYXMuY29tPgpDYzogSmlhZGEgV2FuZyA8amlhZGFfd2FuZ0Bt
ZW50b3IuY29tPgpDYzogQW5kcmV3IEdhYmJhc292IDxhbmRyZXdfZ2FiYmFzb3ZAbWVudG9yLmNv
bT4KRml4ZXM6IGE5MTRlNDQ2OTNkNDFiICgiQVNvQzogcnNuZDogbW9yZSBjbGVhciByc25kX2dl
dF9kYWxpZ24oKSBmb3IgREFMSUdOIikKU2lnbmVkLW9mZi1ieTogTmlsa2FudGggQWhpcnJhbyA8
YW5pbGthbnRoQGpwLmFkaXQtanYuY29tPgpbZXJvc2NhOiBBZGp1c3QgRml4ZXM6IHRhZywgcmVm
b3JtYXQgcGF0Y2ggZGVzY3JpcHRpb25dClNpZ25lZC1vZmYtYnk6IEV1Z2VuaXUgUm9zY2EgPGVy
b3NjYUBkZS5hZGl0LWp2LmNvbT4KLS0tCiBzb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMgfCAyNSAr
KysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMg
Yi9zb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMKaW5kZXggZTk1OTZjMjA5NmNkLi5hZTA1ZWQwOGEy
YjMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zaC9yY2FyL2NvcmUuYworKysgYi9zb3VuZC9zb2Mv
c2gvcmNhci9jb3JlLmMKQEAgLTM3Niw2ICszNzYsMTYgQEAgdTMyIHJzbmRfZ2V0X2FkaW5yX2Jp
dChzdHJ1Y3QgcnNuZF9tb2QgKm1vZCwgc3RydWN0IHJzbmRfZGFpX3N0cmVhbSAqaW8pCiAgKi8K
IHUzMiByc25kX2dldF9kYWxpZ24oc3RydWN0IHJzbmRfbW9kICptb2QsIHN0cnVjdCByc25kX2Rh
aV9zdHJlYW0gKmlvKQogeworCXN0YXRpYyBjb25zdCB1MzIgZGFsaWduX3ZhbHVlc1s4XVsyXSA9
IHsKKwkJezB4NzY1NDMyMTAsIDB4Njc0NTIzMDF9LAorCQl7MHgwMDAwMDAzMiwgMHgwMDAwMDAy
M30sCisJCXsweDAwMDA3NjU0LCAweDAwMDA2NzQ1fSwKKwkJezB4MDAwMDAwNzYsIDB4MDAwMDAw
Njd9LAorCQl7MHhmZWRjYmE5OCwgMHhlZmNkYWI4OX0sCisJCXsweDAwMDAwMGJhLCAweDAwMDAw
MGFifSwKKwkJezB4MDAwMGZlZGMsIDB4MDAwMGVmY2R9LAorCQl7MHgwMDAwMDBmZSwgMHgwMDAw
MDBlZn0sCisJfTsKIAlzdHJ1Y3QgcnNuZF9tb2QgKnNzaXUgPSByc25kX2lvX3RvX21vZF9zc2l1
KGlvKTsKIAlzdHJ1Y3QgcnNuZF9tb2QgKnRhcmdldDsKIAlzdHJ1Y3Qgc25kX3BjbV9ydW50aW1l
ICpydW50aW1lID0gcnNuZF9pb190b19ydW50aW1lKGlvKTsKQEAgLTQxMywxMSArNDIzLDE4IEBA
IHUzMiByc25kX2dldF9kYWxpZ24oc3RydWN0IHJzbmRfbW9kICptb2QsIHN0cnVjdCByc25kX2Rh
aV9zdHJlYW0gKmlvKQogCiAJLyogTm9uIHRhcmdldCBtb2Qgb3Igbm9uIDE2Yml0IG5lZWRzIG5v
cm1hbCBEQUxJR04gKi8KIAlpZiAoKHNuZF9wY21fZm9ybWF0X3dpZHRoKHJ1bnRpbWUtPmZvcm1h
dCkgIT0gMTYpIHx8Ci0JICAgIChtb2QgIT0gdGFyZ2V0KSkKLQkJcmV0dXJuIDB4NzY1NDMyMTA7
CisJICAgIChtb2QgIT0gdGFyZ2V0KSkgeworCQlpZiAobW9kID09IHNzaXUpCisJCQlyZXR1cm4g
ZGFsaWduX3ZhbHVlc1tyc25kX21vZF9pZF9zdWIobW9kKV1bMF07CisJCWVsc2UKKwkJCXJldHVy
biAweDc2NTQzMjEwOwogCS8qIFRhcmdldCBtb2QgbmVlZHMgaW52ZXJ0ZWQgREFMSUdOIHdoZW4g
MTZiaXQgKi8KLQllbHNlCi0JCXJldHVybiAweDY3NDUyMzAxOworCX0gZWxzZSB7CisJCWlmICht
b2QgPT0gc3NpdSkKKwkJCXJldHVybiBkYWxpZ25fdmFsdWVzW3JzbmRfbW9kX2lkX3N1Yihtb2Qp
XVsxXTsKKwkJZWxzZQorCQkJcmV0dXJuIDB4Njc0NTIzMDE7CisJfQogfQogCiB1MzIgcnNuZF9n
ZXRfYnVzaWZfc2hpZnQoc3RydWN0IHJzbmRfZGFpX3N0cmVhbSAqaW8sIHN0cnVjdCByc25kX21v
ZCAqbW9kKQotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
