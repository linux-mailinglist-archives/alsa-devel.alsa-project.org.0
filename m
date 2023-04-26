Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394756EEFC1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 10:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C1C104E;
	Wed, 26 Apr 2023 10:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C1C104E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682496142;
	bh=8JESnXU+DI1Rlbma40r1zJwBveh9DivSvxrzRjyPuWQ=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KhzaeAWGQ4eQt6Au/ad7f6XOoYGFlub2dtpnWaV4CGSiwiluDl+TqgiInpil5xugZ
	 kO/5+6c05qBXIPL9lFmesjJsFDYp7S8FEhqZYUefkaAgFzyKtWOszshY0JKvneQEId
	 2MvXXt25IEK5T4dGh8tty6/dPaBaruK9N47KIo2E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3181F8018A;
	Wed, 26 Apr 2023 10:01:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E244BF80236; Wed, 26 Apr 2023 10:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49D44F80104
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 10:01:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6930A11D5;
	Wed, 26 Apr 2023 10:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6930A11D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682496079; bh=LA08Mj7uhWXsX144rk3cRnKnNYVgZqF98ZDwkiwSJyE=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=BjHatFwfvQrvMD6BSbG/cXYO3u6A6u1cI55AMDRvliNhMk4ESPQu4QzFQoVMz+Kl1
	 v5IUyAvrYsHGfumc6AdbQkPrMm9ZkmaZW5PklxV0sNGfOaCGhxR3NM1bcsxfLiYkGo
	 iAZoL4KeTcb7L9jDS3QayRGTMK4L7tbEnFI+6CA0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 26 Apr 2023 10:01:12 +0200 (CEST)
Message-ID: <7645c6c8-a21c-23d7-5c19-cd2892b98481@perex.cz>
Date: Wed, 26 Apr 2023 10:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jakub Kicinski <kuba@kernel.org>
References: <20230425111924.05cf8b13@kernel.org> <87pm7rtdul.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: USB sound card freezes USB after resume from suspend
In-Reply-To: <87pm7rtdul.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KOBM2EM2ND3GGQDWRF54JKI6LN75DZRI
X-Message-ID-Hash: KOBM2EM2ND3GGQDWRF54JKI6LN75DZRI
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 regressions@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOBM2EM2ND3GGQDWRF54JKI6LN75DZRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26. 04. 23 7:24, Takashi Iwai wrote:
> On Tue, 25 Apr 2023 20:19:24 +0200,
> Jakub Kicinski wrote:
>>
>> Hi!
>>
>> For a few weeks now I can't use any USB devices if I suspend my laptop
>> with my USB sound card active and resuming it without it connected.
>>
>> USB worker threads seems to be sitting in:
>>
>> [<0>] snd_pcm_dev_disconnect+0x1e8/0x280 [snd_pcm]
>> [<0>] snd_device_disconnect_all+0x42/0x80 [snd]
>> [<0>] snd_card_disconnect+0x128/0x290 [snd]
>> [<0>] usb_audio_disconnect+0x11a/0x2c0 [snd_usb_audio]
>> [<0>] usb_unbind_interface+0x8c/0x270
>> [<0>] device_release_driver_internal+0x1b2/0x230
>> [<0>] bus_remove_device+0xd8/0x150
>> [<0>] device_del+0x18b/0x410
>> [<0>] usb_disable_device+0xc6/0x1e0
>> [<0>] usb_disconnect+0xda/0x2c0
>> [<0>] usb_disconnect+0xbf/0x2c0
>> [<0>] usb_disconnect+0xbf/0x2c0
>> [<0>] usb_disconnect+0xbf/0x2c0
>> [<0>] hub_event+0xf01/0x1cd0
>> [<0>] process_one_work+0x1c4/0x3d0
>> [<0>] worker_thread+0x4d/0x380
>> [<0>] kthread+0xe6/0x110
>> [<0>] ret_from_fork+0x29/0x50
>>
>> Which is:
>>
>> snd_pcm_dev_disconnect (/usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:818 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:812 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:1129) snd_pcm
>>
>> It happens on Fedora 37 and Fedora 38, it seems to have coincided with
>> the 6.2 kernel but I'm not 100% sure.
>>
>> The USB devices come back after half an hour or so, silently.
>> There's nothing of note in dmesg.
> 
> AFAIK, there has been no similar report, so far.
> 
> Is it a regression?  If yes, could you figure out which kernel version
> starts showing the problem (or at best bisection)?

It seems that it may be related to free_chmap():

(gdb) l *(snd_pcm_dev_disconnect+0x1e8)
0xef0 is in snd_pcm_dev_disconnect (sound/core/pcm.c:817).
812	static void free_chmap(struct snd_pcm_str *pstr)
813	{
814		if (pstr->chmap_kctl) {
815			struct snd_card *card = pstr->pcm->card;
816	
817			down_write(&card->controls_rwsem);
818			snd_ctl_remove(card, pstr->chmap_kctl);
819			up_write(&card->controls_rwsem);
820			pstr->chmap_kctl = NULL;
821		}

I think that the chmap should be freed only in snd_pcm_free_stream() to avoid 
possible nested mutex locks. This operation does not belong to disconnect.

But I cannot reproduce this lock here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

