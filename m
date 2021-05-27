Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2963924AD
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 04:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656F1170C;
	Thu, 27 May 2021 04:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656F1170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622080971;
	bh=zZtbcaLYQh3e9AXPt6H86r3iJV5qIHyybnOkJo+pHRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKbMW4eABvaEo1elsJTDBahDHKuEAM/h5EZVmJIzV88+1OrPHNcar7RvyEa6yLl49
	 gPgAfIiNijJ+SiW6hFjXU6Tc46dQgBXTNHIn6Zfu2+B3l1daYdaEMWwaRfuqOqhnTL
	 lNr4pM3C99ITmOSRccbysa3/Iu8aTabgA3prvIvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA403F80147;
	Thu, 27 May 2021 04:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 453C2F8012E; Thu, 27 May 2021 04:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D688F800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 04:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D688F800EA
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <jeremy.szu@canonical.com>) id 1lm5KI-00008d-F5
 for alsa-devel@alsa-project.org; Thu, 27 May 2021 02:00:46 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso1114157wrc.23
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 19:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eO/Q7/DwdHgvkIjY5sWiF4+6czPdEPcOWJ8cjVak3Sg=;
 b=DwXayyk7oRMd3tAMDFIM9Y4kJGI2uNoF/zus8OTq5U68LRAyEePxc6kIZH723fVbfi
 9Yfmo48euPPJ3x2kg7cRWc7PtuyXlYFbbL6MlSMTsxHItfeHG/k3fcF+2OkQHAIva4KJ
 VYjJpzAcctdtQ0ksXGuB+jO0BqbnP65uwbFBGKalI3VdVmEWu/iLXMzpuk4GqXIylYRg
 I9NecxmYq+0mv0f21CoY8hVAXc1QBaN0Khwy1e1XuECSw+NozfttpA9ePq9ZZpQkekbi
 CodNHfjnBzx7Pe4NAexBl72xBuLqTXQr9kc/BnWK/vYAJSudut8ceihbmPwklZz1yark
 ArWA==
X-Gm-Message-State: AOAM5303M6MeEvvf+XJNrMZqLUTeSv08KfxbZqZIyZL2AAFT0xFvwVl/
 cb0mYsHbTyw2tU2vZxUsa4L8fLI7s5btKkHogESBtZPODloKHFJgGidtMeyb80XNrZz/MfO9gTS
 blf/koFmlE9h2zAYdF4BOCo4fD2RXfcU6/fBFuOps+lDQj4NluLbw+etI
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr1054045wmq.23.1622080846092; 
 Wed, 26 May 2021 19:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEvsKjX5vb6v9LJQTnIbKsJVPCMP26VU/hVaoqYsv3G8T765p39uC6V4zYsYwNTnZ7ewtnItkx8x5xAUazLDc=
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr1054034wmq.23.1622080845788; 
 Wed, 26 May 2021 19:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
In-Reply-To: <20210519170357.58410-1-jeremy.szu@canonical.com>
From: Jeremy Szu <jeremy.szu@canonical.com>
Date: Thu, 27 May 2021 10:00:34 +0800
Message-ID: <CAKzWQkyzbUU8FekwX+_pkxSVFv0_1xjOQa7ztJRMR02cunP+tQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
To: tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, open list <linux-kernel@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 Hui Wang <hui.wang@canonical.com>, PeiSen Hou <pshou@realtek.com>
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

Hi Takashi,

Would you please help to review these quirks? Many thanks.


On Thu, May 20, 2021 at 1:04 AM Jeremy Szu <jeremy.szu@canonical.com> wrote:
>
> The HP EliteBook 855 G8 Notebook PC is using ALC285 codec which needs
> ALC285_FIXUP_HP_MUTE_LED fixup to make it works. After applying the
> fixup, the mute/micmute LEDs work good.
>
> Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 552e2cb73291..9d68f591c6bf 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -8291,6 +8291,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
>         SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>         SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
> +       SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
>         SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
>         SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
>         SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
> --
> 2.31.1
>


-- 
Sincerely,
Jeremy Su
