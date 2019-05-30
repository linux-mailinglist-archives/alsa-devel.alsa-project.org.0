Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B12F91C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 11:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D3E1668;
	Thu, 30 May 2019 11:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D3E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559207894;
	bh=eJBwSC841AzzYdsfg4ykXHw3Sgcl/xEfFwaGt9JLnuE=;
	h=Date:To:From:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p67uRkjSFEuBTKsRX9p7qkb4QlY+77y0oCnAeuM7S7v8TSq43FHQ3dHQvpX1USxuA
	 lOYqBqVLRnHFP41pY+nWYF2W2nnhFHkZoemPUO5alWor88yozAb+tv8qVRg3X7FTNb
	 SY/goh8z/CWumtk64Q+uBp7gATlRj+p3BvHRli2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C7BF896EB;
	Thu, 30 May 2019 11:16:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1094F896F8; Thu, 30 May 2019 11:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FC4DF8065A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 11:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC4DF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com
 header.i=@kernelci-org.20150623.gappssmtp.com header.b="T/zpFN2m"
Received: by mail-wr1-x442.google.com with SMTP id r7so3650286wrr.13
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 02:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=I1S45cdBL20CvsZSK3Vkt5vNQs2upcXyMnAlHyCghAk=;
 b=T/zpFN2mPAF3SQ6lAYgD6tKWR5rWJJKb+Vg78eR5EnH6kVWssEFzfrz7I2myTpjEdB
 uRkmZO+NoVexKFmHUeXkljCY5nm83dRV0RLjjrLfznDqneZnA9sWlGMJamwGwHCigzkE
 7+Alug2hguo3mnDp+AwCxnHvvkK15NWLUoixFH0SSYGC8rYghtuVOVtqfqCk5Hm1E9GU
 eBJ8gUfitrYtKDyJA0iUIUvWm3+Ea31uPaBLHH44p/Eta5cZ1lA7r3dUIkKybPRU5Ka3
 BAoMB1z/wGTYzDScpSzI43QCMknpV1PmB5x7nxwTrfXAa6sGKd7kJzpjfOBor6+SWLUV
 7X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=I1S45cdBL20CvsZSK3Vkt5vNQs2upcXyMnAlHyCghAk=;
 b=g28s1Si2gmx9IHmjaQ+NO7d/uW82WQieggfC2OuJTPl1+1aUZg7cMhQ8fCWL0u36jM
 Z+6f+/RDModUGTRWb29t6u6E8hx2Ro2rW+rGtXN0uRXgwJTLx1STbk9reD6LjgrHM6T9
 tDMXFyXS4K54AkvQfaVe9tKMyEW8a45qQBnPz1+D+mCfp3Hnw3nC/EtAyqrmuFkr+9/0
 Nqfz0dxLGUnTk2GH5pdorc2NFeq+rGqaf74ADbJkrX+qndDIV/Qnw/drUDnsBFuPuMMD
 rEu5N8eBPCO2fa+CsGvLtFnu+ijWWhzoy7eyWBf1+2ZQHQfm4u0JGsMcPHIEGo4fZXpm
 sHcw==
X-Gm-Message-State: APjAAAXQHEnghovroEr1hHl3H+aldGgfp8+htGeym840ySrpQ8axNZdn
 pDaeq8ZPCEa9VtNRuxLKwLQMNA==
X-Google-Smtp-Source: APXvYqxPO+aU4NLmBYmMxBYv7zcWu35kkFoFjlVAjNqdxL18t/kYSZuTrJJ9GNOUC02j/lF4ntsIyw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr1865157wrj.182.1559207783309; 
 Thu, 30 May 2019 02:16:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id y132sm3504881wmd.35.2019.05.30.02.16.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 02:16:22 -0700 (PDT)
Message-ID: <5cef9f66.1c69fb81.39f30.21e8@mx.google.com>
Date: Thu, 30 May 2019 02:16:22 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: next
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20190528
To: Mark Brown <broonie@kernel.org>, tomeu.vizoso@collabora.com,
 guillaume.tucker@collabora.com, mgalka@collabora.com, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, matthew.hart@linaro.org,
 khilman@baylibre.com, enric.balletbo@collabora.com
From: "kernelci.org bot" <bot@kernelci.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] next/master boot bisection: next-20190528 on
 sun8i-h3-libretech-all-h3-cc
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
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

next/master boot bisection: next-20190528 on sun8i-h3-libretech-all-h3-cc

Summary:
  Start:      531b0a360899 Add linux-next specific files for 20190528
  Details:    https://kernelci.org/boot/id/5cece0fd59b5144bc47a362b
  Plain log:  https://storage.kernelci.org//next/master/next-20190528/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:   https://storage.kernelci.org//next/master/next-20190528/arm/sunxi_defconfig/gcc-8/lab-baylibre/boot-sun8i-h3-libretech-all-h3-cc.html
  Result:     34ac3c3eb8f0 ASoC: core: lock client_mutex while removing link components

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       next
  URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  Branch:     master
  Target:     sun8i-h3-libretech-all-h3-cc
  CPU arch:   arm
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     sunxi_defconfig
  Test suite: boot

Breaking commit found:

-------------------------------------------------------------------------------
commit 34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb
Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date:   Thu May 23 10:12:01 2019 -0700

    ASoC: core: lock client_mutex while removing link components
    
    Removing link components results in topology unloading. So,
    acquire the client_mutex before removing components in
    soc_remove_link_components. This will prevent the lockdep warning
    seen when dai links are removed during topology removal.
    
    Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2403bec2fccf..7c9415987ac7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1005,12 +1005,14 @@ static void soc_remove_link_components(struct snd_soc_card *card,
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 
+	mutex_lock(&client_mutex);
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
 		if (component->driver->remove_order == order)
 			soc_remove_component(component);
 	}
+	mutex_unlock(&client_mutex);
 }
 
 static void soc_remove_dai_links(struct snd_soc_card *card)
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [cd6c84d8f0cdc911df435bb075ba22ce3c605b07] Linux 5.2-rc2
git bisect good cd6c84d8f0cdc911df435bb075ba22ce3c605b07
# bad: [531b0a360899269bd99a38ba9852a8ba46852bcd] Add linux-next specific files for 20190528
git bisect bad 531b0a360899269bd99a38ba9852a8ba46852bcd
# bad: [0b61d4c3b7d7938ef0014778c328e3f65c0d6d57] Merge remote-tracking branch 'crypto/master'
git bisect bad 0b61d4c3b7d7938ef0014778c328e3f65c0d6d57
# bad: [6179e21b065dc0f592cd3d9d3676bd64d4278025] Merge remote-tracking branch 'xtensa/xtensa-for-next'
git bisect bad 6179e21b065dc0f592cd3d9d3676bd64d4278025
# bad: [3e085f66fe7e93575f2a583a3d434415cef2d860] Merge remote-tracking branch 'amlogic/for-next'
git bisect bad 3e085f66fe7e93575f2a583a3d434415cef2d860
# bad: [b9afa223a3420432bc483d2b43429c88c6a5d0e0] Merge remote-tracking branch 'staging.current/staging-linus'
git bisect bad b9afa223a3420432bc483d2b43429c88c6a5d0e0
# good: [fc6557648e19dbd207dc815c6e09fc6452f01e63] Merge remote-tracking branch 'bpf/master'
git bisect good fc6557648e19dbd207dc815c6e09fc6452f01e63
# bad: [6c3f2a0e0f236f31b47d63ab7d3f4ec889821d0d] Merge remote-tracking branch 'spi-fixes/for-linus'
git bisect bad 6c3f2a0e0f236f31b47d63ab7d3f4ec889821d0d
# bad: [20a5f9c8649d74407aa657ce5b76cf8b0bbb17e3] Merge branch 'asoc-5.2' into asoc-linus
git bisect bad 20a5f9c8649d74407aa657ce5b76cf8b0bbb17e3
# good: [ad6eecbfc01c987e0253371f274c3872042e4350] ASoC: cs42xx8: Add regcache mask dirty
git bisect good ad6eecbfc01c987e0253371f274c3872042e4350
# good: [069d037aea98ffa64c26d4b1dc958fb8f39f5c2b] ASoC: simple-card: Fix configuration of DAI format
git bisect good 069d037aea98ffa64c26d4b1dc958fb8f39f5c2b
# good: [df9366131a452296d040a7a496d93108f1fc240c] ASoC: Intel: sof-rt5682: fix AMP quirk support
git bisect good df9366131a452296d040a7a496d93108f1fc240c
# bad: [34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb] ASoC: core: lock client_mutex while removing link components
git bisect bad 34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb
# good: [4819d06292c9b57eabdd6d1603e49a27baf183be] ASoC: simple-card: Restore original configuration of DAI format
git bisect good 4819d06292c9b57eabdd6d1603e49a27baf183be
# first bad commit: [34ac3c3eb8f0c07252ceddf0a22dd240e5c91ccb] ASoC: core: lock client_mutex while removing link components
-------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
