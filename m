Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3B14EEF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DC918E0;
	Mon,  6 May 2019 17:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DC918E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155193;
	bh=+nzamMmONwn1L6i5IwWPBoKdumiVOb1TjBKvwElvlDQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZ9aPuQR0w7nIK8/Eft6CD0XyyYMHSS1D9ijnt/42C460eEfbLmP/GBG8nN0B7fqR
	 vhgFQwDeoIk78RBcOFSxiTwtLckagFHNCdM4H1UiTKmvTkjjr3++Yo4HNOyQicgIL2
	 8jHs26UQa6YtNyBohZD6MupUSnq8bKfy+UGGfgdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00FA9F89730;
	Mon,  6 May 2019 17:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B04BF89725; Mon,  6 May 2019 17:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37EE8F89701
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37EE8F89701
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96046AEBF;
 Mon,  6 May 2019 15:02:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 17:02:24 +0200
Message-Id: <20190506150224.1394-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506150224.1394-1-tiwai@suse.de>
References: <20190506150224.1394-1-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] ASoC: rockchip: Fix an uninitialized
	variable compile warning
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

UGFwZXIgb3ZlciBhIHRyaXZpYWwgY2FzZSBsZWFkaW5nIHRvIGFuIHVuaW5pdGlhbGl6ZWQgdmFy
aWFibGUgY29tcGlsZQp3YXJuaW5nOgogIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9wZG0u
YzoxNzk6Mzogd2FybmluZzog4oCYY2xrX291dOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk
IGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KCkZpeGVzOiA2MjRlOGUw
MGFjYWYgKCJBU29DOiByb2NrY2hpcDogcGRtOiBmaXh1cCBwZG0gZnJhY3Rpb25hbCBkaXYiKQpT
aWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Ci0tLQogc291bmQvc29j
L3JvY2tjaGlwL3JvY2tjaGlwX3BkbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3Jv
Y2tjaGlwX3BkbS5jIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX3BkbS5jCmluZGV4IDZj
MGYyNDJkYjVlZi4uYjljMWQ4YWQ3N2MxIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvcm9ja2NoaXAv
cm9ja2NoaXBfcGRtLmMKKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX3BkbS5jCkBA
IC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIGludCByb2NrY2hpcF9wZG1faHdfcGFyYW1zKHN0cnVj
dCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCXN0cnVjdCBya19wZG1fZGV2ICpwZG0g
PSB0b19pbmZvKGRhaSk7CiAJdW5zaWduZWQgaW50IHZhbCA9IDA7CiAJdW5zaWduZWQgaW50IGNs
a19yYXRlLCBjbGtfZGl2LCBzYW1wbGVyYXRlOwotCXVuc2lnbmVkIGludCBjbGtfc3JjLCBjbGtf
b3V0OworCXVuc2lnbmVkIGludCBjbGtfc3JjLCBjbGtfb3V0ID0gMDsKIAl1bnNpZ25lZCBsb25n
IG0sIG47CiAJYm9vbCBjaGFuZ2U7CiAJaW50IHJldDsKLS0gCjIuMTYuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
