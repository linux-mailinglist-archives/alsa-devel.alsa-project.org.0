Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED457B607
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 01:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0B541795;
	Wed, 31 Jul 2019 01:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0B541795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564527856;
	bh=8RwMd7AvCwblFIcmGuzGlmcblNkjv0kPwIYxbe1YKxs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VogrAuLZXqzmF60x8JcYoBnoirfC/dl+ux4UOgVMLVcROjwLjiZWr+rtDtg9IQ30y
	 nTpUfImtnAjA4Peq9Tixssps5UfxufNNrdLBGnjBcGuOFRw5On4Ujs1g4gIWLDLbEo
	 VB4Eln1Y9YMj7CjaALV77V60xkJfbFeOKSGpH43A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3115F804CC;
	Wed, 31 Jul 2019 01:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F51EF804CA; Wed, 31 Jul 2019 01:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E099FF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 01:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E099FF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M/KBtxYZ"
Received: by mail-lf1-x141.google.com with SMTP id c9so45899411lfh.4
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T9/kCG+kgWmWyocQ8aukdYNszqXmy4B/FV1srsKD6M4=;
 b=M/KBtxYZd/o/LS6luyddmmyRKh1YviRHkFXBh42UtAD70mFwuVs9cxNvFwMQlv41Nb
 4p3l0XJlEMHCvqPlJkCLQDsNABMaHVe3sB5QYn8iK5QRyPK7OI3wVfnnsWk3GZcKf4Mc
 C4dn4WbtHT2LTe56EX03vkrH6oZ6t3hbPPxoVVNjARNgIDXcgpSEB5Sb5CGhaJN2P39K
 2B1tC9ujDP50NBBbl3vyrodHmjFR5tE+8E/S6tKJbCFzVLy8ce+XVxeYX/ZS2f7rN+na
 /ETirSjISrdNXcGtjeOWBNwrs5D5UVqhJIMJamtGQ/7auBkUnU3MSvS0keMMdbpv5Yfu
 hWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T9/kCG+kgWmWyocQ8aukdYNszqXmy4B/FV1srsKD6M4=;
 b=Xn+AuwuVyn+gjJa7rMtrRtp6w+NYI+O/+tLpbPjCYUVqnPl7jeZ2MZtXE4js/1DaVx
 6a7A7gMCte/rwAanUx+An6OBNmSeobKBQP3Z+zqJHu5WO9AZSQdQHi9nJBB4LxtC4T4B
 +OURTSRk9+be9adMRv70GEXyQR3nhr/3oEJiY5HRZaKcOj6bM37htm1SRLBoSWh3WfqS
 UWf7Sl9QyiCXwdgrsidfxVIf7bCW4ZXN+yRD3xB7h28l8LtxVDtEHVC/hCgArAuhcf8P
 ePiPo5YYLJYB/Lbi5sWVGdswWDz10Sg5D2nC9ktrVaD0GcY1EzRv+C+D2rqxQHUUuw8q
 sKtQ==
X-Gm-Message-State: APjAAAVRMFHSveXkC6Q3uneBJEK5Ui/UlTwvqV3xDmmq+ExMlA0sB+F0
 4Rs6Zp3hmnQ0oZhgdWY4xiH3vPrv2XWH2VSBJ1sVzg==
X-Google-Smtp-Source: APXvYqyUifC+ugNDNCn76iknQT/jAoMfy5FjFx/PMiUhBnzuvz04jorFGrHiYe2Ue694maiy7sSl8MZcm9C0DMRdmew=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr54299529lfh.92.1564527746494; 
 Tue, 30 Jul 2019 16:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190730104337.21235-1-andriy.shevchenko@linux.intel.com>
 <20190730104337.21235-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190730104337.21235-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jul 2019 01:02:14 +0200
Message-ID: <CACRpkdZXTRENogogOxrB6F5aXQSd5qehXFP1R3ax0um1XU93Aw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] gpiolib-acpi: Move
 acpi_dev_add_driver_gpios() et al to consumer.h
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6NDMgUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBUaGUgQVBJLCB3aGljaCBiZWxv
bmdzIHRvIEdQSU8gbGlicmFyeSwgaXMgZm9yZWlnbiB0byBBQ1BJIGhlYWRlcnMuIEVhcmxpZXIK
PiB3ZSBtb3ZlZCBvdXQgScKyQyBvdXQgb2YgdGhlIGxhdHRlciwgYW5kIG5vdyBpdCdzIHRpbWUg
Zm9yCj4gYWNwaV9kZXZfYWRkX2RyaXZlcl9ncGlvcygpIGV0IGFsLgo+Cj4gRm9yIHRpbWUgYmVp
bmcgdGhlIGFjcGlfZ3Bpb19nZXRfaXJxX3Jlc291cmNlKCkgYW5kIGFjcGlfZGV2X2dwaW9faXJx
X2dldCgpCj4gYXJlIGxlZnQgdW50b3VjaGVkIGFzIHRoZXkgbmVlZCBtb3JlIHRob3VnaHQgYWJv
dXQuCj4KPiBOb3RlLCBpdCByZXF1aXJlcyB1bmlubGluZSBhY3BpX2Rldl9yZW1vdmVfZHJpdmVy
X2dwaW9zKCkgdG8ga2VlcCBwdXJpdHkgb2YKPiBjb25zdW1lci5oLgo+Cj4gQ2M6IFBpZXJyZS1M
b3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IExpYW0gR2lyZHdvb2QgPGxpYW0uci5naXJkd29vZEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IEpp
ZSBZYW5nIDx5YW5nLmppZUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4KPiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnIChtb2RlcmF0
ZWQgbGlzdDpJTlRFTCBBU29DIERSSVZFUlMpCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hl
bmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CgpQYXRjaCBhcHBsaWVkIQoK
SnVzdCBhIGJpdCB3b3JyaWVkIHRoYXQgdGhpcyB3aWxsIGNvbGxpZGUgd2l0aCBNYXNhaGlybydz
ICNpZmRlZi1yZWR1Y3Rpb24sCmJ1dCBJIHdhbnRlZCB0byBrZWVwIHlvdXIgc2VyaWVzIHRvZ2V0
aGVyLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
