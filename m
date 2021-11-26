Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A345F1CD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF131AAC;
	Fri, 26 Nov 2021 17:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF131AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943941;
	bh=taRbsqCzWB1a5KkmqBumvGryO0mM6cypNDIK6Sc4BAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PReVIPjBCUUNPPcwhKLQIgBcGgCVSqqCImH23Pj/E/pH+ClEENdB8agyppW0ituaf
	 pCnEfVgYIU35plfKQDgiwWCI+/0KHoc6rcLvMYPvJl0LFxw3l+bdLG5k5dkpzJLgd8
	 foJ4Z7Az2pQWRQqtPicnEkdSI5mMH7vxu6EU7ipk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6A1F80551;
	Fri, 26 Nov 2021 17:20:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18516F80511; Fri, 26 Nov 2021 17:20:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F17C1F80245
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F17C1F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X6Qoj4Zh"
Received: by mail-lf1-x12a.google.com with SMTP id c32so25544092lfv.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
 b=X6Qoj4ZhOaFBVDQNFBnNR3t7hp3vEEwXxbZern/ZQbYxgqUJYv4AScqsBuJ73e8Iby
 b6E0g8zTh8Ng/vTEY3BcjX16mLYX382sMlU9jXdUYddolleHq7Xju1SpglbeiuhvA9ec
 YuZLhkDakLWze9cNl+YPU/YT1VzdtplEB2NEecWCDsIYOxqpDO2ha7KDmSIcqIAJXUZp
 OhOaJr1GcLXGkqwtQVVaCapj+6ctuujv2PmNvSXgoPxH2/bpqFnV4sapVVWlOLXy9URc
 tvfjGlP59XQiI5qHUcO12udjNLUkgbj3u/sElqUWZ2aOK3TJPibHLClSyKI+Ge6ZeyCS
 n1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
 b=njsqquOTMa0IO1lCxGyBMaAq+gJwrYxklgwKD0g/UdM6SL+3PRQ+tfbsKxV6HzGltL
 ihrPqz8ir9bCCxSt8vuhkyqyW2nhqhfayZToyqL34j3zHfyxyOFq3J+qhaLSdGq/6UXt
 YYqrLV2/vDGR+NJASboBwCvNWs9WAXq/ZaAovJOn8I45ovGoHbH3vKdo0yZ5W4ppky0+
 GT1xoq6UacXAyXeSDtqHrWwhoyKQoIKot8dvn28VL3s+iTTGeYDeIVxMusbLyxuh9Lb4
 TPTcyTaxR1n50zev+3JKxVtHVANGicmyLRWY5AaJ+zNivW0Nb6niCtS4/KQ7eQQQTqiW
 ZO4A==
X-Gm-Message-State: AOAM531ScawKe/20jE/iOuU1tOXomlGzCzGIK4MYIU8Oeu7AOn/7++K5
 VTR+xg5YPF/ZWXUI2T+agrg=
X-Google-Smtp-Source: ABdhPJx1S5VSCeVt+lhrxJEnN4E3jZNeyvTZuhJ0KfH/4BlVMHy6qUL8X955jzS+e6Uo1LAS9fS4Qw==
X-Received: by 2002:a05:6512:1296:: with SMTP id
 u22mr30661465lfs.296.1637943594114; 
 Fri, 26 Nov 2021 08:19:54 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:53 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Fri, 26 Nov 2021 19:18:01 +0300
Message-Id: <20211126161807.15776-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 9a87d351a828..142ad696426f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

