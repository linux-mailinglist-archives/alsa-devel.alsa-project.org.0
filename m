Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E015970C334
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 18:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBB93E7;
	Mon, 22 May 2023 18:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBB93E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684772592;
	bh=NoLzZYWncZmlB7qMyaLBHF4pYhS44aG0VYfkySovF9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b/+m7+iyLAxYvOYKPV9aI+9+lKCXq+1+3DIqxxrMXuWr2/YYGMQOBmc4H0o0ddmK6
	 4gNTU/R/Inn8KEdd+q4dLKrxRhNDp3zeU/Votgm9IGijHa7ja/4B96m0saBC18xPGB
	 b8cpCE86RNNDUlypT4ziW5OWmlD/t6llWvhROmp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBEAAF8026A; Mon, 22 May 2023 18:22:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39DD9F80249;
	Mon, 22 May 2023 18:22:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48051F8024E; Mon, 22 May 2023 18:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F64F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 18:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F64F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZVD2FooN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/vKDDjgO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05D1A21E50;
	Mon, 22 May 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684772527;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZqWgMT2mKkiv44X94Eax6vqppUd7jZmoTgit4TOczA=;
	b=ZVD2FooNuGkYWqfp13d2RveC0bncOwutYSr2IQXzLwPi9NJ9VyC/+lSifQ5ks6quQq78OM
	Z/A8kYKAMfDZcUNph0utKy3/p2LGpqFxbFk0VOfOJVsj2/t2Js5HANYgzZtFWm12ZC/nuZ
	Nbl1sNuYCEXSyZViggTrxJCbcJbJBK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684772527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZqWgMT2mKkiv44X94Eax6vqppUd7jZmoTgit4TOczA=;
	b=/vKDDjgOzxbijNDx5Xgu4++DyYWIi4GaFqrCrnyvRXvpmAjykKB2CSyROsgyzqND4h2BtC
	daYj5NnuJqLfmHAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC5AD13336;
	Mon, 22 May 2023 16:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id V5G7NK6Wa2SCXwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 22 May 2023 16:22:06 +0000
Date: Mon, 22 May 2023 18:22:06 +0200
Message-ID: <87y1lggwup.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/36] ALSA: rawmidi: UMP support
In-Reply-To: <877ct0y2iu.wl-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
	<20230519093114.28813-4-tiwai@suse.de>
	<d22c2686-9b36-40b7-f284-17e8b78a04ac@perex.cz>
	<87mt1wygoz.wl-tiwai@suse.de>
	<6736e86b-f6bb-fc6f-ebc2-cb0c5f1d36fb@perex.cz>
	<87ilcky83k.wl-tiwai@suse.de>
	<877ct0y2iu.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VBTTXUOHQNCEKWBPRE6Z4BY2KFHERP22
X-Message-ID-Hash: VBTTXUOHQNCEKWBPRE6Z4BY2KFHERP22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBTTXUOHQNCEKWBPRE6Z4BY2KFHERP22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 14:27:37 +0200,
Takashi Iwai wrote:
> 
> On Mon, 22 May 2023 12:27:11 +0200,
> Takashi Iwai wrote:
> > 
> > On Mon, 22 May 2023 10:08:24 +0200,
> > Jaroslav Kysela wrote:
> > > 
> > > On 22. 05. 23 9:21, Takashi Iwai wrote:
> > > > On Mon, 22 May 2023 08:34:20 +0200,
> > > > Jaroslav Kysela wrote:
> > > >> 
> > > >> On 19. 05. 23 11:30, Takashi Iwai wrote:
> > > >>> This patch adds the support helpers for UMP (Universal MIDI Packet) in
> > > >>> ALSA core.
> > > >>> 
> > > >>> The basic design is that a rawmidi instance is assigned to each UMP
> > > >>> Endpoint.  A UMP Endpoint provides a UMP stream, typically
> > > >>> bidirectional (but can be also uni-directional, too), which may hold
> > > >>> up to 16 UMP Groups, where each UMP (input/output) Group corresponds
> > > >>> to the traditional MIDI I/O Endpoint.
> > > >>> 
> > > >>> Additionally, the ALSA UMP abstraction provides the multiple UMP
> > > >>> Blocks that can be assigned to each UMP Endpoint.  A UMP Block is a
> > > >>> metadata to hold the UMP Group clusters, and can represent the
> > > >>> functions assigned to each UMP Group.  A typical implementation of UMP
> > > >>> Block is the Group Terminal Blocks of USB MIDI 2.0 specification.
> > > >>> 
> > > >>> For distinguishing from the legacy byte-stream MIDI device, a new
> > > >>> device "umpC*D*" will be created, instead of the standard (MIDI 1.0)
> > > >>> devices "midiC*D*".  The UMP instance can be identified by the new
> > > >>> rawmidi info bit SNDRV_RAWMIDI_INFO_UMP, too.
> > > >>> 
> > > >>> A UMP rawmidi device reads/writes only in 4-bytes words alignment,
> > > >>> stored in CPU native endianness.
> > > >>> 
> > > >>> The transmit and receive functions take care of the input/out data
> > > >>> alignment, and may return zero or aligned size, and the params ioctl
> > > >>> may return -EINVAL when the given input/output buffer size isn't
> > > >>> aligned.
> > > >>> 
> > > >>> A few new UMP-specific ioctls are added for obtaining the new UMP
> > > >>> endpoint and block information.
> > > >>> 
> > > >>> As of this commit, no ALSA sequencer instance is attached to UMP
> > > >>> devices yet.  They will be supported by later patches.
> > > >>> 
> > > >>> Along with those changes, the protocol version for rawmidi is bumped
> > > >>> to 2.0.3.
> > > >>> 
> > > >>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > >> 
> > > >> Reviewed-by: Jaroslav Kysela
> > > >> 
> > > >> except:
> > > >> 
> > > >>> +/* UMP Endpoint information */
> > > >>> +struct snd_ump_endpoint_info {
> > > >>> +	int card;			/* card number */
> > > >>> +	int device;			/* device number */
> > > >> 
> > > >> I suspect that those two fields were added to enumerate devices in the
> > > >> control API. But this extension seems to be missing in your
> > > >> patches. There is only SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE
> > > >> implemented. Otherwise those two fields are not useful.
> > > > 
> > > > The SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE is looping over rawmidi, and
> > > > snd_rawmidi_info is provided for (kernel) UMP implementation.
> > > 
> > > Right. My point was that an application may be able to evaluate the
> > > other UMP specific information from those new structures before the
> > > rawmidi device is opened. So the CTL API extension may make sense.
> > 
> > Point taken, and indeed it might make more sense to change the ioctl
> > for looking at snd_ump_endpoint_info.  Will try to cook with it.
> 
> FWIW, below is the patch to add two new ioctls for UMP EP/block
> inquiries.  It's together with a slight change of ioctl callback.
> Will be included in v2 patch set I'll submit later.
> 
> The latest patches are found in topic/midi20 branch of sound git
> tree.

There was a typo.  The corrected version below.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: ump: Add ioctls to inquiry UMP EP and Block info via
 control API

It'd be convenient to have ioctls to inquiry the UMP Endpoint and UMP
Block information directly via the control API without opening the
rawmidi interface, just like SNDRV_CTL_IOCTL_RAWMIDI_INFO.

This patch extends the rawmidi ioctl handler to support those; new
ioctls, SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO and
SNDRV_CTL_IOCTL_UMP_BLOCK_INFO, return the snd_ump_endpoint and
snd_ump_block data that is specified by the device field,
respectively.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h |  2 ++
 sound/core/rawmidi.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1e4a21036109..5c5f41dd4001 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1178,6 +1178,8 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
 #define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
+#define SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO _IOWR('U', 0x44, struct snd_ump_endpoint_info)
+#define SNDRV_CTL_IOCTL_UMP_BLOCK_INFO	_IOWR('U', 0x45, struct snd_ump_block_info)
 #define SNDRV_CTL_IOCTL_POWER		_IOWR('U', 0xd0, int)
 #define SNDRV_CTL_IOCTL_POWER_STATE	_IOR('U', 0xd1, int)
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 9936ed282b85..ffb5b58105f4 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1043,6 +1043,28 @@ static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_UMP)
+/* inquiry of UMP endpoint and block info via control API */
+static int snd_rawmidi_call_ump_ioctl(struct snd_card *card, int cmd,
+				      void __user *argp)
+{
+	struct snd_ump_endpoint_info __user *info = argp;
+	struct snd_rawmidi *rmidi;
+	int device, ret;
+
+	if (get_user(device, &info->device))
+		return -EFAULT;
+	mutex_lock(&register_mutex);
+	rmidi = snd_rawmidi_search(card, device);
+	if (rmidi && rmidi->ops && rmidi->ops->ioctl)
+		ret = rmidi->ops->ioctl(rmidi, cmd, argp);
+	else
+		ret = -ENXIO;
+	mutex_unlock(&register_mutex);
+	return ret;
+}
+#endif
+
 static int snd_rawmidi_control_ioctl(struct snd_card *card,
 				     struct snd_ctl_file *control,
 				     unsigned int cmd,
@@ -1056,6 +1078,10 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 #if IS_ENABLED(CONFIG_SND_UMP)
 	case SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE:
 		return snd_rawmidi_next_device(card, argp, true);
+	case SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO:
+		return snd_rawmidi_call_ump_ioctl(card, SNDRV_UMP_IOCTL_ENDPOINT_INFO, argp);
+	case SNDRV_CTL_IOCTL_UMP_BLOCK_INFO:
+		return snd_rawmidi_call_ump_ioctl(card, SNDRV_UMP_IOCTL_BLOCK_INFO, argp);
 #endif
 	case SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE:
 	{
-- 
2.35.3

