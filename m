Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05172BB4E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6216F17CA;
	Mon, 27 May 2019 22:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6216F17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988173;
	bh=DnBAYR1N8PfFpGJsPmXQqSVxyHK9k7jT313n4gJnxHw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qC+iFkU17+mB8Y2B0sFRCpC7OyXG0Kw9AsKHC9+VjECfAX5PkcHoo3kvlWkP1j8L9
	 QbYp47G1cPtacfUedd1NXPWnh54Jau1PhlST2FmLTJxep71HYMJe2cEWtNRL6jKl8k
	 PllI1AGOcU5SZi45UACkr1GkHYPEZqeq4OUF4LjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2BAF89744;
	Mon, 27 May 2019 22:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D1CBF896E0; Mon, 27 May 2019 22:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39FACF896E0
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39FACF896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I8S2Cn58"
Received: by mail-wm1-x344.google.com with SMTP id 7so532775wmo.2
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlAy4iNnvpXUfWGzbLAVAxpfZU/8XBVjL/0mbqQ077c=;
 b=I8S2Cn58NEVH0hatc3NKO2PFM88gZWXrHjhGHO35q+3Qa0jns1eKsnFDC7jJB5j/EA
 7HXPhqqY5oA8PQyt18mnwaZQ7YtD1a/kvTf5VqGbVd/jwQrplO7Ntzs7xVfjh8Py+MU/
 xUnKfY5ChHv09UtfqppKz/CtZMokuvx0si03JPCJ85oOQxSvKCQJTfn1/9AZpRrFNJaj
 N8Gfja9/sSsqVeTdrMZtXlb6gONUNy57M6mAakH9Klj1aT73Md3TTwRbp39wO9AwrHxZ
 k4GfgAHMhXe2KdMIPP5YEMbt8XNaPVv0OKgnB1cUyhLrUHylD/20xsq0hzm1B1DRMuyw
 dNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OlAy4iNnvpXUfWGzbLAVAxpfZU/8XBVjL/0mbqQ077c=;
 b=L8o0Ddsl4coZ04uNosRMPSyztZZeuzxf3v3PlYkJMSCfRVQdYX1nR2xVoPRH2qQdWs
 rXVzQ8Z2T/5C/LkiGHFm4LdQKluDNtdsOx+5KtSniNzfh2ZZLIq7CHQB0ZiM8N5iewWm
 O50esfOIyKxWobqWNHqniLQyqoVNhEKNuucQV/YY9UmHrDNSOote9PlHN/UWWDRQkc88
 JNSv2mMXNHoLIM+SGHgr+py32CP+mvxhj12ulxYihNVz34fQPyhb+JAW9EL5mr+PRAWk
 XYarGbdbB2bZXmApMxzxNQ2XoQ+CH1zpqRmxXgUAmPEpfyDLEpYW2TcCLx/1X8zN0Dcx
 SPBQ==
X-Gm-Message-State: APjAAAX0h/A2d1IeF8pYaOyWN6tvbtp5+uwyaIjxjX+h2mcQN3oYO6fd
 NbT0Ounnq5rByN1UqzPmAH0=
X-Google-Smtp-Source: APXvYqzJpzVaaRuhg4r+/YsFaMeeSgvPFOhsrD9RszJD+0NeroZ0mmv17kCSfNxSev62Zwhh4sG18A==
X-Received: by 2002:a1c:98cf:: with SMTP id a198mr510793wme.51.1558987820339; 
 Mon, 27 May 2019 13:10:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:26 +0200
Message-Id: <20190527200627.8635-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 6/7] arm64: dts: allwinner: h6: Enable SPDIF
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
