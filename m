Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4A4EA280
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 23:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0453A16F2;
	Mon, 28 Mar 2022 23:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0453A16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648503441;
	bh=DCWftDqezxZW1H4HwqNDkNoniGk2yx7m8eMctaLrnkk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQtOBKhFNj+/bpP6Gs2bZu5zNR5y2NSsxTkQLFTXm7thUQcmqiRmGwOaBesy6Yvqm
	 dKwn6vZ0AbE4sY8RB1s6kHyi2itMS/dDjkGuPQCXWDGD+Mb4coc6iparauXQwOrN32
	 pO7gAd4+Y3Yxq05RAw7zOLeMkM84iTNBbd+fIPlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB61F800CB;
	Mon, 28 Mar 2022 23:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B6DBF8024C; Mon, 28 Mar 2022 23:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B22F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 23:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B22F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m+mBeRdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648503366; x=1680039366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DCWftDqezxZW1H4HwqNDkNoniGk2yx7m8eMctaLrnkk=;
 b=m+mBeRdlYDHU7M09u6byzqkNVVbLJRJ+ewSEL0kbfmbMnG7UpWLY4o4e
 ZoGNQc6a+UulcjNFY11FY7Tqfys73aFbJ7C89jM0AMN0YrzYup5Ysc1Zu
 jJfgovrT4e/q5XOJK5hpS7F8DUNbDFRsO+fWEhMd38HoWM6uhGmdL/XIe
 3ePDolaXK/pe196TS7YliZciZOtksqNx8m9b64Lm+tjuofnLfxal3TMGA
 lN0LmyjvY9pX/JyGNrJG+MwUwiSzfqvURACQFpYt0LEp55u8bZeIy1gVI
 0aFnxxDTUFUn0T5/kc4x6DLyEPYWjYc1IL4aIMnmECZkLadflKBLhshHm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="257936042"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="257936042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 14:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="639106707"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2022 14:35:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nYx1j-0002Kx-5x; Mon, 28 Mar 2022 21:35:51 +0000
Date: Tue, 29 Mar 2022 05:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Path creation and freeing
Message-ID: <202203290516.fzAxfExg-lkp@intel.com>
References: <20220328172410.761309-11-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328172410.761309-11-cezary.rojewski@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, kbuild-all@lists.01.org,
 cujomalainey@chromium.org, lma@semihalf.com
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

Hi Cezary,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next next-20220328]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Topology-and-path-management/20220329-012230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220329/202203290516.fzAxfExg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cd5b9e82ba0830b3e2874f6b88054cf8c09c977d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cezary-Rojewski/ASoC-Intel-avs-Topology-and-path-management/20220329-012230
        git checkout cd5b9e82ba0830b3e2874f6b88054cf8c09c977d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/intel/avs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/intel/avs/path.c: In function 'avs_path_create_unlocked':
>> sound/soc/intel/avs/path.c:232:35: warning: variable 'acomp' set but not used [-Wunused-but-set-variable]
     232 |         struct avs_soc_component *acomp;
         |                                   ^~~~~


vim +/acomp +232 sound/soc/intel/avs/path.c

   228	
   229	static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_id,
   230							 struct avs_tplg_path *template)
   231	{
 > 232		struct avs_soc_component *acomp;
   233		struct avs_path *path;
   234		int ret;
   235	
   236		acomp = to_avs_soc_component(template->owner->owner->comp);
   237	
   238		path = kzalloc(sizeof(*path), GFP_KERNEL);
   239		if (!path)
   240			return ERR_PTR(-ENOMEM);
   241	
   242		ret = avs_path_init(adev, path, template, dma_id);
   243		if (ret < 0)
   244			goto err;
   245	
   246		path->state = AVS_PPL_STATE_INVALID;
   247		return path;
   248	err:
   249		avs_path_free_unlocked(path);
   250		return ERR_PTR(ret);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
