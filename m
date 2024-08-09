Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551E94D0C7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 15:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE6FF54;
	Fri,  9 Aug 2024 15:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE6FF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723208634;
	bh=StJCn56NfSCbXiuX84fVBJOp8AURT5jnW7GtHmbmadE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XR9rHioXofC6UGqA2VuzDm0q3S+nUoqeAxbjWgXMyxkio00S00TUfmoEh/gjPwS38
	 28eLU/9HwoSKuQhPyb3iAEQGNsRe+sjDGfGPuJbOGPj0KF83Xt1MtpMxZ9MSoPeiJe
	 zBp/zJqyuIM9QmM4WXmlbfLcKwz9a+ruobi1yMeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 385B9F805BF; Fri,  9 Aug 2024 15:03:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA99F805AF;
	Fri,  9 Aug 2024 15:03:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D3EF8023A; Fri,  9 Aug 2024 14:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6E70F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 14:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E70F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CZWnbykh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723207988; x=1754743988;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=StJCn56NfSCbXiuX84fVBJOp8AURT5jnW7GtHmbmadE=;
  b=CZWnbykhMYX3YLEMUr9UKNFag6epoyAyfACSN3NVLxrb/Z+mOzmB6KlK
   7nqrtVxc+vlQDaYFctjRUl8zmRp1ViRgNIHHtFj0LXB9aQGEaDBNkNpnl
   1PTcj6ntuVV15kH9I+Vm1wIRDTkcsCw0ZrbV7rd8YYv08W4zzZjKDnGG+
   ftGVeWYc5+mzu2i1m63nO0kvEf8aULTWErs5VnG2Tp3H+UHKPUazTxylN
   z7SGXdrhdq8sAEJ4ZFPRsVtxk/4xDhhZ4vVfjzD79DxP4cW0H3XNpihO3
   aDUJixjOFgGYLKoxqMyM+uFuKJwl8gu/OW168ZUctRVJtwsXFa3mk5KoR
   A==;
X-CSE-ConnectionGUID: TkqM1qfYRTKjGoLQdTpbIA==
X-CSE-MsgGUID: gqoJ/C67SzWXvzhr9fryQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20942063"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="20942063"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:53:03 -0700
X-CSE-ConnectionGUID: HUnwVTzaQ3um/ldO5hPmgA==
X-CSE-MsgGUID: iVCjZyP7QSiYLwxvT1CzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="80791690"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249])
 ([10.245.246.249])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:52:58 -0700
Message-ID: <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
Date: Fri, 9 Aug 2024 14:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M5PMG5YC5THT43JDJL2RM7YMPBIHC2NQ
X-Message-ID-Hash: M5PMG5YC5THT43JDJL2RM7YMPBIHC2NQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5PMG5YC5THT43JDJL2RM7YMPBIHC2NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Why I use the metadata ioctl is because the ALSA controls are binding
> to the sound card.  What I want is the controls can be bound to
> snd_compr_stream, because the ASRC compress sound card can
> support multi instances ( the ASRC can support multi conversion in
> parallel).   The ALSA controls can't be used for this case,  the only
> choice in current compress API is metadata ioctl. 

I don't know if there is really a technical limitation for this, this is
for Jaroslav to comment. I am not sure why it would be a problem to e.g.
have a volume control prior to an encoder or after a decoder.

> And metadata
> ioctl can be called many times which can meet the ratio modifier
> requirement (ratio may be drift on the fly)

Interesting, that's yet another way of handling the drift with userspace
modifying the ratio dynamically. That's different to what I've seen before.

> And compress API uses codec as the unit for capability query and
> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
> format and output rate, channels definition just reuse the snd_codec.ch_in.

The capability query is an interesting point as well, it's not clear how
to expose to userspace what this specific implementation can do, while
at the same time *requiring* userpace to update the ratio dynamically.
For something like this to work, userspace needs to have pre-existing
information on how the SRC works.
