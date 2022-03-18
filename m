Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE734DDE2D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 17:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E707B1856;
	Fri, 18 Mar 2022 17:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E707B1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647620199;
	bh=kk0QEZb6sU6ljmyBf5iZtjDtuEKxL+HDQZU1VPh1Xao=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIoZ8YdJfeqTj9wFeYo66cZH69IzJV5O67g2CBPnBtKE36VSFgvNkgqQGzGGdWYbw
	 9ouGi9gJp8IRoxvrc3CCrT/5imqH/3JM03589RNKVxLVAI6inxMLv5/Mzjk0IDBhQZ
	 VbMhRLDw5EQg8MBMrjP0r1PW8HiG3tSyKDuyNtjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4A6F8026D;
	Fri, 18 Mar 2022 17:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF02F80124; Fri, 18 Mar 2022 17:15:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1523F80124;
 Fri, 18 Mar 2022 17:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1523F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DIBMC7c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647620123; x=1679156123;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kk0QEZb6sU6ljmyBf5iZtjDtuEKxL+HDQZU1VPh1Xao=;
 b=DIBMC7c1FyiS991tDppP5/CMXXdEr+LvktrQheGGDF95hQ3mtNdc6zFQ
 9p8eZYuKg+GVuwvyRDtUNwde39TpL/x2hySpBF70lG9bkUT2FkOuZ9vEq
 9DByVKzkqmy96QXhHwlNNXzTZPbuxWq+NS3Xs10VxfYLOyTjFMvSpGkYA
 AWoK+D1mdUnWoOSIdkwonKqtCIe4f9vWQAzN+t4vuBsUClvCfTVp2DO/8
 ToPWE2nfskXcgCR2U76AuVlAo0aiVZQ0wLlzFrRgPOFMqPLTlZbZSsyVc
 a0PutKdQzq8OnSvrEAAxroUg9Wgjnd6DK7rxrAnw3ADhM6aa/qPFX13EN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257353784"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="257353784"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 09:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="513940889"
Received: from dcforman-mobl1.amr.corp.intel.com ([10.254.51.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 09:14:55 -0700
Message-ID: <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Mar 2022 09:14:55 -0700
In-Reply-To: <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
References: <20220318071233.GB29472@kili>
 <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Fri, 2022-03-18 at 09:42 -0500, Pierre-Louis Bossart wrote:
> 
> On 3/18/22 02:12, Dan Carpenter wrote:
> > The "dia" pointer can be NULL, so handle that condition first
> > before
> > storing "dia->private".
> > 
> > Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC
> > agnostic")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for the patch.
> 
> This part will be removed in follow-up patches, likely the reason
> why 
> this problem was missed.

Hi Dan/Pierre,

Both these problems are address in the series I posted yesterday.
Particularly patches 16 and 18.

Thanks,
Ranjani
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> > ---
> >   sound/soc/sof/pcm.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> > index 1661b0bc6f12..71f5bce0c4c7 100644
> > --- a/sound/soc/sof/pcm.c
> > +++ b/sound/soc/sof/pcm.c
> > @@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct
> > snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
> >   	struct snd_sof_dai *dai =
> >   		snd_sof_find_dai(component, (char *)rtd->dai_link-
> > >name);
> >   	struct snd_sof_dev *sdev =
> > snd_soc_component_get_drvdata(component);
> > -	struct sof_dai_private_data *private = dai->private;
> > +	struct sof_dai_private_data *private;
> >   	struct snd_soc_dpcm *dpcm;
> >   
> >   	/* no topology exists for this BE, try a common configuration
> > */
> > @@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct
> > snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
> >   	/* read format from topology */
> >   	snd_mask_none(fmt);
> >   
> > +	private = dai->private;
> >   	switch (private->comp_dai->config.frame_fmt) {
> >   	case SOF_IPC_FRAME_S16_LE:
> >   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

