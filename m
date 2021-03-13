Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003433A1E9
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 00:22:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3C11739;
	Sun, 14 Mar 2021 00:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3C11739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615677768;
	bh=RaP6mjUh/PneOcS44BV+vw4HPn3nz+vkyp4yZdn7Bq4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j5HwXIqJVHs4Sit+WOyRwm/8+hDxjw/28QhB9Kl2fKdwTZbg9Vxy0S6to+OTeHEvU
	 44uJH8OzHSPiuWuy1ZDijHhHcFup/PuIphD8p0C9RbbfjHRgWkt73lM80o10IV6HAA
	 mhUIhqTrHSkOlHegm+CKZuxwodetRcbHNfhDEbwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 911D6F80227;
	Sun, 14 Mar 2021 00:21:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 682C3F80227; Sun, 14 Mar 2021 00:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC69FF8012A
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 00:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC69FF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V1flZnjJ"
Received: by mail-qt1-x830.google.com with SMTP id l13so6717087qtu.9
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 15:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPD2bSnWvbDrgLc8T8FiNAXhzdKx85WK2z6G0UHNxJo=;
 b=V1flZnjJUOSV40TEOU1wTcP4ynJNP+VBRjXEAMhy7slACxk6YKpxL7XjL+XUZoi8le
 o9p4l07PiyZ0k1EFXDDNS6fsX/wwqWTLAdcWzfavQ9yWgH9wSC/M9ME3J3skL9l2qHX6
 IRf5inhpiutM3WenpV6QLcRI5ZUOEnX/1NETriYNwGxmjqUh5hg2+qq8iAhf58FaprEr
 sLQjLzbvpgahSBeuUp8xfTyNhdZFwFlUMyCR8NjYdUHkhqwOgXwam7RcesDbiuSosQ3m
 l4DQld+5ZE8w+EwvhwAe8uj97M23tiigV3YoOhgY8bbH+Xs8UJR3SjsVD8ovJw2HNkpc
 30uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPD2bSnWvbDrgLc8T8FiNAXhzdKx85WK2z6G0UHNxJo=;
 b=q1MCD+6Q6M1yQz/KR50lxbCbZA9WERrgrUMz+0kZEI7XOOWela0sYsxez6T/Su7DUt
 6t/umXL8u1ESSZeSaIGwPA70afgU4BgDQ89cxGvwAOU3fICLJUk/zFvgtVDgcI3w2qPa
 ZHdbB73A3u0a09LRHy8oamd/IbaVd6iM+gjawdZbf2DdJt0/BI+Jku2kqVsW30MWDJ8U
 141RZdd4Dz22+4hQIno4SOxMDhwAI5WxLmHUFeQqxDEO9JjZRyipBTqxlbQ8HWT0ZG06
 9uvemYeh1YwJfd09eDfJqK/d05GwhvZrdBgdB0fMGr8GUYOCsmQLdtuNbl3iuQ2TCaL5
 6mRg==
X-Gm-Message-State: AOAM531W6SCTSeBsPomGtpQNoUzxbgZ+aAmWHyFXVpu01/hihivn4Vwx
 y98EAzA0xRu9MnFUenaR0wI=
X-Google-Smtp-Source: ABdhPJwNJB4MD1+fjjAgaeEZaXl0M+JmZ/u/trmLws+AkEeeKGkrESMrdqOuefSpQKnEj/K/un7YSQ==
X-Received: by 2002:aed:306c:: with SMTP id 99mr17329762qte.352.1615677668706; 
 Sat, 13 Mar 2021 15:21:08 -0800 (PST)
Received: from localhost.localdomain ([37.19.198.114])
 by smtp.gmail.com with ESMTPSA id r17sm6630360qtx.62.2021.03.13.15.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 15:21:08 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs: devicetree: bindings: sound: Fix a typo in the file
 rt5682.txt
Date: Sun, 14 Mar 2021 04:48:50 +0530
Message-Id: <20210313231850.17278-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
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


s/drving/driving/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/devicetree/bindings/sound/rt5682.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 9c5fadb6ac82..cd8c53d8497e 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -44,7 +44,7 @@ Optional properties:
 - realtek,dmic-delay-ms : Set the delay time (ms) for the requirement of
   the particular DMIC.

-- realtek,dmic-clk-driving-high : Set the high drving of the DMIC clock out.
+- realtek,dmic-clk-driving-high : Set the high driving of the DMIC clock out.

 Pins on the device (for linking into audio routes) for RT5682:

--
2.26.2

