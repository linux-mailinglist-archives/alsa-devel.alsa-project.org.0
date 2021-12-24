Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4B47EC42
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:49:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1575118BB;
	Fri, 24 Dec 2021 07:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1575118BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640328572;
	bh=CX/kN1X2EeI+U9SJQY52OkxmlJkFSb3hqPAHEVVu76U=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7ndFy9NFHV274sb23HhaGr1CnKcDYXzv6stjaWCjCYnI7H/Rjjd2wf1ssCQ5V2b/
	 Wm55T803Hzva5MsONc22x4rWUnOrosCpD0Zazu5iNqwjQbs997AyiEKYfSGYzoomjC
	 cDa0iHRHjpXLwUpbV5Vm56oh7u32GyilCslOYW9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B1BF804EB;
	Fri, 24 Dec 2021 07:47:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 816F2F804E4; Fri, 24 Dec 2021 07:47:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F84F80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F84F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Q4Wm0THv"
Received: by mail-yb1-xb49.google.com with SMTP id
 e131-20020a25d389000000b005fb5e6eb757so13912747ybf.22
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=bHVXJypXN3aOoXE4Ah+y2EklftG79QfVrX/zH0Pv2ck=;
 b=Q4Wm0THvk0DiCn6qErDlkC3kMwS9Bh1qSSJG/PYqVJqzWZW65pyd+9m+zssfripzpZ
 JGd8N9+eESOMdZIQU2irrkLgBIANba1Kj6cVqau7TsvM4xAtzxamqBeu3KW15o+wHLI4
 vLxI5Nq1BvGmJ5G/nGSfKIJowBbH/bKvMekWJ0qBRi7skwhmqCi+SuzwcCtjMU5Osv8z
 YynwzIyxk/N9VvDIYZYIrXcRisX5eyMhAxs/vPZvIz4Fk+DL5wOJOkxvgRlViNHTZQmY
 PotXTAhZMvxXqf8R1Hx5gYi7goz4NpozbEsLOw0GfUQnPhir5Z5F3MiNg5oljh8cLFWA
 MPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bHVXJypXN3aOoXE4Ah+y2EklftG79QfVrX/zH0Pv2ck=;
 b=3ZZmmvfFgirjUmztk+Uo/J3mSFxap+PjyVSsqP9UUEhbcI/puiq3wdKz+dxSv/A6U7
 +GDE+LNoezVnsBjG/OYkt6p/vlo5h5i59aBI/ltgD0LTJwT26ogFOH7PCLsOsT9xfnGi
 lo7d5N5ZFlV+XKAL4+F8JTKMHUSYYCJRHhi2cQQI3nPfwlnKHnZtXqz6+uGAmGojGyqc
 b03FPGr/McM1e7EDxuD7lwhhg3DqOt+Wzsk/IuSoFhr1RnsJ2gd48vD5gFJ889r75tAx
 RMu4LwGHqTs+mZq6FXrwvfBsVtJaEqYeqw2fgF8U+VwEVvefgqpM+JLwMvizKqJ2mlXQ
 glqg==
X-Gm-Message-State: AOAM533Hu+KHzfY80uwrrNlBTPiZbjXfNngtXvlaY588uliE4E3lHbbM
 zdZyEJ3eLJxcHxkoVY82OLaU6xHgsBm5
X-Google-Smtp-Source: ABdhPJyMT0R1eoun15Pt2V4z3nOy1KUmjv9Iz+9jrK99rHPW+hMKomTjOgedPCOMHI5/2bbTmKg1Nz8RCqdC
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:af4e:fb49:1227:527b])
 (user=tzungbi job=sendgmr) by 2002:a25:bf86:: with SMTP id
 l6mr7371605ybk.92.1640328468177; Thu, 23 Dec 2021 22:47:48 -0800 (PST)
Date: Fri, 24 Dec 2021 14:47:17 +0800
In-Reply-To: <20211224064719.2031210-1-tzungbi@google.com>
Message-Id: <20211224064719.2031210-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20211224064719.2031210-1-tzungbi@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 2/4] ASoC: mediatek: mt8183: fix device_node leak
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
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

Fixes the device_node leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 6 +++++-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 7 ++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index f8a72a5102ad..ca893feab7eb 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -781,7 +781,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index d5fc86132b49..19f8aead775d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -780,7 +780,12 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 				 __func__, ret);
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(ec_codec);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1.448.ga2b2bfdf31-goog

