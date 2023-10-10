Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BDF7BFE4E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E8B1508;
	Tue, 10 Oct 2023 15:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E8B1508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696945595;
	bh=jdyUeEs7l/uynNOxW+chyX1CbsJ0ZsTalvF31kn6dYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XdQpthqqWZL9PhP87m9IOqd0hZgSL5Y8YTVOSQz9pbf9JOtr5VZd0OyxHtpb4JawM
	 7CDQVdG4P4Fcc18MQrWNrownqKgTbSkRXM+3wC0c+3nlHXoGkGDuwr8JW669L4qGJG
	 +FiptM42ILUFwHTuu2Unh2Jj5t1pHqznzraS/z/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D7DF8056F; Tue, 10 Oct 2023 15:44:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64553F8055A;
	Tue, 10 Oct 2023 15:44:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA81F802BE; Tue, 10 Oct 2023 15:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B779F80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 15:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B779F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OV4A/ORo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696945485; x=1728481485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jdyUeEs7l/uynNOxW+chyX1CbsJ0ZsTalvF31kn6dYo=;
  b=OV4A/ORoNARCvYPEdSCZyYwoxGra7fAl8HqO9tSnFhY9leezmVhOqBTa
   hQ3kRQmhjrG3OSGd91oj7IaG4UZ+3Z7i9zEvZQR+FqSyByMQBL3r8t2n1
   HGUUnTGSflmey5FFGCu0KEV7RMj4r1RmBVnv1GuIQxJpAWyrY9NnrTwOy
   VYrMGheOJciurJpCkYRQhv57hSTAVOekqkXXAjsVe+UnI9cb9aMrvHcFl
   2eJpAHQyAhj/rvzjuYoaSyLcFjtRNAhMaHW7RhPr6JyGEib+unxs9dO9v
   zkqyErKx1RvvtPEPR5Crv7iZvmFy/AtDGnWpBhx1m79oWwmleRoS7ViRn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369460350"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="369460350"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753412659"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="753412659"
Received: from sssodhi-mobl.amr.corp.intel.com (HELO [10.212.38.18])
 ([10.212.38.18])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:44:35 -0700
Message-ID: <4ee736cc-25cd-4e33-95b3-fb1607e9a998@linux.intel.com>
Date: Tue, 10 Oct 2023 09:43:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: makes CPU/Codec channel connection map more
 generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZSLIDYG3ARBVROM6FIV2JYQ7UDNRUF66
X-Message-ID-Hash: ZSLIDYG3ARBVROM6FIV2JYQ7UDNRUF66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSLIDYG3ARBVROM6FIV2JYQ7UDNRUF66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/9/23 21:20, Kuninori Morimoto wrote:
> 
> Hi Mark
> Cc Bard, Pierre-Louis
> 
> Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
> ch_map idea. This patch expand that all connection uses this idea,
> and no limit of N < M [1].
> 
> This patch is tested on Audio-Graph-Card2 with sample dtsi,
> but needs Tested-by, at least from Intel.

We can test the next version (comments in separate mail) but we don't
have a configuration with more cpu dais than codec dais I am afraid, so
the best we can contribute is a non-regression for the N < M case.
