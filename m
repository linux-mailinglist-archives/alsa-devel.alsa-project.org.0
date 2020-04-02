Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DD19C9BB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 21:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990A4167A;
	Thu,  2 Apr 2020 21:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990A4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585855029;
	bh=Y7jyeV9RTbMMi1LBeEE9UPIluVzGM6FFZ/DdNODj1hA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nb0hyF7ceEe6JM0l6YY9Def8KKGlJ3fcGBbjOX6aOUkQtsef4uFN/UmMeQPtJN/mv
	 /lBKdiuYr4Vl1ewt7HDqDWT2lDR2+3pQcV2vy8F4avuJAtlHcDBSuSzc8rC/ZBS6ct
	 fA1rpj4TpjMp5EaP0excFBkofH8QvVGNN0sSyyQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A00D3F80140;
	Thu,  2 Apr 2020 21:15:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8667DF80148; Thu,  2 Apr 2020 21:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF41F80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 21:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF41F80088
IronPort-SDR: 9Ha73wJS0mStt9CkDL4lbPCLCzbweNYCiqsO2daYJ149csy3u+NYnfAQB0onfe0T81ccseVbsW
 fV0ErP/EUjcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 12:15:13 -0700
IronPort-SDR: 4AdoBd0LgNfm2aJ61JmYL4HbfgNsy8xJJA7kLS41JCJO/XqrHsAaZFl79UCrNiCxa4mGKFUrDP
 kLfMZBS183+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="243166852"
Received: from akleen-mobl3.amr.corp.intel.com (HELO [10.212.244.82])
 ([10.212.244.82])
 by orsmga008.jf.intel.com with ESMTP; 02 Apr 2020 12:15:12 -0700
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
Date: Thu, 2 Apr 2020 14:15:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402184948.3014-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 4/2/20 1:49 PM, Hans de Goede wrote:
> At least on Canon Lake each time the SOF firmware is booted,
> the following error is logged in dmesg:
> 
> [   36.711803] sof-audio-pci 0000:00:1f.3: error: no reply expected, received 0x0
> 
> Since the DSP is powered down when not in used this happens everytime
> e.g. a notification plays, polluting dmesg with these false-positive
> errors.

What kernel are you using Hans? I thought this was solved with

8354d9b44530b ("ASoC: SOF: Intel: hda-loader: clear the IPC ack bit 
after FW_PURGE done")

Set DONE bit after the FW_PURGE IPC is polled successfully, to clear the
interrupt and avoid the arrival of the confusing unexpected ipc.
> Add a check to snd_sof_ipc_reply() which makes it return success when
> receiving an unexpected msg_id 0 during fw-boot, fixing these
> false-positive errors being logged.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/sof/ipc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
> index 78aa1da7c7a9..7303b3d42f12 100644
> --- a/sound/soc/sof/ipc.c
> +++ b/sound/soc/sof/ipc.c
> @@ -312,6 +312,11 @@ int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
>   {
>   	struct snd_sof_ipc_msg *msg = &sdev->ipc->msg;
>   
> +	/* Ignore msg_id 0 being send during fw-boot */
> +	if (msg->ipc_complete && sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS &&
> +	    msg_id == 0)
> +		return 0;
> +
>   	if (msg->ipc_complete) {
>   		dev_err(sdev->dev, "error: no reply expected, received 0x%x",
>   			msg_id);
> 
