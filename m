Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11783D456
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 07:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC9A825;
	Fri, 26 Jan 2024 07:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC9A825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706251937;
	bh=PdqxiRDyZVap8F6lMugV2lhDbAfQ2juSj92Mwx3od9U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g7m/4mzc8oZakIYjj5A34XO48NyD+iTYwKfREL6KClXvgiUbJp8Id78kds/Usbwk3
	 hyk6cVmdSh3MWcq1I+soBkwJ2jOnixaSX9yYTo//A10LLtKhPdSIKlrrGDEikFvzYh
	 2GTuOt/gi4+JE89nf7h1/AwYUaz6w/8fbxDG1aig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BB9AF80570; Fri, 26 Jan 2024 07:51:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C645F8057D;
	Fri, 26 Jan 2024 07:51:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15435F8028D; Fri, 26 Jan 2024 07:50:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4A3DF8022B
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 07:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A3DF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JUINyY4Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706251843; x=1737787843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdqxiRDyZVap8F6lMugV2lhDbAfQ2juSj92Mwx3od9U=;
  b=JUINyY4QANVvGqgV0cDxjnR8oZsl5Z7PTSmD2fbO3i2Upf3iUlmW/dix
   kWPFMQ32U1C0LmhEPc0ND4B+/LPeKwBvzw26I0CH5ZSEZ4loqoiMIkjg5
   frOGXNzB6ZequEP65vbfYQC0mLtojNLOUqC6aoR4H7Qdf8nwX5NBbL5BU
   9jwKP/GsiFRvgHzbut9MnfGkhPBe225yXee13VuoXapmBNQ1joIXayEKJ
   k+8I8BUR8Mx17ZQ6gkNFjv422C0eaOnxRjCw+OoFwe2haP519pGvjJLvB
   9pJOWMGjpXNdyJP3F8jaK9Uy7spd6bZoBFVUcIkDJRId/yv+j9aJhF3Hk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9084730"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="9084730"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 22:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1118182993"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="1118182993"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2024 22:50:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTG2r-0000me-2N;
	Fri, 26 Jan 2024 06:50:33 +0000
Date: Fri, 26 Jan 2024 14:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 9/31] sound/pci/ens1370.c:1988:2: error:
 call to undeclared function 'snd_ak4531_suspend'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401261439.SV1NYR8a-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 3QU5JBNPN45XLSA46NRSZUVIXD3CFS5S
X-Message-ID-Hash: 3QU5JBNPN45XLSA46NRSZUVIXD3CFS5S
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QU5JBNPN45XLSA46NRSZUVIXD3CFS5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   623b2f6110ff118b84628595d53e4947f2883329
commit: e2a78f52bd0f02f34a84d1f4437dadf3cefdca79 [9/31] ALSA: ens137x: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-012-20240125 (https://download.01.org/0day-ci/archive/20240126/202401261439.SV1NYR8a-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261439.SV1NYR8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261439.SV1NYR8a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/ens1370.c:1988:2: error: call to undeclared function 'snd_ak4531_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1988 |         snd_ak4531_suspend(ensoniq->u.es1370.ak4531);
         |         ^
   sound/pci/ens1370.c:1988:2: note: did you mean 'snd_ak4531_mixer'?
   include/sound/ak4531_codec.h:62:5: note: 'snd_ak4531_mixer' declared here
      62 | int snd_ak4531_mixer(struct snd_card *card, struct snd_ak4531 *_ak4531,
         |     ^
>> sound/pci/ens1370.c:2003:2: error: call to undeclared function 'snd_ak4531_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2003 |         snd_ak4531_resume(ensoniq->u.es1370.ak4531);
         |         ^
   2 errors generated.


vim +/snd_ak4531_suspend +1988 sound/pci/ens1370.c

f31a31b9024f21 Kurt J. Bosch 2005-11-16  1970  
68cb2b55927885 Takashi Iwai  2012-07-02  1971  static int snd_ensoniq_suspend(struct device *dev)
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1972  {
68cb2b55927885 Takashi Iwai  2012-07-02  1973  	struct snd_card *card = dev_get_drvdata(dev);
fe8be10786c040 Takashi Iwai  2005-11-17  1974  	struct ensoniq *ensoniq = card->private_data;
fe8be10786c040 Takashi Iwai  2005-11-17  1975  	
fe8be10786c040 Takashi Iwai  2005-11-17  1976  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1977  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1978  #ifdef CHIP1371	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1979  	snd_ac97_suspend(ensoniq->u.es1371.ac97);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1980  #else
15f500a6994e55 Takashi Iwai  2006-01-12  1981  	/* try to reset AK4531 */
15f500a6994e55 Takashi Iwai  2006-01-12  1982  	outw(ES_1370_CODEC_WRITE(AK4531_RESET, 0x02), ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1983  	inw(ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1984  	udelay(100);
15f500a6994e55 Takashi Iwai  2006-01-12  1985  	outw(ES_1370_CODEC_WRITE(AK4531_RESET, 0x03), ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1986  	inw(ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1987  	udelay(100);
fe8be10786c040 Takashi Iwai  2005-11-17 @1988  	snd_ak4531_suspend(ensoniq->u.es1370.ak4531);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1989  #endif	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1990  	return 0;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1991  }
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1992  
68cb2b55927885 Takashi Iwai  2012-07-02  1993  static int snd_ensoniq_resume(struct device *dev)
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1994  {
68cb2b55927885 Takashi Iwai  2012-07-02  1995  	struct snd_card *card = dev_get_drvdata(dev);
fe8be10786c040 Takashi Iwai  2005-11-17  1996  	struct ensoniq *ensoniq = card->private_data;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1997  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1998  	snd_ensoniq_chip_init(ensoniq);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1999  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2000  #ifdef CHIP1371	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2001  	snd_ac97_resume(ensoniq->u.es1371.ac97);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2002  #else
fe8be10786c040 Takashi Iwai  2005-11-17 @2003  	snd_ak4531_resume(ensoniq->u.es1370.ak4531);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2004  #endif	
fe8be10786c040 Takashi Iwai  2005-11-17  2005  	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2006  	return 0;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2007  }
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2008  

:::::: The code at line 1988 was first introduced by commit
:::::: fe8be10786c040bce53c18048d75b1b23aec64ae [ALSA] ens137x - Fix and ADD PM support

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
