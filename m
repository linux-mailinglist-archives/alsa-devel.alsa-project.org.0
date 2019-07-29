Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0BA79C5C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 00:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6DD1807;
	Tue, 30 Jul 2019 00:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6DD1807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564438648;
	bh=Wxic94AngH/FwTRQccimLCS+x23QEFZNF/eimw6ZKFw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HwG6G8Zphb+2oSAhOZ63MRkYbqPTeYPiTKJIHYMjVknh99t7e+cCQTGvL0hoOebNE
	 BoAYP41eXQt3j/hx2TP1Pmaz3CZGfxYmX0z11yscfpdQ57cUO6XqcZFQC48bN8jJz1
	 H4NNSlNh+gPoyy68gOH6dri0PgdaSTUa5ocp95Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3667DF8048D;
	Tue, 30 Jul 2019 00:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EA3F8048D; Tue, 30 Jul 2019 00:15:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.48.104])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC92F803D5
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 00:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC92F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="y/VRyy1B"
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id EED8837AA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 17:15:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sDvchVVbRiQersDvchuafh; Mon, 29 Jul 2019 17:15:36 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHkN5Os5jg2cDOrRLTVaMd59XWLTmpmxDcRl9QO0zyU=; b=y/VRyy1BNoX63+u2yIgC1UGmJR
 dbESFrQ68d4/qYDyJ2RVo0mvZ3S0uvMbBTJUY2dAdj07CbPXhEBaM/G52+Ws4xkNDuM0In5EMr5rq
 F+NZZwRqjmMDa1QSA099NduPVmOHem3sNqM2D1F5iAi9JxQ5tdznah0BoMuiF5N9FxR+tnM+epzNk
 GDMP9ku0Ghmniegy1HzE0tBn7vgySxnqYdXNpzbPc9VEbbPK8E+rNZauARNzfsxFaOJPLxfUB642D
 bHEEfVNl84cUlIeU1UamnBWVkiIGjueikfzdiplcuu1Ie5tJ8NklAuaYRylptJ9+Ttgzo44k500to
 LX18KoSw==;
Received: from [187.192.11.120] (port=60834 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hsDvb-001z1T-Eq; Mon, 29 Jul 2019 17:15:35 -0500
Date: Mon, 29 Jul 2019 17:15:34 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Message-ID: <20190729221534.GA18696@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsDvb-001z1T-Eq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:60834
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ASoC: ti: Mark expected switch fall-throughs
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

TWFyayBzd2l0Y2ggY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2gu
CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyAoQnVpbGRpbmc6IGFybSk6
Cgpzb3VuZC9zb2MvdGkvbjgxMC5jOiBJbiBmdW5jdGlvbiDigJhuODEwX2V4dF9jb250cm9s4oCZ
Ogpzb3VuZC9zb2MvdGkvbjgxMC5jOjQ4OjEwOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkg
ZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgbGluZTFsID0gMTsKICAg
fn5+fn5+fl5+fgpzb3VuZC9zb2MvdGkvbjgxMC5jOjQ5OjI6IG5vdGU6IGhlcmUKICBjYXNlIE44
MTBfSkFDS19IUDoKICBefn5+Cgpzb3VuZC9zb2MvdGkvcng1MS5jOiBJbiBmdW5jdGlvbiDigJhy
eDUxX2V4dF9jb250cm9s4oCZOgpzb3VuZC9zb2MvdGkvcng1MS5jOjU3OjY6IHdhcm5pbmc6IHRo
aXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQog
ICBocyA9IDE7CiAgIH5+fl5+fgpzb3VuZC9zb2MvdGkvcng1MS5jOjU4OjI6IG5vdGU6IGhlcmUK
ICBjYXNlIFJYNTFfSkFDS19IUDoKICBefn5+CgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIu
IFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIHNvdW5kL3NvYy90aS9uODEwLmMg
fCAxICsKIHNvdW5kL3NvYy90aS9yeDUxLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL244MTAuYyBiL3NvdW5kL3NvYy90
aS9uODEwLmMKaW5kZXggMmMzZjJhNGMxNzAwLi4zYWQyYjZkYWYzMWUgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy90aS9uODEwLmMKKysrIGIvc291bmQvc29jL3RpL244MTAuYwpAQCAtNDYsNiArNDYs
NyBAQCBzdGF0aWMgdm9pZCBuODEwX2V4dF9jb250cm9sKHN0cnVjdCBzbmRfc29jX2RhcG1fY29u
dGV4dCAqZGFwbSkKIAlzd2l0Y2ggKG44MTBfamFja19mdW5jKSB7CiAJY2FzZSBOODEwX0pBQ0tf
SFM6CiAJCWxpbmUxbCA9IDE7CisJCS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgTjgxMF9KQUNL
X0hQOgogCQlocCA9IDE7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL3J4NTEu
YyBiL3NvdW5kL3NvYy90aS9yeDUxLmMKaW5kZXggYmM2MDQ2NTM0ZmE1Li5jY2QwZThhMDdkZDEg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy90aS9yeDUxLmMKKysrIGIvc291bmQvc29jL3RpL3J4NTEu
YwpAQCAtNTUsNiArNTUsNyBAQCBzdGF0aWMgdm9pZCByeDUxX2V4dF9jb250cm9sKHN0cnVjdCBz
bmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSkKIAkJYnJlYWs7CiAJY2FzZSBSWDUxX0pBQ0tfSFM6
CiAJCWhzID0gMTsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSBSWDUxX0pBQ0tfSFA6CiAJ
CWhwID0gMTsKIAkJYnJlYWs7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
