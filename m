Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B754B44E68B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 13:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E956166E;
	Fri, 12 Nov 2021 13:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E956166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636720608;
	bh=KyrrxJ3muIvGnp1xwIu6sJTZlsdIsXCJsaZpG0UgVFQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2ttuif//cgCuzhsX+XPAkIOSXUKMrsDToXlw6b6jeJhNAo29X+wVJSlbZGQcQo+e
	 53/XP3oLINcbdDw+TszYGEWzAA8RzXUqNl9urolDNyV2N73gnrHUJgXZ5t5cxTrzLY
	 0KFOhdfLQKVfFIJLW0TSoOjgl/v7fpIjCE37IaEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A804F804B1;
	Fri, 12 Nov 2021 13:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19AC3F8049E; Fri, 12 Nov 2021 13:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19D9EF800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 13:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D9EF800C1
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="293949577"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="293949577"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 04:35:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="504872249"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 04:35:13 -0800
Date: Fri, 12 Nov 2021 14:27:34 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: fix general protection fault in
 azx_runtime_idle
In-Reply-To: <s5hczn53d4l.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2111121424170.3554566@eliteleevi.tm.intel.com>
References: <20211110210307.1172004-1-kai.vehmanen@linux.intel.com>
 <s5hzgqb65h0.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2111110015250.3554566@eliteleevi.tm.intel.com>
 <s5h1r3m6csi.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2111111920450.3554566@eliteleevi.tm.intel.com>
 <s5hczn53d4l.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, mahesh.meena@intel.com
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

Hi,

On Fri, 12 Nov 2021, Takashi Iwai wrote:

> On Thu, 11 Nov 2021 18:39:36 +0100, Kai Vehmanen wrote:
> > And later
> > [   54.770701] Enabling runtime PM for inactive device (0000:00:1f.3) with active children
> > [   54.770718] WARNING: CPU: 0 PID: 10 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0x98/0xb0
> > 
> > Adding a "pm_runtime_set_active(&pci->dev)" to both azx_free() and 
> > azx_probe_continue() seems to help and fix still works.
> 
> Ah yes, I was confused as if it were already called in hdac_device.c,
> but this was about the HD-audio bus controller, not the codec.
> 
> Below is the revised one.
[...]
> Currently we haven't explicitly enable and allow/forbid the runtime PM
> at the probe and the remove phases of HD-audio controller driver, and
> this was the reason of a GPF mentioned in the commit e81478bbe7a1
> ("ALSA: hda: fix general protection fault in azx_runtime_idle");
> namely, even after the resources are released, the runtime PM might be
> still invoked by the bound graphics driver during the remove of the
> controller driver.  Although we've fixed it by clearing the drvdata
> reference, it'd be also better to cover the runtime PM issue more
> properly.
> 
> This patch adds a few more pm_runtime_*() calls at the probe and the
> remove time for setting and cleaning up the runtime PM.  Particularly,
> now more explicitly pm_runtime_enable() and _disable() get called as
> well as pm_runtime_forbid() call at the remove callback, so that a
> use-after-free should be avoided.
> 
> Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

ack, tested this and no warnings anymore.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
