Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E11C725F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 16:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A3D176F;
	Wed,  6 May 2020 16:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A3D176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588773714;
	bh=SaTRJmncX82wFSMrqphyE078f2w5q3BVMnYuWCNrrVc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rMFkJ1NhsXku8cGry66oq2e7XFhQ9U4YTQd88NaE8QhvToOdyL73uMljhdVfww+uH
	 DYUpYdSc4NvOGPhGfzZ3RA2oiTjPi0wXr9zkqnvr1yKjlJrbcQdCBIQGrCSpYgvtSO
	 NRRNULJY1C/C4e7ua4qvsmLL6gS+ytKH7k2hWO0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DF0F80253;
	Wed,  6 May 2020 16:00:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D55F80249; Wed,  6 May 2020 16:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id A9B59F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 15:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B59F800DE
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5eb2c0061b9-275fb;
 Wed, 06 May 2020 21:47:50 +0800 (CST)
X-RM-TRANSID: 2eec5eb2c0061b9-275fb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.0.101] (unknown[112.0.146.193])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75eb2c004224-cf21d;
 Wed, 06 May 2020 21:47:50 +0800 (CST)
X-RM-TRANSID: 2ee75eb2c004224-cf21d
Subject: Re: [PATCH] ASoC: qcom: Use devm_platform_ioremap_resource_byname()to
 simplify code
To: kbuild test robot <lkp@intel.com>, broonie@kernel.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, perex@perex.cz,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20200504072820.5328-1-tangbin@cmss.chinamobile.com>
 <202005051301.uK51h1pS%lkp@intel.com>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <4b2fba97-6f04-622c-f69a-ba00de19335d@cmss.chinamobile.com>
Date: Wed, 6 May 2020 21:48:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <202005051301.uK51h1pS%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: kbuild-all@lists.01.org
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


On 2020/5/5 13:35, kbuild test robot wrote:
> Hi Tang,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on asoc/for-next]
> [also build test ERROR on v5.7-rc4 next-20200504]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Tang-Bin/ASoC-qcom-Use-devm_platform_ioremap_resource_byname-to-simplify-code/20200505-051041
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     sound/soc/qcom/lpass-cpu.c: In function 'asoc_qcom_lpass_cpu_platform_probe':
>>> sound/soc/qcom/lpass-cpu.c:445:21: error: expected ';' before 'if'

Sorry, please forget this patch, it's my fault.

Thanks



