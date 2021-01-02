Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE82E873F
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jan 2021 13:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA0E16AF;
	Sat,  2 Jan 2021 13:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA0E16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609589884;
	bh=aSYfEUuhucnFqYAkxyVk5sJtpy/cEecSFmMksPdh3mo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r6jknH6QNxN2G86PkKR42IoB9iNkHowDBUOIozp19ZB524iGHO8HPd21X0oDD6Dzf
	 O7ai1efy65WqmJUzDt5NaQJPKAeXRVuioedNS15Fvp/+8FokQ/CEt/OtRnVc2BGSBC
	 gTqL6v3F5Vj5L7GdlYTWEXeuYxbZ8snNWE4ZV/HY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F32A2F8022D;
	Sat,  2 Jan 2021 13:16:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29F04F8022B; Sat,  2 Jan 2021 13:16:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75454F800B7
 for <alsa-devel@alsa-project.org>; Sat,  2 Jan 2021 13:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75454F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="V7LEbQrJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B413F22241;
 Sat,  2 Jan 2021 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609589776;
 bh=aSYfEUuhucnFqYAkxyVk5sJtpy/cEecSFmMksPdh3mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7LEbQrJJV3ZpHOnXTA1knYYvfeevKkz6iB55RokiHrerp+8X9kPmBsMATULPJhAP
 L+xwMv6hFEZVZ3GiixMO612VYMmqfrDofVqTuPTgUa7PJVkbl75bIdKvEUo9OBNHqq
 zzLiTlEiSZNhB2XEPoGbpMVY7KiFSnk902VMuKRM=
Date: Sat, 2 Jan 2021 13:16:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian Labisch <clnetbox@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver
Message-ID: <X/BkDB2CU+Bbyz/0@kroah.com>
References: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
 <1ad341b1b0e0eefb83d157ac24d162eaad53ab32.camel@gmail.com>
 <0111f282-f044-47ed-f93e-5a19de61bdce@metafoo.de>
 <088cd3b6ba6589266e316d6adcb76861edd18775.camel@gmail.com>
 <s5h1rf4c10a.wl-tiwai@suse.de>
 <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
 <3dcc3129-aee5-0eea-0307-4eba7f03c0d6@metafoo.de>
 <d206434bed33930cb54b643f3d1968cf21973167.camel@gmail.com>
 <s5hwnwwa7ut.wl-tiwai@suse.de>
 <83651c8002ae10e358693adfde65e85b3c95953d.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83651c8002ae10e358693adfde65e85b3c95953d.camel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 amadeuszx.slawinski@linux.intel.com
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

On Sat, Jan 02, 2021 at 12:50:44PM +0100, Christian Labisch wrote:
> On Fri, 2021-01-01 at 18:24 +0100, Takashi Iwai wrote:
> > On Fri, 01 Jan 2021 14:40:39 +0100,
> > Christian Labisch wrote:
> > > 
> > > $ cat /sys/module/snd_hda_intel/parameters/power_save
> > > 0
> > 
> > Hm, then the best would be to run git bisect for spotting out the
> > breaking commit.  There has been no change in VIA codec driver at all
> > between v5.9 and v5.10, so the rest possibility is either in HD-audio
> > codec helper code or controller code (or both) -- if it's about the
> > changes in the sound driver.
> > 
> > Or you can try the oneliner below as a test shot; it might keep the
> > widget node power D0, which is currently the only possible appearance
> > of the difference between working and non-working cases.
> > 
> > BTW, please avoid top-posting.  It's confusing.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > -- 8< --
> > --- a/sound/pci/hda/patch_via.c
> > +++ b/sound/pci/hda/patch_via.c
> > @@ -115,7 +115,7 @@ static struct via_spec *via_new_spec(struct hda_codec *codec)
> >         spec->gen.keep_eapd_on = 1;
> >         spec->gen.pcm_playback_hook = via_playback_pcm_hook;
> >         spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
> > -       codec->power_save_node = 1;
> > +       // codec->power_save_node = 1;
> >         spec->gen.power_down_unused = 1;
> >         codec->patch_ops = via_patch_ops;
> >         return spec;
> 
> Hi Takashi,
> 
> Thank you ! I think we have tried what we could to work around this issue.
> There is obviously something wrong with the kernel which has to get fixed.

Yes, and that is what we are trying to figure out here.  Does the above
change work?

> Hi Greg and Lars,
> 
> From my understanding there are fundamental changes regarding the audio drivers.
> The sound should (and has to) work out-of-the-box without any user interactions.

Of course, but we need to figure out the change that caused the problem
here.  If someone who can reproduce this can run 'git bisect' that is
the fastest way to make this happen.

> As you can see in the post below, other users are facing exactly the same issue.
> It would be great if this could be solved as soon as possible, maybe in 5.10.5 ?
> 
> https://forum.manjaro.org/t/issue-after-kernel-5-10-update-speakers-not-working-on-laptop/45496

5.10.5 will be out next week, and that's not how stable kernels work.
The fix needs to be in Linus's tree first before we can take it in a
stable kernel release.  We need to figure out the fix first before it
can go anywhere...

thanks,

greg k-h
