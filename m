Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F33436B1D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 21:10:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C06C0167D;
	Thu, 21 Oct 2021 21:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C06C0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634843434;
	bh=aKIkAz7YYmQd0zSX4RtSdC1q/EAeo1LBEGlCEzAYdoc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+NN3szWczXfI+u5j5mWIx/Vnsmi7x/Bkm1hyqKE3/QY8scBgd3a5daC2QOxl3gu1
	 yzxEtyGIKotpqof1BNc8I7L1YetgEXD/cnpuid1WQEqdpTUEjAXx1juID4nSpQExvf
	 j5VXuJwWKNHdKzbrAaFklzpckKjQITcZGaSIEfYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B0FF80246;
	Thu, 21 Oct 2021 21:09:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E7CF80240; Thu, 21 Oct 2021 21:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BDF8F8011C
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 21:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDF8F8011C
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="315322547"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="315322547"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 12:08:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="463746455"
Received: from dtjenkin-mobl1.amr.corp.intel.com (HELO [10.213.185.117])
 ([10.213.185.117])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 12:08:58 -0700
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
 <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
 <d8b90004-6c64-8cef-266a-17b2a4a480d7@intel.com>
 <569f6bf6-c346-3059-fc7e-e8c46c7dc4b6@linux.intel.com>
 <994c6339-6f67-58e9-77a1-a2faa20ade72@intel.com>
 <857438fc-1d63-84a8-f42a-79b082297035@linux.intel.com>
 <f9320fb8-4609-8399-9b57-440f6cfd48e3@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <290ccb39-94ee-3b13-f18b-4a7f145942e2@linux.intel.com>
Date: Thu, 21 Oct 2021 14:08:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f9320fb8-4609-8399-9b57-440f6cfd48e3@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>>> Well, please see the updated declaration of snd_hda_ext_bus_init() in
>>> this very patch and then the existing code of
>>> sound/soc/intel/skylake/skl.c - skl_create().
>>> Last argument in updated declaration reads 'modelname'. Skylake-driver
>>> has its own, SOF initializes it differently.
>>
>> Not sure why you have your own?
>>
> 
> Not sure I understand the question. If you are talking about changing
> string 'sklbus' to something else, then I don't believe mixing changes:
> update to actual values assigned and assignment relocation in one patch
> is good. I used 'sklbus' as that's what is being currently assigned to
> ->modelname within skl_create(). Such approach makes the change more
> transparent.

What I meant is that this 'modelname' is a module parameter for legacy
and SOF driver, it's attached to the bus, but eventually used by the codec

hda_codec.c:    if (codec->bus->modelname) {
hda_codec.c:            codec->modelname =
kstrdup(codec->bus->modelname, GFP_KERNEL);

and even further down used to apply board-specific fixups.

"sklbus" doesn't seem to be related to codecs, boards or fixups, so not
sure what this parameter does in the end?

