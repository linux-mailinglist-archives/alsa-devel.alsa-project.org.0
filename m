Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDB2C8B7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 16:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0A717C5;
	Tue, 28 May 2019 16:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0A717C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559053640;
	bh=sNpFLMtvp1igvV2HtYEvqysgJOYOeYtLGN0upO1mZwk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izHr4/umX46Bab19dpy1wq3LgGh/CgZ7aWdwV3VsnRC29daDd06JyS/SDC69TZ4N8
	 3SMSm832b3CHYRPuNNSBtff9bnrRU7zbIh8iGiumKxyhKR5fXZJR/OAfb7nYup28ij
	 V+4Lhry+sVSDlZtWVhDBsAzhA6+GJBUJ+WhLuMkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D277F8972A;
	Tue, 28 May 2019 16:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3984AF896EB; Tue, 28 May 2019 16:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEDEF896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEDEF896B8
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id HqQS200083XaVaC01qQSAl; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058L-4Z; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057S-2y; Tue, 28 May 2019 16:24:26 +0200
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
Date: Tue, 28 May 2019 16:24:22 +0200
Message-Id: <20190528142424.19626-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Subject: [alsa-devel] [PATCH 3/5] net: sched: pie: Use ULL suffix for 64-bit
	constant
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

V2l0aCBnY2MgNC4xLCB3aGVuIGNvbXBpbGluZyBmb3IgYSAzMi1iaXQgcGxhdGZvcm06CgogICAg
bmV0L3NjaGVkL3NjaF9waWUuYzogSW4gZnVuY3Rpb24g4oCYZHJvcF9lYXJseeKAmToKICAgIG5l
dC9zY2hlZC9zY2hfcGllLmM6MTE2OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBs
YXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjEzODogd2Fy
bmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQog
ICAgbmV0L3NjaGVkL3NjaF9waWUuYzoxNDQ6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMg
dG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTQ3
OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0
eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOiBJbiBmdW5jdGlvbiDigJhwaWVfcWRpc2NfZW5x
dWV1ZeKAmToKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTczOiB3YXJuaW5nOiBpbnRlZ2VyIGNv
bnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2No
X3BpZS5jOiBJbiBmdW5jdGlvbiDigJhjYWxjdWxhdGVfcHJvYmFiaWxpdHnigJk6CiAgICBuZXQv
c2NoZWQvc2NoX3BpZS5jOjM3MTogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFy
Z2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgbmV0L3NjaGVkL3NjaF9waWUuYzozNzI6IHdhcm5p
bmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAg
IG5ldC9zY2hlZC9zY2hfcGllLmM6Mzc3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRv
byBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjM4Mjog
d2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlw
ZQogICAgbmV0L3NjaGVkL3NjaF9waWUuYzozOTc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQg
aXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6
Mzk4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KA
mSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjM5OTogd2FybmluZzogaW50ZWdlciBjb25z
dGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgbmV0L3NjaGVkL3NjaF9w
aWUuYzo0MDc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhs
b25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6NDE0OiB3YXJuaW5nOiBpbnRlZ2Vy
IGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCgpGaXggdGhpcyBieSBh
ZGRpbmcgdGhlIG1pc3NpbmcgIlVMTCIgc3VmZml4LgoKRml4ZXM6IDNmN2FlNWYzZGM1Mjk1YWMg
KCJuZXQ6IHNjaGVkOiBwaWU6IGFkZCBtb3JlIGNhc2VzIHRvIGF1dG8tdHVuZSBhbHBoYSBhbmQg
YmV0YSIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+Ci0tLQogbmV0L3NjaGVkL3NjaF9waWUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC9zY2hlZC9zY2hf
cGllLmMgYi9uZXQvc2NoZWQvc2NoX3BpZS5jCmluZGV4IDhmYTEyOWQzOTQzZTMyYWQuLmYzNDI0
ODMzZTZhN2NkM2IgMTAwNjQ0Ci0tLSBhL25ldC9zY2hlZC9zY2hfcGllLmMKKysrIGIvbmV0L3Nj
aGVkL3NjaF9waWUuYwpAQCAtMzEsNyArMzEsNyBAQAogCiAjZGVmaW5lIFFVRVVFX1RIUkVTSE9M
RCAxNjM4NAogI2RlZmluZSBEUUNPVU5UX0lOVkFMSUQgLTEKLSNkZWZpbmUgTUFYX1BST0IgMHhm
ZmZmZmZmZmZmZmZmZmZmCisjZGVmaW5lIE1BWF9QUk9CIDB4ZmZmZmZmZmZmZmZmZmZmZlVMTAog
I2RlZmluZSBQSUVfU0NBTEUgOAogCiAvKiBwYXJhbWV0ZXJzIHVzZWQgKi8KLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
