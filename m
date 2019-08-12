Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE489895
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 10:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62F41667;
	Mon, 12 Aug 2019 10:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62F41667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565597913;
	bh=iJkYB/hvmJOmNMwUxpt8ywRJY0ZT24neY2tHZmCgTZg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9LGVWBwPi/oM8emyQeOrJB2umzHzZmunw3fMnnsHxHnVnpvtaAd8B0IHyO/6239P
	 JWLCZPpPePtQR9qCvIqETLfGY751ttPkFUrG056MrQ8ny0bcbPm85LV4Cw54yxcZbo
	 dp+kWfkIWlxmKiibQlBtR6mNG7RDapi9bGgo66PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15033F801EB;
	Mon, 12 Aug 2019 10:16:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 913D2F80213; Mon, 12 Aug 2019 10:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5DBFF8015A
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 10:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5DBFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="u4QlkRbM"
Received: by mail-wr1-x443.google.com with SMTP id p17so103759137wrf.11
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=u4QlkRbMDiHfGrjdu436aHZusopdsD94AaT6zXTM3eaZ4y6BosUM0tlaA56X51nN9c
 umI3PH27REA1YdEm/bDm3OE2UI9MGULdMLuGUTvnDBKUBlM+u5BgwEJXKd1SByIuWkrY
 2kv99VeKU+V5QXG9oieP77x7yQgoExIDYXx4vPH8vlEru6HzZ6/p32cpzzObsHy5W3az
 O2VbXSjzdwyFpNJYin4w9mGvGx4NIQqGMocgiLaaq7HHG8qkJjXvIxiD9mAgo53+VJlh
 LCcGJbAa2s5qZg9/JZfFsSRo/t/+spxSIJYxDJW7Gfq3OorZb4uOTIjODwyWsHDkDNXd
 LmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=HqSc0J5XLXth/z+QTvWtFpG2O76wd1Jq9MstwMASCgOLp4Z+DbQRKNUUEdcyRA5akW
 A0oHV53ngIjXPPyYSJhbLrFd8+Zf4W/LmXxq2O2as4fNHxhK0F9Df+l+khQOu8psb1N3
 mDr9djzzxtCjOPq16wQ3CxI3gbWz/B+2x5F5xhjBhbdK9uBH55UQCDJD04NVf56NFFRv
 c5HB/rewqC/A46oLuRYsJqk0sdGvT0UyXPN8Z+rC5SlAHdCYzA2yfhVtVQGqAFiTDwzG
 8US7IexYGWeS5pWREfU9ql86aDt9n+Azmjcl/BjnlO32gH+gY1E5/QrzlwOrQNAJkfqj
 YZmg==
X-Gm-Message-State: APjAAAVC6LmN5V2+VGbpPvlQL0fe3vAem1cnyUWM7OO6EQhm5JGA5EZg
 zexCG89L+84N8eXLIR6dxaPmJQ==
X-Google-Smtp-Source: APXvYqyD6fPKryZQTpN9zsdwGV7yS5BKNQZ8tOEeMIPGi0uW8Qmgi+HgiANiv0VmQSgyzgbueGKdzg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr40515082wrn.240.1565597802765; 
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id g15sm16420028wrp.29.2019.08.12.01.16.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:16:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20190812081640.GA26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-11-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
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

T24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSXQgaGFzIGJlZW4g
cmVwbGFjZWQgd2l0aCB0aGUgaW5nZW5pYy1paW8gZHJpdmVyIGZvciB0aGUgQURDLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3Rl
ZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gLS0tCj4gIGRyaXZl
cnMvbWZkL0tjb25maWcgICAgICB8ICAgOSAtLQo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAg
fCAgIDEgLQo+ICBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMgfCAzMjQgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzM0IGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jCgpBcHBs
aWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
