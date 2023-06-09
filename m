Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3872934A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 10:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DD3710E;
	Fri,  9 Jun 2023 10:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DD3710E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686299777;
	bh=P0YlJbnoyxsI6S2K8Q12ph+ZpoY/MA+bC8E5XPFDCNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qeEI6Y+OVrpTEjDL66i7MErn6enFBm/of+HCUb2gKPoB/tF0xHNplSoY7//T7CqHX
	 fCuw/SFXk0JqBzS9sA0gxJ1JBVtr2Dge+6H4iAyZfCl9xl4zvbI1bieXaRbmkuXWS5
	 Tn/ho6vn72UM8/meXIH0R9Ym6rIi7taJ10/Z8oHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3CB2F804DA; Fri,  9 Jun 2023 10:35:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AC3F8016C;
	Fri,  9 Jun 2023 10:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70B07F80199; Fri,  9 Jun 2023 10:35:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 46B3FF800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 10:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B3FF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=v38NkbrX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V3GrdoP2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5350421A02;
	Fri,  9 Jun 2023 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686299700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQhStachu2WTpI3rtYsXFGtCjbHfw3L4SL0PGfkOa8s=;
	b=v38NkbrXWm81h7m06VKHT/7fvYYPQN5dxrT6zNg4sG9rz+2DSGzM2o+rm2AcDuUrXJTnKn
	XQQSpYTmqUdHw4PaSdrqJxWngB1H4dXhuYtZQNBdaz/5/ehWyB5I/jka939D9Sz1GO4UsE
	4BV40Yyigt/U7ElGkVIfH8dbPeJPxjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686299700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQhStachu2WTpI3rtYsXFGtCjbHfw3L4SL0PGfkOa8s=;
	b=V3GrdoP2652mY9m8yZki+8TbaxNOXeJFFGjfFLJhjUMvCyg0kyr4abzdpteWw/coW0hK1o
	C0ehpdhp8rj3kgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 257A513A47;
	Fri,  9 Jun 2023 08:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id h38aCDTkgmRxYwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 09 Jun 2023 08:35:00 +0000
Date: Fri, 09 Jun 2023 10:34:59 +0200
Message-ID: <874jnhc9u4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joseph C. Sible" <josephcsible@gmail.com>
Cc: Kailang <kailang@realtek.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <878rctcavz.wl-tiwai@suse.de>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>
	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>
	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
	<87353kd8b9.wl-tiwai@suse.de>
	<1170325957764b4cbd7cd3639575f285@realtek.com>
	<CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
	<873536js7q.wl-tiwai@suse.de>
	<CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
	<2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
	<CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
	<485f99149508488080d563144454040e@realtek.com>
	<CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
	<2831c55638a5431ca9e37d9caf365ed2@realtek.com>
	<CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
	<3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
	<CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com>
	<87h6rhcef2.wl-tiwai@suse.de>
	<0990300d759846d890de9c92fcad9a9d@realtek.com>
	<CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
	<878rctcavz.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PHVENZUYIQFGAY6IOERM6AJD2CZJSDEL
X-Message-ID-Hash: PHVENZUYIQFGAY6IOERM6AJD2CZJSDEL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHVENZUYIQFGAY6IOERM6AJD2CZJSDEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 10:12:16 +0200,
Takashi Iwai wrote:
> 
> On Fri, 09 Jun 2023 09:34:37 +0200,
> Joseph C. Sible wrote:
> > 
> > On Fri, Jun 9, 2023 at 3:04 AM Kailang <kailang@realtek.com> wrote:
> > >
> > > echo 0 > /sys/module/snd_hda_intel/parameters/power_save
> > >
> > > Could you give it a try? Then got dump also.
> > >
> > > If it passed, please test my two patches also. Then get dump again.
> > 
> > I ran that command under the kernel with my patch and then got an
> > alsa-info dump again, and it still said "Invalid AFG subtree". The
> > full result is attached as alsa-info-1.txt.
> > 
> > I then added snd_hda_intel.power_save=0 to the kernel command line and
> > tried under the kernel with your patches again. No change here either:
> > still "Invalid AFG subtree", and upon a warm boot, it still breaks.
> > Attached from this test are alsa-info-2.txt (cold boot) and
> > alsa-info-3.txt (warm boot).
> 
> Thanks.  It's puzzling.
> 
> The power setting of AFG looks already unusual:
> 
> State of AFG node 0x01:
>   Power states:  D0 D2 (null) (null) (null) (null) (null) (null) (null)
>   Power: setting=UNKNOWN, actual=D0, Clock-stop-OK, Setting-reset
> 
> So apparently the codec isn't ready yet for accessing.
> 
> But, the fact that the codec got parsed (hence you see the parsed
> results in dmesg) means that this subtree call could succeed at the
> beginning.
> 
> When you load snd-hda-intel module with "model=,generic" option (the
> command is intentional), does the codec content show up?

Also, assuming it being some timing issue, adding the delay forcibly
like below has any influence on the AFG error?


Takashi

--- a/sound/pci/hda/hda_proc.c
+++ b/sound/pci/hda/hda_proc.c
@@ -792,6 +792,7 @@ static void print_codec_info(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "State of AFG node 0x%02x:\n", fg);
 	print_power_state(buffer, codec, fg);
 
+	msleep(100); // XXX
 	nodes = snd_hda_get_sub_nodes(codec, fg, &nid);
 	if (! nid || nodes < 0) {
 		snd_iprintf(buffer, "Invalid AFG subtree\n");
