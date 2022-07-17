Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AF57760E
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 14:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645BE1681;
	Sun, 17 Jul 2022 14:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645BE1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658059709;
	bh=iRKznLvas17miqH578mdWHA7tPivEtw6WicVWZRMo/U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H58aklknCaHDltaA0YlaelfsRnKSMyNHFZhVDqYz2UahP1wFfW6rCJcfhUHepaB4q
	 rfCOtyUFDYm8B86tHEy9ka/n+h/eBnTUXHyLBzpAGzaPorKnBoh3cP2lpDq4jSl9Wv
	 +MOj1liYF1+Xrg83UvN90xUlDM0VuZOkXsjvDNLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA42CF800CB;
	Sun, 17 Jul 2022 14:07:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9329DF8015B; Sun, 17 Jul 2022 14:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 10005F800CB
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 14:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10005F800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1658059639098660946-webhooks-bot@alsa-project.org>
References: <1658059639098660946-webhooks-bot@alsa-project.org>
Subject: Inappropriate Envy24 rate locking/XRUNS for playback and/or recording
Message-Id: <20220717120726.9329DF8015B@alsa1.perex.cz>
Date: Sun, 17 Jul 2022 14:07:26 +0200 (CEST)
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

alsa-project/alsa-tools issue #11 was opened from foobers:

On Debian 'oldstable', there's a rate-locking and 'low pitch' problem with following setup (same on Mint/Unstable):

- dedicated audio card:
Multimedia audio controller: VIA Technologies Inc. ICE1712 [Envy24] PCI Multi-Channel I/O Controller (rev 02) based

- integrated audio in graphics card:
Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device xxxx

- onboard audio chip:
Audio device: Advanced Micro Devices, Inc. [AMD/ATI] xxx (Intel HDA) (xxxx)

Initially, in 'alsamixer', there are two values shown for 'Multi Track Internal Clock': '[44100]' and 'Default [41000]' for the dedicated AC. In alsamixer, it's only possible, to change the first value, but without any noticable effect (only using 'Envy24 Control' or 'Mudita24' seem to have).

Now, using the audio card, sometimes, right from the start, playback of internet audio streams (in Firefox) seems to have a wrong sampling rate set (i. e. probably 48 kHz), resulting in audibly lower 'pitch' and sound distortion. 

Even worse, playback isn't always affected from start, but recordings from 'gnome-sound-recorder' will be in either case. This can result in several hours of recorded audio being borked, since there's no controlling of the outcome, until recording is stopped, which is very undesirable, especially in ad-hoc recording situations.

I was able to track down the problem being linked to 'Master clock', 'Rate state' settings 'Locked' and 'Reset' in 'Envy24 Control Utility': checking and unchecking / switching forth to 48kHz and back to 44100Hz, helped resetting both playback and recording sampling rate to 44100Hz, to perform regular audio recordings with 'gnome-sound-recorder'.

The rate locking problem can also occur, after playing MP4 videos with Mplayer (media info: sampling rate 44100Hz); then, audio files (media info: bit rate 112Kbit/s, sampling rate 44100Hz), previously kown-good audio records will be played at a noticably lower 'pitch', also recording (with gnome-recorder) now will record at a lower pitch, i. e wrong rate.

In alsamixer, there are now two different values shown for 'Multi Track Internal Clock': '[44100]' and 'Default [48000]'.

Also, when trying to play a regular film DVD with VLC now, it very likely shows short dropouts of black screen and audio, at steady intervals of ~2s, requiring performing a logoff and login, to reset rates again.

Interestingly (and unexpectedly), setting 'Master clock' to 'S/PDIF in', seemed to internally freeze the clock / source to 'S/PDIF', in effect preventing any more sound output or recording from the device; trying to switch back to 44110Hz or 48000Hz would fail and the could only be reset, after until doing a complete reboot.

I've seen references, pointing to the rate locking issue, which suggest, that unchecking 'locked' and 'reset' for 'Rate state' in 'Envy24' would be the key here - only, on my system, those values didn't seem to be initially checked (at least not visually):

https://discourse.ardour.org/t/all-sound-is-low-pitched/82149

So the solution here would seem to be, to ensure unset 'Rate state' options at boot time; in contrast to this suggestion, the documentation says, 'locked' might cause 'errors' and 'XRUNS', and 'reset' only would be the recommended setting by default, to allow applications alter the clock sample rate to their needs, resetting them to the selected 'Master clock' default afterwards:

https://wiki.archlinux.org/title/Envy24control#Rate_State

While this seems to make sense, 'reset' not being set appropriatly, might also explain some of the weird behavior described above, namely, when some application sets and locks 48kHz for playback and/or input channels, which then don't match the input and/or output of another application, started after that.

The effect of VLC/MPlayer showing 'dropouts' may also have its cause in the mentioned 'XRUNS', in this case, supposedly buffer underruns, when applying an 48kHz sampling rate to video files with 44,1kHz audio streams, or buffer overflows, when applying 44,1kHz sampling to files with 48kHz audio streams:

https://unix.stackexchange.com/questions/199498/what-are-xruns

What (combination) of 'Rate state' settings (if any) would be a 'bullet-proof' remedy here, I cannot tell, since my settings obviously both empty. So, either this was a false visual feedback, or 'reset' does not work as intended.

So far, I can't confirm, if these settings differ in Mint, where the problem shows, too, as said (or if the defaults have been altered). Currently I can't try perma-setting 'reset' only (the recommended default), but I think it didn't work out before for recording.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/11
Repository URL: https://github.com/alsa-project/alsa-tools
