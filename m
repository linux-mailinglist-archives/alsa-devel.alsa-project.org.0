Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24A205287
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A3717CA;
	Tue, 23 Jun 2020 14:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A3717CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592915590;
	bh=PVf3+IZNTRGaTuMNWnPz7J0bQH3RzRUlq0Yr1t2WP/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOK67t5wVAS21T53ul3z/zbbyuuy56F3ZHp4mn9gyja+3GpOHLsugTdYEc6NoQjFI
	 pRDdIOTAulg9/pL1bu11S1j3ETBrVsemWdrJReXWXZM1sf50R0YxQL0GUV3PvDXCDr
	 zDIpXdQ9u3nCqHMhXVc0pKVOBPDBNDFcNCuJT7+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C73FBF8023E;
	Tue, 23 Jun 2020 14:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90233F80234; Tue, 23 Jun 2020 14:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E78F1F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E78F1F8012F
IronPort-SDR: IdeQ9xoa+X2bKp8y3fj0FyaHropT3jHDIJ9orpethqlMKJGt3A8vU7uHm0ZUjGpiylSsI+XWMZ
 yvS8BflWwIDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="205552123"
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
 d="gz'50?scan'50,208,50";a="205552123"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 05:31:13 -0700
IronPort-SDR: wG1OKXd8ne/QHWkW4fwhlvyVoKd2Qmy3MN9uZYvwp0msIj8X2an5u8yUtZ+pZ3S16ospC16nmv
 QO4JJK4mRTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
 d="gz'50?scan'50,208,50";a="353787800"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2020 05:31:10 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jni4z-0000Ha-Sn; Tue, 23 Jun 2020 12:31:09 +0000
Date: Tue, 23 Jun 2020 20:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, khilman@kernel.org,
 ulf.hansson@linaro.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net
Subject: Re: [RESEND PATCH v2 1/2] PM / domains: Introduce multi PM domains
 helpers
Message-ID: <202006232053.BghwaYJg%lkp@intel.com>
References: <20200623113301.631-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20200623113301.631-2-daniel.baluta@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
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


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pm/linux-next]
[also build test WARNING on shawnguo/for-next linux/master linus/master v5.8-rc2 next-20200623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Baluta/Introduce-multi-PM-domains-helpers/20200623-193706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/base/platform.c:23:
>> include/linux/pm_domain.h:395:34: warning: no previous prototype for 'dev_multi_pm_attach' [-Wmissing-prototypes]
     395 | struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
         |                                  ^~~~~~~~~~~~~~~~~~~
>> include/linux/pm_domain.h:416:6: warning: no previous prototype for 'dev_multi_pm_detach' [-Wmissing-prototypes]
     416 | void dev_multi_pm_detach(struct dev_multi_pm_domain_data *mpd) {}
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/base/platform.c:1352:20: warning: no previous prototype for 'early_platform_cleanup' [-Wmissing-prototypes]
    1352 | void __weak __init early_platform_cleanup(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~

vim +/dev_multi_pm_attach +395 include/linux/pm_domain.h

   394	
 > 395	struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
   396	{
   397		return NULL;
   398	}
   399	
   400	static inline struct device *dev_pm_domain_attach_by_id(struct device *dev,
   401								unsigned int index)
   402	{
   403		return NULL;
   404	}
   405	static inline struct device *dev_pm_domain_attach_by_name(struct device *dev,
   406								  const char *name)
   407	{
   408		return NULL;
   409	}
   410	static inline void dev_pm_domain_detach(struct device *dev, bool power_off) {}
   411	static inline int dev_pm_domain_start(struct device *dev)
   412	{
   413		return 0;
   414	}
   415	
 > 416	void dev_multi_pm_detach(struct dev_multi_pm_domain_data *mpd) {}
   417	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--2oS5YaxWCcQjTEyO
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--2oS5YaxWCcQjTEyO--
