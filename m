Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEC29CAD
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 19:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7161704;
	Fri, 24 May 2019 19:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7161704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558717513;
	bh=eXBney/PZzl+S4ry+pk3R1KpQCjr7+lpffpsZFIpcMQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pIfo/oJjTC8/6b9Ik4LuT29WxJ8EAdTc1CTTGa5W3HmWXINc2Dzwf1pRA9hxf66GI
	 LzW2V9Zyuc5/ra+OsET5gMC+oNqzN8YOanfxnvFbiUPUzMSYgwuBxtTlXcpNNG3c5b
	 IfbVXax9UKNlf9af6UQekw+iXY5gQn7fE+rdSeao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74BB0F89636;
	Fri, 24 May 2019 19:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C924F89630; Fri, 24 May 2019 19:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C04E7F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 19:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C04E7F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ap+RZbAy"
Received: by mail-pf1-x442.google.com with SMTP id a23so5689344pff.4
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=34qJ96AXyQCpF7NvNnEjvrHNLao/arBbmBUh05Ka3nM=;
 b=ap+RZbAyB3+sPLUmj/xydDyKCEKjkR0Cv2Qyus8DQ1U1BxXs7IsO8+VcSoFyrNsgNI
 qZK6I2yKvKXl7dK+J7zYpe+G2RhVW6hjfi4dXtptlkN9wUsVWSs8IshWTsrHyB4frK3F
 ZPbXLT9lDWq7pr/URJNfQYMZZHfEw85ctjpLUuGBJ/DZo3IcRSNA5Bru8kYUyY0C35WA
 EFj54pi8S5PPZNyuLUR3Cl7FwgjVzcdicFrbBKn9ZUrGbbqEOW3gsANRPHZ2OhJFvds3
 B6i9WLWDBiZRXXqG+VO2bnlRnLNyKQ0sLEM5nlUIltr2ioYcLD9v9coF9dXOnDkHVNUw
 M2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=34qJ96AXyQCpF7NvNnEjvrHNLao/arBbmBUh05Ka3nM=;
 b=ZTYvhL9dNAKaATIAJDtTt7zEE0orwGEMaEVILej+Q+aHOF3jSv5OnO1NQGZP+5lZGq
 JakQWFoe/7zZ43M6Dey9vAs9kAPSTZTGvfvrw3pr862hRJPMmmIXt1xLWshyd0cKKTeW
 qJvgc+abeBktrFJdkZG/APDJ2/+W84jYgIHSNtY2fKWVbF0B1Bv8TaJxsgMBOcD1g9mJ
 FsXjcQ5W0dQHVA+h4s2e5b6WDs3a30FZPjtrU1Lmknx58YfO4Jck4qo4mvP5FKxBSEr2
 hsRgLtlXQMBBvceY8yp3aLFKgXm7LSEQJJ0fNLdoimbMyN5WBg39wCiMam2mEJeyE3M5
 xIFA==
X-Gm-Message-State: APjAAAVHup1J4gUnx2llE5L5V5kKaX3+x2HNdTMJjCDL3JEAbeKjDj0e
 7XbI+szONMDxwi8e7wJNknrfwVS9x1thqsfkB0H1QhAu
X-Google-Smtp-Source: APXvYqxf7f4Z0E6iet+jPLpyXb+CU2tGX0WiZKKoTnAKaBtOTMApq+v9e/aH5IDdpkhzTGAjsk4sRZdCVzX9ej3Z1TE=
X-Received: by 2002:a63:5c5b:: with SMTP id n27mr107904986pgm.52.1558717399947; 
 Fri, 24 May 2019 10:03:19 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?VGFtw6FzIEtvdsOhY3M=?= <kepszlok@gmail.com>
Date: Fri, 24 May 2019 19:03:08 +0200
Message-ID: <CAOz7CXoOS3rA5uWVQgs+6LGephq0sNoPfom=sq0pjHsJEWGsKg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] [PATCH] ASoC: Intel: Baytrail: add quirk for Aegex 10
	(RU2) tablet
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

VGhpcyB0YWJsZXQgaGFzIGFuIGluY29ycmVjdCBhY3BpIGlkZW50aWZpZXIsIHdoaWNoIGlzIHdo
eSBpdCBpcyB0cnlpbmcgdG8KbG9hZCB0aGUgUlQ1NjQwIGRyaXZlciBpbnN0ZWFkIG9mIHRoZSBS
VDU3NjIgZHJpdmVyLiBUaGUgUlQ1NjQwIGRyaXZlciwgb24KdGhlIG90aGVyIGhhbmQsIGNoZWNr
cyB0aGUgaGFyZHdhcmUgSUQsIHNvIG5vIGRyaXZlcnMgYXJlIGxvYWRlZCBkdXJpbmcKYm9vdC4K
VGhpcyBmaXggcmVzb2x2ZXMgdG8gbG9hZCB0aGUgUlQ1NjcyIGRyaXZlciBvbiB0aGlzIHRhYmxl
dCBkdXJpbmcgYm9vdC4gSXQKYWxzbyBwcm92aWRlcyB0aGUgY29ycmVjdCBJTyBjb25maWd1cmF0
aW9uLCBsaWtlIHRoZSBqYWNrIGRldGVjdCBtb2RlIDMsCmZvciAxLjhWIHB1bGx1cC4KSSB3b3Vs
ZCBsaWtlIHRvIHRoYW5rIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IGZvciBoZWxwaW5nIHdpdGggdGhp
cyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEtvdsOhY3MgVGFtw6FzIDxrZXBzemxva0BnbWFpbC5j
b20+Ci0tLQpkaWZmIC0tZ2l0IGEvb3JpL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGkt
aW50ZWwtYnl0LW1hdGNoLmMKYi9uZXcvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1p
bnRlbC1ieXQtbWF0Y2guYwppbmRleCBmZTgxMmE5Li5lNTQ5OTUwIDEwMDY0NAotLS0gYS9vcmkv
c291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYworKysgYi9u
ZXcvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwpAQCAt
MSw0ICsxLDQgQEAKLS8qCivvu78vKgogICogc29jLWFwY2ktaW50ZWwtYnl0LW1hdGNoLmMgLSB0
YWJsZXMgYW5kIHN1cHBvcnQgZm9yIEJZVCBBQ1BJCmVudW1lcmF0aW9uLgogICoKICAqIENvcHly
aWdodCAoYykgMjAxNywgSW50ZWwgQ29ycG9yYXRpb24uCkBAIC0yMiw2ICsyMiw3IEBAIHN0YXRp
YyB1bnNpZ25lZCBsb25nIGJ5dF9tYWNoaW5lX2lkOwoKICNkZWZpbmUgQllUX1RISU5LUEFEXzEw
ICAxCiAjZGVmaW5lIEJZVF9QT1ZfUDEwMDZXICAgMgorI2RlZmluZSBCWVRfQUVHRVhfMTAgICAg
IDMKCiBzdGF0aWMgaW50IGJ5dF90aGlua3BhZDEwX3F1aXJrX2NiKGNvbnN0IHN0cnVjdCBkbWlf
c3lzdGVtX2lkICppZCkKIHsKQEAgLTM1LDYgKzM2LDEyIEBAIHN0YXRpYyBpbnQgYnl0X3Bvdl9w
MTAwNndfcXVpcmtfY2IoY29uc3Qgc3RydWN0CmRtaV9zeXN0ZW1faWQgKmlkKQogIHJldHVybiAx
OwogfQoKK3N0YXRpYyBpbnQgYnl0X2FlZ2V4MTBfcXVpcmtfY2IoY29uc3Qgc3RydWN0IGRtaV9z
eXN0ZW1faWQgKmlkKQoreworIGJ5dF9tYWNoaW5lX2lkID0gQllUX0FFR0VYXzEwOworIHJldHVy
biAxOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgYnl0X3RhYmxlW10g
PSB7CiAgewogIC5jYWxsYmFjayA9IGJ5dF90aGlua3BhZDEwX3F1aXJrX2NiLApAQCAtNzUsNiAr
ODIsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJsZVtdID0g
ewogIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjBFNTciKSwKICB9LAogIH0sCisg
eworIC8qIEFlZ2V4IDEwIHRhYmxldCAoUlUyKSAqLworIC5jYWxsYmFjayA9IGJ5dF9hZWdleDEw
X3F1aXJrX2NiLAorIC5tYXRjaGVzID0geworIERNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkFF
R0VYIiksCisgRE1JX01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sICJSVTIiKSwKKyB9LAorIH0s
CiAgeyB9CiB9OwoKQEAgLTk2LDYgKzExMSwxNSBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfYWNw
aV9tYWNoIGJ5dF9wb3ZfcDEwMDZ3ID0gewogIC5zb2ZfdHBsZ19maWxlbmFtZSA9ICJzb2YtYnl0
LXJ0NTY1MS50cGxnIiwKIH07Cgorc3RhdGljIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCBieXRf
YWVnZXhfMTAgPSB7CisgLmlkID0gIjEwRUM1NjQwIiwKKyAuZHJ2X25hbWUgPSAiY2h0LWJzdy1y
dDU2NzIiLAorIC5md19maWxlbmFtZSA9ICJpbnRlbC9md19zc3RfMGYyOC5iaW4iLAorIC5ib2Fy
ZCA9ICJjaHQtYnN3IiwKKyAuc29mX2Z3X2ZpbGVuYW1lID0gImludGVsL3NvZi1ieXQucmkiLAor
IC5zb2ZfdHBsZ19maWxlbmFtZSA9ICJpbnRlbC9zb2YtYnl0LXJ0NTY3MC50cGxnIiwKK307CisK
IHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2ggKmJ5dF9xdWlyayh2b2lkICphcmcpCiB7
CiAgc3RydWN0IHNuZF9zb2NfYWNwaV9tYWNoICptYWNoID0gYXJnOwpAQCAtMTA3LDYgKzEzMSw4
IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2ggKmJ5dF9xdWlyayh2b2lkICphcmcp
CiAgcmV0dXJuICZieXRfdGhpbmtwYWRfMTA7CiAgY2FzZSBCWVRfUE9WX1AxMDA2VzoKICByZXR1
cm4gJmJ5dF9wb3ZfcDEwMDZ3OworIGNhc2UgQllUX0FFR0VYXzEwOgorIHJldHVybiAmYnl0X2Fl
Z2V4XzEwOwogIGRlZmF1bHQ6CiAgcmV0dXJuIG1hY2g7CiAgfQoKZGlmZiAtLWdpdCBhL29yaS9z
b3VuZC9zb2MvY29kZWNzL3J0NTY3MC5jIGIvbmV3L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMK
aW5kZXggOWEwMzcxMC4uMzdjY2UwNCAxMDA2NDQKLS0tIGEvb3JpL3NvdW5kL3NvYy9jb2RlY3Mv
cnQ1NjcwLmMKKysrIGIvbmV3L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKQEAgLTEsNCArMSw0
IEBACi0vKgor77u/LyoKICAqIHJ0NTY3MC5jICAtLSAgUlQ1NjcwIEFMU0EgU29DIGF1ZGlvIGNv
ZGVjIGRyaXZlcgogICoKICAqIENvcHlyaWdodCAyMDE0IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBD
b3JwLgpAQCAtMjg4Miw2ICsyODgyLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3Rl
bV9pZApkbWlfcGxhdGZvcm1faW50ZWxfcXVpcmtzW10gPSB7CiAgUlQ1NjcwX0RFVl9HUElPIHwK
ICBSVDU2NzBfSkRfTU9ERTMpLAogIH0sCisgeworIC5jYWxsYmFjayA9IHJ0NTY3MF9xdWlya19j
YiwKKyAuaWRlbnQgPSAiQWVnZXggMTAgdGFibGV0IChSVTIpIiwKKyAubWF0Y2hlcyA9IHsKKyBE
TUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBRUdFWCIpLAorIERNSV9NQVRDSChETUlfUFJPRFVD
VF9WRVJTSU9OLCAiUlUyIiksCisgfSwKKyAuZHJpdmVyX2RhdGEgPSAodW5zaWduZWQgbG9uZyAq
KShSVDU2NzBfRE1JQ19FTiB8CisgUlQ1NjcwX0RNSUMyX0lOUiB8CisgUlQ1NjcwX0RFVl9HUElP
IHwKKyBSVDU2NzBfSkRfTU9ERTMpLAorIH0sCiAge30KIH07Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
