Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E77958D0
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE9A1677;
	Tue, 20 Aug 2019 09:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE9A1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566287366;
	bh=R8GzvhAggBYbjPdQLrTfH39tstOcCo5sUWj7eET+GfY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K2PoBPBPluK3IeE95t7ubXSfo5vgPQaox+t9YRI23Vnq6flreIh2QY5D/AQ7jlIyx
	 BlU/QwLAq3S/pg0OkYCkdxO/fVavMqgoawp/SDKapCg1+9xYclpEQLW8kLbC1TGRB9
	 PtU+DasDGoB3Ln+sKq3pVZtoTSSLOHHdN9fEi0+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA66EF89678;
	Tue, 20 Aug 2019 09:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF423F800B6; Mon, 19 Aug 2019 22:50:55 +0200 (CEST)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AECAF800B6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 22:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AECAF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t/sammI9"
Received: by mail-lf1-x144.google.com with SMTP id c19so2366350lfm.10
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwYJ4kbsjiWxcAgwDAclP5P256WJDBfh8B5iTsScM3w=;
 b=t/sammI9AoE2YlOs6wvwHNoXr0FW3ngr/DjAjNRLqhHhaL1xVyOY4spyQGQTeJlUq6
 2FbQeVCj9gGkPLo3A77S47fCF6s9J7RLANw++Q02bUhObzJDY2cWu7bhoKHgpXmrbNKN
 WO5iVvf81K+j2+g9fkb/siG4MAH0cXdePvwfkvtqcfvJL0aU+iJJ5KTlVl0JHjattdMz
 1Godo63Xr9myJOPbw1E1PVwkJZYdB8BNjGsrjkr1rB2W1LglMXVekmiFFoWFDC812Bax
 RhwJkGHP2JI/+pRL26wwgBXSvDw92eNVxadnZCygqsSPjRHbm+aewppcDILiq6dXtyqj
 Mn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwYJ4kbsjiWxcAgwDAclP5P256WJDBfh8B5iTsScM3w=;
 b=p71WFMyV/oP0eD0GHTdgKQR5mpjv3jZ/u0rbz/DWcgYrtPqJtuqhqJq3ILmeOJ3cGX
 fh23QQTJsocPna9zTS54HkcDckt0n6fZLvDjiLWFrN7dv4cDiZspQQOHzVwhF5bdmeEh
 xKArronU9Q4m3J4K4fL8tBPHnOiNTLTVuj8SzTUtlkwME+3godtnWs/aO/iDdITJu1Uo
 jsIvoHAYenapNVv3Hd0pcrgErBvgJKcZ3XOuScreEwyr7pZxJPGY9fz3dGBKb8cYq0pY
 zkO48A166dJO43NHvR51dvGkznaEoBK6l7jNlOyHC3SEyNt+imPa7Yk+2U2MFWqVetib
 BQtQ==
X-Gm-Message-State: APjAAAU3u4WSlcI3w80RVLBJqLpu3SWs32hFrkh1pYF4d3Sf7pHxEL4k
 4CuJcBdr+1YVFPW2f+fO/lY=
X-Google-Smtp-Source: APXvYqz4KlDpWAW/haO8/tNKjpikWkQE/yjJAvaHVdIEp9OmFQKk3X8oIXBzKpV9Lk5jVqIvNlzBmg==
X-Received: by 2002:ac2:5c4f:: with SMTP id s15mr14364702lfp.74.1566247253259; 
 Mon, 19 Aug 2019 13:40:53 -0700 (PDT)
Received: from aurora.dekrai2i.com (host-94-78-150-95.dynamic.mm.pl.
 [94.78.150.95])
 by smtp.googlemail.com with ESMTPSA id f12sm2498355lfm.14.2019.08.19.13.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 13:40:52 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Rekowski?= <p.rekowski@gmail.com>
To: tiwai@suse.com
Date: Mon, 19 Aug 2019 22:40:07 +0200
Message-Id: <20190819204008.14426-1-p.rekowski@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:28 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Connor McAdams <conmanx360@gmail.com>,
 p.rekowski@gmail.com
Subject: [alsa-devel] [PATCH v2] ALSA: hda/ca0132 - Add new SBZ quirk
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IFBDSSBzdWJzeXMgSUQgZm9yIHRoZSBTQlosIGFzIGZvdW5k
IGFuZCB0ZXN0ZWQgYnkKbWUgYW5kIHNvbWUgcmVkZGl0IHVzZXJzLgoKU2lnbmVkLW9mZi1ieTog
UGF3ZcWCIFJla293c2tpIDxwLnJla293c2tpQGdtYWlsLmNvbT4KLS0tCiBzb3VuZC9wY2kvaGRh
L3BhdGNoX2NhMDEzMi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2NhMDEzMi5jIGIvc291bmQvcGNpL2hkYS9w
YXRjaF9jYTAxMzIuYwppbmRleCBjMzA5Njc5NmVlMDUuLmM0MTg2NWUxMjIyYyAxMDA2NDQKLS0t
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9jYTAxMzIuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNo
X2NhMDEzMi5jCkBAIC0xMTc1LDYgKzExNzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9w
Y2lfcXVpcmsgY2EwMTMyX3F1aXJrc1tdID0gewogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDA3
MDgsICJBbGllbndhcmUgMTUgUjIgMjAxNiIsIFFVSVJLX0FMSUVOV0FSRSksCiAJU05EX1BDSV9R
VUlSSygweDExMDIsIDB4MDAxMCwgIlNvdW5kIEJsYXN0ZXIgWiIsIFFVSVJLX1NCWiksCiAJU05E
X1BDSV9RVUlSSygweDExMDIsIDB4MDAyMywgIlNvdW5kIEJsYXN0ZXIgWiIsIFFVSVJLX1NCWiks
CisJU05EX1BDSV9RVUlSSygweDExMDIsIDB4MDAyNywgIlNvdW5kIEJsYXN0ZXIgWiIsIFFVSVJL
X1NCWiksCiAJU05EX1BDSV9RVUlSSygweDExMDIsIDB4MDAzMywgIlNvdW5kIEJsYXN0ZXIgWnhS
IiwgUVVJUktfU0JaKSwKIAlTTkRfUENJX1FVSVJLKDB4MTQ1OCwgMHhBMDE2LCAiUmVjb24zRGki
LCBRVUlSS19SM0RJKSwKIAlTTkRfUENJX1FVSVJLKDB4MTQ1OCwgMHhBMDI2LCAiR2lnYWJ5dGUg
RzEuU25pcGVyIFo5NyIsIFFVSVJLX1IzREkpLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
