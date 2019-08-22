Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53903997D2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 17:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72F1165D;
	Thu, 22 Aug 2019 17:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72F1165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566486828;
	bh=vpiy7ZLIQQWaBTWNSUwwbiHkd8nTJiTIesavexzsxjY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZ/2Ahp2XMn20EXlpwiughrK3FfexJ285/wn/R8m1XVaEA2Tp5ChgI/0TMjQkShG0
	 HL8gfBZV3NttUJ4y5mhxjJtL6I/m3e4vFfkslMlfeEUUGVn0hfAGkADlYaULVwM3uF
	 7VNCnd3nsdfBCHsVBaLp/BPSpFr8zeVGEuGLJ5+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03096F800BF;
	Thu, 22 Aug 2019 17:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D5FF804CB; Thu, 22 Aug 2019 17:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E168DF80391
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 17:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E168DF80391
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="169810435"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.36.176])
 by orsmga007.jf.intel.com with ESMTP; 22 Aug 2019 08:11:19 -0700
Date: Thu, 22 Aug 2019 17:11:18 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190822151117.GA1200@ubuntu>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
 <20190822071835.GA30262@ubuntu>
 <f73796d6-fcfa-97c8-69ae-0a183edbbd97@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f73796d6-fcfa-97c8-69ae-0a183edbbd97@linux.intel.com>
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

On Thu, Aug 22, 2019 at 08:53:06AM -0500, Pierre-Louis Bossart wrote:
> Thanks for the review Guennadi
> 
> > > +static int sdw_config_stream(void *arg, void *s, void *dai,
> > > +			     void *params, int link_id, int alh_stream_id)
> > 
> > I realise, that these function prototypes aren't being introduced by these
> > patches, but just wondering whether such overly generic prototype is really
> > a good idea here, whether some of those "void *" pointers could be given
> > real types. The first one could be "struct device *" etc.
> 
> In this case the 'arg' parameter is actually a private 'struct snd_sof_dev',
> as shown below [1]. We probably want to keep this relatively opaque, this is
> a context that doesn't need to be exposed to the SoundWire code.

Right, that's why I proposed struct device and not struct snd_sof_dev, to not 
make it SOF-specific, then sdev could be obtained from dev_get_drvdata(). But 
yes, that's unrelated to this series.

Thanks
Guennadi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
