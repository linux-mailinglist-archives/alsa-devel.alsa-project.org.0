Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C9942A44
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 11:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B872CA7;
	Wed, 31 Jul 2024 11:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B872CA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722417683;
	bh=Ev+kU0tE2mAVrR0dXZigOHwBzvvPP2cy8izgz8obJ6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PneBiTKE1/6OaqHSLL7Dv5l7Hwu3UrMSybbhzHfnZVUVzSKlsjeSGKJpwNNQ6+Yus
	 jn4OCV7gxVtPL5kLdVHLok0WeOUUeuJXI7rX72e43rRqMaxg+4Uv+voEtxuoRfT2a2
	 qap7Tv5/Io8kWWSmNq5zPcyrmzqM06o1kd9hYumk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18878F805AE; Wed, 31 Jul 2024 11:20:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0051CF80448;
	Wed, 31 Jul 2024 11:20:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E73F80448; Wed, 31 Jul 2024 11:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CC6CF80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 11:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC6CF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yEcJOFce;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dZkt856X;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yEcJOFce;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dZkt856X
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D8161F831;
	Wed, 31 Jul 2024 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722417625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6S9SRXlDvBisa4Jj77HDMVh/85+ER1+kbmYNhI50cS8=;
	b=yEcJOFceHMv2nsi7Eui1yCz05IzfNqzHXke2NyIr5sy5cMSWctonEzdiVOSPHX1J1TiDr2
	CpgJJrxqGc+JdWrUv+lDaV76dBeyCmwIkA0WxtGtTeaIBk5GU4PCTZTUcWfIVP0m1ya6xm
	CdEXvSlOaim6qth5B8ENpnCoteriy1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722417625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6S9SRXlDvBisa4Jj77HDMVh/85+ER1+kbmYNhI50cS8=;
	b=dZkt856Xv5v+tNUKyKSKKNS7p21fhJlHOS/HuKxnrPFrx9VsEbV5tdAJ99AH2Ic3Vj8MdG
	3gxFx8Ik8kl5V6Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722417625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6S9SRXlDvBisa4Jj77HDMVh/85+ER1+kbmYNhI50cS8=;
	b=yEcJOFceHMv2nsi7Eui1yCz05IzfNqzHXke2NyIr5sy5cMSWctonEzdiVOSPHX1J1TiDr2
	CpgJJrxqGc+JdWrUv+lDaV76dBeyCmwIkA0WxtGtTeaIBk5GU4PCTZTUcWfIVP0m1ya6xm
	CdEXvSlOaim6qth5B8ENpnCoteriy1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722417625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6S9SRXlDvBisa4Jj77HDMVh/85+ER1+kbmYNhI50cS8=;
	b=dZkt856Xv5v+tNUKyKSKKNS7p21fhJlHOS/HuKxnrPFrx9VsEbV5tdAJ99AH2Ic3Vj8MdG
	3gxFx8Ik8kl5V6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CED91368F;
	Wed, 31 Jul 2024 09:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBJSBdkBqmYrGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 09:20:25 +0000
Date: Wed, 31 Jul 2024 11:21:02 +0200
Message-ID: <87ikwlzzlt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH alsa-lib 2/4] seq: Add API helper functions for creating
 UMP Endpoint and Blocks
In-Reply-To: <0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com>
References: <20240619152855.6809-1-tiwai@suse.de>
	<20240619152855.6809-3-tiwai@suse.de>
	<0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
Message-ID-Hash: V7PRC3YPUR5ZQOALUF7TYSKO5IF3HZNY
X-Message-ID-Hash: V7PRC3YPUR5ZQOALUF7TYSKO5IF3HZNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7PRC3YPUR5ZQOALUF7TYSKO5IF3HZNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Jul 2024 10:46:08 +0200,
Amadeusz Sławiński wrote:
> 
> On 6/19/2024 5:28 PM, Takashi Iwai wrote:
> > For making it easer for applications to create a virtual UMP Endpoint
> > and UMP blocks, add two API helper functions.
> > 
> > snd_seq_create_ump_endpoint() creates (unsurprisingly) a UMP Endpoint,
> > based on the given snd_ump_endpoint_info_t information.  The number of
> > (max) UMP groups belonging to this Endpoint has to be specified.
> > This function sets up the Endpoint info on the sequencer client, and
> > creates a MIDI 2.0 UMP port as well as UMP Group ports automatically.
> > The name of the sequencer client is updated from the Endpoint name,
> > too.
> > 
> > After creating a UMP Endpoint, create each UMP Block via
> > snd_seq_create_ump_block() function with a snd_ump_block_info_t info.
> > The associated groups for each block have to be specified there.
> > The port names and capability bits are updated accordingly after
> > setting each block information.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> 
> ...
> 
> > +			if (*blknames) {
> > +				strlcat(blknames, ", ", sizeof(blknames));
> > +				strlcat(blknames, (const char *)bp->name,
> > +					sizeof(blknames));
> 
> FYI, this seems to introduce build problems on systems that do not
> have strlcpy:
> 
> During build:
> seqmid.c: In function ‘update_group_ports’:
> seqmid.c:672:33: warning: implicit declaration of function
> ‘strlcat’; did you mean ‘strncat’?
> [-Wimplicit-function-declaration]
>   672 |                                 strlcat(blknames, ", ",
> sizeof(blknames));
>       |                                 ^~~~~~~
>       |                                 strncat
> 
> And then during linking:
> /usr/bin/ld: seq/.libs/libseq.a(seqmid.o): in function `update_group_ports':
> /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:672: undefined
> reference to `strlcat'
> /usr/bin/ld: /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:673:
> undefined reference to `strlcat'
> collect2: error: ld returned 1 exit status

Thanks, I'll modify it to avoid strlcat() like below.


Takashi

-- 8< --
Subject: [PATCH] seq: Avoid strlcat()

strlcat() isn't available in every system, so better to avoid it.
Rewrite the code without strlcat().

Fixes: 6167b8ce3e80 ("seq: Add API helper functions for creating UMP Endpoint and Blocks")
Link: https://lore.kernel.org/0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/seq/seqmid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/seq/seqmid.c b/src/seq/seqmid.c
index 08c62d5c24b8..b30db4075254 100644
--- a/src/seq/seqmid.c
+++ b/src/seq/seqmid.c
@@ -635,6 +635,7 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
 		char blknames[64];
 		char name[64];
 		unsigned int caps = 0;
+		int len;
 
 		blknames[0] = 0;
 		for (b = 0; b < ep->num_blocks; b++) {
@@ -668,14 +669,13 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
 
 			if (!*bp->name)
 				continue;
-			if (*blknames) {
-				strlcat(blknames, ", ", sizeof(blknames));
-				strlcat(blknames, (const char *)bp->name,
-					sizeof(blknames));
-			} else {
+			len = strlen(blknames);
+			if (len)
+				snprintf(blknames + len, sizeof(blknames) - len,
+					 ", %s", bp->name);
+			else
 				snd_strlcpy(blknames, (const char *)bp->name,
 					    sizeof(blknames));
-			}
 		}
 
 		if (!*blknames)
-- 
2.43.0

