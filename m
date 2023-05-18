Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87140707E47
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA72B1FA;
	Thu, 18 May 2023 12:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA72B1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406481;
	bh=M6S4J2mGu5VQH0VpfH6QtTxRJTdbF/tg3I2cHEedPbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xa2X5Iq6Eo0tEbHRxD7jl0Iajvg+UZLWUcaJ8Mj1Ag/Sisd0tKTeCPE2vAxVeBDPq
	 BJnwozmmxSUdlhQyvYI/A+sYoZgG+7JE0JSSW4NNSat0/bKgtjL7qHnbtndBqNdhgL
	 scIXHsUCvaI/Ud0/TboJmyvHcLafROs3WwFGbJaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63479F80571; Thu, 18 May 2023 12:39:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF82AF802E8;
	Thu, 18 May 2023 12:39:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8FF0F80558; Thu, 18 May 2023 12:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75B2DF8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B2DF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g4mmAgkb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406369; x=1715942369;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M6S4J2mGu5VQH0VpfH6QtTxRJTdbF/tg3I2cHEedPbg=;
  b=g4mmAgkbjyZ7WZThoQq4uYlVZWDjA9IL/60JEQ5j2SF1bKhd05bp3L54
   VeA9oPHd0t4JtfdeVqE+p3+e5MgPXMuUfAryYJUv+WpZBBbkua+9pq4+P
   5QaL+Y2uchJ8HZidEt1XKRMRc+uV6bugaya+zewhNXU5c14x2PtSK8DUA
   IYiKDQ5BVuA2Jr3QXYO5c89M3u0S8qPr9bEj6LfMmP6fnM6GYdJpPDWV2
   7qdgRAa/7WwmBneX99jHQnzhs+1pYq9fyQgAcDXKwkfVsq5ajRZQt4yT0
   WXUliIZJKxbc7DWSY1ayLlwzI2wQnFZGO1Ucg+xQFSNoDCJ7iMR5C1NkW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350865670"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="350865670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="735035087"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="735035087"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:39:16 -0700
Message-ID: <4d3dd0a9-b7ae-ea5e-a4a8-766e425c49c0@linux.intel.com>
Date: Thu, 18 May 2023 12:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/20] ASoC: Intel: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87jzx6p4u4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87jzx6p4u4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TMCCWP2LGFWFPCE2AJHIZJ3X6T2SECSM
X-Message-ID-Hash: TMCCWP2LGFWFPCE2AJHIZJ3X6T2SECSM
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMCCWP2LGFWFPCE2AJHIZJ3X6T2SECSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:48 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> NOTE
> Some Intel code was complex. Please check this patch deeply.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/avs/boards/da7219.c           |  2 -
>   sound/soc/intel/avs/boards/dmic.c             |  4 +-
>   sound/soc/intel/avs/boards/hdaudio.c          |  4 --
>   sound/soc/intel/avs/boards/i2s_test.c         |  2 -
>   sound/soc/intel/avs/boards/max98357a.c        |  2 +-
>   sound/soc/intel/avs/boards/max98373.c         |  2 -
>   sound/soc/intel/avs/boards/max98927.c         |  2 -
>   sound/soc/intel/avs/boards/nau8825.c          |  2 -
>   sound/soc/intel/avs/boards/rt274.c            |  2 -
>   sound/soc/intel/avs/boards/rt286.c            |  2 -
>   sound/soc/intel/avs/boards/rt298.c            |  2 -
>   sound/soc/intel/avs/boards/rt5682.c           |  2 -
>   sound/soc/intel/avs/boards/ssm4567.c          |  2 -
>   sound/soc/intel/boards/bdw-rt5650.c           |  4 --
>   sound/soc/intel/boards/bdw-rt5677.c           |  4 --
>   sound/soc/intel/boards/bdw_rt286.c            | 10 ++--
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++++-----
>   sound/soc/intel/boards/bxt_rt298.c            | 26 +++++----
>   sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +--
>   sound/soc/intel/boards/bytcht_da7213.c        |  6 +--
>   sound/soc/intel/boards/bytcht_es8316.c        |  6 +--
>   sound/soc/intel/boards/bytcht_nocodec.c       |  6 +--
>   sound/soc/intel/boards/bytcr_rt5640.c         |  6 +--
>   sound/soc/intel/boards/bytcr_rt5651.c         |  6 +--
>   sound/soc/intel/boards/bytcr_wm5102.c         |  6 +--
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +--
>   sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +--
>   sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +--
>   sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +--
>   sound/soc/intel/boards/cml_rt1011_rt5682.c    | 14 ++---
>   sound/soc/intel/boards/ehl_rt5660.c           | 14 +++--
>   sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++++------
>   sound/soc/intel/boards/hsw_rt5640.c           | 10 ++--
>   sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++++----
>   sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++++++----------
>   sound/soc/intel/boards/kbl_rt5660.c           | 18 +++----
>   sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++++--------
>   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++++----
>   sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++---
>   .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++++----
>   sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 ++++-----
>   sound/soc/intel/boards/skl_rt286.c            | 26 +++++----
>   sound/soc/intel/boards/sof_cs42l42.c          | 12 +----
>   sound/soc/intel/boards/sof_da7219_max98373.c  | 16 +++---
>   sound/soc/intel/boards/sof_es8336.c           |  8 ++-
>   sound/soc/intel/boards/sof_nau8825.c          | 12 +----
>   sound/soc/intel/boards/sof_pcm512x.c          |  8 +--
>   sound/soc/intel/boards/sof_rt5682.c           | 12 +----
>   sound/soc/intel/boards/sof_sdw.c              |  4 +-
>   sound/soc/intel/boards/sof_ssp_amp.c          | 11 ++--
>   sound/soc/intel/boards/sof_wm8804.c           |  2 -
>   51 files changed, 209 insertions(+), 372 deletions(-)
> 

I've looked twice at avs part and skimmed through rest of boards, 
overall seems good, but please split sound/soc/intel/avs/boards/ and 
sound/soc/intel/boards/ into two separate patches.


