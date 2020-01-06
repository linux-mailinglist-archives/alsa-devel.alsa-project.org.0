Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27B130BE3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 02:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CBA417FD;
	Mon,  6 Jan 2020 02:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CBA417FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578275437;
	bh=44+acSH2A7K85wWCq3JbaHGIasij7q7AdF61Dd04wiA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YJlN2dTdLSbukANo6ScMU1VX90dr06YaM3+uW8H0FKO9dIKhu58GzDslERw2vinMd
	 GbKeC8XeXd+JwQTAh05fTEandocEUY6rJlI9t4k1jlHriB2YqQ64WxcvNKBmxeAL44
	 g2iNakjL1piXfaQi1Ufji7EPofS5sZJBiaGAulk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE295F80140;
	Mon,  6 Jan 2020 02:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B12EF8014A; Mon,  6 Jan 2020 02:48:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4DCF8010D
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 02:48:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4DCF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nWysjDEF"
Received: by mail-lj1-x242.google.com with SMTP id y6so41311765lji.0
 for <alsa-devel@alsa-project.org>; Sun, 05 Jan 2020 17:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEBeBtX3D+FecxXDkPEiiIV4CkPQmZtOza+gbuFwJ6Q=;
 b=nWysjDEFnf1ZW1KuOOtMZR3c8DXFeGoQ7Pkf0QqGQyTgGE4bUjSsvLIglzOM/Embgd
 +G/Wy46pZx7Mh4lJuIHmrT7Yr/AiDzSHQDCLmJpFSasUdy0CEB8/PDY714n2OX2aP0Jk
 TBjnXkgFulCTksMF+sROlNYzGwjAChVcXgLAsAHgIPR0p1fjlSOtnvsf0JynHxVR9lqU
 zUbb7fGzTbZcchQ4XvAn+5JE+v1ffZ/QuhG6Qfec7SmR99EZs4oT8Fcne5abr6jGWham
 H2pG9P92gUI3yDMgt5GUJWxbYH8BMMZCJHo1vZPgZ5727Sjc6Kw7VuMDwPrsq86VyNNd
 FIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEBeBtX3D+FecxXDkPEiiIV4CkPQmZtOza+gbuFwJ6Q=;
 b=rXSW0tHXwWpAJl1Dbhx2JxX1af6I7P4c3K9TMsAXVAtAvEGiUpz/SprEoKD+WphW6B
 AVmY9St9WXZUhLvXWYbOIp5FRpC9+dozGBQsnvgLOZ6LC3CTM+hzMJ1MyBxlOIdET4q7
 3YnMJkMIEI3ZYj128wPbwEeLATb+h/LYJjGUHBxYDWxXq3DsP2HXzZsTBrZXLHAt3x1y
 5OpoCHASPMbCEmXJzdeGYnPb8Y5zOU5yo3mPjpKsZbiHeeS1YLJZZv3GZn96jpNA0hqe
 0wN+5wXwTmcgf186Y2XW+ZpMqCvkPVPr0sabgGwrneQlSoZMndY6JfN01mqVtGONM45X
 JkMQ==
X-Gm-Message-State: APjAAAUAEwQnWPLWKRp7Jj9QABBpu2DHPlSSG9KxI4EiqQHWbuZ/2rzC
 UX8hCzyTNX7xrVNP3AOxm5A=
X-Google-Smtp-Source: APXvYqwDJIKUFFtDFfKjMDK2pI9tL+4EGshl7DCfCiqzjicOIBaD27gA1g1LXj+YNFMyhi1mP5VFYg==
X-Received: by 2002:a2e:9a01:: with SMTP id o1mr56311153lji.247.1578275327908; 
 Sun, 05 Jan 2020 17:48:47 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id e17sm28369857ljg.101.2020.01.05.17.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 17:48:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Date: Mon,  6 Jan 2020 04:47:07 +0300
Message-Id: <20200106014707.11378-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ASoC: rt5640: Fix NULL dereference on
	module unload
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

The rt5640->jack is NULL if jack is already disabled at the time of
driver's module unloading.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Addressed review comment from Takashi Iwai by making patch's diff a
      bit cleaner and simpler.

    - Addressed review comment from Mark Brown by removing noisy backtrace
      from the commit's message and moving it after --- in order to keep it
      discoverable in the ML archive.

Backtrace:

 Unable to handle kernel NULL pointer dereference at virtual address 00000024
 ...
 (rt5640_set_jack [snd_soc_rt5640])
 (snd_soc_component_set_jack [snd_soc_core])
 (soc_remove_component [snd_soc_core])
 (soc_cleanup_card_resources [snd_soc_core])
 (snd_soc_unregister_card [snd_soc_core])
 (tegra_rt5640_remove [snd_soc_tegra_rt5640])
 (platform_drv_remove)
 (device_release_driver_internal)
 (driver_detach)
 (bus_remove_driver)
 (tegra_rt5640_driver_exit
 (sys_delete_module)

 sound/soc/codecs/rt5640.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index adbae1f36a8a..747ca248bf10 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2432,6 +2432,13 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
+	/*
+	 * soc_remove_component() force-disables jack and thus rt5640->jack
+	 * could be NULL at the time of driver's module unloading.
+	 */
+	if (!rt5640->jack)
+		return;
+
 	disable_irq(rt5640->irq);
 	rt5640_cancel_work(rt5640);
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
