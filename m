Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493EA1CEA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09DF21681;
	Thu, 29 Aug 2019 16:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09DF21681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089415;
	bh=RkQUDnZUbXJuExUHsBJviFgJ4IBZ1AFHd9eeiUYnHx4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJhqG0VZqzxVd/RcGTp+99N5vAFSuC1TWdELK2z0DXBh9ic6HfhUu05gAnr2Ca2ID
	 pXp/IUFGXQas7Zss4oYOf/LcLsX+Df/nVJTM2Tr8hBHNj2tiakeSDs28Zz8fUJXYaH
	 VR9o0jqB4Peklu0D0KhWc8r2w5NGwtn+tp1wGuY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FB5FF897D2;
	Wed, 28 Aug 2019 20:01:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E54F897D0; Wed, 28 Aug 2019 20:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A185F897CD
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 20:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A185F897CD
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i32GF-0007ef-An; Wed, 28 Aug 2019 18:01:35 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com,
	tiwai@suse.com
Date: Thu, 29 Aug 2019 02:01:28 +0800
Message-Id: <20190828180128.1732-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827134756.10807-2-kai.heng.feng@canonical.com>
References: <20190827134756.10807-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 2/2] ALSA: hda: Allow HDA to be runtime
	suspended when dGPU is not bound
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

SXQncyBhIGNvbW1vbiBwcmFjdGljZSB0byBsZXQgZEdQVSB1bmJvdW5kIGFuZCB1c2UgUENJIHBs
YXRmb3JtIHBvd2VyCm1hbmFnZW1lbnQgdG8gZGlzYWJsZSBpdHMgcG93ZXIgdGhyb3VnaCBfT0ZG
IG1ldGhvZCBvZiBwb3dlciByZXNvdXJjZSwKd2hpY2ggaXMgbGlzdGVkIGJ5IF9QUjMuCldoZW4g
dGhlIGRHUFUgY29tZXMgd2l0aCBhbiBIREEgZnVuY3Rpb24sIHRoZSBIREEgd29uJ3QgYmUgc3Vz
cGVuZGVkIGlmCnRoZSBkR1BVIGlzIHVuYm91bmQsIHNvIHRoZSBwb3dlciByZXNvdXJjZSBjYW4n
dCBiZSB0dXJuZWQgb2ZmLgoKQ29tbWl0IDM3YTNhOThlZjYwMSAoIkFMU0E6IGhkYSAtIEVuYWJs
ZSBydW50aW1lIFBNIG9ubHkgZm9yCmRpc2NyZXRlIEdQVSIpIG9ubHkgYWxsb3dzIEhEQSB0byBi
ZSBydW50aW1lLXN1c3BlbmRlZCBvbmNlIEdQVSBpcwpib3VuZCwgdG8ga2VlcCBBUFUncyBIREEg
d29ya2luZy4KCkhvd2V2ZXIsIEhEQSBvbiBkR1BVIGlzbid0IHRoYXQgdXNlZnVsIGlmIGRHUFUg
aXMgdW5ib3VuZC4gU28gbGV0J3MKcmVsYXggdGhlIHJ1bnRpbWUgc3VzcGVuZCByZXF1aXJlbWVu
dCBmb3IgZEdQVSdzIEhEQSBmdW5jdGlvbiwgdG8gc2F2ZQpsb3RzIG9mIHBvd2VyLgoKQnVnTGlu
azogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xODQwODM1CkZpeGVzOiBiNTE2ZWE1
ODZkNzEgKCJQQ0k6IEVuYWJsZSBOVklESUEgSERBIGNvbnRyb2xsZXJz4oCdKQpTaWduZWQtb2Zm
LWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Ci0tLQp2MjoK
LSBDaGFuZ2Ugd29yZGluZy4KLSBSZWJhc2UgdG8gVGl3YWkncyBicmFuY2guCgogc291bmQvcGNp
L2hkYS9oZGFfaW50ZWwuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwu
YyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKaW5kZXggOTFlNzFiZTQyZmE0Li5jMzY1NGQy
Mjc5NWEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKKysrIGIvc291bmQv
cGNpL2hkYS9oZGFfaW50ZWwuYwpAQCAtMTI4NCw3ICsxMjg0LDExIEBAIHN0YXRpYyB2b2lkIGlu
aXRfdmdhX3N3aXRjaGVyb28oc3RydWN0IGF6eCAqY2hpcCkKIAkJZGV2X2luZm8oY2hpcC0+Y2Fy
ZC0+ZGV2LAogCQkJICJIYW5kbGUgdmdhX3N3aXRjaGVyb28gYXVkaW8gY2xpZW50XG4iKTsKIAkJ
aGRhLT51c2VfdmdhX3N3aXRjaGVyb28gPSAxOwotCQljaGlwLT5idXMua2VlcF9wb3dlciA9IDE7
IC8qIGNsZWFyZWQgaW4gZWl0aGVyIGdwdV9ib3VuZCBvcCBvciBjb2RlYyBwcm9iZSAqLworCisJ
CS8qIGNsZWFyZWQgaW4gZWl0aGVyIGdwdV9ib3VuZCBvcCBvciBjb2RlYyBwcm9iZSwgb3Igd2hl
biBpdHMKKwkJICogcm9vdCBwb3J0IGhhcyBfUFIzIChpLmUuIGRHUFUpLgorCQkgKi8KKwkJY2hp
cC0+YnVzLmtlZXBfcG93ZXIgPSAhcGNpX3ByM19wcmVzZW50KHApOwogCQljaGlwLT5kcml2ZXJf
Y2FwcyB8PSBBWlhfRENBUFNfUE1fUlVOVElNRTsKIAkJcGNpX2Rldl9wdXQocCk7CiAJfQotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
