Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0AB4345C0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 09:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E25169F;
	Wed, 20 Oct 2021 09:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E25169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634714151;
	bh=JUIfKfAfanSx1e5mpFVmInP1pVWbWH33yVYavxJ5ANc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RM91qjrc8qi3WJ4vID+F2e8GOYxHzP+LksEaCvVEsBp7t+1dNmF7vjXBE7EIMjkWI
	 l9lirxJFGCrVkmOx31HraMAtrVN2FJxZ5kW0jmw0lq0rlI0jxtjR44p9oidjzuC3gg
	 NZq/POSIPTy2R3oL4Er7Co1/Q6krL1yfo448ds4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7979CF80082;
	Wed, 20 Oct 2021 09:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F899F80229; Wed, 20 Oct 2021 09:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A3DF80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 09:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A3DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kGkpSsNy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XA/Hr8HZ"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 797AC5C0225;
 Wed, 20 Oct 2021 03:14:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 20 Oct 2021 03:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=pLREgX1g3XPsUqn72RhQ0JWDaqF
 CZqFDrWhQZEBXqGk=; b=kGkpSsNy8kyaok1Ar6MZrLS+a6mV/xDsxtjpJcGEHXS
 RxUYBiHTrIehHrX75jajgM880mm2gQ1bumO7fMXcYwyig8iGaTOiH8tgLknp145L
 v9m+BKDn7XRbkaKChXi+FKyQK/M7ZLIL07NhzvGMnqBpNgG2QVoP+eh3A58PTj92
 NsWAP23jnsLo4BQVVEw/L2JyM/pm/qHUoar9RE1qOTddrdlA4aeHsEHuol3Ke2CA
 RNRM8T3fApnzoZ7YnHVvpr8odZdLx/eCQTs+7VZIlj69D/oW1Ny5nnU9ugmvyI5N
 k/EE3YjSpcXwwtTS/2YvWDzGjHuaxVWcCg7jYEYRp3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pLREgX
 1g3XPsUqn72RhQ0JWDaqFCZqFDrWhQZEBXqGk=; b=XA/Hr8HZNhjTcbxxta/v6C
 5sZzru8oAwEQHHqpqOx1mrgjONIUhaiM7mdBh4buRhMYDkxpsNrH1nzddoR/EgsT
 xB1h9Lixpm9vezYHO5DYNUnK54taB1cdMwHFhBG7K8oBcNPDNHxmz0fSnnPF3yS9
 GY5WF5MtRWJTp55vlvhuFjsyC9l2OGTtkUSw63IYoZzlx+vK15teWAUpxx7s7jMD
 rhSpLVPY1mjiAAq3up1WzNCGQDdUSF0faEoO9EL+/6UBOueh+VVPr/HBpGskRdTJ
 pG12ylU0M9q0hXmM5tN/OfPrms3Y8iEtRziuwRw2wBFRf4kShLOMT8HWnyNg7xYw
 ==
X-ME-Sender: <xms:zMFvYdM6N63gzx6LhglJD0EPUJVlX985V5gEEa1IAqXRT9mTsM00tw>
 <xme:zMFvYf-519tV5R28fCPm_hIoI2DlvFh4ZozqYwsqIFBTMSNNqDvXzF9v7zomP09qV
 PanX3Rg5Ufvdd9YW7s>
X-ME-Received: <xmr:zMFvYcSjafxFd_DvwmsxCYPhf10sk_0UVjTDT5Bo_gtqL2Y1ZewBc1PNJiBZ4vAjBH2NVs0qDlC9VCJgayMSnQfxGXSAr-kjNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvfedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:zMFvYZs-sJfp-clGksoj2FaxdOF_dK1J80cWwPIxRpGzCxJfvV4UTg>
 <xmx:zMFvYVeucUtgv64tCWPuMaXBP2LXzzvmgdSyTVYxZ4Mdsa0jHaPHZQ>
 <xmx:zMFvYV0BJO2ovbzmDiYxkgQRa2U7glTpWpZysAFbdaQ_dCQRglAYug>
 <xmx:zMFvYWqPTU3wHcZwex-d3I0tLX0aG_AAkZNTmJ4g3eXrHs6IQBV_Sg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 03:14:18 -0400 (EDT)
Date: Wed, 20 Oct 2021 16:14:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: firewire-motu: add ioctl commands to
 retrieve information in messages delivered by isoc packet
Message-ID: <YW/ByPmBY7WSHmWI@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
 <s5hv91ythay.wl-tiwai@suse.de> <YWt6179lGu6xM3Gw@workstation>
 <s5hczo4t9q1.wl-tiwai@suse.de> <YWvsEY2aGYtDloou@workstation>
 <s5hee8i69mb.wl-tiwai@suse.de> <YW1svlqJvG1oQGK2@workstation>
 <s5hzgr64hja.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hzgr64hja.wl-tiwai@suse.de>
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

On Mon, Oct 18, 2021 at 02:57:29PM +0200, Takashi Iwai wrote:
> On Mon, 18 Oct 2021 14:46:54 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Mon, Oct 18, 2021 at 10:05:32AM +0200, Takashi Iwai wrote:
> > > On Sun, 17 Oct 2021 11:25:37 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > Would I ask you opinion about my concern about firewire UAPI header? Is
> > > > it allowed to use float type instead of __u32 type?
> > > 
> > > I guess the safest way would be like include/uapi/linux/acct.h.
> > > The ifdef KERNEL will be omitted at installation, so user-space would
> > > see only float type while the kernel sees only __u32.
> > 
> > Yes. I've already found the header and it would be the safest, However,
> > conditional macro sometimes confuses userspace developers...
> 
> I believe that the ifdef will be dropped automagically during
> installing the files, so that user-space will see only float.
> 
> You can try to patch and run make headers_install.

Oh, I thought that the headers are simply copied when installing...
Indeed, I can find 'scripts/headers_install.sh' does the work in
'headers' make target invoked by the 'headers_install' target.

```
$ tail -n10 include/uapi/sound/firewire.h 
 */
struct snd_firewire_motu_command_dsp_meter {
#ifdef __KERNEL__
	__u32 data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
#else
	float data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
#endif
};

#endif /* _UAPI_SOUND_FIREWIRE_H_INCLUDED */
$ make headers
$ tail -n5 usr/include/sound/firewire.h 
 */
struct snd_firewire_motu_command_dsp_meter {
	float data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
};

#endif /* _SOUND_FIREWIRE_H_INCLUDED */
```

It would be achieved to use different type with the same storage size
between kernel and userspace. After writing some userspace test
applications, I'll post the patch. Thanks for your advice.

> Takashi


Regards

Takashi Sakamoto
