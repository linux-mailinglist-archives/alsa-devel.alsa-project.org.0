Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC3CBA7A9
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Dec 2025 10:32:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF67860225;
	Sat, 13 Dec 2025 10:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF67860225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765618356;
	bh=IUSpiZRdHQ6bZ/ES4iHZhDi5o+qu/v7IpQkB+kR2YNU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ayn9GCJoNdKF8cl92PMGiqVtZcl9Q1cfJCZuFZKEjth+koGT0cTmo65XZFQeYdEdC
	 sMd4lM2sJi6FgEA9Ht6bAOkgrUzVWI6UMiHWEcXabXLav8hfcVxQ7zz40G40jsBzm/
	 x9DthTWeYPum3ZE7bl9ODuf+uwYI9UaaceS8+BEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4174F80528; Sat, 13 Dec 2025 10:32:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 611B4F800E4;
	Sat, 13 Dec 2025 10:32:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E509F80518; Sat, 13 Dec 2025 10:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19BECF80095
	for <alsa-devel@alsa-project.org>; Sat, 13 Dec 2025 10:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19BECF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SvCWCgz3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OFO8ecJC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ezp74cpS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vbIlXA3/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A81A5BD78;
	Sat, 13 Dec 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765618296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hfBK4522N0m3l8F69t8GN8XzcfS69I3xRTZwS+KL40=;
	b=SvCWCgz3wKL8Af+B3Hklfa9KEFrbq1EgXFfFHOdVtqTNE30Wm6YW0l4qnHTH8UyJZs8Vyc
	hFwXv+Cj+g3vn6hjFE42QH3BeyGYeq5VZkgMRH7MNwbZxh4T4qMBtnFEAsLS6VOWtPlmbg
	YTjAfT8Ks/esmSOnjU69Yw/w1afL11k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hfBK4522N0m3l8F69t8GN8XzcfS69I3xRTZwS+KL40=;
	b=OFO8ecJCxzDw0ysvZkm/1DEyCqxxaWpsMbZRLyFcm++TwqdyJKTtf/j2kKzHqvyBox9yJT
	mlGXXYQEo6O3YQCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ezp74cpS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="vbIlXA3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765618295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hfBK4522N0m3l8F69t8GN8XzcfS69I3xRTZwS+KL40=;
	b=Ezp74cpSWH0DNukJtcclxB3gU/594ZkMm+76vjxmHDgxr5DlJEZI39slfzXZ8+lPK/OtjV
	sLtQAEQaDZ+Fbx/qBVEFiRIPV7I7/SJAzE/Znk+sxUGcUTZRvC95AnULqVgH7lP4XaryXR
	AVt/d7p4MXnfdln+8H4kaV2/ls+2P2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765618295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hfBK4522N0m3l8F69t8GN8XzcfS69I3xRTZwS+KL40=;
	b=vbIlXA3/n1ya8GmBkf//b0+ctxmtiML1N3CmfKhk6kARslIq/99j6ZCxRmqvHq0iOqmw4E
	mZDZT7usDfaxmJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA2343EA63;
	Sat, 13 Dec 2025 09:31:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iNylM3YyPWmHJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 13 Dec 2025 09:31:34 +0000
Date: Sat, 13 Dec 2025 10:31:34 +0100
Message-ID: <87tsxu918p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Vulnerability Report" <vr@darknavy.com>
Cc: "Jaroslav Kysela" <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	"alsa-devel" <alsa-devel@alsa-project.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-mixer: us16x08: validate meter packet indices
In-Reply-To: <tencent_21C112743C44C1A2517FF219@qq.com>
References: <tencent_21C112743C44C1A2517FF219@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1A81A5BD78
Message-ID-Hash: M5UYTC7G2B7FFPR4SI76UUSQ7U3E24K4
X-Message-ID-Hash: M5UYTC7G2B7FFPR4SI76UUSQ7U3E24K4
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5UYTC7G2B7FFPR4SI76UUSQ7U3E24K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 Dec 2025 07:54:37 +0100,
Vulnerability Report wrote:
> 
> Hi,
> 
> while fuzzing a USB gadget that emulates a Tascam US-16x08 we found that
> get_meter_levels_from_urb() in mixer_us16x08.c uses a channel index
> taken directly from the 64-byte meter packet to index meter_level[],
> comp_level[] and master_level[] without any bounds checking. A malformed
> packet can therefore cause out-of-bounds writes in the
> snd_us16x08_meter_store.
> 
> 
> A malicious USB audio device (or USB gadget implementation) that
> pretends to be a US-16x08-compatible interface can trigger this by
> sending crafted meter packets. We have a small USB gadget-based PoC for
> this behaviour and can share it if that would be helpful.
> 
> 
> This driver is used by common distributions (e.g. Ubuntu) when a
> US-16x08 or compatible USB audio device is present. The same pattern is
> present in current mainline kernels.
> 
> 
> This issue was first reported via security@kernel.org. The kernel
> security team explained that, in the upstream threat model, USB
> endpoints are expected to be trusted (i.e. only trusted devices should
> be bound to drivers), so they consider this a normal bug rather than a
> security vulnerability, and asked us to send a fix to the development
> lists. The patch below adds simple range checks before updating these
> arrays.
> 
> 
> Suggested patch:
> 
> 
> ---
> &nbsp;sound/usb/mixer_us16x08.c | 15 +++++++++++++--
> &nbsp;1 file changed, 13 insertions(+), 2 deletions(-)
> 
> 
> diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
> index XXXXXXXX..YYYYYYYY 100644
> --- a/sound/usb/mixer_us16x08.c
> +++ b/sound/usb/mixer_us16x08.c
> @@ -647,15 +647,26 @@ static int snd_get_meter_comp_index(struct snd_us16x08_meter_store *store)
> &nbsp;/* retrieve the meter level values from URB message */
> &nbsp;static void get_meter_levels_from_urb(int s,
> &nbsp;     struct snd_us16x08_meter_store *store,
> &nbsp;     u8 *meter_urb)
> &nbsp;{
> &nbsp;     int val = MUC2(meter_urb, s) + (MUC3(meter_urb, s) << 8);
> +     int ch = MUB2(meter_urb, s) - 1;
> +
> +     if (ch < 0)
> +           return;
> &nbsp;
> &nbsp;     if (MUA0(meter_urb, s) == 0x61 &amp;&amp; MUA1(meter_urb, s) == 0x02 &amp;&amp;
> -           MUA2(meter_urb, s) == 0x04 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
> -           if (MUC0(meter_urb, s) == 0x72)
> -                 store-&gt;meter_level[MUB2(meter_urb, s) - 1] = val;
> -           if (MUC0(meter_urb, s) == 0xb2)
> -                 store-&gt;comp_level[MUB2(meter_urb, s) - 1] = val;
> -     }
> +           MUA2(meter_urb, s) == 0x04 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
> +           if (ch < SND_US16X08_MAX_CHANNELS) {
> +                 if (MUC0(meter_urb, s) == 0x72)
> +                       store-&gt;meter_level[ch] = val;
> +                 if (MUC0(meter_urb, s) == 0xb2)
> +                       store-&gt;comp_level[ch] = val;
> +           }
> +     }
> &nbsp;     if (MUA0(meter_urb, s) == 0x61 &amp;&amp; MUA1(meter_urb, s) == 0x02 &amp;&amp;
> -           MUA2(meter_urb, s) == 0x02 &amp;&amp; MUB0(meter_urb, s) == 0x62)
> -           store-&gt;master_level[MUB2(meter_urb, s) - 1] = val;
> +           MUA2(meter_urb, s) == 0x02 &amp;&amp; MUB0(meter_urb, s) == 0x62) {
> +           if (ch < ARRAY_SIZE(store-&gt;master_level))
> +                 store-&gt;master_level[ch] = val;
> +     }
> &nbsp;}
> 
> 
> Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com&gt;
> Signed-off-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com&gt;

The while mail and the patch are malformed due to your mailer and
can't be applied.  Could you try to resubmit with a proper patch
description?  Also, Signed-off-by must be with a real name or a known
identity, no anonymous name, due to a legal requirement.


thanks,

Takashi
