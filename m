Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4FDD130A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 17:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE91E1676;
	Wed,  9 Oct 2019 17:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE91E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570635535;
	bh=wfXdV0OlCUA/3x7n0cs0It5ocdNxxiG9WtX4601U4DM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtlhIaOWd4v9AX/H1DX+IqRq1CK+Nb/Qt8MWyHM+jCSyad8O4sosxpMY3/aKb6Qcd
	 22szgYwmoVkcfsujUU9gr93aTzg0FJvSgc/fOoICXhLvcVmHcRpOauiU72r7DZwLpc
	 PZgieRS+/GORxL5QRQhrW5foESVpqErFCVt1qP3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7855F80323;
	Wed,  9 Oct 2019 17:36:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C832F802DF; Wed,  9 Oct 2019 17:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCB75F802BD
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 17:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB75F802BD
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C8BB92001E1;
 Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB4D12001D5;
 Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 289AC2060B;
 Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Date: Wed,  9 Oct 2019 18:36:14 +0300
Message-Id: <20191009153615.32105-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009153615.32105-1-daniel.baluta@nxp.com>
References: <20191009153615.32105-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 linux-imx@nxp.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: simple_card_utils.h: Add missing
	include
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

V2hlbiBkZWJ1ZyBpcyBlbmFibGVkIGNvbXBpbGVyIGNhbm5vdCBmaW5kIHRoZSBkZWZpbml0aW9u
IG9mCmNsa19nZXRfcmF0ZSByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBlcnJvcjoKCi4vaW5j
bHVkZS9zb3VuZC9zaW1wbGVfY2FyZF91dGlscy5oOjE2ODo0MDogbm90ZTogcHJldmlvdXMgaW1w
bGljaXQKZGVjbGFyYXRpb24gb2Yg4oCYY2xrX2dldF9yYXRl4oCZIHdhcyBoZXJlCiAgIGRldl9k
YmcoZGV2LCAiJXMgY2xrICVsdUh6XG4iLCBuYW1lLCBjbGtfZ2V0X3JhdGUoZGFpLT5jbGspKTsK
Li9pbmNsdWRlL3NvdW5kL3NpbXBsZV9jYXJkX3V0aWxzLmg6MTY4OjM6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybwrigJhkZXZfZGJn4oCZCiAgIGRldl9kYmcoZGV2LCAiJXMgY2xrICVsdUh6
XG4iLCBuYW1lLCBjbGtfZ2V0X3JhdGUoZGFpLT5jbGspKTsKCkZpeCB0aGlzIGJ5IGluY2x1ZGlu
ZyB0aGUgYXBwcm9wcmlhdGUgaGVhZGVyLgoKRml4ZXM6IDA1ODBkZGU1OTQzODY4NmQgKCJBU29D
OiBzaW1wbGUtY2FyZC11dGlsczogYWRkIGFzb2Nfc2ltcGxlX2RlYnVnX2luZm8oKSIpClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KLS0tCiBpbmNs
dWRlL3NvdW5kL3NpbXBsZV9jYXJkX3V0aWxzLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvc2ltcGxlX2NhcmRfdXRpbHMu
aCBiL2luY2x1ZGUvc291bmQvc2ltcGxlX2NhcmRfdXRpbHMuaAppbmRleCA5ODVhNWY1ODNkZTQu
LjI5M2ZmODExNTk2MCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zb3VuZC9zaW1wbGVfY2FyZF91dGls
cy5oCisrKyBiL2luY2x1ZGUvc291bmQvc2ltcGxlX2NhcmRfdXRpbHMuaApAQCAtOCw2ICs4LDcg
QEAKICNpZm5kZWYgX19TSU1QTEVfQ0FSRF9VVElMU19ICiAjZGVmaW5lIF9fU0lNUExFX0NBUkRf
VVRJTFNfSAogCisjaW5jbHVkZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8c291bmQvc29jLmg+
CiAKICNkZWZpbmUgYXNvY19zaW1wbGVfaW5pdF9ocChjYXJkLCBzamFjaywgcHJlZml4KSBcCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
