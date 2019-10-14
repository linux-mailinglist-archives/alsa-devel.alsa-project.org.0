Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D19D6027
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 12:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A15D1666;
	Mon, 14 Oct 2019 12:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A15D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571048924;
	bh=jc4r4Gv0krFPuw/jFFn+DenfIYIla9fwqvJKTUWvLuE=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U8NGFtcOan+fNX1Xx2E5zz8YSjVvt8Rdy1hszXqZkHx9QJH2SbMHZjoxJxovDZTg1
	 Ca094Y0vZxfwQPu+Of39sEAOgxh8LMK9kjj9SpXg2EHenMc82GDHnCkzhzHRyKWIQL
	 yP3Hv9pI1qyQyvh8mGdUz00Kh5o6bVRqxv1hN1EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC04F806F7;
	Mon, 14 Oct 2019 12:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88804F806E9; Mon, 14 Oct 2019 12:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08A47F8067A
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 12:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A47F8067A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Yr85AqAv"
Received: by mail-qk1-x749.google.com with SMTP id g62so16471676qkb.20
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nmBXtRd1btomJP4ZZllwxH2lrIxzbkXaw1IqhxBhTF0=;
 b=Yr85AqAvJWBmDneXiupilpQx+CJWMAHGLVwqp+9mtGkG+M+8SNjBKyvtglcJoJ+v4g
 xAK5fQ93ys6lrzgSKpVVoidvYpfWsN5vzeNuQVI6TZIfFZbYT99RJLKfJykTh6mObtWu
 ICF0JN7qO+cc3hjN3uo+uOZFXt6D8oETVFwQ+vDXOnaGaP+vQ8bbjmObSUNtBCGD38gX
 AU4AQCWgKC/mIESbHX97LX+d3uUrLn7ftAnuArN+QxUoCu49efVRoPptcvjdvxXhDisL
 S4ufTsVPvIVu1tF3qKoFwJx4ilgq566mgVkklcv6SzBV1J7B84KZpVkhj1hemtwRqLTc
 a3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nmBXtRd1btomJP4ZZllwxH2lrIxzbkXaw1IqhxBhTF0=;
 b=Q9IU1tW7hb+nBpKIHX0aX9XFMjGVS62F01kjw1rCDxSsXA3qn36SdE3CAO4enLhVpX
 lkvaJ+VJARUas4807eMn9uSlhTdWIKhy+8ZHZpAUQZrsWrCvbRVWGTSCdMC5IUbCryF0
 C5O20lEQfnjQVbCbJQIdMlzZRWqz8pEo1wzJdgUOS7MAVwfw/LFmfVAvuB+G47UaS50V
 U0iixeZlnqhuxXQsZMzKgaj7yVrg8Pwe8wUtCAZOBftxntdzWF34uJrH9V2q6DN35BZK
 7yviTf/34FrItev3JY5of1a7nMFWKfODmfIjoLJ4Z7FFfM20Ad/WXTWIn0Zgk5WwIFdt
 korA==
X-Gm-Message-State: APjAAAWKk8bByWNY6gwtTC8lgfI0DkLxPJV0OIqS89RiVN+2Fd8nYyA6
 8mdqwjdA9EyOwmQIizXet0L4T1qaTi6i
X-Google-Smtp-Source: APXvYqxCQxEF4WkRp3fE1f3Ve4rBD9HVpeROxjrJ3RzKYMNtIFWmpMLXZIcX7NU71OZRYFRGUS1onV06xzdL
X-Received: by 2002:a05:620a:a8e:: with SMTP id
 v14mr29790321qkg.215.1571048483769; 
 Mon, 14 Oct 2019 03:21:23 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:20:21 +0800
In-Reply-To: <20191014102022.236013-1-tzungbi@google.com>
Message-Id: <20191014180059.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
References: <20191014102022.236013-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v3 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
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
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
