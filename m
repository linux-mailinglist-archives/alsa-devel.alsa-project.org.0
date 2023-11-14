Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9C7EB57F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 18:26:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCF31ED;
	Tue, 14 Nov 2023 18:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCF31ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699982769;
	bh=IhJmPulxr/ycbBs+CqXg6pJzufI6ps1PzmIDiWD79MI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u4Xp9owQ4ELhbb+RB4yL/omKxHLUUS2MMWHGfe9MoSjdeZyDO5JT9eIvf9xpWxb6z
	 zTVZDsZ+V/WzpvXZP2FLrjzSvTV5zFhBYF22dg6Ke7IDN7uyvPd+buQ639jCTyGVz4
	 LnNY4Z9hTJBLR/NSjzdjtHFTP9ZV9Vf5Z0MTA5Gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EDAF80549; Tue, 14 Nov 2023 18:25:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C93F8016E;
	Tue, 14 Nov 2023 18:25:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AD9F801D5; Tue, 14 Nov 2023 18:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9191AF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 18:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9191AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PwdCv2km
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699982701; x=1731518701;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IhJmPulxr/ycbBs+CqXg6pJzufI6ps1PzmIDiWD79MI=;
  b=PwdCv2kmifcklro3qKSzAzW/ZNv7NfLNu1EveWgyyAkG9lzRg3XXWDVt
   c7k0gEEDt1EfbodPb96cA4A12UH0tsbuNYAGjUy8imUDlFaZtGpsnDrCL
   +QapOfXeMEn7NsSEy6b21baqi1cN7mY257Lb+eTfoDsA+3IWOE9nOMfT9
   nvEvo7e1ZvdVgZF2qJeiJZbyrR6lV9INxndqmCRCwy1ktZiGGvypNIoeZ
   wSr6Yfar9/AHhmQyTnHsbG6clVvS12Bi9ldDuVD4MxJv9vcBl2auWcgyv
   +zybomuCYEIu848z9x12OjrocTOCojeYjvirYv9YkzTiJXTFCpiaQATHI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381099049"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381099049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741154705"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="741154705"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:24:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move
 snd_hdac_i915_init to before probe_work.
In-Reply-To: <87jzqkp99j.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
 <569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
 <DM8PR11MB5655518A6F21A2E4CA2E76D3E0B2A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <87jzqkp99j.wl-tiwai@suse.de>
Date: Tue, 14 Nov 2023 19:24:51 +0200
Message-ID: <874jhos0ws.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: J7OSSL46FXH4RVOD6LSMI4WGV3FOBJFG
X-Message-ID-Hash: J7OSSL46FXH4RVOD6LSMI4WGV3FOBJFG
X-MailFrom: jani.nikula@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7OSSL46FXH4RVOD6LSMI4WGV3FOBJFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Nov 2023, Takashi Iwai <tiwai@suse.de> wrote:
> (Also thought that drm-tip or whatever tree also drags the recent
> changes from sound.git tree for relevant part.)

We've dropped the sound branches from drm-tip, mostly because they were
repeatedly rebased on Linus' master (as opposed to tags) during the
merge window.


BR,
Jani.


-- 
Jani Nikula, Intel
