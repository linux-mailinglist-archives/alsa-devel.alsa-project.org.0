Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720E241C1F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 16:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7DF1666;
	Tue, 11 Aug 2020 16:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7DF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597155074;
	bh=ekesTpgDpsPvwA6jZxyjvpL202+vFAsnhVMGhNaFxwE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apaCfmcetgjaNgDHvOPJU214o/qioAs8o98SS0TvELJGfzusjV/uju0Yi6UAMEh0C
	 g9sOrnq0e4d7d/yYJYoR7Z+JeLTuof+Y6ixDh8Fi7rrd9fLaIDPVLAB0BaUqPZDP6w
	 Mm6PkU8MjGCNsQqkK2qUQIOUfRAJeNrcXdVfMhCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB262F8015B;
	Tue, 11 Aug 2020 16:09:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3726AF8015B; Tue, 11 Aug 2020 16:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_14,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 214C6F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 16:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214C6F800D3
IronPort-SDR: N2AApY8vNhnTEFVtbkY+mMEltRkCcwS7HH1ajnzNKwQhr9p8mE2n85gBHs5G7GWwKGGGm56aK3
 6tlsUxy0d96w==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="215253370"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="215253370"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 07:09:15 -0700
IronPort-SDR: dH7bNnKBarAbaeZ19FrexbaorSSMaXeo4EwCrAQTNKzbVTVHqWz5KSKkOG3RgMom+wUFXMViPt
 axsDJXz/umZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="317735772"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.31.191])
 ([10.213.31.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 07:09:12 -0700
Subject: Re: [PATCH v2 09/13] ASoC: Intel: Select catpt and deprecate haswell
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 kernel test robot <lkp@intel.com>
References: <20200811100034.6875-10-cezary.rojewski@intel.com>
 <202008112152.WcqIiwSM%lkp@intel.com>
 <20200811133816.GD1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <673b2bdd-a8f1-6d1d-abb1-88c5589b82f8@intel.com>
Date: Tue, 11 Aug 2020 16:09:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811133816.GD1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 tiwai@suse.com
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

On 2020-08-11 3:38 PM, Andy Shevchenko wrote:
> On Tue, Aug 11, 2020 at 09:08:43PM +0800, kernel test robot wrote:
>> Hi Cezary,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on asoc/for-next]
>> [also build test WARNING on sound/for-next v5.8 next-20200811]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Cezary-Rojewski/ASoC-Intel-Catpt-Lynx-and-Wildcat-point/20200811-181319
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>> config: i386-allyesconfig (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce (this is a W=1 build):
>>          # save the attached .config to linux build tree
>>          make W=1 ARCH=i386
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
> 
> To fix all these, please use %pR or %pr (I believe you want former rather than
> latter).
> 

Thanks for the advice!

I'd like to keep format cohesive with the rest, though:
	restoring <type of context>: off 0x%08x size %d\n

%pr yields:

    82.914316] snd_soc_catpt:catpt_restore_fwimage: catpt_adsp 
INT3438:00: restoring fwimage: [io  0x86470-0x86bbf flags 
0xffffffffb2a27bf0]

Casting to (unsigned long long) should be fine, judging by 
/kernel/resource.c, yes?

Czarek
