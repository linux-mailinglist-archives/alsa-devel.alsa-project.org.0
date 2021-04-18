Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB2363723
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 20:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10EA1167A;
	Sun, 18 Apr 2021 20:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10EA1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618770381;
	bh=iKHxubHUiUs6V1ap5m7w5EEg1/fhe6c2Z9rrPFlmeTY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kF/FRqvjrG37losz3sMT4BMWLrOBLSatl/h6Rvgb1hwpAS7Ojx/nq+gnvUdCmt3/C
	 6Nh2/hLBDP8RDWCw9OGaHdT+nqSBE74hnBRmMWpH1z6QZM/+pLeRLxVue3F4nN5Ogc
	 HY7u7P13+X9vpoLLZMoNBAYYqrckYUSZACC55Cn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D926F8013C;
	Sun, 18 Apr 2021 20:24:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95441F80253; Sun, 18 Apr 2021 20:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D593EF8013C
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 20:24:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C1E7FA003F;
 Sun, 18 Apr 2021 20:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C1E7FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618770281; bh=upg4XkvX+NhGe+WagifZ1Suy8ca33dnP1AmqCp8yjg8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=qEVlVpqhMJBZNpWSf5jlHbJ1DgaEjFYjliS9bMXeK7A15wtVg7+hMSXL64lytJ1RN
 sxywXXYna5MIGugx7/xtjpG/f7X498oldRySwRK4bHWIPt0MOvL8u/OH3kifxyx23j
 TjxpYqOvpk/bwhrddRi+gKcd5uZLu0w9Ybv+m+ck=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 18 Apr 2021 20:24:38 +0200 (CEST)
Subject: Re: [PATCH v5] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210418151217.208582-1-coding@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a0928012-ff8d-3253-4cc6-89bf69d4cfdd@perex.cz>
Date: Sun, 18 Apr 2021 20:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210418151217.208582-1-coding@diwic.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 18. 04. 21 v 17:12 David Henningsson napsal(a):

> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16

SNDRV_ prefix should be here.

> +
> +struct snd_rawmidi_framing_tstamp {
> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
> +	 * types here. Applications are expected to skip unknown frame types.
> +	 */
> +	u8 frame_type;
> +	u8 length; /* number of valid bytes in data field */
> +	u8 reserved[2];
> +	u32 tv_nsec;		/* nanoseconds */
> +	u64 tv_sec;		/* seconds */
> +	u8 data[SND_RAWMIDI_FRAMING_DATA_LENGTH];

What about to move the fields to union (except for frame_type) like we do for
'struct snd_ctl_event' in case when we need to reorganize the contents for
future types?

> +};
> +
>  struct snd_rawmidi_params {
>  	int stream;
>  	size_t buffer_size;		/* queue size in bytes */
>  	size_t avail_min;		/* minimum avail bytes for wakeup */
>  	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
> -	unsigned char reserved[16];	/* reserved for future use */
> +	unsigned char framing;		/* For input data only, frame incoming data */
> +	unsigned char clock_type;	/* Type of clock to use for framing, same as clockid_t */
> +	unsigned char reserved[14];	/* reserved for future use */

As I noted, I would prefer to add 'unsigned int mode;' and define
SNDRV_RAWMID_MODE_XXX bit flags and groups with framing and clock_type groups.
There's no reason to stick with 'clockid_t' (which is integer anyway). We're
using just a subset.

#define SNDRV_RAWMIDI_MODE_FRAMING_MASK        (7<<0)
#define SNDRV_RAWMIDI_MODE_FRAMING_SHIFT       0
#define SNDRV_RAWMIDI_MODE_FRAMING_NONE	       (0<<0)
#define SNDRV_RAWMIDI_MODE_FRAMING_32BYTES     (1<<0)
#define SNDRV_RAWMIDI_MODE_CLOCK_MASK          (7<<3)
#define SNDRV_RAWMIDI_MODE_CLOCK_SHIFT         3
#define SNDRV_RAWMIDI_MODE_CLOCK_NONE	       (0<<3)
#define SNDRV_RAWMIDI_MODE_CLOCK_REALTIME      (1<<3)
#define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC     (2<<3)
#define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW (3<<3)

In this case, we can use 26-bits in future for extensions.

> +struct timespec64 get_framing_tstamp(struct snd_rawmidi_substream *substream)
> +{
> +	struct timespec64 ts64 = {0, 0};
> +
> +	if (substream->framing != SNDRV_RAWMIDI_FRAMING_TSTAMP)
> +		return ts64;
> +	if (substream->clock_type == CLOCK_MONOTONIC_RAW)
> +		ktime_get_raw_ts64(&ts64);
> +	else
> +		ktime_get_ts64(&ts64);
> +	return ts64;
> +}

Missing the realtime clock type here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
