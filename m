Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F88571183
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 06:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E9D84B;
	Tue, 12 Jul 2022 06:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E9D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657600815;
	bh=ttzE7f1z5ER8rcGUqJWmpuI2NX4FaiLMw7lS4gyIJdY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCW4LPoBQGRpS1ndg1cQLR0SBLVUmqdPWBvpHGmb0PwA80BHdaJ+pBGBKkQH+ADqZ
	 3NCRyleSjqTqsRaSL/mSqWQenAFWu8/nvDEOby9eAMks3HY2FZ2VL3H/W0R5d0VNHf
	 stZulWDZ0/Kiqo3RRQ+RPomm4Wh4aNopgZ8BY2Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC67F80279;
	Tue, 12 Jul 2022 06:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDDEFF80246; Tue, 12 Jul 2022 06:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78418F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 06:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78418F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="biEs2MXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657600746; x=1689136746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ttzE7f1z5ER8rcGUqJWmpuI2NX4FaiLMw7lS4gyIJdY=;
 b=biEs2MXBM/hJkG1YUkOUAQHZWWcNgfuGMa1CM+TLZjiywqQbqhgfXfyb
 vc9k9+wY1e0+WhFxhG4M0SP/z7s3oGdi2k2JPnFTfCPssQMIch0bE3beu
 zp+dOUrpePx76DzFYQvCK6boEdqIqzQYU2o65rxRDlqMYBMrObArr8olf
 N3qiL/gO3wAu5h512ZIgEYUD5izOYbpKJDYd/tPXlSQ5mG7YbsDxO1P75
 d4CMwBEcicoAKgbjwAi/s4+YntSrDcxXnO8K36XoKP562f66jujTdLaiN
 J9adYMQjeWwhJHo6nd+aPRzf4hLavXB2cPxpzCcMjJ4AdUvKXsoCFajb7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282387767"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="282387767"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 21:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="662810503"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2022 21:38:57 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oB7fk-0001gm-MT;
 Tue, 12 Jul 2022 04:38:56 +0000
Date: Tue, 12 Jul 2022 12:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/4] ALSA: hda: cs35l41: Allow compilation test on
 non-ACPI configurations
Message-ID: <202207121250.pG2NiH2y-lkp@intel.com>
References: <20220711095219.36915-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711095219.36915-2-andriy.shevchenko@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, kbuild-all@lists.01.org,
 James Schulman <james.schulman@cirrus.com>
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

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on linus/master v5.19-rc6 next-20220711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ALSA-hda-cs35l41-Improve-dev_err_probe-messaging/20220711-175606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220712/202207121250.pG2NiH2y-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1822f133c760384365a12621de82e3a96e061ecf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/ALSA-hda-cs35l41-Improve-dev_err_probe-messaging/20220711-175606
        git checkout 1822f133c760384365a12621de82e3a96e061ecf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/pci/hda/cs35l41_hda.c: In function 'cs35l41_hda_read_acpi':
>> sound/pci/hda/cs35l41_hda.c:350:59: error: invalid use of undefined type 'struct acpi_device'
     350 |         cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
         |                                                           ^~


vim +350 sound/pci/hda/cs35l41_hda.c

7b2f3eb492dac76 Lucas Tanure   2021-12-17  299  
f7f207375d4e6eb Lucas Tanure   2022-04-13  300  static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  301  {
f7f207375d4e6eb Lucas Tanure   2022-04-13  302  	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  303  	u32 values[HDA_MAX_COMPONENTS];
7b2f3eb492dac76 Lucas Tanure   2021-12-17  304  	struct acpi_device *adev;
8c286a0f973a812 Lucas Tanure   2022-01-17  305  	struct device *physdev;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  306  	char *property;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  307  	size_t nval;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  308  	int i, ret;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  309  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  310  	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  311  	if (!adev) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  312  		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
f7f207375d4e6eb Lucas Tanure   2022-04-13  313  		return -ENODEV;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  314  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  315  
8c286a0f973a812 Lucas Tanure   2022-01-17  316  	physdev = get_device(acpi_get_first_physical_node(adev));
7b2f3eb492dac76 Lucas Tanure   2021-12-17  317  	acpi_dev_put(adev);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  318  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  319  	property = "cirrus,dev-index";
8c286a0f973a812 Lucas Tanure   2022-01-17  320  	ret = device_property_count_u32(physdev, property);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  321  	if (ret <= 0)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  322  		goto no_acpi_dsd;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  323  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  324  	if (ret > ARRAY_SIZE(values)) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  325  		ret = -EINVAL;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  326  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  327  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  328  	nval = ret;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  329  
8c286a0f973a812 Lucas Tanure   2022-01-17  330  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  331  	if (ret)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  332  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  333  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  334  	cs35l41->index = -1;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  335  	for (i = 0; i < nval; i++) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  336  		if (values[i] == id) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  337  			cs35l41->index = i;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  338  			break;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  339  		}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  340  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  341  	if (cs35l41->index == -1) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  342  		dev_err(cs35l41->dev, "No index found in %s\n", property);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  343  		ret = -ENODEV;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  344  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  345  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  346  
8c286a0f973a812 Lucas Tanure   2022-01-17  347  	/* To use the same release code for all laptop variants we can't use devm_ version of
8c286a0f973a812 Lucas Tanure   2022-01-17  348  	 * gpiod_get here, as CLSA010* don't have a fully functional bios with an _DSD node
8c286a0f973a812 Lucas Tanure   2022-01-17  349  	 */
7b2f3eb492dac76 Lucas Tanure   2021-12-17 @350  	cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
7b2f3eb492dac76 Lucas Tanure   2021-12-17  351  						     GPIOD_OUT_LOW, "cs35l41-reset");
7b2f3eb492dac76 Lucas Tanure   2021-12-17  352  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  353  	property = "cirrus,speaker-position";
8c286a0f973a812 Lucas Tanure   2022-01-17  354  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  355  	if (ret)
f7f207375d4e6eb Lucas Tanure   2022-04-13  356  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  357  	hw_cfg->spk_pos = values[cs35l41->index];
7b2f3eb492dac76 Lucas Tanure   2021-12-17  358  
00f87ec74c3c096 Stefan Binding 2022-05-09  359  	cs35l41->channel_index = 0;
00f87ec74c3c096 Stefan Binding 2022-05-09  360  	for (i = 0; i < cs35l41->index; i++)
00f87ec74c3c096 Stefan Binding 2022-05-09  361  		if (values[i] == hw_cfg->spk_pos)
00f87ec74c3c096 Stefan Binding 2022-05-09  362  			cs35l41->channel_index++;
00f87ec74c3c096 Stefan Binding 2022-05-09  363  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  364  	property = "cirrus,gpio1-func";
8c286a0f973a812 Lucas Tanure   2022-01-17  365  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  366  	if (ret)
f7f207375d4e6eb Lucas Tanure   2022-04-13  367  		goto err;
f7f207375d4e6eb Lucas Tanure   2022-04-13  368  	hw_cfg->gpio1.func = values[cs35l41->index];
2603c974b45dbfe Lucas Tanure   2022-04-13  369  	hw_cfg->gpio1.valid = true;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  370  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  371  	property = "cirrus,gpio2-func";
8c286a0f973a812 Lucas Tanure   2022-01-17  372  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  373  	if (ret)
f7f207375d4e6eb Lucas Tanure   2022-04-13  374  		goto err;
f7f207375d4e6eb Lucas Tanure   2022-04-13  375  	hw_cfg->gpio2.func = values[cs35l41->index];
2603c974b45dbfe Lucas Tanure   2022-04-13  376  	hw_cfg->gpio2.valid = true;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  377  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  378  	property = "cirrus,boost-peak-milliamp";
8c286a0f973a812 Lucas Tanure   2022-01-17  379  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  380  	if (ret == 0)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  381  		hw_cfg->bst_ipk = values[cs35l41->index];
2603c974b45dbfe Lucas Tanure   2022-04-13  382  	else
2603c974b45dbfe Lucas Tanure   2022-04-13  383  		hw_cfg->bst_ipk = -1;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  384  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  385  	property = "cirrus,boost-ind-nanohenry";
8c286a0f973a812 Lucas Tanure   2022-01-17  386  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  387  	if (ret == 0)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  388  		hw_cfg->bst_ind = values[cs35l41->index];
2603c974b45dbfe Lucas Tanure   2022-04-13  389  	else
2603c974b45dbfe Lucas Tanure   2022-04-13  390  		hw_cfg->bst_ind = -1;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  391  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  392  	property = "cirrus,boost-cap-microfarad";
8c286a0f973a812 Lucas Tanure   2022-01-17  393  	ret = device_property_read_u32_array(physdev, property, values, nval);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  394  	if (ret == 0)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  395  		hw_cfg->bst_cap = values[cs35l41->index];
2603c974b45dbfe Lucas Tanure   2022-04-13  396  	else
2603c974b45dbfe Lucas Tanure   2022-04-13  397  		hw_cfg->bst_cap = -1;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  398  
b8388a1aba32bef Lucas Tanure   2022-04-13  399  	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
b8388a1aba32bef Lucas Tanure   2022-04-13  400  		hw_cfg->bst_type = CS35L41_INT_BOOST;
b8388a1aba32bef Lucas Tanure   2022-04-13  401  	else
b8388a1aba32bef Lucas Tanure   2022-04-13  402  		hw_cfg->bst_type = CS35L41_EXT_BOOST;
b8388a1aba32bef Lucas Tanure   2022-04-13  403  
2603c974b45dbfe Lucas Tanure   2022-04-13  404  	hw_cfg->valid = true;
8c286a0f973a812 Lucas Tanure   2022-01-17  405  	put_device(physdev);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  406  
f7f207375d4e6eb Lucas Tanure   2022-04-13  407  	return 0;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  408  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  409  err:
8c286a0f973a812 Lucas Tanure   2022-01-17  410  	put_device(physdev);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  411  	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  412  
f7f207375d4e6eb Lucas Tanure   2022-04-13  413  	return ret;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  414  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  415  no_acpi_dsd:
7b2f3eb492dac76 Lucas Tanure   2021-12-17  416  	/*
7b2f3eb492dac76 Lucas Tanure   2021-12-17  417  	 * Device CLSA0100 doesn't have _DSD so a gpiod_get by the label reset won't work.
7b2f3eb492dac76 Lucas Tanure   2021-12-17  418  	 * And devices created by i2c-multi-instantiate don't have their device struct pointing to
8c286a0f973a812 Lucas Tanure   2022-01-17  419  	 * the correct fwnode, so acpi_dev must be used here.
7b2f3eb492dac76 Lucas Tanure   2021-12-17  420  	 * And devm functions expect that the device requesting the resource has the correct
8c286a0f973a812 Lucas Tanure   2022-01-17  421  	 * fwnode.
7b2f3eb492dac76 Lucas Tanure   2021-12-17  422  	 */
7b2f3eb492dac76 Lucas Tanure   2021-12-17  423  	if (strncmp(hid, "CLSA0100", 8) != 0)
f7f207375d4e6eb Lucas Tanure   2022-04-13  424  		return -EINVAL;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  425  
7b2f3eb492dac76 Lucas Tanure   2021-12-17  426  	/* check I2C address to assign the index */
7b2f3eb492dac76 Lucas Tanure   2021-12-17  427  	cs35l41->index = id == 0x40 ? 0 : 1;
775d667539a4dd8 Stefan Binding 2022-05-09  428  	cs35l41->hw_cfg.spk_pos = cs35l41->index;
00f87ec74c3c096 Stefan Binding 2022-05-09  429  	cs35l41->channel_index = 0;
8c286a0f973a812 Lucas Tanure   2022-01-17  430  	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
b8388a1aba32bef Lucas Tanure   2022-04-13  431  	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
de8cab7b38d74e7 Stefan Binding 2022-05-09  432  	hw_cfg->gpio2.func = CS35L41_GPIO2_INT_OPEN_DRAIN;
de8cab7b38d74e7 Stefan Binding 2022-05-09  433  	hw_cfg->gpio2.valid = true;
2603c974b45dbfe Lucas Tanure   2022-04-13  434  	cs35l41->hw_cfg.valid = true;
8c286a0f973a812 Lucas Tanure   2022-01-17  435  	put_device(physdev);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  436  
f7f207375d4e6eb Lucas Tanure   2022-04-13  437  	return 0;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  438  }
7b2f3eb492dac76 Lucas Tanure   2021-12-17  439  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
