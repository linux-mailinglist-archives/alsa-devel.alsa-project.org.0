Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD415927EF1
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2024 00:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF88F55;
	Fri,  5 Jul 2024 00:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF88F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720131216;
	bh=fRVQTvUc2movJkc/FfIHRaMe82Cfoa1Zo1wuNxKRdoA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sz715UHqr90DKhmXmLbDBxcCb0P+8OsvxJG5JJUYkxEFDrqZpI7o3eFscJbyz0Rs8
	 097MWC7K/bACMeA5Ccbz64MCBGGwzDu2klOH4RN7DMbkK6ktVaaqfnLSRAVSRzIInB
	 dR2RCTo7s8hIQ1ZGTCoRID6ALLrR5OvRpIEb4UQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D42F805B4; Fri,  5 Jul 2024 00:13:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99112F805A0;
	Fri,  5 Jul 2024 00:13:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86224F8025E; Fri,  5 Jul 2024 00:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3FC9F800FA
	for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2024 00:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3FC9F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YpFHq083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720131168; x=1751667168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRVQTvUc2movJkc/FfIHRaMe82Cfoa1Zo1wuNxKRdoA=;
  b=YpFHq083o1AFDGmFCpNdEJGtU7n4Kzg0pwwHRgtz6WsCELIQDIEDAWs/
   kjRk2VVlW2WplaCRMbbycJYYp2FsSxs7mPOZNaT38JO3Bob2f40TrlyWp
   nozGrC8bJ6yR+yh1pW8F61BbC4/fguq4gMermHnBFKez0inlLUbOxjiPN
   y++P0Ej+Dz84hONkQ85+I+/lnB8BsWuwfAv1o7B2axV/CivFpQ/hE9Mbu
   VDspa/iq3MbvPEkH02PIRA9c7+OQp+ipH3+gu271OLNxKWrQk0MZ68PFP
   y1q626UqDvmKbtwaQggq0MQlH6xr3iWMQXZ4n7vkWPxWg62dX42U9aCXe
   w==;
X-CSE-ConnectionGUID: yyNfv5aSTQS8IK2O/4Q6Vg==
X-CSE-MsgGUID: iK13CBQMR3C5Yp94C9t8cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21184280"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="21184280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 15:12:41 -0700
X-CSE-ConnectionGUID: MEanRZanS0Obq81ZEqVEQw==
X-CSE-MsgGUID: Dw+BuX2vTbujoHWrCDJ2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="47349423"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 15:12:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPUgv-000RWa-1p;
	Thu, 04 Jul 2024 22:12:37 +0000
Date: Fri, 5 Jul 2024 06:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 5/6] sound/core/pcm_lib.c:547:9: warning:
 'strncpy' output truncated before terminating nul copying 12 bytes from a
 string of the same length
Message-ID: <202407050501.o5Z3bibi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: FRRXTBUXMZE5SPK4ILNNGTKUCKI4WDOX
X-Message-ID-Hash: FRRXTBUXMZE5SPK4ILNNGTKUCKI4WDOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRRXTBUXMZE5SPK4ILNNGTKUCKI4WDOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   5f9f982dd71b418aeba7a0b37f87312545c06df4
commit: d712c58c55d9a4b4cc88ec2e1f8cd2e3b82359b5 [5/6] ALSA: pcm: optimize and clarify stream synchronization ID API
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240705/202407050501.o5Z3bibi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050501.o5Z3bibi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050501.o5Z3bibi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'snd_pcm_set_sync_per_card',
       inlined from 'snd_pcm_lib_ioctl_sync_id' at sound/core/pcm_lib.c:1837:3,
       inlined from 'snd_pcm_lib_ioctl' at sound/core/pcm_lib.c:1863:10:
>> sound/core/pcm_lib.c:547:9: warning: 'strncpy' output truncated before terminating nul copying 12 bytes from a string of the same length [-Wstringop-truncation]
     547 |         strncpy(params->sync + 4, id, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +547 sound/core/pcm_lib.c

   517	
   518	/**
   519	 * snd_pcm_set_sync_per_card - set the PCM sync id with card number
   520	 * @substream: the pcm substream
   521	 * @params: modified hardware parameters
   522	 * @id: identifier (max 12 bytes)
   523	 * @len: identifier length (max 12 bytes)
   524	 *
   525	 * Sets the PCM sync identifier for the card with zero padding.
   526	 *
   527	 * User space or any user should use this 16-byte identifier for a comparison only
   528	 * to check if two IDs are similar or different. Special case is the identifier
   529	 * containing only zeros. Interpretation for this combination is - empty (not set).
   530	 * The contents of the identifier should not be interpreted in any other way.
   531	 *
   532	 * The synchronization ID must be unique per clock source (usually one sound card,
   533	 * but multiple soundcard may use one PCM word clock source which means that they
   534	 * are fully synchronized).
   535	 *
   536	 * This routine composes this ID using card number in first four bytes and
   537	 * 12-byte additional ID. When other ID composition is used (e.g. for multiple
   538	 * sound cards), make sure that the composition does not clash with this
   539	 * composition scheme.
   540	 */
   541	void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
   542				       struct snd_pcm_hw_params *params,
   543				       const unsigned char *id, unsigned int len)
   544	{
   545		*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
   546		len = max(12, len);
 > 547		strncpy(params->sync + 4, id, len);
   548		memset(params->sync + 4 + len, 0, 12 - len);
   549	}
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
