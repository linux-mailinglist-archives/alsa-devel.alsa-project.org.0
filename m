Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF77E872B
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Nov 2023 01:59:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAF374C;
	Sat, 11 Nov 2023 01:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAF374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699664347;
	bh=KgItv/ApTMzbbLUCfMBBLavSFstnBCJW3M6AwXJNXEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tTZAAIsei1LPffmO/jFqxVeR8uBSzXD+8vUBwK7FfNBPhkzd1FJ0PQTIE54YlB+2t
	 aRPBV9kRciBxVsrFXd602+ZnWlqx/IjgMiMQOM/9XVsv5IyEi2H5U4Soe0qhf0HEtr
	 LVzR813KC+YyOuLACnsN3VUfXWZm+R8LC7Lh6aK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35027F804DA; Sat, 11 Nov 2023 01:57:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6369DF80169;
	Sat, 11 Nov 2023 01:57:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80955F8016D; Sat, 11 Nov 2023 01:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 112ADF800ED
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 01:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112ADF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=koKSqZke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699664105; x=1731200105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KgItv/ApTMzbbLUCfMBBLavSFstnBCJW3M6AwXJNXEs=;
  b=koKSqZkeFeE1LRtpnMsqomiQhVyGDBvtKBWpqUzaUF42MUsMzglpYHLS
   OPjpK+4hfTCJcUl5+nudK/s9doAzmR16UnFcT2Ys+RFPgDsl6WWHNwd6l
   ZKMKLSCIHETkX5RkCGNFDmz/5OLLZvnhholVJucZbs2V8Pb8Qm8dJbOmm
   G/j2GmgNAZRTfXNS7FMrowKXWf4VQLN1Ju+/ZV6tvl3QhhvhqFqXfBVYQ
   gQ/FBZdFZAFo6OhqSL/yaWwAd8eUi35+A+eE9LPV4EWgfjOQJeok1iMLL
   LD0uN9LoQarIz2OmUDtlLSEWrBYAVPkQwkDRI/LiIfrblU2j/ZbLLeXzx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="11798483"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200";
   d="scan'208";a="11798483"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 16:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767442282"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200";
   d="scan'208";a="767442282"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 16:54:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1cGx-000A69-1x;
	Sat, 11 Nov 2023 00:54:51 +0000
Date: Sat, 11 Nov 2023 08:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 15/15] media: vim2m-audio: add virtual driver for
 audio memory to memory
Message-ID: <202311110805.xhszmZN7-lkp@intel.com>
References: <1699595289-25773-16-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699595289-25773-16-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: 5PLUGTSQPDGXCFPXQDUMFXURCASHJ34Y
X-Message-ID-Hash: 5PLUGTSQPDGXCFPXQDUMFXURCASHJ34Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PLUGTSQPDGXCFPXQDUMFXURCASHJ34Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20231110-143635
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1699595289-25773-16-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v9 15/15] media: vim2m-audio: add virtual driver for audio memory to memory
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110805.xhszmZN7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110805.xhszmZN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110805.xhszmZN7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vim2m-audio.c:174:13: warning: variable 'dst_size' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     174 |         } else if (q_data_src->rate * 2 == q_data_dst->rate) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vim2m-audio.c:184:46: note: uninitialized use occurs here
     184 |         vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
         |                                                     ^~~~~~~~
   drivers/media/test-drivers/vim2m-audio.c:174:9: note: remove the 'if' if its condition is always true
     174 |         } else if (q_data_src->rate * 2 == q_data_dst->rate) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vim2m-audio.c:137:24: note: initialize the variable 'dst_size' to silence this warning
     137 |         int src_size, dst_size;
         |                               ^
         |                                = 0
   1 warning generated.


vim +174 drivers/media/test-drivers/vim2m-audio.c

   123	
   124	/*
   125	 * mem2mem callbacks
   126	 */
   127	
   128	/*
   129	 * device_run() - prepares and starts the device
   130	 */
   131	static void device_run(void *priv)
   132	{
   133		struct audm2m_ctx *ctx = priv;
   134		struct audm2m_dev *audm2m_dev;
   135		struct vb2_v4l2_buffer *src_buf, *dst_buf;
   136		struct audm2m_q_data *q_data_src, *q_data_dst;
   137		int src_size, dst_size;
   138		short *src_addr, *dst_addr;
   139		int i;
   140	
   141		audm2m_dev = ctx->dev;
   142	
   143		q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_OUTPUT);
   144		if (!q_data_src)
   145			return;
   146	
   147		q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_CAPTURE);
   148		if (!q_data_dst)
   149			return;
   150	
   151		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
   152		dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
   153		src_buf->sequence = q_data_src->sequence++;
   154		dst_buf->sequence = q_data_dst->sequence++;
   155		v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
   156	
   157		/* Process the conversion */
   158		src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
   159	
   160		src_addr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
   161		dst_addr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
   162	
   163		if (q_data_src->rate == q_data_dst->rate) {
   164			memcpy(dst_addr, src_addr, src_size);
   165			dst_size = src_size;
   166		} else if (q_data_src->rate == 2 * q_data_dst->rate) {
   167			/* 8k to 16k */
   168			for (i = 0; i < src_size / 2; i++) {
   169				*dst_addr++ = *src_addr++;
   170				src_addr++;
   171			}
   172	
   173			dst_size = src_size / 2;
 > 174		} else if (q_data_src->rate * 2 == q_data_dst->rate) {
   175			/* 16k to 8k */
   176			for (i = 0; i < src_size / 2; i++) {
   177				*dst_addr++ = *src_addr;
   178				*dst_addr++ = *src_addr++;
   179			}
   180	
   181			dst_size = src_size * 2;
   182		}
   183	
   184		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
   185	
   186		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
   187		dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
   188	
   189		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
   190		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
   191		v4l2_m2m_job_finish(audm2m_dev->m2m_dev, ctx->fh.m2m_ctx);
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
