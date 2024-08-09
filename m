Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B094D749
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 21:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7879AEA3;
	Fri,  9 Aug 2024 21:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7879AEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723231673;
	bh=EjHqHHKYoRZX3HoUBZAvpzA3I2pO6ift5GDZ3LPhRnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=se12loK1/ywl3XMGM9gjJuiAJ2TxAgJNiyZdxjzwd7sNzxAFyTEq+XvM7ohkz1F8O
	 RQ68iTAW5iFQ4kXhXYVGpOpYUzcq1dPE43vAHYi2Ix3/pz5QVGNyRHjIDBLVGEG32e
	 tZ5XmgTr31f+vROuCQ0I4DXR00V0jI4Zw/hZh2eU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 639DBF805AF; Fri,  9 Aug 2024 21:27:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B342DF805AB;
	Fri,  9 Aug 2024 21:27:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB678F802DB; Fri,  9 Aug 2024 21:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2548F8059F
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 21:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2548F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BY82d7Gx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723231251; x=1754767251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EjHqHHKYoRZX3HoUBZAvpzA3I2pO6ift5GDZ3LPhRnc=;
  b=BY82d7Gx1Q4HrVajP7IkWbWt7hCaA7HbJSWOduwUEIo8n/CwurPrA2kH
   3wW8Tmx1a//Z588h8MMgeW1AM1+CkrRm+FOUT61/gjp5+Fwe727PZHqHM
   s28jWOpjNwMoCxWLiOSNEZvff8NvHRnEkf/HnkLPV3bIsq9EyL/mdWglx
   xBjzXJf+fq8X+sjmsKJkCL8KNnxR006vqFXc5orx+bYr1aoaGcHxpfEGM
   yOtxvQn4rweZO2eNW7wcFFp40TjgrczeWsD4UZEK9pjtOGp/+40B4HaA/
   bqWkenvmTICECpdcaHTbrVq9mrKrCzs7FWpQouSGW7QKfmrDLN1hCT2o2
   A==;
X-CSE-ConnectionGUID: nZwAjSZRRoSemIY2ydQUeQ==
X-CSE-MsgGUID: fe/B8iWMSly4Rr0SfQyr/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25285244"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800";
   d="scan'208";a="25285244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:20:45 -0700
X-CSE-ConnectionGUID: WCOiZLDZT+WOhIWdX/i3CQ==
X-CSE-MsgGUID: UZY+OjWrRDqm300lv/H98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800";
   d="scan'208";a="61793214"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249])
 ([10.245.246.249])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:20:41 -0700
Message-ID: <a41029df-a1a3-4540-b28d-55fbfc3dcf1c@linux.intel.com>
Date: Fri, 9 Aug 2024 21:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
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
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WLRR7DBYVFO5PMLXIWCXTAN5SDHTSKMK
X-Message-ID-Hash: WLRR7DBYVFO5PMLXIWCXTAN5SDHTSKMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLRR7DBYVFO5PMLXIWCXTAN5SDHTSKMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>> And metadata
>>> ioctl can be called many times which can meet the ratio modifier
>>> requirement (ratio may be drift on the fly)
>>
>> Interesting, that's yet another way of handling the drift with userspace
>> modifying the ratio dynamically. That's different to what I've seen
>> before.
> 
> Note that the "timing" is managed by the user space with this scheme.
> 
>>> And compress API uses codec as the unit for capability query and
>>> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
>>> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
>>> format and output rate, channels definition just reuse the
>>> snd_codec.ch_in.
>>
>> The capability query is an interesting point as well, it's not clear how
>> to expose to userspace what this specific implementation can do, while
>> at the same time *requiring* userpace to update the ratio dynamically.
>> For something like this to work, userspace needs to have pre-existing
>> information on how the SRC works.
> 
> Yes, it's about abstraction. The user space wants to push data, read
> data back converted to the target rate and eventually modify the drift
> using a control managing clocks using own way. We can eventually assume,
> that if this control does not exist, the drift cannot be controlled.
> Also, nice thing is that the control has min and max values (range), so
> driver can specify the drift range, too.

This mode of operation would be fine, but if you add the SRC as part of
the processing allowed in a compressed stream, it might be used in a
'regular' real-time pipeline and the arguments  and implementation could
be very different.

In other words, this SRC support looks like an extension of the compress
API for a very narrow usage restricted to the memory-to-memory case
only. I worry a bit about the next steps... Are there going to be other
types of PCM processing like this, and if yes, how would we know if they
are intended to be used for the 'regular' compress API or for the
memory-to-memory scheme?
