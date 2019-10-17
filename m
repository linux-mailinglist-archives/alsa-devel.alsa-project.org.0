Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DFDB0B4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02395167F;
	Thu, 17 Oct 2019 17:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02395167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571324785;
	bh=e758dTVjaVZDesDFi1hK/n/FV37WX6sDOjtyBAA+LO8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iMQjcn3q4d0FJVTf7iyvI4CFwCLjI0liR844Kj+Snf2ZFsbM8cIW0g33t1OH9FX1G
	 b/Gr3/lpKEp5d7x7mPb1E/tAGKQnrb2wg3PbndR/eRIasjb932CezYDxLbOjCZf3D+
	 sfGq0oGGPVoHXPYwhA8sHHjpxsNeB4az2zB9YIuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018D1F804AA;
	Thu, 17 Oct 2019 17:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77185F804AA; Thu, 17 Oct 2019 17:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B10EF80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B10EF80276
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id DF5AB100F00C1;
 Thu, 17 Oct 2019 17:04:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 88270458E52; Thu, 17 Oct 2019 17:04:33 +0200 (CEST)
Message-Id: <3086bc75135c1e3567c5bc4f3cc4ff5cbf7a56c2.1571324194.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 17 Oct 2019 17:04:11 +0200
MIME-Version: 1.0
To: Takashi Iwai <tiwai@suse.com>
Cc: Rivera Valdez <riveravaldez@ysinembargo.com>, alsa-devel@alsa-project.org,
 Przemyslaw Kopa <prymoo@gmail.com>, Daniel Drake <dan@reactivated.net>,
 nouveau@lists.freedesktop.org
Subject: [alsa-devel] [PATCH] ALSA: hda - Force runtime PM on Nvidia HDMI
	codecs
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

UHJ6ZW15c8WCYXcgS29wYSByZXBvcnRzIHRoYXQgc2luY2UgY29tbWl0IGI1MTZlYTU4NmQ3MSAo
IlBDSTogRW5hYmxlCk5WSURJQSBIREEgY29udHJvbGxlcnMiKSwgdGhlIGRpc2NyZXRlIEdQVSBO
dmlkaWEgR2VGb3JjZSBHVCA1NDBNIG9uIGhpcwoyMDExIFNhbXN1bmcgbGFwdG9wIHJlZnVzZXMg
dG8gcnVudGltZSBzdXNwZW5kLCByZXN1bHRpbmcgaW4gYSBwb3dlcgpyZWdyZXNzaW9uIGFuZCBl
eGNlc3NpdmUgaGVhdC4KClJpdmVyYSBWYWxkZXogd2l0bmVzc2VzIHRoZSBzYW1lIGlzc3VlIHdp
dGggYSBHZUZvcmNlIEdUIDUyNU0gKEdGMTA4TSkKb2YgdGhlIHNhbWUgZXJhLCBhcyBkb2VzIGFu
b3RoZXIgQXJjaCBMaW51eCB1c2VyIG5hbWVkICJSMEFSIiB3aXRoIGEKbW9yZSByZWNlbnQgR2VG
b3JjZSBHVFggMTA1MCBUaSAoR1AxMDdNKS4KClRoZSBjb21taXQgZXhwb3NlcyB0aGUgZGlzY3Jl
dGUgR1BVJ3MgSERBIGNvbnRyb2xsZXIgYW5kIGFsbCBmb3VyIGNvZGVjcwpvbiB0aGUgY29udHJv
bGxlciBkbyBub3Qgc2V0IHRoZSBDTEtTVE9QIGFuZCBFUFNTIGJpdHMgaW4gdGhlIFN1cHBvcnRl
ZApQb3dlciBTdGF0ZXMgUmVzcG9uc2UuICBUaGV5IGFsc28gZG8gbm90IHNldCB0aGUgUFMtQ2xr
U3RvcE9rIGJpdCBpbiB0aGUKR2V0IFBvd2VyIFN0YXRlIFJlc3BvbnNlLiAgaGRhX2NvZGVjX3J1
bnRpbWVfc3VzcGVuZCgpIHRoZXJlZm9yZSBkb2VzCm5vdCBjYWxsIHNuZF9oZGFjX2NvZGVjX2xp
bmtfZG93bigpLCB3aGljaCBwcmV2ZW50cyBlYWNoIGNvZGVjIGFuZCB0aGUKUENJIGRldmljZSBm
cm9tIHJ1bnRpbWUgc3VzcGVuZGluZy4KClRoZSBzYW1lIGlzc3VlIGlzIHByZXNlbnQgb24gc29t
ZSBBTUQgZGlzY3JldGUgR1BVcyBhbmQgd2UgYWRkcmVzc2VkIGl0CmJ5IGZvcmNpbmcgcnVudGlt
ZSBQTSBkZXNwaXRlIHRoZSBiaXRzIG5vdCBiZWluZyBzZXQsIHNlZSBjb21taXQKNTdjYjU0ZTUz
YmRkICgiQUxTQTogaGRhIC0gRm9yY2UgdG8gbGluayBkb3duIGF0IHJ1bnRpbWUgc3VzcGVuZCBv
bgpBVEkvQU1EIEhETUkiKS4KCkRvIHRoZSBzYW1lIGZvciBOdmlkaWEgSERNSSBjb2RlY3MuCgpG
aXhlczogYjUxNmVhNTg2ZDcxICgiUENJOiBFbmFibGUgTlZJRElBIEhEQSBjb250cm9sbGVycyIp
Ckxpbms6IGh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld3RvcGljLnBocD9waWQ9MTg2NTUx
MgpMaW5rOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD03NTk4
NSNjODEKUmVwb3J0ZWQtYnk6IFByemVteXPFgmF3IEtvcGEgPHByeW1vb0BnbWFpbC5jb20+ClJl
cG9ydGVkLWJ5OiBSaXZlcmEgVmFsZGV6IDxyaXZlcmF2YWxkZXpAeXNpbmVtYmFyZ28uY29tPgpT
aWduZWQtb2ZmLWJ5OiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KQ2M6IERhbmllbCBE
cmFrZSA8ZGFuQHJlYWN0aXZhdGVkLm5ldD4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2
NS4zKwotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfaGRt
aS5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKaW5kZXggYmNhNWRlNy4uNzk1Y2JkYSAx
MDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKKysrIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9oZG1pLmMKQEAgLTM0NzQsNiArMzQ3NCw4IEBAIHN0YXRpYyBpbnQgcGF0Y2hfbnZo
ZG1pKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQludmhkbWlfY2htYXBfY2VhX2FsbG9jX3Zh
bGlkYXRlX2dldF90eXBlOwogCXNwZWMtPmNobWFwLm9wcy5jaG1hcF92YWxpZGF0ZSA9IG52aGRt
aV9jaG1hcF92YWxpZGF0ZTsKIAorCWNvZGVjLT5saW5rX2Rvd25fYXRfc3VzcGVuZCA9IDE7CisK
IAlnZW5lcmljX2Fjb21wX2luaXQoY29kZWMsICZudmhkbWlfYXVkaW9fb3BzLCBudmhkbWlfcG9y
dDJwaW4pOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
