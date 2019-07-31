Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FDF7BAE5
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 09:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4FE16CB;
	Wed, 31 Jul 2019 09:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4FE16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564559192;
	bh=dxIcjor3Wd8sha7PyiedHg4/tPAr5i/PjmQhRI33rXA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HAQlCi4osw9et6ugn3srmR1G07FG6ME/OU1YLkP7h4IkWWkc4xvTfFFw9ut8Exq+k
	 eigRH2/G03uH1l6JbDx9rmaM+EUSyvmyqb4vQxldKtCxrCZUSmTsERFZu4xAKL3NE1
	 Gz/UBJ68LrXkNKLrPvgICJh9+gYyvuexXisZhWdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E58F80440;
	Wed, 31 Jul 2019 09:44:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEFEAF8048D; Wed, 31 Jul 2019 09:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B9DF800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 09:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B9DF800C0
Received: from localhost.localdomain (10.28.8.29) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 31 Jul 2019
 15:42:34 +0800
From: chunguo feng <chunguo.feng@amlogic.com>
To: <lgirdwood@gmail.com>
Date: Wed, 31 Jul 2019 15:41:56 +0800
Message-ID: <20190731074156.5620-1-chunguo.feng@amlogic.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.29]
Cc: alsa-devel@alsa-project.org, RyanS.Lee@maximintegrated.com,
 grundler@chromium.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, chunguo.feng@amlogic.com,
 broonie@kernel.org, bleung@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: max98373: add 88200 and 96000 sampling
	rate support
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

RnJvbTogZmVuZ2NodW5ndW8gPGNodW5ndW8uZmVuZ0BhbWxvZ2ljLmNvbT4KCjg4MjAwIGFuZCA5
NjAwMCBzYW1wbGluZyByYXRlIHdhcyBub3QgZW5hYmxlZCBvbiBkcml2ZXIsIHNvIGNhbid0IGJl
IHBsYXllZC4KClRoZSBlcnJvciBpbmZvcm1hdGlvbjoKbWF4OTgzNzMgMy0wMDMx77yacmF0ZSA5
NjAwMCBub3Qgc3VwcG9ydGVkCm1heDk4MzczIDMtMDAzMe+8mkFTb0M6IGNhbid0IHNldCBtYXg5
ODM3My1haWYxIGh3IHBhcmFtczogLTIyCgpTaWduZWQtb2ZmLWJ5OiBmZW5nY2h1bmd1byA8Y2h1
bmd1by5mZW5nQGFtbG9naWMuY29tPgotLS0KIHNvdW5kL3NvYy9jb2RlY3MvbWF4OTgzNzMuYyB8
IDYgKysrKysrCiBzb3VuZC9zb2MvY29kZWNzL21heDk4MzczLmggfCAyICsrCiAyIGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQogbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEwMDc1NSBzb3Vu
ZC9zb2MvY29kZWNzL21heDk4MzczLmMKIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUgc291
bmQvc29jL2NvZGVjcy9tYXg5ODM3My5oCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9t
YXg5ODM3My5jIGIvc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My5jCm9sZCBtb2RlIDEwMDY0NApu
ZXcgbW9kZSAxMDA3NTUKaW5kZXggNTI4Njk1Y2Q2YTFjLi44YzYwMWEzZWJjMjcKLS0tIGEvc291
bmQvc29jL2NvZGVjcy9tYXg5ODM3My5jCisrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbWF4OTgzNzMu
YwpAQCAtMjY3LDYgKzI2NywxMiBAQCBzdGF0aWMgaW50IG1heDk4MzczX2RhaV9od19wYXJhbXMo
c3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJY2FzZSA0ODAwMDoKIAkJc2Ft
cGxpbmdfcmF0ZSA9IE1BWDk4MzczX1BDTV9TUl9TRVQxX1NSXzQ4MDAwOwogCQlicmVhazsKKwlj
YXNlIDg4MjAwOgorCQlzYW1wbGluZ19yYXRlID0gTUFYOTgzNzNfUENNX1NSX1NFVDFfU1JfODgy
MDA7CisJCWJyZWFrOworCWNhc2UgOTYwMDA6CisJCXNhbXBsaW5nX3JhdGUgPSBNQVg5ODM3M19Q
Q01fU1JfU0VUMV9TUl85NjAwMDsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJZGV2X2Vycihjb21w
b25lbnQtPmRldiwgInJhdGUgJWQgbm90IHN1cHBvcnRlZFxuIiwKIAkJCXBhcmFtc19yYXRlKHBh
cmFtcykpOwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My5oIGIvc291bmQv
c29jL2NvZGVjcy9tYXg5ODM3My5oCm9sZCBtb2RlIDEwMDY0NApuZXcgbW9kZSAxMDA3NTUKaW5k
ZXggZjZhMzdhYTAyZjI2Li5hNTllNTEzNTVhODQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9tYXg5
ODM3My5oCisrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbWF4OTgzNzMuaApAQCAtMTMwLDYgKzEzMCw4
IEBACiAjZGVmaW5lIE1BWDk4MzczX1BDTV9TUl9TRVQxX1NSXzMyMDAwICgweDYgPDwgMCkKICNk
ZWZpbmUgTUFYOTgzNzNfUENNX1NSX1NFVDFfU1JfNDQxMDAgKDB4NyA8PCAwKQogI2RlZmluZSBN
QVg5ODM3M19QQ01fU1JfU0VUMV9TUl80ODAwMCAoMHg4IDw8IDApCisjZGVmaW5lIE1BWDk4Mzcz
X1BDTV9TUl9TRVQxX1NSXzg4MjAwICgweDkgPDwgMCkKKyNkZWZpbmUgTUFYOTgzNzNfUENNX1NS
X1NFVDFfU1JfOTYwMDAgKDB4QSA8PCAwKQogCiAvKiBNQVg5ODM3M19SMjAyOF9QQ01fU1JfU0VU
VVBfMiAqLwogI2RlZmluZSBNQVg5ODM3M19QQ01fU1JfU0VUMl9TUl9NQVNLICgweEYgPDwgNCkK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
