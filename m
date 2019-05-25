Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F62A557
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7884416B1;
	Sat, 25 May 2019 18:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7884416B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801767;
	bh=DnBAYR1N8PfFpGJsPmXQqSVxyHK9k7jT313n4gJnxHw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AuWaTyEAW4m/TAEECCH9CJcsBnbs6xgf8x13mXynGiwuoVHaSoLoFBNsahLTrG2jq
	 Nm83PaDxRhtxAHTJ9vcSC6h9gGwpPnN74LCOf3akX4l8jjNj6qm4Hmx/Pcw+hqLCA2
	 gTeHMTPiEo2OQ+G1Ch8hIyxkvyL9tZffO9OEWl/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8ADF89747;
	Sat, 25 May 2019 18:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A337F89674; Sat, 25 May 2019 18:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE63F8065A
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE63F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hid6LcFk"
Received: by mail-wm1-x343.google.com with SMTP id 7so11928949wmo.2
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlAy4iNnvpXUfWGzbLAVAxpfZU/8XBVjL/0mbqQ077c=;
 b=Hid6LcFkjp/uCFTQ8+JUV9wkDRDxQ5n/luRNm+f87fvUA6aSgXGkTu2cpND0HqGipX
 W8kiEMpIpTWBFsfjv1qcGygssRzr9+pZYRLkJpCDYNuxxOrZPoRl2hGLz313q4JEtg0L
 HgP9qUTpzN1AYV5Ke6SF0VSYyiuoKxcv0ZSjRUtlvCk1M7/aG3s0cwnoUYQMswc4O6AW
 REh8R/mGBFsRah9xYMdlsRL4SWPCNrIe67ml80VoiNPYdfBVSA8cPc6IF2KiwS9H14TR
 QBJi5UgTXSJ16qkZj49TVOl4Erpt6gJuTMzI6ssAmmv37L3FcTY/NMy3o3J9g2hzehXx
 rShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OlAy4iNnvpXUfWGzbLAVAxpfZU/8XBVjL/0mbqQ077c=;
 b=Iu4/CPVzBZQrm4qOIXffQwtBxFVPoQNPE1OctxxphRVdaRSyOVvJh5boTunwUiJRmq
 qcHlRsuIDV8pie09vSRtja5EOhnSJbumgqPXZzeqOVStJOU+4Dsm2+ukI0TxWkQy+SdB
 3AdCGwyUkR4FMUdhyLmCUZw13HhgWzBriFzlsrUD2e8QS6SI9E9iALojcEMw2j+rU762
 gnj5OyvJvHcCWq/5X+6tVs193Bdb3Xi+W2kDssbxgzC3gVBbreRfV+mI2coz2URGSE9s
 lQlVgBeFJn8wxtZrEN+IUtgQ+DIzBfr0YEcJ/GYBrN9tdxMhO6Cy8Clev5qFsWkYYSzz
 BLQQ==
X-Gm-Message-State: APjAAAUTlroNKw30IAGnxi/4sN9NCefEY7gqzaXHf+XvYhrI7FTrwHqF
 uLrg3G5v8OeaMvL3eNgEZDo=
X-Google-Smtp-Source: APXvYqzeJRaf2YrofzXm0wnzXdjpc7yDd4pAHttdNjL7/dmyVC2pKdylt4bQ+mVkGLlcN76UZiDo6A==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr12209726wmd.115.1558801418274; 
 Sat, 25 May 2019 09:23:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:22 +0200
Message-Id: <20190525162323.20216-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 6/7] arm64: dts: allwinner: h6: Enable SPDIF
	for Beelink GS1
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

QmVlbGluayBHUzEgYm9hcmQgaGFzIGEgU1BESUYgb3V0IGNvbm5lY3Rvciwgc28gZW5hYmxlIGl0
IGluCnRoZSBkZXZpY2UtdHJlZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVy
b24uY2xlbUBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWg2LWJlZWxpbmstZ3MxLmR0cyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1oNi1iZWVsaW5rLWdzMS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41
MGktaDYtYmVlbGluay1nczEuZHRzCmluZGV4IDBkYzMzYzkwZGQ2MC4uNzZhOTVhZDMzZGM1IDEw
MDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGlu
ay1nczEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1i
ZWVsaW5rLWdzMS5kdHMKQEAgLTI0Myw2ICsyNDMsMTAgQEAKIAl2Y2MtcG0tc3VwcGx5ID0gPCZy
ZWdfYWxkbzE+OwogfTsKIAorJnNwZGlmIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmdWFy
dDAgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZ1YXJ0MF9w
aF9waW5zPjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
