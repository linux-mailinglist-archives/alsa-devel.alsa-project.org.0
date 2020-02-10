Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4E1572CD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4FCC15F2;
	Mon, 10 Feb 2020 11:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4FCC15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581330448;
	bh=YMXUNRIfRk07rWv1ZIL+woiRgcVLAw7jCBxGUr1ghXc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTjf3XdDpJ7+OPJt1G9oEjuvxh9YoAa259e8QzY8cGp9EFZbbD7Pfv1hiE+iWO3fT
	 QzCikt75Ab7LFa4uKKQVwN9C+OpI2mvdkRSmnrvbkVXscjzlyDnVc0FpACVmnbx/CZ
	 FSNUuWutcboN9+78531uRbH310oU9VcVd/flnvjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E62A1F802F7;
	Mon, 10 Feb 2020 11:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69AA3F80157; Mon, 10 Feb 2020 03:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68AB8F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 03:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68AB8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="optwxEAU"
Received: by mail-pj1-x1043.google.com with SMTP id 12so3555804pjb.5
 for <alsa-devel@alsa-project.org>; Sun, 09 Feb 2020 18:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KIB3tCNxKUfOE33QODdBTwxKO9WOWEG49GokMmlC/2A=;
 b=optwxEAU/vfjWHpLgR7xhu8zRbPhjzgel+OSfvuC4ip/VZuLhYnHJV3cpPAejbTRDx
 +sxKflPlRvjLS5Z55Mt0U85mhn3KPZJgQOiYxVjkU40PA7kFQPJqoXEX3Bt5khIcghDj
 QSBqeon6Y8CkXefiKwsP2cbyOKNrhqF4EXlO1btOsSfw10a6J2HucUNTbqFZt59nwf/A
 h20gbxdmTZhQm6BB+NL1eqFfbWykENl30qRuV3zguYNxIHQ9pFqZqxE7CfC+XPLoN9C5
 1eX8jYhVBTE+R0YCtSlZ55AOUnIc08f+cRt4e6OsiF70KJVuy673B+/lY0vWIIc1341U
 LVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KIB3tCNxKUfOE33QODdBTwxKO9WOWEG49GokMmlC/2A=;
 b=Trs0Y6u6AI+N5yisalx7s4sw9Z4kPn0q13yCLacfLYG9DCirAYpgYWMhcShJ43LUBC
 K1LJpK4kqv3XQN3ZKNyLBv0vPD2AmyXtYmbWSbzSapFnfZ4W4lAeIxnTrIlwsEN56fmZ
 Dw8uVDeCcikIm+/rAYrSMuuJOlxkT8ruTmnLy0f0YSeuq5zt200syFlnFeUpMUuwLlkb
 NRkSEEDgxFDAwREIej93TgrShqJjbKb/2WuZikT/xRJcrouwGR91+e170mwZSfPvWEEd
 HHzw3M23ScKCFR5i538II2e6Y/8n4V38sxtIufASeYYww7kAPgWjeEBtF6oILxTGhtmD
 uK+A==
X-Gm-Message-State: APjAAAWJ270jXPtusxMI2WZSjk7Ol1R1qPCFtLAZiC38SOWz1Sck4Jww
 OOTYV5J+46noUeH/hkbGiyY=
X-Google-Smtp-Source: APXvYqzQLvsRe+DYbzRPo/VdziWHiDQsHn7VumDXdqZDoRedk3zhpG84sMCaYGty+JKDLDF9SIoemQ==
X-Received: by 2002:a17:902:ff11:: with SMTP id
 f17mr10341597plj.273.1581303174503; 
 Sun, 09 Feb 2020 18:52:54 -0800 (PST)
Received: from f3 (ag119225.dynamic.ppp.asahi-net.or.jp. [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id f15sm10279063pgj.30.2020.02.09.18.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 18:52:53 -0800 (PST)
Date: Mon, 10 Feb 2020 11:52:49 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200210025249.GA2700@f3>
References: <20191129144027.14765-1-perex@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129144027.14765-1-perex@perex.cz>
X-Mailman-Approved-At: Mon, 10 Feb 2020 11:20:06 +0100
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
 Lenovo Carbon X1 7th gen
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

On 2019/11/29 15:40 +0100, Jaroslav Kysela wrote:
> The auto-parser assigns the bass speaker to DAC3 (NID 0x06) which
> is without the volume control. I do not see a reason to use DAC2,
> because the shared output to all speakers produces the sufficient
> and well balanced sound. The stereo support is enough for this
> purpose (laptop).
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>  sound/pci/hda/patch_realtek.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

This patch is now commit d2cd795c4ece ("ALSA: hda - fixup for the bass
speaker on Lenovo Carbon X1 7th gen"). There was then followup commit
86353aa70ed0 ("ALSA: hda/realtek - Add quirk for the bass speaker on
Lenovo Yoga X1 7th gen").

As a result of those, the maximum sound output level on my laptop
reduced to ~60% of what it used to be.

Moreover, the quirk name is inaccurate. I have a "ThinkPad X1 Carbon
7th" (as confirmed by dmidecode) and its audio device id is:
        Subsystem: Lenovo Cannon Point-LP High Definition Audio Controller [17aa:2292]
but the patches list:
	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_DISABLE_DAC3),
(notice the mixup of id 0x2292).

Applying the following diff brings the volume back to previous levels
and brings functional volume control:

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 68832f52c1ad..ed41e3fb5566 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7260,7 +7260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC295_FIXUP_DISABLE_DAC3),
 	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),

I can send a patch to fix the problems for my laptop but then I don't
know what's up for other devices that built on
ALC285_FIXUP_SPEAKER2_TO_DAC1.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
