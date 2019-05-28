Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BADFC2C8B5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 16:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F52217EE;
	Tue, 28 May 2019 16:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F52217EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559053601;
	bh=+TfByo3mCFGVU0i8d5bJgQlVVklArf1uEFWae89Rfp0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpFvSEHYAEu7Ja1cpnk+LamzmU8My8E6u1hiaRMWXqVebGnNd51+i6WmmS/VIexAK
	 0vsmfekwGF/uZxHn/4zckUmgG30Tbz9m/73MXlb7Cq16mHhkeVun4A8e3TVK/U++uw
	 6kDDs7rtl62jGTDGQYZTjM6Ecnzpjsx5sYqsflV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D582DF89708;
	Tue, 28 May 2019 16:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 072FAF89728; Tue, 28 May 2019 16:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693A3F896EB
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693A3F896EB
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id HqQS200073XaVaC01qQSAk; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058G-2v; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057O-1L; Tue, 28 May 2019 16:24:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Igor Konopko <igor.j.konopko@intel.com>,
 David Howells <dhowells@redhat.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Eran Ben Elisha <eranbe@mellanox.com>, Matias Bjorling <mb@lightnvm.io>,
 Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 May 2019 16:24:20 +0200
Message-Id: <20190528142424.19626-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Subject: [alsa-devel] [PATCH 1/5] lightnvm: Fix uninitialized pointer in
	nvm_remove_tgt()
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

V2l0aCBnY2MgNC4xOgoKICAgIGRyaXZlcnMvbGlnaHRudm0vY29yZS5jOiBJbiBmdW5jdGlvbiDi
gJhudm1fcmVtb3ZlX3RndOKAmToKICAgIGRyaXZlcnMvbGlnaHRudm0vY29yZS5jOjUxMDogd2Fy
bmluZzog4oCYdOKAmSBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgoKSW5k
ZWVkLCBpZiBubyBOVk0gZGV2aWNlcyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCwgdCB3aWxsIGJlIGFu
CnVuaW5pdGlhbGl6ZWQgcG9pbnRlciwgYW5kIG1heSBiZSBkZXJlZmVyZW5jZWQgbGF0ZXIuICBB
IGNhbGwgdG8KbnZtX3JlbW92ZV90Z3QoKSBjYW4gYmUgdHJpZ2dlcmVkIGZyb20gdXNlcnNwYWNl
IGJ5IGlzc3VpbmcgdGhlCk5WTV9ERVZfUkVNT1ZFIGlvY3RsIG9uIHRoZSBsaWdodG52bSBjb250
cm9sIGRldmljZS4KCkZpeCB0aGlzIGJ5IHByZWluaXRpYWxpemluZyB0IHRvIE5VTEwuCgpGaXhl
czogODQzZjJlZGJkZGUwODViNCAoImxpZ2h0bnZtOiBkbyBub3QgcmVtb3ZlIGluc3RhbmNlIHVu
ZGVyIGdsb2JhbCBsb2NrIikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KLS0tCiBkcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jIGIvZHJpdmVycy9saWdodG52bS9jb3JlLmMKaW5kZXgg
MGRmNzQ1NDgzMmVmZTA4Mi4uYWEwMTdmNDhlYjhjNTg4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
aWdodG52bS9jb3JlLmMKKysrIGIvZHJpdmVycy9saWdodG52bS9jb3JlLmMKQEAgLTQ5Miw3ICs0
OTIsNyBAQCBzdGF0aWMgdm9pZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0
ICp0LCBib29sIGdyYWNlZnVsKQogICovCiBzdGF0aWMgaW50IG52bV9yZW1vdmVfdGd0KHN0cnVj
dCBudm1faW9jdGxfcmVtb3ZlICpyZW1vdmUpCiB7Ci0Jc3RydWN0IG52bV90YXJnZXQgKnQ7CisJ
c3RydWN0IG52bV90YXJnZXQgKnQgPSBOVUxMOwogCXN0cnVjdCBudm1fZGV2ICpkZXY7CiAKIAlk
b3duX3JlYWQoJm52bV9sb2NrKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
