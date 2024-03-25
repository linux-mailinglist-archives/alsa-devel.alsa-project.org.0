Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706188B354
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:02:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010381928;
	Mon, 25 Mar 2024 23:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010381928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404128;
	bh=a8ojaLzDl4GFJujvayJ70jYfCqO9SVCGKM0gEiJ//B0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r02SRZvMSDDf4nJyLI5233mrJsEmXqY0lb5SST88RiOWahLfnfi7mDDbmkoTgWLpA
	 4dGjmDtoUVay2eF6U+JcW2FfBak6PJblrCSrCJhwdITNiO1ewqTBz4xDyAqfE1dK0/
	 ISMdH38k63gCooaF2vob4wuHxrsPrfx+T/KyfRSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11451F805AF; Mon, 25 Mar 2024 23:01:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4FBF805A0;
	Mon, 25 Mar 2024 23:01:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86AEAF8025F; Mon, 25 Mar 2024 23:01:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 579F2F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579F2F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZcBBfO1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404086; x=1742940086;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a8ojaLzDl4GFJujvayJ70jYfCqO9SVCGKM0gEiJ//B0=;
  b=ZcBBfO1Aj/sdrdFcZ3jVPRQR2LtJQdIMtNaeb3TtqR76z6x8X0TwGYi2
   1V+Tr/XVm+CmWAPZK+TT9DP3+hRBQ0O8Ks4XojWKcLdqfJ1dJYRRf3cfR
   actkTpmBLdZBHiM7I30RdBBQENJS7NDghbB9M9Zlk/ABVejIW08z2FGxW
   bEAVOBln4MWTmA59UmNJ56Jlf8CRhfRGL8dVO0d3fo3iZXbevRUjtFpWm
   umncjAunjMsw8t1oAJWrQyjpV1omRcqMhRVPYglljtSV5epNp6KrtMj5Y
   +1aDXP5l4DojJNFX0pvFgn5id7QmQbBRz+CULHlJ2XUEuRWVlXV4t1LGa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17827857"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="17827857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15619103"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO [10.212.98.109])
 ([10.212.98.109])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:01:19 -0700
Message-ID: <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
Date: Mon, 25 Mar 2024 17:01:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ALSA: hda/tas2781: add debug statements to kcontrols
Content-Language: en-US
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1711401621.git.soyer@irl.hu>
 <cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OW5ZVFH6RZSEYUYOYHUYK2RS4IVWQTBG
X-Message-ID-Hash: OW5ZVFH6RZSEYUYOYHUYK2RS4IVWQTBG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OW5ZVFH6RZSEYUYOYHUYK2RS4IVWQTBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -189,6 +189,9 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
>  
>  	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
>  
> +	dev_dbg(tas_priv->dev, "%s: %d\n", __func__,

Nit-pick: you don't need to add __func__ to dev_dbg logs, the user can
add the information with the dyndbg parameter, e.g.

options snd_intel_dspcfg dyndbg=+pmf

dev_err/warn don't have this functionality though so in those cases
there's no replacement for __func__


