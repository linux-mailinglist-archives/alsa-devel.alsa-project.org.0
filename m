Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6672BB31
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB3A17D1;
	Mon, 27 May 2019 22:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB3A17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988084;
	bh=4Uy2n+2Dpu3EBHwA0HvXfqUBdRVF2FWXP37EHhgIWMg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZOEAtqpHxYCga9HJ2gxfbp0FxtH+BpwQNpIRiyJ1t7a2tPmqzMw2UHJVEo5FjHPd
	 4DmQZ8xNMoLAr42ya6u42w3taE21etwViGLCBUvLSWSHwpe3Hkqii4TT3lWfP0sSlo
	 I28q2+h0slRTLYmbzbgNK8vnwhkQY1750bgYNsVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 414B9F8973E;
	Mon, 27 May 2019 22:10:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF8BF896E5; Mon, 27 May 2019 22:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC692F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC692F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gbyFYMES"
Received: by mail-wm1-x342.google.com with SMTP id f10so532047wmb.1
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+c7EUbgBQhlzZ37NOreDYMAwd8bxw3irPCzpd3kWrE=;
 b=gbyFYMESgLGOeRm9ME4IdNBI0YZ6YdBSJXE5ykZmP6QQOKtNBykYFL/TeH6nOX4ri/
 Uz0Q3jJQta0zUKjvSyF2lNxeL0X9oSahiY2dNOFQrRyAWqhtMl+izapHKYdsSNiRELAV
 NRL6k9eCnfks+xQfkBtino4GQqq8IPYHSQWWERBX1DhZgaLXYCKHSc9wihGoDfRZ5o+0
 mt99CI2qM/8kEn0y/CqkVoGpOOpqtOj1FbR380vVKTpk83ujGaK/ZkXL1+sHO41PI+En
 vUBzcF1h9fVTLpVAQV9n8/s1U4aSVd92wspN+HW2fS1I5bWGhduT0VVhoCCWB7Zx/HyH
 eT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+c7EUbgBQhlzZ37NOreDYMAwd8bxw3irPCzpd3kWrE=;
 b=iFaUuLNMUvzg+zt66pafA6NrPmuX2xpaMvrMMikDkCI9V0RY8cdUdssqQf4Ju8uUJh
 sh5sehKANADDLO/bmwWtRCxoRAXzDJ9BAYZvIgpkKzW4pjuEILqQJD1f1R1GexTAPzdU
 qxyqxt1/biVoibH86uXWgRQvb9XEEJ9s8IQmvGD+os66ZkHvg96xNIkuFiec7kvJEB3E
 d8xLcyZu1+E79FHYRAxp2TauPnqkhErZvpAmp5LMLiZ/QyCYRYg0Cxg1kWwyUtwOCz/D
 O3XvSvDTLuOkA5aLUhK257Gvz6dSJfBQ89WxrnzhHhbsY8yK2FgcXVzhz5Nz6l+ADP45
 eTdg==
X-Gm-Message-State: APjAAAVOfW7jKTgg+vYuxxPL+1V0e7mcthjLP0eASLCPVsfFsjQiFVmH
 8AUMU593j9TmQb4630fQOyY=
X-Google-Smtp-Source: APXvYqw+dciatO5GNWSimwPwvfx+GkadexGDSVXlmLIezPzMcRKJXzffRGQ5/NfbGb/tBQECadYRQQ==
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr488971wml.45.1558987817783;
 Mon, 27 May 2019 13:10:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:24 +0200
Message-Id: <20190527200627.8635-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 4/7] ASoC: sun4i-spdif: Add support for H6
	SoC
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

QWxsd2lubmVyIEg2IGhhcyBhIGRpZmZlcmVudCBtYXBwaW5nIGZvciB0aGUgZmlmbyByZWdpc3Rl
ciBjb250cm9sbGVyLgoKQWN0dWFsbHkgb25seSB0aGUgZmlmbyBUWCBiaXQgaXMgdXNlZCBpbiB0
aGUgZHJpdmVycy4KClVzZSB0aGUgZnJlc2hseSBpbnRyb2R1Y2VkIHF1aXJrcyB0byBtYWtlIHRo
aXMgZHJpdmVycyBjb21wYXRpYmxlIHdpdGgKdGhlIEFsbHdpbm5lciBINi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogc291bmQvc29j
L3N1bnhpL3N1bjRpLXNwZGlmLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdW54aS9z
dW40aS1zcGRpZi5jIGIvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKaW5kZXggMDQ1ZDBj
YzRiNjJhLi41NGMwOTM0NmQyOTggMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zdW54aS9zdW40aS1z
cGRpZi5jCisrKyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1zcGRpZi5jCkBAIC03NSw2ICs3NSwx
OCBAQAogCSNkZWZpbmUgU1VONElfU1BESUZfRkNUTF9SWE9NKHYpCQkoKHYpIDw8IDApCiAJI2Rl
ZmluZSBTVU40SV9TUERJRl9GQ1RMX1JYT01fTUFTSwkJR0VOTUFTSygxLCAwKQogCisjZGVmaW5l
IFNVTjUwSV9INl9TUERJRl9GQ1RMICgweDE0KQorCSNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZD
VExfSFVCX0VOCQlCSVQoMzEpCisJI2RlZmluZSBTVU41MElfSDZfU1BESUZfRkNUTF9GVFgJCUJJ
VCgzMCkKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RMX0ZSWAkJQklUKDI5KQorCSNkZWZp
bmUgU1VONTBJX0g2X1NQRElGX0ZDVExfVFhUTCh2KQkJKCh2KSA8PCAxMikKKwkjZGVmaW5lIFNV
TjUwSV9INl9TUERJRl9GQ1RMX1RYVExfTUFTSwkJR0VOTUFTSygxOSwgMTIpCisJI2RlZmluZSBT
VU41MElfSDZfU1BESUZfRkNUTF9SWFRMKHYpCQkoKHYpIDw8IDQpCisJI2RlZmluZSBTVU41MElf
SDZfU1BESUZfRkNUTF9SWFRMX01BU0sJCUdFTk1BU0soMTAsIDQpCisJI2RlZmluZSBTVU41MElf
SDZfU1BESUZfRkNUTF9UWElNCQlCSVQoMikKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RM
X1JYT00odikJCSgodikgPDwgMCkKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RMX1JYT01f
TUFTSwkJR0VOTUFTSygxLCAwKQorCiAjZGVmaW5lIFNVTjRJX1NQRElGX0ZTVEEJKDB4MTgpCiAJ
I2RlZmluZSBTVU40SV9TUERJRl9GU1RBX1RYRQkJCUJJVCgxNCkKIAkjZGVmaW5lIFNVTjRJX1NQ
RElGX0ZTVEFfVFhFQ05UU0hUCQkoOCkKQEAgLTQzOCw2ICs0NTAsMTIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mgc3VuOGlfaDNfc3BkaWZfcXVpcmtzID0gewogCS5o
YXNfcmVzZXQJPSB0cnVlLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV9zcGRpZl9x
dWlya3Mgc3VuNTBpX2g2X3NwZGlmX3F1aXJrcyA9IHsKKwkucmVnX2RhY190eGRhdGEgPSBTVU44
SV9TUERJRl9UWEZJRk8sCisJLnZhbF9mY3RsX2Z0eCAgID0gU1VONTBJX0g2X1NQRElGX0ZDVExf
RlRYLAorCS5oYXNfcmVzZXQgICAgICA9IHRydWUsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBzdW40aV9zcGRpZl9vZl9tYXRjaFtdID0gewogCXsKIAkJLmNvbXBhdGli
bGUgPSAiYWxsd2lubmVyLHN1bjRpLWExMC1zcGRpZiIsCkBAIC00NTEsNiArNDY5LDEwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjRpX3NwZGlmX29mX21hdGNoW10gPSB7
CiAJCS5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1oMy1zcGRpZiIsCiAJCS5kYXRhID0g
JnN1bjhpX2gzX3NwZGlmX3F1aXJrcywKIAl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjUwaS1oNi1zcGRpZiIsCisJCS5kYXRhID0gJnN1bjUwaV9oNl9zcGRpZl9xdWlya3Ms
CisJfSwKIAl7IC8qIHNlbnRpbmVsICovIH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
dW40aV9zcGRpZl9vZl9tYXRjaCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
