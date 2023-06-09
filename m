Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B7729077
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 08:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 207DF20C;
	Fri,  9 Jun 2023 08:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 207DF20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686293934;
	bh=sw+p5V/1gvW1SwiSBo6/EnFxZOEew/boY6d6BLgZ9sI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GL6wfnrCAZ/vVB7WwciY5g+SX6HBzVh9cxlVtWUwQjwOEbZlL9w6d78QsX5Me5ZRg
	 LigLJ17sSsy7t5E3VKAWAGkPd+4sPTaQygJ9vOY+8Czpl4rckgUnhNCB48ZeVUQQBQ
	 VRyodJaaaeWTsmfFCoHIiLcf5g75K+pIF+fmxsK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27F0F80254; Fri,  9 Jun 2023 08:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D2EF8016C;
	Fri,  9 Jun 2023 08:58:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F17D8F80199; Fri,  9 Jun 2023 08:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF04CF80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 08:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF04CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WWs8t9nt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=M8J/S5xH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A76B1FDF3;
	Fri,  9 Jun 2023 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686293762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+voTG+8HCGZVrrWKLhT11DL0bY+scq1aluMs5AW/cU=;
	b=WWs8t9ntutTm7OJgtRLzGjE+qzzFJCOInL4GCtOhvzjTUCKHQBnOA4vth31NzC+xxW6QLo
	873MX2/lylbMhyPp+6DvFh4OmS1sX8IFD/vs+2AzQUxRH44pavobryjcvUhIoNYVLJiKhB
	E83julRUO1DbcaxYPHc2AnQexvMkcUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686293762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+voTG+8HCGZVrrWKLhT11DL0bY+scq1aluMs5AW/cU=;
	b=M8J/S5xH8xUjR4DUKGGi6+V6vmVLHwWz1kqoODw+1czTxLxWKCxMfLnjbHwVnGZR/75LGu
	6nOiOL1RjOybCjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AF4D139C8;
	Fri,  9 Jun 2023 06:56:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sCLLBQLNgmQdPQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 09 Jun 2023 06:56:02 +0000
Date: Fri, 09 Jun 2023 08:56:01 +0200
Message-ID: <87h6rhcef2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <009474f04d0b45c69a0e42e8622b7a86@realtek.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6JH7FUQGWXEXZUKKL76T2SBWXWU7T7T3
X-Message-ID-Hash: 6JH7FUQGWXEXZUKKL76T2SBWXWU7T7T3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JH7FUQGWXEXZUKKL76T2SBWXWU7T7T3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 05:04:29 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> ALC236 works normally.
> But codec register can't show it. (it shows "Invalid AFG subtree")
> Could you know why?

It's the call of snd_hda_get_subnodes(), i.e. snd_hdac_get_subnodes(),
which simply reads the raw parameter value (uncached)
AC_PAR_NODE_COUNT:

int snd_hdac_get_sub_nodes(struct hdac_device *codec, hda_nid_t nid,
                           hda_nid_t *start_id)
{
        unsigned int parm;

        parm = snd_hdac_read_parm_uncached(codec, nid, AC_PAR_NODE_COUNT);
        if (parm == -1) {
                *start_id = 0;
                return 0;
        }
        *start_id = (parm >> 16) & 0x7fff;
        return (int)(parm & 0x7fff);
}

So it means the read of this parameter failed.

I suppose this is under the power-save, and it might be some timing
issue?  What if you disable the codec power saving?  The easiest way
would be to pass
  echo 0 > /sys/module/snd_hda_intel/parameters/power_save


thanks,

Takashi

> 
> BR,
> Kailang
> > -----Original Message-----
> > From: Joseph C. Sible <josephcsible@gmail.com>
> > Sent: Thursday, June 8, 2023 10:43 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; Bagas Sanjaya <bagasdotme@gmail.com>;
> > regressions@lists.linux.dev; perex@perex.cz; tiwai@suse.com;
> > alsa-devel@alsa-project.org
> > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > 15z-fc000 on warm boot
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Thu, Jun 8, 2023 at 2:32 AM Kailang <kailang@realtek.com> wrote:
> > >
> > > Could you use your patch to dump codec info again?
> > > I want to check it will also show "invalid AFG subtree".
> > 
> > Okay, here's the same command's output again, this time from under the
> > kernel with my patch that does fix the problem. It does also show "invalid AFG
> > subtree".
> > 
> > Thanks,
> > 
> > Joseph C. Sible
> > 
> > ------Please consider the environment before printing this e-mail.
