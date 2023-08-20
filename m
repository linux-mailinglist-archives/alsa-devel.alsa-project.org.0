Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19969781D2D
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 11:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34CC1832;
	Sun, 20 Aug 2023 11:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34CC1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692524213;
	bh=bwMEq2lP+8YAj8mMrEDfnHoylxI44wGDIk3NiIcg3k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bS4LNvYwa4ZaQ2wv3gQT6ghestAJzitxL5ydfoJgy1M3nY6IQGpqfe19YVW0WwOws
	 oD9uN74fiC8nWtbZp/3d7rKCXuXe5GI0k3ASaRkoAueHlLbosZMoUlmrqycKHoQDps
	 FjP0WvLQP6DqL5NnNTTmmaYGHyRNnbZT9zVUDTyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A38EDF8016C; Sun, 20 Aug 2023 11:36:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB45F8016C;
	Sun, 20 Aug 2023 11:36:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E21F80199; Sun, 20 Aug 2023 11:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36358F800F8
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 11:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36358F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MXSrATI8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=K/S9BfcJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 943FE1F37C;
	Sun, 20 Aug 2023 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692524150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6yWGBd37WpWrpHHgrByZVUhlpxVFH0xlCIOxFKl3NA=;
	b=MXSrATI8QfEOdse1x6u6OBmkiXYzIujh/VSdv4LuWkO/Q4lIR5VRQauqMl5uDhGlOMS37q
	a1wiEGECbS8GigvmJFS/lBWR0FRq2FzMfJR5yGgQZvNNvkzTSkk9pDR+1iGGQR6h6VX+4V
	FpAYVbWM8x04cgDS5WCidGGbnReS+9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692524150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6yWGBd37WpWrpHHgrByZVUhlpxVFH0xlCIOxFKl3NA=;
	b=K/S9BfcJCMKJGYn/lMdh+IIW9squta8SFb42OQM4sS6FLy8/ov19BBLEeB8mo8abuzbZ6+
	yXLo3YHqowdh2hAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C7D81348E;
	Sun, 20 Aug 2023 09:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SyrADXbe4WTPOQAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 20 Aug 2023 09:35:50 +0000
Date: Sun, 20 Aug 2023 11:35:49 +0200
Message-ID: <87il9a9hu2.wl-tiwai@suse.de>
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
In-Reply-To: <9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
	<9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3GJLQATDSV2QBH7FV67FFUWZYMAFCSUU
X-Message-ID-Hash: 3GJLQATDSV2QBH7FV67FFUWZYMAFCSUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GJLQATDSV2QBH7FV67FFUWZYMAFCSUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 18:30:42 +0200,
Pierre-Louis Bossart wrote:
> 
> The code doesn't look too bad but needs a bit more work. There are quite
> a few error handling issues, pm_runtime needs to be revisited and
> ACPI/EFI as well.
> 
> > +enum calib_data {
> 
> tas2781_calib_data?

Well, as long as it's a local stuff, a suffix isn't really needed.
If it makes thing too confusing, it should be named properly, of
course, though.

> > +static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
> > +{
> > +	struct acpi_device *adev;
> > +	struct device *physdev;
> > +	LIST_HEAD(resources);
> > +	const char *sub;
> > +	int ret;
> > +
> > +	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
> > +	if (!adev) {
> > +		dev_err(p->dev,
> > +			"Failed to find an ACPI device for %s\n", hid);
> > +		return -ENODEV;
> > +	}
> 
> [1] need to take care of a resource leak here

Right, and that's rather a typo at the end of the function...

> > +err:
> > +	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
> > +	put_device(physdev);

... this must be put_device(adev) instead physdev.

> > +static void tas2781_hda_playback_hook(struct device *dev, int action)
> > +{
> > +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> > +
> > +	dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
> > +	switch (action) {
> > +	case HDA_GEN_PCM_ACT_OPEN:
> > +		pm_runtime_get_sync(dev);
> 
> test if this actually works?

To be fair, most of driver codes don't check it, including the
HD-audio core.  (Actually, over 900 of 1300 calls have no check in the
whole tree.)

It implies that forcing the check in each place is moot; rather the
helper needs to be coded not to fail, IMO.

> > +static int tasdevice_hda_clamp(int val, int max)
> > +{
> > +	if (val > max)
> > +		val = max;
> > +
> > +	if (val < 0)
> > +		val = 0;
> > +	return val;
> > +}
> 
> I've seen that macro in the TAS2783 code as well, that sounds like a
> good helper function to share?

There is already clamp() macro, and I guess it can be replaced with
clamp(val, 0, max).

> > +
> > +	comps->dev = dev;
> > +
> > +	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
> > +
> > +	ret = tascodec_init(tas_priv, codec, tasdev_fw_ready);
> > +	if (ret)
> > +		return ret;
> 
> need to do a put_autosuspend below, this is leaking a refcount.

Right, that needs an obvious leak.  Let's fix it.

> > +static int tas2781_system_suspend(struct device *dev)
> > +{
> > +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_dbg(tas_priv->dev, "System Suspend\n");
> > +
> > +	ret = pm_runtime_force_suspend(dev);
> > +	if (ret)
> > +		return ret;
> 
> that's usually the other way around, for system suspend you either want
> the device to be pm_runtime active, or if it's already suspended do nothing.
> 
> This is very odd to me.

This is a normal procedure, as stated in pm_runtime_force_suspend()
definition:

/**
 * pm_runtime_force_suspend - Force a device into suspend state if needed.
....
 * Typically this function may be invoked from a system suspend callback to make
 * sure the device is put into low power state and it should only be used during
 * system-wide PM transitions to sleep states.  It assumes that the analogous
 * pm_runtime_force_resume() will be used to resume the device.


thanks,

Takashi
