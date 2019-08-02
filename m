Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12C7F7D9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 15:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF271748;
	Fri,  2 Aug 2019 15:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF271748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564751306;
	bh=xpGcX/QS5Ufwpw/KwKFdVaYnKebCjcErDW+MXADwJTI=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txGwm0muVedYkGojZjxtYonOrWB71UXEKaYZ1y4JPVRXq7GTEizEegoHErZ/sEbIQ
	 fN+mw1nktNRxmgMqFomtyPm8lYRZ34KtxBD0GZzbzMXP2tn3yJRtUb0+7LlLnz+ahk
	 c7lN5fCGmE5cgBI7Wt/wH8I9+lV00YiJWhiOO8vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E38F8048F;
	Fri,  2 Aug 2019 15:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC7EF8048F; Fri,  2 Aug 2019 15:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F551F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 15:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F551F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=tutanota.com
 header.i=@tutanota.com header.b="OzyRGT6i"
Received: from w2.tutanota.de (unknown [192.168.1.163])
 by w1.tutanota.de (Postfix) with ESMTP id 77353FBF2D9
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564751197; 
 s=s1; d=tutanota.com;
 h=Date:From:To:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=UmoEWcULi5Rh/jslpTDx8Mw3uewysZHw096K8fG1sgA=;
 b=OzyRGT6iBO1I+49SUkMy4EZ9ocKMG/FKrdfl9NUeTxW8Eoteev7yts84EJYlG2Y3
 RB8sKbK+Z3cW1eSEIstZIjUVg1hgXQk9qBFEfYVivVa8SCA3aNxlF1fDecjBJ8GArMb
 qVVt3spFjFskbYcSExZib5s6P+zMtayQwKQlU5iQbxF/oTmP3knLVwfBlyiInyCsmm7
 LGyJvroQ4+8lYePeqO8i7SPebAcf+GYFxwAh4wXhuZTYz7uUyTVrmTqkYvQKPhNwMLN
 JF0Of7UPAfhMY1PEYn8wiarOi68UY6uFn4l5OHuEYBjflw/YIrZj3T0BEi/yCo6MPSx
 +cdLe/ATeA==
Date: Fri, 2 Aug 2019 15:06:37 +0200 (CEST)
From: <lukasbf@tutanota.com>
To: Alsa Devel <alsa-devel@alsa-project.org>
Message-ID: <LlHR6BT--3-1@tutanota.com>
In-Reply-To: <LlGsDvv--3-1@tutanota.com>
References: <LlGsDvv--3-1@tutanota.com>
MIME-Version: 1.0
Subject: [alsa-devel] Audio issue with chtnau8824
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

CkkgdHJpZWQgY2hhbmdpbmcgdGhlIHVjbSBmaWxlcywgbm8gc3VjY2VzcwoyLiBBdWcuIDIwMTks
IDEyOjI5IHZvbiBsdWthc2JmQHR1dGFub3RhLmNvbToKCj4KPiBIZWxsbyBBTFNBIGRldnMsIAo+
Cj4gSSBhbSBzb3JyeSB0byBhbm5veSBidXQgbXkgbmV3IExhcHRvcCBzZWVtcyB0byBtYWtlIGEg
c3RyYW5nZSBub2lzZSBldmVyeXRpbWUgbXkgc291bmQgc3lzdGVtIHRyaWVzIHRvIGRvIHNvbWV0
aGluZy4KPgo+IFRoaXMgaXMgdGhlIHNvdW5kLCBXYXJuaW5nLCBwcm9iYWJseSBsb3VkIQo+Cj4K
PiBodHRwczovL3lvdXR1LmJlL1c3N25CbkRiNGRFIDxodHRwczovL3lvdXR1LmJlL1c3N25CbkRi
NGRFPgo+Cj4KPiBodHRwczovL3lvdXR1LmJlL2xrcnoyc0RuVWNBIDxodHRwczovL3lvdXR1LmJl
L2xrcnoyc0RuVWNBPgo+Cj4KPiBJIHN1c3BlY3QgaXQgaGFzIHRvIGRvIHNvbWV0aGluZyB3aXRo
IHRoZSBkcml2ZXIvYWxzYS4KPgo+Cj4gaSBoYXZlIHRoZSB3aG9sZSB3ZWVrZW5kIGZyZWUgc28g
aSBjYW4gc2VuZCBkaWFnbm9zdGljcyBsaWtlIHRoaXMsCj4KPgo+IGh0dHA6Ly9hbHNhLXByb2pl
Y3Qub3JnL2RiLz9mPTRhYWRmZTkyNzVhOWRjNmU0NjY5YzhiZTQzMDFlZWMxMTA2NGI3ZjAgPGh0
dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTRhYWRmZTkyNzVhOWRjNmU0NjY5YzhiZTQzMDFl
ZWMxMTA2NGI3ZjA+Cj4KPgo+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IG15IHNvdW5kY2FyZCB3
b3JraW5nLCBtYXliZSBpIGZvdW5kIHNvbWV0aGluZyBpbXBvcnRhbnQuCj4KPgo+Cj4KPgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBXb3JrLAo+Cj4KPgo+Cj4gTHVrYXMgRnJpZWRyaWNowqAKPgo+Cj4K
Pgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
