Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CC227AAE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 10:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB181681;
	Tue, 21 Jul 2020 10:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB181681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595320292;
	bh=nTAeY1SPKEkq97IomYnKNRq9CoU0koH2iE0X15RCkFA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joFg+xSLJst37kNAp/L4fQf70sqHrB/qsk7ByzLUdEKfXxJdB/uQJ1LzCQQjA/VH/
	 xEZDmnSIpb/SwSVF421j95Nll6GxXxvNPaFDLHFL+6/wQIViOd7IuAsqRyVPzPlXAL
	 e3/tyOywWLjTY2US1wYItibu7XMk/2ylTZAOXR/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D25F80212;
	Tue, 21 Jul 2020 10:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC4FF8024A; Tue, 21 Jul 2020 10:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 821BAF80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821BAF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k+zGk85L"
Received: by mail-ej1-x643.google.com with SMTP id lx13so20824994ejb.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sWMdEtvZzs7PbWGaq9h/hghSQUb0Cd7SaIP+POgollw=;
 b=k+zGk85LpUzvLPQTOk0QWEUBapABmX0vrrtg9QM4e3zb9l81918b914+cPgwgfWg20
 GL/oA/G3WS6MyX3VpYx235PnpZBkyrGSVwC3OyQiBTzkvalpr/Sc3tMKRdqdzdhzdiRP
 RCubd6DWR0XD4qiTKZmb8sVX6b+QiSJ8kVS99dCJg5rh2Os1xHLXiUUc10s2GhyJFmnq
 OwHE12apTsBEd8ixN10DkNppSMuTP1cJndviKSy3S5gIdGejnitQ3utKI/g0psoT9kpb
 SxUvAV0N4wrIiF8PT627kszbeeWs+sFabV/phEl8qJG2A5y5qeqBZ40/6KrGL8Y+8ShM
 Nxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sWMdEtvZzs7PbWGaq9h/hghSQUb0Cd7SaIP+POgollw=;
 b=jkQ74jdTd1wuJ5mOoJdArGSxbw7MDtxS7nOUonZzICNNAsD8FYSoIomXYh3gQNArsR
 CY1U7UiBNxNzVuAPR1zy0gj/rp3NQgWvJqvO8pRBtf7B9o6rIh/kgssGskxBqZXQGrFy
 1PtS1Gu3O/BNyhR85H1itnRVULejANyVRD62MZeZ4cNAg/rfigDT3Hfy15rorMCutVUA
 dbztwPeejK1LO8OMKRLF/Kvn/lJGYnGMCF7OlU7geNxTBk+Bf6cI5nkXCu3d1N/47BGG
 F+01ShGUpUHeSLL4IW7Kt86b83dm+kIGe3SDqxpbaxvIcXghWC1BGJHMJzlEkdua+TnU
 sfuQ==
X-Gm-Message-State: AOAM5320LvvrwuwDLGEOwoB+EpTpb6ZfETEwxAerYEPI/S6OT9vgaemR
 fIWIfRt8lbDEU8WIStU+Nr0=
X-Google-Smtp-Source: ABdhPJyZwiY0MAlO/VR7QYIkw2xA2iuNUxT7sfpoNsPzm+glwSuYuftvNPXO4RpGMpvAv/ZkLvAl6w==
X-Received: by 2002:a17:907:2633:: with SMTP id
 aq19mr9496ejc.127.1595320170320; 
 Tue, 21 Jul 2020 01:29:30 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id q7sm16323618ejo.22.2020.07.21.01.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:29:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] snd-usb-6fire: firmware load and pulseaudio assumption
To: Takashi Iwai <tiwai@suse.de>
References: <20200721064853.9516-1-rene.herman@gmail.com>
 <s5hlfjdz46r.wl-tiwai@suse.de>
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Message-ID: <a0684b66-cbe3-de56-1841-3dc10df1fd5c@gmail.com>
Date: Tue, 21 Jul 2020 10:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hlfjdz46r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

On 21-07-2020 10:02, Takashi Iwai wrote:

> The patch needs to point to the right path that is applicable with
> patch -p1 option, i.e. it should be like
>   diff -up a/sound/usb/6fire/xxx.c b/sound/usb/6fire/xxx.c
> 
> At best use git for creating / submitting a patch.

Blast. I did, but worked against an isolated (DKMS-ed) version of the
kernel driver. Pardon. Shall re-setup against the kernel as such and
resend after dealing with your other two comments. I.e.,

Re: [PATCH 1/3] snd-usb-6fire: Move DMA-buffer off of the stack

> Could you rather change return with goto out (with ret variable
> set)? In that way we can see what actually you changed more clearly.

I already did exactly that though and in fact, the original not doing so
is what makes the patch seem involved. With the added kmalloc() I change
it so that all returns goto out, which kfree()s again. The only one that
does not is when kmalloc() fails, i.e., when there's nothing to kfree().
I suppose you just misread and do not need to have that single one go
through a goto as well?

Re: [PATCH 3/3] snd-usb-6fire: Unmark struct snd_pcm_hardware const

> This must be superfluous.  usb6fire_pcm_open() changes the field of 
> the copied pcm_hw, not the original pcm_hw itself.  Otherwise we
> must have got already a compile warning / error.

Unfortunately no; it's as mentioned in the cover letter accessed via
pointer: usb6fire_pcm_open() sets "alsa_rt->hw = pcm_hw" and then
changes pcm_hw as e.g. "alsa_rt->hw.channels_max = OUT_N_CHANNELS;".
I.e., not a copy.

And yes, it had me wonder if this was "allowed" in the first place as
well (the same pcm_hw structure is also shared between playback and
capture) but it does seem to work fine, so just unmarking it const seems
a minimal fix or, better, "cleanup", since nothing complained, but the
const qualifier no doubt at least /conceptually/ means it could be an issue.

I'll re-setup against the kernel as such and wait for reply on the above
two comments to know what to re-submit.

Regards,
Rene
