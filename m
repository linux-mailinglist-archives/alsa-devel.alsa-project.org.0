Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943277F7F4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C644829;
	Thu, 17 Aug 2023 15:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C644829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279717;
	bh=M17NeQawyKXZRQ2/7UMBxxYUf89dEiKQfdMTFMzD1nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ruB4EZDE9omFF4VbRn+R04HHGC5ofwf6l7PtQ0KFd36fPnPipT6KAmV+P/cxS3vX/
	 L0POXBHgMiAJmne/Dp9EbmtDCRxKDEtlNepkys0lcbZX6Nolj9RiaC0G27tFBujvUb
	 o7zzoA9J/C+7opBu5EG66O5NSdMonhxmPRQH13J8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54C68F8025F; Thu, 17 Aug 2023 15:41:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6925F8016A;
	Thu, 17 Aug 2023 15:41:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF2DBF8016D; Thu, 17 Aug 2023 15:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6F26F80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F26F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F6GOq24D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692279652; x=1723815652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M17NeQawyKXZRQ2/7UMBxxYUf89dEiKQfdMTFMzD1nc=;
  b=F6GOq24Dm4Ad7ddjvF0V7BkXqPd2VxX7Abn+rFLxsgHbFPKyg4tVquww
   PfRyeJVBXKD0alUaOhy/kh/LrjwxWEQ7V3jdLjCSu+6H2JmNdNdceSse/
   c9vOEvTtucLXXbLn47lXZf6FH7nbzfGHNDz7cczeUKs8JxdXFi58uxHm8
   6ckyWRPGpqTPa6gv2NlIcoZlM91kcJXm7Vtgz86o47JXqYXtZ5o7Dqnxd
   ZxDzw4wwOaAYUFTU18L5Ulo6XZxwEde0F9HDcTqX3V3Gwxj4SjxW+WTt6
   FkGmz7gD4NJuA+5VoE3CcYTDOlMBUFuBLWBSY4JpBpwYx5el1S6zg0psl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371717270"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="371717270"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 06:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908411157"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="908411157"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 06:40:43 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdEw-0001Ap-1O;
	Thu, 17 Aug 2023 13:40:42 +0000
Date: Thu, 17 Aug 2023 21:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, 13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com, Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH v3 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Message-ID: <202308172137.SthCPFbA-lkp@intel.com>
References: <20230817082606.940-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817082606.940-1-shenghao-ding@ti.com>
Message-ID-Hash: FD4VIOAXCXCAEYBIQBMLIRMCVKQUUEXH
X-Message-ID-Hash: FD4VIOAXCXCAEYBIQBMLIRMCVKQUUEXH
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FD4VIOAXCXCAEYBIQBMLIRMCVKQUUEXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-linus]
[also build test WARNING on linus/master v6.5-rc6]
[cannot apply to tiwai-sound/for-next next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ALSA-hda-tas2781-Add-tas2781-HDA-driver/20230817-162901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20230817082606.940-1-shenghao-ding%40ti.com
patch subject: [PATCH v3 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308172137.SthCPFbA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172137.SthCPFbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172137.SthCPFbA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from sound/pci/hda/tas2781_hda_i2c.c:9:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   sound/pci/hda/tas2781_hda_i2c.c: In function 'tasdevice_set_profile_id':
>> sound/pci/hda/tas2781_hda_i2c.c:192:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     192 |         int val, ret = 0;
         |             ^~~
   sound/pci/hda/tas2781_hda_i2c.c: In function 'tasdevice_program_put':
   sound/pci/hda/tas2781_hda_i2c.c:249:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     249 |         int val, ret = 0;
         |             ^~~
   sound/pci/hda/tas2781_hda_i2c.c: In function 'tasdevice_config_put':
   sound/pci/hda/tas2781_hda_i2c.c:278:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     278 |         int val, ret = 0;
         |             ^~~


vim +/val +192 sound/pci/hda/tas2781_hda_i2c.c

     8	
   > 9	#include <linux/acpi.h>
    10	#include <linux/crc8.h>
    11	#include <linux/crc32.h>
    12	#include <linux/efi.h>
    13	#include <linux/firmware.h>
    14	#include <linux/i2c.h>
    15	#include <linux/mod_devicetable.h>
    16	#include <linux/module.h>
    17	#include <linux/pm_runtime.h>
    18	#include <linux/regmap.h>
    19	#include <sound/hda_codec.h>
    20	#include <sound/soc.h>
    21	#include <sound/tas2781.h>
    22	#include <sound/tlv.h>
    23	#include <sound/tas2781-tlv.h>
    24	
    25	#include "hda_local.h"
    26	#include "hda_auto_parser.h"
    27	#include "hda_component.h"
    28	#include "hda_jack.h"
    29	#include "hda_generic.h"
    30	
    31	#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
    32	
    33	/* No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
    34	 * Define two controls, one is Volume control callbacks, the other is
    35	 * flag setting control callbacks.
    36	 */
    37	
    38	/* Volume control callbacks for tas2781 */
    39	#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
    40		xhandler_get, xhandler_put, tlv_array) \
    41	{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname),\
    42		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
    43			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
    44		.tlv.p = (tlv_array), \
    45		.info = snd_soc_info_volsw_range, \
    46		.get = xhandler_get, .put = xhandler_put, \
    47		.private_value = (unsigned long)&(struct soc_mixer_control) \
    48			{.reg = xreg, .rreg = xreg, .shift = xshift, \
    49			 .rshift = xshift, .min = xmin, .max = xmax, \
    50			 .invert = xinvert} }
    51	
    52	/* Flag control callbacks for tas2781 */
    53	#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
    54	{	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = xname, \
    55		.info = snd_ctl_boolean_mono_info, \
    56		.get = xhandler_get, .put = xhandler_put, \
    57		.private_value = xdata }
    58	
    59	enum calib_data {
    60		R0_VAL = 0,
    61		INV_R0,
    62		R0LOW,
    63		POWER,
    64		TLIM,
    65		CALIB_MAX
    66	};
    67	
    68	static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
    69	{
    70		struct tasdevice_priv *tas_priv = data;
    71		struct acpi_resource_i2c_serialbus *sb;
    72	
    73		if (i2c_acpi_get_i2c_resource(ares, &sb)) {
    74			if (tas_priv->ndev < TASDEVICE_MAX_CHANNELS &&
    75				sb->slave_address != TAS2781_GLOBAL_ADDR) {
    76				tas_priv->tasdevice[tas_priv->ndev].dev_addr =
    77					(unsigned int)sb->slave_address;
    78				tas_priv->ndev++;
    79			}
    80		}
    81		return 1;
    82	}
    83	
    84	static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
    85	{
    86		struct acpi_device *adev;
    87		struct device *physdev;
    88		LIST_HEAD(resources);
    89		const char *sub;
    90		int ret;
    91	
    92		adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
    93		if (!adev) {
    94			dev_err(p->dev,
    95				"Failed to find an ACPI device for %s\n", hid);
    96			return -ENODEV;
    97		}
    98	
    99		ret = acpi_dev_get_resources(adev, &resources, tas2781_get_i2c_res, p);
   100		if (ret < 0)
   101			goto err;
   102	
   103		acpi_dev_free_resource_list(&resources);
   104		strscpy(p->dev_name, hid, sizeof(p->dev_name));
   105		physdev = get_device(acpi_get_first_physical_node(adev));
   106		acpi_dev_put(adev);
   107	
   108		/* No side-effect to the playback even if subsystem_id is NULL*/
   109		sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
   110		if (IS_ERR(sub))
   111			sub = NULL;
   112	
   113		p->acpi_subsystem_id = sub;
   114	
   115		put_device(physdev);
   116	
   117		return 0;
   118	
   119	err:
   120		dev_err(p->dev, "read acpi error, ret: %d\n", ret);
   121		put_device(physdev);
   122	
   123		return ret;
   124	}
   125	
   126	static void tas2781_hda_playback_hook(struct device *dev, int action)
   127	{
   128		struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
   129	
   130		dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
   131		switch (action) {
   132		case HDA_GEN_PCM_ACT_OPEN:
   133			pm_runtime_get_sync(dev);
   134			mutex_lock(&tas_priv->codec_lock);
   135			tasdevice_tuning_switch(tas_priv, 0);
   136			mutex_unlock(&tas_priv->codec_lock);
   137			break;
   138		case HDA_GEN_PCM_ACT_CLOSE:
   139			mutex_lock(&tas_priv->codec_lock);
   140			tasdevice_tuning_switch(tas_priv, 1);
   141			mutex_unlock(&tas_priv->codec_lock);
   142	
   143			pm_runtime_mark_last_busy(dev);
   144			pm_runtime_put_autosuspend(dev);
   145			break;
   146		default:
   147			dev_dbg(tas_priv->dev, "Playback action not supported: %d\n",
   148				action);
   149			break;
   150		}
   151	}
   152	
   153	static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
   154				struct snd_ctl_elem_info *uinfo)
   155	{
   156		struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
   157	
   158		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
   159		uinfo->count = 1;
   160		uinfo->value.integer.min = 0;
   161		uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
   162	
   163		return 0;
   164	}
   165	
   166	static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
   167				struct snd_ctl_elem_value *ucontrol)
   168	{
   169		struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
   170	
   171		ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
   172	
   173		return 0;
   174	}
   175	
   176	static int tasdevice_hda_clamp(int val, int max)
   177	{
   178		if (val > max)
   179			val = max;
   180	
   181		if (val < 0)
   182			val = 0;
   183		return val;
   184	}
   185	
   186	static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
   187			struct snd_ctl_elem_value *ucontrol)
   188	{
   189		struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
   190		int nr_profile = ucontrol->value.integer.value[0];
   191		int max = tas_priv->rcabin.ncfgs - 1;
 > 192		int val, ret = 0;
   193	
   194		val = tasdevice_hda_clamp(nr_profile, max);
   195	
   196		if (tas_priv->rcabin.profile_cfg_id != nr_profile) {
   197			tas_priv->rcabin.profile_cfg_id = nr_profile;
   198			ret = 1;
   199		}
   200	
   201		return ret;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
