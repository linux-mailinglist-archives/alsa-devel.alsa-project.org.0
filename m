Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03A743DDF
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 16:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E760845;
	Fri, 30 Jun 2023 16:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E760845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688136555;
	bh=uF0TfAuind/llrrS0J7b0cg0G0nqkL/iiITBqpMwsJQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YVKvKxrSpaszsQPWZh4FmhojLQS0BXPA/cWa62LD6cMSYhsZMi3AY+s5+kIZQgPmd
	 hb9OU68PRZkOQ1YKPjbKU26muwf6rhsAkR8aO9ne66eusrM1MUHUarPSTQo3EYHLab
	 HbpLkcjS/Vb/eiIAx95UWyMXXING6j2UnUmQ9NtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF51F8055C; Fri, 30 Jun 2023 16:47:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9297F80549;
	Fri, 30 Jun 2023 16:47:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DC14F80212; Fri, 30 Jun 2023 16:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0782F8027B
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0782F8027B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 83EE3242EA;
	Fri, 30 Jun 2023 10:45:43 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1qFFNW-mn3-00; Fri, 30 Jun 2023 16:45:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 0/8] ALSA: emu10k1: add support for high-bitrate modes of
 E-MU cards
Date: Fri, 30 Jun 2023 16:45:34 +0200
Message-Id: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JNET4ZTLBTVDPTHGP6ABRCYY5CC5PFJ2
X-Message-ID-Hash: JNET4ZTLBTVDPTHGP6ABRCYY5CC5PFJ2
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNET4ZTLBTVDPTHGP6ABRCYY5CC5PFJ2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series is what all the work was about: support the "dual-/quad-pumped"
modes of the E-MU cards.

Oswald Buddenhagen (8):
  ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
  ALSA: emu10k1: improve mixer control naming in E-MU D.A.S. mode
  ALSA: emu10k1: set the "no filtering" bits on PCM voices
  ALSA: emu10k1: make playback in E-MU D.A.S. mode 32-bit
  ALSA: add snd_ctl_add_locked()
  ALSA: emu10k1: add support for 2x/4x word clocks in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate capture in E-MU D.A.S. mode
  ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode

 include/sound/control.h          |   1 +
 include/sound/emu10k1.h          |  11 +
 sound/core/control.c             |  31 ++
 sound/pci/emu10k1/emu10k1.c      |  29 +-
 sound/pci/emu10k1/emu10k1_main.c |  19 +-
 sound/pci/emu10k1/emufx.c        | 109 +++-
 sound/pci/emu10k1/emumixer.c     | 901 +++++++++++++++++++++++++++----
 sound/pci/emu10k1/emupcm.c       | 422 +++++++++++++--
 sound/pci/emu10k1/emuproc.c      |   5 +
 sound/pci/emu10k1/io.c           |  30 +-
 sound/pci/emu10k1/voice.c        |   6 +
 11 files changed, 1383 insertions(+), 181 deletions(-)

Range-diff against v1:
1:  c8c1fbba5e52 = 1:  7cb49147164f ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
2:  879066428bee = 2:  aa9ead00e045 ALSA: emu10k1: improve mixer control naming in E-MU D.A.S. mode
3:  b663229a0f46 = 3:  ac830e67322f ALSA: emu10k1: set the "no filtering" bits on PCM voices
4:  a9de9a73571e = 4:  26e0b7c02c1d ALSA: emu10k1: make playback in E-MU D.A.S. mode 32-bit
5:  0f1950b03193 ! 5:  94b64e6c123d ALSA: add snd_ctl_add_locked()
    @@ Commit message
         This is in fact more symmetrical to snd_ctl_remove() than snd_ctl_add()
         is - the former could be named snd_ctl_remove_locked() just as well.
     
    +    One may argue that this is going in the wrong direction, as drivers have
    +    no business managing the lock. This may be true in principle, but in
    +    practice the vast majority of controls is created even before the device
    +    was registered, and therefore before any locking is necessary at all.
    +    That means that an even more radical approach of changing snd_ctl_add()
    +    do do no locking, and converting the call sites that actually need
    +    locking to a new function, would better match reality, and would be
    +    somewhat more efficient at that. However, that seems a bit risky and way
    +    too much work.
    +
         This will be used to dynamically change the available controls from
         another control's put() callback, which is already locked.
     
         One might want to add snd_ctl_replace_locked() for completeness, but I
         have no use for it now.
     
         Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
    +    ---
    +    v2:
    +    - extended commit message
     
      ## include/sound/control.h ##
     @@ include/sound/control.h: void snd_ctl_notify_one(struct snd_card * card, unsigned int mask, struct snd_kc
6:  511efe4ac7ad ! 6:  7bc314bae7f2 ALSA: emu10k1: add support for 2x/4x word clocks in E-MU D.A.S. mode
    @@ Commit message
         on playback, and throw away the excess ones on capture. Input-to-output
         monitoring does actually use the full sample rate, though.
     
    -    Notably, add_ctls() now uses snd_ctl_add_locked(), so it doesn't
    -    deadlock when called from snd_emu1010_clock_shift_put(). This also
    -    affects the initial creation of the controls, which is OK, as that is
    -    done before the card is registered, so no concurrent access can occur.
    +    Due to hardware constraints, changing the clock multiplier (CM) changes
    +    the available audio ports and the number of available channels. This has
    +    an impact on the channel routing mixer controls. One way to deal with
    +    this would be presenting a union of all possibilities, and simply
    +    ignoring currently inapplicable settings. However, this would be a
    +    terrible user experience, and go against the spirit of prior patches
    +    aimed at decluttering the mixer. Therefore, we do dynamic
    +    reconfiguration (DR) of the mixer in response to changing the CM.
    +
    +    DR is somewhat controversial, as it has the potential to crash poorly
    +    programmed applications. But that in itself isn't a very convincing
    +    argument against it, as by that logic we'd have to ban all hot-plugging.
    +    Such crashes would also not really qualify as regressions, as the D.A.S.
    +    mode is a new opt-in feature, and therefore no previously stable setups
    +    would be impacted. Also, pendantically, the driver already had DR via
    +    SNDRV_EMU10K1_IOCTL_CODE_POKE. A somewhat valid concern is that changing
    +    mixer settings is a non-privileged operation and therefore potential
    +    crashes could be exploited for a somewhat more impactful nuisance attack
    +    on another user than messing with the mixer per se. However, systemd &
    +    co. limit device access to the user currently logged in on the seat
    +    owning the device.
    +
    +    There is a specific concern about doing DR in response to changing a
    +    mixer control's value, as an application may legitimately react to DR by
    +    updating all mixer settings in turn. However, that update should write
    +    the same value to the clock multiplier, thus terminating the recursion.
    +
    +    One may limit DR to merely disabling inapplicable controls, in the hope
    +    that this would be better handled than completely tearing down and
    +    re-creating controls as we do. However, there is no guarantee for that.
    +    And because it is impossible to disable particular enum values within a
    +    control, it would be necessary to have three complete sets of
    +    per-channel controls. This would yield an extremely cluttered and
    +    confusing UI if the application (reasonably) chose to merely visually
    +    disable inactive controls rather than hiding them.
    +
    +    We do the DR synchronously from within snd_emu1010_clock_shift_put().
    +    This was enabled by commit 5bbb1ab5bd ("control: use counting semaphore
    +    as write lock for ELEM_WRITE operation"); we merely need to make
    +    add_ctls() use snd_ctl_add_locked() instead of snd_ctl_add(), so it
    +    doesn't deadlock. That also affects the initial creation of the
    +    controls, which is OK, as that is done before the card is registered, so
    +    no concurrent access can occur.
    +
    +    It would be possible to do the DR in a tasklet after the ioctl finishes.
    +    However, it is not obvious what actual problem that would solve, and the
    +    added asynchronicity would significantly complicate matters, esp. wrt.
    +    the batch updates expected during mixer state restoration.
     
         Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
    +    ---
    +    v2:
    +    - expanded commit message
     
      ## include/sound/emu10k1.h ##
     @@ include/sound/emu10k1.h: struct snd_emu1010 {
7:  d5cb50ca707f = 7:  72a156fb32cd ALSA: emu10k1: add high-rate capture in E-MU D.A.S. mode
8:  319425a4ccb6 ! 8:  6d35891832b3 ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode
    @@ Commit message
         d948035a92 ("Remove PCM xfer_align sw params").
     
         Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
    +    ---
    +    v2:
    +    - fixed `sparse` warning re missing __user annotation
     
      ## sound/pci/emu10k1/emufx.c ##
     @@ sound/pci/emu10k1/emufx.c: static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
    @@ sound/pci/emu10k1/emupcm.c: static int snd_emu10k1_efx_playback_trigger(struct s
     +		for (i = 0; i < channels; i++) {
     +			for (j = 0; j < subchans; j++) {
     +				u32 *dst = get_dma_ptr_x(runtime, shift, i, j, hwoff);
    -+				u32 *src = (u32 *)buf + j * channels + i;
    ++				u32 __user *src = (u32 __user *)buf + j * channels + i;
     +				for (k = 0; k < frames; k++, dst++, src += voices)
     +					unsafe_get_user(*dst, src, faulted);
     +			}
-- 
2.40.0.152.g15d061e6df

