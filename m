Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986E14E93
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3A61905;
	Mon,  6 May 2019 17:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3A61905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155077;
	bh=qPJLV5rOUuJJzSZzL0mhh9YtHvsCO6EZRKw9WDI6okA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibZOhAizi8XFVivbXs3RxfBH2+NRQ9cyArj9J6C9wUZXGgXM9i8jHarVs6yn5c8u0
	 9k7Z7GmWK0DL/0OCXNjY2GMIwRKycrrYlfY4r4CMJWx3v/5DgaLT4fgoAQXn/pxRHi
	 KRlElrlfxQ2M8shfNh/mbfE4z3mumkGOgqsf73d0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E50CCF89726;
	Mon,  6 May 2019 17:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC0B6F89724; Mon,  6 May 2019 17:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D91F896FF
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D91F896FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A5A2AEAE;
 Mon,  6 May 2019 15:02:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 17:02:23 +0200
Message-Id: <20190506150224.1394-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506150224.1394-1-tiwai@suse.de>
References: <20190506150224.1394-1-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/3] ASoC: SOF: Fix a compile warning with
	CONFIG_PCI=n
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

QSB0cml2aWFsIGZpeCBmb3IgdGhlIHJhbmRjb25maWcgYnVpbGQgZXJyb3I6CiAgc291bmQvc29j
L3NvZi9vcHMuYzoyMDo2OiB3YXJuaW5nOiDigJhyZXTigJkgaXMgdXNlZCB1bmluaXRpYWxpemVk
IGluIHRoaXMgZnVuY3Rpb24gWy1XdW5pbml0aWFsaXplZF0KCkZpeGVzOiBkMWQ5NWZjYjYzZTMg
KCJBU29DOiBTT0Y6IEFkZCBEU1AgSFcgYWJzdHJhY3Rpb24gb3BlcmF0aW9ucyIpClNpZ25lZC1v
ZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KLS0tCiBzb3VuZC9zb2Mvc29mL29w
cy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9vcHMuYyBiL3NvdW5kL3NvYy9zb2Yvb3BzLmMK
aW5kZXggODBmOTA3NzQwYjgyLi43YTI3YzNiNzE5ZTcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9z
b2Yvb3BzLmMKKysrIGIvc291bmQvc29jL3NvZi9vcHMuYwpAQCAtMTcsNyArMTcsNyBAQCBib29s
IHNuZF9zb2ZfcGNpX3VwZGF0ZV9iaXRzX3VubG9ja2VkKHN0cnVjdCBzbmRfc29mX2RldiAqc2Rl
diwgdTMyIG9mZnNldCwKIHsKIAlzdHJ1Y3QgcGNpX2RldiAqcGNpID0gdG9fcGNpX2RldihzZGV2
LT5kZXYpOwogCXVuc2lnbmVkIGludCBvbGQsIG5ldzsKLQl1MzIgcmV0OworCXUzMiByZXQgPSAw
OwogCiAJcGNpX3JlYWRfY29uZmlnX2R3b3JkKHBjaSwgb2Zmc2V0LCAmcmV0KTsKIAlvbGQgPSBy
ZXQ7Ci0tIAoyLjE2LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
