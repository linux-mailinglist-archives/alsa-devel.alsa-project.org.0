Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5A563839
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 18:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ABDD16A1;
	Fri,  1 Jul 2022 18:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ABDD16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656693818;
	bh=0TTrT9s9ITdYlJGMBjNUbP7S3GztVzZAj04vdzyeDGk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smjA5ABMEERJgWI0yhHr7gVU1Gdb9135Vb91WOd8e0m2VG1COwSmZp36J3RtjVGYs
	 iWjJWSZnyCcRSO57/KgwmS7rB4qR7cvzpJ4vBmQZZi35w+QDrfLAF74KkieSXq5/zq
	 na3GAoKQ79NnJTDc1n405P0mD5TyguXI+Eg8Qm+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B7FCF80256;
	Fri,  1 Jul 2022 18:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA72FF80155; Fri,  1 Jul 2022 18:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C0BF80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 18:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C0BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MJ7W7760"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656693754; x=1688229754;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0TTrT9s9ITdYlJGMBjNUbP7S3GztVzZAj04vdzyeDGk=;
 b=MJ7W7760XH2DPE7HWOSfkF1nMK7RRLFyWbbBmvQkActLfdOPL9yOjLYt
 6MDCBYEQ88Ox4pCIkkENMm3Ir5f1isFa4CEru7hzLcXCIIF2EJGuSp8zD
 A6YzjHGwy31CLIpWxYxkbWkumutHaQ2l8sDdIghARj281SvPsuiZehEbb
 au8I5KCWDbTKrpYMZ6pQFgqH5NsyryJ3SmKcnXL37b4N/KjX+GayuyJNa
 46gWOQtaC3KSZD2YTSTb5qAzYs/OfvJGUu+l01ScrbyhbdVy831yZEPn+
 R0gjK+UpEwlanb95fyXEt12+lw/ELXgW9aZB8hxZi7jhL9qxoVgrt7jO+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="262490245"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="262490245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 09:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="541792302"
Received: from swathigo-mobl3.amr.corp.intel.com (HELO [10.209.128.76])
 ([10.209.128.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 09:42:27 -0700
Message-ID: <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
Date: Fri, 1 Jul 2022 11:42:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Content-Language: en-US
To: Alex Natalsson <harmoniesworlds@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 7/1/22 10:47, Alex Natalsson wrote:
>> Wow. So there's already a problem with a config and we made it worse...
>>
>> Can you try with this hack attached, just to see what causes the kernel
>> oops?  Thanks!
> 
> Hello friends)
> I modified your hack a little. And I don't understanding what is fe
> and be, but I see what problem apearing due to be_substream points to
> 0.
> The
> "if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {"
> at result gives the error...
> 
> * I am sorry what delete recipients in the previous send((

Interesting, thanks for the test results!

[  108.090732] dpcm_be_connect: start

[  108.090734] dpcm_be_connect: 1

[  108.090735] dpcm_be_connect: 3

[  108.090737] dpcm_be_connect: 3.1

[  108.090738] dpcm_be_connect: 3.1 fe_substream_addr=128378368

[  108.090740] dpcm_be_connect: 3.1 be_substream_addr=0

[  108.090750] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000

Indeed it looks like we are de-referencing a NULL pointer, be_substream
isn't initialized.

we could add a simple error check as in the diff below but I don't know
what the root cause might be

	
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c

index a827cc3c158a..093b98b0e394 100644

--- a/sound/soc/soc-pcm.c

+++ b/sound/soc/soc-pcm.c

@@ -1203,6 +1203,15 @@ static int dpcm_be_connect(struct
snd_soc_pcm_runtime *fe,

        fe_substream = snd_soc_dpcm_get_substream(fe, stream);

        be_substream = snd_soc_dpcm_get_substream(be, stream);



+       if (!fe_substream) {

+               dev_err(fe->dev, "%s: fe_substream not initialized\n",
__func__);

+               return -EINVAL;

+       }

+       if (!be_substream) {

+               dev_err(be->dev, "%s: be_substream not initialized\n",
__func__);

+               return -EINVAL;

+       }

+

        if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {

                dev_err(be->dev, "%s: FE is atomic but BE is nonatomic,
invalid configuration\n",

                        __func__);

