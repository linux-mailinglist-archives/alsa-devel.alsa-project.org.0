Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C872A606804
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 20:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A6F954B;
	Thu, 20 Oct 2022 20:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A6F954B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666289678;
	bh=JYL1+9Np9f1Fo6QHMqAAs3VF7rBoEbJfTsja8+UuhgE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trbXnKnCVx2hQ6zMpnlXKA80HzLviekNMnFmBX7XAgW843sWvSn4gIeG9TK0dkyzb
	 c0elNBMORr637ijVMD9XROPQ1XyKs60VAFuKQdSDF2m5/8/ySumyvNFtfe8de1EWW0
	 rxuDg8l9CKJWwGnWpTnbHzDLBubQcO8ORMrs5KB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D99E9F800B5;
	Thu, 20 Oct 2022 20:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B86EEF804D8; Thu, 20 Oct 2022 20:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B1A6F80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 20:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1A6F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vh0G/lPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666289617; x=1697825617;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JYL1+9Np9f1Fo6QHMqAAs3VF7rBoEbJfTsja8+UuhgE=;
 b=Vh0G/lPR6rdPBlgUKoKZsCsn/9Mxgry/s/GXo3G8O3XjF0YwlM9q/1XL
 tFxaqhCKFfR1OWAjtl2kwKDQ5t/ltDpBin4fbyWE2O2wXLF+PAADKQTEP
 juNFzgKttxwOliAKSUwjD5PBX4SfaDxDJfq+/Bqp/jvGjdZeHqWix3Azr
 cO53RPCZHGHPV1wfvDByMqbc4r3bE/8ZxMN745mxTGrGcYZ8V2Yvf5a1x
 srFefDYEOAgzP1lrzqcfo8LezHoiXSO/h76XY6Y5NEfICC2RogglESdmH
 KtmHx6c5sz21TV9qdOnmM0ATVN6bGCyXrEAsZt9BC3KweYR+AJbz2wLc+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307895063"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="307895063"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 11:13:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755303275"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="755303275"
Received: from awmoore-mobl1.amr.corp.intel.com (HELO [10.212.11.204])
 ([10.212.11.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 11:13:26 -0700
Message-ID: <5b94c9ef-a37b-9d71-ad05-5ce9ba103af0@linux.intel.com>
Date: Thu, 20 Oct 2022 13:13:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
 <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
 <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

Hi Jaroslav,

> Nope. It's just a short path for the non-driver field to not further
> process the destination string (the name argument). The snprintf() call
> sets all field types (it's before the condition). Just set the
> driver_name field in the soc card structure and you will be fine.
> 
> The UCM config must be updated to handle the new driver name. The fine
> selection key should probably use the card name, because long name is
> set from DMI:
> 
> old:
> 
> 1 [sofglkda7219max]: sof-glkda7219ma - sof-glkda7219max
>                      Google-Phaser360-rev4
> 
> new:
> 
> 1 [sofglkda7219max]: SOF-Intel - sof-glkda7219max
>                      Google-Phaser360-rev4
> 
> UCM substitutions:
> 
> 1 [${CardId}      ]: ${CardDriver} - ${CardName}
>                      ${CardLongName}
> 
> UCM conf:
> 
> mkdir -p ucm2/conf.d/SOF-Intel
> cat > ucm2/conf.d/SOF-Intel/SOF-Intel.conf <<EOF
> Syntax 6
> Include.0.File "/Intel/\${CardName}/\${CardName}.conf"
> EOF

I am not following any of this, sorry.

The existing UCM configuration uses the card name, e.g.
sof-glkda7219max. That works and needs zero extra work.

If all the cards registered in sound/soc/intel/boards use the same
"SOF-Intel" driver name, then the driver name cannot be used for any UCM
selection.

What is the point of including all the cardName.conf files at a higher
level that brings no obvious value beyond an indirection that we already
have with the path ucm2/Intel ?

What am I missing ??
