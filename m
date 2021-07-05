Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E43BC336
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD7D16D5;
	Mon,  5 Jul 2021 21:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD7D16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625514176;
	bh=r2d7hz6CaMOA9hIyHT7KzsUERCqR5aCXm8BZlxxWcQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrUB8SAgLAfun2Pvm2/Z8nksXchy7wsRs+yyYiMyCHhIiRnn0j31Fsys0Iw/e4rd3
	 MdVPx1RCtwm5nQLobewGKxdHOWz/OiZzWVzGOLAYyuyf3W39Dfuz1RoZ15jkcLhgon
	 TZ+K/2Mq2OJAKJ8ANRb5hRIJcmjyDAT02P6Aoj/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13594F804E4;
	Mon,  5 Jul 2021 21:40:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5067EF804E0; Mon,  5 Jul 2021 21:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4922FF804DA
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4922FF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K/3hCros"
Received: by mail-lj1-x233.google.com with SMTP id b40so6174852ljf.12
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
 b=K/3hCrosFdpUbTHdtCDAWPK55w7YXi114gMvfr6QFGBsNZ9I8ctS6xNowG1DyDFCOE
 5MgAGVcNPI15zGyiCIYnPXW9ZvgDx9kGiUG4NLte6GGPW5XIlaJrCbBzdq02EXOfuuAO
 nnSJEB8Ewg4i/OjKaL+aPJV+nQTXhfWBTa4iGV/B05IcHWIbKU1v7GZwrUN+RWCIIzds
 Q9uIt5u3ij3zx6vaPN0bOwPWmw2amqE81kgegvXDR74wrpq6Nk0Mf9PnrgnPWV7itT+f
 PSV3u+dQB/zBr8680yZLvPoyrOHAwFZ3LvvVzkrLuEWgZT5SAFW0gHDHRLEsthHCnLve
 jkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
 b=YilD1GxumuCMLg9K3rAJovCd56SIC9/aYvkxCvTy+sR28yg8oFqywlTny5+9Ha4h8J
 2gFTigjWbEAZZEu6nq6xPzJGd0C9h+ajEoJM9OEO+2zZAVlFx8sBkJE6qbcYzgae9ryk
 GRXeSLl/DQzZgTCnOdwU+9MNuymfdtTBkIb6cklP4LcNCvw/38o90nU6PYKuftiHW8op
 jkq9WaGfL5jr2Cy/AbxngUM1gPWRxbhRXovtr7KNqv9jvU5Pp14VF/AoU25Hwf2imlG5
 +DrBEgWmfTLi06Gq1D6y9KMWpg+S5+2RzABHb9JZIiy1bTLaPmlGY2QWPdYaddGel/Gm
 E6/A==
X-Gm-Message-State: AOAM533s7Wwr40PVk9JkX3b7nEwZC4BLCih1zaLG/MX+T4Qv56L8EB2I
 oiDkkf++lh3AH2Ws2bzW2YI=
X-Google-Smtp-Source: ABdhPJzr0skanV+K7S8YxGJQYbDceG65gegEXC37d2KrV7inNrK+bn0IBtMHYTLGoV8cFXUro1cVyA==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr12312217ljh.443.1625514033638; 
 Mon, 05 Jul 2021 12:40:33 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 12:40:32 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH v2 2/5] ASoC: dt-bindings: davinci-mcasp: Add compatible
 string for OMAP4
Date: Mon,  5 Jul 2021 22:42:46 +0300
Message-Id: <20210705194249.2385-3-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

OMAP4 has one McASP instance with single serializer and supporting only
DIT mode.
According to the TRM the DAT port needs to be accessed as specific offset
compared to other devices where access to any part of the DAT region is
valid.
To handle this constraint we need to introduce a new compatiple string for
OMAP4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
index c483dcec01f8..bd863bd69501 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
@@ -6,6 +6,7 @@ Required properties:
 	"ti,da830-mcasp-audio"	: for both DA830 & DA850 platforms
 	"ti,am33xx-mcasp-audio"	: for AM33xx platforms (AM33xx, AM43xx, TI81xx)
 	"ti,dra7-mcasp-audio"	: for DRA7xx platforms
+	"ti,omap4-mcasp-audio"	: for OMAP4
 
 - reg : Should contain reg specifiers for the entries in the reg-names property.
 - reg-names : Should contain:
-- 
2.32.0

