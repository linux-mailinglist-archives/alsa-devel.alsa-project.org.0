Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAD2821A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 18:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4541671;
	Thu, 23 May 2019 18:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4541671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558627501;
	bh=D62AAFZgDqKF68Q/nzZWmQGZKloE2RONk6mu9hbceFE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=krKANMiAceZn+WQweajP/IvD25a3ZLSr3+5/hARCwAm6+NDx8MbLie3g8fhwHI7VO
	 763OSW/l8HuWClyZ1Dse4rBMPM658GHL6A+cKkWzaj/R5o9+yqtR8L5EUr6ifuPVuI
	 vM4t4wyUum716KeltpwSa2/jVOkAtbpGZn0WiX9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24AFEF89674;
	Thu, 23 May 2019 18:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52657F89736; Tue, 21 May 2019 15:56:02 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0A78F89633
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 15:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A78F89633
Received: from laptop-1.home (unknown
 [IPv6:2a01:cb19:8ad6:900:42dd:dd1c:19ee:7c60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: aragua)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB0DE263B01;
 Tue, 21 May 2019 14:45:43 +0100 (BST)
Message-ID: <2741579da03893d2d4e7ad7f5fc42a506a82f380.camel@collabora.com>
From: Fabien Lahoudere <fabien.lahoudere@collabora.com>
To: Gwendal Grignou <gwendal@chromium.org>, enric.balletbo@collabora.com, 
 bleung@chromium.org, groeck@chromium.org, lee.jones@linaro.org,
 jic23@kernel.org,  broonie@kernel.org, cychiang@chromium.org, tiwai@suse.com
Date: Tue, 21 May 2019 15:45:41 +0200
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-Mailman-Approved-At: Thu, 23 May 2019 18:03:14 +0200
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

TGUgamV1ZGkgMDkgbWFpIDIwMTkgw6AgMTQ6MTMgLTA3MDAsIEd3ZW5kYWwgR3JpZ25vdSBhIMOp
Y3JpdCA6Cj4gVGhlIGludGVyZmFjZSBiZXR3ZWVuIENyb3NFQyBlbWJlZGRlZCBjb250cm9sbGVy
IGFuZCB0aGUgaG9zdCwKPiBkZXNjcmliZWQgYnkgY3Jvc19lY19jb21tYW5kcy5oLCBhcyBkaXZl
cmdlZCBmcm9tIHdoYXQgdGhlIGVtYmVkZGVkCj4gY29udHJvbGxlciByZWFsbHkgc3VwcG9ydC4K
PiAKPiBUaGUgc291cmNlIG9mIHRocnV0aCBpcyBhdAo+IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xl
c291cmNlLmNvbS9jaHJvbWl1bW9zL3BsYXRmb3JtL2VjLysvbWFzdGVyL2luY2x1ZGUvZWNfY29t
bWFuZHMuaAo+IAo+IFRoYXQgaW5jbHVkZSBmaWxlIGlzIGNvbnZlcnRlZCB0byByZW1vdmUgQUNQ
SSBhbmQgRW1iZWRkZWQgb25seSBjb2RlLgoKSGksIAoKSSByZXZpZXdlZCBwYXRjaGVzIG9mIHRo
ZSBzZXJpZXMgYW5kIHRoZXkgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBGYWJpZW4g
TGFob3VkZXJlIDxmYWJpZW4ubGFob3VkZXJlQGNvbGxhYm9yYS5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
