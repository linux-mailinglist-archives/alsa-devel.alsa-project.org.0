Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB0C409F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 21:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCDE1672;
	Tue,  1 Oct 2019 21:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCDE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569956801;
	bh=4XJH7OePBBjx2d4htYJ/7YyvM7+dpK6iCxKnMrzWG0A=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZvLVgabteS4HWfWpMXle9JO9ahYdOeue2fVvA1I02MJJOz3aYiLevUMaDBajWAkNG
	 4i+2n8Z+XbVlKFA4Z50tI+C0xgLhkofmr4EuJ1ck46HnDu3rThL7hJJFMBju2HADNp
	 560YudU/215GLSDukuJiqcSHXIWKCDMNYTYfLwgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDFBF80518;
	Tue,  1 Oct 2019 21:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503A2F800D0; Tue,  1 Oct 2019 21:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E0AF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 21:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E0AF800D0
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 12:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="343079120"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 01 Oct 2019 12:04:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iFNS2-000Aqk-En; Wed, 02 Oct 2019 03:04:46 +0800
Date: Wed, 2 Oct 2019 03:03:55 +0800
From: kbuild test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <201910020353.7D2cFhJq%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.5 2/32] sound/soc/fsl/fsl_mqs.c:182:38:
 sparse: sparse: Using plain integer as NULL pointer
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5
head:   1a476abc723e644248dba975b71122fcf878703b
commit: 9e28f6532c611c0c3fa759d2101aba9f0d41e860 [2/32] ASoC: fsl_mqs: Add MQS component driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-37-gd466a02-dirty
        git checkout 9e28f6532c611c0c3fa759d2101aba9f0d41e860
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/fsl/fsl_mqs.c:182:38: sparse: sparse: Using plain integer as NULL pointer

vim +182 sound/soc/fsl/fsl_mqs.c

   178	
   179	static int fsl_mqs_probe(struct platform_device *pdev)
   180	{
   181		struct device_node *np = pdev->dev.of_node;
 > 182		struct device_node *gpr_np = 0;
   183		struct fsl_mqs *mqs_priv;
   184		void __iomem *regs;
   185		int ret = 0;
   186	
   187		mqs_priv = devm_kzalloc(&pdev->dev, sizeof(*mqs_priv), GFP_KERNEL);
   188		if (!mqs_priv)
   189			return -ENOMEM;
   190	
   191		/* On i.MX6sx the MQS control register is in GPR domain
   192		 * But in i.MX8QM/i.MX8QXP the control register is moved
   193		 * to its own domain.
   194		 */
   195		if (of_device_is_compatible(np, "fsl,imx8qm-mqs"))
   196			mqs_priv->use_gpr = false;
   197		else
   198			mqs_priv->use_gpr = true;
   199	
   200		if (mqs_priv->use_gpr) {
   201			gpr_np = of_parse_phandle(np, "gpr", 0);
   202			if (IS_ERR(gpr_np)) {
   203				dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
   204				ret = PTR_ERR(gpr_np);
   205				goto out;
   206			}
   207	
   208			mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
   209			if (IS_ERR(mqs_priv->regmap)) {
   210				dev_err(&pdev->dev, "failed to get gpr regmap\n");
   211				ret = PTR_ERR(mqs_priv->regmap);
   212				goto out;
   213			}
   214		} else {
   215			regs = devm_platform_ioremap_resource(pdev, 0);
   216			if (IS_ERR(regs))
   217				return PTR_ERR(regs);
   218	
   219			mqs_priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
   220								     "core",
   221								     regs,
   222								     &fsl_mqs_regmap_config);
   223			if (IS_ERR(mqs_priv->regmap)) {
   224				dev_err(&pdev->dev, "failed to init regmap: %ld\n",
   225					PTR_ERR(mqs_priv->regmap));
   226				return PTR_ERR(mqs_priv->regmap);
   227			}
   228	
   229			mqs_priv->ipg = devm_clk_get(&pdev->dev, "core");
   230			if (IS_ERR(mqs_priv->ipg)) {
   231				dev_err(&pdev->dev, "failed to get the clock: %ld\n",
   232					PTR_ERR(mqs_priv->ipg));
   233				goto out;
   234			}
   235		}
   236	
   237		mqs_priv->mclk = devm_clk_get(&pdev->dev, "mclk");
   238		if (IS_ERR(mqs_priv->mclk)) {
   239			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
   240				PTR_ERR(mqs_priv->mclk));
   241			goto out;
   242		}
   243	
   244		dev_set_drvdata(&pdev->dev, mqs_priv);
   245		pm_runtime_enable(&pdev->dev);
   246	
   247		return devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
   248				&fsl_mqs_dai, 1);
   249	out:
   250		if (!IS_ERR(gpr_np))
   251			of_node_put(gpr_np);
   252	
   253		return ret;
   254	}
   255	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
