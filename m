Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C23779C5C
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 03:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809A03E7;
	Sat, 12 Aug 2023 03:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809A03E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691804743;
	bh=IDHLPtoSt23Lyd2EaCyUPcJ00851gfO9F1aEA5xZoYw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CNTfcJaplT4PmRNemo40Oilc62DAlwni3b6/pU5XV/gqTZXXsm4Xzjwko2CZvypK/
	 nJK33Se2fhsaQwVVampttryQ2JLaX9k/6JXT3AKWVAE780QQN9F/6hrstcw24p0tQi
	 fL9OP5qmGe6+tdDUXaroVxSjlh30HDeIHI0SF01Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 975F6F80549; Sat, 12 Aug 2023 03:44:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA48F80134;
	Sat, 12 Aug 2023 03:44:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E8CF80166; Sat, 12 Aug 2023 03:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59F53F800F4
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 03:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F53F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WDN1oX8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804677; x=1723340677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDHLPtoSt23Lyd2EaCyUPcJ00851gfO9F1aEA5xZoYw=;
  b=WDN1oX8rM3hxvvb8vQ6q1XKNuCMws+LL+BtZTLFXwLeKtm/LQhvRN2v1
   XTbd1KxdNHYeENZSofnKikJSkC1/uKJ/EcOdJCetL+WBXj3Or9yWWjpI+
   G1y2q26XH5Xk3VWw82RbeTagsMVLv7KjX7WXch2h788Z5QR8gMNzJaJJR
   1B6G+LgbhcYBQdTO0ka+jM7d9YIRGikNEN/pN1YCOUKfxPn71cE1ZY8x5
   5WQBvaATkGomqcbGeETmNxzRrsDNAPW91e/JhaR4rPNAyuluwdHb+pi0l
   O9hshlZKfuYH+5n3OMEC1scj6OWNKgCzO4AyX6kvjnyO+EnPOJ5Qon3VC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369264757"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200";
   d="scan'208";a="369264757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 18:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767845468"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200";
   d="scan'208";a="767845468"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 18:43:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdfZ-0008BQ-0L;
	Sat, 12 Aug 2023 01:43:57 +0000
Date: Sat, 12 Aug 2023 09:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-iov_iter 3/25] sound/core/memory.c:108:53:
 warning: passing argument 2 of 'copy_from_iter' makes integer from pointer
 without a cast
Message-ID: <202308120931.Aj1gaY7K-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: SZSJ5Q263FQAHIBGL6TOFGRHMTTG3NUR
X-Message-ID-Hash: SZSJ5Q263FQAHIBGL6TOFGRHMTTG3NUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZSJ5Q263FQAHIBGL6TOFGRHMTTG3NUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/pcm-iov_iter
head:   da1be13e050f24d088d24fd65517d56f27a2eeb1
commit: 516e284c8b17a5129fcfbfb1f2f4e11093e13d3f [3/25] ALSA: core: Add memory copy helpers between iov_iter and iomem
config: i386-randconfig-r033-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120931.Aj1gaY7K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120931.Aj1gaY7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120931.Aj1gaY7K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/memory.c: In function 'copy_from_iter_toio':
>> sound/core/memory.c:108:53: warning: passing argument 2 of 'copy_from_iter' makes integer from pointer without a cast [-Wint-conversion]
     108 |         return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;
         |                                                     ^~~
         |                                                     |
         |                                                     struct iov_iter *
   In file included from include/sound/pcm.h:19,
                    from sound/core/memory.c:12:
   include/linux/uio.h:199:42: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct iov_iter *'
     199 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                   ~~~~~~~^~~~~
>> sound/core/memory.c:108:58: warning: passing argument 3 of 'copy_from_iter' makes pointer from integer without a cast [-Wint-conversion]
     108 |         return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;
         |                                                          ^~~~~
         |                                                          |
         |                                                          size_t {aka unsigned int}
   include/linux/uio.h:199:66: note: expected 'struct iov_iter *' but argument is of type 'size_t' {aka 'unsigned int'}
     199 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                                 ~~~~~~~~~~~~~~~~~^


vim +/copy_from_iter +108 sound/core/memory.c

    93	
    94	/**
    95	 * copy_from_iter_toio - copy data from iov_iter to mmio-space
    96	 * @dst: the destination pointer on mmio-space
    97	 * @src: the source iov_iter
    98	 * @count: the data size to copy in bytes
    99	 *
   100	 * Copies the data from iov_iter to mmio-space.
   101	 * Only the single segment iov_iter is assumed for now.
   102	 *
   103	 * Return: Zero if successful, or non-zero on failure.
   104	 */
   105	int copy_from_iter_toio(void __iomem *dst, struct iov_iter *src, size_t count)
   106	{
   107	#if defined(__i386__) || defined(CONFIG_SPARC32)
 > 108		return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
