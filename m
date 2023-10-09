Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A238E7BE8B4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 19:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9139EEBB;
	Mon,  9 Oct 2023 19:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9139EEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696873929;
	bh=ZDhJqOJMdsU7dJI/IxlKV0R264Ko4eg2Uqt/Bnq4Ds0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4PYaVgly6dxNuMkM5nv7RrlvQt2Eq7wOQ8qM4GTBpYiCyhj4drc5IOoMkURoqkYJ
	 fxALyEzN73bwiLVxvPxs5PkT9AkiE34K/+7EzbpALX7/rCk7+KUjITbIL7NHa0ueJU
	 Tk226Pvu1kzym6d7A8ZeVJ2GIgeOdEu6xZ30Ibck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D31B4F80553; Mon,  9 Oct 2023 19:51:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ADCDF80166;
	Mon,  9 Oct 2023 19:51:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E76A5F802BE; Mon,  9 Oct 2023 19:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4FECF8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 19:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FECF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GvElpvDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696873873; x=1728409873;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=ZDhJqOJMdsU7dJI/IxlKV0R264Ko4eg2Uqt/Bnq4Ds0=;
  b=GvElpvDToA491dZ9rwlf0cXk7DHEwzHRmnZzqcnl3OgDBqbp5MA4rIP6
   BO0MJC1AogYpDZ9jvspNq0f34Y9wbWhxQTE8Nx3pblYbEmrBSAypHskF+
   AePLrhMZByxOrazzvu3PyBqypRQtAP7u+oYgNd6d3ypa33rMMc+aCA1OV
   YyI8aMlfxY3OpTYwV4kq9bXXVuL6AkXx8OWcKst1GlABCdHcikvatxfoP
   ip3TxrFWmynJbQ1wBndSV3VHHK5Ee32+bHdyVPgRxhTdLuD1N2uBD3aD9
   58WbDPZiA9h8Pvjzc3T28eO9VBDEbYIZdWTXxDQtI1Ol9lFAEDvZdUZNx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364499382"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="364499382"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823415116"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="823415116"
Received: from cyortiz-mobl.amr.corp.intel.com (HELO [10.213.176.51])
 ([10.213.176.51])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:51:07 -0700
Message-ID: <46f10d4e-4de4-478b-939f-9d0fc2dfb04a@linux.intel.com>
Date: Mon, 9 Oct 2023 13:51:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hda/realtek: Add SND_PCI_QUIRK entry for the Dell XPS
 9530 laptop for dual speakers
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: brett@worth.au, alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <9c7b08fc-7f00-4894-a5b2-f3fc5f99e022@gmail.com>
 <2cfbeaab-9bdc-499b-8525-2296c0481cf4@linux.intel.com>
In-Reply-To: <2cfbeaab-9bdc-499b-8525-2296c0481cf4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3NMNRNPD76E345PR3BN3KBLECCKGPKTI
X-Message-ID-Hash: 3NMNRNPD76E345PR3BN3KBLECCKGPKTI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NMNRNPD76E345PR3BN3KBLECCKGPKTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/9/23 13:35, Pierre-Louis Bossart wrote:
> 
> 
> On 10/7/23 07:43, Brett Worth wrote:
>> The Dell XPS 9530, like previous XPS laptops like the 9520 and 9510 have
>> dual speakers in each channel.
>>
>> If the ALC289_FIXUP_DUAL_SPK flag is not set in
>> sound/pci/hda/patch_realtek.c only the tweeter will work and therefore
>> make the sound quality terrible.
>>
>> This patch has not been tested but is derived from a previous patch
>> attempt from a different user called Pentracillin which was rejected.
> 
> This looks like the same issue posted here
> https://github.com/thesofproject/linux/issues/4624. I added a link to
> see if others can test.

feedback was quick, this patch doesn't seem to solve the problem

https://github.com/thesofproject/linux/issues/4624#issuecomment-1753416738
