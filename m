Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99D13AAA5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:21:29 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC1F723E2;
	Mon, 13 Jan 2020 22:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC1F723E2
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C16EF8026F;
	Mon, 13 Jan 2020 22:05:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13CC0F8028A; Mon, 13 Jan 2020 22:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAEDF801F7
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCAEDF801F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213112666"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 13:04:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:04:14 -0600
Message-Id: <20200113210428.27457-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
References: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 04/18] ASoC: Intel: glk_rt5682_max98357a:
	removed unused variables
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

Rml4IEdDQyB3YXJuaW5nIHdpdGggVz0xCgpzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2dsa19ydDU2
ODJfbWF4OTgzNTdhLmM6MjU2OjQ4OiB3YXJuaW5nOgrigJhjb25zdHJhaW50c19jaGFubmVsc+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVk
LW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2dsa19ydDU2ODJfbWF4OTgz
NTdhLmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9nbGtfcnQ1NjgyX21heDk4MzU3YS5j
IGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9nbGtfcnQ1NjgyX21heDk4MzU3YS5jCmluZGV4IDJi
ZmM0MzY1ZDk1Ny4uNGE2ZDExN2VhN2FmIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9h
cmRzL2dsa19ydDU2ODJfbWF4OTgzNTdhLmMKKysrIGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9n
bGtfcnQ1NjgyX21heDk4MzU3YS5jCkBAIC0yNDksMTYgKzI0OSw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3BjbV9od19jb25zdHJhaW50X2xpc3QgY29uc3RyYWludHNfcmF0ZXMgPSB7CiAJ
Lm1hc2sgPSAwLAogfTsKIAotc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBjaGFubmVsc1tdID0g
ewotCURVQUxfQ0hBTk5FTCwKLX07Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjbV9od19j
b25zdHJhaW50X2xpc3QgY29uc3RyYWludHNfY2hhbm5lbHMgPSB7Ci0JLmNvdW50ID0gQVJSQVlf
U0laRShjaGFubmVscyksCi0JLmxpc3QgPSBjaGFubmVscywKLQkubWFzayA9IDAsCi19OwotCiBz
dGF0aWMgdW5zaWduZWQgaW50IGNoYW5uZWxzX3F1YWRbXSA9IHsKIAlRVUFEX0NIQU5ORUwsCiB9
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
