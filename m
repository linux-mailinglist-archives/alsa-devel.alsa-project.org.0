Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DA77285D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7264D827;
	Mon,  7 Aug 2023 16:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7264D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420261;
	bh=nkd+jhmUXpjpl8OFKBsqqKUTtbcUbbAX2J1UwapqaFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PKKtuF9C4l7PBkmSSso58Vaxl3t5sNPY2JrB/uidkrhZe12SpOxtfCe0ALb4Yrimr
	 +95jZdxX67CjDLV6yRmrryyxBIAuUMLUzfHx9lUm9w1MCy7xqU3d5l5fM1Q/d8rx3Y
	 xifoYXGPcM54+XxghZXX/YPLzRv6xsgWjUxt+ock=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C15F80520; Mon,  7 Aug 2023 16:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8403F80535;
	Mon,  7 Aug 2023 16:56:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB8CF8016A; Mon,  7 Aug 2023 16:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6419BF8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 16:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6419BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j90Zj67V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420202; x=1722956202;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nkd+jhmUXpjpl8OFKBsqqKUTtbcUbbAX2J1UwapqaFk=;
  b=j90Zj67V1MngNa+5DhBl61LKLKvfc8L8c08Ab0YIHIOcAts10BNhkGcb
   7QO0sQDb6zX1JVLDTMWPISBGYE8iOZL3U3ydvuKWhHgNvxEsFudYgWJ22
   H5/fD1AacYu2cnLcr2nAhR2yRqLZzJfzj0Fc5wCC41k1nuJ4hmucJzzU/
   MQ+2A4g6oN8ZHN6Tvvy9VfTDmRXvZHAM0dLEFSAihFaLA/X0vX6yu3/Xb
   858b/Ub8cKGH5f1IQSJoCu8hkuKC7l/rmCgr2DyRuGPj9hGZA6R2O90ub
   qHSNOMlpj6VqaOhpck5VMnmRjUWsjC851gTKvzBvr4nvHcOyZ9iCcXr8g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410573"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410573"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623853"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623853"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:34 -0700
Message-ID: <855710b8-aab1-03be-d1aa-208bc2e63327@linux.intel.com>
Date: Mon, 7 Aug 2023 09:05:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <20230805171435.31696-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230805171435.31696-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z2W5C6V53BQEPWMJXGDILONBBU3DXP2L
X-Message-ID-Hash: Z2W5C6V53BQEPWMJXGDILONBBU3DXP2L
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/5/23 12:14, Hans de Goede wrote:
> If SNDRV_PCM_IOCTL_PREPARE is called when the mixer settings linking
> frontend and backend have not been setup yet this results in
> e.g. the following errors getting logged:
> 
> [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
> [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
> 
> pipewire triggers this leading to 96 lines getting logged
> after the user has logged into a GNOME session.
> 
> Change the actual "no backend DAIs enabled for ... Port" error to
> dev_err_once() to avoid it getting repeated 48 times. While at it
> also improve the error by hinting the user how to fix this.
> 
> To not make developing new UCM profiles harder, also log the error
> at dev_dbg() level all the time (vs once). So that e.g. dyndbg can
> be used to (re)enable the messages.
> 
> Also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
> the other error getting logged 48 times. Userspace passing wrong
> parameters should not lead to dmesg messages.
> 
> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3407
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

