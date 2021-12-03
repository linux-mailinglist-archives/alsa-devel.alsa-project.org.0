Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D854E4678FF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 15:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73BE12323;
	Fri,  3 Dec 2021 15:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73BE12323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638540135;
	bh=5ddn9zBNNWjI8juaZfnce832AO6dCHniEivkDkoAbYw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg+5/LBxgQnYIAX3hX8gWm2qqR9hLS7WnYPoJ14WtE6/1dhoy00noJ5+09TAsHade
	 H5bYWZw6v7OJkfeBZNdFs4KWoQHcG/ojXByVAhbpzUztmFTd2t61pipwcOnJ3pAPNS
	 N158TEDp+PhgvLRtXvAvvBXjYt6nApy2VFGtxPok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0EF6F800A7;
	Fri,  3 Dec 2021 15:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB8E0F80246; Fri,  3 Dec 2021 15:00:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55131F800D3
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 15:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55131F800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="323229575"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="323229575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:00:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="561726932"
Received: from hkagda-mobl2.amr.corp.intel.com (HELO [10.212.71.79])
 ([10.212.71.79])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:00:40 -0800
Subject: Re: [linux-next:master 3956/5128]
 sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier
 'CODEC_PROBE_RETRIES'
To: kernel test robot <lkp@intel.com>, Hui Wang <hui.wang@canonical.com>
References: <202112031943.Twg19fWT-lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
Date: Fri, 3 Dec 2021 08:00:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <202112031943.Twg19fWT-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, llvm@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

[adding alsa-devel]

On 12/3/21 5:25 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
> commit: 046aede2f847676f93a2ea4f48b77909c51dba40 [3956/5128] ASoC: SOF: Intel: Retry codec probing if it fails
> config: i386-randconfig-r033-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031943.Twg19fWT-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=046aede2f847676f93a2ea4f48b77909c51dba40
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 046aede2f847676f93a2ea4f48b77909c51dba40
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier 'CODEC_PROBE_RETRIES'
>            } while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
>                                             ^
>    1 error generated.
> 
> 
> vim +/CODEC_PROBE_RETRIES +132 sound/soc/sof/intel/hda-codec.c
> 
>    110	
>    111	/* probe individual codec */
>    112	static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
>    113				   bool hda_codec_use_common_hdmi)
>    114	{
>    115	#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>    116		struct hdac_hda_priv *hda_priv;
>    117		struct hda_codec *codec;
>    118		int type = HDA_DEV_LEGACY;
>    119	#endif
>    120		struct hda_bus *hbus = sof_to_hbus(sdev);
>    121		struct hdac_device *hdev;
>    122		u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
>    123			(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
>    124		u32 resp = -1;
>    125		int ret, retry = 0;
>    126	
>    127		do {
>    128			mutex_lock(&hbus->core.cmd_mutex);
>    129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
>    130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
>    131			mutex_unlock(&hbus->core.cmd_mutex);
>  > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);

Indeed, something's not right here.

CODEC_PROBE_RETRIES is defined conditionally

#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
#define IDISP_VID_INTEL	0x80860000
#define CODEC_PROBE_RETRIES 3

but it's used unconditionally.

We could define this constant unconditionally as a quick fix, but this
compilation problem might expose a larger problem.

Kai, I wonder if this is code from lines 120 to 139 that we didn't
update when we moved to support HDMI with the generic HDaudio parts? I
don't see why we could even try to send a command on the bus is there's
no audio codec support?

hda_codec_use_common_hdmi should be the default assumption now, I don't
think we support the old solution, do we?

>    133	
>    134		if (resp == -1)
>    135			return -EIO;
>    136		dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",
>    137			address, resp);
>    138	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
