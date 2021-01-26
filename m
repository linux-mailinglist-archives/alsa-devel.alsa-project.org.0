Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D430376A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 08:42:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0257817B6;
	Tue, 26 Jan 2021 08:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0257817B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611646967;
	bh=zNx5uSEJ8hQ/SO99YcOBUs5c41KkoN6gA9zB7+N00D4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B24hJdGsDqz2btvqFU6yY7H8ojyLBF68zD4dVKh9fB/+BKtsHKSE2yQHVsJgXtxgB
	 uRehR6PBig9c5TLyvEH69deOQPRNkGO7kvZMePD8Cd9yZbS7I4dEfwdYqhbsox2vhD
	 JaKew7MSpngZdCemYsLSSCUJileVXtUC9u19hzqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B84FF80158;
	Tue, 26 Jan 2021 08:41:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C1C9F8015B; Tue, 26 Jan 2021 08:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74102F8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 08:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74102F8011C
IronPort-SDR: /yVWn/1RbamzNRfttaV5kkxzMEOLiNT/65dZ+qb3fikdNyTVMBqf3i7fyre0Gphi/LC156XciD
 C2XMQi1BaOlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="159039065"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="159039065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 23:40:53 -0800
IronPort-SDR: zgP8Qm+Gvv16cNo08q7txgjrXUAHycE6DfPglon2E99+Tj1Ov+xN+jww9nqH65/mWfOgqC6HX3
 XZcYxqUhNXKg==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="387728025"
Received: from kleve-mobl1.ger.corp.intel.com (HELO ubuntu) ([10.252.52.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 23:40:43 -0800
Date: Tue, 26 Jan 2021 08:40:41 +0100 (CET)
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH v2 7/9] ALSA: virtio: introduce jack support
In-Reply-To: <20210124165408.1122868-8-anton.yakovlev@opensynergy.com>
Message-ID: <8dce1870-9ffe-949d-ee5a-f2564f88ac5@intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-8-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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


On Sun, 24 Jan 2021, Anton Yakovlev wrote:

> Enumerate all available jacks and create ALSA controls.
>
> At the moment jacks have a simple implementation and can only be used
> to receive notifications about a plugged in/out device.
>
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> ---
> sound/virtio/Makefile      |   1 +
> sound/virtio/virtio_card.c |  18 +++
> sound/virtio/virtio_card.h |  12 ++
> sound/virtio/virtio_jack.c | 255 +++++++++++++++++++++++++++++++++++++
> 4 files changed, 286 insertions(+)
> create mode 100644 sound/virtio/virtio_jack.c

[snip]

> diff --git a/sound/virtio/virtio_jack.c b/sound/virtio/virtio_jack.c
> new file mode 100644
> index 000000000000..83593c59f6bf
> --- /dev/null
> +++ b/sound/virtio/virtio_jack.c
> @@ -0,0 +1,255 @@

[snip]

> +/**
> + * virtsnd_jack_parse_cfg() - Parse the jack configuration.
> + * @snd: VirtIO sound device.
> + *
> + * This function is called during initial device initialization.
> + *
> + * Context: Any context that permits to sleep.
> + * Return: 0 on success, -errno on failure.
> + */
> +int virtsnd_jack_parse_cfg(struct virtio_snd *snd)
> +{
> +	struct virtio_device *vdev = snd->vdev;
> +	struct virtio_snd_jack_info *info;
> +	unsigned int i;
> +	int rc;
> +
> +	virtio_cread(vdev, struct virtio_snd_config, jacks, &snd->njacks);
> +	if (!snd->njacks)
> +		return 0;
> +
> +	snd->jacks = devm_kcalloc(&vdev->dev, snd->njacks, sizeof(*snd->jacks),
> +				  GFP_KERNEL);
> +	if (!snd->jacks)
> +		return -ENOMEM;
> +
> +	info = devm_kcalloc(&vdev->dev, snd->njacks, sizeof(*info), GFP_KERNEL);

just kcalloc()

> +	if (!info)
> +		return -ENOMEM;
> +
> +	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_JACK_INFO, 0, snd->njacks,
> +				    sizeof(*info), info);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < snd->njacks; ++i) {
> +		struct virtio_jack *jack = &snd->jacks[i];
> +		struct virtio_pcm *pcm;
> +
> +		jack->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
> +		jack->features = le32_to_cpu(info[i].features);
> +		jack->defconf = le32_to_cpu(info[i].hda_reg_defconf);
> +		jack->caps = le32_to_cpu(info[i].hda_reg_caps);
> +		jack->connected = info[i].connected;
> +
> +		pcm = virtsnd_pcm_find_or_create(snd, jack->nid);
> +		if (IS_ERR(pcm))
> +			return PTR_ERR(pcm);
> +	}
> +
> +	devm_kfree(&vdev->dev, info);
> +
> +	return 0;
> +}

Thanks
Guennadi
