Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDA7599CA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 17:32:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2D31FC;
	Wed, 19 Jul 2023 17:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2D31FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689780751;
	bh=8yQHWu9Y4AXcWzLIfplbpz1Ox2G8F9a7t+PL/QDO45E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cut+yj0GqYaVZ+t9YOlnMCgHvZe2myuo3q2qVHXQsJmIpuFOkvMQanU6XSMFI2pMA
	 7H/QjXiPmeEetJU1k+W+4lwHXgyV58shdV+KMUbUpuTi3TV7bFc7D5XYPw/RMndb3l
	 zVs6Ht7fqkGUcUxufpcolCOhdfJ7z0zL3PAgRJBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB7B8F80153; Wed, 19 Jul 2023 17:31:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 370D6F80153;
	Wed, 19 Jul 2023 17:31:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15820F8032D; Wed, 19 Jul 2023 17:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C6E3F8007E;
	Wed, 19 Jul 2023 17:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C6E3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fskGYOkX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=40pUeQL8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9C3321DF7;
	Wed, 19 Jul 2023 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689780689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7KHLY5xAlMXYMTBmOkQfRpEAjmaUbYGDVoxlv91Vdc=;
	b=fskGYOkX4PAnLKKkX+UedmG/pnDWgYxg4/TGvorIKERiDMxqGLmopPmP67Wox+TbTyzj0d
	OnL/dLg9Wv429cEQqw96q8RmWGknB+5vKs/O3qbhIhds7KW0rw0+jCA/zxabVgr390JoNw
	Pw9V/KAXu4lAHSoNIglGQHdyv1Bwo8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689780689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7KHLY5xAlMXYMTBmOkQfRpEAjmaUbYGDVoxlv91Vdc=;
	b=40pUeQL85NkQMilOdMcfJ9Jq2aQO+1mr3Xdz0iSwopeOWQBZJOKNmj2Una4yiO+l6rYJsL
	iKCuS4XlXFzvDjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C5781361C;
	Wed, 19 Jul 2023 15:31:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tBtFGdEBuGQ4bAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 15:31:29 +0000
Date: Wed, 19 Jul 2023 17:31:28 +0200
Message-ID: <87edl3lxyn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
	Bard Liao
	<yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	"Daniel Baluta" <daniel.baluta@nxp.com>
Subject: Re: [PATCH 3/7] ASoC: Intel: avs: Move snd_hdac_i915_init to before
 probe_work.
In-Reply-To: <18fb40b9-f5b4-60d8-79df-e0719cf48231@intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-4-maarten.lankhorst@linux.intel.com>
	<18fb40b9-f5b4-60d8-79df-e0719cf48231@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: CMJZXXR6Q2WRF6M74N42LGA4VSVSHXZW
X-Message-ID-Hash: CMJZXXR6Q2WRF6M74N42LGA4VSVSHXZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMJZXXR6Q2WRF6M74N42LGA4VSVSHXZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 17:26:24 +0200,
Cezary Rojewski wrote:
> 
> On 2023-07-18 10:45 AM, Maarten Lankhorst wrote:
> > Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> > the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> > can be destroyed, but I don't have the means to test this.
> > 
> > Removing the workqueue would simplify init even further, but is left
> > as exercise for the reviewer.
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >   sound/soc/intel/avs/core.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> > index 3311a6f142001..d3a7f42387e9b 100644
> > --- a/sound/soc/intel/avs/core.c
> > +++ b/sound/soc/intel/avs/core.c
> > @@ -191,10 +191,6 @@ static void avs_hda_probe_work(struct work_struct *work)
> >     	pm_runtime_set_active(bus->dev); /* clear runtime_error flag
> > */
> >   -	ret = snd_hdac_i915_init(bus, true);
> > -	if (ret < 0)
> > -		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
> > -
> >   	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
> >   	avs_hdac_bus_init_chip(bus, true);
> >   	avs_hdac_bus_probe_codecs(bus);
> > @@ -465,10 +461,19 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
> >   	pci_set_drvdata(pci, bus);
> >   	device_disable_async_suspend(dev);
> >   +	ret = snd_hdac_i915_init(bus, false);
> > +	if (ret == -EPROBE_DEFER)
> > +		goto err_unmaster;
> > +	else if (ret < 0)
> > +		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
> > +
> 
> While our tests are currently passing I have my doubts about
> EPROBE_DEFER. We do want to have audio functionality there even if
> some problems with HDMI arise along the way - some audio is better
> than no audio. Here, i915 may ruin the day for a platform equipped
> with hda/hdmi/i2c/dmic chips simultaneously.

Yeah, we need some workaround to let user to skip the i915 binding, as
discussed in the thread.  I guess an option for hdac_i915 (that will
be in snd-hda-core module) should suffice.


thanks,

Takashi
