Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC217BD34F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 08:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9B6209;
	Mon,  9 Oct 2023 08:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9B6209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696832656;
	bh=cv3k9enovzCwcsRGKsnGU0fp+K1Mi4lJ6/rpR9N0xJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rZFsnOWogcmqjQjNYO7z5IKwlQ9NrPCxpG7PVo0Wxa7HKTXVST4iYVJW5F6+X2nuv
	 ButlYEzExS8c7JWfzn/w2ezMIwiUmYHkHSlTb3CEIHYlsnUiGQMSmMiYecdWE/XHkD
	 RLgzo9K/LpgTv8ePdUfXY3mJ0AJryZn33dclh5V8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E5FCF8015B; Mon,  9 Oct 2023 08:23:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB545F8015B;
	Mon,  9 Oct 2023 08:23:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F47BF802BE; Mon,  9 Oct 2023 08:23:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 121FEF8015B;
	Mon,  9 Oct 2023 08:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121FEF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OgBybor9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Unzbt6VX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDD071F38C;
	Mon,  9 Oct 2023 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696832595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVglXbA5KGR99TIvnnpK12ZxeM4UJ/QmddNOTitskK0=;
	b=OgBybor9H1XLVkEy9xKeovohcvPQNUpUGEI/DP7r0pJL/PxCdVqj+gwevTXwYYRqNdHo0b
	zVqwSW2bhbx9Txk+XZ4AFM/tiWclqP42udVrvd0f8+Sfqi+nfc3hU2dYLjoQVm+40mEBPc
	zn302QJ/txfxV9FYvif+54dJGrPkfm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696832595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVglXbA5KGR99TIvnnpK12ZxeM4UJ/QmddNOTitskK0=;
	b=Unzbt6VXvSaoQUEJA3USz/bx1Uu3IGWbqDbGZjP7j5Ni1bp1wdEHNFh2p8uo2G4YYlgSka
	Yl1TjSE/EYptUAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EFB913586;
	Mon,  9 Oct 2023 06:23:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DW5eIVOcI2X5AwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 09 Oct 2023 06:23:15 +0000
Date: Mon, 09 Oct 2023 08:23:15 +0200
Message-ID: <87jzrwtiuk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Alsa-devel
 <alsa-devel@alsa-project.org>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,	Liam Girdwood
 <liam.r.girdwood@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: <ee92964c-c277-a258-5081-cf0a19ccff79@lankhorst.se>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
	<20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
	<alpine.DEB.2.22.394.2310041953090.3390143@eliteleevi.tm.intel.com>
	<b4a010aa-b547-42ad-844f-849f287abd54@linux.intel.com>
	<ee92964c-c277-a258-5081-cf0a19ccff79@lankhorst.se>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GVDK2J3UQJGQ56ICQAQNX4PLQJTUNSHL
X-Message-ID-Hash: GVDK2J3UQJGQ56ICQAQNX4PLQJTUNSHL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVDK2J3UQJGQ56ICQAQNX4PLQJTUNSHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Oct 2023 13:26:18 +0200,
Maarten Lankhorst wrote:
> 
> 
> 
> On 2023-10-05 12:58, Péter Ujfalusi wrote:
> > 
> > 
> > On 04/10/2023 19:59, Kai Vehmanen wrote:
> >> Hi,
> >> 
> >> I'm good with rest of the series, but one patch requires work.
> >> 
> >> On Wed, 4 Oct 2023, Maarten Lankhorst wrote:
> >> 
> >>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> >>> the snd_hdac_i915_init into a workqueue.
> >>> 
> >>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> >>> probe function.
> >>> 
> >>> The previously added probe_early can be used for this,
> >>> and we also use the newly added remove_late for unbinding afterwards.
> >> [...]
> >>> --- a/sound/soc/sof/intel/hda-common-ops.c
> >>> +++ b/sound/soc/sof/intel/hda-common-ops.c
> >>> @@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
> >>>   	.probe_early	= hda_dsp_probe_early,
> >>>   	.probe		= hda_dsp_probe,
> >>>   	.remove		= hda_dsp_remove,
> >>> +	.remove_late	= hda_dsp_remove_late,
> >>>     	/* Register IO uses direct mmio */
> >>>   diff --git a/sound/soc/sof/intel/hda.c
> >>> b/sound/soc/sof/intel/hda.c
> >>> index 86a2571488bc..4eb7f04b8ae1 100644
> >>> --- a/sound/soc/sof/intel/hda.c
> >>> +++ b/sound/soc/sof/intel/hda.c
> >>> @@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
> >>>   		return -ENOMEM;
> >>>   	sdev->pdata->hw_pdata = hdev;
> >>>   	hdev->desc = chip;
> >>> +	ret = hda_init(sdev);
> >>>     err:
> >>>   	return ret;
> >> 
> >> I don't think this works. The hda_codec_i915_init() errors are ignored in
> >> hda_init() so this never returns -EPROBE_DEFER.
> >> 
> >> So something like this is needed on top (tested quickly on one SOF
> >> machine and this blocks SOF load until i915 or xe driver is loaded):
> >> 
> >> --cut--
> >> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> >> index 9025bfaf6a7e..8b17c82dcc89 100644
> >> --- a/sound/soc/sof/intel/hda.c
> >> +++ b/sound/soc/sof/intel/hda.c
> >> @@ -863,13 +863,20 @@ static int hda_init(struct snd_sof_dev *sdev)
> >>          /* init i915 and HDMI codecs */
> >>          ret = hda_codec_i915_init(sdev);
> >>          if (ret < 0)
> >> -               dev_warn(sdev->dev, "init of i915 and HDMI codec
> >> failed\n");
> >> +               dev_warn(sdev->dev, "init of i915 and HDMI codec failed
> >> (%d)\n", ret);
> > 
> > we should not print anything or maximum dev_dbg in case of EPROBE_DEFER.
> There's dev_err_probe, which is dev_err on error, or sets the reason
> for deferred probe to the arguments if the error is -EPROBE_DEFER.

I expect you'll respin v7 for addressing this?

I'd love to merge the series for 6.7, and the time ticks...


thanks,

Takashi
