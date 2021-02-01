Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F4E30B366
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 00:23:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22517177B;
	Tue,  2 Feb 2021 00:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22517177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612221783;
	bh=HMU7aG7uwRmy79FgmXjZ92eDmmuAG37fdMnJO3J2PFg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtrftvB/tbIocN1UnnMFiTdPhofLV/G4VEt87e3TmiHrWqEio+ZXq97mSk4wZAb9s
	 s+UfGaU0oW2DehfuRQXvSn7iOsHqHkQmU/JDld5nfgl+Xod2pX1KvTRdbUgANaJTOB
	 didCLiOw6kB2qiuXQB9ul5DNX71mRUqxRPzm/CU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D8CF800E9;
	Tue,  2 Feb 2021 00:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CFB8F800E9; Tue,  2 Feb 2021 00:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 962FBF800E9
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 00:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 962FBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="00VgjEXj"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 2F489A1570;
 Tue,  2 Feb 2021 00:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=SKZK/1HnMki4
 hnaBgoFLy/Sx0y22YEddsx1Drd55/gE=; b=00VgjEXjLKlbQOA/Fynwj1uReuEZ
 NkDv6tUCdGZ/jvJSxz16J253GAez2vKc+1W+o/4nzi4vZw+UHnnXi2+jWvaaDAGh
 BSF6j7YUIV4i6ho9KKerFFOKfopXiZjFy7+w/vO/jXtEr3nTLHML5z2NrQwBddy1
 qUwSA69bJKLQPw8OaaEFpGcCQ3r+IGmh2tfP+7PK0IZvr8IGZR0pFvR2Rzq2PDhB
 VJ8SzmeX3uOL2idQOyPihY2EC7DL5hIwRbaXkUd7XMoDsHrRnDy+3bFP7UqcBJkq
 d2QMuKjCAGKEr/caEtI6jD+cigUR27hRdPEGNoS442S0XBhcc1ms1ih/dA==
Subject: Re: [PATCH v2 8/9] ALSA: virtio: introduce PCM channel map support
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-9-anton.yakovlev@opensynergy.com>
 <643248d4-d246-686f-34c3-7e592777e3ec@intel.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <9ac289fd-70f2-5939-cf9f-ad9e60133349@opensynergy.com>
Date: Tue, 2 Feb 2021 00:21:59 +0100
MIME-Version: 1.0
In-Reply-To: <643248d4-d246-686f-34c3-7e592777e3ec@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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



On 26.01.2021 10:22, Guennadi Liakhovetski wrote:
 > CAUTION: This email originated from outside of the organization.
 > Do not click links or open attachments unless you recognize the sender
 > and know the content is safe.
 >
 >
 > On Sun, 24 Jan 2021, Anton Yakovlev wrote:
 >
 >> Enumerate all available PCM channel maps and create ALSA controls.
 >>
 >> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
 >> ---
 >> sound/virtio/Makefile       |   1 +
 >> sound/virtio/virtio_card.c  |  15 +++
 >> sound/virtio/virtio_card.h  |   8 ++
 >> sound/virtio/virtio_chmap.c | 237 ++++++++++++++++++++++++++++++++++++
 >> sound/virtio/virtio_pcm.h   |   4 +
 >> 5 files changed, 265 insertions(+)
 >> create mode 100644 sound/virtio/virtio_chmap.c
 >
 > [snip]
 >
 >> diff --git a/sound/virtio/virtio_chmap.c b/sound/virtio/virtio_chmap.c
 >> new file mode 100644
 >> index 000000000000..8a2ddc4dcffb
 >> --- /dev/null
 >> +++ b/sound/virtio/virtio_chmap.c
 >> @@ -0,0 +1,237 @@
 >
 > [snip]
 >
 >> +/**
 >> + * virtsnd_chmap_parse_cfg() - Parse the channel map configuration.
 >> + * @snd: VirtIO sound device.
 >> + *
 >> + * This function is called during initial device initialization.
 >> + *
 >> + * Context: Any context that permits to sleep.
 >> + * Return: 0 on success, -errno on failure.
 >> + */
 >> +int virtsnd_chmap_parse_cfg(struct virtio_snd *snd)
 >> +{
 >> +     struct virtio_device *vdev = snd->vdev;
 >> +     unsigned int i;
 >> +     int rc;
 >> +
 >> +     virtio_cread(vdev, struct virtio_snd_config, chmaps,
 >> &snd->nchmaps);
 >> +     if (!snd->nchmaps)
 >> +             return 0;
 >> +
 >> +     snd->chmaps = devm_kcalloc(&vdev->dev, snd->nchmaps,
 >> +                                sizeof(*snd->chmaps), GFP_KERNEL);
 >> +     if (!snd->chmaps)
 >> +             return -ENOMEM;
 >> +
 >> +     rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_CHMAP_INFO, 0,
 >> +                                 snd->nchmaps, sizeof(*snd->chmaps),
 >> +                                 snd->chmaps);
 >> +     if (rc)
 >> +             return rc;
 >> +
 >> +     /* Count the number of channel maps per each PCM device/stream. */
 >> +     for (i = 0; i < snd->nchmaps; ++i) {
 >> +             struct virtio_snd_chmap_info *info = &snd->chmaps[i];
 >> +             unsigned int nid = le32_to_cpu(info->hdr.hda_fn_nid);
 >> +             struct virtio_pcm *pcm;
 >> +             struct virtio_pcm_stream *stream;
 >> +
 >> +             pcm = virtsnd_pcm_find_or_create(snd, nid);
 >> +             if (IS_ERR(pcm))
 >> +                     return PTR_ERR(pcm);
 >> +
 >> +             switch (info->direction) {
 >> +             case VIRTIO_SND_D_OUTPUT: {
 >> +                     stream = &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
 >> +                     break;
 >> +             }
 >> +             case VIRTIO_SND_D_INPUT: {
 >> +                     stream = &pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
 >> +                     break;
 >> +             }
 >> +             default: {
 >> +                     dev_err(&vdev->dev,
 >> +                             "chmap #%u: unknown direction (%u)\n", i,
 >> +                             info->direction);
 >> +                     return -EINVAL;
 >> +             }
 >> +             }
 >> +
 >> +             stream->nchmaps++;
 >> +     }
 >> +
 >> +     return 0;
 >> +}
 >> +
 >> +/**
 >> + * virtsnd_chmap_add_ctls() - Create an ALSA control for channel maps.
 >> + * @pcm: ALSA PCM device.
 >> + * @direction: PCM stream direction (SNDRV_PCM_STREAM_XXX).
 >> + * @stream: VirtIO PCM stream.
 >> + *
 >> + * Context: Any context.
 >> + * Return: 0 on success, -errno on failure.
 >> + */
 >> +static int virtsnd_chmap_add_ctls(struct snd_pcm *pcm, int direction,
 >> +                               struct virtio_pcm_stream *stream)
 >> +{
 >> +     unsigned int i;
 >> +     int max_channels = 0;
 >> +
 >> +     for (i = 0; i < stream->nchmaps; i++)
 >> +             if (max_channels < stream->chmaps[i].channels)
 >> +                     max_channels = stream->chmaps[i].channels;
 >> +
 >> +     return snd_pcm_add_chmap_ctls(pcm, direction, stream->chmaps,
 >> +                                   max_channels, 0, NULL);
 >> +}
 >> +
 >> +/**
 >> + * virtsnd_chmap_build_devs() - Build ALSA controls for channel maps.
 >> + * @snd: VirtIO sound device.
 >> + *
 >> + * Context: Any context.
 >> + * Return: 0 on success, -errno on failure.
 >> + */
 >> +int virtsnd_chmap_build_devs(struct virtio_snd *snd)
 >> +{
 >> +     struct virtio_device *vdev = snd->vdev;
 >> +     struct virtio_pcm *pcm;
 >> +     struct virtio_pcm_stream *stream;
 >> +     unsigned int i;
 >> +     int rc;
 >> +
 >> +     /* Allocate channel map elements per each PCM device/stream. */
 >> +     list_for_each_entry(pcm, &snd->pcm_list, list) {
 >> +             for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
 >> +                     stream = &pcm->streams[i];
 >> +
 >> +                     if (!stream->nchmaps)
 >> +                             continue;
 >> +
 >> +                     stream->chmaps = devm_kcalloc(&vdev->dev,
 >> +                                                   stream->nchmaps + 1,
 >> +
 >> sizeof(*stream->chmaps),
 >> +                                                   GFP_KERNEL);
 >> +                     if (!stream->chmaps)
 >> +                             return -ENOMEM;
 >> +
 >> +                     stream->nchmaps = 0;
 >> +             }
 >> +     }
 >> +
 >> +     /* Initialize channel maps per each PCM device/stream. */
 >> +     for (i = 0; i < snd->nchmaps; ++i) {
 >> +             struct virtio_snd_chmap_info *info = &snd->chmaps[i];
 >> +             unsigned int nid = le32_to_cpu(info->hdr.hda_fn_nid);
 >> +             unsigned int channels = info->channels;
 >> +             unsigned int ch;
 >> +             struct snd_pcm_chmap_elem *chmap;
 >> +
 >> +             pcm = virtsnd_pcm_find(snd, nid);
 >> +             if (IS_ERR(pcm))
 >> +                     return PTR_ERR(pcm);
 >> +
 >> +             if (info->direction == VIRTIO_SND_D_OUTPUT)
 >> +                     stream = &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
 >> +             else
 >> +                     stream = &pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
 >> +
 >> +             chmap = &stream->chmaps[stream->nchmaps++];
 >> +
 >> +             if (channels > ARRAY_SIZE(chmap->map))
 >> +                     channels = ARRAY_SIZE(chmap->map);
 >> +
 >> +             chmap->channels = channels;
 >> +
 >> +             for (ch = 0; ch < channels; ++ch) {
 >> +                     u8 position = info->positions[ch];
 >> +
 >> +                     if (position >= ARRAY_SIZE(g_v2a_position_map))
 >> +                             return -EINVAL;
 >> +
 >> +                     chmap->map[ch] = g_v2a_position_map[position];
 >> +             }
 >> +     }
 >
 > You enter this function after virtsnd_chmap_parse_cfg() has run. And
 > virtsnd_chmap_parse_cfg() has already found or created all the PCMs and
 > counted channel maps - the same way as you do in the above loop. Wouldn't
 > it be enough to reuse the result of that counting and avoid re-counting
 > here?

If I understood your question right, then... it's not re-counting here. :)
It's just a referencing to each channel map for each stream in one by
one manner.


 >> +
 >> +     /* Create an ALSA control per each PCM device/stream. */
 >> +     list_for_each_entry(pcm, &snd->pcm_list, list) {
 >> +             if (!pcm->pcm)
 >> +                     continue;
 >> +
 >> +             for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
 >> +                     stream = &pcm->streams[i];
 >> +
 >> +                     if (!stream->nchmaps)
 >> +                             continue;
 >> +
 >> +                     rc = virtsnd_chmap_add_ctls(pcm->pcm, i, stream);
 >> +                     if (rc)
 >> +                             return rc;
 >> +             }
 >> +     }
 >> +
 >> +     return 0;
 >> +}
 >
-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

www.opensynergy.com

