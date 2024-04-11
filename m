Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CA8A155E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 15:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5542BC6;
	Thu, 11 Apr 2024 15:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5542BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712841401;
	bh=7VRjMLO3OkjDzMWstsLOrmcdXFMRXOwDI3UhW6A28nk=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WDJ/3x/9SRjR/Vz+L/7189xcbp2G6iYVqoQHRzc20Ej8D4Q1JIfN1wGI76i9jx2sw
	 yLIYdNSt0xoKCVFuUZkeP4jDD4SPXjU8FZ/2x7NYmIwGMGpkl+vku00VR4XI0lZEjc
	 L64S5Ggkjak9QY9+Y1jZwnJTUP19t28hIC+H+T28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7EFCF8057E; Thu, 11 Apr 2024 15:16:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A30F8057F;
	Thu, 11 Apr 2024 15:16:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD07F8026D; Thu, 11 Apr 2024 15:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD97AF80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 15:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD97AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KzdIKpZR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712841356; x=1744377356;
  h=message-id:date:mime-version:from:subject:to:cc:
   content-transfer-encoding;
  bh=7VRjMLO3OkjDzMWstsLOrmcdXFMRXOwDI3UhW6A28nk=;
  b=KzdIKpZR76vlwOLvSZim0cxp38FCjREROmNPmSxRmXagK5WL/lGiDyDh
   7y59zVzDuUzy8G9aUCJ5YiHEdv/1nd4BhUXatEGh7k0PjTDmlCT4UcYrc
   SP8bmnSKQnTG34pp5xSsM4/aaUMdMFbRNscF96ZNOa+bnWtJYsbSk4AR/
   3SLhtcF4EoQwe+aHJ0a6TypOlXgoYAmLbYSZnlgZzMf4s6UDpVtqJ0ppf
   6r/DxpGOsat19W+xxsWB0Fr6onpw0jSXVOxobOPf6HB1iNXlGln190p38
   lzAYVgooqWKn6lOi/EY9ag+gQ26dWc3JTebgsgyWky8/M/JGcFpzcadYE
   A==;
X-CSE-ConnectionGUID: IyCObjzMTI6GdA2mPsxsxQ==
X-CSE-MsgGUID: tXzcoj8nSWmb5eRghMf+eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19670067"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000";
   d="scan'208";a="19670067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:15:50 -0700
X-CSE-ConnectionGUID: IKEtevXlQ1GVSAdgH2ObNw==
X-CSE-MsgGUID: rRW3I0KHSyGNhkqjzkL+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000";
   d="scan'208";a="51862709"
Received: from dosull6x-mobl.ger.corp.intel.com (HELO [10.252.43.18])
 ([10.252.43.18])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:15:48 -0700
Message-ID: <fa1d1a94-57d9-4caf-9569-f9a9f3d725c2@linux.intel.com>
Date: Thu, 11 Apr 2024 16:15:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: UCM vs SOF vs HDMI passthrough
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 wim.taymans@gmail.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D6TCYB5Q6UL6THMWCZNTWGJJDE4HFP3L
X-Message-ID-Hash: D6TCYB5Q6UL6THMWCZNTWGJJDE4HFP3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6TCYB5Q6UL6THMWCZNTWGJJDE4HFP3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

afaik for HDMI passthrough there should be a usable PCM mapping present
for user space:
aplay -L | grep hdmi
hdmi:CARD=PCH,DEV=0
hdmi:CARD=PCH,DEV=1
hdmi:CARD=PCH,DEV=2

or similar.

SOF with IPC4 (Meteor Lake and newer or some TGL/ADL setups with 2024.03
release) it is possible to use passthrough via HDMI technically but we
are lacking the "hdmi:..." PCMs, so in reality it is not usable for
applications. Afaik.

So far I managed to cook up two ways of doing this, but neither one is
good enough as they will create the "hdmi:..." for both IPC3 and IPC4
setups and IPC3 firmware cannot support passthrough.

Setups:
sof-hda-dsp cards have HDMI PCMs: pcm3-5
sof-soundwire cards have HDMI PCMs: pcm5-7

[A] use card profile
Add these to /usr/share/alsa/cards/aliases.conf:
sof-hda-dsp cards.sof-hda-dsp
sof-soundwire cards.sof-soundwire

Create the minimal sof-hda-ds.conf and sof-soundwire.conf to handle the
two types of HDMI PCM numbering.

[B] Using UCM
https://github.com/ujfalusi/alsa-ucm-conf/tree/topic/sof-hdmi

It is using the BootSequence[] to create three files:
[1] /var/lib/alsa/conf.d/42-sof-hdmi.conf
[2] /var/lib/alsa/card[card_number].conf.d/30-sof-hdmi-common.conf
[3] /var/lib/alsa/card[card_number].conf.d/31-sof-hdmi.conf

[1] includes the pcm/iec958.conf and pcm/hdmi.conf to global space of
    alsaconf to be used by the card macros
[2] Card specific macros for hdmi PCM definition, ampping
[3] Card specific definitions of the three HDMI port

In both case I have the needed PCMs:
aplay -L | grep hdmi

hdmi:CARD=sofhdadsp,DEV=0
hdmi:CARD=sofhdadsp,DEV=1
hdmi:CARD=sofhdadsp,DEV=2
or
hdmi:CARD=sofsoundwire,DEV=0
hdmi:CARD=sofsoundwire,DEV=1
hdmi:CARD=sofsoundwire,DEV=2

But it is unconditional and they will be created for all sof-hda-dsp and
sof-soundwire cards.

I would really appreciate some guidance on how we can achieve this
correctly (the code for the UCM way leaves much to be desired, I know).

How can this be done conditionally?
We can set the HDMI PCMs to advertise IEC958_SUBFRAME_LE for IPC4 only,
but how can we use that?
Should we add some parameter to 'amixer -c0 info', like ipc_version:4/3,
so if the ipc_version is 3 or missing we assume that passthrough is not
supported?

Thanks for the help,
Péter
