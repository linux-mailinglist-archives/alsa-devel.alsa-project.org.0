Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B5315E6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3FB1662;
	Fri, 31 May 2019 22:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3FB1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559333453;
	bh=vYrqt+4DsY7H/XoqfWZcVRlbPall0UUHjdOn5Tc0zC4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hVK9JgtqCrhgdqvTwt+KKDQ3JHDUjPJuDGeLLd9t4Rlof6cbh2Wp7zJTZKtS980jS
	 TDHpeUcqb4FN4/HOLmSHGr5n+6T2DEGPWAWn7U6AIh8eIEnUDCeQckIhBXa3l/XAZv
	 Awkm9wHd4fpPTSIph2z1733UYK6lZlQRNwmXs3CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8EDF89739;
	Fri, 31 May 2019 22:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 597C6F896E5; Fri, 31 May 2019 19:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sender-pp-o92.zoho.eu (sender-pp-o92.zoho.eu [185.20.209.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88183F80757
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 19:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88183F80757
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zohomail.eu header.i=kepszlok@zohomail.eu
 header.b="clN3QEcm"
ARC-Seal: i=1; a=rsa-sha256; t=1559323348; cv=none; d=zohomail.eu; s=zohoarc; 
 b=E58o/XrFTn8Ru3bmbqNEgTLjPWX0RN2Wklqv1TgXurEj6fzgiIlxdaKhaP3YnBbWxaIqR7+ZLRJb74SeiO6hW9EdVgVhn93wbx/oJ8LqPqRFddJorklUqqWSFb4l2POXLYHQOx8u/XC3OG0ySwkctTQfz4rIyvjIiSv3IfPY6o8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1559323348;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=PbS0a0jBl/QnE9XC3SJoOulWsbJRwsGlz3VNwnOVN7o=; 
 b=KC2WKGHqA4L+YIoJWwkLcvWPIagtVIBsQZ0fg26Rnr4l8k17bFxuXaxUXRwdFwrKipidgs5y/DdMMK7/r9wL1d1SfWDO50pp4dzNeDvfhfBNlra8V+dCkTNQBSqPmSUqZzIUVvwKB1IMpHHKyskrHMlyTIyuS2XXUAEzGTMMSeA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=kepszlok@zohomail.eu;
 dmarc=pass header.from=<kepszlok@zohomail.eu>
 header.from=<kepszlok@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1559323348; 
 s=zoho; d=zohomail.eu; i=kepszlok@zohomail.eu;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=3180; bh=PbS0a0jBl/QnE9XC3SJoOulWsbJRwsGlz3VNwnOVN7o=;
 b=clN3QEcmv5Da+Dd3f3OuOJ4xmZ7UzxsH5359CKmu6YRlAVwoyaK6J9R3K7Kv1y3p
 GCylHf6XuPoYgSfEbFvi0xQOEpmi630qUlsO8pyFwY0ofWymji+kaPdRDcpnnbzfa/4
 u4snimIEBe2nX6VeGMf+kTa9pwUA2Yo9GDQz0htI=
Received: from pop-os.lan (217-197-176-148.pool.digikabel.hu
 [217.197.176.148]) by mx.zoho.eu
 with SMTPS id 1559323348030366.9107900563978;
 Fri, 31 May 2019 19:22:28 +0200 (CEST)
From: =?UTF-8?q?Kov=C3=A1cs=20Tam=C3=A1s?= <kepszlok@zohomail.eu>
To: alsa-devel@alsa-project.org
Message-ID: <20190531172226.7114-1-kepszlok@zohomail.eu>
Date: Fri, 31 May 2019 19:22:26 +0200
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 31 May 2019 22:06:35 +0200
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 =?UTF-8?q?Kov=C3=A1cs=20Tam=C3=A1s?= <kepszlok@zohomail.eu>
Subject: [alsa-devel] [PATCH V3] ASoC: Intel: Baytrail: add quirk for Aegex
	10 (RU2) tablet
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

VGhpcyB0YWJsZXQgaGFzIGFuIGluY29ycmVjdCBhY3BpIGlkZW50aWZpZXIganVzdCBsaWtlClRo
aW5rcGFkMTAgdGFibGV0LCB3aGljaCBpcyB3aHkgaXQgaXMgdHJ5aW5nIHRvIGxvYWQgdGhlIFJU
NTY0MCBkcml2ZXIKaW5zdGVhZCBvZiB0aGUgUlQ1NzYyIGRyaXZlci4gVGhlIFJUNTY0MCBkcml2
ZXIsIG9uIHRoZSBvdGhlciBoYW5kLCBjaGVja3MKdGhlIGhhcmR3YXJlIElELCBzbyBubyBkcml2
ZXIgYXJlIGxvYWRlZCBkdXJpbmcgYm9vdC4gVGhpcyBmaXggcmVzb2x2ZXMgdG8KbG9hZCB0aGUg
UlQ1NjcyIGRyaXZlciBvbiB0aGlzIHRhYmxldCBkdXJpbmcgYm9vdC4gSXQgYWxzbyBwcm92aWRl
cyB0aGUKY29ycmVjdCBJTyBjb25maWd1cmF0aW9uLCBsaWtlIHRoZSBqYWNrIGRldGVjdCBtb2Rl
IDMsIGZvciAxLjhWIHB1bGx1cC4gSQp3b3VsZCBsaWtlIHRvIHRoYW5rIFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0IGZvciBoZWxwaW5nIHdpdGggdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEtvdsOh
Y3MgVGFtw6FzIDxrZXBzemxva0B6b2hvbWFpbC5ldT4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL3J0
NTY3MC5jICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysrKwogLi4uL3NvYy9p
bnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1hdGNoLmMgfCAxNyArKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291
bmQvc29jL2NvZGVjcy9ydDU2NzAuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKaW5kZXgg
OWEwMzcxMDhiMWFlLi5hNzQ2ZTExY2NmZTMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3Mv
cnQ1NjcwLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDU2NzAuYwpAQCAtMjg4Miw2ICsyODgy
LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBkbWlfcGxhdGZvcm1faW50
ZWxfcXVpcmtzW10gPSB7CiAJCQkJCQkgUlQ1NjcwX0RFVl9HUElPIHwKIAkJCQkJCSBSVDU2NzBf
SkRfTU9ERTMpLAogCX0sCisJeworCQkuY2FsbGJhY2sgPSBydDU2NzBfcXVpcmtfY2IsCisJCS5p
ZGVudCA9ICJBZWdleCAxMCB0YWJsZXQgKFJVMikiLAorCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9N
QVRDSChETUlfU1lTX1ZFTkRPUiwgIkFFR0VYIiksCisJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1Rf
VkVSU0lPTiwgIlJVMiIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAodW5zaWduZWQgbG9uZyAq
KShSVDU2NzBfRE1JQ19FTiB8CisJCQkJCQkgUlQ1NjcwX0RNSUMyX0lOUiB8CisJCQkJCQkgUlQ1
NjcwX0RFVl9HUElPIHwKKwkJCQkJCSBSVDU2NzBfSkRfTU9ERTMpLAorCX0sCiAJe30KIH07CiAK
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1h
dGNoLmMgYi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5j
CmluZGV4IDBjZmFiMjQ3ODc2YS4uOWZiNThmMWYwOTVmIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mv
aW50ZWwvY29tbW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5jCisrKyBiL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1hdGNoLmMKQEAgLTIyLDYgKzIyLDcgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgYnl0X21hY2hpbmVfaWQ7CiAKICNkZWZpbmUgQllUX1RISU5L
UEFEXzEwICAxCiAjZGVmaW5lIEJZVF9QT1ZfUDEwMDZXICAgMgorI2RlZmluZSBCWVRfQUVHRVhf
MTAgICAgIDMKIAogc3RhdGljIGludCBieXRfdGhpbmtwYWQxMF9xdWlya19jYihjb25zdCBzdHJ1
Y3QgZG1pX3N5c3RlbV9pZCAqaWQpCiB7CkBAIC0zNSw2ICszNiwxMiBAQCBzdGF0aWMgaW50IGJ5
dF9wb3ZfcDEwMDZ3X3F1aXJrX2NiKGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkICppZCkKIAly
ZXR1cm4gMTsKIH0KIAorc3RhdGljIGludCBieXRfYWVnZXgxMF9xdWlya19jYihjb25zdCBzdHJ1
Y3QgZG1pX3N5c3RlbV9pZCAqaWQpCit7CisJYnl0X21hY2hpbmVfaWQgPSBCWVRfQUVHRVhfMTA7
CisJcmV0dXJuIDE7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBieXRf
dGFibGVbXSA9IHsKIAl7CiAJCS5jYWxsYmFjayA9IGJ5dF90aGlua3BhZDEwX3F1aXJrX2NiLApA
QCAtNzUsOSArODIsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90
YWJsZVtdID0gewogCQkJRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiMEU1NyIpLAog
CQl9LAogCX0sCisJeworCQkvKiBBZWdleCAxMCB0YWJsZXQgKFJVMikgKi8KKwkJLmNhbGxiYWNr
ID0gYnl0X2FlZ2V4MTBfcXVpcmtfY2IsCisJCS5tYXRjaGVzID0geworCQkJRE1JX01BVENIKERN
SV9TWVNfVkVORE9SLCAiQUVHRVgiKSwKKwkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9O
LCAiUlUyIiksCisJCX0sCisJfSwKIAl7IH0KIH07CiAKKy8qIFRoZSBUaGlua2FwZCAxMCBhbmQg
QWVnZXggMTAgdGFibGV0cyBoYXZlIHRoZSBzYW1lIElEIHByb2JsZW0gKi8KIHN0YXRpYyBzdHJ1
Y3Qgc25kX3NvY19hY3BpX21hY2ggYnl0X3RoaW5rcGFkXzEwID0gewogCS5pZCA9ICIxMEVDNTY0
MCIsCiAJLmRydl9uYW1lID0gImNodC1ic3ctcnQ1NjcyIiwKQEAgLTEwNCw2ICsxMjAsNyBAQCBz
dGF0aWMgc3RydWN0IHNuZF9zb2NfYWNwaV9tYWNoICpieXRfcXVpcmsodm9pZCAqYXJnKQogCiAJ
c3dpdGNoIChieXRfbWFjaGluZV9pZCkgewogCWNhc2UgQllUX1RISU5LUEFEXzEwOgorCWNhc2Ug
QllUX0FFR0VYXzEwOgogCQlyZXR1cm4gJmJ5dF90aGlua3BhZF8xMDsKIAljYXNlIEJZVF9QT1Zf
UDEwMDZXOgogCQlyZXR1cm4gJmJ5dF9wb3ZfcDEwMDZ3OwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
