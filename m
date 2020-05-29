Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BF1EBCBB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3CFF1663;
	Tue,  2 Jun 2020 15:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3CFF1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103548;
	bh=DpnRkS8K525X/BvInW9nOks0IarH1HPBen5MY9Nm82o=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gxnjR4pZ0ow7X2fcFKLYqt4OMx7XlDr2vlURIoAoJsT9qGB6u7srJHtxnJn6foPTU
	 /MrcSTlQU5Rgizj+lqwsJHrl6XgV7LtDiWoJR3g4b1SDCVrOtdtNXQiwFPWHwJhR59
	 Zv+uEcqhO5EXTjldbN9h9lNILsBEfehA3ZDk+Pzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55A3F80272;
	Tue,  2 Jun 2020 15:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA652F80149; Fri, 29 May 2020 12:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m127107.qiye.163.com (mail-m127107.qiye.163.com
 [115.236.127.107])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B19F80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 12:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B19F80107
Received: from vivo.com (wm-12.qy.internal [127.0.0.1])
 by mail-m127107.qiye.163.com (Hmail) with ESMTP id 306C28109C;
 Fri, 29 May 2020 18:12:44 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ALMAWwB5CP9aAcKXCU5FzqqF.1.1590747164172.Hmail.zhucancan@vivo.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?U3ViamVjdDogW1BBVENIIHYyXSBBU29DOiBzb2MtcGNtOiBmaXggQkUgZGFpIG5vdCBod19mcmVlIGFuZCBzaHV0ZG93biBkdXJpbmcgbWl4ZXIgdXBkYXRl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.226
MIME-Version: 1.0
Received: from zhucancan@vivo.com( [58.251.74.226) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 29 May 2020 18:12:44 +0800 (GMT+08:00)
From: =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>
Date: Fri, 29 May 2020 18:12:44 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VLTkNLS0tLQ0xMSENLT1lXWShZQU
 hPN1dZLVlBSVdZDwkaFQgSH1lBWRJOKzI4HDkjTigQGE81OR40LTIhOjpWVlVJSkMoSVlXWQkOFx
 4IWUFZNTQpNjo3JCkuNz5ZV1kWGg8SFR0UWUFZNDBZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo3NjosDDlOOCtCGjoYMCM4Lk49
 AQoKPVVKVUpOQktMT0xKTU9JTkhVMxYaEhdVARMOGBoVGBoVOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJTVlXWQgBWUFITkhNNwY+
X-HM-Tid: 0a725feb6e2d986bkuuu306c28109c
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:44 +0200
Cc: kernel <kernel@vivo.com>, =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
 trivial@kernel.org, zhucancan <zhucancan@vivo.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RkUgc3RhdGUgaXMgU05EX1NPQ19EUENNX1NUQVRFX1BSRVBBUkUgbm93LCBCRTEgaXMKdXNlZCBi
eSBGRS4KCkxhdGVyIHdoZW4gbmV3IEJFMiBpcyBhZGRlZCB0byBGRSBieSBtaXhlciB1cGRhdGUs
Cml0IHdpbGwgY2FsbCBkcGNtX3J1bl91cGRhdGVfc3RhcnR1cCgpIHRvIHVwZGF0ZQpCRTIncyBz
dGF0ZSwgYnV0IHVuZm9ydHVuYXRlbHkgQkUyIC5wcmVwYXJlKCkgbWVldHMKZXJyb3IsIGl0IHdp
bGwgZGlzY29ubmVjdCBhbGwgbm9uIHN0YXJ0ZWQgQkUuCgpUaGlzIG1ha2UgQkUxIGRhaSBza2lw
IC5od19mcmVlKCkgYW5kIC5zaHV0ZG93bigpLAphbmQgdGhlIEJFMSB1c2VycyB3aWxsIG5ldmVy
IGRlY3JlYXNlIHRvIHplcm8uCgpTaWduZWQtb2ZmLWJ5OiB6aHVjYW5jYW4gPHpodWNhbmNhbkB2
aXZvLmNvbT4KLS0tCnJlLWZvcm1hdCBwYXRjaCBjb250ZW50IHYyCi0tLQogc291bmQvc29jL3Nv
Yy1wY20uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtcGNtLmMgYi9zb3VuZC9zb2Mv
c29jLXBjbS5jCmluZGV4IDFmMzAyZGU0NDA1Mi4uZGYzNDQyMmJkMGRkIDEwMDY0NAotLS0gYS9z
b3VuZC9zb2Mvc29jLXBjbS5jCisrKyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKQEAgLTI3MzAsMTIg
KzI3MzAsMTIgQEAgc3RhdGljIGludCBkcGNtX3J1bl91cGRhdGVfc3RhcnR1cChzdHJ1Y3Qgc25k
X3NvY19wY21fcnVudGltZSAqZmUsIGludCBzdHJlYW0pCiBjbG9zZToKIAlkcGNtX2JlX2RhaV9z
aHV0ZG93bihmZSwgc3RyZWFtKTsKIGRpc2Nvbm5lY3Q6Ci0JLyogZGlzY29ubmVjdCBhbnkgbm9u
IHN0YXJ0ZWQgQkVzICovCisJLyogZGlzY29ubmVjdCBhbnkgY2xvc2VkIEJFcyAqLwogCXNwaW5f
bG9ja19pcnFzYXZlKCZmZS0+Y2FyZC0+ZHBjbV9sb2NrLCBmbGFncyk7CiAJZm9yX2VhY2hfZHBj
bV9iZShmZSwgc3RyZWFtLCBkcGNtKSB7CiAJCXN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpi
ZSA9IGRwY20tPmJlOwotCQlpZiAoYmUtPmRwY21bc3RyZWFtXS5zdGF0ZSAhPSBTTkRfU09DX0RQ
Q01fU1RBVEVfU1RBUlQpCi0JCQkJZHBjbS0+c3RhdGUgPSBTTkRfU09DX0RQQ01fTElOS19TVEFU
RV9GUkVFOworCQlpZiAoYmUtPmRwY21bc3RyZWFtXS5zdGF0ZSA9PSBTTkRfU09DX0RQQ01fU1RB
VEVfQ0xPU0UpCisJCQlkcGNtLT5zdGF0ZSA9IFNORF9TT0NfRFBDTV9MSU5LX1NUQVRFX0ZSRUU7
CiAJfQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmZlLT5jYXJkLT5kcGNtX2xvY2ssIGZsYWdz
KTsKIAotLSAKMi4yMS4wCgoKCg0KDQo=
