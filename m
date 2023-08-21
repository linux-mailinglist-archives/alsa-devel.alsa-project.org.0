Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EB782CD3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 16:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD4C832;
	Mon, 21 Aug 2023 16:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD4C832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692629907;
	bh=FjVMt38CSqgRK/P1/TQD75NqQ42inRWfDQOgqdzzNDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWRnq1fvzBGU30PyptI4Nx23DFPb6nojtrO+vXHCPPAeykVva8cw/M7gY1ko+60PW
	 f5FoyypjVrmD0WNLEXaoHrD5RrlntljfiMciZ6Dvr+CUhrzzNc1PSD8E2tWKkM2A1x
	 5aVaf/zMdhVi/SdN5PXmOeLzBIoiAtyJXQMDKvm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1378F80199; Mon, 21 Aug 2023 16:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37162F8016C;
	Mon, 21 Aug 2023 16:57:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE661F80199; Mon, 21 Aug 2023 16:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15978F800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15978F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FafZxmpn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ks3ppezo
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BF151F74D;
	Mon, 21 Aug 2023 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692629847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V98p/YiWIWokd7MMMWY1a9uv78umHOiuzlwzq+4f/0o=;
	b=FafZxmpn6U071PAre4Ph5+LQ77TsQ/lccFzIGlp4Zp4XYw893JEhCjap44TOjvJPut8Pec
	h0QtlNC2F/XA/xRqLIQqhSk9lSetqSFG4K0Y/XbK9L3pRivMpwCSfB03A1DUrfFs0OIcBQ
	n113eULrYuklTkKdhgQsa3lNUR+QQSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692629847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V98p/YiWIWokd7MMMWY1a9uv78umHOiuzlwzq+4f/0o=;
	b=Ks3ppezo2/tIXo/LmHywYytG5VL+tUcdd3alLGMIbbP0mmn4mZ3itL7sJEtrry3wQ1Vtrv
	5FUclnJbWyDgcJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0C8F13421;
	Mon, 21 Aug 2023 14:57:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RJv5MVZ742QMDwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 21 Aug 2023 14:57:26 +0000
Date: Mon, 21 Aug 2023 16:57:26 +0200
Message-ID: <871qfw78a1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	kevin-lu@ti.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	baojun.xu@ti.com,
	thomas.gfeller@q-drop.com,
	peeyush@ti.com,
	navada@ti.com,
	broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v3 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <146f393a-665b-110b-b55b-d3452c3123e8@linux.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
	<9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com>
	<87il9a9hu2.wl-tiwai@suse.de>
	<146f393a-665b-110b-b55b-d3452c3123e8@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: XFJDER5YZWATCVELTR6LVX3CO6N2CSMR
X-Message-ID-Hash: XFJDER5YZWATCVELTR6LVX3CO6N2CSMR
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFJDER5YZWATCVELTR6LVX3CO6N2CSMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 16:43:31 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> >>> +static void tas2781_hda_playback_hook(struct device *dev, int action)
> >>> +{
> >>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> >>> +
> >>> +	dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
> >>> +	switch (action) {
> >>> +	case HDA_GEN_PCM_ACT_OPEN:
> >>> +		pm_runtime_get_sync(dev);
> >>
> >> test if this actually works?
> > 
> > To be fair, most of driver codes don't check it, including the
> > HD-audio core.  (Actually, over 900 of 1300 calls have no check in the
> > whole tree.)
> > 
> > It implies that forcing the check in each place is moot; rather the
> > helper needs to be coded not to fail, IMO.
> 
> Maybe that's true for HDaudio, for the SoundWire parts we absolutely
> need to detect if the resume worked. There are more steps involved, the
> clock-stop mode entry/exit, context restoration, re-enumeration, etc.
> 
> I think it'd be a mistake to sit on our hands and assume the world is
> perfect. We have to track cases where the codec isn't properly resumed
> and prevent it from accessing resources that are just unavailable.

Yeah, I don't mean that it's wrong or bad to have the check.  The
check should be there.

But, I feel that it's time to rather switch to the proper call.
Basically pm_runtime_resume_and_get() is the better alternative
(except for its long naming), and we may think of converting the
whole.

> >>> +static int tas2781_system_suspend(struct device *dev)
> >>> +{
> >>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> >>> +	int ret;
> >>> +
> >>> +	dev_dbg(tas_priv->dev, "System Suspend\n");
> >>> +
> >>> +	ret = pm_runtime_force_suspend(dev);
> >>> +	if (ret)
> >>> +		return ret;
> >>
> >> that's usually the other way around, for system suspend you either want
> >> the device to be pm_runtime active, or if it's already suspended do nothing.
> >>
> >> This is very odd to me.
> > 
> > This is a normal procedure, as stated in pm_runtime_force_suspend()
> > definition:
> > 
> > /**
> >  * pm_runtime_force_suspend - Force a device into suspend state if needed.
> > ....
> >  * Typically this function may be invoked from a system suspend callback to make
> >  * sure the device is put into low power state and it should only be used during
> >  * system-wide PM transitions to sleep states.  It assumes that the analogous
> >  * pm_runtime_force_resume() will be used to resume the device.
> 
> It's possible that it's fine for HDaudio, it wouldn't work in all cases
> for SoundWire where we have to make sure all pm_runtime suspended
> devices are brought back to D0 and then the regular system suspend
> happens. That's mainly because pm_runtime suspend relies on clock stop
> and system suspend does not.
> 
> In other words, this isn't a generic solution at all.

Well, I suppose rather that soundwire is an exception :)

For majority of devices, the system suspend/resume is nothing but
pm_runtime_force_*() calls.  e.g. take a look at
DEFINE_RUNTIME_DEV_PM_OPS() in linux/pm_runtime.h.


Takashi
