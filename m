Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6D358DF1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 21:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430821616;
	Thu,  8 Apr 2021 21:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430821616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617911918;
	bh=xuPexxS2oH935upH7QYK/BvRG0N4QChDGJbZl+Y0sKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDRIdoFn5KofYvI5UPWZ6Gg9WQnay8Wjo/XxKhSGQnngK0wVtccoV8KLTxMXrC+UB
	 ZsMWbCEAX0Ms863jDLwK9E9GgAyLI41xE4IOPovyVzO9Y5BwaI5KrIBAwuzN55hvag
	 Nvc8N64sTuVuHKBr4GjW6RlcBQONcxbRQ5UrOA2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6FC1F80246;
	Thu,  8 Apr 2021 21:57:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A706DF8020B; Thu,  8 Apr 2021 21:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 419EAF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 21:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419EAF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VoMkARrp"
Received: by mail-qt1-x835.google.com with SMTP id y2so2404788qtw.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xS9D6D57vUeEJ93a/ktDmQfKw71EH3gfxaLkADQfZps=;
 b=VoMkARrpYZD53w09CAvnMcVZUMhiUaqz4jwHU4rgR/kCoNuDkkAOEjB0DRXDN30vwN
 QXTGvOMnF9IpDJgN0sTYwjG3OGQO9q5sV3t5e94BvZgnp7bVu83hv3OWL09n9PuU5R8T
 GB4p3qH2pOtdR/xqr87Dg3Gv4O5SEEE4GnXIYhgJ6huisYaFta4cH9mgaXKp9vKuI4IN
 DO30efky5N35aCXw7VXRLWQrR/91SreG0rSUI70bGdynmF390FelEeg2R4ntoNLfgQ7M
 ro1aU/uqcgVAM2rCsZSxL5r5fGs1PGvGIwHisY3FHzCh01652xTMTsWzdYGfmuwZjE1X
 h6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xS9D6D57vUeEJ93a/ktDmQfKw71EH3gfxaLkADQfZps=;
 b=O7wYExgHYbzgQt1TUZtSIEZytN5KoRVe0bn7CReCh4SzTEr00pzzQuX2BkmkqpwxQB
 5frDxXctivqiF0RvLD0N0kqWhgQa3+t3OQ7Ey85KSEiozvXtOcp/63ncDzhv3QP7b90j
 LQkXtV2/wwu9aH9+4SeNjOETJW7xNQhSq7PmiyzwLJu3G2b+Ygx7xDT8UCm6am3wUxBY
 uA8XKj+MiZaA+clECCdaeZh9CqdUuoJiNNCpEzYA2vv/lh3skMMgFUPGfLVH4G0RjS9q
 9pftN6PMQnxumEVt6HU0IdCIPqTsHc+ZIpu52/i2JYwcMeUSVgsdpG0o58phKVnA0hpj
 mPAA==
X-Gm-Message-State: AOAM532tn7nxHTk6qTP5LNP9QHKwqmhDzgAsfLxFgmhth+jYvC+8W82S
 GxqZBcx5m9rqumyvW6h2bPHiiM0lqLnmHeIKzYeVVw==
X-Google-Smtp-Source: ABdhPJxnYlHShleLFhAAtQy5BIquoPV4jEfW6D6q0I6V/ZhrMPDeG7msSCaFAdOe2odGCFGcflCS+ZaC9jWPRrGHL2U=
X-Received: by 2002:ac8:750f:: with SMTP id u15mr4010486qtq.24.1617911820934; 
 Thu, 08 Apr 2021 12:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation>
 <s5h35w182a5.wl-tiwai@suse.de> <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <73f65944-604e-1ca0-5ba3-dcbec0d9fcd7@perex.cz>
 <a8fa564f-4ab5-9847-d041-6c851e48acb4@linux.intel.com>
In-Reply-To: <a8fa564f-4ab5-9847-d041-6c851e48acb4@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 8 Apr 2021 12:56:49 -0700
Message-ID: <CAOReqxjwfhu5vP_rzMxMmLdMHDb5KxmQHRkkjkJUFwhFonejsw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, Apr 8, 2021 at 12:43 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
>
> >>> Yes, I'm talking about rules which depends on the sound driver
> specific sysfs
> >>> attributes (you can match the modified /sys/module/*/parameters here).
> >>
> >> you lost me with 'match the modified parameters' wording. who matches
> >> and who modifies those parameters?
> >
> > You can probably add something like this to the sound-card.rules:
> >
> > SUBSYSTEMS=="pci",ATTR{device/driver/module}=="snd_soc_sof_sdw",
> >
> ATTR{device/driver/module/../snd_sof_pci/parameters/tplg_path}=="intel/sof-tplg/pdm1",
> >    DO_SOMETHING_HERE
> >
> > DO_SOMETHING_HERE may be ATTR{longname}="My Long Name" for example when
> my change is accepted.
>
> Humm, not sure this can work due to dependencies.
>
> The machine device is neither an ACPI nor PCI one. It's a platform device.
>
> When the PCI device is detected, the PCI core will call the SOF driver
> probe, which will first try and boot the firmware, and then create the
> platform device. That results in the probe of the machine driver which
> creates the card, but that happens *after* booting the firmware.
>
> the DSP firmware is setup starting here:
>
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L138
>
> and the machine device is created almost last, after registering the
> ASoC components.
>
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L234
>
> when the card is created, it's too late to change the firmware path or
> any firmware-related parameters.
>
>
>
Thanks for raising this to my attention Pierre, yes we are also
experiencing a similar issue since chromium builds will have default sof
tplg and fw, but chrome builds will not. Since our UCMs are in a single
location right now they will contain commands that will not execute on the
defaults and we have no way of indicating to our audio server how to handle
this. I am definitely interested in seeing a feature where we can pass
indicators to the UCM about what we have available.
