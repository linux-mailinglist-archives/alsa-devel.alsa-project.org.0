Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095BD5915CD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 21:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626FB83B;
	Fri, 12 Aug 2022 21:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626FB83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660331468;
	bh=8jOYdsTjIERgCZgii8GvHSE+RxiWxjjphILTOFIsJA0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJvAkFvK0QjQinQqKPHLcYmei4mOMJxcLXmsfKfwNkph1NlDK0WMiD/o5ezxi4HMc
	 CiKzuLWcz7RHRmWHKQ7ugagdiEpkzmvMfBfHFs71jBJNF+lS/VsFVzTcV9iF5h5JzV
	 YYBgwNoAB/624Hr3C+3j6LWVgXeAHX/7qkOslqA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C075EF8026D;
	Fri, 12 Aug 2022 21:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B08EF8026A; Fri, 12 Aug 2022 21:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B34F80054
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 21:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B34F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cT3/pZd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660331402; x=1691867402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8jOYdsTjIERgCZgii8GvHSE+RxiWxjjphILTOFIsJA0=;
 b=cT3/pZd45C0UUFr4swJs9nE4v22Z35/RW1HGo84Jo7S3/twfEMC9Gbd9
 hfwVzfcP+yq9pE3yZuNUEcdg7a44QirXgXwCOWsSimpWLcN8LhJCQ67FH
 Ega0E0acgjnsB9SnLbhQRca0WG6bYv09IrCCOh9SzplVfbCs05QWRZ+cj
 bjhJ27PGBKksVmtRwAIu+iuPwLCzawjU6QhgJwSbj3we7FjdjqhEoAjSf
 5z/Q1V9eNS59pbBZSiricULI8QYqhXDCkHILaaH3YC9Lhmsu4F0fptchI
 ShtY9WQw7hQB8MtEOSJYac3NFj3mYY/6FMu6Q5D7ahyvPOphjWhfFAkZL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290424256"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="290424256"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 12:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="556628845"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2022 12:09:52 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oMa2a-0000qc-0Q;
 Fri, 12 Aug 2022 19:09:52 +0000
Date: Sat, 13 Aug 2022 03:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>, perex@perex.cz,
 tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add support for jsl_rt5682_rt1019
Message-ID: <202208130220.892ZS1bh-lkp@intel.com>
References: <20220812114804.550809-1-sean.hong@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812114804.550809-1-sean.hong@quanta.corp-partner.google.com>
Cc: cezary.rojewski@intel.com, kbuild-all@lists.01.org,
 kai.vehmanen@linux.intel.com,
 Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 yung-chuan.liao@linux.intel.com, llvm@lists.linux.dev,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 brent.lu@intel.com, linux-kernel@vger.kernel.org, yong.zhi@intel.com
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

Hi Sean,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next linus/master next-20220812]
[cannot apply to v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Hong/ASoC-Intel-sof_rt5682-Add-support-for-jsl_rt5682_rt1019/20220812-195139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220813/202208130220.892ZS1bh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5ab680d85b9dbcaa1929ab9beace3c9622e46d19
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Hong/ASoC-Intel-sof_rt5682-Add-support-for-jsl_rt5682_rt1019/20220812-195139
        git checkout 5ab680d85b9dbcaa1929ab9beace3c9622e46d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/intel/common/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-jsl-match.c:35:2: error: expected ';' after top level declarator
   }
    ^
    ;
>> sound/soc/intel/common/soc-acpi-intel-jsl-match.c:89:4: error: field designator 'sof_fw_filename' does not refer to any field in type 'struct snd_soc_acpi_mach'
                   .sof_fw_filename = "sof-jsl.ri",
                    ^
   2 errors generated.


vim +35 sound/soc/intel/common/soc-acpi-intel-jsl-match.c

    31	
    32	static struct snd_soc_acpi_codecs rt1019p_spk = {
    33		.num_codecs = 1,
    34		.codecs = {"RTL1019"}
  > 35	}
    36	
    37	static const struct snd_soc_acpi_codecs mx98360a_spk = {
    38		.num_codecs = 1,
    39		.codecs = {"MX98360A"}
    40	};
    41	
    42	static const struct snd_soc_acpi_codecs rt5682_rt5682s_hp = {
    43		.num_codecs = 2,
    44		.codecs = {"10EC5682", "RTL5682"},
    45	};
    46	
    47	/*
    48	 * When adding new entry to the snd_soc_acpi_intel_jsl_machines array,
    49	 * use .quirk_data member to distinguish different machine driver,
    50	 * and keep ACPI .id field unchanged for the common codec.
    51	 */
    52	struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
    53		{
    54			.id = "DLGS7219",
    55			.drv_name = "sof_da7219_mx98373",
    56			.sof_tplg_filename = "sof-jsl-da7219.tplg",
    57			.machine_quirk = snd_soc_acpi_codec_list,
    58			.quirk_data = &jsl_7219_98373_codecs,
    59		},
    60		{
    61			.id = "DLGS7219",
    62			.drv_name = "sof_da7219_mx98360a",
    63			.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
    64		},
    65		{
    66			.comp_ids = &rt5682_rt5682s_hp,
    67			.drv_name = "jsl_rt5682_rt1015",
    68			.machine_quirk = snd_soc_acpi_codec_list,
    69			.quirk_data = &rt1015_spk,
    70			.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
    71		},
    72		{
    73			.comp_ids = &rt5682_rt5682s_hp,
    74			.drv_name = "jsl_rt5682_rt1015p",
    75			.machine_quirk = snd_soc_acpi_codec_list,
    76			.quirk_data = &rt1015p_spk,
    77			.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
    78		},
    79		{
    80			.comp_ids = &rt5682_rt5682s_hp,
    81			.drv_name = "jsl_rt5682_mx98360",
    82			.machine_quirk = snd_soc_acpi_codec_list,
    83			.quirk_data = &mx98360a_spk,
    84			.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
    85		},
    86		{
    87			.comp_ids = &rt5682_rt5682s_hp,
    88			.drv_name = "jsl_rt5682_rt1019",
  > 89			.sof_fw_filename = "sof-jsl.ri",

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
