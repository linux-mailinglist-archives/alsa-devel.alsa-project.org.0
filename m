Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768A9DEBD4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2024 18:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889B121B6;
	Fri, 29 Nov 2024 18:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889B121B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732901899;
	bh=XBjn4iq9qEIBBjS9cwcxo35rReBV4Pbo9LbdyGTKtVc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X32YtScsfV2uglocgFibVsXbuGuFE90XKNedWNP47lvS4V8Z1gL2iiPDE05ifAwct
	 Pulu3/3+OTTF8+4fNbXn9IPxqxpMfnfi5Sflrs1xBNXDTtiX5T1if9UEraI9wHbCj2
	 RClIBa81GZi19ekW5dqeGHIDBfHNcM/pRb7+Y/gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E25B2F80528; Fri, 29 Nov 2024 18:37:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44953F805B3;
	Fri, 29 Nov 2024 18:37:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 095AEF80236; Fri, 29 Nov 2024 18:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A567DF80116
	for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2024 18:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A567DF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oC3B9wAX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732901860; x=1764437860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBjn4iq9qEIBBjS9cwcxo35rReBV4Pbo9LbdyGTKtVc=;
  b=oC3B9wAXljAZ17Zlh/4F+RspveSCg0Ag49Id6i3QJywz+3QDNhNpuf73
   EM9VWNQU2QnXPScg/6n8lWxP9IWvVKgOHw4rpbSd8epBJZcQxeSCYqYUf
   tr9ZsZ/IcxwEm5KDv6nRxF61+lM9btH4ffgOs9dzMsXQofDGSKQbMO0d5
   qZsS6E9Za2CS52AmUiQLdiNNVfDlxT9sKiwBrR1q2S8dwG8r2f3QN15Nx
   2mPMw25s672gR6V8BLu/7cnv1FYNGCqTFgLsbhI10rBx10avJOD7E2TAL
   X8gkHzPaqv5w58rlijKHr66MQ/ziKjszf5C9eeAC7sckJgAFSoQQKfXMp
   A==;
X-CSE-ConnectionGUID: 0n7o7NIDSsqA+4KnJOMp7w==
X-CSE-MsgGUID: Xl/mNLTPQvOMS57ThjZMpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50543727"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600";
   d="scan'208";a="50543727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 09:37:34 -0800
X-CSE-ConnectionGUID: LkpIP/StREikihE/rFeAZQ==
X-CSE-MsgGUID: 3aLBKnz1R5S/inKoypU4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600";
   d="scan'208";a="92855492"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 09:37:33 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH4vr-0000Zj-0p;
	Fri, 29 Nov 2024 17:37:31 +0000
Date: Sat, 30 Nov 2024 01:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 6/10] sound/core/ump.c:1259:69: warning: '%s'
 directive output may be truncated writing up to 11 bytes into a region of
 size between 4 and 22
Message-ID: <202411300103.FrGuTAYp-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 5XJJCWHYJ2ULUNCM5BMSPTBYXCZBRHDL
X-Message-ID-Hash: 5XJJCWHYJ2ULUNCM5BMSPTBYXCZBRHDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XJJCWHYJ2ULUNCM5BMSPTBYXCZBRHDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   9b5f8ee43e48c25fbe1a10163ec04343d750acd0
commit: e29e504e7890b9ee438ca6370d0180d607c473f9 [6/10] ALSA: ump: Indicate the inactive group in legacy substream names
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411300103.FrGuTAYp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300103.FrGuTAYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300103.FrGuTAYp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/ump.c: In function 'fill_substream_names':
>> sound/core/ump.c:1259:69: warning: '%s' directive output may be truncated writing up to 11 bytes into a region of size between 4 and 22 [-Wformat-truncation=]
    1259 |                 snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
         |                                                                     ^~
   sound/core/ump.c:1259:17: note: 'snprintf' output between 11 and 40 bytes into a destination of size 32
    1259 |                 snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1260 |                          idx + 1, name,
         |                          ~~~~~~~~~~~~~~
    1261 |                          ump->groups[idx].active ? "" : " [Inactive]");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1259 sound/core/ump.c

  1246	
  1247	static void fill_substream_names(struct snd_ump_endpoint *ump,
  1248					 struct snd_rawmidi *rmidi, int dir)
  1249	{
  1250		struct snd_rawmidi_substream *s;
  1251		const char *name;
  1252		int idx;
  1253	
  1254		list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
  1255			idx = ump->legacy_mapping[s->number];
  1256			name = ump->groups[idx].name;
  1257			if (!*name)
  1258				name = ump->info.name;
> 1259			snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
  1260				 idx + 1, name,
  1261				 ump->groups[idx].active ? "" : " [Inactive]");
  1262		}
  1263	}
  1264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
