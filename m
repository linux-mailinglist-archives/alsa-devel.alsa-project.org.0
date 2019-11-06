Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47675F0EE8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 07:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3CB16BF;
	Wed,  6 Nov 2019 07:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3CB16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573021784;
	bh=Yep73KZVdMTq4+aTHA9K9qQGCfkau/UwITpdt8zC0mE=;
	h=Date:To:From:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HJIddqe9OausCOmsErKfYlDjFuY47Go7+NLywgdpRYfjHUJtvs8tKQ/6RgBqL2KYQ
	 Hwz+mTDKot9dxm4/d7AkrQPStro5zS708OklmAX1tr3UwysrSnuREuml5LmBX6nGX8
	 ulE2exxL40+7xd2ZAsx61S7O1E5TVrtLjCADNOyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C6DF803F4;
	Wed,  6 Nov 2019 07:27:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55E25F800F3; Wed,  6 Nov 2019 07:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A6E6F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 07:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6E6F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com
 header.i=@kernelci-org.20150623.gappssmtp.com header.b="aTLsOLR8"
Received: by mail-wr1-x444.google.com with SMTP id w30so1584814wra.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 22:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=+f/nil2KcNNXA8az57lhYCTpyXUZt+dq0Bg8utXgN+w=;
 b=aTLsOLR8XKvkP09Cm88Qty3MSj8H0AdpWVfK7IXIBsbyXZvBgtBP7fE1FOUc6HMmQV
 MdbY9lLFK8ghS/SESrC2gtwjiLFkZW9cm10F7kIjxJQc/8/DXNhXGoPJbd+m1B43cqB/
 LuTLCPgNAgUgWQ7USx9FsPP0HxfOba/YnfHGBIvlxLLKomnTSoKaiHZVjkubAMmWZGA9
 4K8Of/X9REoxmRvSKFzqiQptpOvEGBxJysI5PynIHJEJo7+oTbW0Aq+TAO+y9lqROTMg
 NO5dCI0qFrxGS2kwGe9hCQw+HZER/tTUWjhap3zwUWmeOg20mI4m8KUq+REdKHlToXOs
 f7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=+f/nil2KcNNXA8az57lhYCTpyXUZt+dq0Bg8utXgN+w=;
 b=ECZfJE/exAL9eA2ntpFqP4lKU/4HZPvw852VbPwIDNc0VcH5afdoXI11hfrw0ZcdOZ
 tfVZ5uNycg2AQkWjWTO4DfFvtF1hEDVMNgMyvV8HN+u8aubUQrSPgB69ipfmFnC2IP+6
 s/r4sHnVc0FA990tYyfRA4oHuE060vMifDLiN3MxTQQyUfwq1BONbTqcB2/WWYaCEIv6
 mjagS7nXJN/OwXjeXEtbXhY+S2KsBL/UAY3Vn9NhZWvKGEm0xlU/eTcXEL0B8NCzKEeg
 WTXFIWEznBA6yIEaB6b7SFmmUTrU5kj8x2fsfyWlI5YNhJiMj/nuWNfNsEJYy5tb7kwt
 tGZg==
X-Gm-Message-State: APjAAAUcXmKewP7J7J+njKrVN/AzQAiBD0hFkXcJiDpx57n+zInJgR7p
 dColzpQyggpnRA6eoQabIptq7A==
X-Google-Smtp-Source: APXvYqz6P5q5So52dKSs2wpTTJBgXtQgtXoxAH4VNw3qFZ3E2lGPWwjIbwQBgaJ2j4ai0xiM7MiOMA==
X-Received: by 2002:adf:e386:: with SMTP id e6mr905440wrm.397.1573021671687;
 Tue, 05 Nov 2019 22:27:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id l18sm26812563wrn.48.2019.11.05.22.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 22:27:51 -0800 (PST)
Message-ID: <5dc267e7.1c69fb81.496da.9bf1@mx.google.com>
Date: Tue, 05 Nov 2019 22:27:51 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Tree: broonie-sound
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: v5.4-rc6-292-gc1efaea10be0
To: Mark Brown <broonie@kernel.org>, tomeu.vizoso@collabora.com,
 guillaume.tucker@collabora.com, mgalka@collabora.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com
From: "kernelci.org bot" <bot@kernelci.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] broonie-sound/for-next boot bisection:
 v5.4-rc6-292-gc1efaea10be0 on sun8i-h3-libretech-all-h3-cc
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

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

broonie-sound/for-next boot bisection: v5.4-rc6-292-gc1efaea10be0 on sun8i-h3-libretech-all-h3-cc

Summary:
  Start:      c1efaea10be0 Merge branch 'asoc-5.5' into asoc-next
  Details:    https://kernelci.org/boot/id/5dc218e159b5142346138dff
  Plain log:  https://storage.kernelci.org//broonie-sound/for-next/v5.4-rc6-292-gc1efaea10be0/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:   https://storage.kernelci.org//broonie-sound/for-next/v5.4-rc6-292-gc1efaea10be0/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.html
  Result:     ac6a4dd3e9f0 ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       broonie-sound
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
  Branch:     for-next
  Target:     sun8i-h3-libretech-all-h3-cc
  CPU arch:   arm
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     sunxi_defconfig
  Test suite: boot

Breaking commit found:

-------------------------------------------------------------------------------
commit ac6a4dd3e9f09697ab6a1774d7ab6a34e7ab36fa
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date:   Tue Nov 5 15:46:51 2019 +0900

    ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()
    
    snd_soc_unregister_component() is now finding component manually,
    but we already have snd_soc_lookup_component() to find component;
    Let's use existing function.
    
    Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
    Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
    Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
    Link: https://lore.kernel.org/r/87zhha252c.wl-kuninori.morimoto.gx@renesas.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bb0592159414..0ce333669138 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2876,29 +2876,19 @@ EXPORT_SYMBOL_GPL(snd_soc_register_component);
  *
  * @dev: The device to unregister
  */
-static int __snd_soc_unregister_component(struct device *dev)
+void snd_soc_unregister_component(struct device *dev)
 {
 	struct snd_soc_component *component;
-	int found = 0;
 
 	mutex_lock(&client_mutex);
-	for_each_component(component) {
-		if (dev != component->dev)
-			continue;
+	while (1) {
+		component = snd_soc_lookup_component(dev, NULL);
+		if (!component)
+			break;
 
 		snd_soc_del_component_unlocked(component);
-		found = 1;
-		break;
 	}
 	mutex_unlock(&client_mutex);
-
-	return found;
-}
-
-void snd_soc_unregister_component(struct device *dev)
-{
-	while (__snd_soc_unregister_component(dev))
-		;
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [a99d8080aaf358d5d23581244e5da23b35e340b9] Linux 5.4-rc6
git bisect good a99d8080aaf358d5d23581244e5da23b35e340b9
# bad: [c1efaea10be0d91b6986af5c14cd3482ab160981] Merge branch 'asoc-5.5' into asoc-next
git bisect bad c1efaea10be0d91b6986af5c14cd3482ab160981
# good: [1092b09708882e3c216f0b9c02e606b3c0942c5b] ASoC: tlv320aic32x4: add a check for devm_clk_get
git bisect good 1092b09708882e3c216f0b9c02e606b3c0942c5b
# good: [f03412b78a947857bbd20899e1423482fba55761] ASoC: rockchip-max98090: Support usage with and without HDMI
git bisect good f03412b78a947857bbd20899e1423482fba55761
# good: [acbf27746ecfa96b290b54cc7f05273482ea128a] ASoC: pcm: update FE/BE trigger order based on the command
git bisect good acbf27746ecfa96b290b54cc7f05273482ea128a
# bad: [e443c20593de9f8efd9b2935ed40eb0bbacce30b] ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()
git bisect bad e443c20593de9f8efd9b2935ed40eb0bbacce30b
# good: [b8132657990b5a09ad8e1c9e2c8efc20b5f9372a] ASoC: soc-core: move snd_soc_lookup_component()
git bisect good b8132657990b5a09ad8e1c9e2c8efc20b5f9372a
# bad: [ac6a4dd3e9f09697ab6a1774d7ab6a34e7ab36fa] ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()
git bisect bad ac6a4dd3e9f09697ab6a1774d7ab6a34e7ab36fa
# good: [486c7978ff665eb763f70cc9477e0de6326e1c41] ASoC: soc-core: add snd_soc_del_component_unlocked()
git bisect good 486c7978ff665eb763f70cc9477e0de6326e1c41
# good: [b18768f56162964f70bbb9119dba59a947d7d577] ASoC: soc-core: remove snd_soc_component_add/del()
git bisect good b18768f56162964f70bbb9119dba59a947d7d577
# first bad commit: [ac6a4dd3e9f09697ab6a1774d7ab6a34e7ab36fa] ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()
-------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
