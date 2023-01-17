Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1266E152
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:52:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366AC6941;
	Tue, 17 Jan 2023 15:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366AC6941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673967134;
	bh=1YugDTTHRY28rDG25v5lpJKFZqcm0/XjAuLiZtuxpQY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=di1YUss17z4NleGJHoMQhliGgw37T411TjN02WzBeQdK+7wNU3OfyVF0jf73w6Yma
	 byYtChlQQr2afiryyiBVvvo+BeIQInLPvrS/ABUra35fp7KfY2krkww5Bp9Gvgo6po
	 shzHJUfmiPAkVR1lSzTfzQSb2235wMk2mefYJaQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE31CF8022D;
	Tue, 17 Jan 2023 15:51:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 258E9F8047B; Tue, 17 Jan 2023 15:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F04F0F8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04F0F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NY51h3Xg; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9SNkYatM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61C98688C5;
 Tue, 17 Jan 2023 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673967071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IftSv/VlJfNIlJEAcNEB/UR+Wtkc7l7O30MUNh4BzkE=;
 b=NY51h3Xg1mzms1cRyV5fufRWS8H8XafFtJ9m+vO32AmyrsJOPLCpHMQgrnwnUedQV99zbX
 jk0xGx4LTb2J3O+v+kprQQIqly0khCmc9ZDMYS0QHaXAHpXCX2WcT4WTUIovAzzd3QOwQI
 a+v2a4nniCvA9xtsArx2rBKGmN3/Cdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673967071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IftSv/VlJfNIlJEAcNEB/UR+Wtkc7l7O30MUNh4BzkE=;
 b=9SNkYatMikCjKISgpuSaHpnVBQDltWXKvBsdQxmmSScScOuepSqYXzhPvzW1MwlK5iCn2o
 2mYLOID/v2miaIAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3929A1390C;
 Tue, 17 Jan 2023 14:51:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jT1ADd+1xmM6NwAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 17 Jan 2023 14:51:11 +0000
Date: Tue, 17 Jan 2023 15:51:10 +0100
Message-ID: <87pmbd6wpt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
In-Reply-To: <9034530a-d49c-9dd2-515e-1a865e58cb29@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-2-cezary.rojewski@intel.com>
 <878rp2i6sj.wl-tiwai@suse.de>
 <2966b410-f00d-9b33-fcfa-30d484455579@intel.com>
 <877d4jsppp.wl-tiwai@suse.de>
 <8bdd56fc-de6b-381e-24f5-5d2c28e337f7@intel.com>
 <874jzmr4lg.wl-tiwai@suse.de>
 <ea75b058-5716-f07a-c37e-ab9b9c945f60@intel.com>
 <87bktqv30n.wl-tiwai@suse.de>
 <9034530a-d49c-9dd2-515e-1a865e58cb29@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 17 Jan 2023 15:45:17 +0100,
Cezary Rojewski wrote:
> 
> On 2022-07-15 4:55 PM, Takashi Iwai wrote:
> > On Tue, 12 Jul 2022 12:58:09 +0200, Cezary Rojewski wrote:
> 
> >> This is how ASoC HDAudio codec component was behaving for years, see
> >> sound/soc/codecs/hdac_hda.c. If the intention is _not_ do call
> >> snd_hda_codec_cleanup_for_unbind() then the teardown procedure will
> >> probably need a little update.
> > 
> > Do we see a similar crash with the hdac-hda stuff, too?
> > 
> > And, after avs_hdaudio_driver_exit() is called, why the codec object
> > still remains bound with the HD-audio (Realtek or whatever) codec
> > driver?
> 
> 
> Hello Takashi,
> 
> Your reply was somehow missed by me and shows as a review for patch
> 5/9 in my email-client. Sorry for the delay.
> 
> In regard to the hdac_hda.c question, we did test reloading for the
> skylake-driver and there are several places where the driver can cause
> panics, that is, it may not even get to hdac_hda failing - some other
> panic will pop up faster.
> 
> But yes, the exact same problem exists there as both implementations
> handle hdev_attach/detach() and component's probe/remove() is similar
> fashion.
> 
> >> Actually.. I'm afraid the init one
> >> would need an update to. Given how the implementation of HDAudio codec
> >> component's probe() and remove() looks like, there is no dropping the
> >> cleanup function without changing the upward path accordingly.
> >> 
> >> Well, to be honest the init/free procedures of HDAudio codec are a
> >> little hairy, perhaps it's time to address this.
> > 
> > Admittedly, the plumbing work for ASoC HD-audio was somewhat messy,
> > and it's fine if we can clean things up.
> > 
> > snd_hda_codec_cleanup_for_unbind() is certainly written for unbinding
> > the codec driver, and if a part of that function code is needed for
> > different purposes, it should be factored out properly, at least.
> 
> On ASoC side, component->probe() and component->remove() basically
> mimic the behavior of hda_codec_driver_probe/remove() found in
> sound/pci/hda/hda_bind.c. As ASoC sound card may be unbound without
> codec device being actually removed from the system, relying solely on
> driver's (not component's) probe/remove() may not be an option.
> 
> So, the discussion does not circle around just
> snd_hda_codec_cleanup_for_unbind() but basically any function that
> takes part in driver's probe() and remove() routines.
> 
> Right now, we are in a situation where user can generate a panic with
> a single rmmod. Also, our tests show no regression with modprobe/rmmod
> on snd_hda_intel side with this patch applied.

Let's focus on that bug, then.  Can we restart the thread with the
minimal change?  Otherwise it's hard to review and discuss further.


thanks,

Takashi
