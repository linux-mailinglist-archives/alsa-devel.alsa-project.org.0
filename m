Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B9339968
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 23:01:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F94118A5;
	Fri, 12 Mar 2021 23:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F94118A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615586508;
	bh=be+24pM88wiwKMdK9F4zJcBrkx+0fjhDpNRDItVdKyo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWK9k7u5v+bZHLhUPX/eAKy7R+An2nmV/0wqcKxmMB104pjRsu5XybvLWos6bzbq8
	 2KrpFZlj7H4Eoa9GohFCt4PA7A5Bjci3gJSyr/t33IjdcoiGmXjTmptAHb0JZHLuBd
	 h+K0DthhLTHuxqKM6NgZJ2exHZHIIp3SLhGfImKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74FF8F800BF;
	Fri, 12 Mar 2021 23:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D32F801D8; Fri, 12 Mar 2021 23:00:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF593F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 23:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF593F8012A
IronPort-SDR: rlwIffVvqhI5p27G+J6rMLkFOq7mc3BOR3uEcZ64Iqd/biKC8nD+SuQjG2nJsNymmOQx0LrYSp
 N4MT8RCZol6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="208742176"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
 d="gz'50?scan'50,208,50";a="208742176"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 13:59:53 -0800
IronPort-SDR: Ryks+4nkVYeTGMIaQQe5zFnD+cKG4BMM2SmOdo3DWcAplOjjzMnEYKituEJNr4y7CGHDXZ0auE
 iRmBpRcqQxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
 d="gz'50?scan'50,208,50";a="372797183"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 12 Mar 2021 13:59:50 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lKpoz-0001da-Q4; Fri, 12 Mar 2021 21:59:49 +0000
Date: Sat, 13 Mar 2021 05:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 4/4] ALSA: hda/cirrus: Make CS8409 driver more generic by
 using fixups.
Message-ID: <202103130544.EdST2GY6-lkp@intel.com>
References: <20210312184452.3288-5-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20210312184452.3288-5-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vitaly,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on sound/for-next]
[also build test WARNING on next-20210312]
[cannot apply to v5.12-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vitaly-Rodionov/ALSA-hda-cirrus-Make-CS8409-driver-more-generic-by-using-fixups/20210313-024937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: microblaze-randconfig-m031-20210312 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

New smatch warnings:
sound/pci/hda/patch_cirrus.c:2143 cs8409_cs42l42_fixups() warn: always true condition '(caps >= 0) => (0-u32max >= 0)'

Old smatch warnings:
sound/pci/hda/patch_cirrus.c:2150 cs8409_cs42l42_fixups() warn: always true condition '(caps >= 0) => (0-u32max >= 0)'
sound/pci/hda/patch_cirrus.c:2156 cs8409_cs42l42_fixups() warn: always true condition '(caps >= 0) => (0-u32max >= 0)'
sound/pci/hda/patch_cirrus.c:2161 cs8409_cs42l42_fixups() warn: always true condition '(caps >= 0) => (0-u32max >= 0)'

vim +2143 sound/pci/hda/patch_cirrus.c

6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2098  
89b3eea4b1e18f Stefan Binding  2021-03-12  2099  static void cs8409_cs42l42_fixups(struct hda_codec *codec,
89b3eea4b1e18f Stefan Binding  2021-03-12  2100  				    const struct hda_fixup *fix, int action)
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2101  {
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2102  	struct cs_spec *spec = codec->spec;
76e2b57d1d60d1 Stefan Binding  2021-03-12  2103  	unsigned int caps;
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2104  
89b3eea4b1e18f Stefan Binding  2021-03-12  2105  	switch (action) {
89b3eea4b1e18f Stefan Binding  2021-03-12  2106  	case HDA_FIXUP_ACT_PRE_PROBE:
89b3eea4b1e18f Stefan Binding  2021-03-12  2107  		snd_hda_add_verbs(codec, cs8409_cs42l42_init_verbs);
89b3eea4b1e18f Stefan Binding  2021-03-12  2108  		/* verb exec op override */
89b3eea4b1e18f Stefan Binding  2021-03-12  2109  		spec->exec_verb = codec->core.exec_verb;
89b3eea4b1e18f Stefan Binding  2021-03-12  2110  		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
89b3eea4b1e18f Stefan Binding  2021-03-12  2111  
89b3eea4b1e18f Stefan Binding  2021-03-12  2112  		mutex_init(&spec->cs8409_i2c_mux);
89b3eea4b1e18f Stefan Binding  2021-03-12  2113  
89b3eea4b1e18f Stefan Binding  2021-03-12  2114  		codec->patch_ops = cs8409_cs42l42_patch_ops;
89b3eea4b1e18f Stefan Binding  2021-03-12  2115  
89b3eea4b1e18f Stefan Binding  2021-03-12  2116  		spec->gen.suppress_auto_mute = 1;
89b3eea4b1e18f Stefan Binding  2021-03-12  2117  		spec->gen.no_primary_hp = 1;
89b3eea4b1e18f Stefan Binding  2021-03-12  2118  		spec->gen.suppress_vmaster = 1;
89b3eea4b1e18f Stefan Binding  2021-03-12  2119  
89b3eea4b1e18f Stefan Binding  2021-03-12  2120  		/* GPIO 5 out, 3,4 in */
89b3eea4b1e18f Stefan Binding  2021-03-12  2121  		spec->gpio_dir = GPIO5_INT;
89b3eea4b1e18f Stefan Binding  2021-03-12  2122  		spec->gpio_data = 0;
89b3eea4b1e18f Stefan Binding  2021-03-12  2123  		spec->gpio_mask = 0x03f;
89b3eea4b1e18f Stefan Binding  2021-03-12  2124  
89b3eea4b1e18f Stefan Binding  2021-03-12  2125  		spec->cs42l42_hp_jack_in = 0;
89b3eea4b1e18f Stefan Binding  2021-03-12  2126  		spec->cs42l42_mic_jack_in = 0;
89b3eea4b1e18f Stefan Binding  2021-03-12  2127  
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2128  		/* Basic initial sequence for specific hw configuration */
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2129  		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2130  
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2131  		/* CS8409 is simple HDA bridge and intended to be used with a remote
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2132  		 * companion codec. Most of input/output PIN(s) have only basic
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2133  		 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2134  		 * capabilities and no presence detect capable (PDC) and call to
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2135  		 * snd_hda_gen_build_controls() will mark them as non detectable
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2136  		 * phantom jacks. However, in this configuration companion codec
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2137  		 * CS42L42 is connected to these pins and it has jack detect
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2138  		 * capabilities. We have to override pin capabilities,
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2139  		 * otherwise they will not be created as input devices.
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2140  		 */
76e2b57d1d60d1 Stefan Binding  2021-03-12  2141  		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_HP_PIN_NID,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2142  				AC_PAR_PIN_CAP);
76e2b57d1d60d1 Stefan Binding  2021-03-12 @2143  		if (caps >= 0)
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2144  			snd_hdac_override_parm(&codec->core,
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2145  				CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2146  				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2147  
76e2b57d1d60d1 Stefan Binding  2021-03-12  2148  		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2149  				AC_PAR_PIN_CAP);
76e2b57d1d60d1 Stefan Binding  2021-03-12  2150  		if (caps >= 0)
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2151  			snd_hdac_override_parm(&codec->core,
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2152  				CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2153  				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2154  
76e2b57d1d60d1 Stefan Binding  2021-03-12  2155  		caps = get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID);
76e2b57d1d60d1 Stefan Binding  2021-03-12  2156  		if (caps >= 0)
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2157  			snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2158  				(caps | AC_WCAP_UNSOL_CAP));
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2159  
76e2b57d1d60d1 Stefan Binding  2021-03-12  2160  		caps = get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID);
76e2b57d1d60d1 Stefan Binding  2021-03-12  2161  		if (caps >= 0)
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2162  			snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
76e2b57d1d60d1 Stefan Binding  2021-03-12  2163  				(caps | AC_WCAP_UNSOL_CAP));
89b3eea4b1e18f Stefan Binding  2021-03-12  2164  		break;
89b3eea4b1e18f Stefan Binding  2021-03-12  2165  	case HDA_FIXUP_ACT_PROBE:
89b3eea4b1e18f Stefan Binding  2021-03-12  2166  		snd_hda_gen_add_kctl(&spec->gen,
89b3eea4b1e18f Stefan Binding  2021-03-12  2167  			NULL, &cs8409_cs42l42_hp_volume_mixer);
89b3eea4b1e18f Stefan Binding  2021-03-12  2168  		snd_hda_gen_add_kctl(&spec->gen,
89b3eea4b1e18f Stefan Binding  2021-03-12  2169  			NULL, &cs8409_cs42l42_amic_volume_mixer);
89b3eea4b1e18f Stefan Binding  2021-03-12  2170  		cs8409_cs42l42_hw_init(codec);
89b3eea4b1e18f Stefan Binding  2021-03-12  2171  		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
89b3eea4b1e18f Stefan Binding  2021-03-12  2172  		break;
89b3eea4b1e18f Stefan Binding  2021-03-12  2173  	case HDA_FIXUP_ACT_INIT:
89b3eea4b1e18f Stefan Binding  2021-03-12  2174  		cs8409_cs42l42_hw_init(codec);
89b3eea4b1e18f Stefan Binding  2021-03-12  2175  		// Fall through
89b3eea4b1e18f Stefan Binding  2021-03-12  2176  	case HDA_FIXUP_ACT_BUILD:
89b3eea4b1e18f Stefan Binding  2021-03-12  2177  		/* Run jack auto detect first time on boot
89b3eea4b1e18f Stefan Binding  2021-03-12  2178  		 * after controls have been added, to check if jack has
89b3eea4b1e18f Stefan Binding  2021-03-12  2179  		 * been already plugged in.
89b3eea4b1e18f Stefan Binding  2021-03-12  2180  		 * Run immediately after init.
89b3eea4b1e18f Stefan Binding  2021-03-12  2181  		 */
89b3eea4b1e18f Stefan Binding  2021-03-12  2182  		cs8409_cs42l42_run_jack_detect(codec);
89b3eea4b1e18f Stefan Binding  2021-03-12  2183  		usleep_range(100000, 150000);
89b3eea4b1e18f Stefan Binding  2021-03-12  2184  		break;
89b3eea4b1e18f Stefan Binding  2021-03-12  2185  	default:
89b3eea4b1e18f Stefan Binding  2021-03-12  2186  		break;
89b3eea4b1e18f Stefan Binding  2021-03-12  2187  	}
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2188  }
6cc7e93f46a5ce Vitaly Rodionov 2021-03-06  2189  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--TB36FDmn/VVEgNH/
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICL3dS2AAAy5jb25maWcAnDxrj9u2st/7K4QUuGiBm9SPbDaLi/1AS5TFmnpEpLx2vgiu
V0mMeu09tjdN7q+/M9SLlChvcQ/Oadczw9fMcF4cnV9/+dUhL5fj0+ay2272+5/O1+JQnDaX
4tH5stsX/+N4sRPF0qEek++AmO8OLz/+eNptT8e/9pv/LZybd+PJu9Hb03biLIrTodg77vHw
Zff1BSbZHQ+//PqLG0c+m+eumy9pKlgc5ZKu5P2bdpK3e5z17dft1vlt7rq/O3fvpu9Gb7SR
TOSAuP9Zg+btbPd3o+lo1NByEs0bVAPmHk4x8712CgDVZJPp+3YGriFG2hYCInIiwnwey7id
RUOwiLOIaqg4EjLNXBmnooWy9FP+EKeLFjLLGPckC2kuyYzTXMSpBCxw7ldnrqSxd87F5eW5
5eUsjRc0yoGVIky0uSMmcxotc5LCOVjI5P10ArM0GwoTBgtIKqSzOzuH4wUnbg4eu4TXJ3/z
xgbOSaYfXu08F4RLjd6jPsm4VJuxgINYyIiE9P7Nb4fjofi9ISCpG+RRnIsHgkdqdi3WYskS
V99wg0tiwVZ5+CmjGbUSPBAJsw7j3TQWIg9pGKfrnEhJ3MBKlwnK2cyKIhlcDR2jBAdids4v
f51/ni/FUyu4OY1oylylBUkazzR10VEiiB/sGBb9SV2JEjI0yotDwjSYSEgqKKJ0VuoTeXSW
zX1hHqk4PDrHL53Nd7fhgkYs6JJGUtRqKndPxelsO7Bk7gL0lMKJZLs9EHPwGfUxVAdpNgjA
BNaIPeZaFLQcxTxOOzO1PwM2D/KUihzvk7p2zaF6e6zHJCmlYSJhKnV7W+Wq4MuYZ5Ek6dqu
giWVZbv1eDeG4TWn3CT7Q27OfzsX2I6zga2dL5vL2dlst8eXw2V3+NrhHQzIiavmYNG8PWki
mPGjuWAeE2hGPP3s/2JVtbvUzRxhE2K0zgHXLgg/croCWWlCFQaFGtMBEbEQamilShZUD5R5
1AaXKXGvI0ANiJeHM50P5vlaIbJF+YdVwmwRwEygTVabiVbQhwvLfHk/vm1lzyK5ANPo0y7N
tHufhBtQr7xVtZaI7bfi8WVfnJwvxebycirOClydwoJtfM48jbNEczcJmdNSA2naQsHguZou
laPKjbRQn7A0t2JcH3wpibwH5slAvzKp1AfYLW5JkDBPXMOnXkiu4X24XJ9peo3Eo0vmDpj9
kgKuBVwteY1klvgWsTcrgA3VLkCM97VCEUk0hgXUXSQx6AQaJwgINAtWih8dqxqpIdYC+OxR
sCMukTr/u5h8OdGuJuVkrQtlxhfIC+WQU7tQZnGMdqp7BdoYJ07AoLLPNPfjFE00/CskkWvY
yy6ZgD8ss8HmXcm1ICLx2x+NTWlmDcGmMXC/dlGLOZUh3Hs1K+HcTqTYdY3CD0CbuV1Xyhij
9CdWK4833eB3ZrcjlPvA49TGkxkBZ+1nnOvz+BnEyRZimsQmoWDziHDfs9CqbetRr/LbOkAE
YAz02QiLLROxOM/S0gG1lN6Swb4rxtqYA1PPSJoy3fYskHYdij4kJ5xboIo5qNWSLamhN/XS
BvcBDPeCx8TGD1Qk5SZ1Fizc0Ig4YdPU8wbsV+KOR+974V6V+iTF6cvx9LQ5bAuHfi8O4GIJ
2GwXnSwEH7oR/5cj2oWXYSm82prb+I0RPpGQHhgKKTixh66CZzPbDeXxrDseRJmCJ6mCDPts
Qeb7kF4olwNSgbwBLJ3dAkgaKhOJmRbzGVAaIS2Exj7jRryj/LoyoUZUZyZIjd4xCOxnnHzW
0zEIpGYo3chjxIg6EcOZlLD3EmnZ82cIDnPwSf2oPHigEHTKPgI0k81SsM/AtdIkdwlEFmoX
EZKPRRm9iCxJYj20wtgAzL2GUKqU7DcX1B7n+Iy59rmN2MAQw5FmYEOiOltQI7ziy+6wU8QO
jHRaRo3awQuaRpSX9454Xno/+nE3Kv9Tk6xQOiuNzyMIF0LG1/dvvu9Ol+LHzZsrpHAL81Ck
4JEgQb6/NilSJnA9/yUpGhvKXyXz2PJVmuABXc+rZH6SXaWBaUDF79/cvhuP3j2+aRW3J7tS
oqfjtjifQTKXn89lpG5EgG2eNB6NLGoKiMnNqJNSTU3Sziz2ae5hGjNCCVLMR7QYMsxqrZod
YXhPB93Qw4IIBheaWa+g92+2QHzcF/eXy8+Mj/57PL6ZjEZvtFtZDYdQohvF1Sy8wizdKmsc
rLPGFC+9uB8bzgwDGk/FMHEkeiYers7mZa8AmDCV92fz+B1N96Oz1YteNS+czalwXs7FoyE7
sBbgF63JxAMgVNwEV27auXIQb2WEY/xIISelWFYCqlHn0oIVAfsw+rHtjJYqSCpn/ljjus7I
5N7s5ezEjVA1B8gqRbcKRR9llLA2p+233aXY4gpvH4tnoAd3Z1GblIhABUqabYQj+1rEEJCl
ssYYs0o2z+JM9M0rFgpyjJVwuB5Yq0rTdDJjMo99P5eGTudzIgOaYmEhJdGcdoY9EPDALHHz
ssBSl8vMnSlKQV10x4YjLUE20cu4rj/UW4m9jFOhjAxGjhgAaQ5yXtYKOYQEXNxP+ssHwEXt
1nH0XzPwMA8k9cRUr1KqkKFkB4aLpscENlAfHDTDyMP3hX4c9Ep6TNK/M3M3Xr79awM3wPm7
VLHn0/HLbm+UOZCoUt8Os7GyqrBlPEDzTqzXxVkV8uoeumHEK0ra5FgSnANE51RTO+UuRYhb
HGnpSylGW2xcCVhCJgusjBeZoSsz5K5lGBHRuF00i8qqcy4SFsEvvYhAfxTbl8vmr32hSvmO
ijMv2k2bscgPJWqXlh9w37x6FZFwU5YYiVmFCJmw1epwEi+r1L9i8tCG1G7D4ul4+umEm8Pm
a/FktQw+pABlsqIBQEM9iokGGEjtjlclXSZi3oktRQKxXp5Ipb3KC7w37kIdL7UGD+PZlGLg
BRGpTZJsnnYWKe1SGQW30CUDxYGbPtPNFdqcKJYQBassqVl2IWw+oq7yhXBaWDgqA7T3o7sP
jW+j4MQgi1bXd2Gkdi6n4OMIuHObxPTgFn401Q3NIxNb2VjDkpQScX/bDvmcgPO3hdOzTEvA
Pqtro3OqhqA/0+xzadJRHhgoL4wEIQhBBViaxlquCWxALuAkhuWaZ0nvFaRR02FNbFnchOBR
cfnnePobjImmr5rquAtqqw3DvV0Zt3gFN8yQlYJBMmKvJay8RJWbqLRX0cAk2JM0gOPrE7qi
kKQ2AwMUcDsSfEkTgvla3lKPTYK18hTA1jDp1ASABqyxpLa8D26vUT6QYc5JZK0RSe0qz1Lm
zY1KUwnJwzSxnrFCu35oRS9h0fzjaDL+ZEV71I2sMuNcU1D4odXcIJPlWmiM1TaSJJxW4FYs
iefZ3P9qcmM4VpLYE/YkiO17Y5RSPNLNe2O5BppHvPpDVdhAeBHs7epElX5phoq4/SVQW3rF
3poN7kzjSSQwdo3xKVF3mhLiWgy+Dfk20PrPpV3QLV1kfyDUKJTleo0IzYrdyC+r66bvs4b1
7mkXD+49weDLGAzOgMUNjW24SdG+l7W8B9+/UKtrYkq46EoIYflcxNbjK2QaZwPeDcdHeiwZ
CMNPfUql7bJXdXBlTVKmv5i3iNLEeMaJ8nSF/nGdV1XOWkafeMfkOpfiXL2XNaa7h+ogdDPd
hsxhSjy1wzIF32z/Li5OunncHTFUvBy3x70WhZDOZcXfuUfA+wkO0bedg2lsmL40FgahWpis
3k1unEN1hMfi+25bOI+n3fe6clizIvlEMUWx1pHXoCRg3NPc91b6NWvggQUOuUwPRhMjHF2T
0Oosr25aCx2sRbWZZl1mWLakXmpAUh913iSKaNID5KGbl27HMCMVEjIECLoG3RKQuaE0Jw2Y
1wEI4yennYU4HXjPAlwofOx4sS9dBVTG7AKicAxPrMCcul5gxxjNIIDwKZFZSptIrkzr9y/F
5Xi8fOurmHZcl82k8PR7W0KX8D8DFqZL3uEFgnIcPMgQueij6/rB0PbqNR8YpMJUaByrITm2
FbVQ+NUpIygQaIPbAYlk3SNiS81k+XP0fGPDrCqHOlZhJKRyA++M1UCMCCiPMSqH/BtytvnA
42dN79JUNnXxPI4ya8RdU6f0UwY8UA9BEPyndO7N+rtXpYSqTKRI4MfacBXadsssI7m6bKu6
lgOkHqnL1dfmeDBkZoAxVDGr4GxWi6EDgeXWiYRRySDOdcNhpFwwG7LzvlsFQIYa1LA8dTEd
E5DN28IqnaxiLvZGlY/9x6fC+Wd3KvbF+Vyru3Mq/vMCMGfjYDce1hcvp+Pe2ey/Hk+7yzet
O6OZGyLyoL9bZZqsW7a2AFkmFXXC1QkQBmaEIVF2jQeQN6jyFEBWVU2yKaz4C6a7/fJ37wgV
mEVJZk9zKoJ5MmCEMNC4s0XiLmFaNQR/dbVAwWA8XGlD8xGcCdt7WuRrBgd+QMA2ZxB+m8BI
N6wVAMs6htEBMBjgXugQFZuT4++KPb4cPj29HHbbshD9G4z4vbKkRhCBM8nUv727HRH7lkEy
YXdtjEixCB2ZezBofM+elSEuiW6m05xNrN1duKSs2GCMKqGvDrMxK1ol3c3q46b+QxrdmGyv
gLhcByHvbgJfL2j9S7Zr+ZuAjHmgzwBVkvm2+JE/yCwyqqMQQoOL4FxzgjgcVBITAq1ARhiP
jYQLIkcZx7zOHe6bd0Hla71uKKDqyYmumd0fVeuhsAL7jV6IbF/tW6Aqrxl1MQQSfesVoGqB
NOEQFKWuUbRDYpHYSmiK3kt65Hki7QUD3HMo7BqPOHS+C2tvCHKiW0VTHJDWh3dEdSpVCGLx
coAYwhSTtQkp8ynzYMDXHFSI4nPHEEOQpvZMtvHYyjbEgZJCawt6jZCmE/yH/VUylgnPFHnP
ziGs8oTY/taLXJEFvoR/jkejLhex8bjWx+H99V+2qvtx3n09POB7Hu7BPcIf4uX5+Xi66Pnn
NbKyyn38C7a82yO6GJzmClVpwzePBTaMKHTLD2xubefST+USj4JY8gQL5siIQV3+83YyphaS
upH01ZWbx1m7qBox0sPj83F36O4VOzBUl4f9xVcf2Ex1/md32X6zK4Z57R7gv0y6gaTu4PzD
s2nOfsVRkwe46JKBNruUJKyT97RPpLttZX61R9dqHMlQLUm6rl4O2iJx+foWUJ4M3CZwCTJM
rAV7CMMij3Dj1TFJyxl9loaQqdCyxb/2Ev7u9PQPKvf+CHpw0l5mHnJsuNKtdQNS9XoPO2A1
L7SCcLJZRPtKoB2VqWKFOph+YisB+DnOsb5mb+5rhuD7TgrxrFX23cM1zOc8flAlXe1Nq+Eu
xrseJIvmLis4XabWp78SrVL2cizkY2G8tHwMgK8XZR+r5hkheTPeusrfZsBSwcqQqAsL+8CH
cQ8Uhnr6Xy+iviioz4FFrwAkqMTr6+JHlK9sjmpp0qOmAW1veg4s0WoYr+TAg0YYsP5V1HoR
+kEY/CtS7RMWycwjvbAQykb1k83povqmnOfN6Ww4HaDKSXqLVTTTdyOi7mJRSPsBgCr2+wQa
GhisOnTrFSwoD/J/PNO6fDi+fzs2VzCmyLOo6s8baHLsj8Bm+jjia7vZ7DFH8SyDP8GXYat6
2dUoT5vDeV+GyHzzs8fFOE56DMTlGVZBQMlCIjolvPKrBRL+kcbhH/5+cwbD/W33bHMAShq+
PYpD3J/Uo676JmdACqj+MxItctX2no9NQXSwk6vY9yYWtpWzsQXWmQUO2gGYZWWliTNBB7zn
FT6Vwcnm+Rkr5HUJAhucFNVmi31WpqzQlnK6wpPhG2BHLZNgLULzOy4NXDWdDPC5Jor9oeHY
dUMkG0ikdMo5DVk0LPOGLGGxekkfprQmkYiBWIXyfIkdQ2lvwxBvpQOV89e4XdaGiv2XtxiK
bHaH4tGBOQertmq90L256ShSCcOudF+9OZsbLJG9tzGNBNt0fV52ExljG0T+kDJJy1be9Wuz
5LFeald3ww2SyXQxuflgwoWQkxvegfHyDnSk2OGxPrn0urcGfucyloSXtSe9d6LC0lT18iB2
PPlYZQC7899v48NbF0XUS5dNxsTufGqV+eviLMs5EJiZgkVIp5itDGZEEdNlSAWuJFKKZ4A/
NWmbqFtnAqENO6+KZrLC2vq8p++GAXtQRxnYDEQreXWesoPJdYFzX4FXWmbT5Qp1e7uu4Rjw
BwTimKG6ZYd21v36s25csuyjqQGhrNRueYIG5L/Kf08glwidp7KVZMAblQNsC74+VY9tfeNT
gVXZ/73q+MAvkQcZUZOLh6T+hvCamExK/BR5qVqtzJexLvmC0mFFymbDljpYQ5w/sz6DeFKL
e2Nf/xu7aKT5kgZAbBvDrjsDSEnK13bUIp79aQC8dURCZqyqvIfxKgUwI1iO/apvqP2Nvbzp
EgMbvautRGCjhAHDOp7xGYFqkQzx24O6TIfBkvlkMgTIE9cGg5TMj43CSYsSmfo011Y/qojI
6uPH27sP/YnBiL7vQ6O42kZp85YhtdVCDHgZpuzOWy1JqLNZGglQ75wzMeXL0UTrKiDezeRm
lXuJ/gmyBjQzJx3RqShD8heuUaoDzTkkkrHd+Enmh0MffzFX3E0n4v1Ic9yQOfFY4NstaoiZ
/gWQhXEtMyOJJ+4+jibE7Ptggk/uRqOpdT8lcmLr/a8ZKYHkRn1L0EHMgvHtrQWu9nE3MmKM
IHQ/TG8mtlsrxh8+TnRavHpwUjDGydTyMWJDJ4Y8jF4+srT3VVTVRxrC86ntPQH7WXPIeIxj
JMuERMza5zrRP8gB6wYBdt9ZlfCcyInRPNWCbyxTV1hO58RdW4aFZPXh4+2VkXdTd6Xdxga6
Wr3/YJkPMpP8412QULGyMq4io3Q8Mr+Aa/2kefyGR7Pb8aiOXto0XEGHIk8NmxMhsrD8KqNm
tCx+bM4OO5wvp5cn9dXc+dvmBCHVBVNMXN3Zo7t+BFuxe8Y/dZvy/xhtMzNmdcXAmBYFG08I
1tsSLZylbmCYWqV4hLv4ga092ag1s3qDaS8ZgdSS5MTuPfETZ/v3M4YhLdMNV7A6Iu0pMSKx
a12v5dgGaJW3DD+O6OXr2GPojKd3753f/N2peID//d5fzmcpxc4Oo/pXwfI4GHiBbCiiWNiL
FVdX117TemW3kJnPi1QOWXSRRZB4YnZpeOvS/beNYwoCznE0tsxRY0d6PlcBIYzuwVyS9GFx
eDf68WMIrpf36pkZ2AHLJmHEZNTxFy2NDKs65kBXi3pF7xPUFwGb2YzQKDQajyL1vVPkwcWY
urEWKC3B8lKtm02ukyA2e/e1scQjibSafJ1oTvUci8rxdLwampATFzOrgf/LGINSUvMetLwr
bYMUA42DzRQh+dzp/WxReqwTeh/H4zEy1XwAgwHTyasb/ZRBDMPs/88LOl36Gh9RprF2eYjk
Rr80H5u/jGuOANsChA/JYpbGxHMHgi+TDt/CXiOr3suun9ElS5aFAxtyA8qFNVrWicCia4pO
Iz2n0OnUpydEX6osbDV3x/72c+UjgHrq/2PsWrrktnX0X/FyZpETvaVa3IVKjyq6pZJaVHWp
e6PTiXsSn3FiH7szN/ffD0HqQVCgKgsnXfhAEqRIEHwAzO+NiBzfKMgrT/slFF1uhoGYafL8
4F7xRX2tCtrc0LlesjOjbutoPKemOaHAQCt0vqa3gpEQS4StP9AQ7OshM8m1+NEWFi9aSddE
Yqcj+jGeb+g+tyA9oT1PNpxoPwAAyKVE4KBvAb/hGj6dyYn69B/rwtKl61SsVSvqdpvOJDjS
S6M1aV0N4cb4k8SyPVF3jwTGb+Zm10JbGk3Pa8ZgNNSkX4NiMgwnRaTvFQmsvNlagmX0NT+D
p4FuixZ1XvIxQjcTZprapLNuoQq2wQsEH0osWjoOfCpGiCkIL/Qzv7JIq4tNlV7SHrj3MxV/
wmYA+g7cI/Xd06A70cKv+fxTxjpAF4FwCV1zaWp6SF+wKcZGyLYWVrDQi3B+XdBuMnoOTyxn
SKVKR/NcaNT9hM2D1pKCu6F1tnL9EoKc2AWt3sVMLrqFXvBzAUfMJaOuyOs5igVGKv4ii3us
mhPevn2sUrHSo3XrY5XRy1mR41BcRjQRPeqhh8QP+osIy6HCl/UfszR2HGdDwMumR+lsINpk
JXU1sga1QrpcZ4ucwLF04q4Aw8rm3rYwiS+Tcrok8LnpSIinNRj42iwI2niyuAj2oni0SAnO
qV0p/t2xNDircMQSnh08x6eWDSiVVjXx44CVh6C4B2ra0rOoudbgRcsyV/+gAB9cdzAogefQ
LdFkcI479Lbm6KWuuiPSFUcMTNv2uS5Ina+WYasoGXgbmZrjes/44M+XpuXP1MpF4+qL87VH
WSvKnVQ4BRuzFmap8zP4dNAbiRXpSaPl+YS1mvg5dmdGulkCBn4JGeufLd/kxl7uqlK1o7a2
87TDBoO6EpOanvMEpQOTMJHvxFFVogGVVlgVdJ5T7Smaq2KaZcVvaOFdFbmYatjpBFeRdKBk
Q5FPJLWxzNgH8dN6wirWVhP7ulLJ2QVo9NpuWk2ZDDOstsuPWKp5JWOWdMzqMHADx5KZgGOh
7YlUSZAkrlVGYIhVOjpX5cE3N/G6pmdijWSr2bRewRXLxXKJqBfL2gruhFrkq4beUog6dx9u
6bOZpVh4wcrdcd3MknYyZbGAM9F1TmaOyuCzCrnYerbiFrx3jTJn4wyTL9LvJ61MOeA6e/8x
FSp388W0xXPi+Hb4cS6NkHOaNc1Sp3nSlkjMlHPd8URg5sN7sSIaqHUc7IGIfsYybqbJ28RP
PM9SNqB9lrgumSxIrK0g8Si+gx8sxT4JrcYhMpVe40lxnYQW8bqTsVk4daAHnhwOYU2uenLW
TFf98EYYjhbRlMbu2JyuQ1uVMh3rjyn2zld0MaivF0arX8kB12E2yc5MDKvSorUlh/jk4ASF
3UYkwtrHwHEP9OCZGBIn2sbVA/BD/deX98/fvrz9bZ6hT60z1tfB7uqDuGQ0Sbi3ZLkui5lr
JhaVp41QbcZ33HMFOg7AQm0+E0m1lBWjD8fbtt0Icf764/2nH58/vX0Ap6Np/1pyvb19gujt
X79LZHaJTj+9fnt/+77dZ78p21L7te6Y1kIbaPt0eZ0Y7m+InVw5YY4axfjBP5X3AyLpieeJ
UZsqAx/9gJ6NbB9Ju/KCS2SEmx6c9NDCjHQW9pRS8Gsv9HiFHFMmTO5M2HApmDHcZDphA5Iu
0xN2NvKZPOQ0yvnW4cEPRNtxm8CWc0aTtFe/lWOvlhPXRsaJPku6AQzPOw3QY9VoYiB/ZZ1b
fnu45AeuukajaFxWR15UxoZtMd2yWpj8etQCQeFobQuUkqRMburHLKfAyRd7FWhJlTGbLLPP
ppkuP9IH6/pok1vTd4bzvEM6G2TtzTP8biaSaLALoy9czxwbNykAPHJbVViiAtQMfPnb7Czs
ZnZoQQkOUYgI/iEIZ/P/87+/wM8PP8NfwPkhf/vlr99+g0uaG5eMOXtN8EnF/5NstFxurGRI
JCAYQ0VQ8yc0qwpK/VRvJgVKYD2NzNumA1YcjBDUeRb3JltFzG7RcYb2zsGhKKUsP9iwRdtj
8jc4tvF6Q5Whq8Cfo7mo5yXWuaMa1qzWxbJYsCkqtYCF08OKSCWdxTapVjgMpkgsNAySh8Hd
AUbsptN8Rc5SeisLsWnbzWQ+XQoHOXeLs2+cIS6OrFvxczy41D60nki/hZfdXE/fSVK/FTsO
O4EQfB1Lz5zcadEZXp7zlNtSy4V6cbmQhvnstn6+GR7RMpwbDBm6VcmNGi2+0nQijob1ipbp
Q1FZDm5WLrHYi7rS8yk9qbHVgif4GGgNroFZ5oWeYxEjzcvYC6gLXHoOqbALbTkocDfYgC5p
1nkOff6scclPYdmU2vo8M55f8C+4LaFpXfil+SktazbBub288ue3v96td2RkRAKtLPhpKnNJ
K0u49InjmChEPd3yYHhPKKxO+44NgG3kAmebLxAC9zMEDv+fV3Q5ckrdCENWhS0g6eCefh2s
KBdL2OIyDv9yHS/Y53n+VxwlmOVj80wUXTyRRC1cjWpv+4V7leSheD42htvlVkJtgdzIyNIc
XUBciGNatZaL0gvL8Zm8xb7gcB4j/o+jKK0wf76kLWx43Clm4Rt5TV9/Xnmz53a6gkxkJAMm
bjxrN2xFBZowOxNNtWBKFIoDXI+KynAjWEVortn5ge0LUMJzUzYJyIJ50bG02haZPactqdAb
FVNXqH90TQ/TJ8zIc0E3X8NgfOLDMKS0IlMc9g0LVavlw9Pn08uo4jgs90wRK55U9EEK8JHD
yErPyfsAK8yIzLLm2KVkdqfSo82NlaOz7HcgjpEMmLyyXFlVFXXTk0JIWzTNqC638HCWFzd2
Qd7LCyhMyIzOeROX3OS4wcsXDZVpnZ7kNQkCEto/K5ruaIOO6Lx8xSB4H12BG8vFDwJ5OReX
8zUlkPx4IKintC6yhhK6v3ZHcPwpB6q78dDRYzYtAMwIyJtaa7nqQXw2J3Zcsu1bPrSpdCzZ
7z4lZ2lksaHk8JFBtMl4mgoGhaWmtFVKjQhLdnivhukrGB1Pcx4nQWQD4ySO0XrFROkdU8xG
DVrE0Yn52sWqDuGw5TbW+FQWMVybsWVDxqj1u854vApDz/Vt+UjYO9zJBNYwEKucZZfEdxNb
ZtlzkvV16gaU5btlPLnYPsUcfc/bzV3eHd7gnzHn6cHxgzvyAVPo0Z8G/IxEF7MJfk7rlp/Z
P5CkKHp6qCCmU1ql1CJuy0TMuYhpyHzHcllO5yuvH1nPqVhhOtepaXI9WjJqAqG79aBvOsYq
JjqcJSGP+HMcuTR4ul70l2NQ1R760nM967At6PN5zGL9orcUTkhviUNeCd9yWgd1nQ6umziW
+tWZ0Mn68huBNXfdwIIVVZlysTJqA1sVavnjjvSsHqJrNfbcIj67FIO+CYAKeIhdy3hpi0s9
PbZIf5xcLLz6cHCiu11T/t2Bc90/Y72Rt7cQGxvT2vfDwV5tpWWtnSPv5VE9bQ8izjoxrq1j
9BBb7oXhTuL6cUK7j22qz3rP9e81AM+k3rB8VwF7jjNsropuee6pVMUV7hVjHb8TPDKLcY4+
V5bS9qvO1NUjGdcDKSNWFWluUVSM24c5713P92x14X1d3i+7r1uLruPXrhQmp+HnhDiGJAqt
qqBveRQ68b0p5aXoI8/z6RJepJlNY11zrierwmp0sEce/oPO/gLbyYzmmzYQ6HcuupoFxl1l
ScLBeIBibF4qWk2dKUqodHwjA0Exx4+ke/nke2by61b3RPFMiu9shCp9evd6Auk1rQJD5I2o
zqlfv3+SYZXYz80H2CxDPruoNvInuAc/HPMNNWNqtwZRK3YkqMg9SpGmyxlDy0ciweSEQyCC
VBsR8aYkXQYg8fUmvKUkk3FGEP1qtAEssrDH9kwZLzwME4JeBQSxqK+u84CWTwtW1gm2L5YD
HupjLX5z1Man2on7/fX7669wuYAI3dT39A0bZUHKuFrWSGqdXL4Tbdy2eNuwrdmonvDsDKqM
eIcfY1V08OdVjxeRCO879LqIhKaTMSlVmepqScL6i8yKwPVgspIkHyTPGzPntrkVXVNi74+2
Pm6KpI7QbvBSVa7fjFhI6gFQ1hhvfK74MQ3Ie8Qrh3qFgE6dZX1nia2xMg2sPYvhRRQyjUph
PGV4txsez2A2dy7RJMb7aTr0QL+tJhA8rPpM/GstrdKTgUNlEsYNdT9RNwRT4WvkMetCy+po
YoItRpOJYJmvy5DpmaBcDL9Dgu1yfWp6fVsHQOMeDpCeRKPAhsfwTNaq9/2X1gtM69TOaOze
rF2iekabvDNljgc1R6LcKB1tMpq+YnflvXzbWMX/257lCFm3Rzj6zA0NJA8WRGM2mKxiWBm0
s2BFmkkQa3mmoq6zrTfZZOEymBARtFN+2+6o5guRaVUVlxO9zJ9K2Gwnb2AlxiZd1WeBb1kQ
zTzC0D2EAaUmMMffVAEtuwgtQb41M3F0xQm3WF5oCak862rI2ion57DdNtZLmWJHwp0lXLxx
yiA/RnVqjqzfEkXF548LhS0TKIQeXD/sdG3wg8hZ0H//+uN9N4ytypy5oR+atZfkiFpqLejg
G2LWeazH1ppo4CZs5s4ScuNBQjw7m+wtYwO1GJNqRRrunplEuV2J7kj7XcjmZ8LQOVBxLSY0
8h3jgzF+iAZMM9wgJlLbbaOvSi3wnx/vb398+OWvNQD/f/0hPtOX/3x4++OXt09wo/Lnieun
r3/+BIHa/tscsRloqZ1xmBfwQIMMq2oucg3Y9pKMwQbGDYRcNkfPyqAH6wasqIunzTexnkQB
2ICo1CJSdoAstQjRPfgbdcNZvQm8q8GW0MvF30LJ//n6Bb7Tz2oAvU53WcmBs4Y8ksmb99+V
IpjSap8YpyunOy2zuWsbzajjwXfaVBOIU7QUeyeXTBCkBkJUWT81+Elic2Olg/rZ9iFAbPFQ
9flOS+dTC1sc26Rl5v06IKl4nAZNWpoqmoiY4evXH/ClslXbEWf4kE6twWhBpL8Q/F95U+IC
iWvuknztwWQ2I5ZqHHYnf1XdeRSZOec3uCtqzTa/mfFbTNjqGA94aQk0L6OoDe1YVsVgO/gC
HutgBrCqY2esKupAVZVdjdiVaiIapiyQm0yYcxfKOwLQdkg93a9+pZk+2IDMLiRWuXnmJkLv
O3QAC8nBSvZEW0iyVw6MVjwADnCdz45u1JIGvjxfHut2PD0SLSTm2I0yk0NCM1AI20+Ke93q
QUjaTs+RTcNqM4jEP2F+WmTtqyLyBgd/lI0GW4hy6WjJSjHwZzH8a/nWaac/8S27uRkiD0ed
PnP8AxnZat+I6/Hjf8xGlCR/+QxBm9Cj2iILML7JvQL9UYmW49ewBGHOb7sUAO6skk8fP8iF
tN5QGjhNOfQmxspmDs1FgN/k68PvX79vbca+FeJ9/fV/ydD+fTu6YZLA685m7PPZ32STfqnb
Yl1PhDnk+ASM8pk+venYpdZvh2n8YJKX10s2h+jSihB/0UUgQE1bG5FmUdKh9ZwDavwJgdPT
iNqFmxnqrPV87iR4WbdB0WxnoluEs8sJB7pckMENHXofeWHp65LSJ0ux6RDHke5DPSPdQ+KE
VKlNVlSNpf/NuS4+iJzsh53ogz9ef3z49vnPX9+/f0GeTXP8aAvLtgJisZ1uxc94EFe+di4D
gqD5ZiKMpTAsxOL6LGajWqy6Qnd54LwpZ+80IwnrHs3rz6pXWQxyubQWGkx/ek8tt9ECfiGN
T65B3bxtI6nw9XxnXfGrsK1/vH77JpYQUpaN9SnTxcEwzCH31y3bdtmdJj+uks5qx0g4v6Wt
0cRj2cP/HNehq0TY9Arutm0/nqtbvpFZRqN4oqdc1UzHJOIxPVAUQ3F5cb3YzsDTOg1zDxxy
jvRiUrHZDYMJb3akgKeKyB00iS6O78YHq/OxtIQS3ukPy2JUUt/+/vb65ydjjp/ilLeh0Po2
odL80m5EOgmjtKIurGp91uwMkuoNNBXHtlXnGrAH5Jv8E3Xix1JJLKY2OSe4TMLYzLBvWeYl
03UebWFjtJoafWW+bc1NW3pmzdOOvTRGvC2gH3MhrlvfKAtLjTXjMo8kfkwvL2PfV9tB0vqH
gNrKmdAk9redSynXnXEzzR5WlYfPe6cmhYPaJNoUJoEk2hkg6qoB3dW3jb882bP7UY59Mmwr
Ll/CAvdcN7J3GFYoHi8wqtjlme9NdyK0x34o+cDQ3pVPqGo3MgsQ7e67B5ccLvgao6Jnvp8k
9q7PeIOfWVYKp4Mbb5bY8luxZXWePn9//+v1izn3GDrldOqKU2r46BkiCyPz2pJlk2XMFZJP
y8gS3Z/gmUu5m7IuYBauaTtBOjnoAcRWJOdekHg04t7QWc4KWRfEKws/MbJahLx6PfiX1/97
w1WYVk7gPobEnBZMxjHcAkDFHGrHE3Mk9sSJfKHF+gYSYiZv6uDsIkJ6APRrGjpg2KUoDemc
hDlcS3G+pTgBjOrBPxK0tpPNNNd5YnJUYg7XVkBSkLeTMIsb62oIdybNcIcjYRkintoeVCg8
sFtpd7t1qrlhhzAj8mALoVwA367V0jwbjynspaFQKUNy8EIzjZoMRuiFV+yIqADJTp8OwltY
dhiW9hC/B6ZrJ3JJnknIMbt5jkuNpZkBviAOwqcj5NdHDFpnRXSPypIfLTFxpxoZ+NK+EMlO
otvCjo8ehPqxAnipa4Ln/JGSc4bzfryK3iC+x3h5ojfFlkrD9ebd1jKsoeUrwnKekN+kq99m
JwNqkozltajGU3rVgwvOGcHt19jR3R0NxLMgnj5/z+LKzu6gG2YzBDaaZY0ys1innzV7+a13
earej0K6268sWeBGHnXOqlXEDULscjBjedHL90EUUxRSNpaWjzAxD/62qUQvCtyQaEMAvJAs
GaDYD3crJ3hCke+OTMAhvpKlgPCQ0PctdJ5o2CuA10c/ICsgjWTPpbvB3L1kT4WP5B3Ig/SZ
r+tDxydatusPQRhSxV8z7jqWnfGlevnhcLA4pXeXsI/cZKt9J9yYKuTP8Qm/MquI03GVsZGv
Xvd4fRdG4XbrY3k7Io99F10k1ZDApSVHLNR6eGWowQdG24xGQGgDIlqg2nRjoXl8esDqPG4c
74t98HQttgJ9PLgWwMeeLjoUuPQowDxU90QckUeXHMT2kmN6gC885/6ebNwndwpWPBPLXpcU
YGBjmV7mg4rdTNqiyIna9UNLZp2J/6SsGzPjYoGVsSXdXWaunKN935XsWqqmpliLF9jMxMKH
Ma2P23zL2BWGe0kDiVeeKCT045BvgcldAETZgqcqdBM9oIcGeA4JCBMtpWosAPrW7QTL7U3d
tXJGzuwcuT7ZQ9mxTslbgxpDq780sNBh/xPrxwXqk3hL/ZgFxOARqrdzPY+UDV4PTU/kQdzM
ISeVkEwsodh6Kc/ksx4s63yH/YGqePa+kTRVQkIdA+C5tpoEnncvV8/aDIEX3RVb8OzpPulT
5ZLDECBvT5UDQ+REpHQSswTHQzzR3hwHHAeix8l9qdjzLCULjLThNZbIonsk5N+VO4rI8CGI
IyS7voQOd5pVVOBAp85aX0z6O6n7zHBeWYCWe35iWWcu+Xex0F20f9Q69WWkUbl0ujryyQ5b
7851ArYloxa+Gkx0EEFN6MwsNrPGsF97wbAvDqUhq5r+nIK+O/rrg6VJDqFHOuEijoDSRhIg
jMM2S2I/IqUEKNjVBJc+U/uDjPe6y86CZ70Y6D4NxDEhjgDixCGmlUsrgwJTFSiT8KBVucU3
Xhe+2nhvXrddvYi+NIx47ph9RwiqW+5NbmLmHbOybEkx2IW3125kLbeEa1kYOz/0vP3xLHjM
EKQET8vDwHSeMZl4FSXCGLozNrzQudOCciaN95S+4PATesKcZpz9+qhp5U59BJPn3J0lBAs1
pSsNnRDdFpAgoJY3sOESJaRSqlvRIvt9qq2jOAp6ekNlYRoKMefu67fHMOAfXSdJ9/SOmCoC
J/CI0SeQ0I/iwxa5ZvnBcUj9AZBn8ZyfeYa8LVzPchVu4nmpIttrNTMLP/ac8sBYcLEkIz6b
IFMraUH2/ybJGWk82C95L0ubuhC2CTFDFGKpETiEhhSA5zrkNCCg6EY/tLZIVPMsiGta2gnb
nYIU09E/xGQWfc/jcF+AOorIvYjM9ZI8cRMK43Hi2YCY2vIQLZFQX5BdUnXJiqBTk4ig+x6V
UZ/FtFV1rjPSo2lhqFvXIQ1ViVCnVojh/ym7kqa5cd78V3xKJYfUp73VhzmwJbWabm2vqN58
UTkez4wrjj3lmTnk3wegNi5gt3Pw0njAVVwAEgTIFQOQVws2srzYHIAl9p9LO1fOkjQhLZgX
jsEPfKLDrkMahAT9loa7XUgo4Qikfk41F6G9T1l6aByBO/GzbpYMxBCd6Kh36wZ8Cl7BJjAQ
MsYEJQ3dzCTYnY6OqgJWnI7Paru4QZjpc3QoNbuZhI4Dne4xFx4xsIEL02ebwVTURV8WDToK
np90jnlRscdYi188k9k4OljIagzrhYbhoWSg7aHnqlXmgufFkV2qYSzbK/rZ78YbFwXVUpXx
iCdS4sRcHmSIJPheefJE9aQT9Lztyr6sJDKgUb/862nd3HXaDsG7CxUYzMoKY9HJuAtPuZzG
+4vhzdOyJnvVpyzqxeszvuUlMTUBxAGGnxD8oEbEA6r2A7qsVx8Ny1QZR1e9dOoF1YmLB/RD
z/PSSICuXJ/kt8A6dfKLuvoUp5PqTCSm2ypOjtatvGZ/7yrTAa2praRTMzLuyGPFKbJQY4RJ
8lZ9AxDHigntoZ3KX6LH76wmHcOrbKZDeYmZbp+3F6m//fPtE/pzdka+qY+5HcIPaCwb0n0U
O9wcIoMIdz69tS4weajX1XIGLMZ5eiI2BOnOc/vgkkzSqxk+lnE9I9+4TlWW0+ejyIOBd/Ye
eYwj4cUmcPuQMmfjLnujGU4ngW7aS280F6/5IEd+H7SuJg0fVlR/TrqSU1qhWnHHge+GO7+g
NBFQemElqmYBmM98j0E0a0ZcJ9gri6vh04pL5ZrQ8twM+44X+giXbChubX8WY0k6hZEfKvND
zUpDIVLtXKBnDQXtNyEd6CF44glIsbKLt0JB/Ro7JnimaUVIhXKsF9QzXHUAkz68EDHeAWPR
UyimrqZfIEiON5EErikkDWSzujVCHCB0LmrabhnBNO3qVDVb3ojWQJfkxHNVQTGN0KnLSwz9
O0j6kwEyMaSUEcUGqwYUKzWNbGq69+yKof0VUa90v6cPnjY8deNDEiaUhraAumorqUVzDPxD
TU2D4oN0DNBZi47pOEvB+mK4mPxddoxhttLT9ZId/MizdwM1z9X2VyUuhhZaUX0WD3FKqUAS
PafqayBJmqwnzHxEkT3fnwSPdsn9Wa1FHav++1aSIddI+vmRwvDVVjl2uMfPu2WxBJ+Mnof6
y6cf3z9//fzp7x/fv3359Nc7ib/jiztx8uEusjgc0k3YstItRso/X4xWVfkMQ2+05k9Pu3VG
dLKtN2npLk2tXKraHnGsqhmp5nUi8T3VwmmynTe8i7odn8kyCXP7jU7G5FzhwN/ZDbBeCihA
nLh39zlH6oR5hdPEzhnpe8fpqcLwfNdemWhHMDMLrO+hdiQ33KrIC59If8CAgWGfjfxb5Qe7
kJRoqzqMHSuNrFEWxumeNiKW+Ft9T+lTfYSv9zR2fw7QO04NK8lXrFJ+tJ+lKGRXHGuFQ3vl
uIpv6lsJ2Tt1bBzDLdQnn/xWmzuPCaZmKWlk7t3mgc1GswXhmU5IUojE3tOxJytEXQrKJV26
Fcx3vvEKRcVAJHVvo1sGT5jEgJKaWzWyXonqDcjyfRi58Ukiq31vNLZm3U2OS/FbuqMvSjwT
0VwLLiTTvnwDpsCq17YamHogsDGgS7ELq9AgS1yMZ9UbFx7ryFOdlY9s7pYAZLzS9VhJ40Kp
kfj4Gw/qtaluraGAeRw6hCiFSep6TwvZhhgBbUolkfmkVj3N3FSydERXiDTMd5yEa0yBYyUw
mKjbDmWYsCYO49jRyxKlX0htTOZBx4ZM2tDTxBPLNVa9CW0oF9U+9ByVwyveYOc7XGGubLCZ
JOGr8YiSyu55TSUL+TGlATo5hGyhQMcc+5DORL4yVVim7ZAsHqBkl1CQrWvpWKxLRhroetqo
MaVJRNZJQgn5tS0ty4BUG2EDomeZhHahA1q0P1cj04CWIRS2J96Zda50T18Vq1ydD4LnS7Yu
jvyX9erSNKZtwnSml+t03b3t9sGrdQa1UscBo8H0arwjU0BpfjpLnDq+m1SPX5SBD54j8g5U
4+noIrpjen+xcXXHy4fC98gx3l1hOdXNlgzwxWorefZk3m/ojX528ULkLuGLOIxXl6/Xjbdn
ojsUff9AlzVanAqHvyElqa6fK8CqpdsQCGt0pfshot3hqSzmIYKK1dcXaxWltytoVYIg7rDi
UNggDy95tRUBVxo4BEaDa0ddL2w8aNfiJyG56inqMZE7okHosMPV2WA1ej4VFxXbXRJq2D9T
kh9Sx9cGk6Z2m1hEbsCU9qyhUrV9WvRVv03fAFNR0pDIc8xxOQsrduAH0ut4Zvoxz8YpCN38
u+K9Fgrp0B0lTYbDJfsQ/dFlAPaqN81+bIoV0Oh9FjvoiUJfywfk/XXNiSgfL6Db5kHmKVjz
aB254q119zzfGrSS8yEns77XHUnn0xspqsQ+q2uqwO0jZrMnaOpQKivMT4eUph34ketFyWCi
Eu0dyvHKgA+FXT6tJi6CQ54Nlj8+/vkHnuwRLquuJUPHtkQjcvXFPPzAICN8zFU/YUjNu5Fd
7rajXYnJ92d1TVFFUR3xkbGOnWsxu4G16cfDBm3392uGUJFaYIiorq3a8gHT7Eh9G0xwPKD/
oNW8QC9qAjFgJauqNvsFVny9uImhKtgZA38L6USAti0AZnR0PMLXyUEJ72v0XuioE1QfvrJe
lWEwuu7as5rsH+Ak6SW6g8Nbb0efujBMJ07QMBIV2Uk+ylod5Hz+9un7r59/vPv+490fn7/+
Cf9Df6zKfTWmmvwx7zzVl8FCF7zSPHgsdHSwOIDquk/vT8DY8j3jqpCsMetryjG+7JMWppKx
dc/Zqqn0RD3Laa/eCLI6L7uLXvmJNppTaSZn/EzS8filG6zRP6Ml6wcqpuvU4qx79+/sn1+/
fH+Xfe9+fIc2/PX9x3+gF9Dfvvz+z4+PeOZk9gV6TcKEZGf8VIZTCOwvf/359eP/viu+/f7l
2+fXRTpu/jd4NB1yLsGwnxWk9mfTXq4F0+4YZtI4xxDPhju1mhrM03lbTJIXG61fQhqua7L8
2e/eRVCXvUrdpUuHCqMhmcPhWtLu9hGCGW+MLHP9rUtWanGg5fjOWI9uUk95zQmkuuZGtm/3
SiccWtAajKVMRjEYrbnRsUY6utfGTvfx2+ev1mSVrCM7DOPDC7373Ut2lLWnworlgvADq77u
LFBhERcxfvA82EjquIvHZgjjeE/dG29pDm0xnjgeMAS7fU7nizzD1ff82wU+YkULwht7ju4z
Xd9xYrG7faILXneu1hUVz9l4zsN48B2XKhvzseB33oxnqDSISsGBOQ4ktBQPNBI8PrydF0Q5
DxIWepS1wJaGV3wozvDPPlSN9gkGvk9TPyNZmqat0EG9t9t/yBjd9vc5H6sBKlYXXuzS4jb2
84nlTIyD8BxmBQorb8qciw6tSs+5t9/lHv3KQ/l4BcuxVdVwhvxPoR8lt59PAtU/5X7qePOu
DAVWiwt8jyrfe9GrVlTAd/DC+M2jVAedr4xi/cHbBqMu0VSpF6WnynEOpDC3V4ZtkrPMcYRN
cifJLqA1bJJ97znOyTbumjUDx0AG7OjFu1vh8O6xJWgrXhf3scpy/G9zgblC26EqSXouChmw
uR3wymP/qgmtyPEPzMAhiNPdGIcDfVqzJYG/GShZPBuv17vvHb0wal4OdscRz8tUj5zDctbX
yc7fU5ozyZsGuj6sMLXNoR37A0zSPHxV52VwiyT3k/znuYvwxF4tZAp3Er737o5XpY4E9f+j
MmnKPJBrRBQHxdHxLIJOyNhPF9MeIW/q5EvhLfi5HaPwdj36JbmtSB28eoOx2PvirnvQs9iE
F+6uu/xGHtcR3FE4+FXhzJQPMDRgdopht3vdSRo3dWrl4E33V0f5eGjBsnsUROxMO0W3meMk
Zme3YjgxD3k7DhWM95s4vRzxQwfMuRekA6whr3phZo7CeijYTzF3pcueQGHsL9VjFop24+3t
Xr5awq5cgIrd3nHm74P9qy0LVtGugDF77zovjrNgZ0xVQ9afBUNN1jTM3hUZbEE02XIzdDr8
+PLr77ZOmOUNevygHTFIhhOMIbzeR+32iVi1yAhAaqRvpyenBrAZwWpZDfvkySaqs13ubs0J
hcURT7MoixQp+KPic+IdvovLuzsavpbFeEhj7xqOx5s5L5pbtZ4HuTQV0M67oQmjhFjtUWUe
O5EmpLG5wRMZ+ojgOHF5qrlmmQC+94K7WRySA0cMxQlHiXkeHk6u4cQb9CSZJSH0pg/yrZu1
FSd+YJNxEu0ehWAzjj8MdGe2ysBp+webkXRIINlg6z92kW/0KZBFk8TwnfVb4CVJl/uB8ByX
eVLHbBg6n77Df+5JGLmKV9l2mhWGhuadWQktYRK48pdBlvLrLvatTUaB8AzOPc9xIahPeZfG
kUsj3NRkfepP5JGdDiO75KQDdJVvOgq0ljt7rdKLKYaGXTnlDVn2VJ915cWsWn0XR8f575jx
vgd9+K3QTyvw3g/h0z0N4x1ts77woN4WBPTwUHnCiF7nVJ7IcYG08NQcNsfwzREhembqi451
Lq+XMw9IA/GLslBgCOMnS7g8SXoqfIA6UDSDPIIe3y68Pxv6PHrRXwNJyl3p+OPj/3x+91//
/PYbxu1ZjzDnNMfDmNV5pQXkAZq8d3ioJPVbLsfS8pCaqC5kkKu2vFgI/DnyquphE7OArO0e
kB2zAF6zsjhUXE8iHoLOCwEyLwTovI5tX/CyGYsm56rDKYAO7XDa6FvjAYF/JoD8lMABxQyw
PdhMRita9RkodltxBJWqyEfVOhyZryXTgixgLZTjvI2K93jzAbyeNZ5fYfOHKSSqPTb+WAJl
Ef6l8XvIee1qcFfT+hEmfICaGLhOT4CBweYM3UQdm8oxIIbB+AAtyHuukGbYW35uvNvBIS2D
1hkZzZHsaKvbDTesJDeAPFIFuOdX6lgRm7NTRRP8YIunbDX9RITFCYNGgrhG57VwPcTA3y4F
nQf99HbDXSa22ArXJQV+tOHhqz4LVpJjXAJo1A8oY0avuzNaUuaRM0aXIkLjp7UQCXbVDFpX
km6dvJFZlunhWRHijpHXFC0sM1zP6PzoWyODMCejxwBybdu8bX2D/zqA5EprCTi1QQotXPOH
9Wcjs6525pSxvoa9wAXLtysuEL38lPchit0z3RmGC5s42RObg7hAZbslg1ghfIB+MSb6TJPv
fMs8MzOc0SfDfpLtnaiAxcWjjcRkF+18Wv8kN2K5yB4+fvrvr19+/+Pvd//2rspyMz63sg7j
yWFWMSFmSwKiV9aJoTFqNh8rx3nIg5g67dhYzNefOqKbPW3YbG9JdtLGJW1ZblVBS4Mbnx2f
wmIhnhlrYJqSb+IMnp0jA2kDTB9DbEyLIdgLNsrTsMVkPf7eqnKFZu7I6H8b0yFPfNUQVmlm
n92zpnHkbX6JeeS+GJ9LKSCjoHsNZXGFTRIWRFIiMTUe0MdasnDLEmXJQbSXRnXzavwYl2Bv
CqnLap1wuuVFp5NE8bbNGYXes1sNe75OfA99Z1NG3nQXvFnXzgYRbYVAExLi483VG60QdbKa
vSQ7ks1h+kBaaFq1ixGDiYiLei5+CQOtldNN9dhW+cg6o1Vd32IoVZ14LfpDKwoJujHeDEaH
LLKT1qDpznpO9qQ37v2loXPIhmq8MrybdHr7UD7H+0LGtbP9J6iNsCKhTqPhgoG5rE8ih8ml
rsngmTOO42UsrrA120PMHktbChghNgT7o52m7i6R548X1htFtF0VGmFAFSpmqCMs2++mwz7r
U0l3FJS8M30ko0Ys91P1NYGkVSI0XKVJKo8jx5WZxAfO72SU0xWU2o4xpdklTX27MKA67NAX
mHaOh+AtMIr4MISh5rALiIch1S1ZV6I0DLPCO6pjmXm+auEkaTW3+ra9P8qimT+rvq5IxJW9
iAI14MVMSzSHYCsNZNjbmAtjVcyG+9GoTc76igVWT5fSB5mzpyv2qBhpUr3lGZF5OrwgrnmS
/kFxjkzPLVWKrgciqchObehaGTio8XqY5o1KHsttcP5eL3pJdKfI+XuDDCuB7519kmjP4Rmw
BmHRCN/hd31FfSuR8Pch6bZyBpOUSpKk0+bn/FbHOnV5csONDgbeU5B08I0dmBU+CN5GryLR
Hk3yXWV6d3XIAhvryrntSz/wAzO3qq0ccaQRvCdREpHnFNPuXAjQb0Izz4X+oi9rfmektRmC
TR3EiZlxl91PLjGi590A8poh9dRFGFikfUKQYoNPWhRc+aEwhIVZWzUkCM7SwFyQZiK1yktt
sRXWpLzeA5dXTUAf9dEI6z3FI87/U9olKiEt5HAzlg0grI69QFQWNiqHjiW8ASDlTEe/I94X
E4FKOwmTh+JpBh06EpOWw4T0CLjc2jG8WDUUtIc8nXO6IXlS4MQmeFmzqc0kfrVX2g1EFeBl
CdOxoyt/IBZ3Zg4mBYed1RYGdJx8OmKwSWN5dzaCh17s2n+UYUN/XrwGljc4glcYYhqmfsEM
K4BZGVpHql3PvqA6oe6gh6j+6XAsgEwChX4ofkkiawVEGWCkRyXt7EGu7rwvbtysykK1BdLc
OJqYZJnjzbU0C/Osdc0ePTk5x/WhOLTUfZVWOdiBuedZu+eKD0xk5meh+Op2oEPZLlxHl5PD
adUk/bAg8mjwQmKK360vetIulkgmpfrJ/fe00PHcDpB+4oriDD+2sGcwDpty0DxFAQ6KMFn7
y4m8DMIct+E/+an58/OnLx+/yupYbuqQn0Vo8abXimW9Grl8JY3Ho1FBUGhd53cSveDQd9T0
UFRn3pgZZic0dHMkyU4cfj30qmXtpWS9mU/NMph0D2fVQLfO+bl40CNZ5itXIjf8gHktKHED
Ufh0Zdv0hr/OjQpd6cy5wNc0lKNWCVawf9V6DxQfoCE6qSzqA++N0VYe+9rsp7Jqe946bpuQ
4cpB98+pVQhRKFhaJOoFnR+FTrjBZth2ZtlXXtyk6OIay49+eQGkpeMYwttZYT5QxxyIvGcH
1W8gkoYbb07qbeTUqAYj1g92yVXmDPuFaGF0OOwx7bW1MmlLjpPOkYu81ajhkxT2mK7wiN6Z
7rE4w1SofTENOp0qo9uL9jgY5Ba2o94cS/WlGjjxlZuB64S2B4lHJ3UgMcCMhkGmWd4rZPdQ
74qBVY/GWIk6WAKqLCeJxuW5iqxHr67CZj5d2lQREI8MoGKNtE/MhFUq6MlisM7LtPUHnySY
6QTjhtCogdJg1EqDMbhMb8wqPoCIo9ccSEUlYJ8orJpDCV11cS1rfW188hINkZngyrRaScR2
IWrQot63jydFDPzaGnO07URhTi209yprkwby67CeLW5GIQrdPdwuuN2OnXqvKZcuzkHMMNaz
O29qo5Yfir7FZqkFLzR3oR8eOWyt5vScPHKPp4s1nGckg/agBwH5y5E1q+YoIIsvOUIUWJ8I
6uLKWiTaXsmZTe9WGzyWLeyndGBzK/9VxFaIS83R60F7yrhu16F2A3K4X3/VtXIj3N16PM8t
JuK2+kzkJ5ePkEDG2LX0VwD+JfJ/oSfmd6fvf/2N79j+/vH961e8aLTcANeZac+AJJGfMt0L
10IcDZXZxqvhWBO54RdgPRN6T+mwXCecrd34BvKtgMaT37JanDKqIrg1N+qFzgYd8V89otwG
1rw6FMxxAiM/Bz/CgH/SANotHiDZYaeaTSLpiu+xc2NYIHCB2vCkbyvSq2C96vX6abws5Y34
qifx5m7QbPjp/ua1esGzddUdpArXd64Zfai3sbA6cUQ2rUHwHDh5dI4H1frOiL+ma2+KNlpu
uRVMyhOwp5Irl+Q79LhTNyBej6cbPl5vyu1FM16dEnZTMiFjgx84/C9PDE3oBfGeshiacBEm
UcysmjOMhkLbckw1zuokdLiv2xhi6pR36pne8/zI12O6SqSofIyb5pEvRCSH9MHoWQklmTpw
WdAkCqhEyT6g/Z6sDB5pISDhySuQMSTQjU8c2oXNdCvms8qje2+dqoC+SiOCGBPt6WLaF/mC
xvf/Y+3amhvHdfRfcc3TTNWZHd0lP+yDLPmiE8lSi7Lj9IsrnXjSrknirO3smT6/fglSF4IC
kz5V+5QYgEiK4gUEgQ+AKlugxBI9T03XMhBdqhaf9CNvuZGPY2c6Mg0Y1nEjFXtr6DAMF6PS
zcmze6mAxMET7A4hkqutG31S964puETpl2IqkGs2tuMxK/JHD/YgK8YVIHVQjjbZJ43rT/XB
NbijoHEo8b40apPEgIKjU/PEn9qqRVwWQeCO9RPL/9vUcnD04VNIKyxjrr3IXXuq19IypEFe
W98mf57Ok2/Px9e/frV/m3C9Z1IvZ5PWdeT9FRAUCKVu8uugH/82KCOyW+GcUGhN6NGC8WsW
+Y5/JtNrAtzB6BG+B+9ndw2tU8m+FvjB7YwzlU3BIsnyl4Vr41BZ6Vz7fH/5PrnnWmVzOj98
/3CLqJvIx/EQfa835+PTE9LgZHP4brREHjUqeexGgrgl38VWJaWpIrGiSY1FrOb80MSVo08L
IRw1ET9Ro/kRJ074sSvDfqNI4KMlupPp8t6IsSQ69fh2vf/2fLhMrrJnh3G7Plz/PD5fAflD
AEFMfoUPcL0/Px2uv42+Wd/VdbxmGe1/id80LlCKCMSs4rXqNop463mj+RJpj4K91jxwu+7c
SGz+fmTNYBKPXmtmzKEEnrCQNgWi60kMtybBFn4gaNoYkFYJ1zLvaGLnevXL+fpg/aIKcGZT
quq9QtSe6lsMIiOXH8RdbzUkHtEfnDM5dnEzaLbCM9m6WUDNCwMKXicCnlIfS/BmG/oxrbf7
FuqoPw5Dq0bm8k5YIuJioLKWFc9m/tc5M+BM9kLz8iuVlmIQ2BnKT5nuEEsI4HRyCifQwzU1
kdVdEfkBCSTXSuiQ8B0dUg9PEYziwNCAQlUGTsmgsEzZIDoRHbmwIzM/cUOHKjRjue1YJD4r
klBRLjROMObsON0fk0XCWFUNRgwLJzFGPPfD7hciHzxNZmLou9Wzm4j6RIK+v00bqtzZF9eh
ToT9zBlg+8acERp9/6ESAJj8aA4wfniZ4pT2HWvBlQDSg6wvnU8fm3hTTvcjuj38CYMPdScy
L/jJ0QBY2pWy5SIGpGtFhAZQ7AWiyCK/MEv51I9GCyjYPT5cruD7TomxKOjemC7WGHIOCQ4V
wakKeERVgh6aiiQzOKCVxQ7IjzY1oQ0Mn9XjH/xjEVgyvI/WBbm2kR3CJ51j08ib3cNJhTJA
1jKV0D6Wd/vdngMfEdTXT/eelPHjteHjAEfmSPx4CeFNJhZkMXinCVm25H1adr0LpAuIeKfq
+f7KDzAv2gtRQ8D5cLHnAlpYsMohgyrUTS+CRJtFlt8ZSggM+byQiAGieRAJnc+LCT0ywbsq
EUXEdiIeJfallDmeRc3gUbiIyjHk8eqXmebGDpv4wxnhRU1ETknguB+9Iwj4U2IxYkXgeGSb
Z1+8iAQ96odd5Sdq6p+ODoOW2AVGYLAt/evd+ktRdaP39Po7Py59NnZba/cHjVs0/D9yN2qB
q0cLhhZP2TO6fFL624euePne64QdXi+n82ctX5Z5usgwkN3gpwBp87Y6fKrE5Sji2WYxOb0B
bp+yQLG7dQKhwqo/0q2gDoSNfFj9yJKyL8rtvI2EJvqyFRoFJ7T0DqvUgL0khfghWk9630Xv
4zfqKo03uxYRZHgBgFHFd8+p54WRNVgQh8s6ySGbdMP4gKD1hKzgNbMkyyD+jHZxaOzgxgBj
wp9xqHvVKq5FCErVovf1ZAlJJZhDut2WXJfic/qYLI3x+4IfT1FwZ9Xi6JVNz/tFOR62PceP
vPvS4PqiilC7jMLX/By019qoFmP+Y59kaMwBqRJzYL7O6i9EVSCRAryqlMClxSoOLBDYvE5K
5o6qgKBI6Y1lqGI9b3a4qKreqEd4IBWLAPtVbxekKQY807oIkqEE6a+m/4Y0dAgyoiVrV1E6
ewZujOS3aQWE/+y4sgJH2CnkDhHhA7TmVjqFZK+QHpkPgM1igS1u27SibnS2Ipvs6F0Flfc9
/aqCu2VaCInGB+8Z1t5NE1gS8qoYMrddTn9eJ6sfb4fz79vJ0/vhckXX7F1yoU9Euxda1vO7
GXLRbeJlhl1CEsDIHTteZ3zQXK73T8fXJ2VbkPCzDw+H58P59HK4aptFzFdAO3BIlK6W5yFw
X60oWfzr/fPpaXI9TR6PT8fr/TOY/Hj9V6TgxmkY2coJm/92Ilz2R+WoNXXsb8ffH4/ng8zY
hOpUXrAJXR18ENf3WWmyuPu3+wcu9vpw+IkXtX0LvWjoBeqLfl5Yi5AFreF/JJv9eL1+P1yO
2vtNI5c2+giWR++IppJF0evD9V+n81+if378+3D+xyR7eTs8iuYm5Av70zbpQ1v+T5bQDs4r
H6z8ycP56cdEjCsYwlmiVjAPI99Tu1QQWpgB5Y0lWfMUUAavqSppqTxcTs9wK2P6wEpFDj/T
6GhtbS2fFdN7zRATtntBGfzuY297uRTsR16r7dR4PJ+Oj0qnCfxwPL+kyLjIWRnXtDKyZPtF
tYxh26f2uHXG7hirYsVxDjAUFo3+ex8vC9sJvBu+tY94szQIXC/0RgwAOPKs2ZpmhClJ910D
PUQ3MC0HcI1s0ianCLg4NA9x6EOhKuJR5g8koENUdBwvojx1kEAwetcqSfkkGHdmHUdR6I/I
LEgtJ6ZaAMiepuxnnci8Yj6J+dUJrGwUjtmRWWo7amirQnctopGCTpfjujZN9wm6RI0i6RJ+
EtMBbUqeB/Q3b3IWORYVp9IKbBI7sMct4OTQIshVysVDyyOquhV3UmVjcJ0S6koXnEIfkW4Y
r5Maha2+IdT6WvU67xgdPNWYI0MdhoWiJZtccHt+uSQfK8sKbjfpRagVMrlmd/w6vh23c5vN
apyxsX9pATiYQhaJMVNHjejoJqyTjs9ocLmereIDVJkn9k2ZJeT+8tfhihIjdKgNmNM9vcvy
fbzL4BstMCZONs9TqEy7EhuGQ5UYMaS+5EvK2nHbOjOrP1vkgXy+5YezSL7F/BXug4UrQ6vb
wjZ4ORwmt0f+iGAQRotbQ2pPyKDFRxrL3CCk26tkegdh+tsQppDusB1v5/skV9zw+A+RX6Qs
bzaK+aYThGCvCk0IaRrQCulpgzVKVeA7JnUTZpCb0rZFRai7M6MKYJmvIfzRMuqaiVm2Z+J4
nrlSMlRaEUnSZB6qC7vGQ4kGVR6DEbxPKkPVfGLAXzqQX5HbJr6hhDYb6WdfRuZ2haMuUZHE
aOKVKG4Zq1u+BqwBwaCb+cnz6eGvCTu9nx8O44sB4X2yLxdDCZJS1eUMZ2uGkA/AkOXrShN4
M9zy7uhB1dUVXMRZPlPD6as8bhYlIDuulDcA/9g63hdItH12j3MKZbyjNi0oymACE0RTtqT6
8HK6Ht7OpwfSujkHX/2xN0Cve48eloW+vVyeyPKqgi0leNISnDWAQFvPheA4OnCoGlWhLGEA
rQPBjOOLPf4Sv7Ifl+vhZVK+TpLvx7ffJhfw9/rz+KA4m0v9/oWfVTmZnbDVt9PtCbbEwzqf
7h8fTi+mB0m+PAbuqj8W58Ph8nDPV/Qvp3P2xVTIZ6LSV+i/ip2pgBFP3Uzy4/UgubP34zM4
F/WdRPmAZc18B6GfEHDLlZo818FG2zp/vnRR/Jf3+2feT8aOJPm9GacE//Zuwu+Oz8fXv00F
Udw+xOOnhszQGRVk59ou6jntpT7fNQlp7uMnx7JWtKJMNTFmYCnsTHQj2j5BMS0KIy3oYEss
Ml8vNdS8sRj4jA+pshX+DehCe3kFoZBbty3VtKhw5b8qDpPyzEhU1Mp1UeGtJkUcVYTdjiCv
WjJZ4tC0DtyINtn1lgdpsEPntY5IuVvE6S53PWUTbQkYorEjatnjBTl0xgYVjU9jfs6K2Fb9
UfhvR4OVK2LPoIfOisT2LYkYSV/7xA6ZnjWNXfXYxUdUnaKUZ4Iw1QgY2EAJxBIN2LtUNPbN
jqVKOeInVvAlCfX0zS75J6T0UZwoisR1XBS/Eoee748IurmrI5sCY+IQJXfmhEjLrcpJU98A
GyV5lGGk2CX8q6nt2yWBg/OWsyTWIxoUq9MNV4kNyCKcN4v1lD//D8ZnCa/Bp2bexHiIh9bU
rmkrDphySSwkYKgu4GDMDjTj9lSbo5xCXXILRqSJeiF9JOCswAr2GcAeCIh+vrvR0wNJmucv
P30Ya+IHkz11ZABWZGktDqf0MBIs+nohjKIQddkUR14AxaPXtHA63WHRqRfQvlt8cRSngTil
1qh4VznWDphKSzgtilraoPMnkHvY1ssZ9tI1PwaXFdx0NaPsEv26EnmuMnFWuxD7vUj3S2Md
eZM4Xkh9E8HR4jCARKZOkxyl7yHLvOUg/y0g2TYZkyRZkS7tkOdL4LiBi+qaIsNYkVSuY+0w
wXPwQsVJU5ssf77ef7X7z9VS1/EmROElfT7ufaZ914GzNXX7IMIlDE5AMqG2YZQxwPITeYFl
UAw26xd80NDPNaJGC6Vd62gqlFRH85jloPEkGbZjk/BjLdeKmG2NSrOdiFn+mBzYLHCCUSW8
CEMSCskOp4Y8bpIduR61zrbMIIqICkXokeGhwnX9nT6FIV9Gnni+IdXBdhHYluFLtCf5XVfi
f3pluTifXq/8yPGobEqg/tVzvlO26QJxmcoT7QHw7Zlr+dq2FrkB+harIvH0K4n+iNgXIM9L
3w8vxwe4/hP+RPiCq8ljruOuiAB0TWb+tfxIaFbMA1JNSxIWqatAFn9pcZcUHSJ1LYHGRKsK
AOJRAxIpW1aG5E2sYgbO9ms0paPZR/0iHa+Oj53jFVzcJfykJ/KnjjVGeU7AAYcaezgJDKHy
ZPnqUClYWwRrFUFpRGBV91zfJnSy4gLtc6sNbRMaF4EOLo1WLc1Deq/Gaz9se6kt5wmfMvdy
oNP6mm8F6MLXdwML/47wb8/R9C3f80yqDWfReoXvTx0Is2JzVDZQtcL9qUvt8MDBlzicEjhe
bdDSgRshxRF+j89hfjANDMcszgx9dMDjvzWF0g8Dk3rGWXS0uGAZezAMLcOywHkkwADX2lzL
VdsZRepNWFqVAISOVuyUeZ4BrJQrMXYQGCLBuYITkF74ReC46s7JtRHfxpqQH+GRxHUPLyTv
OIEzdfAWyV/Aihw9JlYyfD80JdkBdugaco217MBwZpL7Fpcw+Hp8MOF6z6HH95eXH629abSC
yPxcI4Rm5MmACmgTohz+5/3w+vCj9y/5NwSvpin7o8rzzq4pDdJL8Mm4v57Of6THy/V8/Pbe
pqce9PsuLBsZsg3PSff07/eXw+85Fzs8TvLT6W3yK6/3t8mffbsuSrvUuhZcSdfON5ykf7u2
If9pNUMKgw+7By2WTz/Op8vD6e3Aq+726uF4w+zAwoshkGyXIAU6yQm0F93VzCHjNQTL85E9
Z2kHo994l2hp2nq22MXM4YcLcj1T9srlXV3uVXeOotq4ltqGlkBuTfJpuCKlWRCm8QEbYp11
drN0u+yp2vQafyKpNhzun6/fFRWro56vk/r+epgUp9fjVde+FnPPo33yBMdD65Vr2WpgXktx
kHJB1acw1SbKBr6/HB+P1x/EeCsc10ZrW7pqyJPZCo4WOMqRkxzaEQGBIgE2e6NilDXMUZEa
5G/8zVsaUkNWzUZ9jGWhNFsN6iGn6PjaXa/oPSCXSr7cXCEc/+Vwf3k/H14OXEd/5z06mpGe
pU0sQTTsVy03NFmhBJdUo2dFps3BjJiDGTkHSxbxDjFnb+kEaM3lptgFaJ/M1tt9lhQeX1LM
hSIhumAQ4dM6ENMa3TuoDDTfFQalh+asCFK2M9HJxaPjdb3WbXXmAaAWAJ8Mx2+r1OEWQsaP
i3QgF+IUlv6TzwqTVhCnG7DaGEZU7tITjTP4EqZEzsdVyqauuoIIylTbGFjoOuQ0n63sEO0K
/De2DiYFf5T0ZAMODnbjFJeMt0sAlsbXRIPAYLxeVk5cWWRQkWTxLrAs5ZaoP+KwnG9/dmTi
OEixFjSb1A3VK4R8DMInOVVdUmgt/2Sxjo5eV7XlO7Tlr9bBZ7b803sJ5WvPNwe+f+ClqaXR
AXDrMjaEhJZVw0eNsrxWvNECxwgtubbtuvi3ehnFmhvXVWOn+MzbbDPm+AQJz9OBjKZ8kzDX
U31VBCF0xh+04R/PVy2TghAhEzSQwpAaRpzj+arn4Yb5duQgn7htss490y2IZLr0kr+dF3lg
kTHQkhUqfbbNA3TP9pV/Gqe7ImzXLbzGyPCF+6fXw1VeppCrz000DcnLD2CoB84bazrFduz2
9q6Il2vjVqDKmC4oONO1P1MYoIR5UxZzQH9E2mKRuL6j5ghsF3dRJ636dU3+iE1oht2gWhWJ
H6kR0hpDv8PT2aaO6OTqgk8X8/aqiZlKu4uLeBXzP8zXzWNdwAo1OOSweX++Ht+eD3+jQ5Mw
ULVo2l0RqmCrPT08H19HI278RbN1kmdr4osqMvKSfV+XzQAh3G/SRD2iBR0A0OR3cL1/feTn
4deDft5tM0R1VjqDKwIAu9f1pmqQNU8RaMATFvxaPylIoJ9QJkG6sa3K8MpVehFRfv/69P7M
/387XY4idIWYymNg0RYpP1vrGbf79eLzCtAR9e105arQkXBY8B119U2ZrcEfgMnFo401wMF4
DpJEAaSAMQZt3ECw3ZEphy/a9FID4rTO1FS5fqIyvDbZJfzjqeeDvKimtkWfIvEj0oxxPlxA
0ySOYrPKCqxCAR+dFZWDPS7gt34aEDTtNJDmK76r0DEgacV10E/WYAGVjrScyqJDWLOkgm4m
Lxar3LZVvwLxe+T2IKkGr4cqd3EZzMe3jeI37pKWhvQIoLnhaP3v3pOgkscIycEaiu+pZtBV
5ViB8uDXKuY6cTAi4OI7onY8GQ2W4YDxCnFG1DbP3KmuhahKA3quHZGnv48vcDaG5eHxeJGR
bKPxKbRjX1UHIcVcLTz09lt8vzuzHUMYW8XXKOJD1wsIq1OvLVm9wJZ3tpvS45YzfPXAA08i
vR50M9d0tNrmvptbRNbT/ht82D0/F2rWr54Om2qGBAg903XKnws9k1vg4eUNbKZ4SUGm82lE
T12++GbFHnDdizIpNxq28nhRaOYF8s8u8t3UCmwDOK1gkvtAU/CznDIjxG/krdDwTdQAFSNY
jgFWON65duTT4aFURykHo2ZGj45iDllC6KF8O4ZHg/j0h+/Ht3EuEc4Bb2708fP9IqNspgDn
UMd7FMreXlnznR5dWY8q7OurIL8jij4WcYF8+0syB58Z+ao2bwwOtnKNWN1N2Pu3i3BVHd6p
S/mEQm5mSbG/KdcxAH87LWvos9VdB8Kxb8q61rABSbkUav9MiMX5lsZSBakFy/dZsYuKL9Aq
o1iR7bgaVWT8QPBhpdUu3jvRutivGPn9kAx0g94FZTLPS7hRrdM5jXKBe7wvGEKmJA7JsJ83
ZOq3IlHMVfyHhoDNCXmlQgbGaL/njfZGo2AclLpO61LNkdMS9rNszUcwH4M4oBdxF5RFQyug
hRn471++HQGG8h/f/9X+87+vj/K/X8xV90Aj6nwZR82mMWW0EeiHw4uJn1K3V9+oJYMvEUsN
GZCkTE2BKa5uJ9fz/YPYkvX1gjUo9wv/CfalBlAdtEFHyABcJJn9jkuIiz/V8FJAUEPN5xCn
sBIhwgy8HtRUb1TLXzS1KXeTPJw0K3KcE13Q1Q6RysrQkmEqFXxaLafXiCUiXZB1nBe1L5Z1
L8oMCqcumGyVoLGe2a7FSA/smXzAemPzfMct4mS1K0c+2KqYDGTEG4VozKKez7/OW77Zq6mC
eSM39FprXz1fZqojS7nQ6LjB6YJKBrVg6muzTKZFnW/361LNkQicNoeHHn2psEZeLGORDzIh
gBRLSmr9E6zZfBRNycllQm66AHPP+2w3mPIVmwcVm1JswCdtGU4dCs2k5TLbw9oo0A3wvMDq
0VfGdpdxHArOlsp/7ZVg146cZ8UM5zkBknSDTJqadjgW9hD+/3qe0Ds0H2AgQr1FydDkkyHN
o+jV7qwsM6ananDO4vjMlTSx9aEOb7Na89WGgbs0I6sHXsky3vmJgk0w30F4mhoV0lH2M4je
25cV6iLAUtoDgz6vLABNJqnvqgbNJ07eco1Ive3sSWM8rIE122R88K3Bq30dN5uaRNZZMIm4
pVhfeoLy3QRJ4H1TZcTjR75syoYawPGmKRfMQ+nOJW2Pd8HFBhKkUU2G9M55fIeKGGiQ7Cqr
+QDbp2quJkogzm9jvqctuHpa3qp1K8Kw8VNbuSJSzJs4Kau7boIn9w/fD8oBbcESvj7P8UcS
JIGzT58DOolVxppyWRvUgE7KDLrcSZQzyMnOz9WsIWdM22ipmF8O74+nyZ98wgzzpVMW9Vz1
gnCD905BA0T5BmVnFeQqBuSwcp3R7u9Chp9p/q+yI1luI9f9iiun96qSGe+xDz70Qql71Jt7
sWRfumRbY6sSSy5JnpnM1z8AbLbIJqjkXeKIQHMFiYUgkIQgxu9rnIgy01tVQtNe27N+chtW
AmZeXWukAULUKGyDEuQQ48k2/tmTpRKh7bnRDqW4kvHvME62SDnizUSNuTN1LE0gTMwfKpr6
zafldn11dXH95UQLp4YImA+VZvT8jDN4GihfdVuVCdGvagzIlenkNIDx1pgBEn97NUDi32WY
SJecnWaAcuLu7eWv9JaN8jJAOXfN1aVzFvV3PwPItQNyfeb65lq/Sh98c+ocP/9MxuyMGTQc
YXGVI921fKBC4+uTU4f3/hCLu6FGHAp56OoAb7jRMTirkA4/MydNFTuHzF1o6/BLvr6vrvpc
09+P8Mw5du6G1UAYEN4kj6/aclgdlTaOqkCFaMs81bNgquJAYKomrhxktabMGUiZe3XM1nVf
xknC1Tb2RGJmbO4hoKHwQV8UBmhHCajqh3GyJua0V2PwbJ9BdJrEeqhJBDT1yBDAmyxGGufu
7/J2equzEEMQlQ76i6ePDVqDrYiqmJxWbwZ/gwBz2wgUf5GzczxUlBXwecxtDfglCJs6b8Q0
iCJUNSu5Vcqd+3K9xTaMQJIVMg+rI+uzCBopj6aiIttfXcYBay3oMA1ujvezAYmXmHs+Ekmh
a5ksGNNwRDefft8+Lle/f2wXm7f18+LL6+L7u2a/UdlI9t3z9KQfVXrzCX2En9d/rz7/mL/N
P39fz5/fl6vP2/mfC+j08vkz5qV4wcX5/Pj+5ye5XpPFZrX4fvQ63zwv6O5jv25SxVu8rTc/
jparJfqBLf+dm57KMQg/OChQELI8MwRDAuVZK3OF75OpONQpiYwqvBNXaXx8lxTYPaL+BciQ
RntBCQmnT3QSbH6879ZHT+vN4mi9OZLrsR+6RIbhjT3dzmEUn9rlwgvZQhu1mgRxEenUMwDY
n0RGHFmt0EYtszFXxiL2wpvVcWdPPFfnJ0VhY0OhXQNG+bJR4Wjzxky9XbnpXidBDl3P/BB0
rMrzQaml0MtW9ePRyelV2iQWIGsSvpDrCf3hHterMTd1JLKA+XKYvdOEyigSinCLj8fvy6cv
3xY/jp6Ihl828/fXHxbplpVn9Ty06UcEAVMWRkwvRVCGFR/2QtFuysuuaoKa8k6cXlyYuTSk
df1j94reAk/z3eL5SKxoaOig8fdy93rkbbfrpyWBwvlubo01CFJ7TZmyIAJO5J0eF3lyb8bm
6/fqOMYI//auFLfxHTNRkQeH251aG58ecuABv7X76NsTHYx8u6y2yT9gaFYE9rdJOWXWLR/5
buIquH7NmPaAv05L8/JFTRoGFq4bXvNXva2q+M5a9QgzoTmmK/XsfkVc4UyOYNjiXWo+IlLu
LIvtzm6sDM5OmeXBYqbq2QxP3UPD9RNvIk55466Bwqne+9brk+MwHtmkzXICjaiHbaUhJ5n3
QHsfpDFQNt0G2rNSpqHhpq92SOSdcIWnF5dc8cUJwxMj78wuTM+YEYHYJoSf87akDmdaXJiv
zCTjX76/Gn4J/da3aR7K2pph/1njxwx2GZwzXfWTfOqI2KdW2ksFKBv2eR14Mh6m8f5Wg9kL
h6X2fIfM2Eb0197mkffACDHq5OSWwnU/0cPLgs+C168wN221OMhq6mk+nFS5vOu3d3QcMgTZ
fhpGiWk7647Nh5zpwNU5p6n3n5wz1ZxH3En0UJlSgfSama+e129H2cfb42Kj3v5xncYkgm1Q
cBJdWPpjFTGegbCnpYQM8h3rMOA/7mEjhlXlHzHGdBXoP1HcW1CUz1pOiFYAXq7toU5Bucco
BzHlbTBsi7vCPaoelZXfe6jISITMfbwnZsgIxwG6zmioY3xfPm7moNNs1h+75YrhdfiMhjt+
qJw/VOjlzc84CCLJjaucVRw1SaRD242wWPHNxuNOGyxXDApE0/hB3JwcQjncX4X20x4P5L3D
/XYwq2jKnKd3bRSPsvbr9cXsMNRBnYjj1XDsowB+aBh7ROze8Tl3V6Wh9ik0uHoqbyRmgxhk
NlYQAGt1dTlN8nEctOMZV4lX3aepQIMKWWPq+0L3U9gDi8ZPOpyq8Ts0zYmzR6yLVMfibv0v
jq/bQMCgR3GAl6PyZlSvr5gE1VVblPEdwrE65+0pon5VKWH2VRlQ1NWwFr0JvLnE4MtC3pzi
vSZ1JzaNHPJQwEd3f5Kis6Wcydvly0p65j29Lp6+LVcvmh8M3bzotrAy1hmBDa8wk40JFbMa
nTn2k2R9b2G0tEPPj68vNXNYnoVeef/TzsCxhJl9q/oXMOjIxP/J/Dvqju8XpkhV6ccZdgqW
N6tHN/0rRNeJi/lbvLItMS+QYT5Eh0H+ttuPQdbERDV64PDO9y8TddvUsX4dFuRlqEvN0LNU
tFmT+kauG2mk9BK7TkzFE+epZxhNAtiWwGaNIjPRIOJIfYHd3kEb101rVnB2OvipO42Z5bBf
hX9/NWhwD+H9YDsUr5x6jjzbEsNnLd4AuzSkrMD8padGj31bhwuM7sKSh3mqjZFp8QHZAHBw
U0p8kExtUApCI4WqN53osRT9j+zycxYbJEa+nK1l9oDFw9/tTI+60pWRs2Rh48aePqddoVem
XFkdAdVaAEyRYdfrB3/os92VOuZZkTpZj82A9uR6c+clbS25UM8UqjyIYc/cCehZqec5gzME
94vusCiLKIuYsY+wPEw1PSsD3YWyNQEame+1JkMKsRgkXonOgRFJuFqHyiCi+iiXHOKO+odc
P8MyUpv3KAjFgOxMYwjK8kwBMJ5lYUJ7UJHniQkqhYXd+ZUoyN4bFGtKOREDISgDc2nt9oC2
4hVyNcO+yALQSkouR281TiQ9aF291Y/HJPfNX8xplSWmy0RPaHWexuZpkjy0tac/ai9vUa7U
WkyL2Hj2Dj9GodYYOtyi72BVl4ZLKXCSUBR5PSiTzA64A0bZPd6DkEWy3roWFzPvdJSoQKXv
m+Vq902+0nhbbPWbHs2tBTbXhEKu887dEh54Qy/4nrORhyymvaA8Cf3FwVcnxm0Ti/rmvJ/R
TrKyaugxKCdf15FQyHyGezK6zzxYxgNeRAaGFW6tl0JSP0cBVJQloBsB65zz2BsXlt8XX3bL
t04U2RLqkyzfcLMuu4JqIeeRVkL77dQrs5uT49NzTaIEsijg1EO365S/yixBWSWFFLBYhEjg
Swp0DQP6SziBvdu0cBZg6Lk0rlKvDjRdfAihnrZ5ZqanlbXAwYae0E0mP/GSGN8lO2yg+idT
4U0oBDWmMGVdvn511mnayZSyfFL7JFw8frxQXqp4td1tPjDIhSYPph6qMyCX6q9NtML+ulIq
/zfH/5xoblQaHmgKseeeY/0WWZXQcTfFf5nZrOjKihBSdDY9NI2qJrykZXpA6T6IzUzGoRHQ
HH+zFTd+5fH3s780veZI0SdOT3kpS9EHTcnr3aVvX5nmxofHBagnGB9RN4LKOhCqeMZgUnqQ
Mtt0C8mffNhKPs14pZB0wTyu8sxQZvbtwFYc2T2QnoyceYYWpJsbkFsS2ADDan9Wjs6AxOul
pnZyeXx8POxAj9tfuY843WCAjE6uGPI6s0ck2ViDRzjvXBFEIE5JLJGFLfx0ZEGS9d3x51ZH
HxS2n3wHOF4UkMyELorIPrMc6DWuYSpaLwz797umT8GevAbnXyTfmskbIkQ6ytfv289HGAjt
410eNtF89aK7l0JzAfo05NJ1mitGj+1Gs3NJILLfvNEy2KKfdVP0oZa10zcf1U4gMkoMmp3q
aNTCr+D0XdMmHVtoowZms/YqTkKb3mL6riAKu7RXvQ/7oRmTfkNwaj9/4FHNbHFJNUqwNAo7
Y6peRp7IevNc3eb64oxPhCjk7pUGAryn3Z9d/9m+L1d4dwtDePvYLf5ZwH8Wu6fffvvtv5rt
AD3lqUpKNNglfTGMCCWmhnY7zlMNOILhtkZFpanFTFhsQkuwY26PHn2wb6ZTCQPNPJ+i79GB
PVZOK977t8uGhd0dyORYBtLtsDuOYil3Q1cE/wnOIxn5VVZsfTzUPBA9PglwaZL70eoCdE8w
I+f3eyn7/yAF1So990KNYZR4Y2vJ7HI6EumjfRmJUjC5bZPhDRpQu7RQ2Cs6kZzEvsymjfdN
MuLn+W5+hBz4Ce1k2knVTXZsTk3HvGw3e5P4HFI2AektRQwCJmczQ/6XtaFXo2pKoUUGcU0O
dt7se1DC9GR1LGNPyduzoOGOEn2xDdtP0LQUm9pFRohw6GNg8I4KDDT3M0CEitvqgOpCfSRn
xHZM5AUicZyHLM2awzdnC05pKVeXA0MDmq+y4L7OtZ2YUUQXaE3jLCSd9HL8YSj0tIh4HKWK
jQZ0LyuQOyild1Qwu2g03aPI+vBFezv4WH4WmAciKdDDZDiUgYbwDaEN/sBpUbfVNEZ9Zthz
rapOpq6muvGkKIVIgZZB4KdPQSzM6srsn9GeMkAMG+oQNSaiNEI14p4wkIsjC1PfcGqktVra
8yRmqQ7qzgces/aVAaPDmw5OXJbi33C8MGMgg4yscsnn7W5HUyBXprcmhVSZV1SRbmkZAJRe
OVhGSUY+HLhAA3Isg8TkBkxYmpXO8QnByzIM3oRZmehL9g1bjwynvkKzScKGdJ2xZ6m6z+pI
kjpvI5ADlXshzoZcxEQjWuZNdPtDStsfhzFVy15Clj8cN09SElEeAfinKauYzeM1DvK7fgqH
p0pXjW0RVIDag9O9GKT02x8SFkbfQR2H7v7wvRisILfA+vS46tNx+iedtL8pnw9XbeVh0Grz
ESsVOUWDt+XTZv34ff7vgmWThvhiCLIdg2G/182P9WK7Q3EJBf1g/ddiM38xYo9NGl5vU0ID
2t4oONof0sSkjy0fETm48bl6RS0fYTPoxnFIinDfrFuzBH0S6U1OlRErAjgWncawrjKFOfnf
7KXWSVjzei1RD117VoNkkSZKGmdou+McViQBGgzDV6IlEb9Nbj5epBwQW/AGpMqTHJOAOqQj
405msIWUZZ0VwKm7kZiFTVq4x9uZwOVzCcc51uFVQcEHJpG38oBRs1FICdzfEeuFflwb1yNU
2DRmQmgqnNG9k6tyfGc7ks9z9eISjf41mQ6teXH5kBIUzgX+vIwzDPPhOKj1Gux01/3xVSfD
AVu2dkmJIg2ADR9cO7o3jw+Rs0gPI9CzELSj8WsP3zuVt4OnkfVmRN6Y/A84WKEHF7kBAA==

--TB36FDmn/VVEgNH/--
