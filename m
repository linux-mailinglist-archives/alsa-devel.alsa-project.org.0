Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BD3EAA56
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 20:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362701922;
	Thu, 12 Aug 2021 20:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362701922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628793531;
	bh=97E1UevClhDXPkKNm0LPKX5Eh6oTReZhd6FbnvwGAfk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bY4jZYUpB0hJo8eWsP0g/O6rzmiG2t5JNVQfcEKIZzVMzMTY05eZHvuYK3iWHTPpb
	 R6aW0FmqD1HvF8AZEOCy8IcyvMvsl42t4XyIGhQTOsOpH95Eze3/XSDqkTz6jguxVG
	 091n0UIt3pyfqz4Sx9dop5tFovItfvwZCQBhb3K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 141FEF800AF;
	Thu, 12 Aug 2021 20:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8819F804CF; Thu, 12 Aug 2021 20:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88708F800AF
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 20:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88708F800AF
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="213571602"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="213571602"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 11:37:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="590808447"
Received: from vzakhari-mobl.amr.corp.intel.com (HELO [10.212.126.215])
 ([10.212.126.215])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 11:37:08 -0700
Subject: Re: [PATCH RFC v2 2/4] ALSA: pcm: Add SNDRV_PCM_INFO_EXPLICIT_SYNC
 flag
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210812113818.6479-1-tiwai@suse.de>
 <20210812113818.6479-3-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0a2debee-439d-ebb8-2832-039074194d75@linux.intel.com>
Date: Thu, 12 Aug 2021 13:37:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812113818.6479-3-tiwai@suse.de>
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


Hi Takashi,

> ALSA PCM core has an optimized way to communicate with user-space for
> its control and status data via mmap on the supported architectures
> like x86.  Depending on the situation, however, we'd rather want to
> enforce user-space notifying the applptr or hwptr change explicitly
> via ioctl.  For example, the upcoming non-contig and non-coherent
> buffer handling would need an explicit sync, and this needs to catch
> the applptr and hwptr changes.
> 
> This patch adds the new PCM hardware info flag,
> SNDRV_PCM_INFO_EXPLICIT_SYNC.  When this flag is set, PCM core
> disables both the control and the status mmap, which enforces
> user-space to update via SYNC_PTR ioctl.  In that way, drivers can
> catch the applptr and hwptr update and apply the sync operation if
> needed.

This looks like the same functionality as in the patch "ALSA: pcm:
conditionally avoid mmap of control data" that we submitted for the SPIB
support, no?

I was about to resubmit a v2 based on my version (code was reviewed on
GitHub in https://github.com/thesofproject/linux/pull/3076).

If it's the same solution, could this patch be applied first so we are
aligned regardless of the order in which memalloc and SPIB patches are
merged? The renaming is fine, and that was your idea that I implemented
anyways.

I think there would be a need for a tag as well so that Mark's tree
compiles when the SOF driver uses this.

Thanks!

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/uapi/sound/asound.h | 1 +
>  sound/core/pcm_native.c     | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index d17c061950df..1d84ec9db93b 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -299,6 +299,7 @@ typedef int __bitwise snd_pcm_subformat_t;
>  #define SNDRV_PCM_INFO_HAS_LINK_ABSOLUTE_ATIME     0x02000000  /* report absolute hardware link audio time, not reset on startup */
>  #define SNDRV_PCM_INFO_HAS_LINK_ESTIMATED_ATIME    0x04000000  /* report estimated link audio time */
>  #define SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME 0x08000000  /* report synchronized audio/system time */
> +#define SNDRV_PCM_INFO_EXPLICIT_SYNC	0x10000000	/* needs explicit sync of pointers and data */
>  
>  #define SNDRV_PCM_INFO_DRAIN_TRIGGER	0x40000000		/* internal kernel flag - trigger in drain */
>  #define SNDRV_PCM_INFO_FIFO_IN_FRAMES	0x80000000	/* internal kernel flag - FIFO size is in frames */
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index dc9fa312fadd..d233cb3b41d8 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3621,6 +3621,12 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
>  
>  static bool pcm_status_mmap_allowed(struct snd_pcm_file *pcm_file)
>  {
> +	/* If drivers require the explicit sync (typically for non-coherent
> +	 * pages), we have to disable the mmap of status and control data
> +	 * to enforce the control via SYNC_PTR ioctl.
> +	 */
> +	if (pcm_file->substream->runtime->hw.info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
> +		return false;
>  	/* See pcm_control_mmap_allowed() below.
>  	 * Since older alsa-lib requires both status and control mmaps to be
>  	 * coupled, we have to disable the status mmap for old alsa-lib, too.
> @@ -3635,6 +3641,9 @@ static bool pcm_control_mmap_allowed(struct snd_pcm_file *pcm_file)
>  {
>  	if (pcm_file->no_compat_mmap)
>  		return false;
> +	/* see above */
> +	if (pcm_file->substream->runtime->hw.info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
> +		return false;
>  	/* Disallow the control mmap when SYNC_APPLPTR flag is set;
>  	 * it enforces the user-space to fall back to snd_pcm_sync_ptr(),
>  	 * thus it effectively assures the manual update of appl_ptr.
> 
