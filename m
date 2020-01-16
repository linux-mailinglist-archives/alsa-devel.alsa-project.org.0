Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325613D52A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 08:44:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E4217AC;
	Thu, 16 Jan 2020 08:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E4217AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579160651;
	bh=JQtSwJK20PRWUMkyyzRdfK/0GY3xcBsmTwJEze1JP3w=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GU3AdO+7Hp8Mjsn6bEhMFRK+DSrpDxcifSHQmiLaV2SnprNlXR01MCANO6EYTjdFn
	 55KnJKJ0H6EvhcT3n+Vunt2o+iyWCFWNeRf3RgyrTFgKN8V4DCYaMfyPDseWowfPPF
	 sxmlV+FYdF8aB8JCwIAoIi72QcBNe+MOyfBf0KMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B94F800E9;
	Thu, 16 Jan 2020 08:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA4A4F8014D; Thu, 16 Jan 2020 08:42:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFAECF800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 08:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFAECF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 23:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,325,1574150400"; d="scan'208";a="220284799"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jan 2020 23:42:13 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Jan 2020 23:42:13 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 16 Jan 2020 15:42:11 +0800
Received: from shsmsx606.ccr.corp.intel.com ([10.109.6.216]) by
 SHSMSX606.ccr.corp.intel.com ([10.109.6.216]) with mapi id 15.01.1713.004;
 Thu, 16 Jan 2020 15:42:11 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bard liao
 <yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "tiwai@suse.de" <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH RFC v2 4/4] ASoC: add warning if the
 function is not support multi cpu yet.
Thread-Index: AQHVy2dpxOHJKgYqGUCNkHm4lITLIqfsAZYAgADhYqA=
Date: Thu, 16 Jan 2020 07:42:11 +0000
Message-ID: <0dbffd0c1b904a1eb57045ff3b5e40b2@intel.com>
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
 <20200114175152.3291-5-yung-chuan.liao@linux.intel.com>
 <35fbbfcf-8741-ac4c-56b1-2fd7e19e1a7d@linux.intel.com>
In-Reply-To: <35fbbfcf-8741-ac4c-56b1-2fd7e19e1a7d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH RFC v2 4/4] ASoC: add warning if the
 function is not support multi cpu yet.
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



> -----Original Message-----
> From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
> Sent: Thursday, January 16, 2020 9:50 AM
> To: Bard liao <yung-chuan.liao@linux.intel.com>; broonie@kernel.org;
> tiwai@suse.de
> Cc: liam.r.girdwood@linux.intel.com; alsa-devel@alsa-project.org; Liao, Bard
> <bard.liao@intel.com>; kuninori.morimoto.gx@renesas.com
> Subject: Re: [alsa-devel] [PATCH RFC v2 4/4] ASoC: add warning if the function is
> not support multi cpu yet.
> 
> 
> 
> On 1/14/20 11:51 AM, Bard liao wrote:
> > Multi cpu is not supported by all functions yet. Add a warning message
> > to warn it.
> 
> Shouldn't we be consistent and return an error when we have an unexpected
> number of cpu dais? see below
> 
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
> > ---
> >   sound/soc/soc-compress.c              |  7 ++++---
> >   sound/soc/soc-generic-dmaengine-pcm.c | 12 ++++++++++++
> >   sound/soc/soc-pcm.c                   | 12 ++++++++++++
> >   3 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c index
> > 223cd045719e..bf9d6a21bcd9 100644
> > --- a/sound/soc/soc-compress.c
> > +++ b/sound/soc/soc-compress.c
> > @@ -810,10 +810,11 @@ int snd_soc_new_compress(struct
> snd_soc_pcm_runtime *rtd, int num)
> >   	int playback = 0, capture = 0;
> >   	int i;
> >
> > -	if (rtd->num_codecs > 1) {
> > +	if (rtd->num_cpus > 1 ||
> > +	    rtd->num_codecs) {
> >   		dev_err(rtd->card->dev,
> > -			"Compress ASoC: Multicodec not supported\n");
> > -		return -EINVAL;
> > +			"Compress ASoC: Multi CPU/Codec not supported\n");
> > +		return -ENOTSUPP;
> 
> so this is an error...

Changing to -ENOTSUPP will prevent below to return error in
soc_init_pcm_runtime().

/* create compress_device if possible */
ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
if (ret != -ENOTSUPP) {
	if (ret < 0)
		dev_err(card->dev, "ASoC: can't create compress %s\n",
			dai_link->stream_name);
	return ret;
}

So it is to prevent an error actually. But I agree it is better to return
an error when we have an unexpected number of cpu dais. What do you
think? @Morimoto-san

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
