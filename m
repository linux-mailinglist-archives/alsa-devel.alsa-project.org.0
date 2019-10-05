Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E337DCC84F
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832481688;
	Sat,  5 Oct 2019 08:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832481688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255594;
	bh=dgMBczG8n4eX59NRcsNeTAzspGgIHXeUjDFry49lhoo=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbtQ4+ed+dnvHZhm4I1FwnmZ5fZP5ScGSfPrlc8YeJMb/7hckVa0gLqpqN414ZU4s
	 Y7qjMYFz5eZR9ScAu6TYHy8S2fH4jdGcSajPpgkK70dgsiA/blr5r0h0u38s6iIjay
	 GXGHQm4ixbPTYp5K48fT8hgdUjO/MO7rXttgwBS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF14DF806F5;
	Sat,  5 Oct 2019 07:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC73F806F7; Sat,  5 Oct 2019 07:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDE2AF806F0
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDE2AF806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="hrALEg/H"
Received: by mail-qt1-x84a.google.com with SMTP id n4so8982107qtp.19
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qa8lzqL1R0bb0ynaHlYSrIGdb8PV3M5EMBcQMQXD2v8=;
 b=hrALEg/HmJ+RBF4lWI2dLrqiBrrs7sZA/d7m0qrc+yGchyARzfncsLzaSzGBuIU8ZL
 UWpgcF3zP14DCRh/RWgRZG15US8Z6o5hnN8Sk60a5IufhHdiwY40G0e5VO6nALCLFBn+
 tSi0AWFUgslLrus5/5P3Je4gX0nLD96IGzBMvmDl3z8MRz9yDjFStJHjlSzbFBOovRwQ
 GdbNRZxFQxlvwUsTNTeLUrpN2vT1tdvfPoRdsAxpqNrBB4ch9vDvf01x20MIneIkhAlt
 /sLojDnfpPo45316rmbmfvE/MS3iTPke10abVjbfp90b9gVwBWPlSDWsM13wJIWfnOcC
 AUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qa8lzqL1R0bb0ynaHlYSrIGdb8PV3M5EMBcQMQXD2v8=;
 b=VnObjV59imcKWQXomNfHqYzNsbg/L5RhsBnrjbdCDdHz31cWzzs/6h9LaTIl5BkolU
 w6JQNwxPDJqRhnrE1xqkno1/uyL8HIXCv6mBVeLIJulg2WmQJT+SXv2A+47+e2uFNd4f
 ppGqwJwEAANuEfhvIeq70xbOYv7Mf2+xps0hz+CztwWhZOKKvbVXsbEV0OHoaJmdz8i6
 KY6EuWZs6BiBoiilexjfmNdj1OfSjOT1Mh5PUwy7fQ0ETERQKC+xH+5fuGRUGvmL6JwV
 D56S8/cUV0Eg7mbk4XbZfx+xxDDXr42eTtwxlX/Yf/QVuYwU3QoD7R3sIX4yJn4OLvYO
 Gr2g==
X-Gm-Message-State: APjAAAWv0ZUn5YFgmLI5YNYsds5jcEXXftF+fspCKWqKWTeCvkaI18Q9
 n9DRhM9C0aGJ/3Xw+F6VnpF7lBr9f6V1
X-Google-Smtp-Source: APXvYqyADdkh+lHP8dRTBId0QoDCr/3kdmcRfZKzwDNBV8JzuoHxl6Bb9Z5JmrP7olAejzPd8rI8yjA0rUL/
X-Received: by 2002:a37:6789:: with SMTP id
 b131mr13603933qkc.314.1570255157630; 
 Fri, 04 Oct 2019 22:59:17 -0700 (PDT)
Date: Sat,  5 Oct 2019 13:58:07 +0800
In-Reply-To: <20191005055808.249089-1-tzungbi@google.com>
Message-Id: <20191005130552.9.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
References: <20191005055808.249089-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH 09/10] ASoC: dt-bindings: mt8183: add ec-codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add an optional property "ec-codec".  If specified, mt8183 could use the
"wake on voice" feature offered by EC codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 17ff3892f439..decaa013a07e 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -6,12 +6,15 @@ Required properties:
 
 Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
+- mediatek,ec-codec: the phandle of EC codecs.
+                     See google,cros-ec-codec.txt for more details.
 
 Example:
 
 	sound {
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
+		mediatek,ec-codec = <&ec_codec>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
