Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38E4831B1
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 15:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC96B17AD;
	Mon,  3 Jan 2022 15:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC96B17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641218874;
	bh=RVNP0vlzwss2AuplcksC2oXefDYFSnU368PcjtUlNAg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IsHJcrR6avarxCFe9KVV9iMvS/eLOqHAyO5DCk85LI5zkBdo1u6OxMy7bNVPgEXlP
	 o2cJYHzJcy45uJ1Cietlg4kzkGDQ2WcJwwLo4uIDy88Xf5yqX5zHemQAN3FGJ2K/mD
	 dauJ3cjYsa6lWsxeL9ifXSl5XdvbzywvFZItuFj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 881BFF804F2;
	Mon,  3 Jan 2022 15:06:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E066F8007E; Mon,  3 Jan 2022 15:06:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6898DF8007E
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 15:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6898DF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KSXmxgR1"
Received: by mail-ed1-x530.google.com with SMTP id j21so136189931edt.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Jan 2022 06:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7l1N3XOpZYsurbeAEhyNi3v7swAEPB3pgAvLGm6C2g8=;
 b=KSXmxgR1TNYYPOKYqVk8SrfAl0dva5wUZMGCdceMpDUP71rhz4XCgNL+DJVm58RA1w
 INgZHgmN4WVmN9NDEk0ECUzyN1Zutdevg8mntQ1M4U4zD1rnAVAJBOBLaQJ2RLxTOjHx
 BzvQEn1oEzqvvowzieRYTBnBXYMkK2l0E10/Ot1r700sG/7fDYp2Zq+/K8fKBVET+NKB
 jZuD1Pj+UQVcsatZ/Ib2PX2OCvTsFZZQ2TdT2qrnuY/1wnyDisQN2z9EP/6wwMXnjok0
 2Ahd/Hb10V5pRDjtD/3Bm2GIzZ04jJJZvPGV0zEB59WpaNpFq4S2lEi5H8co1vDszMeo
 97EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7l1N3XOpZYsurbeAEhyNi3v7swAEPB3pgAvLGm6C2g8=;
 b=e1JH3VscWYMtZ0I1v8mGeDUg/0Va6yaMH7cnD/ZpJu70g4mIIlCJZ2Ewz5NxcW+xPR
 C113KaUOZe9l/NfGR5+AVetO1Qt3SiNcVF6GugLC4YZ88tjKPc5Q/QbjRzoWpsJbUok0
 IdNnjgq5hvD5Nn1Hqhx0NnnFB4Fy+yjjC2ZMYReFi6mEIPMjdaRqZMlHRYqCECbtGha+
 2sw1utwlHdvNrTNkJ5cy+vZFe6LjVhLwurJ+QIvFZs7Ta2dfa7YM8G4f9+5jO/OKY8Tj
 hZdWtLpQd9gLsQn4j6xhiiucaw5u0LHTwm8NzqqX1f56O1e3LJBfPoZtRYiQ4S0HZy8+
 SSUw==
X-Gm-Message-State: AOAM530Io/e/dto+Gl5DNbyZPyrdQQob8R9+l9OTU8hcBMHyVM0GHt67
 fwYBSrKKi9R57uerfHwxEFM=
X-Google-Smtp-Source: ABdhPJz9dO+U2IX25lTafqd8SM9pTmNc4D8Sywjzj+Fy4Ev6NgZGXr4X5biNoXH+SQV4fua6mhhdBA==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr45399399edk.192.1641218759995; 
 Mon, 03 Jan 2022 06:05:59 -0800 (PST)
Received: from cosmos.lan (77.116.2.39.wireless.dyn.drei.com. [77.116.2.39])
 by smtp.gmail.com with ESMTPSA id k16sm10694297ejk.172.2022.01.03.06.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 06:05:59 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH v2 0/1] ALSA: hda/realtek - Fix silent output on Gigabyte X570
 Aorus Master after reboot from Windows
Date: Mon,  3 Jan 2022 15:05:16 +0100
Message-Id: <20220103140517.30273-1-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This is version 2 of my patch. It implements suggestions from Takashi Iwai.
Thanks for that! Furthermore, I re-analyzed all the relevant coefs and
removed those that are not actually needed.

===

This patch addresses an issue where after rebooting from Windows into Linux
there would be no audio output.

It turns out that the Realtek Audio driver on Windows changes some coeffs
which are not being reset/reinitialized when rebooting the machine. As a
result, there is no audio output until these coeffs are being reset to
their initial state. This patch takes care of that by setting known-good
(initial) values to the coeffs.

The coeffs were collected via alsa-info, see:
  broken: https://pastebin.com/4bRBSseH
  working: https://pastebin.com/WUTufvZB

I also created a script which fixes the audio at runtime.

 #!/bin/sh
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x1a
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x01c1
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x1b
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x0202
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x43
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x3005

However, obviously, we can and should fix this in the kernel.

We initially relied upon alc1220_fixup_clevo_p950() to fix some pins in the
connection list. However, it also sets coef 0x7 which does not need to be
touched. Furthermore, to prevent mixing device-specific quirks I introduced
a new alc1220_fixup_gb_x570() which is heavily based on
alc1220_fixup_clevo_p950() but does not set coeff 0x7 and fixes the coeffs
that are actually needed instead.

This new alc1220_fixup_gb_x570() is believed to also work for other boards,
like the Gigabyte X570 Aorus Extreme and the newer Gigabyte Aorus X570S
Master. However, as there is no way for me to test these I initially only
enable this new behaviour for the mainboard I have which is the Gigabyte
X570(non-S) Aorus Master.

I tested this patch on the 5.15 branch as well as on master and it is
working well for me.

Christian Lachner (1):
  ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master
    after reboot from Windows

 sound/pci/hda/patch_realtek.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

-- 
2.34.1

