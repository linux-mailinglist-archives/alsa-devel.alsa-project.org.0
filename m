Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCCD2ACE94
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 05:39:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE35F16C8;
	Tue, 10 Nov 2020 05:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE35F16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604983158;
	bh=iEt+i+Y4MfJiYd1EmQ+7GdlUpYuG8PsRvibKbMJ6zOI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aZUga1uhxuFMJVWFoEVpFPX62ex1nXZ3B0nKWRyAN3hBaYc4WHd+pm/4YW+KVw9s/
	 4+NdM42rYtyv9dW+8l1SvKEQYVepX5aoAQixTxGLZzk7YqWm1+e2dSloCHrHOjax8w
	 /2s+jZ2c7jJuOVE4SOa+Hu3Q86IrtxkxavmOv22U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 618A1F8021C;
	Tue, 10 Nov 2020 05:37:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05CD4F801D5; Tue, 10 Nov 2020 05:37:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C61DFF800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 05:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C61DFF800EB
IronPort-SDR: mHwooqbyj/EDtSYs1vRzyOv8YKUyvtn6dH9orsRttlgEMW4d0fvWGqg56cvXPaJvHwvN1QAZVd
 A19dvkr6L3Fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="167333209"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="gz'50?scan'50,208,50";a="167333209"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 20:37:34 -0800
IronPort-SDR: rbVva5CskGd7zqoT963JEPkjcDzozft2YYPAg5M6/z401+MVulhexUB99R+hgu6+SrOpRKymkv
 tyKMGbAiGOxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="gz'50?scan'50,208,50";a="473272691"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 09 Nov 2020 20:37:32 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kcLPP-00001B-Dy; Tue, 10 Nov 2020 04:37:31 +0000
Date: Tue, 10 Nov 2020 12:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [sound:test/usb-hacks 14/20] sound/usb/pcm.c:579:35: warning:
 variable 'altsd' set but not used
Message-ID: <202011101227.9SNcnWug-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/usb-hacks
head:   2adedc89c82670019ee3b016d2a2237176768e3a
commit: 7502ae0cddc65ab020cd3c3dc4085f3e70f70f21 [14/20] ALSA: usb-audio: Track implicit fb sync endpoint in audioformat list
config: mips-randconfig-r025-20201110 (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=7502ae0cddc65ab020cd3c3dc4085f3e70f70f21
        git remote add sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
        git fetch --no-tags sound test/usb-hacks
        git checkout 7502ae0cddc65ab020cd3c3dc4085f3e70f70f21
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/usb/pcm.c: In function 'set_format':
>> sound/usb/pcm.c:579:35: warning: variable 'altsd' set but not used [-Wunused-but-set-variable]
     579 |  struct usb_interface_descriptor *altsd;
         |                                   ^~~~~

vim +/altsd +579 sound/usb/pcm.c

71bb64c56d787a2 Eldad Zack    2013-08-03  571  
71bb64c56d787a2 Eldad Zack    2013-08-03  572  /*
71bb64c56d787a2 Eldad Zack    2013-08-03  573   * find a matching format and set up the interface
71bb64c56d787a2 Eldad Zack    2013-08-03  574   */
71bb64c56d787a2 Eldad Zack    2013-08-03  575  static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
71bb64c56d787a2 Eldad Zack    2013-08-03  576  {
71bb64c56d787a2 Eldad Zack    2013-08-03  577  	struct usb_device *dev = subs->dev;
71bb64c56d787a2 Eldad Zack    2013-08-03  578  	struct usb_host_interface *alts;
71bb64c56d787a2 Eldad Zack    2013-08-03 @579  	struct usb_interface_descriptor *altsd;
71bb64c56d787a2 Eldad Zack    2013-08-03  580  	struct usb_interface *iface;
71bb64c56d787a2 Eldad Zack    2013-08-03  581  	int err;
71bb64c56d787a2 Eldad Zack    2013-08-03  582  
71bb64c56d787a2 Eldad Zack    2013-08-03  583  	iface = usb_ifnum_to_if(dev, fmt->iface);
71bb64c56d787a2 Eldad Zack    2013-08-03  584  	if (WARN_ON(!iface))
71bb64c56d787a2 Eldad Zack    2013-08-03  585  		return -EINVAL;
b099b9693d23d03 Takashi Iwai  2018-05-02  586  	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
0141254b0a74b37 Johan Hovold  2019-12-20  587  	if (WARN_ON(!alts))
71bb64c56d787a2 Eldad Zack    2013-08-03  588  		return -EINVAL;
0141254b0a74b37 Johan Hovold  2019-12-20  589  	altsd = get_iface_desc(alts);
71bb64c56d787a2 Eldad Zack    2013-08-03  590  
92adc96f8eecd95 Hui Wang      2019-12-18  591  	if (fmt == subs->cur_audiofmt && !subs->need_setup_fmt)
71bb64c56d787a2 Eldad Zack    2013-08-03  592  		return 0;
71bb64c56d787a2 Eldad Zack    2013-08-03  593  
71bb64c56d787a2 Eldad Zack    2013-08-03  594  	/* close the old interface */
92adc96f8eecd95 Hui Wang      2019-12-18  595  	if (subs->interface >= 0 && (subs->interface != fmt->iface || subs->need_setup_fmt)) {
8a463225b110474 Takashi Iwai  2018-05-02  596  		if (!subs->stream->chip->keep_iface) {
71bb64c56d787a2 Eldad Zack    2013-08-03  597  			err = usb_set_interface(subs->dev, subs->interface, 0);
71bb64c56d787a2 Eldad Zack    2013-08-03  598  			if (err < 0) {
0ba41d917eeb87f Takashi Iwai  2014-02-26  599  				dev_err(&dev->dev,
0ba41d917eeb87f Takashi Iwai  2014-02-26  600  					"%d:%d: return to setting 0 failed (%d)\n",
0ba41d917eeb87f Takashi Iwai  2014-02-26  601  					fmt->iface, fmt->altsetting, err);
71bb64c56d787a2 Eldad Zack    2013-08-03  602  				return -EIO;
71bb64c56d787a2 Eldad Zack    2013-08-03  603  			}
8a463225b110474 Takashi Iwai  2018-05-02  604  		}
71bb64c56d787a2 Eldad Zack    2013-08-03  605  		subs->interface = -1;
71bb64c56d787a2 Eldad Zack    2013-08-03  606  		subs->altset_idx = 0;
71bb64c56d787a2 Eldad Zack    2013-08-03  607  	}
71bb64c56d787a2 Eldad Zack    2013-08-03  608  
92adc96f8eecd95 Hui Wang      2019-12-18  609  	if (subs->need_setup_fmt)
92adc96f8eecd95 Hui Wang      2019-12-18  610  		subs->need_setup_fmt = false;
92adc96f8eecd95 Hui Wang      2019-12-18  611  
71bb64c56d787a2 Eldad Zack    2013-08-03  612  	/* set interface */
b099b9693d23d03 Takashi Iwai  2018-05-02  613  	if (iface->cur_altsetting != alts) {
6874daad4b0fbed Jurgen Kramer 2014-11-28  614  		err = snd_usb_select_mode_quirk(subs, fmt);
6874daad4b0fbed Jurgen Kramer 2014-11-28  615  		if (err < 0)
6874daad4b0fbed Jurgen Kramer 2014-11-28  616  			return -EIO;
6874daad4b0fbed Jurgen Kramer 2014-11-28  617  
71bb64c56d787a2 Eldad Zack    2013-08-03  618  		err = usb_set_interface(dev, fmt->iface, fmt->altsetting);
71bb64c56d787a2 Eldad Zack    2013-08-03  619  		if (err < 0) {
0ba41d917eeb87f Takashi Iwai  2014-02-26  620  			dev_err(&dev->dev,
0ba41d917eeb87f Takashi Iwai  2014-02-26  621  				"%d:%d: usb_set_interface failed (%d)\n",
0ba41d917eeb87f Takashi Iwai  2014-02-26  622  				fmt->iface, fmt->altsetting, err);
71bb64c56d787a2 Eldad Zack    2013-08-03  623  			return -EIO;
71bb64c56d787a2 Eldad Zack    2013-08-03  624  		}
0ba41d917eeb87f Takashi Iwai  2014-02-26  625  		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
71bb64c56d787a2 Eldad Zack    2013-08-03  626  			fmt->iface, fmt->altsetting);
71bb64c56d787a2 Eldad Zack    2013-08-03  627  		snd_usb_set_interface_quirk(dev);
71bb64c56d787a2 Eldad Zack    2013-08-03  628  	}
71bb64c56d787a2 Eldad Zack    2013-08-03  629  
b099b9693d23d03 Takashi Iwai  2018-05-02  630  	subs->interface = fmt->iface;
b099b9693d23d03 Takashi Iwai  2018-05-02  631  	subs->altset_idx = fmt->altset_idx;
71bb64c56d787a2 Eldad Zack    2013-08-03  632  	subs->data_endpoint = snd_usb_add_endpoint(subs->stream->chip,
71bb64c56d787a2 Eldad Zack    2013-08-03  633  						   alts, fmt->endpoint, subs->direction,
71bb64c56d787a2 Eldad Zack    2013-08-03  634  						   SND_USB_ENDPOINT_TYPE_DATA);
71bb64c56d787a2 Eldad Zack    2013-08-03  635  
71bb64c56d787a2 Eldad Zack    2013-08-03  636  	if (!subs->data_endpoint)
71bb64c56d787a2 Eldad Zack    2013-08-03  637  		return -EINVAL;
71bb64c56d787a2 Eldad Zack    2013-08-03  638  
7502ae0cddc65ab Takashi Iwai  2020-11-05  639  	err = set_sync_endpoint(subs, fmt);
71bb64c56d787a2 Eldad Zack    2013-08-03  640  	if (err < 0)
71bb64c56d787a2 Eldad Zack    2013-08-03  641  		return err;
71bb64c56d787a2 Eldad Zack    2013-08-03  642  
d133f2c22e9cb7b Eldad Zack    2013-08-03  643  	err = snd_usb_init_pitch(subs->stream->chip, fmt->iface, alts, fmt);
d133f2c22e9cb7b Eldad Zack    2013-08-03  644  	if (err < 0)
e5779998bf8b70e Daniel Mack   2010-03-04  645  		return err;
e5779998bf8b70e Daniel Mack   2010-03-04  646  
e5779998bf8b70e Daniel Mack   2010-03-04  647  	subs->cur_audiofmt = fmt;
e5779998bf8b70e Daniel Mack   2010-03-04  648  
e5779998bf8b70e Daniel Mack   2010-03-04  649  	snd_usb_set_format_quirk(subs, fmt);
e5779998bf8b70e Daniel Mack   2010-03-04  650  
e5779998bf8b70e Daniel Mack   2010-03-04  651  	return 0;
e5779998bf8b70e Daniel Mack   2010-03-04  652  }
e5779998bf8b70e Daniel Mack   2010-03-04  653  

:::::: The code at line 579 was first introduced by commit
:::::: 71bb64c56d787a221752b1de034fe8c07c737f5c ALSA: usb-audio: separate sync endpoint setting from set_format

:::::: TO: Eldad Zack <eldad@fogrefinery.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--jRHKVT23PllUwdXP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
OG2g+xtTLKqFKq0BAA==

--jRHKVT23PllUwdXP--
