Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2EC5A2B04
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 17:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD461616;
	Fri, 26 Aug 2022 17:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD461616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661527275;
	bh=Em1v7nsS9Ojyh2O088ccSWhcxMn+okohjkJpoLe3y7Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GkeIMcK5WNiapR/okZFQCbrssVARONZf51ESQVeiY16g7bTqmv8UGtpDMquDAM42a
	 bRd6cumudtJXZu+4IgPjHGm5jRID84QMeSBG4efIfv7Kl3ofq6N5B6s/eBC7uJ37KA
	 i15yfmkGQRrOwkFgBoUTCELerk76M7xIbnWJoAXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC4FF80134;
	Fri, 26 Aug 2022 17:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AEC8F80134; Fri, 26 Aug 2022 17:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6DE5F80134
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 17:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DE5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Fvy/YmQ+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="E3klih5m"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 743CF1F949;
 Fri, 26 Aug 2022 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661527209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97iE3p86LmL5nUt7jtSPzfO+8BqMwNIDg5V6WRooFvo=;
 b=Fvy/YmQ++k2snw5ygCkZsCkSBP3pMOpZ0kHAWTnhKDLty7Vh6e3U848l3kumjv5agbeQl+
 E+45C2hWkyRllWYaX1VdkHAc6+BmUaJ5gPg7ZoHi9eAL/LYNlk3EievHbV2sBiqgvAiozH
 O3flP2dcxE4IcHiJv2uOaVarlc62O5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661527209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97iE3p86LmL5nUt7jtSPzfO+8BqMwNIDg5V6WRooFvo=;
 b=E3klih5m/Ngy7425d9QqRZ7n3kql1r8/nYNwA7Dcn0lO8/mk/VYG2DhOczxseDad7BCr6o
 Yeu70xLSO75fR2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4789813A7E;
 Fri, 26 Aug 2022 15:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NAODEKnkCGPMWQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 26 Aug 2022 15:20:09 +0000
Date: Fri, 26 Aug 2022 17:20:08 +0200
Message-ID: <87r113jal3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lennert Van Alboom <lennert@vanalboom.org>
Subject: Re: [PATCH] USB DAC broken since commit
 bf6313a0ff766925462e97b4e733d5952de02367 (5.10.0-rc5)
In-Reply-To: <m8XpaeWJS23wth20p7EgE-Cxwi-5ZwWl0InTEc-wsDGOwh8Nw5RViGXqM_yP92eOmX0Kxfs2hcizPwZaEce80T3OH1rLQ3ph555M1iTCmFc=@vanalboom.org>
References: <T3VPXtCc4uFws9Gfh2RjX6OdwM1RqfC6VqQr--_LMDyB2x5N3p9_q6AtPna17IXhHwBtcJVdXuS80ZZSCMjh_BafIbnzJPhbrkmhmWS6DlI=@vanalboom.org>
 <874jy0mvwv.wl-tiwai@suse.de>
 <JGbq2exwKdQ4T8GQCI5YWzGredZVbYtBOxlnBN0ROtba40PvCdEKfz2mKzClqejgZMck374nGQyEIwzjiBi6sKYYNnJgKp26n1-_j6GT3hw=@vanalboom.org>
 <87bks7leun.wl-tiwai@suse.de>
 <m8XpaeWJS23wth20p7EgE-Cxwi-5ZwWl0InTEc-wsDGOwh8Nw5RViGXqM_yP92eOmX0Kxfs2hcizPwZaEce80T3OH1rLQ3ph555M1iTCmFc=@vanalboom.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ls.yoyo.m@gmail.com" <ls.yoyo.m@gmail.com>, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 26 Aug 2022 11:07:55 +0200,
Lennert Van Alboom wrote:
> 
> ------- Original Message -------
> On Friday, August 26th, 2022 at 08:05, Takashi Iwai <tiwai@suse.de> wrote:
> > 
> 
> > This option is passed per card instance, as the driver may hold
> > multiple cards. Check your /proc/asound/cards. The first argument of
> > quirk_flags is applied to the first USB-audio card, the second to the
> > second USB audio device, and so on.
> > 
> 
> > At best, give alsa-info.sh output before and after applying the
> > quirk. Run the script with --no-upload option and attach the
> > outputs.
> > 
> 
> > And, as a reference, you can see the existing quirk tables in
> > sound/usb/quirks.c.
> > 
> 
> > 
> 
> > Takashi
> 
> 
> Not sure why it failed before (didn't look further then, so possibly PEBKAC) but as you suggested, this works now (tested on debian's 5.19 kernel):
> 
> # modprobe snd_usb_audio vid=0x2522 pid=0x0007 quirk_flags=0x10000
> 
> 
> Confirmed that setting a quirk_alias also works: 
> 
> 
> # grep -A 1 "0x054c, 0x0b8c" linux/sound/usb/quirks.c 
> 
> 	DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
> 		   QUIRK_FLAG_SET_IFACE_FIRST),
> # modprobe snd_usb_audio quirk_alias=25220007:054c0b8c
> 
> 
> I've added a patch for quirks.c to make this default behaviour for
> this device.

Good to hear.  Will you submit the fix patch for the merge, or shall I
do it in my side?

> Looking at the Arch bug report at https://bugs.archlinux.org/task/70636, it's likely similar behaviour may be needed for pid=0009 (LH Labs Geek Pulse X 1V5) but I have no way of testing this. Added the reporter in CC.

It's likely OK to apply the same quirk, but it's certainly safer to
hear the test result, of course.


thanks,

Takashi
