Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385C1EF017
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 05:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9BB9166E;
	Fri,  5 Jun 2020 05:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9BB9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591329104;
	bh=o8eN7Ip3GhPQm9+q8UAF124M82JET3zPFcT2otbA/aY=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AomAnHWElRCAMoeaY1BQ6PCttyq/AkO5yF64nMMrTprLOxTutB0RkxfDk9p7y+fIi
	 VPakmCqTEULnDipabH2AGFAdZ1zF/8uGgW9cGmpaSYk9IgNwUniwkluLx1GFX9tiHb
	 TNVwKtsECxyeonqFaRSxyKahHb6DzbA2zO2HC9gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1717DF80108;
	Fri,  5 Jun 2020 05:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D745F801EC; Fri,  5 Jun 2020 05:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E459F801EC
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 05:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E459F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iEeR6W2z"
Received: by mail-yb1-xb4a.google.com with SMTP id c3so10486686ybp.8
 for <alsa-devel@alsa-project.org>; Thu, 04 Jun 2020 20:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zUE/Cjgd6DbqupxIZO5zw+HWjN1NKeI0i0EBJrWyE6E=;
 b=iEeR6W2zBV70R/bSFM5f67tGDL5bjIdJVzxdVKjDRIcswzlpTMD2r1+VhZH215sTeW
 ARcypWqIcdFd7pBT5fHJpqMwUukfjyIpUpNkoZExv3yWU8/vXgAemGS1w/ZB+9i0EC2w
 NDclYfYgUW4QFI6vBRl6kmjj2DBBF49gdLpf0/vCA+Fa70gh9btjmLGqyGlBpmny7Md3
 9SoUMsOya1hV2THbF0/91/RKedBrppN+A0ePooopPRyO4P/nmu6bSAYv7MTLtjxWI60k
 6kIpxuT2Bmod7HwnLbo1l5dFYMy1TtOBONFm7hOi9JYmK5JBgGiCga7cnDUrBPC+Q8Hm
 86aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zUE/Cjgd6DbqupxIZO5zw+HWjN1NKeI0i0EBJrWyE6E=;
 b=eDe64VfpCiyeaxr3ELIRfkEOg3Z5LRT4DPl/1V82GurWDGig8EGlfOEctLFDf5nabr
 EqbYj3HO4joQmVXFRf0hhhaTqM6Y0Lktg/w4GXyEyrIspp9MGN4yujj7n1y6IQm55HXf
 D+vNCWczlXlsUzqhpFUGQbeeRhpZaDqaZVov9zfdYq5TwqzJaoDk/YJ+C23GUZykHnpL
 v0rAHYmT4D23Ff4TJronRLp3mm2d53lIxi+lneJXNgfpoy2gWY5Z51MbwJzwpvpFeFYu
 vz86x1d9zkgyDe2B7faAmETm/Uu/AurZETIvgE2bpR0nqK7yw19dUDuAeMCVzjHUzX8q
 2TdA==
X-Gm-Message-State: AOAM530iINKBi0CAFmT1lVv6w41mhop/2wrXZC3j+yt0hykoiNaGMITZ
 wOV7AFouwdFf8w8XENchhDTcS65PLdJ4
X-Google-Smtp-Source: ABdhPJzO/LSnH/eEpFBjZnM01ecU94C3EIsJHao8zGgAC2ui2MTGomIhL7w7dptKMtO9fpRBcKf7amP1I5Uo
X-Received: by 2002:a25:ba03:: with SMTP id t3mr12723512ybg.425.1591328987534; 
 Thu, 04 Jun 2020 20:49:47 -0700 (PDT)
Date: Fri,  5 Jun 2020 11:49:30 +0800
In-Reply-To: <20200605034931.107713-1-tzungbi@google.com>
Message-Id: <20200605034931.107713-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200605034931.107713-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 1/2] ASoC: max98357a: add compatible string for MAX98360A
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
Adds compatible string "maxim,max98360a" for driver reuse.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index a8bd793a7867..4f431133d0bb 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -125,6 +125,7 @@ static int max98357a_platform_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id max98357a_device_id[] = {
 	{ .compatible = "maxim,max98357a" },
+	{ .compatible = "maxim,max98360a" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, max98357a_device_id);
-- 
2.27.0.278.ge193c7cf3a9-goog

