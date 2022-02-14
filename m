Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962814B42F1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 08:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F7A1671;
	Mon, 14 Feb 2022 08:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F7A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644824410;
	bh=wyZVIzN8jVkIyb53XflR1ILNGBjd+t9VXhHFeugl8/I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7PgFkvH8pmR0hAauPOTZMfxxrUKXwSuzH4tElUn+cg96v0mfaP6FyDC94kXPjTSI
	 Dt2iT1nGz8aIceV6vKzmvh4MMhmfYQUGmmryOnzZ56yIancGW1hkq/HbuMfagoRzgi
	 gCkDX5HKAgMxMN1M/5AMgOiHOspJoo+9fCcPm0Mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C96F80430;
	Mon, 14 Feb 2022 08:39:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 791A2F80310; Mon, 14 Feb 2022 08:39:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3535F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 08:38:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3535F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="Mppsvh4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644824332;
 bh=AgXQO/ntHkeP9Gb/KH379PqyvkNSWBww9tyUYvt5nX8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Mppsvh4jQXoKCRalgLIk12Hlk3QHc4djRZFPHnCN13E0GH3huu9LoQDfjNwv2g+Go
 sDj4zH8gFUAChrL4pzK9w01TH+F1SievPRC+nWO4H/CkToT+aPBreZhLDd2YAdkMKb
 55pkkubhjmFRlHNwRUFlwXkgr1ig+bxDuBFtXgMs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.218] ([185.196.22.218]) by web-mail.web.de
 (3c-app-webde-bap49.server.lan [172.19.172.49]) (via HTTP); Mon, 14 Feb
 2022 08:38:52 +0100
Message-ID: <trinity-5e9e2188-92d3-4307-9e57-4981ce4440db-1644824332706@3c-app-webde-bap49>
From: dmummenschanz@web.de
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Date: Mon, 14 Feb 2022 08:38:52 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <s5hfsolhqm3.wl-tiwai@suse.de>
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
 <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
 <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
 <trinity-7e2e8baa-0f43-4b12-902d-a907bd7efb79-1644665613748@3c-app-webde-bs56>
 <2db61794-d772-8df6-a843-fd1512cfaa57@linux.intel.com>
 <s5hmtivgmld.wl-tiwai@suse.de>
 <trinity-354a4a90-f564-4f73-bbea-ed00bc502c24-1644821395116@3c-app-webde-bs52>
 <s5hfsolhqm3.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:pUK/qH8q0J2MWcZiYcyQfcj3NMfos5d0Wqf37tGFswUxJGMOnWHdq+VzkCRYgXZ652Z1U
 RrINbDlZCIP2okjtk3S9xbzibKLoOdGW0ezIwda4ncZMQR8HrIJu/VzVz/HrWBgY6g0nbcTYkO2z
 WPeou6lO2Uz8VszPWfeI26kD2pgmU2202FZGm5OqT/ObEe8qtzD4KbB31Knpb2hDt604oqtXp54L
 FKzGqgxVT5gex/WWoV0jp2ib+7bhWzsN0awWOhjQnfeLei294VE45nGT+8EEswya1MX0Hzw6WL3z
 ho=
X-UI-Out-Filterresults: notjunk:1;V03:K0:bBWgnlMn3dA=:fzdX1iqPnJAE50GhKsVL6W
 NKlVyq9W4hPOY3jbt3tEH/rTrjpmkQ+N1etVM6r30p/zIpqURw2Y30iCmGZ1dHx/244Y9wgbE
 VrNmwLZe0wGyWNmljct0DOJq3aTLXsqU1YumY3oep8KY+SOgCYpQU8bczCPd0X6kd56+YLjR2
 5ZdoonS9GeCDBs5zolItua0ntt3NyFXx0ojV/ZLTrdzqxXi2LbWxcAXyeLJjIA3VvZFKRp5Tt
 MwE5w4Vx8YcTYDtFfcrds/bBOVXZg3UdQSYbEhLgqBVbbBZePEuF0f2hnPlLrKDLpzm8UHIKb
 vB9u5GQ4uEHbBONA7hl5PY6y23sGi13qZauM1fPQmgnxPOMoWGit1RnZCtyvL+g0/6uKZu+8+
 Ymv+AuxFg2UUtdSdHMxPCz9xF5e1Kr/4CQ9V+X008dUpuMNj/pEfyhLKlu6kJlWqVfJ1qc8EK
 Cw4o91ZZECKopFDOpJVpKnZ9d/1VZgop1TwjNLRaRnk0/U0gT9DT5t46PIh/SrcimgqQ1iM26
 FkdNJunT78EUgbf4Br1Slo5zmixBW/iZuXUcv5BnDtXzElLiQAuQydFW3dZmV1+eedgOjExhP
 h+xNAR+CPeFzsIpyOrSSRX+8lY2sSnPtBXeYBiNJYi4ZwgFmPttOqP3RTx+03V0yuJ1VoGTJ+
 4rFDQO4VeNxYDKlQFU4wh3DRNIlU6C5lYby6L2KwzSlM1pjVJPtdlnPZ/HjSZybMDcllGWqG8
 GW58EIfbesZ4ytEX7qmd18qkncyExmksYuNV83Mf49Y9cIPuxXhukYyENEjvxEDcg8Pp8I4hE
 LA9nGH3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Applied yout patch with "probe_mask=0x105" option. ALC892 is now found
   and I have sound. Thanks! :)

   [   25.986154] snd_hda_intel 0000:00:1f.3: codec_mask forced to 0x5
   [   25.997511] snd_hda_codec_realtek hdaudioC0D0: autoconfig for
   ALC892: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
   [   25.997516] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
   (0x0/0x0/0x0/0x0/0x0)
   [   25.997518] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
   (0x1b/0x0/0x0/0x0/0x0)
   [   25.997520] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
   [   25.997521] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
   [   25.997522] snd_hda_codec_realtek hdaudioC0D0:    inputs:
   [   25.997524] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x18
   [   25.997525] snd_hda_codec_realtek hdaudioC0D0:      Internal
   Mic=0x12
   [   26.005460] elogind-daemon[1040]: Watching system buttons on
   /dev/input/event2 (Lid Switch)
   [   26.022595] elogind-daemon[1040]: Watching system buttons on
   /dev/input/event6 (Intel HID events)
   [   26.022736] input: HDA Intel PCH Mic as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
   [   26.022793] input: HDA Intel PCH Headphone as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
   [   26.022830] input: HDA Intel PCH HDMI/DP,pcm=3 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
   [   26.022863] input: HDA Intel PCH HDMI/DP,pcm=7 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
   [   26.022896] input: HDA Intel PCH HDMI/DP,pcm=8 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
   [   26.022927] input: HDA Intel PCH HDMI/DP,pcm=9 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
   [   26.022957] input: HDA Intel PCH HDMI/DP,pcm=10 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input21


   Gesendet: Montag, 14. Februar 2022 um 08:08 Uhr
   Von: "Takashi Iwai" <tiwai@suse.de>
   An: dmummenschanz@web.de
   Cc: alsa-devel@alsa-project.org, "Pierre-Louis Bossart"
   <pierre-louis.bossart@linux.intel.com>
   Betreff: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
   driver
   On Mon, 14 Feb 2022 07:49:55 +0100,
   dmummenschanz@web.de wrote:
   >
   > Thanks for the scoop. I've added "options snd-hda-intel
   probe_mask=0x105" to /
   > etc/modules-d/alsa.conf. Unfortunately that didn't help. The ALC892
   > didn't show up. Why the log below says "codec_mask forced to 0x5" but
   I've
   > explicitly set the value to 0x105 I don't know.
   The bit 0x100 means to forcibly set the codec probe mask, so this is
   fine. But the actual work of the forced bit doesn't seem right.
   Could you try the patch below and test with probe_mask=0x105 again?
   thanks,
   Takashi
   --- a/sound/pci/hda/hda_intel.c
   +++ b/sound/pci/hda/hda_intel.c
   @@ -1798,8 +1798,6 @@ static int azx_create(struct snd_card *card,
   struct pci_dev *pci,
   assign_position_fix(chip, check_position_fix(chip, position_fix[dev]));
   - check_probe_mask(chip, dev);
   -
   if (single_cmd < 0) /* allow fallback to single_cmd at errors */
   chip->fallback_to_single_cmd = 1;
   else /* explicitly set to single_cmd or not */
   @@ -2280,6 +2278,8 @@ static int azx_probe_continue(struct azx *chip)
   chip->beep_mode = beep_mode[dev];
   #endif
   + check_probe_mask(chip, dev);
   +
   /* create codec instances */
   if (bus->codec_mask) {
   err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
