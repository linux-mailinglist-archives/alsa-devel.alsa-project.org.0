Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B56C8599
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 20:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 719E1E8D;
	Fri, 24 Mar 2023 20:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 719E1E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679684830;
	bh=X9n+yet3Mi5pd0MngLxWhEELp+DUWqRTDu9B5UBwZKc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eUH0pe1M4+62Ud9xfvYdE50lIfIrvavd9OyqvpJh+8uR3jZWwRjqlDHtccUGtByd0
	 2Z6PBORJoeqR8iMmianfKqewDZbX2wJ7Y6qvL6dwgd5EPpidmHdYUac/cLem+c2e/s
	 kNHOjOfZgj2osJnOXosmQ+TmujfvN65nBvoNJjMY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FEC2F8027B;
	Fri, 24 Mar 2023 20:05:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01D34F802E8; Fri, 24 Mar 2023 20:05:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED9B9F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 20:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9B9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QPeM0jxQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679684748; x=1711220748;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X9n+yet3Mi5pd0MngLxWhEELp+DUWqRTDu9B5UBwZKc=;
  b=QPeM0jxQMw56dL1mr+uWRID/Y/ijBrNYczDiX7iEGLji9DixkAAH6zML
   W+opuEcddoR4dM0IIung4KSdPLr+xLHdb/0TbnKyLj1qHzZFCr4RsR4T0
   gUXiYX8dDjZc/xc/RqRaTcLAQi7cj7OEEkVvoumv2OSu3u9hqKDHcXQbR
   VU6Ce6enrQPAtLF4P/wva2UcU62kIwmZgrJWRqVqnwKX4BdscVcCHZqDA
   Toc7XidjrIk9lf208A4GRrXyGmNFkr3Emohw6ZLdmiPj/emjYLlK9BxQG
   P+4S9crJE74p2hz9vgbI/Skzw90v9kJjF7r/LQldo+ZSzVb9OoLOGdM/Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338585084"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="338585084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 12:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="632936329"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="632936329"
Received: from kvnguye3-mobl1.amr.corp.intel.com (HELO [10.212.145.31])
 ([10.212.145.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 12:05:26 -0700
Message-ID: <060ebffd-6ecd-f2f7-6fdf-5e7b8c544d0a@linux.intel.com>
Date: Fri, 24 Mar 2023 14:05:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: hdac_hdmi: use set_stream() instead of
 set_tdm_slots()
To: Jason Montleon <jmontleo@redhat.com>, alsa-devel@alsa-project.org,
 regressions@lists.linux.dev, yung-chuan.liao@linux.intel.com,
 broonie@kernel.org, tiwai@suse.com, bagasdotme@gmail.com
References: <20230324170711.2526-1-jmontleo@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230324170711.2526-1-jmontleo@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IDJNRMLL4SZIRKZISXCW3CSWUJZMP5SE
X-Message-ID-Hash: IDJNRMLL4SZIRKZISXCW3CSWUJZMP5SE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDJNRMLL4SZIRKZISXCW3CSWUJZMP5SE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/24/23 12:07, Jason Montleon wrote:
> hdac_hdmi was not updated to use set_stream() instead of set_tdm_slots()
> in the original commit so HDMI no longer produces audio.
> 
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/regressions/CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com/
> Fixes: 636110411ca7 ("ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio")
> Signed-off-by: Jason Montleon <jmontleo@redhat.com>

Good catch indeed. Thanks Jason!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
