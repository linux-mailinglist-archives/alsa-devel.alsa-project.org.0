Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FB035E5A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF321682;
	Wed,  5 Jun 2019 15:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF321682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742685;
	bh=SyyCX4tcDegM4jKJ+mQei+LHeILKp44VwPghoaRC+rU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K94x4qbs3vZYwRvEL4H5Fu0ZzxPNp3TEbWybGBRXH1IacvGmjJ6uuEDDqRisb7xyT
	 Zbhkd+Dh7yZ7rL/XZvE+C83mnC1cia509edn8uZvF+MDline74jbG/NUIpueB/OpwM
	 E+SsRaz5rGejwVzjsH0SAFVSeSlMfQGFaCubxn68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2112F89767;
	Wed,  5 Jun 2019 15:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A26F89764; Wed,  5 Jun 2019 15:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78428F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78428F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:47 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:45 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:53 +0200
Message-Id: <20190605134556.10322-12-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/14] ASoC: core: Tell codec that jack is
	being removed
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

V2hlbiBjb21wb25lbnQgaXMgYmVpbmcgcmVtb3ZlZCB3ZSBzaG91bGQgZGlzYWJsZSBqYWNrLCBv
dGhlcndpc2Ugc29tZQpjb2RlY3Mgd2lsbCB0cnkgdG8gdHJpZ2dlciBpbnRlcnJ1cHQgdXNpbmcg
ZnJlZWQgc3RydWN0dXJlcy4KClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxh
bWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2Mvc29jLWNv
cmUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3NvYy1jb3JlLmMgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwppbmRleCA3YWJiMDE3
YTgzZjMuLmFjZTVmYjAxZDlhMCAxMDA2NDQKLS0tIGEvc291bmQvc29jL3NvYy1jb3JlLmMKKysr
IGIvc291bmQvc29jL3NvYy1jb3JlLmMKQEAgLTk1MSw2ICs5NTEsNyBAQCBzdGF0aWMgaW50IHNv
Y19iaW5kX2RhaV9saW5rKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQsCiAKIHN0YXRpYyB2b2lk
IHNvY19jbGVhbnVwX2NvbXBvbmVudChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dCkKIHsKKwlzbmRfc29jX2NvbXBvbmVudF9zZXRfamFjayhjb21wb25lbnQsIE5VTEwsIE5VTEwp
OwogCWxpc3RfZGVsKCZjb21wb25lbnQtPmNhcmRfbGlzdCk7CiAJc25kX3NvY19kYXBtX2ZyZWUo
c25kX3NvY19jb21wb25lbnRfZ2V0X2RhcG0oY29tcG9uZW50KSk7CiAJc29jX2NsZWFudXBfY29t
cG9uZW50X2RlYnVnZnMoY29tcG9uZW50KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
