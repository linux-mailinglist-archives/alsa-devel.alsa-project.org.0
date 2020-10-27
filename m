Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC529A5B1
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 08:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D9E16A6;
	Tue, 27 Oct 2020 08:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D9E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603784679;
	bh=EmajjuODeoy2bGP4LE6LWcSm+88zUoXnt8ljsimwoHA=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwucqTgieJ00sLwgNIBw4Aptl4x0GelJyNL0Rwc025R9SMBfIIrAGydiPsL8CxFta
	 emZqultiJrDCiquhmi1T1KBNYV/CelkqmWPjo7d4FY3AUUsA89SLeFlYXQoNatYNtC
	 c8nWsqlwYS9XepFEOKcWp3nEdp4gjsR/AYo6/kkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC59F801D8;
	Tue, 27 Oct 2020 08:43:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3EBF8020D; Tue, 27 Oct 2020 08:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4DF1F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 08:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4DF1F80086
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kXJdC-000241-VF
 for alsa-devel@alsa-project.org; Tue, 27 Oct 2020 07:42:59 +0000
Received: by mail-pf1-f199.google.com with SMTP id x24so431042pfi.18
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vjBTmlur4S+6L78WlNF3x++nFUbCLvDVi46xZz3zYpE=;
 b=Ro4pjCFRavsfuPF92Z9GrijKEsjF3vHqp4AYwNjxu/WUSm6juG65CVqH2NaafemxBE
 jk5azAmv48wZQjSdVui+ob5xsFAKg4qFhx6TnJpBhDygL1El4deuDS9HzGs6LO2yXG4g
 sagMjtb2OGBPMNtc1SKLcV5BAyRCRHi/S8TfXmNMMRQRcw51Vd1S6+S+kHM0EjlcEocS
 9WkPAvG3svWnGLPdoxz9nTwUFa6/q+9rbQDiZ8gOuNKvbJzwLkAKK5CuaubUyRcv5wr2
 c89/MZlBMCVuo09UswmJ/ThpxK7DzNBbNZ9NQAsnGiZkSzwGK4x6aoJ/RT/YwgPJoKpO
 1QnA==
X-Gm-Message-State: AOAM531gQICIftnANNVbp08xfjVY6rt4Gr7C5mG4F08nKDPgqdc3OVZm
 /28uvfsA7cPQm1yZs4k7eMHbxF3585tddIu+Zrs7R5fN83bMstVpCPoFOYNs0gMQuzlkAMbO7jK
 UKtqjdX5YO1PnXwNan4aXJoj3UA7OwZFdeWMs8FNW
X-Received: by 2002:a65:508a:: with SMTP id r10mr842468pgp.307.1603784576727; 
 Tue, 27 Oct 2020 00:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpWh5uvxiSN6j6mhUOK56nhuZlhIjzT3g50otq4ptMM3LFXs8p+I7SF+v5vqGOHjNuYzcwIw==
X-Received: by 2002:a65:508a:: with SMTP id r10mr842439pgp.307.1603784576242; 
 Tue, 27 Oct 2020 00:42:56 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id s131sm998111pgc.18.2020.10.27.00.42.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 00:42:55 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v2 2/4] ALSA: hda: Stop mangling PCI IRQ
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hmu082k8s.wl-tiwai@suse.de>
Date: Tue, 27 Oct 2020 15:42:52 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <5A5FF9D8-25B6-4AE0-B7A0-449BB6E40D98@canonical.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
 <20201027054001.1800-3-kai.heng.feng@canonical.com>
 <s5hmu082k8s.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Hui Wang <hui.wang@canonical.com>
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


> On Oct 27, 2020, at 15:36, Takashi Iwai <tiwai@suse.de> wrote:
> 
> On Tue, 27 Oct 2020 06:39:59 +0100,
> Kai-Heng Feng wrote:
>> 
>> The code predates 2005, it should be unnecessary now as PCI core handles
>> IRQ much better nowadays.
>> 
>> So stop PCI IRQ mangling in suspend/resume callbacks.
>> 
>> Takashi Iwai mentioned that IRQ number can change after S3 on some
>> really old hardwares. We should use quirks to handle those platforms, as
>> most modern systems won't have that issue.
> 
> I believe it was S4.  And this pretty much depends on BIOS, hence it's
> hard to apply the quirk, honestly speaking.

Ok, S4 is indeed hard to handle.

> 
> And, if we know that we need a quirk, dropping the code completely now
> is a bad move.  If any, this should be applied conditionally to the
> "known to be modern" platforms, but this will make the code rather
> messier, OTOH.
> 
> Do we need this change inevitably?  Otherwise I'd skip this one.

Ok, please drop this one.

Kai-Heng

> 
> 
> thanks,
> 
> Takashi
> 
> 
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> v2:
>> - Wording.
>> - Add info on IRQ # can change on old hardwares.
>> 
>> sound/pci/hda/hda_intel.c | 15 ---------------
>> 1 file changed, 15 deletions(-)
>> 
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 749b88090970..b4aa1dcf1aae 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1022,13 +1022,11 @@ static int azx_suspend(struct device *dev)
>> {
>> 	struct snd_card *card = dev_get_drvdata(dev);
>> 	struct azx *chip;
>> -	struct hdac_bus *bus;
>> 
>> 	if (!azx_is_pm_ready(card))
>> 		return 0;
>> 
>> 	chip = card->private_data;
>> -	bus = azx_bus(chip);
>> 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
>> 	/* An ugly workaround: direct call of __azx_runtime_suspend() and
>> 	 * __azx_runtime_resume() for old Intel platforms that suffer from
>> @@ -1038,14 +1036,6 @@ static int azx_suspend(struct device *dev)
>> 		__azx_runtime_suspend(chip);
>> 	else
>> 		pm_runtime_force_suspend(dev);
>> -	if (bus->irq >= 0) {
>> -		free_irq(bus->irq, chip);
>> -		bus->irq = -1;
>> -		chip->card->sync_irq = -1;
>> -	}
>> -
>> -	if (chip->msi)
>> -		pci_disable_msi(chip->pci);
>> 
>> 	trace_azx_suspend(chip);
>> 	return 0;
>> @@ -1060,11 +1050,6 @@ static int azx_resume(struct device *dev)
>> 		return 0;
>> 
>> 	chip = card->private_data;
>> -	if (chip->msi)
>> -		if (pci_enable_msi(chip->pci) < 0)
>> -			chip->msi = 0;
>> -	if (azx_acquire_irq(chip, 1) < 0)
>> -		return -EIO;
>> 
>> 	if (chip->driver_caps & AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
>> 		__azx_runtime_resume(chip, false);
>> -- 
>> 2.17.1
>> 

