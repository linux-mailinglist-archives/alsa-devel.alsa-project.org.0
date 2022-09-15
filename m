Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF45B9B90
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 15:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E935167A;
	Thu, 15 Sep 2022 15:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E935167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663247222;
	bh=85bjF6Em9RL/ZiY8n1XpTvHM9ZMvSiBAzOMX7x4zQQ0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qaaidOLt7GCjo0PWFOMOdHFH0+0qWvLaQid6qwDrxQMpty5imiUaOxKRLQsKXPLkn
	 CfRpaOVbXARqkuXYbJvWooqYRXIHx7hyd6xWZKrNZ8a9O4KhCisIuyISl9Dv7qKXIY
	 spSzn7aegy2Hd4S5P95kjY7+U2f+1uR8CfWgZvCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB10F8008E;
	Thu, 15 Sep 2022 15:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF40F800B5; Thu, 15 Sep 2022 15:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B22FF800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 15:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B22FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hy2vmzJH"
Received: by mail-pl1-x635.google.com with SMTP id s18so12337631plr.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=7nxGi2v1dL2dLbnbbwum0ELguBe5muv3bPqC6wfZV7s=;
 b=Hy2vmzJHW9AYXhLqDSpW70HeehYKhHayeVqAlXUAi0Yiehy07rr8oqDvxPQYD1mmKm
 kXgfEA2un4F0dsGMk15K9UegLaR6uLURGfF+hSTIN4bpA1NO+ZT+/sK9CsqU44gjfaR/
 3263hj8CYRMUXh3NQX7+hKknkN6EQiyNJi6jtDsepallwxl6yksPknpYlNnYIVP9D4DO
 LvsK8QeCHGO8VWE/3DdK27S/i+9oou21QhhTBLHUmD9XR1ZODOes9HCgq6unXn+IrmlR
 Ro+yvoA+Kk3pUotIHasCetXmQfAfjJq/GCU4J8Ly4wciE7C3IOIogXAmluGuOzDncPT0
 pHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7nxGi2v1dL2dLbnbbwum0ELguBe5muv3bPqC6wfZV7s=;
 b=sR1/ZECwt0nEELZ/4uakIX+N1vt2kWskJcWqaBIF7eOxRS/BnVTuvPhlyDzgVQofqo
 ByJ0UmOcENBYFAnX3h++PwuKvi8lJvblzTr2ifHvLPt7XqbpfVL+B2l36hd/zR6f/8+r
 sy6a7EMOHtnZQzXpHxmT4yIvlRmA2BbnS0XvLUKpybkdkST+UtUl+mhzYXwxzI37OrsV
 iWu4hpLCAqxneJ0bEJJ4RXYw/I27aJBqTxZB/jLPR0B7eycXG/++NJSQW/em9ngJILFU
 qNXlEpJiZ+RU557BGQnMbGyyul0J5yEH2WRaxr0Uwmdw/AqFK7iRIc/vXxKyOFMqny4S
 5Amg==
X-Gm-Message-State: ACrzQf2Rb8feBBbSqPQ7G/XTQieIudTEvr1enmJh7acjpX1C9tFzLIB+
 MyGubjSFcgs7VjPlKUY3eVVn0YbzG/+0wg==
X-Google-Smtp-Source: AMsMyM6he9+BY5rAiXm88lOwp4oVgT0UYEyRuJCnCKjQVHYn7Wl/MUbBKK/Vy9Gs/jhwztkm8HIKfg==
X-Received: by 2002:a17:902:cec4:b0:176:be0f:5c79 with SMTP id
 d4-20020a170902cec400b00176be0f5c79mr4342592plg.40.1663247154946; 
 Thu, 15 Sep 2022 06:05:54 -0700 (PDT)
Received: from piranha (202-65-89-82.ip4.superloop.com. [202.65.89.82])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902a38f00b001785dddc703sm3875166pla.120.2022.09.15.06.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:05:54 -0700 (PDT)
Date: Thu, 15 Sep 2022 22:36:08 +0930
From: Callum Osmotherly <callum.osmotherly@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ALSA: hda/realtek: Enable 4-speaker output Dell
 Precision 5530 laptop
Message-ID: <YyMjQO3mhyXlMbCf@piranha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tiwai@suse.de, callum.osmotherly@gmail.com
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

Callum Osmotherly <callum.osmotherly@gmail.com>

Just as with the 5570 (and the other Dell laptops), this enables the two
subwoofer speakers on the Dell Precision 5530 together with the main
ones, significantly increasing the audio quality. I've tested this
myself on a 5530 and can confirm it's working as expected.

Signed-off-by: Callum Osmotherly <callum.osmotherly@gmail.com>

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 799f6bf266dd..bdef329adb10 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9114,6 +9114,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0872, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0873, "Dell Precision 3930", ALC255_FIXUP_DUMMY_LINEOUT_VERB),
+	SND_PCI_QUIRK(0x1028, 0x087d, "Dell Precision 5530", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x08ad, "Dell WYSE AIO", ALC225_FIXUP_DELL_WYSE_AIO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x08ae, "Dell WYSE NB", ALC225_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0935, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
-- 
2.37.3

