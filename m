Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E02A553
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852091743;
	Sat, 25 May 2019 18:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852091743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801611;
	bh=YPNQYJGD0wUO16+eXtO/jw7LZA/Nkfvh4T0D749FKqc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pahEJojvw9Ot80O0jUEm9ksvzEWedTyDyH3u2rLnpLgPE0mL99/slxmzfgSQHLPFd
	 7FUo16wgcqWI4Hfkrzl8XZRTm+SP+tKU3cD7ODpe4rDTN/oO/yi1ANDZUshUiYF2XY
	 8prgWusyREqPkBg3SnmXe88BiWQYH654VANYVcVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA14F89728;
	Sat, 25 May 2019 18:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81DBDF89674; Sat, 25 May 2019 18:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B97DF89670
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B97DF89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aCL66DnQ"
Received: by mail-wm1-x342.google.com with SMTP id z23so7865192wma.4
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfqUAOYPvDzhcNc+tjW6jBBWsXQUQMy7ncklrPlMEZg=;
 b=aCL66DnQKCJFGF7Sny1qI110miKIWTxt7QW1iSoRit3Mo5jspnYicZoXoQfgUflTpn
 nL6BhP1dmM+LagcQyqPghQws4BzN0DNqSTXisfQSiQF26TeDElGIYaCOXH6Xy/5djSLp
 Aea8coHm1Qg3oR0BmfdgzqYXVNUie1jX/vbcAGGcwDR7J9AcFH5sDqjUJIZrOFrLuzb4
 u0bGKcTMGLWvkKx9WubIYANjkLlsgz++UOw3dQHpff9U/sp0W9OjFqUx7L54Pf6QfBZM
 9Ti/JJvL7T1GY8wbnAxFjY7+cbqxYzr+e1HZAwznhbu/sGK+bEIjL3I46nVozFwseSEk
 UaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfqUAOYPvDzhcNc+tjW6jBBWsXQUQMy7ncklrPlMEZg=;
 b=kSt/+QX+ryxpd1N5olN4+InnK4goB3dexSVQ7+8absMDiCnW+y1pNB+OjDg5G706EK
 sJiWd399rRS+0sKgFWHqwJigPS1JfZ1lbBj7ERhUxMgURzaYGNPLhTDwcag2wLk3xajX
 geMs6LHgVF1KFR9N2Sz5iZEAGbxJbrsdWL9viAiqJpiFVqEMmtrcl+3n5hSWstofTC3J
 6t755TJhkCX5YV9NL+M+MpMsA901iJDeCfLWdMcbCjRUZFaNI/QnEfk04bVgQz4OE/wj
 KDWV9SXaG4wQrRtSLKSlAqc7M3J5v/80Bb06yw9UdBkPHeUTZ5gooXwtRhRnwZOCc9S/
 6Xsg==
X-Gm-Message-State: APjAAAUu9bGcbu1/3pKpAh8/pfmVmffqekUaYtUxB5jPRivx2Rm1t4cO
 6NHf9uSFHsICEXWP96H/Uhw=
X-Google-Smtp-Source: APXvYqyXeydx+UFeVN5TqubaJQaFnJKueyJjEY/3Q6lja+t2vhfPzJbWHUyyD43HepFrNIoanUPkqw==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr3998765wma.147.1558801413382; 
 Sat, 25 May 2019 09:23:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:18 +0200
Message-Id: <20190525162323.20216-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 2/7] ASoC: sun4i-spdif: Move quirks to the
	top
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

VGhlIHF1aXJrcyBhcmUgYWN0dWFsbHkgZGVmaW5lcyBpbiB0aGUgbWlkZGxlIG9mIHRoZSBmaWxl
IHdpdGgKc2hvcnQgZXhwbGFuYXRpb24uCgpNb3ZlIHRoaXMgYXQgdGhlIHRvcCBhbmQgYWRkIGEg
c2VjdGlvbiB0byBoYXZlIGNvaGVyZW5jeSB3aXRoCnN1bjRpLWkycy4KClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogc291bmQvc29jL3N1
bnhpL3N1bjRpLXNwZGlmLmMgfCAxNiArKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
c3VueGkvc3VuNGktc3BkaWYuYyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1zcGRpZi5jCmluZGV4
IGI0YWY0YWFiZWFkMS4uYjZjNjZhNjJlOTE1IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc3VueGkv
c3VuNGktc3BkaWYuYworKysgYi9zb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYwpAQCAtMTYx
LDYgKzE2MSwxNyBAQAogI2RlZmluZSBTVU40SV9TUERJRl9TQU1GUkVRXzE3Nl80S0haCQkweGMK
ICNkZWZpbmUgU1VONElfU1BESUZfU0FNRlJFUV8xOTJLSFoJCTB4ZQogCisvKioKKyAqIHN0cnVj
dCBzdW40aV9zcGRpZl9xdWlya3MgLSBEaWZmZXJlbmNlcyBiZXR3ZWVuIFNvQyB2YXJpYW50cy4K
KyAqCisgKiBAcmVnX2RhY190eF9kYXRhOiBUWCBGSUZPIG9mZnNldCBmb3IgRE1BIGNvbmZpZy4K
KyAqIEBoYXNfcmVzZXQ6IFNvQyBuZWVkcyByZXNldCBkZWFzc2VydGVkLgorICovCitzdHJ1Y3Qg
c3VuNGlfc3BkaWZfcXVpcmtzIHsKKwl1bnNpZ25lZCBpbnQgcmVnX2RhY190eGRhdGE7CisJYm9v
bCBoYXNfcmVzZXQ7Cit9OworCiBzdHJ1Y3Qgc3VuNGlfc3BkaWZfZGV2IHsKIAlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2OwogCXN0cnVjdCBjbGsgKnNwZGlmX2NsazsKQEAgLTQwNSwxMSAr
NDE2LDYgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgc3VuNGlfc3BkaWZfZGFp
ID0gewogCS5uYW1lID0gInNwZGlmIiwKIH07CiAKLXN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mg
ewotCXVuc2lnbmVkIGludCByZWdfZGFjX3R4ZGF0YTsJLyogVFggRklGTyBvZmZzZXQgZm9yIERN
QSBjb25maWcgKi8KLQlib29sIGhhc19yZXNldDsKLX07Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3VuNGlfc3BkaWZfcXVpcmtzIHN1bjRpX2ExMF9zcGRpZl9xdWlya3MgPSB7CiAJLnJlZ19kYWNf
dHhkYXRhCT0gU1VONElfU1BESUZfVFhGSUZPLAogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
