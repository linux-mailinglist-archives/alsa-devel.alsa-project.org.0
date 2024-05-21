Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C788CA9F8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 10:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C899B7F8;
	Tue, 21 May 2024 10:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C899B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716280312;
	bh=lpS4CuL1hfVfkN6UEIanZaVefK5M3mfjTRzD2Y1ov+k=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SLx4bCcY+fyCSedh2wt7JAKwYfzm9478VhZWoNA3M6JC43om8bAIo6zzlWTfqvg8j
	 0yk0tCXwdWdBXovZIHqUMZMfeoldCQ5fxplBB4r3fHwvd7gRmq6IaN3YtjwoaLjlNr
	 iEi8Ni48BVspwF0ouCn+juXm5M2I0KTI9AzghPbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3EB1F80525; Tue, 21 May 2024 10:31:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0335F805A9;
	Tue, 21 May 2024 10:31:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C3A9F8026A; Tue, 21 May 2024 10:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D369F801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 10:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D369F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEFcgL/K
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FB12C0042;
	Tue, 21 May 2024 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716280274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JhKEEmuqIsp0pcO3xD1Io87gyKvYBy5SHr5INy2szoI=;
	b=LEFcgL/KUyj0TFxT+Jq9QTLhHxatKQ+V+5MxvcoWaITwO8PYDebNzPnkvVanxdrkVemyzY
	2W0UzX6rX2XZNc3DWZQ83uDLS+qD7sNAdO5AUgd3jUEl5UeG2X/ns/K/3V9v+qEO5MYOk5
	qx10sRZFc+oT6FlZsLrHzMDYvHboQEhu6LAD/BupdldhthG7dSvl8N4UM8hjkKjZ46Q4iE
	CgM1XIB2vvthuwymANPUaJVTple5HL9ZpYNZvvUVKVeO4AqNyPOwy/hRKyAxcaGVwWAClR
	YkbIZLI0IoxbDTZDnvMWdAJPmh5bxvg73Ocbg7Zra9G/LJLUOD47tMQ9NzL5LQ==
Date: Tue, 21 May 2024 10:31:12 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: miquel.raynal@bootlin.com, perex@perex.cz, tiwai@suse.com,
	broonie@kernel.org, lars@metafoo.de, lgirdwood@gmail.com
Subject: DMA Transfer Synchronization Issue in Out-of-Tree Sound Card Driver
Message-ID: <Zkxb0FTzW6wlnYYO@localhost.localdomain>
Mail-Followup-To: linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org, miquel.raynal@bootlin.com,
	perex@perex.cz, tiwai@suse.com, broonie@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: louis.chauvet@bootlin.com
Message-ID-Hash: IMDXFDAAANSPIH5ORCH7UTTJPXNN4GVZ
X-Message-ID-Hash: IMDXFDAAANSPIH5ORCH7UTTJPXNN4GVZ
X-MailFrom: louis.chauvet@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMDXFDAAANSPIH5ORCH7UTTJPXNN4GVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hello everyone,

I am currently developing an out-of-tree driver for a sound card that 
utilizes XDMA for sample transfers. I am currently using a kernel 6.5 with 
the latest xdma driver cherry-picked, but I don't think any changes since 
6.5 is addressing my issue.

My initial issue pertains to the completion of DMA transfers between a 
start and a stop command in ALSA. If the interval is too brief, the 
transfer does not conclude properly, leading to distorted samples. A 
straightforward solution to this problem was to adequately wait for the 
transfer to finish upon the stop, ie. sleeping until we know the hardware 
is done with the transfert (the XDMA controller does not support stopping 
in the middle of a transfer).

To address this DMA issue, I have created a patch [1] that guarantees the 
completion of the DMA transfer upon the return of xdma_synchronize. This 
means xdma_synchronize now sleeps, but looking at other drivers around it 
appears expected to be able to do so.

Regarding the audio implementation, the following patch enforces the 
synchronization:

	int playback_trigger(struct snd_pcm_substream *substream, int command)
	{
		struct my_dev *my_dev =	snd_pcm_substream_chip(substream);

		switch (command) {
		case SNDRV_PCM_TRIGGER_START:
			/* Synchronize on start, because the trigger stop is called from an IRQ	context	*/
			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
				dmaengine_synchronize(my_dev->playback_dma_chan);
			pipe_start(&my_dev->playback, substream);
			break;
		case SNDRV_PCM_TRIGGER_STOP:
			pipe_stop(&my_dev->playback, substream);
			break;
		default:
			return -EINVAL;
		}
		return 0;
	}

In order for a sleepable function like dmaengine_synchronize() to work in 
the trigger callbacks, the audio card nonatomic flag had to be set. It 
basically leads the sound core towards the use of a mutex instead of a 
spinlock.

	static int probe([...])	{
		struct snd_pcm *pcm;
		[...]
		/* This flag is needed to be able to sleep in start/stop callbacks */
		pcm->nonatomic = true;
                [...]
		snd_pcm_set_managed_buffer_all(pcm, [...]);
	}

This approach generally works well, but leads to "scheduling while
atomic" errors. Indeed, the IRQ handler from the XDMA driver invokes a
function within the sound subsystem, which subsequently acquires a
mutex...

At the moment, the only solution I've found is to replace the 
wait_for_completion() in the XDMA driver [2] with a busy wait loop. 
However, this approach seems incorrect, as all other synchronization 
functions in other DMA drivers are sleeping, which should not cause an 
issue.

The problem might be related to the sound driver. Should I avoid manually 
using dmaengine_synchronize? How to achieve the same effect in this case? 
Perhaps there is a more traditional way to properly clean the stream in 
the sound subsystem which I overlooked?

Could someone please provide guidance on how to resolve this issue?

Thanks,
Louis Chauvet

[1]: https://lore.kernel.org/all/20240327-digigram-xdma-fixes-v1-2-45f4a52c0283@bootlin.com/
[2]: https://elixir.bootlin.com/linux/latest/source/drivers/dma/xilinx/xdma.c#L550

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
