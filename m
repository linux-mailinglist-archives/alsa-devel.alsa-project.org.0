Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424382C8CF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 16:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55B117C6;
	Tue, 28 May 2019 16:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55B117C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559053796;
	bh=Av5IsXLWc6LZq/FbJ6hiMNMRzze+iI32vT/b7ABUEgU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXMlRKi8FLtLYsLmFiTsTBuLHCuHw0B+Id1c5rRjpmGD9dxfFq6eT3y3D3M3Qh4Pb
	 ZZoGHW338vThmo115G4BAAKM3p5DViOrzwv9wTCzNuZQYea2iCtD+S74lI2TiDH5pQ
	 SnjjpOOQXn+vpvAlomjc7OPAt0Gd4GmTEXnDdTwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A360F8973E;
	Tue, 28 May 2019 16:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12B1BF896EB; Tue, 28 May 2019 16:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D82F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D82F8072E
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id HqQS2000L3XaVaC01qQSyd; Tue, 28 May 2019 16:24:42 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058J-3j; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057Q-26; Tue, 28 May 2019 16:24:26 +0200
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
Date: Tue, 28 May 2019 16:24:21 +0200
Message-Id: <20190528142424.19626-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Subject: [alsa-devel] [PATCH 2/5] rxrpc: Fix uninitialized error code in
	rxrpc_send_data_packet()
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

V2l0aCBnY2MgNC4xOgoKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhy
cGNfc2VuZF9kYXRhX3BhY2tldOKAmToKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5p
bmc6IOKAmHJldOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24K
CkluZGVlZCwgaWYgdGhlIGZpcnN0IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVs
IGlzIG1hZGUsIGFuZAp0aGUgYWRkcmVzcyBmYW1pbHkgaXMgbm90IGhhbmRsZWQgaW4gdGhlIHN3
aXRjaCgpIHN0YXRlbWVudCwgcmV0IHdpbGwgYmUKdXNlZCB1bmluaXRpYWxpemVkLgoKRml4IHRo
aXMgYnkgaW5pdGlhbGl6aW5nIGVyciB0byB6ZXJvIGJlZm9yZSB0aGUganVtcCwgbGlrZSBpcyBh
bHJlYWR5CmRvbmUgZm9yIHRoZSBqdW1wIHRvIHRoZSBkb25lIGxhYmVsLgoKRml4ZXM6IDVhOTI0
Yjg5NTFmODM1YjUgKCJyeHJwYzogRG9uJ3Qgc3RvcmUgdGhlIHJ4cnBjIGhlYWRlciBpbiB0aGUg
VHggcXVldWUgc2tfYnVmZnMiKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KV2hpbGUgdGhpcyBpcyBub3QgYSByZWFsIGZhbHNlLXBv
c2l0aXZlLCBJIGJlbGlldmUgaXQgY2Fubm90IGNhdXNlIGhhcm0KaW4gcHJhY3RpY2UsIGFzIEFG
X1JYUlBDIGNhbm5vdCBiZSB1c2VkIHdpdGggb3RoZXIgdHJhbnNwb3J0IGZhbWlsaWVzCnRoYW4g
SVB2NCBhbmQgSVB2Ni4KLS0tCiBuZXQvcnhycGMvb3V0cHV0LmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9uZXQv
cnhycGMvb3V0cHV0LmMgYi9uZXQvcnhycGMvb3V0cHV0LmMKaW5kZXggMDA0Yzc2MmMyZThkMDYz
Yy4uMTQ3M2Q3NzRkNjcxMDBjNSAxMDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1dC5jCisrKyBi
L25ldC9yeHJwYy9vdXRwdXQuYwpAQCAtNDAzLDggKzQwMywxMCBAQCBpbnQgcnhycGNfc2VuZF9k
YXRhX3BhY2tldChzdHJ1Y3QgcnhycGNfY2FsbCAqY2FsbCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwK
IAogCS8qIHNlbmQgdGhlIHBhY2tldCB3aXRoIHRoZSBkb24ndCBmcmFnbWVudCBiaXQgc2V0IGlm
IHdlIGN1cnJlbnRseQogCSAqIHRoaW5rIGl0J3Mgc21hbGwgZW5vdWdoICovCi0JaWYgKGlvdlsx
XS5pb3ZfbGVuID49IGNhbGwtPnBlZXItPm1heGRhdGEpCisJaWYgKGlvdlsxXS5pb3ZfbGVuID49
IGNhbGwtPnBlZXItPm1heGRhdGEpIHsKKwkJcmV0ID0gMDsKIAkJZ290byBzZW5kX2ZyYWdtZW50
YWJsZTsKKwl9CiAKIAlkb3duX3JlYWQoJmNvbm4tPnBhcmFtcy5sb2NhbC0+ZGVmcmFnX3NlbSk7
CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
