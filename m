Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD94116112
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Dec 2019 07:41:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9184C1660;
	Sun,  8 Dec 2019 07:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9184C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575787311;
	bh=Q5st93JBsnGWr1tkQyFE7XBAStSva2/VXS25ydd4iOE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaB9XcWAKyhS9y32bh//aqFC02+uwCTSOIKIjQWtFH2JZJjwEKRyCJE+0QZIX/n6u
	 Fg54FJ82vPZWE0uH3WBNbKNAN1G8VSDfCe8vJqLH6La8oT0NSMkyuxH95TtB3+oJa3
	 Fgc6spXaBKmQQQnzCjHmzw51q5aCsXPxpLJ+wDxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE79F80249;
	Sun,  8 Dec 2019 07:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F008F80217; Sun,  8 Dec 2019 07:40:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2200F800C7
 for <alsa-devel@alsa-project.org>; Sun,  8 Dec 2019 07:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2200F800C7
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2019 22:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,291,1571727600"; d="scan'208";a="206567514"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 07 Dec 2019 22:39:51 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1idqER-0008pg-8W; Sun, 08 Dec 2019 14:39:51 +0800
Date: Sun, 8 Dec 2019 14:39:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <201912081414.jnn8qiwO%lkp@intel.com>
References: <20191205092129.692520-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205092129.692520-1-daniel@zonque.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 kbuild-all@lists.01.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ALSA: core: add
 snd_pcm_format_by_name()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on sound/for-next]
[also build test WARNING on asoc/for-next v5.4 next-20191207]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Mack/ALSA-core-add-snd_pcm_format_by_name/20191207-084912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-91-g817270f-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/core/pcm.c:243:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted snd_pcm_format_t [usertype] @@    got t_t [usertype] @@
>> sound/core/pcm.c:243:33: sparse:    expected restricted snd_pcm_format_t [usertype]
>> sound/core/pcm.c:243:33: sparse:    got int [assigned] i
   sound/core/pcm.c:1022:9: sparse: sparse: context imbalance in 'snd_pcm_detach_substream' - different lock contexts for basic block

vim +243 sound/core/pcm.c

   227	
   228	/**
   229	 * snd_pcm_format_by_name - Return the PCM format code for the given name
   230	 * @name: PCM format name ('S16_LE', 'S24_3LE', ...)
   231	 * @format: Pointer to returned PCM format code
   232	 *
   233	 * The string comparison is done in a case-insensitive way.
   234	 *
   235	 * Return: 0 on success, or -ENOENT if the given format is not valid.
   236	 */
   237	int snd_pcm_format_by_name(const char *name, snd_pcm_format_t *format)
   238	{
   239		int i;
   240	
   241		for (i = 0; i < ARRAY_SIZE(snd_pcm_format_names); i++)
   242			if (strcasecmp(name, snd_pcm_format_names[i]) == 0) {
 > 243				*format = i;
   244				return 0;
   245			}
   246	
   247		return -ENOENT;
   248	}
   249	EXPORT_SYMBOL_GPL(snd_pcm_format_by_name);
   250	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
