Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D498C53
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 09:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9CB115E2;
	Thu, 22 Aug 2019 09:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9CB115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566458437;
	bh=N6bM5BrtvUPVc94AToOX0YZXXYc4aGqP8nfqow7SlKo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vG3sqQkDvapgD0kCfDkl0Xw0M6+EZZPhH54f+lMI+1gInDZ9SNeu9lXTuPy4hMf5W
	 NBPVDI355erXBcNnCNIJX2qWZhfTvAyiLstY+1WAGqcGIf08Cr2qWMgsrVIu8K9D/D
	 OdLAFBILX6fHWv3pLgEdkXXXS7N5bEyBJ+OEDjcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 911C9F8036E;
	Thu, 22 Aug 2019 09:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F11F80391; Thu, 22 Aug 2019 09:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8CDF8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 09:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8CDF8036D
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 00:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,415,1559545200"; d="scan'208";a="203294576"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.36.176])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 00:18:37 -0700
Date: Thu, 22 Aug 2019 09:18:36 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190822071835.GA30262@ubuntu>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 4/5] ASoC: SOF: Intel: hda: add
 SoundWire stream config/free callbacks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre,

A couple of comments below

On Wed, Aug 21, 2019 at 03:17:19PM -0500, Pierre-Louis Bossart wrote:
> These callbacks are invoked when a matching hw_params/hw_free() DAI
> operation takes place, and will result in IPC operations with the SOF
> firmware.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/sof/intel/hda.c | 66 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index e754058e3679..1e84ea9e6fce 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -53,6 +53,70 @@ static void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
>  					0);
>  }
>  
> +static int sdw_config_stream(void *arg, void *s, void *dai,
> +			     void *params, int link_id, int alh_stream_id)

I realise, that these function prototypes aren't being introduced by these 
patches, but just wondering whether such overly generic prototype is really 
a good idea here, whether some of those "void *" pointers could be given 
real types. The first one could be "struct device *" etc.

> +{
> +	struct snd_sof_dev *sdev = arg;
> +	struct snd_soc_dai *d = dai;
> +	struct sof_ipc_dai_config config;
> +	struct sof_ipc_reply reply;
> +	int ret;
> +	u32 size = sizeof(config);
> +
> +	memset(&config, 0, size);
> +	config.hdr.size = size;
> +	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
> +	config.type = SOF_DAI_INTEL_ALH;
> +	config.dai_index = (link_id << 8) | (d->id);
> +	config.alh.stream_id = alh_stream_id;

Entirely up to you, in such cases I usually do something like

+	struct sof_ipc_dai_config config = {
+		.type = SOF_DAI_INTEL_ALH,
+		.hre = {
+			.size = sizeof(config),
+			.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG,
+			...

which then also avoids a memset(). But that's mostly a matter of personal 
preference, since this is on stack, the compiler would probably internally 
anyway translate the above initialisation to a memset() with all the 
following assignments.

> +
> +	/* send message to DSP */
> +	ret = sof_ipc_tx_message(sdev->ipc,
> +				 config.hdr.cmd, &config, size, &reply,
> +				 sizeof(reply));
> +	if (ret < 0) {
> +		dev_err(sdev->dev,
> +			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",

Are readers really expected to understand what "dai->id" means? Wouldn't 
"DAI ID" be friendlier, although I understand you - who might not know 
what "x->y" stands for?.. ;-)

> +			link_id, d->id, alh_stream_id);
> +	}
> +
> +	return ret;
> +}
> +
> +static int sdw_free_stream(void *arg, void *s, void *dai, int link_id)
> +{
> +	struct snd_sof_dev *sdev = arg;
> +	struct snd_soc_dai *d = dai;
> +	struct sof_ipc_dai_config config;
> +	struct sof_ipc_reply reply;
> +	int ret;
> +	u32 size = sizeof(config);
> +
> +	memset(&config, 0, size);
> +	config.hdr.size = size;
> +	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
> +	config.type = SOF_DAI_INTEL_ALH;
> +	config.dai_index = (link_id << 8) | d->id;
> +	config.alh.stream_id = 0xFFFF; /* invalid value on purpose */

ditto

> +
> +	/* send message to DSP */
> +	ret = sof_ipc_tx_message(sdev->ipc,
> +				 config.hdr.cmd, &config, size, &reply,
> +				 sizeof(reply));
> +	if (ret < 0) {
> +		dev_err(sdev->dev,
> +			"error: failed to free stream for link %d dai->id %d\n",
> +			link_id, d->id);

ditto

> +	}
> +
> +	return ret;
> +}
> +
> +static const struct sdw_intel_ops sdw_callback = {
> +	.config_stream = sdw_config_stream,
> +	.free_stream = sdw_free_stream,
> +};
> +
>  static int hda_sdw_init(struct snd_sof_dev *sdev)
>  {
>  	acpi_handle handle;
> @@ -67,6 +131,8 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
>  	res.mmio_base = sdev->bar[HDA_DSP_BAR];
>  	res.irq = sdev->ipc_irq;
>  	res.parent = sdev->dev;
> +	res.ops = &sdw_callback;
> +	res.arg = sdev;
>  
>  	sdw = sdw_intel_init(handle, &res);
>  	if (!sdw) {

Hm, looks like this function is using spaces for indentation... Let me check 
if this is coming from an earlier patch

Thanks
Guennadi

> -- 
> 2.20.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
