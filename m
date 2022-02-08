Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1F4AE26D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:47:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0315F184E;
	Tue,  8 Feb 2022 20:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0315F184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644349676;
	bh=Q/XVyG0XFJKo6R6eJEbVkdYTWkiZVoIaqaQiXjcMm+I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BO0BagQxmSACXSYKNr6qlukKdkYrK9tRc47vW4KBA+8wcIAZRZt4mHvNghJDHQ2Qj
	 piDTDbVz6Y5HmpwzneaDGVtgm/U4m+EbWKhgChIxCeNT0yty0fZwmJ9O/yO1SpIeDa
	 mMbzVZNr+A5N2FJsvEdqcX8V0A6BDC7N6ZV5Xbnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6633EF800E1;
	Tue,  8 Feb 2022 20:46:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5458EF8013C; Tue,  8 Feb 2022 20:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F33EF800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F33EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dxvNMVA9"
Received: by mail-lf1-x136.google.com with SMTP id f10so35281163lfu.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=mS3C+Wo/VrSubSEHXbpL025cTzdbcGtIyC7RL2QVj1k=;
 b=dxvNMVA9VhI2Ic4/NqHu66Bawb1X5QOhCGBr7npMY8t0pMy5egEwQ0zGOws3/p5UVU
 obo6BmPk66JYaDw/VWbvHOvxEkyB6IG4uQPA681CCErEaT175YwGVuJ8hRr2LNGEdwJv
 hwvryfKvyGmCbsbR2brFkXCc0SXJJQiKzHmb9mtpqzIYoPWXLhPfAyq3Ep0QpJXxQ1PX
 eV3kPJ1Yhmj1kkjoI/XdB8AToWTvdeLOwvfrez2kcWfcNbEzbnK2sqKBaZHZiWtuYIix
 9Sq4+XseteOthTLKIlejiaY2MjChGKOPPyznlI8H4jXDySKECV5FKj6mblYepfNKbH3B
 LzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=mS3C+Wo/VrSubSEHXbpL025cTzdbcGtIyC7RL2QVj1k=;
 b=qbENgvdv0+ShUQdz7w4yG8xYaEwsyWdc9Nn20Bb9z8tGchQjbSIzoAfXdSbrHchEdk
 MWn3+a0DqADqGts3sxCUv7yVKgJiOKyr0MUZbwBwxIiSWlxZTbAAfhC6Fj1rtxnPLG5l
 4A6TN2xO60mQ9Zy/F3AfIzzvOFiro9WBnM7X73LAbBgD22jvtUXEPNxKHRnyZ5y7gpdV
 cG9kqAX5qzzzydqvuTOTMBCgwceOFoqQ0bgbVusfPPh9wCn6zZQs7r5X5XtJcSO1dXVJ
 EnmFkD6nMIqHeykRYZHhNwQ0llU4nqF/ZL9x3Z2LDku5aLcUQE0lNly5ocsQjj7l0aFf
 gN0A==
X-Gm-Message-State: AOAM533H7HGRkSGVyt6rm1hGWrsCunpXE4ZvExsSCmhRYgam1rHxh4ZC
 ZpjLfWdLdFpvg/JpWs0dl8TRwtFOmtw=
X-Google-Smtp-Source: ABdhPJxEzT360EJlxEiU+T+hZd/m/GXxo+WymxxJdJOvSwtymCUmypCgsT6c6ReKKHiNy7lhnZElsw==
X-Received: by 2002:ac2:4acf:: with SMTP id m15mr4040567lfp.580.1644349599141; 
 Tue, 08 Feb 2022 11:46:39 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id l12sm381178lfg.32.2022.02.08.11.46.37
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 08 Feb 2022 11:46:38 -0800 (PST)
Date: Tue, 8 Feb 2022 22:52:37 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220208195237.3tnsslzaj2pmzr25@localhost.localdomain>
User-Agent: mtt
References: <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
 <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
 <20220130111020.44gzrm5ckrakjta2@localhost.localdomain>
 <s5htudk9cn3.wl-tiwai@suse.de> <s5h4k59s9wn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h4k59s9wn.wl-tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Tue, Feb 08, 2022 at 03:36:08PM +0100, Takashi Iwai wrote:
> ... and here is a fix patch for allowing more rebinds.
> Give it a try.

It works, no problems with large numbers of rebinds.

> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: hda: Fix driver index handling at re-binding
> 
> HD-audio driver handles the multiple instances and keeps the static
> index that is incremented at each probe.  This becomes a problem when
> user tries to re-bind the device via sysfs multiple times; as the
> device index isn't cleared unlike rmmod case, it points to the next
> element at re-binding, and eventually later you can't probe any more
> when it reaches to SNDRV_CARDS_MAX (usually 32).
> 
> This patch is an attempt to improve the handling at rebinding.
> Instead of a static device index, now we keep a bitmap and assigns to
> the first zero bit position.  At the driver remove, in return, the
> bitmap slot is cleared again, so that it'll be available for the next
> probe.
> 
> Reported-by: Alexander Sergeyev <sergeev917@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/hda_intel.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 4b0338c4c543..a2922233e85f 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2064,14 +2064,16 @@ static const struct hda_controller_ops pci_hda_ops = {
>  	.position_check = azx_position_check,
>  };
>  
> +static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
> +
>  static int azx_probe(struct pci_dev *pci,
>  		     const struct pci_device_id *pci_id)
>  {
> -	static int dev;
>  	struct snd_card *card;
>  	struct hda_intel *hda;
>  	struct azx *chip;
>  	bool schedule_probe;
> +	int dev;
>  	int err;
>  
>  	if (pci_match_id(driver_denylist, pci)) {
> @@ -2079,10 +2081,11 @@ static int azx_probe(struct pci_dev *pci,
>  		return -ENODEV;
>  	}
>  
> +	dev = find_first_zero_bit(probed_devs, SNDRV_CARDS);
>  	if (dev >= SNDRV_CARDS)
>  		return -ENODEV;
>  	if (!enable[dev]) {
> -		dev++;
> +		set_bit(dev, probed_devs);
>  		return -ENOENT;
>  	}
>  
> @@ -2149,7 +2152,7 @@ static int azx_probe(struct pci_dev *pci,
>  	if (schedule_probe)
>  		schedule_delayed_work(&hda->probe_work, 0);
>  
> -	dev++;
> +	set_bit(dev, probed_devs);
>  	if (chip->disabled)
>  		complete_all(&hda->probe_wait);
>  	return 0;
> @@ -2372,6 +2375,7 @@ static void azx_remove(struct pci_dev *pci)
>  		cancel_delayed_work_sync(&hda->probe_work);
>  		device_lock(&pci->dev);
>  
> +		clear_bit(chip->dev_index, probed_devs);
>  		pci_set_drvdata(pci, NULL);
>  		snd_card_free(card);
>  	}
> -- 
> 2.34.1
> 
