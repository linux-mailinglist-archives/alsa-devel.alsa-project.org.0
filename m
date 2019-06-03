Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134B329A9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 09:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE446166A;
	Mon,  3 Jun 2019 09:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE446166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559547160;
	bh=+mBgsH4KnNmGWPLscXElYXfSlZrfAMbIATfx+2LIKFs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dgRTuGH4NFTXvdiCMsUyVB9s/Lf0WXuLP6+2JUPX9hX6jDi3P6jKIWUIgDfDxJEXT
	 xpsxtAGYj+d94xmfImdxUL8K+jyqMjg7l9BGuauaknVugxuoMHcmilv0li/pFdA4za
	 SGTvMC44kUTD16eP2iL5BvvywCM7r/EL2KUo8FrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4820DF896DB;
	Mon,  3 Jun 2019 09:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8633F896DD; Mon,  3 Jun 2019 09:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E97F4F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 09:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E97F4F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GtAdhoHt"
Received: by mail-wr1-x441.google.com with SMTP id b18so10795798wrq.12
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=M4ll74/WKhSFaghcnaaP+t7DHNq0bSr1SP/Y1vqsSMo=;
 b=GtAdhoHtwc2UCM/fNKoxa3pte2zyqWg9Y3CCRrmtcD31LG/urmbFSPuGMbFvz+tvHV
 ZHH+NJQXciB7dg1bAYZLAvo24X8JhL0ncnZrlbuzu/prk/t/FDmJxedrQbr6wxmc2XDf
 qXdYr4UUHDxRlIBwbYCsrY9oR/DPZaKjXxH3u2ItvDIhpNMZVFOgYfppSuEMcAj/lFJ0
 fiW7yxk8volCVJiAeDPF5lbDa69vCSfMcHiX4hr/rs5i3/LR6h5Vzm2BifbCms9wu7QD
 fLYHxdQlfOKpD/+WKLAQcUsVG1cwdmfqFSzQ6Fr7dc2dnM1iUI+V39wl5tMGoPl1OIy8
 9+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=M4ll74/WKhSFaghcnaaP+t7DHNq0bSr1SP/Y1vqsSMo=;
 b=aoV0brOwCPsXWv4bHLP7bDgk66Fva77RVRzRrUN7WyAC207lpt4R4GveltnRbAhG8e
 ZJeUhqPSJkkfycfE/wWFZUiftEdDxK85+2kCCKPH9AGQHQaCDkxB6jwhR8U2f6RXi/MG
 Rx/RKTTLC7AZhI6P4pI9L76L0XjYDV3GfQSyDF4i7EF4IuBbrzj1Ai76vxUwmtan9p90
 RZ6TmzQuOXfL4MGPm4SwROAwBHpfQCiPKzjLjkCmD0pzxu5pb7m3AqoLVxUt5cV/hI/E
 s9kvOGPEaSojcUDSgphjXx7/iLnidRxeWto2MmxvRKPiRnfvMKsxTrtZPZ9DFbJ01zZq
 FaTg==
X-Gm-Message-State: APjAAAXz54Lu/4lAF8lLhgGs681zYdHCSksjM99bOoy360U0l2QFgFQw
 vmDRwjaQBON3D00uvXyjw+AJag==
X-Google-Smtp-Source: APXvYqzfy2LHhRFy7PNkZKC5674AEGU8ujPSR9Q7IvezsJ54X8ybuyDE/zf++yvc5EpUmcd0tgVCig==
X-Received: by 2002:adf:f743:: with SMTP id z3mr1307228wrp.129.1559547048775; 
 Mon, 03 Jun 2019 00:30:48 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id g185sm13041249wmf.30.2019.06.03.00.30.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:30:47 -0700 (PDT)
Date: Mon, 3 Jun 2019 08:30:45 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Gomez <dagmcr@gmail.com>
Message-ID: <20190603073045.GE4797@dell>
References: <1557569038-20340-1-git-send-email-dagmcr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557569038-20340-1-git-send-email-dagmcr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "moderated list:CIRRUS LOGIC MADERA CODEC DRIVERS"
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 "open list:CIRRUS LOGIC MADERA CODEC DRIVERS" <patches@opensource.cirrus.com>,
 open list <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, javier@dowhile0.org
Subject: Re: [alsa-devel] [PATCH v2] mfd: madera: Add missing of table
	registration
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

T24gU2F0LCAxMSBNYXkgMjAxOSwgRGFuaWVsIEdvbWV6IHdyb3RlOgoKPiBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCA8b2ZfbWF0Y2hfdGFibGU+IHNob3VsZCBiZSBjYWxsZWQgdG8gY29tcGxldGUg
RFQKPiBPRiBtYXRoaW5nIG1lY2hhbmlzbSBhbmQgcmVnaXN0ZXIgaXQuCj4gCj4gQmVmb3JlIHRo
aXMgcGF0Y2g6Cj4gbW9kaW5mbyAuL2RyaXZlcnMvbWZkL21hZGVyYS5rbyB8IGdyZXAgYWxpYXMK
PiAKPiBBZnRlciB0aGlzIHBhdGNoOgo+IG1vZGluZm8gLi9kcml2ZXJzL21mZC9tYWRlcmEua28g
fCBncmVwIGFsaWFzCj4gYWxpYXM6ICAgICAgICAgIG9mOk4qVCpDY2lycnVzLHdtMTg0MEMqCj4g
YWxpYXM6ICAgICAgICAgIG9mOk4qVCpDY2lycnVzLHdtMTg0MAo+IGFsaWFzOiAgICAgICAgICBv
ZjpOKlQqQ2NpcnJ1cyxjczQ3bDkxQyoKPiBhbGlhczogICAgICAgICAgb2Y6TipUKkNjaXJydXMs
Y3M0N2w5MQo+IGFsaWFzOiAgICAgICAgICBvZjpOKlQqQ2NpcnJ1cyxjczQ3bDkwQyoKPiBhbGlh
czogICAgICAgICAgb2Y6TipUKkNjaXJydXMsY3M0N2w5MAo+IGFsaWFzOiAgICAgICAgICBvZjpO
KlQqQ2NpcnJ1cyxjczQ3bDg1QyoKPiBhbGlhczogICAgICAgICAgb2Y6TipUKkNjaXJydXMsY3M0
N2w4NQo+IGFsaWFzOiAgICAgICAgICBvZjpOKlQqQ2NpcnJ1cyxjczQ3bDM1QyoKPiBhbGlhczog
ICAgICAgICAgb2Y6TipUKkNjaXJydXMsY3M0N2wzNQo+IAo+IFJlcG9ydGVkLWJ5OiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgPGphdmllckBkb3doaWxlMC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIEdvbWV6IDxkYWdtY3JAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tYWRl
cmEtY29yZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
