Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 117101A751F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45A216AD;
	Tue, 14 Apr 2020 09:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45A216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850332;
	bh=CAYrFtHFpo5cukQEHXl2LKlTP2p+Q7WbPgOtX6onlBc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G+z8mo+6/kV/T2Qi39v78ftefsKS8tlIVaUFX1S00i6DQWy1+y/Zv2nq4OWpdjF7d
	 45cg9YGu0+NizYEVsj+S0WG2FQ3NTC+SSrFsDPVhuLrdOoeOzTeV/uUv1ksQZJNUSZ
	 1V9cVxdbKCUb339tv9ZLXx5eXx3BhfPayjftX8Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7F6F8028F;
	Tue, 14 Apr 2020 09:42:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A5BF80143; Fri, 10 Apr 2020 11:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA707F800CB
 for <alsa-devel@alsa-project.org>; Fri, 10 Apr 2020 11:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA707F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J9ZjsgUi"
Received: by mail-pg1-x542.google.com with SMTP id c5so744199pgi.7
 for <alsa-devel@alsa-project.org>; Fri, 10 Apr 2020 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkHYjRBtSg5f4SMiK1TxUiRMi16PL9sTwB+WM20uZ64=;
 b=J9ZjsgUiczZp8NgMIvzvWB5725WBjM/RJM3ETufT4nu3bVy09GO4vMLhqhMy/byZ+w
 vo+84d70WduKUZAoGqNuqvO3L3YGTNVGRQLHeBT0xvVC6/FrJV2zvRAJRd4ty8PMb5Tt
 g0+jXYkHsWjFHrpSPE+s+CRj/gmbl3Rv7WCUD/IGM6r2Bgzz8R7zddjztEiUVVyR938S
 xErcScdcRTWMmUJ1wAsUr5Q+tk9ilreUASFRnxngeqEFK1kvz3Oo3xrHR8vYngsdMnCA
 ic1nIoRrOAMf0Q+H79ryH8rfyUyCJdwJ13vMYJ+ivHsD9+JgSMaTom95T/0uhV+ZjmpS
 waqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkHYjRBtSg5f4SMiK1TxUiRMi16PL9sTwB+WM20uZ64=;
 b=DUV83OIlsDyRPZ6iCJ+/o0fa0ttYl3KL+7Or6TCc+gd/g8NVrkSOHhG7EdTiXSkpiK
 THAwL23ZvbCH61PqdCFufcLnUNlMDSrVhW0y6d7lzaFyGJh0k4aGmCMgpNPCU31fvxgk
 sb3CRsiFWzijv/UH8KBmww3r3dP3JCB2fPqoLnZO1GNSSOMnJMubWbghtzcYTJLvbbTS
 +ir7CsCyGeruAlrJtz1We/2a0MTK8wDDsFF+NZRuyyYTctZ+JnE4nUP79brudgrpd+Xq
 NozXiz5R0j/oppytUM54XWFZH0CrtWONtd/OO4ZpmOFLZ7TDEaG9yFSdilsi7cw+L3J8
 8KfA==
X-Gm-Message-State: AGi0PuZOgPZ9zUWwX1uSlWErvynNvY+jhrEjWlOpDW/+c70hw+lAPE1B
 B7pg9VqEOvHeXW7s44rLZRE=
X-Google-Smtp-Source: APiQypLk+xq0lULGO3RsR87xahCZO+Ow4IgPC/pNZOw3H897oD5P38ap6qd3fSWtSIcbloxXgHiRHQ==
X-Received: by 2002:aa7:96b2:: with SMTP id g18mr4166990pfk.221.1586509238563; 
 Fri, 10 Apr 2020 02:00:38 -0700 (PDT)
Received: from localhost.localdomain (220-136-87-101.dynamic-ip.hinet.net.
 [220.136.87.101])
 by smtp.gmail.com with ESMTPSA id c8sm1244529pfj.108.2020.04.10.02.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 02:00:37 -0700 (PDT)
From: Adam Barber <barberadam995@gmail.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek - Enable the headset mic on Asus FX505DT
Date: Fri, 10 Apr 2020 17:00:32 +0800
Message-Id: <20200410090032.2759-1-barberadam995@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:55 +0200
Cc: Adam Barber <barberadam995@gmail.com>, alsa-devel@alsa-project.org,
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

On Asus FX505DT with Realtek ALC233, the headset mic is connected
to pin 0x19, with default 0x411111f0.

Enable headset mic by reconfiguring the pin to an external mic
associated with the headphone on 0x21. Mic jack detection was also
found to be working.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207131
Signed-off-by: Adam Barber <barberadam995@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f66a48154a57..5016fa50956a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7252,6 +7252,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
-- 
2.26.0

