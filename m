Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A649F96DA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 17:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B69E06023A;
	Fri, 20 Dec 2024 17:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B69E06023A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734713325;
	bh=K+IAyVV6uYzSnEM/kInSC/ZiUi+9E8IFwxwlwVeUewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uirexl8H/r2BJ6UQ+ChvGVEp/ay4NXz1w9iwVmxvqIfXfbV7Sv3FXHV+V+ikHQZnF
	 LIpeKUQ3UN1FDPAX3zL+8a3VygH2FXfOd6NswMx2SJnRUzx0IDUQ4S+RMyYbOlOJjP
	 93+dx7sekFziBYuHytv8iv0dZDTSXc+9FOM+FZ7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64223F805BD; Fri, 20 Dec 2024 17:48:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D42FF805BE;
	Fri, 20 Dec 2024 17:48:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBDFF80508; Fri, 20 Dec 2024 17:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3860FF8003C
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 17:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3860FF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nBJe5o5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734713283; x=1766249283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+IAyVV6uYzSnEM/kInSC/ZiUi+9E8IFwxwlwVeUewA=;
  b=nBJe5o5KlKAaJADmv6UBzlEGMvrMVzG3chjGyjjb0O9V2IeGeMlT6Nq6
   V0hAYMU4ZDxTZ5KuuofXPVR+3ijVrEXIswgAHz7WBakaECdXoDHmjwy0s
   G+jWsbKikcbvvgDyJ3KtK9LSmCzvbV/I+aAgYrUbmCA2vRwKep+6pPY/j
   4FwgnxlsIOIh3cB2dOWpBBKGufzH4ahsl4NFOwL5FZcQdM6TR/H1Te3zd
   vPalEwyOWxpyxliWeHINBKeoh64K2F2kcujqLMn5gM50/ZehMg2AFPyx0
   66BOrl8ho1mCJ9kuhocNE8TTLaFBExIF4350zNMCpSqKjqD6mqoic9DQ7
   g==;
X-CSE-ConnectionGUID: +FLUUGEDTNCBTSNzraS9xQ==
X-CSE-MsgGUID: 4fuJsYNnQkCCcdvkA8HMVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52671015"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600";
   d="scan'208";a="52671015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:47:52 -0800
X-CSE-ConnectionGUID: 3Y7ykk91Q2+JFYmyfHDzFQ==
X-CSE-MsgGUID: bgTXGys2QHGJzk3h2Haa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600";
   d="scan'208";a="98334337"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:47:50 -0800
Date: Fri, 20 Dec 2024 10:47:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Alsa-devel <alsa-devel@alsa-project.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <dev@lankhorst.se>,
	dri-devel@lists.freedesktop.org
Subject: Re: hda: how to implement component master_unbind?
Message-ID: <bjirj7rd3ekt4ysbiwhets3grjq3xegz6hzraqhsuhbnvpqsx5@vohnnoczp26r>
References: 
 <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
 <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
 <alpine.DEB.2.22.394.2412191343280.14041@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2412191343280.14041@eliteleevi.tm.intel.com>
Message-ID-Hash: DZL3MISRLJSKEMSY3B2L3NHSLFP7I23N
X-Message-ID-Hash: DZL3MISRLJSKEMSY3B2L3NHSLFP7I23N
X-MailFrom: lucas.demarchi@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZL3MISRLJSKEMSY3B2L3NHSLFP7I23N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 19, 2024 at 04:00:08PM +0200, Kai Vehmanen wrote:
>Hi,
>
>On Fri, 13 Dec 2024, Lucas De Marchi wrote:
>
>> Thanks Kai to pointing me to this thread, trying to revive it.
>> Also adding dri-devel as it may be relevant there and Maarten who worked
>> on the xe integration recently
>
>ack, given fresh wave of bugs this year (even if these are all (?) bugs
>triggered in test configurations), probably warrants another look.
>
>[1) prevent/block the unbind if audio device is busy]
>> and there's no way to block unbind from the pci level neither, so this
>> is not really possible. There's nothing blocking someone to unplug the
>> card if it's on a hotplug-capable bus and/or someone calling
>>
>> 	# echo 0000:00:02.0 > /sys/module/xe/drivers/pci:xe/unbind
>>
>> to tell the module to unbind from the device. If that involves multiple
>
>Ack, I think we can put this option to rest.
>
>[unbind the ALSA card]
>> yeah, since it depends on the i915/xe side to power up the display
>> engine, I think handling that esssentially the same as a hotplug would
>> be ideal
>[...]
>> I'm not yet very familar with the sound side and checking if something changed
>> from when this thread started: for cards that can't work without the
>> other component, would it be hard to escalate that event to handle it
>> the same as a hotplug? Because from this thread it seems usb/pci hotplug
>> is already available.
>
>I don't think much has changed. I think this is (still) a doable option,
>but just requires effort put in (which so far has not happened). I think
>the problem can be roughly divided in two categories:
>
>1) discrete graphics - controller on discrete PCI device
>
>Here the problem is more acute (as may affect register accesses done from
>audio driver), but potentially also easier to fix. There is a single
>driver (snd-hda-intel) to handle this case in ALSA and the sound card
>created only exposes the HDMI/DP PCMs, so if graphics side unbinds,
>disconnecting the ALSA card seems ok as well. The open I have is how do we
>recreate the ALSA card. Audio driver probe is triggered by attach of the
>PCI device, but here the PCI device is not unplugged, just unbound by one
>of the drivers. But doesn't sound like a unique problem to audio, so I'm
>sure there's some example solution to follow.

since we are using include/linux/component.h, i915-display will call
component_del() on unbind, which should trigger all components to be
unbound - snd should release all the references it holds to display
power.

once we add back the i915/xe side with component_add() it should
complete the aggregate driver and bind again all sides.

Lucas De Marchi

>
>2) integrated display codecs
>
>The regular laptop case is a bit more iffy as there are more audio drivers
>using the display codec driver stack (each need support), and in most
>cases, the ALSA card is a mix of HDMI/DP but also internal codec and
>speaker PCMs. If we use the card disconnect infra in ALSA (i.e. same infra
>as USB hotplug), this means display unbind will not just disconnect the
>HDMI/DP PCM device, but alsl the interal audio codec and speakers. And
>there's a bigger issue how we reenumerate the full card again.
>
>I think the longterm solution is to move the HDMI/DP PCMs to their own
>ALSA card. We in fact some work going on to this direction in the SOF
>driver, but it's far from complete, and we are not sure whether we can
>change the existing platforms to use this approach (as changing the card
>topologies will be visible to user-space as well and potentially break
>stuff).
>
>I did file a bug to track this in SOF
>https://github.com/thesofproject/linux/issues/5276 .
>
>Br, Kai
