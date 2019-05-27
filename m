Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EA2BB30
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E7917C1;
	Mon, 27 May 2019 22:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E7917C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988035;
	bh=mLUq3hJ8/RCeSxtpKDDutdEMau8d6rVA5FKSlIOAJTo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+XbAupD+sB1S2vV+m2vol7ny60vcXqcvp9qgDIKBjpC/nS3D0faaCtKK4oDZuXAx
	 P7P6zQkGXAv/aK2IJqoeW0M4ZGlBJ3UK6sZY/RUZzRhTavOmEG1WxSsAanTGx813Dv
	 3bvVLqLPEi++k1X71330XZy6J1CgbOEYfMZfr20U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAE2F89732;
	Mon, 27 May 2019 22:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 877B7F896E4; Mon, 27 May 2019 22:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A415F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A415F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="psgmVbWc"
Received: by mail-wm1-x341.google.com with SMTP id 7so532623wmo.2
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wv4bRiRVjlotB3NJW4BQD8xcTUogsyFuw65oZfNvb1s=;
 b=psgmVbWcSlCI1+YNxxBbHm4Laul+Afg6UqNDgL6/++9kS667P0ea4J6kdRN5MJyZyp
 Y9XA+ZjsPBzbXsFrDMFZtdGdVsP0BQhcJB1LTxy1II8/8K7SjS97AMbgL6F7TJlgUieH
 cIKMyAUHumWxoz7j8JUMvw7FOa9AhQGdnotivIlitt6aH7z4CPJ1gslea3eeQjiR3dLt
 D2U8+gdYAeWrqVvEbaOYDCeuRbU7wBMcj4ZTD2Zi9nr4bhzkDvAW14S234U2a58G6snQ
 HWMc4xR3bTKVDmjHBdYWlUxnRlQdOLf1o8SSX26DlT/bkB/baJ5EuESmYzDDFeI9HTkg
 IA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wv4bRiRVjlotB3NJW4BQD8xcTUogsyFuw65oZfNvb1s=;
 b=YQOBY90YwgPfVH6GP8qJ1FfkRB6nCp1Dfw9rBmjPjRjXE4QFUMgfbetxoJDtM7oEhM
 ZgRJ08gRzbI91H3sORJuBpNFuHI5XRFKdlJbl47/2tTDPxfi+R5pdc+tBQ8q7/eHoGKi
 Zrjnk8j+l+qRIDi2fnAyuhk4cL2pUqK0VKDg6kia1AQ1nkwB5VWcxCNi4B/D6mYEbXGk
 f11w2LFEnliR9v4VPhYy6lJYqX+d5YZxhj9prlrvn0wFOL7ioxr4MhwMPrzoIMXoXeSM
 boThKtn32DzVRfwrjoUy9F7t8cFGtDI6ftknb6Skuy37EBu1Vqf4gRT3Dl4nTfRwV8vt
 eRGA==
X-Gm-Message-State: APjAAAXfp2CPELdwQ3lEn31W/z4bEl4rRw15pirS1tKNGKQ0kzpRK74P
 wkjD4CEeFFc3cnMZ/UEpAoA=
X-Google-Smtp-Source: APXvYqzRen9k8IsaoDFCRgz5uh2Kh75YVlp6HkmpKHkpJQcDv7nSUTkHyUNb9OYwV/fN7pzBgLzz9A==
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr508352wmh.86.1558987816422;
 Mon, 27 May 2019 13:10:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:23 +0200
Message-Id: <20190527200627.8635-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 3/7] ASoC: sun4i-spdif: Add TX fifo bit
	flush quirks
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

QWxsd2lubmVyIEg2IGhhcyBhIGRpZmZlcmVudCBiaXQgdG8gZmx1c2ggdGhlIFRYIEZJRk8uCgpB
ZGQgYSBxdWlya3MgdG8gcHJlcGFyZSBpbnRyb2R1Y3Rpb24gb2YgSDYgU29DLgoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBzb3VuZC9z
b2Mvc3VueGkvc3VuNGktc3BkaWYuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9z
dW54aS9zdW40aS1zcGRpZi5jIGIvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKaW5kZXgg
YjZjNjZhNjJlOTE1Li4wNDVkMGNjNGI2MmEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zdW54aS9z
dW40aS1zcGRpZi5jCisrKyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1zcGRpZi5jCkBAIC0xNjYs
MTAgKzE2NiwxMiBAQAogICoKICAqIEByZWdfZGFjX3R4X2RhdGE6IFRYIEZJRk8gb2Zmc2V0IGZv
ciBETUEgY29uZmlnLgogICogQGhhc19yZXNldDogU29DIG5lZWRzIHJlc2V0IGRlYXNzZXJ0ZWQu
CisgKiBAdmFsX2ZjdGxfZnR4OiBUWCBGSUZPIGZsdXNoIGJpdG1hc2suCiAgKi8KIHN0cnVjdCBz
dW40aV9zcGRpZl9xdWlya3MgewogCXVuc2lnbmVkIGludCByZWdfZGFjX3R4ZGF0YTsKIAlib29s
IGhhc19yZXNldDsKKwl1bnNpZ25lZCBpbnQgdmFsX2ZjdGxfZnR4OwogfTsKIAogc3RydWN0IHN1
bjRpX3NwZGlmX2RldiB7CkBAIC0xODAsMTYgKzE4MiwxOSBAQCBzdHJ1Y3Qgc3VuNGlfc3BkaWZf
ZGV2IHsKIAlzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIGNwdV9kYWlfZHJ2OwogCXN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsKIAlzdHJ1Y3Qgc25kX2RtYWVuZ2luZV9kYWlfZG1hX2RhdGEgZG1hX3Bh
cmFtc190eDsKKwljb25zdCBzdHJ1Y3Qgc3VuNGlfc3BkaWZfcXVpcmtzICpxdWlya3M7CiB9Owog
CiBzdGF0aWMgdm9pZCBzdW40aV9zcGRpZl9jb25maWd1cmUoc3RydWN0IHN1bjRpX3NwZGlmX2Rl
diAqaG9zdCkKIHsKKwljb25zdCBzdHJ1Y3Qgc3VuNGlfc3BkaWZfcXVpcmtzICpxdWlya3MgPSBo
b3N0LT5xdWlya3M7CisKIAkvKiBzb2Z0IHJlc2V0IFNQRElGICovCiAJcmVnbWFwX3dyaXRlKGhv
c3QtPnJlZ21hcCwgU1VONElfU1BESUZfQ1RMLCBTVU40SV9TUERJRl9DVExfUkVTRVQpOwogCiAJ
LyogZmx1c2ggVFggRklGTyAqLwogCXJlZ21hcF91cGRhdGVfYml0cyhob3N0LT5yZWdtYXAsIFNV
TjRJX1NQRElGX0ZDVEwsCi0JCQkgICBTVU40SV9TUERJRl9GQ1RMX0ZUWCwgU1VONElfU1BESUZf
RkNUTF9GVFgpOworCQkJICAgcXVpcmtzLT52YWxfZmN0bF9mdHgsIHF1aXJrcy0+dmFsX2ZjdGxf
ZnR4KTsKIAogCS8qIGNsZWFyIFRYIGNvdW50ZXIgKi8KIAlyZWdtYXBfd3JpdGUoaG9zdC0+cmVn
bWFwLCBTVU40SV9TUERJRl9UWENOVCwgMCk7CkBAIC00MTgsMTUgKzQyMywxOCBAQCBzdGF0aWMg
c3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBzdW40aV9zcGRpZl9kYWkgPSB7CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3VuNGlfc3BkaWZfcXVpcmtzIHN1bjRpX2ExMF9zcGRpZl9xdWlya3MgPSB7
CiAJLnJlZ19kYWNfdHhkYXRhCT0gU1VONElfU1BESUZfVFhGSUZPLAorCS52YWxfZmN0bF9mdHgg
ICA9IFNVTjRJX1NQRElGX0ZDVExfRlRYLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40
aV9zcGRpZl9xdWlya3Mgc3VuNmlfYTMxX3NwZGlmX3F1aXJrcyA9IHsKIAkucmVnX2RhY190eGRh
dGEJPSBTVU40SV9TUERJRl9UWEZJRk8sCisJLnZhbF9mY3RsX2Z0eCAgID0gU1VONElfU1BESUZf
RkNUTF9GVFgsCiAJLmhhc19yZXNldAk9IHRydWUsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHN1bjRpX3NwZGlmX3F1aXJrcyBzdW44aV9oM19zcGRpZl9xdWlya3MgPSB7CiAJLnJlZ19kYWNf
dHhkYXRhCT0gU1VOOElfU1BESUZfVFhGSUZPLAorCS52YWxfZmN0bF9mdHggICA9IFNVTjRJX1NQ
RElGX0ZDVExfRlRYLAogCS5oYXNfcmVzZXQJPSB0cnVlLAogfTsKIApAQCAtNTA3LDYgKzUxNSw3
IEBAIHN0YXRpYyBpbnQgc3VuNGlfc3BkaWZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGRldGVybWluZSB0aGUgcXVp
cmtzIHRvIHVzZVxuIik7CiAJCXJldHVybiAtRU5PREVWOwogCX0KKwlob3N0LT5xdWlya3MgPSBx
dWlya3M7CiAKIAlob3N0LT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oJnBkZXYtPmRl
diwgYmFzZSwKIAkJCQkJCSZzdW40aV9zcGRpZl9yZWdtYXBfY29uZmlnKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
