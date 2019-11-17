Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C2FF8D7
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 12:07:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758371688;
	Sun, 17 Nov 2019 12:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758371688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573988823;
	bh=e3psQObxlroY4chAvmigi1BL7uXhREjp8renb7/G3OE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kK7SE+X9n9JAJipsVroeFZtmsnOBK5R3mR/okMmxWRymYeoROsvg9LpHBc4P8tyx2
	 ykCFNUJeRAZL8rPnUuf/oYxL4a7+wlPHHyKjRZtnxFTvbua2DNViiKXkt2JOdGRWQm
	 Z0HoolX79b96jjtCOzFraZwJaXGkzpf7rtCqBCz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D602FF80131;
	Sun, 17 Nov 2019 12:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FC0F80131; Sun, 17 Nov 2019 12:05:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_HELO_NONE,SPF_NEUTRAL,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4958AF800E6
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 12:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4958AF800E6
X-IronPort-AV: E=Sophos;i="5.68,316,1569276000"; d="scan'208";a="327005211"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2019 12:05:12 +0100
Date: Sun, 17 Nov 2019 12:05:12 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <alpine.DEB.2.21.1911171203580.2641@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>, kbuild-all@lists.01.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sanju R Mehta <sanju.mehta@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [RESEND PATCH v5 2/6] ASoC: amd: Refactoring of
 DAI from DMA driver (fwd)
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

This code needs some work.  You can't just kfree every pointer.  YOu have
to consider how the pointer was initialized.

julia

---------- Forwarded message ----------
Date: Sun, 17 Nov 2019 12:48:14 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@lists.01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [alsa-devel] [RESEND PATCH v5 2/6] ASoC: amd: Refactoring of DAI
    from DMA driver

CC: kbuild-all@lists.01.org
In-Reply-To: <1573629249-13272-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573629249-13272-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
CC:

Hi Ravulapati,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[cannot apply to v5.4-rc7 next-20191115]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ravulapati-Vishnu-vardhan-rao/ASoC-amd-Create-multiple-I2S-platform-device-Endpoint/20191113-230604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> sound/soc/amd/raven/acp3x-i2s.c:245:1-6: WARNING: invalid free of devm_ allocated data
   sound/soc/amd/raven/acp3x-i2s.c:248:1-6: WARNING: invalid free of devm_ allocated data
   sound/soc/amd/raven/acp3x-i2s.c:249:1-6: WARNING: invalid free of devm_ allocated data

# https://github.com/0day-ci/linux/commit/74480eceed0f95f0b8d383d0882b918a335ce0d4
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 74480eceed0f95f0b8d383d0882b918a335ce0d4
vim +245 sound/soc/amd/raven/acp3x-i2s.c

74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  207
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  208
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  209  static int acp3x_dai_probe(struct platform_device *pdev)
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  210  {
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  211  	int status;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  212  	struct resource *res;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  213  	struct i2s_dev_data *adata;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  214
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  215  	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  216  			GFP_KERNEL);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  217  	if (!adata)
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  218  		return -ENOMEM;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  219
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  220  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  221  	if (!res) {
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  222  		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  223  		goto err;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  224  	}
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  225
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  226  	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  227  			resource_size(res));
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  228  	if (IS_ERR(adata->acp3x_base))
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  229  		return PTR_ERR(adata->acp3x_base);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  230
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  231  	adata->i2s_irq = res->start;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  232  	dev_set_drvdata(&pdev->dev, adata);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  233  	status = devm_snd_soc_register_component(&pdev->dev,
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  234  			&acp3x_dai_component,
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  235  			&acp3x_i2s_dai, 1);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  236  	if (status) {
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  237  		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  238  		goto dev_err;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  239  	}
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  240  	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  241  	pm_runtime_use_autosuspend(&pdev->dev);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  242  	pm_runtime_enable(&pdev->dev);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  243  	return 0;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  244  err:
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13 @245  	kfree(adata);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  246  	return -ENOMEM;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  247  dev_err:
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  248  	kfree(adata->acp3x_base);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  249  	kfree(adata);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  250  	kfree(res);
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  251  	return -ENODEV;
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  252  }
74480eceed0f95 Ravulapati Vishnu vardhan rao 2019-11-13  253

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
