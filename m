Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1A336ABE
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 04:34:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767C81709;
	Thu, 11 Mar 2021 04:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767C81709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615433643;
	bh=2n1VC6mn8hlsX4paPoBYum7K9AakpkDVnInx++owXfM=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYP3BXl4TPcYPjjRzzU+xGjMqUSx7KzNEaisuAsgeIQ1MHfQQwIwIljoolOK5OZ94
	 SpetxPVAfMTFL68tXCJn+XliM9kdTqXAAFmxIfjXMgagmMuodOxtTqbs5ilwxEHo1A
	 pigC0ahg5jTykPmURV0uma1UdFSJjGhabmn6mrc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B825F80276;
	Thu, 11 Mar 2021 04:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645AFF80256; Thu, 11 Mar 2021 04:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4391CF80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 04:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4391CF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DH8ioX0k"
Received: by mail-pg1-x549.google.com with SMTP id y15so10629625pgk.1
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 19:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vWRGu6ac1CU71L1EhgQAbk5BTr1mdHtAx7TUA+9sOUo=;
 b=DH8ioX0kBsCcbAU16wET0Glx6KhyIunE+Qt6f8SLjou5bu5aYd2lCA0JmfAzwG5Rtv
 j8ViUY/95FCOD3HS76LSDt+PBTTitVAUqtBahQeCRA5yPR7Oh/+ABWDc81ma39Vy263a
 qsDDUb8hyR+uPuUt9m+LPkVtkoO2W8bCumDpMZOminhsfvQ6e1IZCdLqHdlxG9DMo9NW
 dOEr+rW4llfhEXhWvwywemTmG1EF6akV/hOxuVQj6g8/ejXvPDOX40aQAfbw2fVsgbzW
 RPprxJODNcMCPNAxMH9Pr89sRfGkXcxezikzzs/6zC8Tq+iE8t21ELLZ8PQpVOA1hBm2
 1vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vWRGu6ac1CU71L1EhgQAbk5BTr1mdHtAx7TUA+9sOUo=;
 b=FgVl7Z5is308VF/z+5xY56kk391rsgwQg4jMVTN/4kUVqjfA1jFp7a7FKsFgRKB48Q
 E28iZOuyolNEKDH8ydnAT6PABUzVtbbrPTSzqPx8jLddpuOKOk+dHj+X3hIGfcn4NnFd
 eWnXDECFu10WFeWZjsqt5xBwo8iABmB6vjDHCRe0ftG2zd0Ozd3DbC96W5Ql2lN45TYf
 bVJn3x8LWdFuTni8e6Nr2O/aP0WHpqsnNlfu6bpZLgHncEItUnOFsiUzCD1KbGkffKOt
 6VeB/H0z8l5Nq22krQfIfN9t4kzcT3kaBiW97rKUeXpJAe4iNckQEZjzuydCLL82HigL
 jy1Q==
X-Gm-Message-State: AOAM532buUZnbpQ88gjWuDKH7yROZz6q8r6HhkUoL3HbArJ5zdG2vaUr
 l7HL+oZK04GydtV4JYXmQz4IeuVM36t0
X-Google-Smtp-Source: ABdhPJz5Ft5tOEG5ExH9oG032AKa/Ybe6PIoGHTcorIO5zMUnYpUT6sF6LzhMsnfxpNXFERahWeBOd5p0M4W
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d958:2f3:afb:68a3])
 (user=tzungbi job=sendgmr) by 2002:a62:764c:0:b029:1ef:20d2:b44 with SMTP id
 r73-20020a62764c0000b02901ef20d20b44mr5580092pfc.45.1615433531788; Wed, 10
 Mar 2021 19:32:11 -0800 (PST)
Date: Thu, 11 Mar 2021 11:31:50 +0800
In-Reply-To: <20210311033151.1818603-1-tzungbi@google.com>
Message-Id: <20210311033151.1818603-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210311033151.1818603-1-tzungbi@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 1/2] ASoC: dt-bindings: mt8183: add compatible string for
 using rt1015p
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
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

Machines with rt1015p should use the compatible string
"mt8183-mt6358-ts3a227-rt1015p".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 235eac8aea7b..ecd46ed8eb98 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
                "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
                "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
+               "mediatek,mt8183_mt6358_ts3a227_rt1015p" for RT1015P codec
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
 Optional properties:
-- 
2.31.0.rc2.261.g7f71774620-goog

