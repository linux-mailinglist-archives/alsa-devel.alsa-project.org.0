Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56611BF0E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC091664;
	Wed, 11 Dec 2019 22:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC091664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099347;
	bh=lrFv+g7OlMO6lzOGfCTKdC7LRZVbuUhArH/hf+oKXBI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XReh4wxiXN7V+zA47IaXrt9ZGHtB5sJeQapU78Mdz25lVVnCCjuIki+dzP9gjlyGG
	 cPiFo0b3yuZwE22HEgAXVXAd8mHxlrsEv2vN7VEdbNc1iz9yl/eSQ+Y4uqm3yk2zfK
	 C4AwwaDDuz8AFWN27MCYDkdOjtionMj7eiLktgkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681B4F80258;
	Wed, 11 Dec 2019 22:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0FE4F80256; Wed, 11 Dec 2019 22:20:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C195FF800EC
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C195FF800EC
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mo7eX-1hvNKe05hz-00pfxP; Wed, 11 Dec 2019 22:20:31 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:16 +0100
Message-Id: <20191211212025.1981822-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:EUNjsuCMFvOfLutRxMiDpsrdBNUjEnJY9WYrs7u4SgqHOEMtTQr
 jKDw6lqSni3FNWrx9XXBtARvrFjizsPEn+nvMSqjRiUsg3ZVQj5wvBXHcHmQM3fA5rPV9if
 eYFnSj/RbNur4cr2575gxtU+YinZnOGoTz45bXqganXcTY5kaJbKg79OiNzWJmilpZt/dLE
 PYXDEHBOpgA+AEPnJu4vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hf3kE9BGNcs=:p0QD8vySsZB9EGU/RjRvgy
 xeY3HbWJqQZqGkE1pQaqjDvABo0/GR/Ns+kAzHhWT9ohkisvw9jwxjF6sZ9wRcUDM4QL/M6rM
 4NoxYJW/D97waBIuUlIYg40eGtQClNXXw2DSJw+SJg0hIsV1XO/p0OzI77Q/Nc7MEs2HOo70S
 zG5h+4hLqoTqoarczPc2/KPkhzzsLnVO7oQ53qK9ft6x3R8btAQZOM0PiHNX0iujI7awU/Tfw
 uovBcm9JPVHTgXdUaLN1hkT+3vEq+bAo8W391fIlE3NyT5vXh3LN3+rbk2GpsISWzb79zYmdD
 qhnGXrqhBMWfQR1bQEJQ2PWYU3FcRK7oKxU5/PmqekVnAGXQsxWAPFn2Nghnx34ZB6Eewlydb
 dsz26qSiWhx9fvKomDqcL5B1+rwyK+qpjbNXgigZSJqEL9lI4YNjDC42F+iEKmVa7mzqBT8B8
 AdJ6pxdnfkmiLb85MNKZwsS+VslP47mB7GIFFG4RjRppllExpjtJ1pw5nRh5Xi1GkoPh88wwW
 rs537Xk+8pGtALK2lkaLqZ1AlrSCvvJ8UbGq/vkSTYu1GL6d2jp44878OYnXyCfSoktUbhViK
 Atv/eZo0Bg3k/1xEAsCf7I8W+rjywf7SFmcUKU5/TKDOBZ5SVgtzUaMk5rO3y2qtpOmubyK2k
 VQZ6Eh6i8ya8+y5rVuFF7tR4mz+9lnzCd/6ZAxApqS8fQqDfLWqMc8nPvoT5RQAp5g5P4Zksh
 8jpQuqazHE2imnDdS/oZxBmTPZxpbl/73mlj3zzkTXOPxzrHNSNaSDHMmsCQESSFIL0Y9Qr/M
 Rj0VVgWLNPsMZHNaeO0Xnr/H7s5w8DJ2An16pLQf+mGx34j07juW+0ak7ghgfZoFpwIsQOoBT
 isbIYlnWryBuBavmxqYQ==
Cc: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 0/8] Fix year 2038 issue for sound subsystem
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

I hope I addressed all review comments by now, so please pull this
for linux-5.6.

A git branch with the same contents is available for testing at [1].

     Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git y2038-alsa-v7
[2] https://lore.kernel.org/lkml/CAK8P3a2Os66+iwQYf97qh05W2JP8rmWao8zmKoHiXqVHvyYAJA@mail.gmail.com/T/#m6519cb07cfda08adf1dedea6596bb98892b4d5dc

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
 - Remove CONFIG_X86_X32 macro and introduced new compat_snd_pcm_status64_x86_32.

Changes since v1:
 - Add one macro for struct snd_pcm_status_32 which only active in 32bits kernel.
 - Convert pcm_compat.c to use struct snd_pcm_status_64.
 - Convert pcm_native.c to use struct snd_pcm_status_64.
---

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

 include/sound/pcm.h               |  74 ++++++--
 include/sound/soc-component.h     |   4 +-
 include/sound/timer.h             |   4 +-
 include/uapi/sound/asound.h       | 145 +++++++++++++--
 sound/core/pcm.c                  |  12 +-
 sound/core/pcm_compat.c           | 282 ++++++++----------------------
 sound/core/pcm_lib.c              |  38 ++--
 sound/core/pcm_native.c           | 226 +++++++++++++++++++++---
 sound/core/rawmidi.c              | 132 +++++++++++---
 sound/core/rawmidi_compat.c       |  87 +++------
 sound/core/timer.c                | 229 ++++++++++++++++++------
 sound/core/timer_compat.c         |  62 +------
 sound/drivers/aloop.c             |   2 +-
 sound/pci/hda/hda_controller.c    |  10 +-
 sound/soc/intel/skylake/skl-pcm.c |   4 +-
 15 files changed, 817 insertions(+), 494 deletions(-)

-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
