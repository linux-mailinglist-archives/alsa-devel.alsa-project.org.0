Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739713AABD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:22:59 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69B3925B9;
	Mon, 13 Jan 2020 22:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69B3925B9
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7C0F8033E;
	Mon, 13 Jan 2020 22:05:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1974CF802C3; Mon, 13 Jan 2020 22:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99B7CF8028E
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B7CF8028E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213112713"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 13:04:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:04:28 -0600
Message-Id: <20200113210428.27457-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
References: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 18/18] ASoC: Intel: bytcr_rt5651: remove unused
	variable
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

Rml4IEdDQyB3YXJuaW5nIHdpdGggVz0xCgpzb3VuZC9zb2MvaW50ZWwvL2JvYXJkcy9ieXRjcl9y
dDU2NTEuYzo2NTk6NDA6IHdhcm5pbmc6CuKAmGJ5dF9ydDU2NTFfZGFpX3BhcmFtc+KAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZApbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1i
eTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVs
LmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2J5dGNyX3J0NTY1MS5jIHwgOCAtLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ludGVsL2JvYXJkcy9ieXRjcl9ydDU2NTEuYyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMv
Ynl0Y3JfcnQ1NjUxLmMKaW5kZXggYzBkMzIyYTg1OWY3Li4zYmIyNzMyYTlmN2UgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYnl0Y3JfcnQ1NjUxLmMKKysrIGIvc291bmQvc29j
L2ludGVsL2JvYXJkcy9ieXRjcl9ydDU2NTEuYwpAQCAtNjU2LDE0ICs2NTYsNiBAQCBzdGF0aWMg
aW50IGJ5dF9ydDU2NTFfaW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnVudGltZSkK
IAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX3BjbV9zdHJlYW0g
Ynl0X3J0NTY1MV9kYWlfcGFyYW1zID0gewotCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUsCi0JLnJhdGVfbWluID0gNDgwMDAsCi0JLnJhdGVfbWF4ID0gNDgwMDAsCi0JLmNoYW5u
ZWxzX21pbiA9IDIsCi0JLmNoYW5uZWxzX21heCA9IDIsCi19OwotCiBzdGF0aWMgaW50IGJ5dF9y
dDU2NTFfY29kZWNfZml4dXAoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCwKIAkJCSAg
ICBzdHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKnBhcmFtcykKIHsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
