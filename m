Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EC2D445
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 05:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7ED886F;
	Wed, 29 May 2019 05:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7ED886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559100621;
	bh=yBSJWqGa+3YrYE1qQOXpvlsBQz5wGARkmNY/5Nb9TA4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9oYVM61kthk8V3z/UqaP3E8NvsK1uZq+iihs/uz+TsLklWN1G8xPsOe9DssY0SyC
	 gu+BENPNxX1a7it1GsT9043k2VoQaew/mJbd84bLWxT4MUhltJUO3FAplGiU/amclD
	 RWU69Sz/T00RWXngboE38CL6luUfPuCjUGpxw4SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00980F896E4;
	Wed, 29 May 2019 05:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393EBF896E4; Wed, 29 May 2019 05:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E8CF8072E
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 05:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E8CF8072E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F1DA200379;
 Wed, 29 May 2019 05:28:28 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DEB9F200009;
 Wed, 29 May 2019 05:28:24 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F07D4402AE;
 Wed, 29 May 2019 11:28:19 +0800 (SGT)
From: shengjiu.wang@nxp.com
To: brian.austin@cirrus.com, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Date: Wed, 29 May 2019 11:30:02 +0800
Message-Id: <20190529033002.16606-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: cs42xx8: Fix build error with
	CONFIG_GPIOLIB is not set
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

RnJvbTogU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29tPgoKY29uZmlnOiB4ODZf
NjQtcmFuZGNvbmZpZy14MDAwMjAxOTIxLTIwMTkyMQpjb21waWxlcjogZ2NjLTcgKERlYmlhbiA3
LjMuMC0xKSA3LjMuMApyZXByb2R1Y2U6CiAgICAgICAgbWFrZSBBUkNIPXg4Nl82NAoKc291bmQv
c29jL2NvZGVjcy9jczQyeHg4LmM6IEluIGZ1bmN0aW9uIOKAmGNzNDJ4eDhfcHJvYmXigJk6CnNv
dW5kL3NvYy9jb2RlY3MvY3M0Mnh4OC5jOjQ3MjoyNTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs4oCZOyBkaWQgeW91IG1l
YW4g4oCYZGV2bV9jbGtfZ2V0X29wdGlvbmFs4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KICBjczQyeHg4LT5ncGlvZF9yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29w
dGlvbmFsKGRldiwgInJlc2V0IiwKICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZtX2Nsa19nZXRfb3B0aW9u
YWwKc291bmQvc29jL2NvZGVjcy9jczQyeHg4LmM6NDczOjg6IGVycm9yOiDigJhHUElPRF9PVVRf
SElHSOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3Ug
bWVhbiDigJhHUElPRl9JTklUX0hJR0jigJk/CiAgICAgICAgR1BJT0RfT1VUX0hJR0gpOwogICAg
ICAgIF5+fn5+fn5+fn5+fn5+CiAgICAgICAgR1BJT0ZfSU5JVF9ISUdICnNvdW5kL3NvYy9jb2Rl
Y3MvY3M0Mnh4OC5jOjQ3Mzo4OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyBy
ZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgpzb3VuZC9z
b2MvY29kZWNzL2NzNDJ4eDguYzo0Nzc6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uIOKAmGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcOKAmTsgZGlkIHlvdSBtZWFuIOKA
mGdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVw4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY3M0Mnh4OC0+Z3Bpb2RfcmVz
ZXQsIDApOwogIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogIGdwaW9fc2V0X3ZhbHVlX2NhbnNs
ZWVwCgpGaXhlczogYmZlOTVkZmE0ZGFjICgiQVNvQzogY3M0Mnh4ODogQWRkIHJlc2V0IGdwaW8g
aGFuZGxpbmciKQpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdAbnhwLmNvbT4KLS0t
CiBzb3VuZC9zb2MvY29kZWNzL2NzNDJ4eDguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mv
Y3M0Mnh4OC5jIGIvc291bmQvc29jL2NvZGVjcy9jczQyeHg4LmMKaW5kZXggM2U4ZGJmNjNhZGJl
Li4zYmJjNjIzMjJkZmUgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvY3M0Mnh4OC5jCisr
KyBiL3NvdW5kL3NvYy9jb2RlY3MvY3M0Mnh4OC5jCkBAIC0xNCw3ICsxNCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CisjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNp
bmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxzb3VuZC9wY21f
cGFyYW1zLmg+Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
