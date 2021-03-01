Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC832937C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 22:28:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115821657;
	Mon,  1 Mar 2021 22:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115821657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614634105;
	bh=+DQG0ZV1BCLib8cEzrRLXdjqtPmyd307MIBSCK4Ee3k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KusOZsnPqwZCFIzEgaCxIKiefLDEG0W8MCchalJHbA3SPWvRdIZprQ/TK7+0egiCC
	 5AwJYR/hJb4TfmrldJG03G+wgSUcHUAgzGi48AEX3J7H28RkqIpjwMfjJkRV4Btmt4
	 DN/X4FLmsLrmPWs7RHla6bzynIFq4NMueKLeEQsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E7DF8010B;
	Mon,  1 Mar 2021 22:26:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040A3F8025E; Mon,  1 Mar 2021 22:26:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC29F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 22:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC29F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ZM1N6ZOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614634004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqAbMfi4tA/vMW0gKRC7n8527XAbhXxKcWa1t6aLH2Q=;
 b=ZM1N6ZOQ8mI7UzzlftAozej+oKElsvypGQt5pDzwxOEf3RcdmW6fRehqkUkXX8LaepuJOl
 8b/qWann12JaxaOGuHMYgIFmn9ekKFYxLhFKPBgiRV8U17dxN9whoSNJiWWtqq5IuqmqEh
 chp6VhS69IL0c2CaTJOLw8iFQVAzwis=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-faBm8G3kOsa9Ck3sMPtQvA-1; Mon, 01 Mar 2021 16:26:43 -0500
X-MC-Unique: faBm8G3kOsa9Ck3sMPtQvA-1
Received: by mail-ed1-f72.google.com with SMTP id q1so9553906edv.5
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 13:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZqAbMfi4tA/vMW0gKRC7n8527XAbhXxKcWa1t6aLH2Q=;
 b=KLv1amxdB+pWlixxMyMCaj8KXPe9ITzF8y9FfuFkI+iD3W8tZJgHubRW4IfZKS3CcD
 Ei3EEiMMiERFyXOsZsjEJj0SWjk2eD1s/H+CQe5j4vK9IYlbS4sCE8V5Q8V8MIZ/YdOZ
 vddt5O9mKgPMbogNrFuQAcM1/z58dONp3BwEHIW3/c8jkvtZWeJgqfMK/clIXFksjDYc
 y+2r7TPHlFT6blOMVWkNIM3CUmmiKLtfF0XTMK7wLsdSNcgcVPgNFNVPhPQgTREWUBKN
 RYWxSP6vbh4nOEueBRDC55rTlBGRak3yEV/LNnbIvA+QSQNSr1E3+eMTU0bYyUZez23p
 U8dg==
X-Gm-Message-State: AOAM532ORncbWe/WQjI4QNaitCTI0pEWi/Z/VZccYZZJNBgW4msL4jpx
 6Xtt6hS/rFWfKmNl7bcnCQGOYam8j5/eIAFyRdMsW0hjlwFGkxxbXH9KlJkg/815IXP/4ChKXoC
 I6U/6zInS4SQ+JZ5ErkzCqxVUCxb5KH3FConUN0NAnF/kEKFc3JNTxe8o1Zgyev3ThlK8ZH6ej2
 k=
X-Received: by 2002:a17:906:3e92:: with SMTP id
 a18mr11704094ejj.95.1614634001916; 
 Mon, 01 Mar 2021 13:26:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDd3gdKVU+HryHIH+IL2re7OuCTkTJ5lOypsAyXzIDlcgyB7XikIwbnDwrg0517AdrHcYxqg==
X-Received: by 2002:a17:906:3e92:: with SMTP id
 a18mr11704082ejj.95.1614634001698; 
 Mon, 01 Mar 2021 13:26:41 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id ck9sm16055075edb.36.2021.03.01.13.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 13:26:41 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
 <20210301204313.GK4628@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
Date: Mon, 1 Mar 2021 22:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301204313.GK4628@sirena.org.uk>
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

On 3/1/21 9:43 PM, Mark Brown wrote:
> On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
>> On 3/1/21 8:15 PM, Mark Brown wrote:
> 
>>> Off the top of my head something like writing a control name into a
>>> sysfs file might work, it doesn't scale if you need to use multiple
>>> controls as rt5640 does though.
> 
>> Currently ALSA/UCM does not use sysfs files for anything, so this
>> feels very inconsistent with how all the rest of this currently works.
> 
> Yes, you'd really want to add string controls in ALSA.

Hmm, we already have SNDRV_CTL_ELEM_TYPE_BYTES controls. I think that will
work nicely actually, we can have the UCM conf file send a 0 terminated
string to the driver that way. It would be nice to have some syntactic
sugar on the UCM side to be able to actually specify a string instead
of an array of bytes, but I don't think we need any new userspace API
for this.

This can be combined with a SND_SOC_... macro + helper to add an
entry to the usual snd_kcontrol_new <codec-name>_snd_controls[] table for
this, which when the control gets set/put will walk over all the controls
and find one with a matching name and then add the access flag which
Jaroslav's code uses to control the led-trigger to the matching control.

I think that that should work nicely for the use-cases which I have
ATM and should be flexible enough for future cases. The same control
can even be written multiple times to set the flag on multiple controls
and we could have a write of an empty string clear the flag on all controls.

So in UCM (with the syntactic sugar) for the rt5640 we could then e.g.
use something like this:

# Clear Speaker Mute LED flags from all controls, then set it
# on the Speaker and HP Channel Switches
cset "name='Speaker Mute LED Control' ''"
cset "name='Speaker Mute LED Control' 'Speaker Channel Switch'"
cset "name='Speaker Mute LED Control' 'HP Channel Switch'"

Mark, does this sound like an acceptable solution to you ?

I know you will want to see the actual code before you can give me
a definitive yes on this, but I would like to know that this at least
looks like it would be acceptable to you before spending time on coding
this out and testing it.

Regards,

Hans

