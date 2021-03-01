Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73839328F62
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 20:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 109651676;
	Mon,  1 Mar 2021 20:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 109651676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614628277;
	bh=WgNUJq4zPn2W8Df8CXcLtfK4XRETq1bzVJ8winXmFDA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMc2u6LaB0vvzDrmMtw1kzHMc5/neMF9jhfug0vE6kZ7MCVLIacQtZxrhOR/6CVIz
	 EC9zr0fZL8f1X7tokcsjR/QmoiX7axgPBsnLrvC8yN0YkM8TQMK4OJRXEsLZgD3MwE
	 gYUtvANX3toAya4yQODL0VlOxael0vJyIzDKgrT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56459F800E0;
	Mon,  1 Mar 2021 20:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D7F1F80150; Mon,  1 Mar 2021 20:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD87F80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 20:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD87F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Et+F4NFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614628180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUS2xUIYsiFhF0Ms7r2bkSlSaAG8klDl75j3jEAVogE=;
 b=Et+F4NFLoLjwEntZT/38+xdXkv/msNAaB8gZwNNvt5e3hsSkU+HQSQ4sl4ff64dWxbjgOJ
 Kf0fb6UrhJYjJlXXfWXavDR0ZcxyxZy35PnYyfXcGtTBdJ73sG2xoD+cuYv5Xxt1X/smk0
 lvidvnFFlSgu+7PmhDVXz7MFRHHM/lA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-Bid8J1IpMKKJOb2kGUz9Zw-1; Mon, 01 Mar 2021 14:49:36 -0500
X-MC-Unique: Bid8J1IpMKKJOb2kGUz9Zw-1
Received: by mail-ej1-f70.google.com with SMTP id h8so6578264ejx.12
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 11:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rUS2xUIYsiFhF0Ms7r2bkSlSaAG8klDl75j3jEAVogE=;
 b=K6cOseRrZfM8RIJpnkwITzLfJo2VpGgosJNGW1pOcTdd8ZTMXrEDH9zWqdiWaAXQn9
 tLhXViSHi/TXxoxSH1dVTskwFC7ze9E72yUbrKatVQ563M/unnPCnhvcBageXYULID+h
 BprUH58GQBdORqSMWA+d+9lqglk1sAAHivCmpDKWgZQkkNJ79PsFpLQq54zU50zH7yaq
 ot2cSSXbOd8wT+gak7VC4TA4jxFazjjYYRYTZmwwaX0gNr5ojhEYtY9v8txV/xH60P1p
 vrB80q3XOPcIxLbOr2gHxTqZZ9OgJmoMXqh8kV57HKHK4BWv/+ndyzKINlN5cLvtKSam
 fakw==
X-Gm-Message-State: AOAM530jsKuREUfkZWU+lHBvIJqSXEROjxMnSPsBTH6V1Et1l40UIVcu
 lt1Z0NtoymJ9BOOTprqQlNjQKJ9kI7rD3fboGjlqeYgH7ewwsRNmbo3lmp1TG9XOGn57WXKgSkJ
 gZNS4jHfVzZyKR5A+3IZMB10bGrSjSi6UublapjpRPRYB+T1m5pE2Tw20f/56OSHcj9dT1u9FoR
 A=
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr18050035edk.220.1614628175372; 
 Mon, 01 Mar 2021 11:49:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGZtCv1ZQoJorR0NfTcUx1ZQmwve5lWWmRN965rG41JAhRLz63zRrFoRAU5G6u6zAoQ8pRNg==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr18050019edk.220.1614628175169; 
 Mon, 01 Mar 2021 11:49:35 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id e26sm47222edj.29.2021.03.01.11.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 11:49:34 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
Date: Mon, 1 Mar 2021 20:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301191503.GI4628@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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

Hi,

On 3/1/21 8:15 PM, Mark Brown wrote:
> On Mon, Mar 01, 2021 at 02:39:46PM +0100, Hans de Goede wrote:
>> On 3/1/21 2:23 PM, Mark Brown wrote:
> 
>>> I don't want to get stuck in a cycle of "why can't my system just do
>>> what this other system does", or worse end up with problems due to
>>> competing system requirements when patches go in on more flexible
>>> devices because I didn't notice that the device wasn't a good fit for
>>> this sort of thing but people have the expectation that the kernel will
>>> transparently handle things.
> 
>> So what do you want / how do you want this to work ?
> 
> Off the top of my head something like writing a control name into a
> sysfs file might work, it doesn't scale if you need to use multiple
> controls as rt5640 does though.

Currently ALSA/UCM does not use sysfs files for anything, so this
feels very inconsistent with how all the rest of this currently works.

A sysfs file is also only accessible by root, making it impossible for
say pulseaudio or pipewire running as a normal user to set this up.

So then we would need a database for this somewhere outside of UCM and
a process running as root to write the sysfs file.

> We could also do something like have
> drivers make a list of all output stage mutes and then use that to build
> a standard global mute control which functions similarly to this one and
> could be force wired to the LED trigger input, seems like a big hammer
> but it'd be reasonably consistent.

This sounds like a better plan IMHO.

Jaroslav's current mixer-element based generic LED support patchset
already allows setting the "this mixer-element control the spk-mute led"
on multiple controls and then the LED will only turn on if all such
controls are set to muted.

So that part is covered and my initial plan for the rt5640 was actually
to do just this but the problem is that the mixer element names for
the outputs were poorly chosen initially:

        /* Speaker Output Volume */
        SOC_DOUBLE("Speaker Channel Switch", RT5640_SPK_VOL,
                RT5640_VOL_L_SFT, RT5640_VOL_R_SFT, 1, 1),
        SOC_DOUBLE_TLV("Speaker Playback Volume", RT5640_SPK_VOL,
                RT5640_L_VOL_SFT, RT5640_R_VOL_SFT, 39, 1, out_vol_tlv),

Where userspace expect "Speaker Channel Switch" to be named
"Speaker Playback Switch" (aligning it with the vol-control name)
instead.

And we cannot just rename this since the control names are
used in UCM profiles and if a UCM profile refers to a non-existing
control it won't work.

I recently did an alsa-lib patch-series to deal with other
non ideally named mixer controls:

https://lore.kernel.org/alsa-devel/20210228161304.241288-1-hdegoede@redhat.com/T/#t

I guess that we could deal with this unfortunate naming inside
alsa-lib too. I guess that the alsa-lib folks won't be thrilled
by doing this, but we need to deal with this mess without breaking
compatibility somewhere and alsa-lib might be the best place for this.

Or we could change the "Speaker Channel Switch" control into a dummy control,
the current UCM profiles already disable a bunch of other controls in the
DAPM graph too, so the whole chain will turn off anyways.

And then add a new non-dummy "Speaker Playback Switch" control.

I do know that we need to much more careful going forward to make sure
that control names match the conventions expected by userspace.

Regards,

Hans

