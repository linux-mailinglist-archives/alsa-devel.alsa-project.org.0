Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7CDE0360
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7721680;
	Tue, 22 Oct 2019 13:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7721680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571745022;
	bh=yzbXwWHzHqkImDcCWtFGNuiuoJYYBC1wUUr8D2TodCc=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6PWHltltaRVctJhipJPLBB22msyLASkwq+nxtg3cjGTDNbHKXC0jaW5ENglWcUD4
	 OtJFlyC/ytO6GICo4XRdIXvDTeOcbD0NSrxktFSEuNoNM6HaKAM0/VK4mTPja1A6U7
	 g+xjKKRinBx0Ww3csTidP7/hnzP7cwLilyv9kemk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF01F8060F;
	Tue, 22 Oct 2019 13:47:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC6ECF8060D; Tue, 22 Oct 2019 13:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68008F805FF
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68008F805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rWB904Gc"
Received: by mail-qk1-x749.google.com with SMTP id s3so16398069qkd.6
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
 b=rWB904Gcs2qVJZUdeAyoeepfzKedgnQjJZ4jfO3wA6WjqYb2giKU5Pzx6ySfLtL2A0
 C6G6kK2HU9Bq/aW8NNHtf4gVgn+a7FpdApE4JmhpKiKxDBdyJd5ELjOwCOUHnqAEC6ju
 p9UzXTH32R+O8Ob6C2dZTmDtGa3SCOUtc35f7m5G7APRhN3dqXcFTbK7RaQizelauCeW
 iMcqQAFx9SxO10nufCXxuspyLOK8zXPgo1FF7o2TKgZuNIcuq0cEjSqoZFlV/sw3o0ES
 qitFE0wo1hMeoSthzVhddP3lGNji2i8tKc+iG/apvGVcxGXfpqXwlRRIQTE4qIxwHAd6
 DFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
 b=gv8KXtom40KDqbZ6q/JdX5irPYpbHp45Ogc19NUVVBsG6IxwTLSRpiXxVphHqxKIzJ
 1IUsZ8/GTLZGPaDEUFbnT8PBWbrxCzIkUB10LX4Njng8Bofu8SqtMos7yHJJ3uA8TX19
 jZ8Ya7TfWyHslW4F2LJEYJVjXglCjrfEJzQ9baSrHUjrJeNa33gVgMWDHppG4qn0GCY7
 CPGayHqNgYxIXIIplnvl/bUdsvhXp7qRVE5Gdt+pRcwnKNwCTHK+QG/1OuMnyoexfnpm
 i+sK+gn+MgUiNDsiIy2tbi3JWLNA4VrxcLkaYOH62/pZVIRxcFRjb4vpSreA7P5YILJl
 nfcg==
X-Gm-Message-State: APjAAAXy3dpuruqxwTvC6CeXsMD3cUPpytnwMddQBaaQC5FbCA22mLvj
 BIX0mI2oXgk+ef8mECA0AvcgaVhL6sJ7
X-Google-Smtp-Source: APXvYqwP2XO0+wPKaNKqstjcgNhdUynq5gHMc5aDViFMW7a988Y2xcf+1D8ZFjFrBT2cjoj1ZcA528RiWWjN
X-Received: by 2002:a37:8dc6:: with SMTP id p189mr2474821qkd.132.1571744819983; 
 Tue, 22 Oct 2019 04:46:59 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:02 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.3.I37696eb1321a21846f9e5a9eb14dfac7dbe10663@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 3/6] ASoC: dt-bindings: mt8183: add a property
	"mediatek, hdmi-codec"
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

Add an optional property "mediatek,hdmi-codec".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index decaa013a07e..cc2845287e61 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -8,6 +8,7 @@ Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
 - mediatek,ec-codec: the phandle of EC codecs.
                      See google,cros-ec-codec.txt for more details.
+- mediatek,hdmi-codec: the phandles of HDMI codec
 
 Example:
 
@@ -15,6 +16,7 @@ Example:
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
 		mediatek,ec-codec = <&ec_codec>;
+		mediatek,hdmi-codec = <&it6505dptx>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
