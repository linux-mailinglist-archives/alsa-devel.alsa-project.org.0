Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292A93C69C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 17:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3D6E94;
	Thu, 25 Jul 2024 17:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3D6E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721921906;
	bh=FFcXEoNXWvYeCrIvjEWfffEx5fFM7CADPMYMvWUbPyE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uvaQh6YBkI9ourAZtF38kO9/wRcvBaQh6vQ0YPWZMON8HxsQK/Dd6+zbmyRmFq6CV
	 SAEZ6NTGYm7GEa3Vs6m2RNFrnV4D+uHkqwMdUylF13kVuBDYx8E7A+dezd+GB4vBHe
	 fXX3IVpX65Gx2Ue6np8YInl//LCKZ0HnXBDNLLMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077A5F805AB; Thu, 25 Jul 2024 17:37:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1EBF80579;
	Thu, 25 Jul 2024 17:37:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B32A4F8026D; Thu, 25 Jul 2024 17:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16170F800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 17:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16170F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JOdEWDOr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RQrhqnwP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=JOdEWDOr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RQrhqnwP
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1230D1F812;
	Thu, 25 Jul 2024 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721921853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJ5PZcP1yW4eEOpDJ4fqoNYHBhjwNuAErjewvIhwKXw=;
	b=JOdEWDOrQYgOCQo4LfyBlR5TZQxGzD3GKndP1PeE4ZmdQvg0id5WhS1uzPGwF/I2BNbWqx
	GytOuBYIegZA5uHdWtoJpCGxlCD7JIgCVATzBtAMQzjFH/UVHbiotU0Wu79hAl3v8ZOonQ
	DV9xgMTpQj4NmLW2Xi73NtBq/ioc40M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721921853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJ5PZcP1yW4eEOpDJ4fqoNYHBhjwNuAErjewvIhwKXw=;
	b=RQrhqnwPFj6rnO4MLUQgsYicOQWKoewxfuZT6vfykFkAVtOirJvFeL2c2Y3fwiJlMvcou5
	O9iYXI/xi6eGfwAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JOdEWDOr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RQrhqnwP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721921853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJ5PZcP1yW4eEOpDJ4fqoNYHBhjwNuAErjewvIhwKXw=;
	b=JOdEWDOrQYgOCQo4LfyBlR5TZQxGzD3GKndP1PeE4ZmdQvg0id5WhS1uzPGwF/I2BNbWqx
	GytOuBYIegZA5uHdWtoJpCGxlCD7JIgCVATzBtAMQzjFH/UVHbiotU0Wu79hAl3v8ZOonQ
	DV9xgMTpQj4NmLW2Xi73NtBq/ioc40M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721921853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJ5PZcP1yW4eEOpDJ4fqoNYHBhjwNuAErjewvIhwKXw=;
	b=RQrhqnwPFj6rnO4MLUQgsYicOQWKoewxfuZT6vfykFkAVtOirJvFeL2c2Y3fwiJlMvcou5
	O9iYXI/xi6eGfwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1C5813874;
	Thu, 25 Jul 2024 15:37:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lk2ELTxxomZHKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jul 2024 15:37:32 +0000
Date: Thu, 25 Jul 2024 17:38:07 +0200
Message-ID: <87h6cdiisg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	o-takashi@sakamocchi.jp,
	gustavoars@kernel.org,
	clemens@ladisch.de,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
In-Reply-To: <9135b5d8-01fe-4250-8236-e76194cd6efc@embeddedor.com>
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
	<87r0bhipr7.wl-tiwai@suse.de>
	<906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
	<9135b5d8-01fe-4250-8236-e76194cd6efc@embeddedor.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1230D1F812
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: HY7FNSDGB6II5FMZZZV72ZK77HNNPJAC
X-Message-ID-Hash: HY7FNSDGB6II5FMZZZV72ZK77HNNPJAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HY7FNSDGB6II5FMZZZV72ZK77HNNPJAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 17:11:31 +0200,
Gustavo A. R. Silva wrote:
> 
> 
> 
> On 25/07/24 08:08, Gustavo A. R. Silva wrote:
> > Hi!
> > 
> > On 25/07/24 07:07, Takashi Iwai wrote:
> >> On Thu, 25 Jul 2024 00:24:29 +0200,
> >> edmund.raile wrote:
> >>> 
> >>> Bisection revealed that the bitcrushing distortion with RME FireFace 800
> >>> was caused by 1d717123bb1a7555
> >>> ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
> >>> 
> >>> Reverting this commit yields restoration of clear audio output.
> >>> I will send in a patch reverting this commit for now, soonTM.
> >>> 
> >>> #regzbot introduced: 1d717123bb1a7555
> >> 
> >> While it's OK to have a quick revert, it'd be worth to investigate
> >> further what broke there; the change is rather trivial, so it might be
> >> something in the macro expansion or a use of flex array stuff.
> >> 
> > 
> > I wonder is there is any log that I can take a look at. That'd be really
> > helpful.
> 
> OK, I found a discrepancy in how the `header_length` field in the flexible
> structure (a struct that contains a flexible-array member) below is used:
> 
> include/linux/firewire.h:
> 458 struct fw_iso_packet {
> ...
> 465         u32 header_length:8;    /* Length of immediate header           */
> 466                                 /* tx: Top of 1394 isoch. data_block    */
> 467         u32 header[] __counted_by(header_length);
> 468 };
> 
> Take a look at the following piece of code:
> 
> sound/firewire/amdtp-stream.c:
> 1164         if (!(s->flags & CIP_NO_HEADER))
> 1165                 pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
> 
> In the code above `pkt_header_length` is set to `IT_PKT_HEADER_SIZE_CIP`, which based
> on the following macros is 8 _bytes_:
> 
> sound/firewire/amdtp-stream.c:37:#define CIP_HEADER_QUADLETS	2
> sound/firewire/amdtp-stream.c:58:#define CIP_HEADER_SIZE		(sizeof(__be32) * CIP_HEADER_QUADLETS)
> sound/firewire/amdtp-stream.c:72:#define IT_PKT_HEADER_SIZE_CIP		CIP_HEADER_SIZE
> 
> Then we use the DEFINE_FLEX() macro, which internally sets `template->header_length`
> to `CIP_HEADER_QUADLETS`, which based on the macros above, takes the value
> of 2 _elements_. We set `header_length` because such variable is the _counter_
> used during the `__counted_by()` annotation in `struct fw_iso_packet`. The
> _counter_ is the variable that holds the number of _elements_ in the flex-array
> member at some point at run-time[1].
> 
> So, we set the counter to `CIP_HEADER_QUADLETS` because that's the total number
> of _elements_ allocated for the flexible-array member `header[]` by the DEFINE_FLEX()
> macro.
> 
> 1183                 DEFINE_FLEX(struct fw_iso_packet, template, header,
> 1184                             header_length, CIP_HEADER_QUADLETS);
> 1185                 bool sched_irq = false;
> 
> Then we call function `build_it_pkt_header()` and pass as arguments a pointer
> to `template`, and `pkt_header_length`, which at this point might hold the
> value of 8 _bytes_.
> 
> 1187                 build_it_pkt_header(s, desc->cycle, template, pkt_header_length,
> 1188                                     desc->data_blocks, desc->data_block_counter,
> 1189                                     desc->syt, i, curr_cycle_time);
> 
> Then inside function `build_it_pkt_header()`, the _counter_ is updated
> `params->header_length = header_length;`:
> 
>  680 static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
>  681                                 struct fw_iso_packet *params, unsigned int header_length,
> ...
>  692         if (header_length > 0) {
>  693                 cip_header = (__be32 *)params->header;
>  694                 generate_cip_header(s, cip_header, data_block_counter, syt);
>  695                 params->header_length = header_length;
>  696         } else {
> 
> This causes `params->header_length == 8`; however, only enough space for 2
> _elements_ was allocated for the flex array (via DEFINE_FLEX()).
> 
> So, regardless of how `pkt_header_length` is intended to be used in the rest of
> the code inside `build_it_pkt_header()`, this last update to `params->header_length`
> seems to be incorrect.
> 
> So, my question here is whether this `header_length` struct member was originally
> intended to be used as a counter for the elements in the flex array or as size
> variable to hold the total number of bytes in the array?
> 
> Based on the comment "Length of immediate header", I suppose `header_length` would
> hold _elements_ not _bytes_.

Thanks, now I took a look over the whole picture, and I guess there
are two problems:

- The header_length should be in bytes, as far as I read the code in
  drivers/firwire/*.  So the assumption in the commit d3155742db89
  ("firewire: Annotate struct fw_iso_packet with __counted_by()") was
  already wrong, and it couldn't be annotated like that -- unless we
  fix up all users of header_length field.

- By the use of DEFINE_FLEX() in amdtp-stream.c, process_rx_packets()
  sets the header_length field to CIP_HEADER_QUADLETS (= 2) as
  default.  Meanwhile, build_it_pkt_header() doesn't touch
  header_length unless non-zero pkt_header_length is passed, supposing
  it being zero.  So this may lead to a bogus header_length, which is
  processed by the firewire core code wrongly.

The actual effect we see is likely the latter.  A simple fix would be
to use DEFINE_RAW_FLEX() instead of DEFINE_FLEX() like below.


thanks,

Takashi

-- 8< --
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1180,8 +1180,8 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
 
 	for (i = 0; i < packets; ++i) {
-		DEFINE_FLEX(struct fw_iso_packet, template, header,
-			    header_length, CIP_HEADER_QUADLETS);
+		DEFINE_RAW_FLEX(struct fw_iso_packet, template, header,
+				CIP_HEADER_QUADLETS);
 		bool sched_irq = false;
 
 		build_it_pkt_header(s, desc->cycle, template, pkt_header_length,
