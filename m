Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AB77678B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 20:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4885210;
	Wed,  9 Aug 2023 20:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4885210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691606548;
	bh=Tjc+ZL8zr1dEpEbee1DdKAwTTtNC80suij9zROizXTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ds23d9nDyLhphbc956ehAUdPRMWGAlvLblye1138MlZs6Qq+HxlbXiIlnFffMs94s
	 HkShaL6imNq8PDE3B0gxRl5AjZwyUdwkMBV6V7R26xfZajUy5Cn6wL6Un7yUdUqOwl
	 QTnyjDlTTRDoRcPzxrVcofzimnVaOv3PLc0YukAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E540EF80536; Wed,  9 Aug 2023 20:41:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A19BFF80116;
	Wed,  9 Aug 2023 20:41:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D9DF80134; Wed,  9 Aug 2023 20:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83311F800FE;
	Wed,  9 Aug 2023 20:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83311F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dkWzPIbG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691606487; x=1723142487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Tjc+ZL8zr1dEpEbee1DdKAwTTtNC80suij9zROizXTk=;
  b=dkWzPIbGJN3CkVfjzJ5VNhp8htyl8v2/7VE7KXajWIuwOGSgUuNRgQkP
   5OgC5U+BcmcrGla8cSPtTIP+nezAhpTojW3+/h6gif+wpHeGl1W3ryrPP
   lgmROHeaLWY9/uSMozDCTnHFMm64EmJooPxyEZNRFnL91NwmGiwwVWfH8
   mLuj7KQjtgtdlMn6Ui7pA+8aFThgwukg+CCBXPOvx8WcKQipWY1IxGMTD
   NTnxFmnI/OoKiuN6juIq7fLJ2Ij/AuAcF9R0wMQ4VW7HI+IkSLOqVJTzO
   YiqF/yyfRA2oPl8WfFWrWp+LO+W7dcW+IoI4Ar2yLHlIQepK2lvbQ0Ked
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374915994"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="374915994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 11:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="978511742"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="978511742"
Received: from jcaminer-mobl.amr.corp.intel.com (HELO [10.212.58.36])
 ([10.212.58.36])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 11:41:18 -0700
Message-ID: <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
Date: Wed, 9 Aug 2023 13:41:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, broonie@kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Cc: kai.vehmanen@linux.intel.com, ndesaulniers@google.com, trix@redhat.com,
 rander.wang@intel.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev, patches@lists.linux.dev
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GNT46XFKO2ODX4EH4NXHY6HDLBRJAUZK
X-Message-ID-Hash: GNT46XFKO2ODX4EH4NXHY6HDLBRJAUZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNT46XFKO2ODX4EH4NXHY6HDLBRJAUZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/9/23 13:12, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR):
> 
>   sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
>     423 |         if (chip && chip->check_sdw_wakeen_irq)
>         |             ^~~~
>   sound/soc/sof/intel/hda.c:418:39: note: initialize the variable 'chip' to silence this warning
>     418 |         const struct sof_intel_dsp_desc *chip;
>         |                                              ^
>         |                                               = NULL
>   1 error generated.
> 
> Add the missing initialization, following the pattern of the other irq
> functions.
> 
> Fixes: 9362ab78f175 ("ASoC: SOF: Intel: add abstraction for SoundWire wake-ups")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Indeed, thanks Nathan for flagging this obvious mistake. I must have
done something wrong when extracting the patches.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

That said, we DO compile with clang and there was no warning
https://github.com/thesofproject/linux/actions/runs/5542372669/job/15010818307

Is this dependent on a specific version of clang? I'd like to make sure
our tools and tests are updated.
