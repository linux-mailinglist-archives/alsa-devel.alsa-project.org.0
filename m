Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483A77028F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 16:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1CB7F4;
	Fri,  4 Aug 2023 16:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1CB7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691158074;
	bh=M3CRrkFdoVdKzSs+IuKDCwrg6JzzVYw+6AYVIznlqWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LxaxndNJXGoD9rrsCq50fjFfdQy4iao6IOCe2uVhUm+n0MziMYPnAeaEOIu+J9Duu
	 KM6P9buiVbqn2bDfuU3QEjorZDfoZEV2S0BMF1CpeupQaH3ALQXTEH72oVDv0ZBXDR
	 OjmVOtcgc3RiohjR5oVZHBVP4oCF0jjzy0j2wvcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BC7FF80535; Fri,  4 Aug 2023 16:07:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3956CF801D5;
	Fri,  4 Aug 2023 16:07:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42EEDF8025A; Fri,  4 Aug 2023 16:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56582F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 16:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56582F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IqBFb0fS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691158011; x=1722694011;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M3CRrkFdoVdKzSs+IuKDCwrg6JzzVYw+6AYVIznlqWg=;
  b=IqBFb0fSb3d7TU+Rt3hl66+CmeRpYpSWftDaGPQa40y3T6pXnbRZavsy
   v+7O3U9h00zHJYsM2klPBBQsnr+NdrTirTvqjnt6cCcONpSnPPJgZnnIl
   DCOVW5xiqEg/Qr38NOs8LmjHGVCugCOp080Ydzc0Cl8lqh1Xhyxe9mx02
   NxZd7t8Bdnf8tzhqx436lfTKSo6HMyo7Efr1+HbcWDPyKSQvuGNQLlsVu
   XKLjAjkKiAcFAiO5jFGWrPHc+vbfhH8FmzpABIDcWnw6ffyuWciGo3nVm
   pSIvjVdCJ4WoKKLCspteunO9lqX6ey/3yyLyo9GAcw3c8HiMI3fW5KlpO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="349751614"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="349751614"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 07:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="707037358"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="707037358"
Received: from jcummins-mobl.amr.corp.intel.com (HELO [10.209.135.208])
 ([10.209.135.208])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 07:06:45 -0700
Message-ID: <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
Date: Fri, 4 Aug 2023 09:06:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20230804132628.302385-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230804132628.302385-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4FDO6KC25GWQOEDKQPP33IJBYCSSDADF
X-Message-ID-Hash: 4FDO6KC25GWQOEDKQPP33IJBYCSSDADF
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FDO6KC25GWQOEDKQPP33IJBYCSSDADF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/4/23 08:26, Hans de Goede wrote:
> If SNDRV_PCM_IOCTL_PREPARE is called when  the mixer settings linking
> frontend and backend have not been setup yet this results in
> e.g. the following errors getting logged:
> 
> [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
> [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
> 
> pipewire triggers this leading to 96 repeats of this in the log
> after the user has logged into a GNOME session.
> 
> IMHO userspace should not be able to get the kernel to spam dmesg like
> this. Lower the severity of the "no backend DAIs enabled" log message
> for dai-s with the dynamic flag set to avoid this.
> 
> And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
> the other error. Userspace passing wrong parameters should not lead
> to dmesg messages.

Maybe, but it's a questionable flow if pipewire tries to open stuff
without the mixer values set-up. Is there something done about this?

The reason why I am pushing back is that we had a similar issue with
HDaudio where HDMI/DP PCM devices were opened without checking if the
jack was connected.

It really makes no sense for userspace to try and open devices that are
known to be problematic. We can push kernel error logs below the rug, it
doesn't make the programming flows better.
