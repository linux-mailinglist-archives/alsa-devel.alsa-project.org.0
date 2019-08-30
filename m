Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF138A5A72
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 17:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A1B16E6;
	Mon,  2 Sep 2019 17:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A1B16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567437766;
	bh=cBIJjpwOmF2yA/sF/qqKLAEaowTKTtBqtOQe7EkzXTM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nDBIeYb1dG06v2EsaPwM6nYJXwErq7njzvCJMw0Tvq30tQK1r0F+O+BtdQober9FH
	 J2lB26g7vhwmpIA4tNyYtiw+hMnNwmjK4b0llTDA6tCVUCWnKyXl4O7HYqa68PFDS3
	 ClBq/TItUtZo/6D2ELPfW3+j5xFr7NY1xtXWaiA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D13BF805F5;
	Mon,  2 Sep 2019 17:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D86F80369; Fri, 30 Aug 2019 20:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32397F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 20:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32397F800AA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 51E92AC84;
 Fri, 30 Aug 2019 18:52:19 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 30 Aug 2019 20:52:12 +0200
Message-Id: <20190830185212.25144-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 17:20:12 +0200
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Michal Suchanek <msuchanek@suse.de>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] soundwire: slave: Fix unused function warning
	on !ACPI
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

Rml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uICFBQ1BJIHN5c3RlbXM6Cgpkcml2ZXJzL3Nv
dW5kd2lyZS9zbGF2ZS5jOjE2OjEyOiB3YXJuaW5nOiDigJhzZHdfc2xhdmVfYWRk4oCZIGRlZmlu
ZWQgYnV0Cm5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KIHN0YXRpYyBpbnQgc2R3X3NsYXZl
X2FkZChzdHJ1Y3Qgc2R3X2J1cyAqYnVzLAogICAgICAgICAgICBefn5+fn5+fn5+fn5+CgpTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWwgU3VjaGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPgotLS0KIGRyaXZl
cnMvc291bmR3aXJlL3NsYXZlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9zbGF2ZS5j
IGIvZHJpdmVycy9zb3VuZHdpcmUvc2xhdmUuYwppbmRleCBmMzlhNTgxNWUyNWQuLjM0YzdlNjU4
MzFkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvc2xhdmUuYworKysgYi9kcml2ZXJz
L3NvdW5kd2lyZS9zbGF2ZS5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NvdW5k
d2lyZS9zZHdfdHlwZS5oPgogI2luY2x1ZGUgImJ1cy5oIgogCisjaWYgSVNfRU5BQkxFRChDT05G
SUdfQUNQSSkKIHN0YXRpYyB2b2lkIHNkd19zbGF2ZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRl
dikKIHsKIAlzdHJ1Y3Qgc2R3X3NsYXZlICpzbGF2ZSA9IGRldl90b19zZHdfZGV2KGRldik7CkBA
IC02MCw3ICs2MSw2IEBAIHN0YXRpYyBpbnQgc2R3X3NsYXZlX2FkZChzdHJ1Y3Qgc2R3X2J1cyAq
YnVzLAogCXJldHVybiByZXQ7CiB9CiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19BQ1BJKQogLyoK
ICAqIHNkd19hY3BpX2ZpbmRfc2xhdmVzKCkgLSBGaW5kIFNsYXZlIGRldmljZXMgaW4gTWFzdGVy
IEFDUEkgbm9kZQogICogQGJ1czogU0RXIGJ1cyBpbnN0YW5jZQotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
