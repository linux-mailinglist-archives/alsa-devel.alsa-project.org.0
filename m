Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DB215058
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 01:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A269A16B5;
	Mon,  6 Jul 2020 01:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A269A16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593991311;
	bh=gkUBbEi7G+X695Jpi218T3jnRQ/bQoXA52qKE3DMLwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfnVKRPo9qNb/XXuBwtX6LoC99FODarcPUnXabuksMh/fKIPVBvHNZuli5P5OpAWS
	 X2iP0I1QGWmy3GWlfhvl8l+14o/5TUMnK+hDQSMLbc0f5phOgnXleiz+cQdNt8dbKG
	 cSPeHG6wN7rTqA8UghVBxo+eXiky7oLJr6T5K6dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A9BF80257;
	Mon,  6 Jul 2020 01:20:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C6ECF80216; Mon,  6 Jul 2020 01:20:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_18,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC1AF80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 01:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC1AF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GswXYfzQ"
Received: by mail-pg1-x543.google.com with SMTP id m22so7167600pgv.9
 for <alsa-devel@alsa-project.org>; Sun, 05 Jul 2020 16:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GXYdRghxIVGxX+EKtrdJwB8zjgLVhk5+J6DCSYK6RF4=;
 b=GswXYfzQO0x1v32iO9ThUQfNat5VjJn+hGeHWvPVl3uGDug6Iz+4Kuw/xZ2dSoOyRR
 wl4zEiIplNYDpiY7E58IP83cAFjw61E9EAlqg9ylHYAISAKbwCUiOtVvDKNq0qVNDlmy
 eignyVbbGizQiC1zn0mhwEs3DpMrizLsy5jyyq/zoyY+ELRyeUYthq/1fcS2iHOUNOQH
 UUr6KIG6KZ+j1562u/Nyfy4d7IGbnk9uvepq7OQPk77HBVFbvsBJh2uDFNp2WEY2wRYq
 Qg2qObRHn4rXZSFOnI8auxUs44gqlhLh5eCtLg86kKm0wzIGOCfu48InK9saJ3Fs9uEV
 HXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GXYdRghxIVGxX+EKtrdJwB8zjgLVhk5+J6DCSYK6RF4=;
 b=Ph2h96H5X3BDqdScB/94XL8X8HHjVWXDiBkgXYR0KFtbV4oepldkbNvxqp2S3+VpOh
 z93MghbrPk59dRfS8qxRRn/l4PunNofrlGhtSQ507U0DN43ladKlE6RACGz/2T0XhQ+S
 1+qay3tVxJvXdTzy5NFAr65AC+/n0rg5xCLLLJ/BiL+uEqBOA7WBvjgfOQsj76rmgntp
 BX9Ijxy67LqBHkB2iL9T/DyjcyMV8ZFOfgPgj9oNhAvbxXnSuKnEZw//5GZ9WXmFzLcT
 SiI1rnf8TjELtn67km/Rc9vZA1pDkmPIFNxTX88Kie5JiwM+2xkzpx0DV2y2sx6iXDnX
 eNwg==
X-Gm-Message-State: AOAM531fRERa/dBz9Wa/kPwlI4kvOzzQZ3WG39NFla4Y886A8tTKnCkM
 UVWbXC7EKvYiSPf8EA/Qtpk=
X-Google-Smtp-Source: ABdhPJx0i/yQ8CVMjW6awoLGI1d6BjwsGZVPHYyKIBnTXev2dMHaY1ZqtYaOOBeNQsoT9ATszHE0bA==
X-Received: by 2002:a62:26c2:: with SMTP id m185mr23136599pfm.95.1593991199935; 
 Sun, 05 Jul 2020 16:19:59 -0700 (PDT)
Received: from f3 (ae055068.dynamic.ppp.asahi-net.or.jp. [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id y9sm10078561pju.37.2020.07.05.16.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 16:19:59 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:19:55 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo Thinkpad X1
 Carbon 7th quirk
Message-ID: <20200705231955.GA2439@f3>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
 <20200703080005.8942-3-benjamin.poirier@gmail.com>
 <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

On 2020-07-03 12:33 +0200, Jaroslav Kysela wrote:
[...]

> > @@ -7559,8 +7606,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >   	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
> >   	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
> >   	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> > -	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> > -	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> > +	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_TPX17_DUAL_SPEAKERS),
> > +	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
> 
> It will cause regression with the old UCM configs.

Yes, good point. I'll try to find a way that doesn't need ucm changes.

> I would preper the manual
> model selection and switch this when things settle a bit in the user space.
> We definitely need a better way to control this volume separately for both
> tweeters and the bass speakers in the user space. The "Master" volume hack
> is far from the ideal solution.

[...]

> 
> > The volume control for PCM-OUT2 is renamed to reflect its dual effect.
> > This name is also used in a modified alsa UCM profile. [4]
> 
> The new name is not ideal. Perhaps, a mirror (joined) control might be
> better in this case. I mean to create both "Bass Speaker Playback Volume"
> and "Headphone Playback Volume" with the similar NID control.
> 
> Or create "Speaker Playback" controls with 4 channels (and joined "Headphone
> Playback" controls).

I'll look into that. As I'm working on this in my spare time, no
guarantee on how long it'll take.

Thanks for the review.
