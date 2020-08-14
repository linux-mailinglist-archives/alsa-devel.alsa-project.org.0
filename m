Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC410244466
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 06:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569371667;
	Fri, 14 Aug 2020 06:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569371667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597381113;
	bh=/RtFAg79eGrhRSuP7Uri7fLakonOkne4EJdD+033+Sg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X7O/yQ4W2gYkTWcYH8EcagbFeNSeMKcq0YQpvqpj+cJqxdZwSTpZYJVWELqLVFgVX
	 pIA++E4ehsRZ1o8cEh8XPdkZJUcb4ZCRvD8lzHY02k95LWk7gPIoL2hMh1NSEt7FIb
	 YrgjYkGc4gt1VB7t/TTO5kkSBZj4QIl1r0S1WhUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72CE7F800D3;
	Fri, 14 Aug 2020 06:56:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B17F8022B; Fri, 14 Aug 2020 06:56:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5DBEF800D3
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 06:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5DBEF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fUtZYnKT"
Received: by mail-pl1-x644.google.com with SMTP id z20so3643310plo.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 21:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nbug31lN9jTiy04cDRYxBAFaW8MOaMvF7G1bnEdzpf4=;
 b=fUtZYnKTR5F5TSTQrQ1ymVxVV/pdp4XiWx4hFYmpNGCizfHWjGczqxUFJS/fCoCOEc
 iRFU7psHMyltWgLQbh1apal0ImbIKnJm5m/iM/lPaxx3NRfuvhg265i1FdyYihTm+XVr
 16CLK0WVr0IdJKpdMEBGR6apEcCR7xodi8oqJTWF1b7Z0Q4A12OQ2Xwe5sWwM66j5Lz1
 jPW+cY9xzIwzKnhyKkENCTlF0K4Rad3/7ObGy7FbLnQE9NG0TULsU9wIyi1rn+BI7p3T
 9wvFF9oV8QS/O1GtPJ8RLEMnOk5x2tc2BTLRBAgdHNrpzb+o3teE5dadZ5GGpWYuVvZ0
 5P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nbug31lN9jTiy04cDRYxBAFaW8MOaMvF7G1bnEdzpf4=;
 b=r6m+CHH/2I7e8bd8TfTkQJFZBQgx6ei8bkklhMTXaEThWl2zOrjBuDymJXDaPHQuAa
 4XppVfVRhJrB3Tv7pLfCb5guW7UpDQct8jqQaxEgRnxSCxadNtuVATnHd378mbCVUyfF
 MnKk65Pr2mVdObIAk+a3eCkLqpHUHlIFjWdfdwuj9SHA3fwh0uvZDs1BBA2D2bMcz6sE
 5nGTuGhgoJK02F5iTPRpQW2mZ5xWVNdFUMYgUjYwL/0QzdIvGq6ZUaeZbHg8y2r9xU+C
 ltKAVa1ClwNfIeIpLKnuiQmpoE52GWTN6okw4SiwwuosNtWCXWUgNvHfYS4+gzhLAfkr
 Ocsg==
X-Gm-Message-State: AOAM532fuiYxKPcgpZ2ItAL9/m5SxWXTyJeSAYrkSgnbkxfhIXjU8LI3
 K3PaL2LFYlbAa9XxZElsSos=
X-Google-Smtp-Source: ABdhPJyl4/Kw7t3X4OfxBWCLaueJJNizRweNvCNuKWlWS7F/ol7wjGBr6qJQT3Bt12aEFakzbS4/Rg==
X-Received: by 2002:a17:90b:4c46:: with SMTP id
 np6mr862057pjb.201.1597380992467; 
 Thu, 13 Aug 2020 21:56:32 -0700 (PDT)
Received: from localhost.localdomain
 (68-123-15-75.lightspeed.sntcca.sbcglobal.net. [68.123.15.75])
 by smtp.googlemail.com with ESMTPSA id gl9sm6886790pjb.41.2020.08.13.21.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 21:56:31 -0700 (PDT)
From: Mike Pozulp <pozulp.kernel@gmail.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Flex Book
Date: Thu, 13 Aug 2020 21:53:44 -0700
Message-Id: <20200814045346.645367-1-pozulp.kernel@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Mike Pozulp <pozulp.kernel@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Huacai Chen <chenhc@lemote.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 open list <linux-kernel@vger.kernel.org>
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

The Flex Book uses the same ALC298 codec as other Samsung laptops which
have the no headphone sound bug, like my Samsung Notebook. The Flex Book
owner used Early Patching to confirm that this quirk fixes the bug.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207423
Signed-off-by: Mike Pozulp <pozulp.kernel@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2477f3ed7237..449ea64919ec 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7688,6 +7688,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-- 
2.26.2

