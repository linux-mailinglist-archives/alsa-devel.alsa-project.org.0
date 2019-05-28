Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB192C8BC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 16:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC0917FC;
	Tue, 28 May 2019 16:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC0917FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559053753;
	bh=AWbLQlPqiWYBdpCxWamnuD/Bm9aPxMeDqKGeBI+dXoI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3ysTGc+eaNsjhaznw6ccqdKjlcVmX2c9kSzA4NAjaXDURM07pCzPVKorXuKkJhBi
	 F/Kva4byZenhkQNH9OEAZxRQo+ixJ3D3Ac0UnbOXoi8HW0BQCSqS9BFsIDIUPyDzHe
	 vc56keTBLqQ4XWWzyr4EBZLr7e9qcDu8PLiID3t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A83F896B8;
	Tue, 28 May 2019 16:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D90D7F89706; Tue, 28 May 2019 16:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 314ABF89719
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314ABF89719
Received: from ramsan ([84.194.111.163])
 by baptiste.telenet-ops.be with bizsmtp
 id HqQS2000C3XaVaC01qQSFC; Tue, 28 May 2019 16:24:42 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058N-5X; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057W-3p; Tue, 28 May 2019 16:24:26 +0200
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
Date: Tue, 28 May 2019 16:24:23 +0200
Message-Id: <20190528142424.19626-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Subject: [alsa-devel] [PATCH 4/5] ALSA: fireface: Use ULL suffixes for
	64-bit constants
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

V2l0aCBnY2MgNC4xOgoKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxh
dHRlci5jOiBJbiBmdW5jdGlvbiDigJhsYXR0ZXJfc3dpdGNoX2ZldGNoaW5nX21vZGXigJk6CiAg
ICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzo5Nzogd2Fybmlu
ZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAg
c291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmM6IEluIGZ1bmN0aW9u
IOKAmGxhdHRlcl9iZWdpbl9zZXNzaW9u4oCZOgogICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2Uv
ZmYtcHJvdG9jb2wtbGF0dGVyLmM6MTcwOiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRv
byBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9m
Zi1wcm90b2NvbC1sYXR0ZXIuYzoxOTc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9v
IGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2Zm
LXByb3RvY29sLWxhdHRlci5jOjIwNTogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28g
bGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYt
cHJvdG9jb2wtbGF0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmGxhdHRlcl9maW5pc2hfc2Vzc2lvbuKA
mToKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjIxNDog
d2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlw
ZQoKRml4IHRoaXMgYnkgYWRkaW5nIHRoZSBtaXNzaW5nICJVTEwiIHN1ZmZpeGVzLgpBZGQgdGhl
IHNhbWUgc3VmZml4IHRvIHRoZSBsYXN0IGNvbnN0YW50LCB0byBtYWludGFpbiBjb25zaXN0ZW5j
eS4KCkZpeGVzOiBmZDFjYzlkZTY0YzJjYTZjICgiQUxTQTogZmlyZWZhY2U6IGFkZCBzdXBwb3J0
IGZvciBGaXJlZmFjZSBVQ1giKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3Rv
Y29sLWxhdHRlci5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9maXJld2lyZS9maXJlZmFj
ZS9mZi1wcm90b2NvbC1sYXR0ZXIuYyBiL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3Rv
Y29sLWxhdHRlci5jCmluZGV4IGM4MjM2ZmY4OWI3ZmI5ZGUuLmIzMGQwMmQzNTliMWQyMWIgMTAw
NjQ0Ci0tLSBhL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jCisr
KyBiL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jCkBAIC05LDEx
ICs5LDExIEBACiAKICNpbmNsdWRlICJmZi5oIgogCi0jZGVmaW5lIExBVFRFUl9TVEYJCTB4ZmZm
ZjAwMDAwMDA0Ci0jZGVmaW5lIExBVFRFUl9JU09DX0NIQU5ORUxTCTB4ZmZmZjAwMDAwMDA4Ci0j
ZGVmaW5lIExBVFRFUl9JU09DX1NUQVJUCTB4ZmZmZjAwMDAwMDBjCi0jZGVmaW5lIExBVFRFUl9G
RVRDSF9NT0RFCTB4ZmZmZjAwMDAwMDEwCi0jZGVmaW5lIExBVFRFUl9TWU5DX1NUQVRVUwkweDAw
MDA4MDFjMDAwMAorI2RlZmluZSBMQVRURVJfU1RGCQkweGZmZmYwMDAwMDAwNFVMTAorI2RlZmlu
ZSBMQVRURVJfSVNPQ19DSEFOTkVMUwkweGZmZmYwMDAwMDAwOFVMTAorI2RlZmluZSBMQVRURVJf
SVNPQ19TVEFSVAkweGZmZmYwMDAwMDAwY1VMTAorI2RlZmluZSBMQVRURVJfRkVUQ0hfTU9ERQkw
eGZmZmYwMDAwMDAxMFVMTAorI2RlZmluZSBMQVRURVJfU1lOQ19TVEFUVVMJMHgwMDAwODAxYzAw
MDBVTEwKIAogc3RhdGljIGludCBwYXJzZV9jbG9ja19iaXRzKHUzMiBkYXRhLCB1bnNpZ25lZCBp
bnQgKnJhdGUsCiAJCQkgICAgZW51bSBzbmRfZmZfY2xvY2tfc3JjICpzcmMpCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
