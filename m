Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DC893BE
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Aug 2019 22:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878771665;
	Sun, 11 Aug 2019 22:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878771665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565556349;
	bh=RPYH/5twVYIT5bhe1+FN71GHbnEKyevHsaDEokbkkag=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h5XhCu8IASOR06a4/cez3k9vggsmHoVSXRsflfp0WkBgyWwr8XYUN6IH/2Hx0wCj7
	 xTj/GLIbAryKv4knokbkyU8SBFs1u1sLuYIN2LE3kRxKuRWO1GkmuYWViZE4HL0HjO
	 CAH0nx/Bq/gQPm9Xyp2eunCF1181PJzjHwnyPX9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE07F80273;
	Sun, 11 Aug 2019 22:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B54F80273; Sun, 11 Aug 2019 22:44:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5806AF80269
 for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2019 22:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5806AF80269
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Aug 2019 13:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,374,1559545200"; 
 d="gz'50?scan'50,208,50";a="259597797"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 Aug 2019 13:43:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hwugZ-00025p-6x; Mon, 12 Aug 2019 04:43:27 +0800
Date: Mon, 12 Aug 2019 04:42:56 +0800
From: kbuild test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <201908120449.HBD2B5ZL%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5z627gi2iozxos4e"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.4 175/205]
 include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects argument
 of type 'long unsigned int', but argument 4 has type 'size_t'
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


--5z627gi2iozxos4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/broonie/sound.git for-5.4
head:   83ee7ab1627b7597bbb9acc26b37e9f96fff40c9
commit: abf31feea26c0f412a191c83f408311a0de7435c [175/205] ASoC: Intel: Update request-reply IPC model
config: i386-randconfig-a004-201932 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.2-10+deb8u1) 4.9.2
reproduce:
        git checkout abf31feea26c0f412a191c83f408311a0de7435c
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:332:0,
                    from include/linux/kernel.h:15,
                    from sound/soc/intel/haswell/sst-haswell-ipc.c:9:
   sound/soc/intel/haswell/sst-haswell-ipc.c: In function 'sst_hsw_module_set_param':
>> include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat=]
     static struct _ddebug  __aligned(8)   \
                   ^
   include/linux/dynamic_debug.h:123:2: note: in expansion of macro 'DEFINE_DYNAMIC_DEBUG_METADATA'
     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
     ^
   include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dynamic_func_call'
     __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
     ^
   include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
     ^
   include/linux/device.h:1503:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^
   sound/soc/intel/haswell/sst-haswell-ipc.c:2018:3: note: in expansion of macro 'dev_dbg'
      dev_dbg(dev, "transfer parameter size : %lu\n",
      ^
>> include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat=]
     static struct _ddebug  __aligned(8)   \
                   ^
   include/linux/dynamic_debug.h:123:2: note: in expansion of macro 'DEFINE_DYNAMIC_DEBUG_METADATA'
     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
     ^
   include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dynamic_func_call'
     __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
     ^
   include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
     ^
   include/linux/device.h:1503:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^
   sound/soc/intel/haswell/sst-haswell-ipc.c:2022:3: note: in expansion of macro 'dev_dbg'
      dev_dbg(dev, "transfer parameter aligned size : %lu\n",
      ^
--
   In file included from include/linux/printk.h:332:0,
                    from include/linux/kernel.h:15,
                    from sound/soc//intel/haswell/sst-haswell-ipc.c:9:
   sound/soc//intel/haswell/sst-haswell-ipc.c: In function 'sst_hsw_module_set_param':
>> include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat=]
     static struct _ddebug  __aligned(8)   \
                   ^
   include/linux/dynamic_debug.h:123:2: note: in expansion of macro 'DEFINE_DYNAMIC_DEBUG_METADATA'
     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
     ^
   include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dynamic_func_call'
     __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
     ^
   include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
     ^
   include/linux/device.h:1503:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^
   sound/soc//intel/haswell/sst-haswell-ipc.c:2018:3: note: in expansion of macro 'dev_dbg'
      dev_dbg(dev, "transfer parameter size : %lu\n",
      ^
>> include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat=]
     static struct _ddebug  __aligned(8)   \
                   ^
   include/linux/dynamic_debug.h:123:2: note: in expansion of macro 'DEFINE_DYNAMIC_DEBUG_METADATA'
     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
     ^
   include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dynamic_func_call'
     __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
     ^
   include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
     ^
   include/linux/device.h:1503:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^
   sound/soc//intel/haswell/sst-haswell-ipc.c:2022:3: note: in expansion of macro 'dev_dbg'
      dev_dbg(dev, "transfer parameter aligned size : %lu\n",
      ^

vim +82 include/linux/dynamic_debug.h

923abb9d797ba0 Gal Pressman     2019-05-01  75  
923abb9d797ba0 Gal Pressman     2019-05-01  76  extern __printf(3, 4)
923abb9d797ba0 Gal Pressman     2019-05-01  77  void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
923abb9d797ba0 Gal Pressman     2019-05-01  78  			 const struct ib_device *ibdev,
923abb9d797ba0 Gal Pressman     2019-05-01  79  			 const char *fmt, ...);
923abb9d797ba0 Gal Pressman     2019-05-01  80  
2bdde670beedf7 Rasmus Villemoes 2019-03-07  81  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
c0d2af63786394 Joe Perches      2012-10-18 @82  	static struct _ddebug  __aligned(8)			\
07613b0b5ef857 Jason Baron      2011-10-04  83  	__attribute__((section("__verbose"))) name = {		\
07613b0b5ef857 Jason Baron      2011-10-04  84  		.modname = KBUILD_MODNAME,			\
07613b0b5ef857 Jason Baron      2011-10-04  85  		.function = __func__,				\
07613b0b5ef857 Jason Baron      2011-10-04  86  		.filename = __FILE__,				\
07613b0b5ef857 Jason Baron      2011-10-04  87  		.format = (fmt),				\
07613b0b5ef857 Jason Baron      2011-10-04  88  		.lineno = __LINE__,				\
07613b0b5ef857 Jason Baron      2011-10-04  89  		.flags = _DPRINTK_FLAGS_DEFAULT,		\
2bdde670beedf7 Rasmus Villemoes 2019-03-07  90  		_DPRINTK_KEY_INIT				\
07613b0b5ef857 Jason Baron      2011-10-04  91  	}
07613b0b5ef857 Jason Baron      2011-10-04  92  

:::::: The code at line 82 was first introduced by commit
:::::: c0d2af637863940b1a4fb208224ca7acb905c39f dynamic_debug: Remove unnecessary __used

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--5z627gi2iozxos4e
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--5z627gi2iozxos4e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--5z627gi2iozxos4e--
