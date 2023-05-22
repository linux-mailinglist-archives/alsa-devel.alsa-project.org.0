Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD9870BE2D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 14:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CE4DE;
	Mon, 22 May 2023 14:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CE4DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684758517;
	bh=O2yzFuP9ikJ1QK1hvQn4S7CcvyUj0NWY/cNBzG/MUI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6udKaQLpVRKW2nnT8ZRR5Qr0+tZEPgqYZPomCR7XBo1zKMpMbWLT0+ljO9qJ4YvB
	 dBbx1g5YY7GA5J+G88WFDDCruSnfr/1d5cjiGVgbmRhgxSZDDvB+LS3DYi+mGvu/f5
	 RFkh0q8kFp0N0HP+EHAU10ia76IwilzuoJtzPNUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 122C1F8053D; Mon, 22 May 2023 14:27:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E361FF80249;
	Mon, 22 May 2023 14:27:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4841F8024E; Mon, 22 May 2023 14:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E368F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 14:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E368F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fFZ286bo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hiNUr7rT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0751E1FEC0;
	Mon, 22 May 2023 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684758458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wDCche19NwriLRFepLABIomh+eCfWdeF+TH2jX3E6lk=;
	b=fFZ286bo1DptHTyx61j/Px2tnCoFjEmcKz0bm31x3CYmFKFByjf0M1pWkVfo1uOHuX0bbr
	8MvnYKmsEoe5gx1g3/kkqg8GKeqF3tAYWT1f6qc0mvDciFvU+B97jef1FAFO6SPajVeQu1
	+6gYOibviqVQeMrQlNKfcGqsxfp7cw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684758458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wDCche19NwriLRFepLABIomh+eCfWdeF+TH2jX3E6lk=;
	b=hiNUr7rTW1BcgHfbe1oaYhYmAe01l/fsdcMihq9M0c3xgaWaMfu8NnzO+9u5z1y4fWZ7A+
	hyXosUBu+PBfogCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF72B13776;
	Mon, 22 May 2023 12:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uSyFNblfa2QOVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 22 May 2023 12:27:37 +0000
Date: Mon, 22 May 2023 14:27:37 +0200
Message-ID: <877ct0y2iu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/36] ALSA: rawmidi: UMP support
In-Reply-To: <87ilcky83k.wl-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
	<20230519093114.28813-4-tiwai@suse.de>
	<d22c2686-9b36-40b7-f284-17e8b78a04ac@perex.cz>
	<87mt1wygoz.wl-tiwai@suse.de>
	<6736e86b-f6bb-fc6f-ebc2-cb0c5f1d36fb@perex.cz>
	<87ilcky83k.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VSFHUFCJZDW2NNSFJVWYAQGDBSXFC5RF
X-Message-ID-Hash: VSFHUFCJZDW2NNSFJVWYAQGDBSXFC5RF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSFHUFCJZDW2NNSFJVWYAQGDBSXFC5RF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 12:27:11 +0200,
Takashi Iwai wrote:
> 
> On Mon, 22 May 2023 10:08:24 +0200,
> Jaroslav Kysela wrote:
> > 
> > On 22. 05. 23 9:21, Takashi Iwai wrote:
> > > On Mon, 22 May 2023 08:34:20 +0200,
> > > Jaroslav Kysela wrote:
> > >> 
> > >> On 19. 05. 23 11:30, Takashi Iwai wrote:
> > >>> This patch adds the support helpers for UMP (Universal MIDI Packet) in
> > >>> ALSA core.
> > >>> 
> > >>> The basic design is that a rawmidi instance is assigned to each UMP
> > >>> Endpoint.  A UMP Endpoint provides a UMP stream, typically
> > >>> bidirectional (but can be also uni-directional, too), which may hold
> > >>> up to 16 UMP Groups, where each UMP (input/output) Group corresponds
> > >>> to the traditional MIDI I/O Endpoint.
> > >>> 
> > >>> Additionally, the ALSA UMP abstraction provides the multiple UMP
> > >>> Blocks that can be assigned to each UMP Endpoint.  A UMP Block is a
> > >>> metadata to hold the UMP Group clusters, and can represent the
> > >>> functions assigned to each UMP Group.  A typical implementation of UMP
> > >>> Block is the Group Terminal Blocks of USB MIDI 2.0 specification.
> > >>> 
> > >>> For distinguishing from the legacy byte-stream MIDI device, a new
> > >>> device "umpC*D*" will be created, instead of the standard (MIDI 1.0)
> > >>> devices "midiC*D*".  The UMP instance can be identified by the new
> > >>> rawmidi info bit SNDRV_RAWMIDI_INFO_UMP, too.
> > >>> 
> > >>> A UMP rawmidi device reads/writes only in 4-bytes words alignment,
> > >>> stored in CPU native endianness.
> > >>> 
> > >>> The transmit and receive functions take care of the input/out data
> > >>> alignment, and may return zero or aligned size, and the params ioctl
> > >>> may return -EINVAL when the given input/output buffer size isn't
> > >>> aligned.
> > >>> 
> > >>> A few new UMP-specific ioctls are added for obtaining the new UMP
> > >>> endpoint and block information.
> > >>> 
> > >>> As of this commit, no ALSA sequencer instance is attached to UMP
> > >>> devices yet.  They will be supported by later patches.
> > >>> 
> > >>> Along with those changes, the protocol version for rawmidi is bumped
> > >>> to 2.0.3.
> > >>> 
> > >>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > >> 
> > >> Reviewed-by: Jaroslav Kysela
> > >> 
> > >> except:
> > >> 
> > >>> +/* UMP Endpoint information */
> > >>> +struct snd_ump_endpoint_info {
> > >>> +	int card;			/* card number */
> > >>> +	int device;			/* device number */
> > >> 
> > >> I suspect that those two fields were added to enumerate devices in the
> > >> control API. But this extension seems to be missing in your
> > >> patches. There is only SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE
> > >> implemented. Otherwise those two fields are not useful.
> > > 
> > > The SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE is looping over rawmidi, and
> > > snd_rawmidi_info is provided for (kernel) UMP implementation.
> > 
> > Right. My point was that an application may be able to evaluate the
> > other UMP specific information from those new structures before the
> > rawmidi device is opened. So the CTL API extension may make sense.
> 
> Point taken, and indeed it might make more sense to change the ioctl
> for looking at snd_ump_endpoint_info.  Will try to cook with it.

FWIW, below is the patch to add two new ioctls for UMP EP/block
inquiries.  It's together with a slight change of ioctl callback.
Will be included in v2 patch set I'll submit later.

The latest patches are found in topic/midi20 branch of sound git
tree.


Takashi

-- 8< --
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

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1e4a21036109..445653fc0025 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1178,6 +1178,8 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
 #define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
+#define SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO _IOWR('U', 0x44, struct snd_ump_endpoint_info)
+#define SNDRV_CTL_IOCTL_UMP_BLOCK_INFO	_IOWR('U', 0x44, struct snd_ump_block_info)
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
