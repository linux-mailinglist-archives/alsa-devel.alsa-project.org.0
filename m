Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9E4B4595
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 10:24:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 061B71685;
	Mon, 14 Feb 2022 10:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 061B71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644830691;
	bh=uVADi3xG8m0GhnDkuXrUZNaEp7q4F4jaha2kD6CUPHE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSZPI52aX9d1763ozD/OuBA0YNDHJcUHBa2baF32OVVEH6msvTYm3hAWNf+q+i2tK
	 O7+3hPOisJm6oMo5XW96ACOn5+PYQXkfgsc+q1ezqc5XgktwdzKGCUvXCjnD+zVkUM
	 L7rHETBkEfSD1sg9d4h+YcdOUTJFlkLCpBPSWXQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D235F8012F;
	Mon, 14 Feb 2022 10:23:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB28F80310; Mon, 14 Feb 2022 10:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89D1DF800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 10:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89D1DF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="XcoviKzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644830613;
 bh=4BMhIBlEja2RgPOz1L49iGMaTiiyLMaUItrHxemWXMA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=XcoviKznvD60/E5uONc024x+poFtlk3LOBSaPe7SJUG/YbA0NY6b/9pVIwZttuIZY
 I11tRjRtEdaRY4YaPmNb2hcEoKvcl6ExRp+4OSLFvL0bHiQbsqzw5bNae95sIRWl6X
 BflXd2YrFZctbyNd7re/DAfmUIxjwfFYTu3EaCRI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.218] ([185.196.22.218]) by web-mail.web.de
 (3c-app-webde-bap56.server.lan [172.19.172.143]) (via HTTP); Mon, 14 Feb
 2022 10:23:33 +0100
Message-ID: <trinity-c5d61690-bc8c-4233-9b65-2fdd2ac7809e-1644830613377@3c-app-webde-bap56>
From: dmummenschanz@web.de
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Aw: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Date: Mon, 14 Feb 2022 10:23:33 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <s5hbkz9hman.wl-tiwai@suse.de>
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
 <trinity-5e9e2188-92d3-4307-9e57-4981ce4440db-1644824332706@3c-app-webde-bap49>
 <s5hbkz9hman.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:yUOzpZ4bTlqup0LulHQhAL0ilS/PT9DqkmS4lpGwbvDt+A4SmRsaP9eBuRnQ96BSWKsfj
 f31bQyHCc8EqteiHzUSITcgx6gla5dxmPWhETBkk9SGHvbScP/Ai9eoQ0Feva60TMusgqa8rij01
 QHufv+wszrKryVPD9+zanyfmD+8+v8gCS5bMJKLSdk3m3ETTtiHtaE2+nMIxIAM2s62DOUNR83Pc
 F8R/X89utx05tmxfSMd3zzndfT5NRmzMVsUwGDOzS7pXVruvjNkSiU4q4CgMXHLQ0fvio9fAsRA/
 pE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:mN0B7EI1GYQ=:vapNaTuSeLJXPPNRdrbn/F
 RBCsJ8tbg58LCSnEx00Vk3sTX8VTwjSwiiWt5D8uE/dUqm7JafA30RlKM0F2nnV0cylMl35hL
 UQld0pz8HGtHaWq5inqYjVImyQHctvm/If99hlWhs9/Im5Vev/EtYyYOx3PRK9LSkuLB/IVsF
 V2fh7QUYzvuO4SU6vR2J13g8u3jvuvIa3XCoJq+iliVbaXm/NZonx6YsCdXBe5Ov3Gu9GwdPi
 QazZBKuDgwZnQkCnOqDSyVicBfal9llyMBh2MM6f2XmKVHTAa/0e3nqppGfiReQ7hgH+p4xz1
 LtZrjZ/MHvgAUSIMUZiSp73+xGXQ5vGfFW62BjH+SzGtyqBBU/hUgvkzSYtWksxNxgyDpBYYH
 p5lE7eYZ7kLwcuSdBuCmTVTW1LnU3fa3zWa7u9HakvXeDmRAuyRPKetTEbvLTbBIdNPQ6/346
 6gY/aI4HvSvzGCFNypejMf1uabFUxZ+DoS4BJh4ZPOCnbiTR7ILLqfSE5ItgLzL9Hz4TLRgrn
 XulrtDcq0c4l6roBAVK+2xK2DzSNebIabn3ql+LrpMd26AA2FBNUqd99uC3Jf9L9UhvS7jtsm
 fQhB58t9vmwgTM/D9fQriME8FAAkoB9uPosVQ/+Plti+VPeNGi9GVo3/C1DW1FoSmyV+OSAqt
 aW+FRd2rgzNYmnNObUrsuEd8ZHFmcg29bRNXS1sA0sb08Aa3ckwnpuG6fwXaWUc5vlFzarAEP
 6PvjsrEc5kzpLLedvki7ptln0Z+gTIsWLGw05KExmRIR1AKTVI6PPF5u4W/Ra7GHYK12VhNFV
 TqQ6qEd
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

   Okay, I reverted the previous patch, removed the probe_mask option and
   applied both of your patches. Looks good! ALC is detected and I have
   sound. Thank you. Any chance this will hit the mainline kernel for
   upcomming 5.17 release?

   [   25.947927] EXT4-fs (nvme0n1p8): mounted filesystem with ordered
   data mode. Quota mode: disabled.
   [   25.963952] snd_hda_codec_realtek hdaudioC0D0: autoconfig for
   ALC892: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
   [   25.963958] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
   (0x0/0x0/0x0/0x0/0x0)
   [   25.963961] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
   (0x1b/0x0/0x0/0x0/0x0)
   [   25.963963] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
   [   25.963964] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
   [   25.963965] snd_hda_codec_realtek hdaudioC0D0:    inputs:
   [   25.963967] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x18
   [   25.963968] snd_hda_codec_realtek hdaudioC0D0:      Internal
   Mic=0x12
   [   25.985493] urandom_read: 3 callbacks suppressed
   [   25.985496] random: dbus-daemon: uninitialized urandom read (12
   bytes read)
   [   25.986786] input: HDA Intel PCH Mic as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
   [   25.986825] input: HDA Intel PCH Headphone as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
   [   25.986862] input: HDA Intel PCH HDMI/DP,pcm=3 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
   [   25.986896] input: HDA Intel PCH HDMI/DP,pcm=7 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
   [   25.986927] input: HDA Intel PCH HDMI/DP,pcm=8 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
   [   25.986957] input: HDA Intel PCH HDMI/DP,pcm=9 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
   [   25.986997] input: HDA Intel PCH HDMI/DP,pcm=10 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
   [   25.992193] random: dbus-daemon: uninitialized urandom read (12
   bytes read)


   Gesendet: Montag, 14. Februar 2022 um 09:42 Uhr
   Von: "Takashi Iwai" <tiwai@suse.de>
   An: dmummenschanz@web.de
   Cc: alsa-devel@alsa-project.org
   Betreff: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
   driver
   On Mon, 14 Feb 2022 08:38:52 +0100,
   dmummenschanz@web.de wrote:
   >
   > Applied yout patch with "probe_mask=0x105" option. ALC892 is now
   found and I
   > have sound. Thanks! :)
   Good to hear.
   Below are two patches, one for a slightly revised version of
   probe_mask fix, and another to add your device to the quirk table.
   Could you give those a try, and test without probe_mask option?
   thanks,
   Takashi
