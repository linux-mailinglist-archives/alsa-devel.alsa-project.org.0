Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C3706AB4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425C37F4;
	Wed, 17 May 2023 16:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425C37F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332815;
	bh=pzFo4Z6t1V727ENInzSFlGTCw9zVEOcwoyprjyInogA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fxUYX68ir37NPFGvOtZINgFy/0xLjpDwmMKr5ggT2JNQybIBo9xKxD/JRhqRHPHla
	 bvI7cj2+3pMrpqZLq7Fl83ha/pSSpS3l2IqVme6uvS/ydyggxlGGCjxZf/OOUHAD15
	 +zARE1g97lh7er4lgk3cPuoBll4Ue+wkByrFdwRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74EC0F8024E; Wed, 17 May 2023 16:11:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC60EF80578;
	Wed, 17 May 2023 16:11:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBB5F80563; Wed, 17 May 2023 16:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF675F80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF675F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VUtyAiXN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684332705; x=1715868705;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pzFo4Z6t1V727ENInzSFlGTCw9zVEOcwoyprjyInogA=;
  b=VUtyAiXNYV8QBOifaGXqKu7wyvgXFqCIU6BHBsCrGCIEpllxV08WWCup
   +c+KwNG649sx1DdsuHI9zpRP0137XNReAhttuEpYbP5Lp7im0fKI66XXG
   RqowDzXjoK6LmW9X8b6xGV8E+YXyUzspPmEH4vi5EecqLrA+0N0kIPUps
   ckQt84YtyyjexeNnvKkJwWXW9XbVd+EcspsGJbkwtEiHju5Wc0b3zj9JH
   JS410kp+VBwdXLAJFhRkRW1Vjokt+lhYNXxSQ581QH7J/XOREPGipMF4L
   a7vmPgg3NP6yZMXk2bhZ7od+h5wW6bBZN9cCoqsuOvjDE6un4jHuIu+mQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349273422"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="349273422"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734709684"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734709684"
Received: from rdealba-mobl.amr.corp.intel.com (HELO [10.209.16.101])
 ([10.209.16.101])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:41 -0700
Message-ID: <0714fa41-b77d-6735-2abb-17d93c41ca51@linux.intel.com>
Date: Wed, 17 May 2023 08:36:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 2/9] ASoC: amd: ps: handle soundwire interrupts in acp pci
 driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
 <20230516103543.2515097-3-Vijendar.Mukunda@amd.com>
 <bc58e1b1-8bce-3894-f840-57dd2d802932@linux.intel.com>
 <fea77516-72ab-afa1-2336-ae9174e7bd7f@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fea77516-72ab-afa1-2336-ae9174e7bd7f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6A4EZBEONKG6CAU5AFVYVSI4OWRGHW44
X-Message-ID-Hash: 6A4EZBEONKG6CAU5AFVYVSI4OWRGHW44
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6A4EZBEONKG6CAU5AFVYVSI4OWRGHW44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +	if (ext_intr_stat & BIT(ACP_ERROR_IRQ_MASK)) {
>>> +		writel(BIT(ACP_ERROR_IRQ_MASK), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>>> +		writel(0, adata->acp63_base + ACP_SW0_I2S_ERROR_REASON);
>>> +		writel(0, adata->acp63_base + ACP_SW1_I2S_ERROR_REASON);
>>> +		writel(0, adata->acp63_base + ACP_ERROR_STATUS);
>>> +		irq_flag = 1;
>> it's not clear what this does? Looks like just filtering out interrupts
>> without doing anything about the interrupt source?
> When ACP error interrupt is raised, As per our design, ACP IRQ handler will clear
> the error interrupt by clearing ACP_ERROR_IRQ bit in ACP_EXTERNAL_INTR_STAT.
> 
> To know the error source reason, we need to read the ACP_ERROR_STATUS,
> ACP_SW0_I2S_ERROR_REASON, ACP_SW1_I2S_ERROR_REASON registers.
> After reading the Error registers, we need to clear these registers.
> Currently, we haven't added read register operations for error reason registers.
> This is for debugging purpose only.
> 
> In Current context, we refer ACP_SW0_I2S_ERROR_REASON  register to know errors like
> Sound Wire Bus clash detections, Command and Response Errors, BRA mode errors,
> FIFO underflow/overflow errors detected for SoundWire Manager -0 instance.
> Similarly, ACP_SW1_I2S_ERROR_REASON register referred to know errors detected for
> SoundWire Manager instance - 1.

If you didn't add the code to deal with the errors, a comment would be
welcome to clarify that the interrupts are cleared without looking for
the root cause.

It's hard when reviewing code to understand if there's a miss or
something that's intentionally omitted or to be added later.
