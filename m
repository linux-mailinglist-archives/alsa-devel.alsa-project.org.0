Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B815AB82
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 15:59:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78E9166D;
	Wed, 12 Feb 2020 15:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78E9166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581519564;
	bh=77znf2YnOkdCFnqf9cK9at6jFCG908JLcC4JQ837WCI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uncXvubeDe2J69S2pQ4zH8c5gt72ZbofFhAjHqARwF0l4zhmHYjZvOnWilZkIznBu
	 wPjwGoDCDxX21Gk+F7VEwBhnLX7Pihge3ms1/Nx+cE0omPqaov108Zsl3GdcauJ8/g
	 MNYYckFQrpo0Kj8x+B0Fq/Ke8KvOejrlh8YTPKYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68030F8019B;
	Wed, 12 Feb 2020 15:57:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F0B6F80157; Wed, 12 Feb 2020 15:56:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FBC8F8014F
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 15:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FBC8F8014F
Received: from ramsan ([84.195.182.253]) by xavier.telenet-ops.be with bizsmtp
 id 1qwu2200e5USYZQ01qwuw1; Wed, 12 Feb 2020 15:56:55 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0004yr-Nr; Wed, 12 Feb 2020 15:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j1tRe-0001DZ-Mm; Wed, 12 Feb 2020 15:56:54 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 12 Feb 2020 15:56:49 +0100
Message-Id: <20200212145650.4602-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212145650.4602-1-geert@linux-m68k.org>
References: <20200212145650.4602-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/3] ASoC: Fix SND_SOC_ALL_CODECS imply I2C
	fallout
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

Rml4ZXMgZm9yIENPTkZJR19JMkM9bjoKCiAgICBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5k
ZW5jaWVzIGRldGVjdGVkIGZvciBSRUdNQVBfSTJDCiAgICAgIERlcGVuZHMgb24gW25dOiBJMkMg
Wz1uXQogICAgICBTZWxlY3RlZCBieSBbbV06CiAgICAgIC0gU05EX1NPQ19BREFVMTc4MV9JMkMg
Wz1tXSAmJiBTT1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dCiAg
ICAgIC0gU05EX1NPQ19BREFVMTk3N19JMkMgWz1tXSAmJiBTT1VORCBbPW1dICYmICFVTUwgJiYg
U05EIFs9bV0gJiYgU05EX1NPQyBbPW1dCiAgICAgIC0gU05EX1NPQ19SVDU2NzcgWz1tXSAmJiBT
T1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dCgogICAgc291bmQv
c29jL2NvZGVjcy8uLi46IGVycm9yOiB0eXBlIGRlZmF1bHRzIHRvIOKAmGludOKAmSBpbiBkZWNs
YXJhdGlvbiBvZiDigJhtb2R1bGVfaTJjX2RyaXZlcuKAmSBbLVdlcnJvcj1pbXBsaWNpdC1pbnRd
CgogICAgZHJpdmVycy9iYXNlL3JlZ21hcC9yZWdtYXAtaTJjLmM6IEluIGZ1bmN0aW9uIOKAmHJl
Z21hcF9zbWJ1c19ieXRlX3JlZ19yZWFk4oCZOgogICAgZHJpdmVycy9iYXNlL3JlZ21hcC9yZWdt
YXAtaTJjLmM6MjU6ODogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKA
mGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YeKAmTsgZGlkIHlvdSBtZWFuIOKAmGkyY19zZXRfYWRh
cGRhdGHigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKRml4ZXM6
IGVhMDBkOTUyMDBkMDJlY2UgKCJBU29DOiBVc2UgaW1wbHkgZm9yIFNORF9TT0NfQUxMX0NPREVD
UyIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+Ci0tLQogc291bmQvc29jL2NvZGVjcy9LY29uZmlnIHwgOSArKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL0tj
b25maWcgYi9zb3VuZC9zb2MvY29kZWNzL0tjb25maWcKaW5kZXggYzJmYjk4NWRlOGM0ZTAyYS4u
M2VmODA0ZDA3ZGVlYTQxZCAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9LY29uZmlnCisr
KyBiL3NvdW5kL3NvYy9jb2RlY3MvS2NvbmZpZwpAQCAtMzM5LDYgKzMzOSw3IEBAIGNvbmZpZyBT
TkRfU09DX0FEMTkzWF9TUEkKIAogY29uZmlnIFNORF9TT0NfQUQxOTNYX0kyQwogCXRyaXN0YXRl
CisJZGVwZW5kcyBvbiBJMkMKIAlzZWxlY3QgU05EX1NPQ19BRDE5M1gKIAogY29uZmlnIFNORF9T
T0NfQUQxOTgwCkBAIC0zNTMsNiArMzU0LDcgQEAgY29uZmlnIFNORF9TT0NfQURBVV9VVElMUwog
CiBjb25maWcgU05EX1NPQ19BREFVMTM3MwogCXRyaXN0YXRlCisJZGVwZW5kcyBvbiBJMkMKIAlz
ZWxlY3QgU05EX1NPQ19BREFVX1VUSUxTCiAKIGNvbmZpZyBTTkRfU09DX0FEQVUxNzAxCkBAIC0z
ODcsNiArMzg5LDcgQEAgY29uZmlnIFNORF9TT0NfQURBVTE3ODEKIAogY29uZmlnIFNORF9TT0Nf
QURBVTE3ODFfSTJDCiAJdHJpc3RhdGUKKwlkZXBlbmRzIG9uIEkyQwogCXNlbGVjdCBTTkRfU09D
X0FEQVUxNzgxCiAJc2VsZWN0IFJFR01BUF9JMkMKIApAQCAtNDA3LDYgKzQxMCw3IEBAIGNvbmZp
ZyBTTkRfU09DX0FEQVUxOTc3X1NQSQogCiBjb25maWcgU05EX1NPQ19BREFVMTk3N19JMkMKIAl0
cmlzdGF0ZQorCWRlcGVuZHMgb24gSTJDCiAJc2VsZWN0IFNORF9TT0NfQURBVTE5NzcKIAlzZWxl
Y3QgUkVHTUFQX0kyQwogCkBAIC00NTAsNiArNDU0LDcgQEAgY29uZmlnIFNORF9TT0NfQURBVjgw
MQogCiBjb25maWcgU05EX1NPQ19BREFWODAzCiAJdHJpc3RhdGUKKwlkZXBlbmRzIG9uIEkyQwog
CXNlbGVjdCBTTkRfU09DX0FEQVY4MFgKIAogY29uZmlnIFNORF9TT0NfQURTMTE3WApAQCAtNDcx
LDYgKzQ3Niw3IEBAIGNvbmZpZyBTTkRfU09DX0FLNDQ1OAogCiBjb25maWcgU05EX1NPQ19BSzQ1
MzUKIAl0cmlzdGF0ZQorCWRlcGVuZHMgb24gSTJDCiAKIGNvbmZpZyBTTkRfU09DX0FLNDU1NAog
CXRyaXN0YXRlICJBS00gQUs0NTU0IENPREVDIgpAQCAtNDgxLDYgKzQ4Nyw3IEBAIGNvbmZpZyBT
TkRfU09DX0FLNDYxMwogCiBjb25maWcgU05EX1NPQ19BSzQ2NDEKIAl0cmlzdGF0ZQorCWRlcGVu
ZHMgb24gSTJDCiAKIGNvbmZpZyBTTkRfU09DX0FLNDY0MgogCXRyaXN0YXRlICJBS00gQUs0NjQy
IENPREVDIgpAQCAtNDg4LDYgKzQ5NSw3IEBAIGNvbmZpZyBTTkRfU09DX0FLNDY0MgogCiBjb25m
aWcgU05EX1NPQ19BSzQ2NzEKIAl0cmlzdGF0ZQorCWRlcGVuZHMgb24gSTJDCiAKIGNvbmZpZyBT
TkRfU09DX0FLNTM4NgogCXRyaXN0YXRlICJBS00gQUs1NjM4IENPREVDIgpAQCAtMTExMiw2ICsx
MTIwLDcgQEAgY29uZmlnIFNORF9TT0NfUlQ1NjcwCiAKIGNvbmZpZyBTTkRfU09DX1JUNTY3Nwog
CXRyaXN0YXRlCisJZGVwZW5kcyBvbiBJMkMKIAlzZWxlY3QgUkVHTUFQX0kyQwogCXNlbGVjdCBS
RUdNQVBfSVJRCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
