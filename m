Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D8IMDlPqGmVtAAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:26:49 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D125202A03
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BE260253;
	Wed,  4 Mar 2026 16:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BE260253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772638006;
	bh=2VD19bgJI0x1UihI0HQnWOMNn1lZUKuSVwf2lYt80Jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MPAcFfFaVZJwmFHJZXgEyX6AjIWyZlWUtqPeIexahCVxC90fzgB/ZP2BUGIbk2z7G
	 +EgVsYkO0xVtHMoKFQktu0CxyokpDi62ZhYZEYi5ItHn424g5KBWtOT4mb3kiNseQD
	 g4Qv8qzNLgb1hd4dTTLwClqS8G3fzxlsoD2IUxTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F1CF80612; Wed,  4 Mar 2026 16:25:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B0FF8060E;
	Wed,  4 Mar 2026 16:25:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43F1CF80254; Thu,  8 Jan 2026 11:20:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C49FF80075
	for <alsa-devel@alsa-project.org>; Thu,  8 Jan 2026 11:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C49FF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=SOuU5chI
Message-ID: <d748ba7c-165d-420a-bd33-a860acf2f01d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767867610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWP8qNiTUYkgDHDv2lHzz407A0e6GIIDf4QiSGW83mk=;
	b=SOuU5chIxERZv0IG+kefqFLuMnTPZFyNcZQ26ld9sOig12FzmlhV0YbBA2t8ndCNMFl8+C
	WxBZnUd7Wx70MFDN7dw1UenXFJfaAEEiugAyyn+95yGfOGDUxkacIEoho/P8vfjVZIlzcV
	5cTTL2pKK/49x70BcBiI8XFgWpG54qw=
Date: Thu, 8 Jan 2026 11:10:13 +0100
MIME-Version: 1.0
Subject: Re: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not
 supported on MTL platform
To: =?UTF-8?Q?Jos=C3=A9_Augusto_de_Almeida_Neto?= <jaalneto@hotmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: 
 <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: 
 <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: pierre-louis.bossart@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7IVNP5VUYWTSOGKRBYONXBOB6DYZDKWO
X-Message-ID-Hash: 7IVNP5VUYWTSOGKRBYONXBOB6DYZDKWO
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:25:49 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IVNP5VUYWTSOGKRBYONXBOB6DYZDKWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 2D125202A03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	DATE_IN_PAST(1.00)[1325];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaalneto@hotmail.com,m:alsa-devel@alsa-project.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hotmail.com,alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Action: no action

On 1/7/26 23:26, José Augusto de Almeida Neto wrote:
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
> - Speaker Amps: 4x Maxim MAX98390 on I2C bus 2 (addresses 0x38, 0x39, 0x3C, 0x3D)
> - Kernel: 6.17.9 (also tested on 6.8.0 mainline)
> 
> ROOT CAUSE:
> 1. No machine driver match in soc-acpi-intel-mtl-match.c for Samsung + MAX98390
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

This has nothing to do with SOF, the main issue is that the amplifier needs to be configured by HDAudio verbs which are translated by the HDaudio codec in I2C commands. The problem is to reverse-engineer what those verbs might be, usually with a Windows setup. There was a Wiki for this sort of things, see https://thesofproject.github.io/latest/getting_started/intel_debug/suggestions.html#reverse-engineer-the-windows-audio-driver

