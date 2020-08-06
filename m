Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF423D838
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 10:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 934281669;
	Thu,  6 Aug 2020 10:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 934281669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596704352;
	bh=hhTMNqMOpwFe2fDTSwIbbR+RqFqMZHij7rkBaaMXAmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PudT+egs4UewD+BZkRJCCyMK7gqbHQm3L4fKzDPQaq+U9ktr2O71g7kaXdUVxDzj4
	 0QVolpsmtDE8NlGhHpOd6lby06VChRZFrBAmwlgK5f4ZLFQap7WxSIFIbsrzP8W1HX
	 ufPzRwsuxdFyXzCRn2Q6rPhvm3RGGADc+rYn06Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B76F80159;
	Thu,  6 Aug 2020 10:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65605F80159; Thu,  6 Aug 2020 10:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E997F80086;
 Thu,  6 Aug 2020 10:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E997F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SvriYCJO"
Received: by mail-ej1-x641.google.com with SMTP id o23so22017477ejr.1;
 Thu, 06 Aug 2020 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+G6sOcKGCNjTfY1OnI7sxm6WFaFKdHik9zggTbvb3o=;
 b=SvriYCJOBClhihg/ocnOM+0L1rOXWpkjo8IWa+QgP8q2arADBk6+Lin4MXrYe4Iu85
 Uanj9jbih4YXP5U5ANt36H/n1POPHe73bqDbktzT5imOtlQxGisn6b1bG4ILgB034t5m
 PtbpMl3be9QPimgduIzPeooqLcer4EX0TgSIAV5eJEgyXD+f4kaa0b6j70ZjVenE+fO2
 ZaGONmpM3YWAoFPQz5OgCJvSMPcNz/e4ZBhvjTG8t3T3+O/SFWzSIJ3EnntCeZFpMAK3
 3BIUjzu8IiXfSOQGbXx1I5fuAvjb0JtnpZQlv7F63HBEZmr4VsxYGpLhV80F7cbX/oNS
 oBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+G6sOcKGCNjTfY1OnI7sxm6WFaFKdHik9zggTbvb3o=;
 b=Ysy4zNZTJajKG1m7k9HBA/p0oeDGpViCar//HyXo6djwPEYMZ1Rgx5ev+2wr+600R1
 y5CTxyFfhUBZwvDpMNV+nBNH6ZXrzopYHpGveI1aiE2Eanb4BuKJrwhHWCFQG+XzLzkB
 Plgb1GbWcrYtN5WRFiYp+Wl58Geppk0K7yNqqSLcphNWaP5LI+JuAtw3884a8VJMb5WB
 blqE08Ns0Dxt9iKNNJiIsbLEKSGZQJ7CfCnWmBVzcmaE2emTSipM4Iua7c74kj+iabPM
 ggiZI00KfYkyheDQr3Qz1i+Vls80vadq/BLY50QDG3NkpOTCv55hwhCIypX9uPw4NlIv
 G/2A==
X-Gm-Message-State: AOAM530tidgMWJxDg37km82irb7rWAFizeNFe1wrXIpRX7ZWVFJnGVKf
 3la3arNYSUPKapzOG5Lm8ukkKWXD7pN2sgLAn6I=
X-Google-Smtp-Source: ABdhPJyRObbkBdMJED3uCIxIIeQgVzIRpKkoLpb+Y+n9jX0I4cPGKfYNetJyAqIcnHWeAxF1aeFUJpZR/OyvUps5bhk=
X-Received: by 2002:a17:906:b59:: with SMTP id
 v25mr3273685ejg.436.1596704233746; 
 Thu, 06 Aug 2020 01:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
In-Reply-To: <20200806020601.GA6286@laptop>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 6 Aug 2020 16:57:02 +0800
Message-ID: <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org, 
 alsa-user@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org, 
 o-takashi@sakamocchi.jp
Content-Type: text/plain; charset="UTF-8"
Cc: pierre-louis.bossart@linux.intel.com
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

Hi,

On Thu, 6 Aug 2020 at 10:06, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
>
> Hi,
>
> ALSA control core allows applications to lock/unlock a control element
> so that any write opreation to the control element fails for processes
> except for owner process.
>
> When a process requests `SNDRV_CTL_IOCTL_ELEM_LOCK`[1] against a
> control element. After operating the request, the control element is
> under 'owned by the process' state. In this state, any request of
> `SNDRV_CTL_IOCTL_ELEM_WRITE` from the other processes fails with
> `-EPERM`[2]. The write operation from the owner process is successful
> only. When the owner process is going to finish, the state is
> released[3].

That doesn't really address the problem anyway. As I've mentioned,
implementation of volume put() in kernel drivers often / can easily be
made atomic anyway (that might be the reason why this write lock isn't
popular). The problem/race I am trying to point out is, one process
can get()/read before another finishing its get()+put() pair (which is
required by volume setting/adjusting), so something like
get1()->get2()->put1()->put2() could easily happen (where each put()
relies on / is "configured" with volumes of their respective get()).
The lock will need to intentionally stall further get()/read as well.

If we for some reason want to avoid using locks, put() needs to be
atomic by design (like, "embed" get() in itself and use arrays for
volume values, instead of requiring those to be implemented in the
userspace manually / with a loop). Unfortunately that isn't the case
in ALSA.

>
> ALSA userspace library, a.k.a alsa-lib, has a pair of
> `snd_ctl_elem_lock()` and `snd_ctl_elem_unlock()` as its exported
> API[4].
>
> If application developers would like to bring failure to
> requests of `SNDRV_CTL_IOCTL_ELEM_WRITE` from the other processes in
> the period that the process requests `SNDRV_CTL_IOCTL_ELEM_READ` and
> `SNDRV_CTL_IOCTL_ELEM_WRITE` as a transaction, the lock/unlock
> mechanism is available. However, as long as I know, it's not used
> popularly.
>
>
> This is a simple demonstration about the above mechanism. PyGObject and
> alsa-gobject[5] is required to install:
>
> ```
> #!/usr/bin/env python3
>
> import gi
> gi.require_version('ALSACtl', '0.0')
> from gi.repository import ALSACtl
>
> import subprocess
>
> def run_amixer(should_err):
>   cmd = ('amixer', '-c', str(card_id),
>     'cset',
>     'iface={},name="{}",index={},device={},subdevice={},numid={}'.format(
>         eid.get_iface().value_nick, eid.get_name(),
>         eid.get_index(), eid.get_device_id(),
>         eid.get_subdevice_id(), eid.get_numid()),
>     '0,0',
>   )
>
>   result = subprocess.run(cmd, capture_output=True)
>   if result.stderr:
>     err = result.stderr.decode('UTF-8').rstrip()
>     print(' ', 'expected' if should_err else 'unexpected')
>     print('   ', err)
>   if result.stdout:
>     output = result.stdout.decode('UTF-8').rstrip().split('\n')
>     print(' ', 'expected' if not should_err else 'unexpected')
>     print('   ', output[-2])
>
> card_id = 0
> card = ALSACtl.Card.new()
> card.open(card_id, 0)
>
> for eid in card.get_elem_id_list():
>   prev_info = card.get_elem_info(eid)
>   if (prev_info.get_property('type') != ALSACtl.ElemType.INTEGER or
>       'write' not in prev_info.get_property('access').value_nicks or
>       'lock' in prev_info.get_property('access').value_nicks):
>       continue
>
>   card.lock_elem(eid, True)
>   print('  my program locks: "{}"'.format(eid.get_name()))
>   run_amixer_subprocess(True)
>
>   card.lock_elem(eid, False)
>   print('  my program unlocks: "{}"'.format(eid.get_name()))
>   run_amixer_subprocess(False)
> ```
>
> You can see the result of amixer execution is different in the cases of
> locked and unlocked, like:
>
> ```
> $ /tmp/lock-demo
>   ...
>   my program locks: "Headphone Playback Volume"
>   expected
>     amixer: Control hw:1 element write error: Operation not permitted
>   my program unlocks: "Headphone Playback Volume"
>   expected
>       : values=0,0
>   ...
> ```
>
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/include/uapi/sound/asound.h#n1083
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n1108
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n122
> [4] https://www.alsa-project.org/alsa-doc/alsa-lib/group___control.html#ga1fba1f7e08ab11505a617af5d54f4580
> [5] https://github.com/alsa-project/alsa-gobject
>
>
> Regards
>
> Takashi Sakamoto
