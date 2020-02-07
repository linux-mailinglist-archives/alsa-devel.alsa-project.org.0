Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A6155EEA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 20:52:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A3D16BD;
	Fri,  7 Feb 2020 20:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A3D16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581105121;
	bh=rcwUjbRcvTSpyeZYtYJPrrsL2WGLnLkOzzCje2RPynk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pmIkY+qGeWDIyKQNjxb9bsxeXKgD/QBQAWNWinYXEx8sblHlxdG9cv6lxvaCVCIVC
	 E39sDQv9RMnkIWnTqpYhsyRcA98nKpbZQA6TBmEvupbOhk7GunWtnbEKoMZViG554O
	 r//dbyb2XufZGubu5+1uLyxORom8wHc9REI/c3UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 022D4F8014C;
	Fri,  7 Feb 2020 20:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DBC2F8014C; Fri,  7 Feb 2020 20:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73487F8012F
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 20:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73487F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n3ej5cmD"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017Jo4UJ100329;
 Fri, 7 Feb 2020 13:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581105004;
 bh=MsMfXIk8QfS6+D9zPfzNzS76menjn5D568VCWB65xFs=;
 h=From:To:CC:Subject:Date;
 b=n3ej5cmDnV4gXAXVnJbF1wDDQ79MRGmttgezAigJKQFf2SIiPeTmtMqe6Z9ltx9GF
 7GYeZb/OyFdDHH+aTMMpgtVMRIq1TH1Epp0j6EQoWI+yhExfVNcUmb8RZJi8PsTZWR
 zC/8aOvA5sIXBfWhqNW/y9rf9QIH7giKf6Bqa8dY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017Jo4iL031897;
 Fri, 7 Feb 2020 13:50:04 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 13:50:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 13:50:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017Jo4io116946;
 Fri, 7 Feb 2020 13:50:04 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Date: Fri, 7 Feb 2020 13:45:32 -0600
Message-ID: <20200207194533.29967-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Add TLV320ADCx140 dt
	bindings
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

QWRkIGR0IGJpbmRpbmdzIGZvciB0aGUgVExWMzIwQURDeDE0MCBCdXJyLUJyb3duIEFEQy4KVGhl
IGluaXRpYWwgc3VwcG9ydCBpcyBmb3IgdGhlIGZvbGxvd2luZzoKClRMVjMyMEFEQzMxNDAgLSBo
dHRwOi8vd3d3LnRpLmNvbS9saXQvZ3BuL3RsdjMyMGFkYzMxNDAKVExWMzIwQURDNTE0MCAtIGh0
dHA6Ly93d3cudGkuY29tL2xpdC9ncG4vdGx2MzIwYWRjNTE0MApUTFYzMjBBREM2MTQwIC0gaHR0
cDovL3d3dy50aS5jb20vbGl0L2dwbi90bHYzMjBhZGM2MTQwCgpDQzogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+
Ci0tLQogLi4uL2JpbmRpbmdzL3NvdW5kL3RsdjMyMGFkY3gxNDAueWFtbCAgICAgICAgIHwgNzMg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
dGx2MzIwYWRjeDE0MC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL3RsdjMyMGFkY3gxNDAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC90bHYzMjBhZGN4MTQwLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44NGM0MDdmYWUyMWUKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvdGx2MzIwYWRjeDE0MC55YW1s
CkBAIC0wLDAgKzEsNzMgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBP
UiBCU0QtMi1DbGF1c2UpCisjIENvcHlyaWdodCAoQykgMjAxOSBUZXhhcyBJbnN0cnVtZW50cyBJ
bmNvcnBvcmF0ZWQKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL3NvdW5kL3RsdjMyMGFkY3gxNDAueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogVGV4YXMgSW5zdHJ1bWVu
dHMgVExWMzIwQURDWDE0MCBRdWFkIENoYW5uZWwgQW5hbG9nLXRvLURpZ2l0YWwgQ29udmVydGVy
CisKK21haW50YWluZXJzOgorICAtIERhbiBNdXJwaHkgPGRtdXJwaHlAdGkuY29tPgorCitkZXNj
cmlwdGlvbjogfAorICBUaGUgVExWMzIwQURDWDE0MCBhcmUgbXVsdGljaGFubmVsICg0LWNoIGFu
YWxvZyByZWNvcmRpbmcgb3IgOC1jaCBkaWdpdGFsCisgIFBETSBtaWNyb3Bob25lcyByZWNvcmRp
bmcpLCBoaWdoLXBlcmZvcm1hbmNlIGF1ZGlvLCBhbmFsb2ctdG8tZGlnaXRhbAorICBjb252ZXJ0
ZXIgKEFEQykgd2l0aCBhbmFsb2cgaW5wdXRzIHN1cHBvcnRpbmcgdXAgdG8gMlYgUk1TLiBUaGUg
VExWMzIwQURDWDE0MAorICBmYW1pbHkgc3VwcG9ydHMgbGluZSBhbmQgIG1pY3JvcGhvbmUgSW5w
dXRzLCBhbmQgb2ZmZXJzIGEgcHJvZ3JhbW1hYmxlCisgIG1pY3JvcGhvbmUgYmlhcyBvciBzdXBw
bHkgdm9sdGFnZSBnZW5lcmF0aW9uLgorCisgIFNwZWNpZmljYXRpb25zIGNhbiBiZSBmb3VuZCBh
dDoKKyAgICBodHRwOi8vd3d3LnRpLmNvbS9saXQvZHMvc3ltbGluay90bHYzMjBhZGMzMTQwLnBk
ZgorICAgIGh0dHA6Ly93d3cudGkuY29tL2xpdC9kcy9zeW1saW5rL3RsdjMyMGFkYzUxNDAucGRm
CisgICAgaHR0cDovL3d3dy50aS5jb20vbGl0L2RzL3N5bWxpbmsvdGx2MzIwYWRjNjE0MC5wZGYK
KworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gY29uc3Q6
IHRpLHRsdjMyMGFkYzMxNDAKKyAgICAgIC0gY29uc3Q6IHRpLHRsdjMyMGFkYzUxNDAKKyAgICAg
IC0gY29uc3Q6IHRpLHRsdjMyMGFkYzYxNDAKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKyAg
ICBkZXNjcmlwdGlvbjogfAorICAgICAgIEkyQyBhZGRyZXNzcyBvZiB0aGUgZGV2aWNlIGNhbiBi
ZSBvbmUgb2YgdGhlc2UgMHg0YywgMHg0ZCwgMHg0ZSBvciAweDRmCisKKyAgcmVzZXQtZ3Bpb3M6
CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICBHUElPIHVzZWQgZm9yIGhhcmR3YXJlIHJlc2V0
LgorCisgIHRpLHVzZS1pbnRlcm5hbC1hcmVnOgorICAgIHR5cGU6IGJvb2xlYW4KKyAgICBkZXNj
cmlwdGlvbjogfAorICAgICAgIEludGVybmFsIFJlZ3VsYXRvciB3aXRoIEFWREQgYXQgMy4zVi4K
KworICB0aSxtaWMtYmlhcy1zb3VyY2U6CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICBJbmRp
Y2F0ZXMgdGhlIHNvdXJjZSBmb3IgTUlDIEJpYXMuCisgICAgICAgMCAtIE1pYyBiaWFzIGlzIHNl
dCB0byBWUkVGCisgICAgICAgMSAtIE1pYyBiaWFzIGlzIHNldCB0byBWUkVGIMOXIDEuMDk2Cisg
ICAgICAgNiAtIE1pYyBiaWFzIGlzIHNldCB0byBBVkRECisgICAgYWxsT2Y6CisgICAgICAtICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgICAgLSBlbnVt
OiBbMCwgMSwgNl0KKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworCitleGFt
cGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgorICAg
IGkyYzAgeworICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsKKyAgICAgIGNvZGVjOiBjb2RlY0A0YyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAidGks
dGx2MzIwYWRjNTE0MCI7CisgICAgICAgIHJlZyA9IDwweDRjPjsKKyAgICAgICAgdGksdXNlLWlu
dGVybmFsLWFyZWc7CisgICAgICAgIHRpLG1pYy1iaWFzLXNvdXJjZSA9IDw2PjsKKyAgICAgICAg
cmVzZXQtZ3Bpb3MgPSA8JmdwaW8wIDE0IEdQSU9fQUNUSVZFX0hJR0g+OworICAgICAgfTsKKyAg
ICB9OwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
