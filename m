Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EF30CB5
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 12:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED2115E5;
	Fri, 31 May 2019 12:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED2115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559299042;
	bh=9R75qXWrSdBoAgDZTN6WwjJC/TTBpPxCenbk9aoNpv8=;
	h=From:In-Reply-To:References:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7iePHMpREaZGzOfmuL51W41kO0axVavyoogoQX2zhR09plON8WcNVSkVgYTow5qt
	 fyau+0j0783xwyapoRftOJS4rbi9+J0dguYKu/n6+f2JsuPPVLAzcVFCsh9E6V8KTG
	 IamMMD87Qe6qMH8Ydj1tDAcqKaxZ2ZL0QQGU/4gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A22F7F896F7;
	Fri, 31 May 2019 12:35:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C2FF89700; Fri, 31 May 2019 12:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB1AF80757
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 12:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB1AF80757
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1845730C1B98;
 Fri, 31 May 2019 10:34:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 586D5600C7;
 Fri, 31 May 2019 10:34:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Date: Fri, 31 May 2019 11:34:44 +0100
Message-ID: <15499.1559298884@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 31 May 2019 10:35:17 +0000 (UTC)
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 dhowells@redhat.com, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: [alsa-devel] [PATCH] rxrpc: Fix uninitialized error code in
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

CkhpIEdlZXJ0LAoKSGVyZSdzIG15IHRha2Ugb24gdGhlIHBhdGNoLgoKRGF2aWQKLS0tCnJ4cnBj
OiBGaXggdW5pbml0aWFsaXplZCBlcnJvciBjb2RlIGluIHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQo
KSAgICAKICAgIApXaXRoIGdjYyA0LjE6CgogICAgbmV0L3J4cnBjL291dHB1dC5jOiBJbiBmdW5j
dGlvbiDigJhyeHJwY19zZW5kX2RhdGFfcGFja2V04oCZOgogICAgbmV0L3J4cnBjL291dHB1dC5j
OjMzODogd2FybmluZzog4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhp
cyBmdW5jdGlvbgoKSW5kZWVkLCBpZiB0aGUgZmlyc3QganVtcCB0byB0aGUgc2VuZF9mcmFnbWVu
dGFibGUgbGFiZWwgaXMgbWFkZSwgYW5kCnRoZSBhZGRyZXNzIGZhbWlseSBpcyBub3QgaGFuZGxl
ZCBpbiB0aGUgc3dpdGNoKCkgc3RhdGVtZW50LCByZXQgd2lsbCBiZQp1c2VkIHVuaW5pdGlhbGl6
ZWQuCgpGaXggdGhpcyBieSBCVUcoKSdpbmcgYXMgaXMgZG9uZSBpbiBvdGhlciBwbGFjZXMgaW4g
cnhycGMgd2hlcmUgaW50ZXJuYWwKc3VwcG9ydCBmb3IgZnV0dXJlIGFkZHJlc3MgZmFtaWxpZXMg
d2lsbCBuZWVkIGFkZGluZy4gIEl0IHNob3VsZCBub3QgYmUKcG9zc2libGUgdG8gcmVhY2ggdGhp
cyBub3JtYWxseSBhcyB0aGUgYWRkcmVzcyBmYW1pbGllcyBhcmUgY2hlY2tlZAp1cC1mcm9udC4K
CkZpeGVzOiA1YTkyNGI4OTUxZjgzNWI1ICgicnhycGM6IERvbid0IHN0b3JlIHRoZSByeHJwYyBo
ZWFkZXIgaW4gdGhlIFR4IHF1ZXVlIHNrX2J1ZmZzIikKUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhvd2Vs
bHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Ci0tLQpkaWZmIC0tZ2l0IGEvbmV0L3J4cnBjL291dHB1
dC5jIGIvbmV0L3J4cnBjL291dHB1dC5jCmluZGV4IDAwNGM3NjJjMmU4ZC4uNmYyYjRmYjRiMGFh
IDEwMDY0NAotLS0gYS9uZXQvcnhycGMvb3V0cHV0LmMKKysrIGIvbmV0L3J4cnBjL291dHB1dC5j
CkBAIC01MjMsNiArNTIzLDkgQEAgaW50IHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoc3RydWN0IHJ4
cnBjX2NhbGwgKmNhbGwsIHN0cnVjdCBza19idWZmICpza2IsCiAJCX0KIAkJYnJlYWs7CiAjZW5k
aWYKKworCWRlZmF1bHQ6CisJCUJVRygpOwogCX0KIAogCWlmIChyZXQgPCAwKQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
