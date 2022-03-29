Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8A4EA6A8
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 06:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BAB175A;
	Tue, 29 Mar 2022 06:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BAB175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648528879;
	bh=DZRc+KCsVdGPHeALwU+iymZbYFCxRAtALxQwt4Jpb0A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d7rD/4J2krVFdhpnFJsGCIykBmkt04CU+UInIIRFt6Qqr5C6QsNaFIeC2yiepYCcE
	 qYRE05IJzPCyH7O55lq/LP8b/dxK2gIHa+5y9wmFib+29FM93zM8wJfqUx8ZZytxNc
	 3GCU+s39+SslurAonMYTL7IPbjURW4o5aI+wht8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8434F804B0;
	Tue, 29 Mar 2022 06:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66E37F800FA; Tue, 29 Mar 2022 06:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF47AF800FA
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 06:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF47AF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F/X3Wxsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648528803; x=1680064803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DZRc+KCsVdGPHeALwU+iymZbYFCxRAtALxQwt4Jpb0A=;
 b=F/X3Wxsqu/rOAcYIv6AV7DO6/inbN9CK3r82Qet4dvoco9X6jwUWfTeL
 OfICvrBpD5b3k4zY/KJy7z3IOiv1GdDETk4O8ihkXLYdLz1r1oX0F2ZjU
 vdZXA3Uxy+DtTZATLSrsqQ5xw/6HFIPGkt9bzcK97f3mMs2wWlFQ9WSng
 Qr2PRUo0H4zV8QzDW+m6PDI1B3GMOEeMQ64ZNNKcVgOa8EP/PpVWQbJ4k
 qzt1MwuwlH7W0K0AS1cjh8Ei4968jGiKK6dXrnc89gnGE6K86OBYMyaHw
 gpk7Rz9QwXGWcDcefjfYbzhNPy/sqEUOzFOTpG6RnPvKyvXkmDj9XOjwu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322345956"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="322345956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 21:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="604523866"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2022 21:39:55 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ3e6-0002eK-Ge; Tue, 29 Mar 2022 04:39:54 +0000
Date: Tue, 29 Mar 2022 12:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix audio regression on Mi Notebook
 Pro 2020
Message-ID: <202203291202.DT2WLVoc-lkp@intel.com>
References: <20220329001845.776776-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329001845.776776-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 kbuild-all@lists.01.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
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

Hi Kai-Heng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.17 next-20220329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kai-Heng-Feng/ALSA-hda-realtek-Fix-audio-regression-on-Mi-Notebook-Pro-2020/20220329-082021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arm64-randconfig-r036-20220327 (https://download.01.org/0day-ci/archive/20220329/202203291202.DT2WLVoc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/b86b7ea348ec9ba6c3824d7a0066968ec4fa0ce5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kai-Heng-Feng/ALSA-hda-realtek-Fix-audio-regression-on-Mi-Notebook-Pro-2020/20220329-082021
        git checkout b86b7ea348ec9ba6c3824d7a0066968ec4fa0ce5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/pci/hda/patch_realtek.c:3620:42: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
           if (codec->core.vendor_id != 0x10ec0236 ||
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   1 warning generated.


vim +3620 sound/pci/hda/patch_realtek.c

  3594	
  3595	static void alc256_shutup(struct hda_codec *codec)
  3596	{
  3597		struct alc_spec *spec = codec->spec;
  3598		hda_nid_t hp_pin = alc_get_hp_pin(spec);
  3599		bool hp_pin_sense;
  3600	
  3601		if (!hp_pin)
  3602			hp_pin = 0x21;
  3603	
  3604		hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
  3605	
  3606		if (hp_pin_sense)
  3607			msleep(2);
  3608	
  3609		snd_hda_codec_write(codec, hp_pin, 0,
  3610				    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
  3611	
  3612		if (hp_pin_sense || spec->ultra_low_power)
  3613			msleep(85);
  3614	
  3615		/* 3k pull low control for Headset jack. */
  3616		/* NOTE: call this before clearing the pin, otherwise codec stalls */
  3617		/* If disable 3k pulldown control for alc257, the Mic detection will not work correctly
  3618		 * when booting with headset plugged. So skip setting it for the codec alc257
  3619		 */
> 3620		if (codec->core.vendor_id != 0x10ec0236 ||
  3621		    codec->core.vendor_id != 0x10ec0257)
  3622			alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
  3623	
  3624		if (!spec->no_shutup_pins)
  3625			snd_hda_codec_write(codec, hp_pin, 0,
  3626					    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
  3627	
  3628		if (hp_pin_sense || spec->ultra_low_power)
  3629			msleep(100);
  3630	
  3631		alc_auto_setup_eapd(codec, false);
  3632		alc_shutup_pins(codec);
  3633		if (spec->ultra_low_power) {
  3634			msleep(50);
  3635			alc_update_coef_idx(codec, 0x03, 1<<1, 0);
  3636			alc_update_coef_idx(codec, 0x08, 7<<4, 7<<4);
  3637			alc_update_coef_idx(codec, 0x08, 3<<2, 0);
  3638			alc_update_coef_idx(codec, 0x3b, 1<<15, 1<<15);
  3639			alc_update_coef_idx(codec, 0x0e, 7<<6, 0);
  3640			msleep(30);
  3641		}
  3642	}
  3643	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
