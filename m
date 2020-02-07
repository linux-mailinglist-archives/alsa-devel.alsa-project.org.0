Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D71558FB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 15:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C155167D;
	Fri,  7 Feb 2020 15:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C155167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581084393;
	bh=d3CMRCmRVvOlcmB6ASiiAkH+OT2wAGK2Nq4d5/445JM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WupmeCDTL0TfgPs8z2iS8+JFy+0ptlafpr1tV/RwAPOejda/t5O6KTlq0oOrjMYGt
	 WugXEu/UY5pW5CRjhoO2cLkrkkCH1HGToTJT1PFqk0/rRJefYUoOAhoY1177tWN53K
	 1n+GIoeYPb2pF2bjEPp206xnFhhyxCl+eshnsvPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 059A9F80148;
	Fri,  7 Feb 2020 15:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B562CF80148; Fri,  7 Feb 2020 15:04:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DDEBF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 15:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DDEBF800AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="430845181"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2020 06:04:39 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Date: Fri,  7 Feb 2020 11:15:33 -0500
Message-Id: <20200207161533.22290-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: uapi: Replace __packed with
	__attribute__((packed))
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

VXNlcnNwYWNlIGRvZXNuJ3Qga25vdyB3aGF0IF9fcGFja2VkIGlzLCBjaGFuZ2UgaXQgdG8KX19h
dHRyaWJ1dGVfXygocGFja2VkKSksIGxpa2UgaW4gdGhlIHJlc3Qgb2YgYSBoZWFkZXIuCgpGaXhl
czogMzQ4ZjQ4MjIwYjk3IChBU29DOiB0b3BvbG9neTogTW92ZSB2NCBtYW5pZmVzdCBoZWFkZXIg
ZGF0YSBzdHJ1Y3R1cmVzIHRvIHVhcGkpCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nF
hHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+Ci0tLQogaW5jbHVkZS91
YXBpL3NvdW5kL2Fzb2MuaCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fz
b2MuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc29jLmgKaW5kZXggNjA0ODU1M2MxMTlkLi4xYWU4
YjA2NjkxY2IgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9zb3VuZC9hc29jLmgKKysrIGIvaW5j
bHVkZS91YXBpL3NvdW5kL2Fzb2MuaApAQCAtNTg2LDcgKzU4Niw3IEBAIHN0cnVjdCBzbmRfc29j
X3RwbGdfbWFuaWZlc3RfdjQgewogCV9fbGUzMiBwY21fZWxlbXM7CS8qIG51bWJlciBvZiBQQ00g
ZWxlbWVudHMgKi8KIAlfX2xlMzIgZGFpX2xpbmtfZWxlbXM7CS8qIG51bWJlciBvZiBEQUkgbGlu
ayBlbGVtZW50cyAqLwogCXN0cnVjdCBzbmRfc29jX3RwbGdfcHJpdmF0ZSBwcml2OwotfSBfX3Bh
Y2tlZDsKK30gX19hdHRyaWJ1dGUoKHBhY2tlZCkpOwogCiAvKiBTdHJlYW0gQ2FwYWJpbGl0aWVz
IHY0ICovCiBzdHJ1Y3Qgc25kX3NvY190cGxnX3N0cmVhbV9jYXBzX3Y0IHsKQEAgLTYwNCw3ICs2
MDQsNyBAQCBzdHJ1Y3Qgc25kX3NvY190cGxnX3N0cmVhbV9jYXBzX3Y0IHsKIAlfX2xlMzIgcGVy
aW9kX3NpemVfbWF4OwkvKiBtYXggcGVyaW9kIHNpemUgYnl0ZXMgKi8KIAlfX2xlMzIgYnVmZmVy
X3NpemVfbWluOwkvKiBtaW4gYnVmZmVyIHNpemUgYnl0ZXMgKi8KIAlfX2xlMzIgYnVmZmVyX3Np
emVfbWF4OwkvKiBtYXggYnVmZmVyIHNpemUgYnl0ZXMgKi8KLX0gX19wYWNrZWQ7Cit9IF9fYXR0
cmlidXRlKChwYWNrZWQpKTsKIAogLyogUENNIHY0ICovCiBzdHJ1Y3Qgc25kX3NvY190cGxnX3Bj
bV92NCB7CkBAIC02MTksNyArNjE5LDcgQEAgc3RydWN0IHNuZF9zb2NfdHBsZ19wY21fdjQgewog
CXN0cnVjdCBzbmRfc29jX3RwbGdfc3RyZWFtIHN0cmVhbVtTTkRfU09DX1RQTEdfU1RSRUFNX0NP
TkZJR19NQVhdOyAvKiBmb3IgREFJIGxpbmsgKi8KIAlfX2xlMzIgbnVtX3N0cmVhbXM7CS8qIG51
bWJlciBvZiBzdHJlYW1zICovCiAJc3RydWN0IHNuZF9zb2NfdHBsZ19zdHJlYW1fY2Fwc192NCBj
YXBzWzJdOyAvKiBwbGF5YmFjayBhbmQgY2FwdHVyZSBmb3IgREFJICovCi19IF9fcGFja2VkOwor
fSBfX2F0dHJpYnV0ZSgocGFja2VkKSk7CiAKIC8qIFBoeXNpY2FsIGxpbmsgY29uZmlnIHY0ICov
CiBzdHJ1Y3Qgc25kX3NvY190cGxnX2xpbmtfY29uZmlnX3Y0IHsKQEAgLTYyNyw2ICs2MjcsNiBA
QCBzdHJ1Y3Qgc25kX3NvY190cGxnX2xpbmtfY29uZmlnX3Y0IHsKIAlfX2xlMzIgaWQ7ICAgICAg
ICAgICAgICAvKiB1bmlxdWUgSUQgLSB1c2VkIHRvIG1hdGNoICovCiAJc3RydWN0IHNuZF9zb2Nf
dHBsZ19zdHJlYW0gc3RyZWFtW1NORF9TT0NfVFBMR19TVFJFQU1fQ09ORklHX01BWF07IC8qIHN1
cHBvcnRlZCBjb25maWdzIHBsYXliYWNrIGFuZCBjYXB0cnVyZSAqLwogCV9fbGUzMiBudW1fc3Ry
ZWFtczsgICAgIC8qIG51bWJlciBvZiBzdHJlYW1zICovCi19IF9fcGFja2VkOworfSBfX2F0dHJp
YnV0ZSgocGFja2VkKSk7CiAKICNlbmRpZgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
