Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A58702D55
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 15:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79B91E2;
	Mon, 15 May 2023 15:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79B91E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684155827;
	bh=8UpunjxFNNw5ZymaZKMRg0qzUWnNKRwirVEF/+qR41s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z5ZPYPf6InBFI+uIJMj+a1AT0FnfwQapAClTZXk/xlr6vhy8GXq/vp+IrJqJ0wfZT
	 ImkCe81iMH7fbr4xCKYCZC676Xq7aYtN35uEHyh1mzsLOKEP7aDa0aOrviOsD3QfcK
	 c+DkT5fotLJgGvoUW4oHPqz6hBzZxkDhwFLnSymw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F4CF80548; Mon, 15 May 2023 15:02:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 067D4F8025A;
	Mon, 15 May 2023 15:02:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC7FF80272; Mon, 15 May 2023 15:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6225F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 15:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6225F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oYt+ibeP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HZWk0Egd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C38421CA2;
	Mon, 15 May 2023 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684155758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBSGTFqjlI1BU40+qz/oJmtWPfLF2AXrXzBuKVah9JA=;
	b=oYt+ibeP5NyGUWRF5GnrS4Op+W8g98eSa+9viwf5B1eB8wd5+rHxK0W7IUuCN2IZyCbDQt
	Y4vkBF3IofbDABEdMckKnnmVu/oHLfecLrklKmGOKjUb6PUCRq2aoNyhg7co5JYJm4g6lp
	J60dF5npXdd6o5dR1NCtUa8Bq6l0Jlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684155758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBSGTFqjlI1BU40+qz/oJmtWPfLF2AXrXzBuKVah9JA=;
	b=HZWk0EgdwLTu1S0jRi0HcpbZj9DOSH1hig7uXrGvroxsORDhK+UOU9DBRroudG+OHDSwiR
	lyb9vcTMLwmWJUAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61237138E5;
	Mon, 15 May 2023 13:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Zv+DFm4tYmQqOwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 15 May 2023 13:02:38 +0000
Date: Mon, 15 May 2023 15:02:37 +0200
Message-ID: <878rdplpci.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
	<878rdwjs1s.wl-tiwai@suse.de>
	<cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
	<87jzxe5084.wl-tiwai@suse.de>
	<41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
	<87ilcxaj3u.wl-tiwai@suse.de>
	<87fs81ainl.wl-tiwai@suse.de>
	<7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
	<87bkipag9z.wl-tiwai@suse.de>
	<98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JAE4TVGWBZBMH45BBDA4RWQRKZQB5CME
X-Message-ID-Hash: JAE4TVGWBZBMH45BBDA4RWQRKZQB5CME
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAE4TVGWBZBMH45BBDA4RWQRKZQB5CME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 13:19:29 +0200,
Amadeusz S³awiñski wrote:
> 
> On 5/12/2023 2:24 PM, Takashi Iwai wrote:
> > On Fri, 12 May 2023 14:00:54 +0200,
> > Amadeusz S³awiñski wrote:
> >> 
> >> On 5/12/2023 1:33 PM, Takashi Iwai wrote:
> >>> On Fri, 12 May 2023 13:23:49 +0200,
> >>> Takashi Iwai wrote:
> >>>> 
> >>>> On Thu, 11 May 2023 19:20:17 +0200,
> >>>> Amadeusz S³awiñski wrote:
> >>>>> 
> >>>>> On 5/11/2023 5:58 PM, Takashi Iwai wrote:
> >>>>>> On Thu, 11 May 2023 17:31:37 +0200,
> >>>>>> Amadeusz S³awiñski wrote:
> >>>>>>> 
> >>>>>>> On 5/10/2023 2:21 PM, Takashi Iwai wrote:
> >>>>>>>> On Tue, 09 May 2023 12:10:06 +0200,
> >>>>>>>> Amadeusz S³awiñski wrote:
> >>>>>>> Then capture stream starts and seems to assume that
> >>>>>>> registers were already set, so it doesn't write them to hw.
> >>>>>> 
> >>>>>> ... it seems this didn't happen, and that's the inconsistency.
> >>>>>> 
> >>>>>> So the further question is:
> >>>>>> At the point just before you start recording, is the codec in runtime
> >>>>>> suspended?  Or it's running?
> >>>>>> 
> >>>>>> If it's runtime-suspended, snd_hda_regmap_sync() must be called from
> >>>>>> alc269_resume() via runtime-resume, and this must write out the
> >>>>>> cached values.  Then the bug can be along with that line.
> >>>>>> 
> >>>>>> Or if it's running, it means that the previous check of
> >>>>>> snd_hdac_keep_power_up() was bogus (or racy).
> >>>>>> 
> >>>>> 
> >>>>> Well, it is in... let's call it semi powered state. When snd_hda_intel
> >>>>> driver is loaded with power_save=X option it sets timeout to X seconds
> >>>>> and problem only happens when I start the stream before those X
> >>>>> seconds pass and it runs first runtime suspend. After it suspends it
> >>>>> then uses standard pm_runtime_resume and works correctly. That's why
> >>>>> the pm_runtime_force_suspend(&codec->core.dev);  mentioned in first
> >>>>> email in thread "fixes" the problem, as it forces it to be instantly
> >>>>> suspended instead of waiting for timeout and then later normal
> >>>>> resume-play/record-suspend flow can be followed.
> >>>> 
> >>>> Hm, then maybe it's a bad idea to rely on the usage count there.
> >>>> Even if the usage is 0, the device can be still active, and the update
> >>>> can be missed.
> >>>> 
> >>>> How about the patch like below?
> >>> 
> >>> Scratch that, it returns a wrong value.
> >>> A simpler version like below works instead?
> >>> 
> >> 
> >> Yes it was broken, arecord didn't even start capturing ;)
> >> 
> >>> 
> >>> Takashi
> >>> 
> >>> --- a/sound/hda/hdac_device.c
> >>> +++ b/sound/hda/hdac_device.c
> >>> @@ -611,10 +611,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
> >>>    int snd_hdac_keep_power_up(struct hdac_device *codec)
> >>>    {
> >>>    	if (!atomic_inc_not_zero(&codec->in_pm)) {
> >>> -		int ret = pm_runtime_get_if_in_use(&codec->dev);
> >>> -		if (!ret)
> >>> +		if (!pm_runtime_active(&codec->dev))
> >>>    			return -1;
> >>> -		if (ret < 0)
> >>> +		if (pm_runtime_get_sync(&codec->dev) < 0)
> >>>    			return 0;
> >>>    	}
> >>>    	return 1;
> >> 
> >> 
> >> This one seems to work, as in I'm able to record before first suspend
> >> hits. However device stays in D0 when no stream is running...
> >> # cat /sys/devices/pci0000\:00/0000\:00\:0e.0/power_state
> >> D0
> > 
> > OK, one step forward.  The previous change was bad in anyway, as we
> > shouldn't sync there at all.
> > 
> > So, the problem becomes clearer now: it's in the lazy update mechanism
> > that misses the case that has to be written.
> > 
> > Scratch the previous one again, and could you try the following one
> > instead?
> > 
> > 
> > Takashi
> > 
> > --- a/sound/hda/hdac_regmap.c
> > +++ b/sound/hda/hdac_regmap.c
> > @@ -293,8 +293,17 @@ static int hda_reg_write(void *context, unsigned int reg, unsigned int val)
> >     	if (verb != AC_VERB_SET_POWER_STATE) {
> >   		pm_lock = codec_pm_lock(codec);
> > -		if (pm_lock < 0)
> > -			return codec->lazy_cache ? 0 : -EAGAIN;
> > +		if (pm_lock < 0) {
> > +			/* skip the actual write if it's in lazy-update mode
> > +			 * and only if the device is actually suspended;
> > +			 * the usage count can be zero at transition phase
> > +			 * (either suspending/resuming or auto-suspend sleep)
> > +			 */
> > +			if (codec->lazy_cache &&
> > +			    pm_runtime_suspended(&codec->dev))
> > +				return 0;
> > +			return -EAGAIN;
> > +		}
> >   	}
> >     	if (is_stereo_amp_verb(reg)) {
> > 
> 
> With this one we are back to same behavior as without it. When capture
> is started before first suspend it records silence. After waiting for
> timeout and suspend it records correctly.

Hm, interesting.  Does it mean that the pm_runtime_get_if_in_use() (in
snd_hdac_keep_power_up()) returns a non-zero value?
Or is pm_runtime_suspended() returns really true there?


Takashi
