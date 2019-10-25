Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F7E5599
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 23:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D7218BA;
	Fri, 25 Oct 2019 23:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D7218BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572037522;
	bh=0dSPnDv/Zi/ZWBg32Vq/QxQ0YJs9/UoU9FQvszD6bOo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4/3PBCb4gmepyC2tcCYTzAYz2xEBFYyGAouZ9WDPDFg/998YnrUOu9awoQ3yY8AO
	 eWicuNNi4uN9G3Cg9QIVz/+nA2MwYiqUhPZvHTmh8HiDeI7v9J77ikwFQT6kwsWeKp
	 P1kW2Ccf/NBuyb+lrkm84kT0ucZV/AlGDkZqGeqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFDA2F80112;
	Fri, 25 Oct 2019 23:03:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F009CF8036F; Fri, 25 Oct 2019 23:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DFD0F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 23:03:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id ACA69A0040;
 Fri, 25 Oct 2019 23:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz ACA69A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572037411; bh=/SiI4kn3Re8hNhXcGQOQSb5CKvEvXgIbxfEQsXpNGz4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ycprgERq17IJayFSDEqGRcUt5XjoRFwOXeYSGpmgNZnhBSo57hGVtQnHCP/RU4kbu
 sGmjEiwZWOk6Iun2ygrqmlzp+duPl68UL14Vt13AuD9tY7Nibf28i6yrwLDckDREpK
 Fq2J3pHlN4i+tnkrQf2HPX6pN8EcXPvayaa89scw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 23:03:26 +0200 (CEST)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
 <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
 <s5h36fgvs0m.wl-tiwai@suse.de>
 <9403a6a7-9b7e-c2a4-5acf-50d6cbaea7c7@perex.cz>
 <s5hwocsucfp.wl-tiwai@suse.de>
 <83e4dc16-07e7-aafb-db43-01a89e31270b@perex.cz>
 <s5heez0oleh.wl-tiwai@suse.de>
 <12c5e861-dd78-99cc-b16f-5ddc2ad0e33b@perex.cz>
 <alpine.DEB.2.21.1910252050230.16459@zeliteleevi>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ed87baf1-1f2e-22d6-2bd7-267b209310d4@perex.cz>
Date: Fri, 25 Oct 2019 23:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910252050230.16459@zeliteleevi>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 25. 10. 19 v 20:02 Kai Vehmanen napsal(a):
> Hi Jaroslav and all,
> 
> On Fri, 25 Oct 2019, Jaroslav Kysela wrote:
> 
>> the single user. Another problem is that we are not able to review all those
>> mistakes at the merge time. It is not a complain but a true fact.
> 
> but the strings are in kernel patches, so even if all UCM files don't
> go through the list, we can always review when the strings are added
> in kernel, right?

My point is that we already did this incomplete review (the wrong strings are 
in the current kernel). We cannot prevent to avoid those code merges, we are 
just human. I just don't think that the driver / control names should be part 
of the don't-break-the-userspace policy.

>> I would be really curious what will happen when we change those strings ;-)
> 
> I can share some experiences that happen on Linux distros with Pulseaudio:
> 
> - if mixer control name is changed/missing that us used in
>    a UCM enable sequence, the enable sequence will fail and PA will
>    not choose that device
> 	-> e.g. when wrong HDMI control names are in the UCM file, HDMI
> 	output stops working
> - if mixer control for a Jack is changed, PA will not listen
>    for ALSA kctl events
> 	-> HDMI connection is silently missed and HDMI is not listed
> 	as a possible output
> 
> .. i.e. in both cases HDMI is essentially broken if you update to
> a kernel that updates the strings but don't update user-space in sync.

Yes, it's true. But usually, users do only upgrade. If we resolve the UCM 
configs before the kernel change, the impact is just very low.

> I wonder if one option would be to expose "legacy string" aliases,
> allowing to make changes but keep existing user-space happy. With my HDMI
> codec change, the controls are simply different, so this was not an
> option and I had to opt for keeping the whole driver around.

It seems that we may need to add conditions to the UCM syntax. There are 
several ways to do it. For your specific purpose it may look like "if the 
control exist, use this config" or so.

Another approach might be to add something to the decision code which top UCM 
config file should be loaded. Actually, we rely on the card name / long_name 
only. It seems that the probe might be extended here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
