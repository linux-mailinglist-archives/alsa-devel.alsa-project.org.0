Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11DD01787
	for <lists+alsa-devel@lfdr.de>; Thu, 08 Jan 2026 08:56:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C1560203;
	Thu,  8 Jan 2026 08:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C1560203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767858963;
	bh=Oat8Ou69Boc/QWkzBIaS0AdsCze4tkLUTDL+HxfGJK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TjnphPNAIh1FXNwOvwB80jJ44lmesskvYcZ9YWUqahahkEhBWam5ntyJ9FkP4jBIV
	 xfLyk6ZM7eqg9jk8mJONAimeoVQglASTWTm5uw+CS82oPWPTx+w0BKneEDWnWcMsJT
	 Hp503ya7VyaS0WpFIroAZMka54gHTJ/Q5qB3jNXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A65FF805F0; Thu,  8 Jan 2026 08:55:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48126F805AB;
	Thu,  8 Jan 2026 08:55:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B78F80254; Thu,  8 Jan 2026 08:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EC45F80087
	for <alsa-devel@alsa-project.org>; Thu,  8 Jan 2026 08:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC45F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Lw3oNabD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767858844; x=1799394844;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oat8Ou69Boc/QWkzBIaS0AdsCze4tkLUTDL+HxfGJK0=;
  b=Lw3oNabDf6FkEENhKqgJtavfRDb5WVO62wvfKhokpu7CmEOGOO/RjG5Y
   6lLN3Kr1WwSMXTq2D2HZE6HNoUTBu40c09uOS0OUbU79YLmJ+Yf8LvQqn
   gpQgtNj+dGTUJVpDNAuNOOs4aes5+WpzYvAmTojj4prjq4Fzl78oaIAJD
   ixhZtwB5iLYOByPS+YH1pYh/amqV1mQLpBpWiKs+s70BwAQ4gNEiuCRrD
   wvg1IUETk9QJhcplzlyMqAO1D6ZdIE5AF9Hsx//O00kn7yduF+IVAS6Yi
   dpdv/UkW2x07D4hVqyn1r4P5lPQueYBKfVUvmDGMgUfo0ekOULPkpBTY1
   Q==;
X-CSE-ConnectionGUID: IxZ0OjARTVy6qBZAbo2kzQ==
X-CSE-MsgGUID: NhVCb9UIRTGDRRxa4ZXx5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69145177"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800";
   d="scan'208";a="69145177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 23:53:58 -0800
X-CSE-ConnectionGUID: BLtfOUCgQEKaL5ANX05Clw==
X-CSE-MsgGUID: w9c9+4rnQrS2SNMkEYMgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800";
   d="scan'208";a="207273581"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.246.92])
 ([10.245.246.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 23:53:57 -0800
Message-ID: <0a0234c5-b6c6-4318-b627-d75e75a7598c@linux.intel.com>
Date: Thu, 8 Jan 2026 09:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not
 supported on MTL platform
To: =?UTF-8?Q?Jos=C3=A9_Augusto_de_Almeida_Neto?= <jaalneto@hotmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: 
 <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: 
 <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LABDYGP3W7ALLFDFFI6NPB6LEQJD5YMD
X-Message-ID-Hash: LABDYGP3W7ALLFDFFI6NPB6LEQJD5YMD
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LABDYGP3W7ALLFDFFI6NPB6LEQJD5YMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi José,

The machine likely similar to Book 4 Pro, it is an HDA+companion amp setup:
https://github.com/thesofproject/linux/issues/5002

The bounty for Book 4 Pro resulted (as far as I know) working audio,
which can be replicated:
https://github.com/stephanlensky/galaxy-book4-linux-sound

You might need to add the quirk for the Ultra and by luck it might work
as well.

SOF is not needed, used in these machines as they are pure HDA devices.

-- 
Péter

On 08/01/2026 00:26, José Augusto de Almeida Neto wrote:
> Hi ALSA developers,
> 
> I'm reporting a hardware support issue with the Samsung Galaxy Book 4 Ultra
> (NP960XGL-XG1BR) running on Intel Meteor Lake (MTL) platform.
> 
> SUMMARY:
> The laptop has MAX98390 smart speaker amplifiers that are not supported in
> the current Linux kernel. Headphones work (ALC298 HDA codec) but speakers
> are completely non-functional.
> 
> HARDWARE:
> - System: Samsung Galaxy Book 4 Ultra (NP960XGL-XG1BR)
> - CPU: Intel Meteor Lake-P
> - Audio Controller: Intel MTL HD Audio (8086:7728)
> - HDA Codec: Realtek ALC298 (working for headphones)
> - Speaker Amps: 4x Maxim MAX98390 on I2C bus 2 (addresses 0x38, 0x39,
> 0x3C, 0x3D)
> - Kernel: 6.17.9 (also tested on 6.8.0 mainline)
> 
> ROOT CAUSE:
> 1. No machine driver match in soc-acpi-intel-mtl-match.c for Samsung +
> MAX98390
> 2. No SOF topology file for MTL + HDA + MAX98390 combination
> 3. NHLT only shows SSP2 (Bluetooth), no SSP configured for speakers
> 4. SOF falls back to generic skl_hda_dsp_generic (2-channel HDA only)
> 
> VERIFICATION:
> - MAX98390 chips respond on I2C (revision 0x42 confirmed on all 4 chips)
> - ACPI device MAX98390:00 present (status 15 - enabled)
> - ALC298 speaker DAC receives audio but no output from physical speakers
> - No I2S/TDM connection to MAX98390 amplifiers
> 
> I have collected detailed technical information including:
> - DSDT and NHLT ACPI tables
> - Full HDA codec dump
> - I2C bus scans and MAX98390 register reads
> - dmesg logs showing current SOF behavior
> 
> Full detailed report: BUG_REPORT.md attached
> 
> QUESTION:
> Is there ongoing work to support MAX98390 on Meteor Lake platforms?
> I'm willing to test patches and provide additional debugging information.
> 
> Thank you,
> Jose
> 


