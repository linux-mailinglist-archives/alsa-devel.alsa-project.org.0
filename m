Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB12C8BA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 16:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C31A17AA;
	Tue, 28 May 2019 16:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C31A17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559053687;
	bh=aeQ9tbfiuIuMW42cCOm1vOtx2zMH4drg0BhIbw5yTno=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUpTgHyOh2CpDAm4GKC3xGQz5ueZzZkc/YHu9mT4P67DG3HiiNqGrWX/1+sSkOyV0
	 A4QWr+nFyCJw1Y+EgKGzmLpu++CTezQiUTgSWE1Yb9MtSNeAMGbzMw/37XijIWEEXO
	 r+gHNMFZ9RCv7AHshRkWBvgxFD8wDl4PdGxEzMFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3294F89730;
	Tue, 28 May 2019 16:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64F1CF8970A; Tue, 28 May 2019 16:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF615F89706
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF615F89706
Received: from ramsan ([84.194.111.163]) by albert.telenet-ops.be with bizsmtp
 id HqQS2000E3XaVaC06qQSub; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058P-7H; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057Z-4f; Tue, 28 May 2019 16:24:26 +0200
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
Date: Tue, 28 May 2019 16:24:24 +0200
Message-Id: <20190528142424.19626-6-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Subject: [alsa-devel] [PATCH 5/5] [RFC] devlink: Fix uninitialized error
	code in devlink_fmsg_prepare_skb()
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

V2l0aCBnY2MgNC4xOgoKICAgIG5ldC9jb3JlL2RldmxpbmsuYzogSW4gZnVuY3Rpb24g4oCYZGV2
bGlua19mbXNnX3ByZXBhcmVfc2ti4oCZOgogICAgbmV0L2NvcmUvZGV2bGluay5jOjQzMjU6IHdh
cm5pbmc6IOKAmGVycuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rp
b24KCkluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3RhcnQgZW50cmllcywgYW4g
dW5pbml0aWFsaXplZCBlcnJvcgpjb2RlIHdpbGwgYmUgcmV0dXJuZWQuCgpGaXggdGhpcyBieSBw
cmVpbml0aWFsaXppbmcgZXJyIHRvIHplcm8uCgpGaXhlczogMWRiNjRlODczM2Y2NTM4MSAoImRl
dmxpbms6IEFkZCBkZXZsaW5rIGZvcm1hdHRlZCBtZXNzYWdlIChmbXNnKSBBUEkiKQpTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KSSBk
b24ndCBrbm93IGlmIHRoaXMgY2FuIHJlYWxseSBoYXBwZW4sIGFuZCBpZiB0aGlzIGlzIHRoZSBy
aWdodCBmaXguClBlcmhhcHMgZXJyIHNob3VsZCBiZSBpbml0aWFsaXplZCB0byBzb21lIHZhbGlk
IGVycm9yIGNvZGUgaW5zdGVhZD8KLS0tCiBuZXQvY29yZS9kZXZsaW5rLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9u
ZXQvY29yZS9kZXZsaW5rLmMgYi9uZXQvY29yZS9kZXZsaW5rLmMKaW5kZXggZDQzYmM1MmI4ODQw
ZDc2Yi4uOTEzNzdlNGVhZTlhNDNjMSAxMDA2NDQKLS0tIGEvbmV0L2NvcmUvZGV2bGluay5jCisr
KyBiL25ldC9jb3JlL2RldmxpbmsuYwpAQCAtNDMyMSw4ICs0MzIxLDggQEAgZGV2bGlua19mbXNn
X3ByZXBhcmVfc2tiKHN0cnVjdCBkZXZsaW5rX2Ztc2cgKmZtc2csIHN0cnVjdCBza19idWZmICpz
a2IsCiB7CiAJc3RydWN0IGRldmxpbmtfZm1zZ19pdGVtICppdGVtOwogCXN0cnVjdCBubGF0dHIg
KmZtc2dfbmxhdHRyOworCWludCBlcnIgPSAwOwogCWludCBpID0gMDsKLQlpbnQgZXJyOwogCiAJ
Zm1zZ19ubGF0dHIgPSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBERVZMSU5LX0FUVFJfRk1T
Ryk7CiAJaWYgKCFmbXNnX25sYXR0cikKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
