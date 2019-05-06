Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D114ECE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5284918E9;
	Mon,  6 May 2019 17:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5284918E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155149;
	bh=JzdK2cUfHnxGp2Dmtj4pCdfR0dzROs1kbKwYLLfFhDE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xwgr76e5H10S9+SqpH7dH6qzEtP/DsBNuuyQR3CH72tfUht2namPyOe625CWy1vcA
	 CiY3AJITnBBmP7UvVmT2zadVoSl0C327oO6MTPJk2RDO74ThheNq+VjkGg4VRm1ut7
	 GAiw6YGwFg+6m76mK8brULogiM5xMQCPs+jC1Mrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4063F8972E;
	Mon,  6 May 2019 17:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E500DF89724; Mon,  6 May 2019 17:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C658F89715
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C658F89715
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E666ADF2;
 Mon,  6 May 2019 15:02:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 17:02:22 +0200
Message-Id: <20190506150224.1394-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506150224.1394-1-tiwai@suse.de>
References: <20190506150224.1394-1-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/3] ASoC: da7219: Fix a compile warning at
	CONFIG_COMMON_CLK=n
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
L2NvZGVjcy9kYTcyMTkuYzoyMzY2OjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhp4oCZ
IFstV3VudXNlZC12YXJpYWJsZV0KCkZpeGVzOiBkOTBiYTZjOGI1M2UgKCJBU29DOiBkYTcyMTk6
IEV4cG9zZSBCQ0xLIGFuZCBXQ0xLIGNvbnRyb2wgdGhyb3VnaCBDQ0YiKQpTaWduZWQtb2ZmLWJ5
OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Ci0tLQogc291bmQvc29jL2NvZGVjcy9kYTcy
MTkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvY29kZWNzL2RhNzIxOS5jIGIvc291bmQvc29jL2NvZGVjcy9kYTcyMTkuYwpp
bmRleCBjZjI5NDhjMDAyNjIuLjdkOWQxZjg0ZWVkOCAxMDA2NDQKLS0tIGEvc291bmQvc29jL2Nv
ZGVjcy9kYTcyMTkuYworKysgYi9zb3VuZC9zb2MvY29kZWNzL2RhNzIxOS5jCkBAIC0yMzYzLDcg
KzIzNjMsOSBAQCBzdGF0aWMgaW50IGRhNzIxOV9wcm9iZShzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCkKIHN0YXRpYyB2b2lkIGRhNzIxOV9yZW1vdmUoc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpjb21wb25lbnQpCiB7CiAJc3RydWN0IGRhNzIxOV9wcml2ICpkYTcyMTkgPSBz
bmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOworI2lmZGVmIENPTkZJR19D
T01NT05fQ0xLCiAJaW50IGk7CisjZW5kaWYKIAogCWRhNzIxOV9hYWRfZXhpdChjb21wb25lbnQp
OwogCi0tIAoyLjE2LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
