Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B15F5036
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 09:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 238DF1693;
	Wed,  5 Oct 2022 09:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 238DF1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664954088;
	bh=TPDZrWJeTS+6awwt5sVue7Gm/LlqON0G81Vl9ea0P4w=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AEhXvb7OVuM+xU4e4yFZUAvI2jYd138AlWWoLlqCoBzRy5vvwxazNCJZiruD9Wq/W
	 inuH6/gAtdxm7uP5LnW3DYhDU5iz5GbzlNq/AKDS00EnSrapx3/Maz8NWyQLisr5mB
	 qqwP3BKmUovGY+168Lqv+Rn8+dVzFAY67VvAoZ5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE3CF80212;
	Wed,  5 Oct 2022 09:13:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20FA5F800F8; Wed,  5 Oct 2022 09:13:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 845B5F800F8
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 09:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845B5F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E1NWcGuG"
Received: by mail-pg1-x530.google.com with SMTP id 3so14618574pga.1
 for <alsa-devel@alsa-project.org>; Wed, 05 Oct 2022 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=6poUX3oS6Br5bY3eIpJkJW5CowmAxb2o8nTm/05xlCc=;
 b=E1NWcGuGcyrgPzUQL1CygPbNJ+/NCUhNJsohk9auzhE2IpSl8Qckq39I3wK3HxJqeX
 yCsCrZsYVzqKbSwEN5XAWiz2Vhs+sGnYo/cZUPv7chOcyNb11TDov3hGg9X/qLXyxFew
 ky85VNwADayZgmyPmTd6011nUUYc1l0SVMZ714Fzof3piLepqWVyttgJVJqENpEayCMe
 Buy1/3ymcZgv15+OlmDQE7tuRxAaNtUsuzCjWcjzAQ/c4sRQOLn0NlGfiZcVIJT1/5Qz
 GYd2typPgbRjuVPNq/xSo8XIEV5PRuQuP1W2kE3DmI3pcCN4nXweL7BMvuRNvIqYfBuf
 IG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6poUX3oS6Br5bY3eIpJkJW5CowmAxb2o8nTm/05xlCc=;
 b=bEgOQ9aJW7ZfnmVxfVTGoEDFpDcViASqehHHD9dAiLgRseXkInXspkiAPg2TUzlWiD
 V+hiuivT9VwRDVMDpe2ElENim99gT50AqhbHgya7ZEQ/FDM8vpiW+htnh6APDlGwsWPP
 KLBmySIe427zZpGTLJ6OQIYl8KfXklikGLehxA64XGgXjrj7eC5uY5xMxZHRfpUTzFVu
 WNhWGjqG1AKs5P880lQAiQ7c7fpj37PY4f9ZMwMDd+039Z216h0WOGRC5hQp80DFhS2h
 1AZ82TLnJnasTMd+z6AXm5qpq0d9HGhvvwaR6O9kosmVrGR02vilVIxhvRY5g4RCU4GI
 Sf3Q==
X-Gm-Message-State: ACrzQf0VVxglu45T9OuGlhkdsJhkNTi15p6XKvj9e/1uCRRHuTg79dwE
 IjAXLhhIKzzYvb/mgPuR75PFLYbA587p82jN
X-Google-Smtp-Source: AMsMyM6tDalD/ezGVZgfahLW66lZzpz+mSqMJ69B1RMcmewonn+lg0r7xFKuGC536PvGl/Oj5eSigA==
X-Received: by 2002:a63:1521:0:b0:43c:9566:7a6a with SMTP id
 v33-20020a631521000000b0043c95667a6amr26591399pgl.339.1664954025044; 
 Wed, 05 Oct 2022 00:13:45 -0700 (PDT)
Received: from piranha (202-65-89-82.ip4.superloop.com. [202.65.89.82])
 by smtp.gmail.com with ESMTPSA id
 r28-20020aa79edc000000b005624c6a833dsm222810pfq.181.2022.10.05.00.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 00:13:44 -0700 (PDT)
Date: Wed, 5 Oct 2022 17:44:16 +1030
From: Callum Osmotherly <callum.osmotherly@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ALSA: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
Message-ID: <Yz0uyN1zwZhnyRD6@piranha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tiwai@suse.de
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

From: Callum Osmotherly <callum.osmotherly@gmail.com>

After some feedback from users with Dell Precision 5530 machines, this
patch reverts the previous change to add ALC289_FIXUP_DUAL_SPK.
While it improved the speaker output quality, it caused the headphone
jack to have an audible "pop" sound when power saving was toggled.

Signed-off-by: Callum Osmotherly <callum.osmotherly@gmail.com>

---
 sound/pci/hda/patch_realtek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d35934f..ab6d736 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8836,7 +8836,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0872, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0873, "Dell Precision 3930", ALC255_FIXUP_DUMMY_LINEOUT_VERB),
-	SND_PCI_QUIRK(0x1028, 0x087d, "Dell Precision 5530", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x08ad, "Dell WYSE AIO", ALC225_FIXUP_DELL_WYSE_AIO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x08ae, "Dell WYSE NB", ALC225_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0935, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
--
2.37.3
