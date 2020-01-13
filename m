Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D052713AA88
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:18:35 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1ACA259A;
	Mon, 13 Jan 2020 22:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1ACA259A
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C686F80336;
	Mon, 13 Jan 2020 22:05:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE36F802A9; Mon, 13 Jan 2020 22:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC5B1F801F7
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5B1F801F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213112696"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 13:04:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:04:26 -0600
Message-Id: <20200113210428.27457-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
References: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 16/18] ASoC: Intel: bytcht_es8316: removed
	unused variable
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

Zml4IEdDQyB3YXJuaW5nIHdpdGggVz0xCgpzb3VuZC9zb2MvaW50ZWwvL2JvYXJkcy9ieXRjaHRf
ZXM4MzE2LmM6MjM3OjQwOiB3YXJuaW5nOgrigJhieXRfY2h0X2VzODMxNl9kYWlfcGFyYW1z4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkClstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQt
b2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXgu
aW50ZWwuY29tPgotLS0KIHNvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYnl0Y2h0X2VzODMxNi5jIHwg
OCAtLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ludGVsL2JvYXJkcy9ieXRjaHRfZXM4MzE2LmMgYi9zb3VuZC9zb2MvaW50ZWwv
Ym9hcmRzL2J5dGNodF9lczgzMTYuYwppbmRleCBjZTc2MGMzNjFlYjIuLjBhZGM1YTVlMTM0YSAx
MDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9ieXRjaHRfZXM4MzE2LmMKKysrIGIv
c291bmQvc29jL2ludGVsL2JvYXJkcy9ieXRjaHRfZXM4MzE2LmMKQEAgLTIzNCwxNCArMjM0LDYg
QEAgc3RhdGljIGludCBieXRfY2h0X2VzODMxNl9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50
aW1lICpydW50aW1lKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9z
b2NfcGNtX3N0cmVhbSBieXRfY2h0X2VzODMxNl9kYWlfcGFyYW1zID0gewotCS5mb3JtYXRzID0g
U05EUlZfUENNX0ZNVEJJVF9TMjRfTEUsCi0JLnJhdGVfbWluID0gNDgwMDAsCi0JLnJhdGVfbWF4
ID0gNDgwMDAsCi0JLmNoYW5uZWxzX21pbiA9IDIsCi0JLmNoYW5uZWxzX21heCA9IDIsCi19Owot
CiBzdGF0aWMgaW50IGJ5dF9jaHRfZXM4MzE2X2NvZGVjX2ZpeHVwKHN0cnVjdCBzbmRfc29jX3Bj
bV9ydW50aW1lICpydGQsCiAJCQkgICAgc3RydWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMp
CiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
