Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E376C70E4A0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF69B20C;
	Tue, 23 May 2023 20:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF69B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866403;
	bh=bH9DkjwQCDbz6P1wuCe1exqA+AW9HUfS0R7iBFyxoBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FeolBfcCndBiVj9VTCJ2tjX+fXQyR9Bi3vr4GnkRVrbss4PI8SWFsz0kfuyNxWwbF
	 Oeo8IbjQaK9csT8ANdS2lYRSVzPpormJLvIlFY1P2BFyPlAw31Qx2BWUP+epRuSalZ
	 ckt6CHkgdn0LxjhYJZNpIZKxEpHnRr0FSXuDaSQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7572BF80549; Tue, 23 May 2023 20:25:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A7DF80549;
	Tue, 23 May 2023 20:25:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4C1DF80425; Tue, 23 May 2023 20:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C5C6F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5C6F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T9iaOdZv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684866295; x=1716402295;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bH9DkjwQCDbz6P1wuCe1exqA+AW9HUfS0R7iBFyxoBA=;
  b=T9iaOdZv0GX1ObzcgG/dig/V02bOhUNdK1Ud1U+xOuPCBvc7rlMyBo61
   rdOAGZUaFf7vVaUFN2Kgs3W3EAud5VN39avAjuN9hoazDCKoJLNUA//9n
   kHNCPYprnn511Wy3J9MZIlMkBaCN/KABdoNU/0wQ1pvpS/COwsEa1e+FX
   TIW5f83sEkOOpTZfn2l85fdOjz0Q0FPCl85YP8DFs93q+xOUd4NGgZXLf
   IrjsBmfWMYoiGddXQmxVndxS4tUxelYmNaZsaQgri+y7ojHzeIHot7mS9
   fu3OTtsa9lHmCjDVSM/yXyUWOnvbdi6D359nu3E4je7CL4EwH2rz4Tmrn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342786231"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="342786231"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736974292"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="736974292"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:35 -0700
Message-ID: <d1baccf7-c689-fc40-d616-855c253021fc@linux.intel.com>
Date: Tue, 23 May 2023 09:34:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 2/9] ASoC: amd: ps: handle SoundWire interrupts in acp
 pci driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-3-Vijendar.Mukunda@amd.com>
 <134a2efd-648a-fb4b-4b61-154173b97f04@linux.intel.com>
 <2e8d3af4-7d54-becf-1084-c9b07a3436d0@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2e8d3af4-7d54-becf-1084-c9b07a3436d0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R2PF5WCUQXME5OORNGWD4RTEZML6EOMG
X-Message-ID-Hash: R2PF5WCUQXME5OORNGWD4RTEZML6EOMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2PF5WCUQXME5OORNGWD4RTEZML6EOMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>>  static void acp63_disable_interrupts(void __iomem *acp_base)
>>> @@ -102,23 +103,55 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>>>  {
>>>  	struct acp63_dev_data *adata;
>>>  	struct pdm_dev_data *ps_pdm_data;
>>> -	u32 val;
>>> +	struct amd_sdw_manager *amd_manager;
>>> +	u32 ext_intr_stat, ext_intr_stat1;
>>> +	u16 irq_flag = 0;
>>>  	u16 pdev_index;
>>>  
>>>  	adata = dev_id;
>>>  	if (!adata)
>>>  		return IRQ_NONE;
>>> +	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>>> +	if (ext_intr_stat & ACP_SDW0_STAT) {
>>> +		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>> [1]
>>
>> this is confusing, if this is w1c, should this be:
>>
>> writel(ext_intr_stat, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>>
>> Otherwise you may be clearing fields that have not been set?
> As per our register spec, writing zero to register fields doesn't
> have any effect. Only writing 1 to register bit will clear that
> interrupt.
> We are handling bit by bit irq check and clearing the irq mask
> based on irq bit and take an action related to that particular irq
> bit.

Right, maybe an explanation in the commit message would help.
