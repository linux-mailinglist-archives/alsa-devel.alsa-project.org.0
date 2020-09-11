Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF1265720
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 04:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28F8166C;
	Fri, 11 Sep 2020 04:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28F8166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599792685;
	bh=+7XPOf8k5zb89pgz4nbiePGnw3IRzf6dziKyfdZ0i6c=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVggimNN0tlHghc+cLssLReG5YzbHpJ0tv2tUR43AOvzztSWDlPx8ZtmaOr7s+jq8
	 HawUfOXzI/qoQ6XOYuUtpXPqFlcKVOqRsIOrxHGDg80tAA9MvLJRPDXBtomKqkfiZk
	 zBQz2qY71I4vZb03AVvIAgD5ox2nYq3lxhAGQVkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA47F80256;
	Fri, 11 Sep 2020 04:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1736F8021C; Fri, 11 Sep 2020 04:48:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C54CAF80227
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 04:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C54CAF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EqW17f9W"
Received: by mail-pg1-x549.google.com with SMTP id k9so5069149pgs.20
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=4pIPobb5AlgUGEMfysrRJHFq6zLtRtS5EYu72+YPbUM=;
 b=EqW17f9WxN1mDEFhB/Wlj2aTOV0oShJcWsNESsBp4Hng1bSJaPNXH95M2pYVuYqzXN
 KCX5EdsNNM+gHjNttBdt6Qu/7bgXLzqUgCMwX4WsA8hVmERQ1s+NDAZhSewIiLG1uGMP
 ADD5IKd+PXLYgz5W8GrwnchdZswZVVN/A3N1UgKMLu7q0Wer7dmf/9RjwKnuezlRlTRy
 lgh3xm0paudRTXqeaNXZ3MhNxYjr/Owieee5SbH92zNYMHRfZRsewY1nsj0P6JppKfrd
 9oRLgaUI8nMo7qEOBUJXupA6BIMENdI0SIedRfjPpyYFU9J7BdXBG3/CS/iMHtZ6jVPs
 J/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4pIPobb5AlgUGEMfysrRJHFq6zLtRtS5EYu72+YPbUM=;
 b=tPPpxLsmh/GQ1JxjwIk14xYYztQT4W/BdO6kvZ0o590eaDE/VBdFppn96HKBVO+moA
 d1Z7f0hd6iUgQd9YAMCq01mTTkzkVkrCs47mdOhvfmt/5an0LebbvB9yZMNkqhMqPvA6
 nq8kgae/LQe+ultjE8+pwBXB59hoFTNLmD1JHjlXW7fxq2TWwA95MSND8NFWV7eo5VPk
 DST6x0I1L7M0aDLc1nIibFYpQC3b5fp9QtCxq4zSfaGeG8TG0AWF6eivn820S8AUF3ec
 ErS7f+pFDeSJyUqHGE5x4ugLjLqKIrcj5vezF56yFe6ympakvaFdL8BZp+0kthM/cHpd
 CEig==
X-Gm-Message-State: AOAM533Sr8WwuGEtQVJrpJAtwcAgZsmb1acuXqBjKXXMJHhquZrvEoS5
 pkokTqS0YDIJUGHfR8RJilJIysWoAa0S
X-Google-Smtp-Source: ABdhPJy6essnKk+7oD+gP3wuNyoJ4kJ9U7Z/b6znYdo0xqyVr7uOCVdHo42opLwfPWFPjvac97+xFCELDrFR
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:6bc9:b029:d0:cb2d:f272 with SMTP
 id m9-20020a1709026bc9b02900d0cb2df272mr207398plt.11.1599792532293; Thu, 10
 Sep 2020 19:48:52 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:48:32 +0800
In-Reply-To: <20200911024833.1673961-1-tzungbi@google.com>
Message-Id: <20200911024833.1673961-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200911024833.1673961-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH 1/2] ASoC: dt-bindings: mt8183-da7219: add compatible string
 for using rt1015p
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

Machines with rt1015p should use the compatible string
"mediatek,mt8183_da7219_rt1015p".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-da7219-max98357.txt         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
index 6787ce8789dd..f276dfc74b46 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
@@ -3,6 +3,7 @@ MT8183 with MT6358, DA7219, MAX98357, and RT1015 CODECS
 Required properties:
 - compatible : "mediatek,mt8183_da7219_max98357" for MAX98357A codec
                "mediatek,mt8183_da7219_rt1015" for RT1015 codec
+               "mediatek,mt8183_da7219_rt1015p" for RT1015P codec
 - mediatek,headset-codec: the phandles of da7219 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
-- 
2.28.0.526.ge36021eeef-goog

