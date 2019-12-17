Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70112388D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 22:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D8641678;
	Tue, 17 Dec 2019 22:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D8641678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576617470;
	bh=t0lWGpEaS3D+QsaXC29gyPxwihlb1/KeBrsI8oRicTA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/T0f0ytr5++fGAz+VDqLz3TPjYOwk73UVjULdcFzQBIuYcfZKnD2qW+u0OsJqcGr
	 4Ccl+1f0JHjGhySrylEa8Wky17+xiSJHhRcKnIMggBgtb3v0gZGlNNAGnvzXEAEW5D
	 onzkL/by/UIM/wJhPol/hJp8luGvzIT130EUJJhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF81F8025A;
	Tue, 17 Dec 2019 22:16:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EEF1F8025A; Tue, 17 Dec 2019 22:16:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E510BF80218
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 22:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E510BF80218
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Myb8N-1hkqIR2dQ5-00yuUK for <alsa-devel@alsa-project.org>; Tue, 17 Dec
 2019 22:16:42 +0100
Received: by mail-qt1-f169.google.com with SMTP id n15so65918qtp.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:16:42 -0800 (PST)
X-Gm-Message-State: APjAAAVoRK/geDlN7Ke5GOyLwmvi0vINS0Z8G9TvfJOpDt+DUrzXjJqT
 /T33KgTlokHNTkhatVbiSyDXX3r2GOZ44btyQGE=
X-Google-Smtp-Source: APXvYqy6b06dHJTHC4bG4cfUFvpyyToFZ29Orokzz5Qfl46NAo8Ryeir/5mOyWqL97ujWK3lpTO2Q8H43fPv/xCIN1Y=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr6548210qtr.7.1576617401428;
 Tue, 17 Dec 2019 13:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <s5htv5z1bes.wl-tiwai@suse.de>
 <CAK8P3a3um5paR7DoNE3Qa9pjJx4jDfzsCbh+ihSPf1aGA10Niw@mail.gmail.com>
In-Reply-To: <CAK8P3a3um5paR7DoNE3Qa9pjJx4jDfzsCbh+ihSPf1aGA10Niw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Dec 2019 22:16:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2mDHFS+H2MHLBmSNfxv7mnw7vaWCP+dyXzGuyXXqq=Jg@mail.gmail.com>
Message-ID: <CAK8P3a2mDHFS+H2MHLBmSNfxv7mnw7vaWCP+dyXzGuyXXqq=Jg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:stkph4E0Y7JP5ophMD4kDeMAQDoqFXVWaaA2GBdpZ+OFvNpaG0O
 3rJco/Uv8rKZN5ifYamES05wRVVAqq5Zsq5Njv5NiB9+gt2AOb1Rj7yXLpBIiuIlZW4Ejkw
 KqOhHgbbHLvF4wYk1bCeHLcBQGjzjaHQG4bihsEbhIylOIBtwn6AV5ItJyQTBJ8ooHtLlwh
 +eiZlSe7rtie7maZeVuAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bF33N2Y5UsA=:vSh6iRStvdtYAyWE+VJKyK
 dlfgWErgvav1ImGjaBfOWOtrJvAYx8BbgeUxqoPxM5mewoEjsnK7i+ooYBW1pvVuBMLi/Tip5
 hadFntCCUtc6qn0Y9ClBg+dQf0J711+k1dNKLJeWGvmh3nOYU/uxe5rai9AcTIx+NFUXuBdLg
 Rz6ZA2Y+fJmPAWvecncSNLYGx6TVq7azIYo096xPQNtgQdL5UxCYt9ZpTejzWo8SMtEYTqh5z
 46B/iNaLvmDgX7pHmi4PO7K3ZzmVuG1vjtvZdbTNu4DuUa0j0sKjjxsGpFjBQyCnJwmESsAeL
 QDb0U8MgEUbkpLLGFp8lKy9QO7t4BNUvN4bVJx4F50/9+CDurQqs1bd1v/OY1jG+9ss2JKoxD
 fA6a2g1emEIRNayXArs94ipyLhehTjSHPuhGg76IRKKrUgmudiOW2FM/R7YXKaTGL3GimslR2
 3/WzbE5TgTqSMrxvIhefcZPOxF1klnYRswsVJgm3KOofdtpcLQyxxbet9CfLr0b0+XxxtdM+g
 C3+jSzbCM1Ap8oBDQLnuW6YMzhOKpaIlgTnFapfetmZE7NMAz0w/xjMi20vsG2GDdAPlIcp8q
 blhMIMSDA6m7+Nl4wSUsWcH2471f1R6W+zxPXnABm6e/D6TpW4bDRlWb/a1pHBQx7830Uqpbn
 kRxOvMhr5pVg1gs9aMbeER1LK42MHTws4Ld6ioGGfxeVptbqxfOFR2PkNSLztgQF+bGNz7z4Q
 C1+0UNXceFnpmqTwH91cTVpvnDVJ7yBdqTNhYDI+hKVpVgYoheqFsHK2pWJZeIoeovMGPJnnI
 C9jjDzW9jqPHOfAQSwmPtL9XwjlZJ6Q4r9P6MAch0J18DVzcimiJ4p3HqBTJ/gGjgwdCLBYjq
 Xeo/RAn4ZuMKYGnG5gSw==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [GIT PULL, v8] Fix year 2038 issue for sound subsystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
tags/y2038-alsa-v8-signed

for you to fetch changes up to 1cfaef9617033f38eba9cc725809ed32bcdb3dc5:

  ALSA: bump uapi version numbers (2019-12-13 11:25:58 +0100)

----------------------------------------------------------------
ALSA: Fix year 2038 issue for sound subsystem

This is a series I worked on with Baolin in 2017 and 2018, but we
never quite managed to finish up the last pieces. During the
ALSA developer meetup at ELC-E 2018 in Edinburgh, a decision was
made to go with this approach for keeping best compatibility
with existing source code, and then I failed to follow up by
resending the patches.

Now I have patches for all remaining time_t uses in the kernel,
so it's absolutely time to revisit them. I have done more
review of the patches myself and found a couple of minor issues
that I have fixed up, otherwise the series is still the same as
before.

Conceptually, the idea of these patches is:

- 64-bit applications should see no changes at all, neither
  compile-time nor run-time.

- 32-bit code compiled with a 64-bit time_t currently
  does not work with ALSA, and requires kernel changes and/or
  sound/asound.h changes

- Most 32-bit code using these interfaces will work correctly
  on a modified kernel, with or without the uapi header changes.

- 32-bit code using SNDRV_TIMER_IOCTL_TREAD requires the
  updated header file for 64-bit time_t support

- 32-bit i386 user space with 64-bit time_t is broken for
  SNDRV_PCM_IOCTL_STATUS, SNDRV_RAWMIDI_IOCTL_STATUS and
  SNDRV_PCM_IOCTL_SYNC_PTR because of i386 alignment. This is also
  addressed by the updated uapi header.

- PCM mmap is currently supported on native x86 kernels
  (both 32-bit and 64-bit) but not for compat mode. This series breaks
  the 32-bit native mmap support for 32-bit time_t, but instead allows
  it for 64-bit time_t on both native and compat kernels. This seems to
  be the best trade-off, as mmap support is optional already, and most
  32-bit code runs in compat mode anyway.

- I've tried to avoid breaking compilation of 32-bit code
  as much as possible. Anything that does break however is likely code
  that is already broken on 64-bit time_t and needs source changes to
  fix them.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
y2038-alsa-v8
[2] https://lore.kernel.org/lkml/CAK8P3a2Os66+iwQYf97qh05W2JP8rmWao8zmKoHiXqVHvyYAJA@mail.gmail.com/T/#m6519cb07cfda08adf1dedea6596bb98892b4d5dc

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Changes since v7: (Arnd):
 - Fix a typo found by Ben Hutchings

Changes since v6: (Arnd):
 - Add a patch to update the API versions
 - Hide a timespec reference in #ifndef __KERNEL__ to remove the
   last reference to time_t
 - Use a more readable way to do padding and describe it in the
   changelog
 - Rebase to linux-5.5-rc1, changing include/sound/soc-component.h
   and sound/drivers/aloop.c as needed.

Changes since v5 (Arnd):
 - Rebased to linux-5.4-rc4
 - Updated to completely remove timespec and time_t references from alsa
 - found and fixed a few bugs

Changes since v4 (Baolin):
 - Add patch 5 to change trigger_tstamp member of struct snd_pcm_runtime.
 - Add patch 8 to change internal timespec.
 - Add more explanation in commit message.
 - Use ktime_get_real_ts64() in patch 6.
 - Split common code out into a separate function in patch 6.
 - Fix tu->tread bug in patch 6 and remove #if __BITS_PER_LONG == 64 macro.

Changes since v3:
 - Move struct snd_pcm_status32 to pcm.h file.
 - Modify comments and commit message.
 - Add new patch2 ~ patch6.

Changes since v2:
 - Renamed all structures to make clear.
 - Remove CONFIG_X86_X32 macro and introduced new
compat_snd_pcm_status64_x86_32.

Changes since v1:
 - Add one macro for struct snd_pcm_status_32 which only active in
32bits kernel.
 - Convert pcm_compat.c to use struct snd_pcm_status_64.
 - Convert pcm_native.c to use struct snd_pcm_status_64.

----------------------------------------------------------------
Arnd Bergmann (3):
      ALSA: move snd_pcm_ioctl_sync_ptr_compat into pcm_native.c
      ALSA: add new 32-bit layout for snd_pcm_mmap_status/control
      ALSA: bump uapi version numbers

Baolin Wang (6):
      ALSA: Replace timespec with timespec64
      ALSA: Avoid using timespec for struct snd_timer_status
      ALSA: Avoid using timespec for struct snd_ctl_elem_value
      ALSA: Avoid using timespec for struct snd_pcm_status
      ALSA: Avoid using timespec for struct snd_rawmidi_status
      ALSA: Avoid using timespec for struct snd_timer_tread

 include/sound/pcm.h               |  74 +++++++++++++++++----
 include/sound/soc-component.h     |   4 +-
 include/sound/timer.h             |   4 +-
 include/uapi/sound/asound.h       | 145
++++++++++++++++++++++++++++++++++++-----
 sound/core/pcm.c                  |  12 ++--
 sound/core/pcm_compat.c           | 282
++++++++++++++++++++------------------------------------------------------------
 sound/core/pcm_lib.c              |  38 +++++++----
 sound/core/pcm_native.c           | 226
++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 sound/core/rawmidi.c              | 132 ++++++++++++++++++++++++++++---------
 sound/core/rawmidi_compat.c       |  87 +++++++------------------
 sound/core/timer.c                | 230
++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 sound/core/timer_compat.c         |  62 +++---------------
 sound/drivers/aloop.c             |   2 +-
 sound/pci/hda/hda_controller.c    |  10 +--
 sound/soc/intel/skylake/skl-pcm.c |   4 +-
 15 files changed, 818 insertions(+), 494 deletions(-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
