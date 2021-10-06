Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04F423FAA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 15:56:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED4A846;
	Wed,  6 Oct 2021 15:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED4A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633528614;
	bh=dP0wRh3KaQcYr/5G/ioL3yPGUhBcaOVC1wbC733/iIw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tr95udh1mvD6HIagOmw6I5VAF6xDO82vFtRGy9o4LjBWl8Hw8ESuy1d6PPKEckC2k
	 BdUehkDoHfZARcal4U1vcOp7+4FLhgfhPVcC14cY17SqbROCgAmCNFJ6/Atuol7Rs9
	 DPN6zV/+mP2BRIoyL97TCI/ioqrAx/H/7xP0JgQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F17F80249;
	Wed,  6 Oct 2021 15:55:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16BBF80240; Wed,  6 Oct 2021 15:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60559F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 15:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60559F8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223393556"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223393556"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:54:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="522241719"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:54:52 -0700
Date: Wed, 6 Oct 2021 16:47:57 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
In-Reply-To: <YVxiyzNrKG8S1GDb@kroah.com>
Message-ID: <alpine.DEB.2.22.394.2110061613520.3554566@eliteleevi.tm.intel.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
 <YVxiyzNrKG8S1GDb@kroah.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Russell King <rmk+kernel@armlinux.org.uk>,
 Russell King <rmk+kernel@arm.linux.org.uk>, intel-gfx@lists.freedesktop.org
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

On Tue, 5 Oct 2021, Greg KH wrote:

> On Wed, Sep 22, 2021 at 11:54:32AM +0300, Kai Vehmanen wrote:
> > In current code, the devres group for aggregate master is left open
> > after call to component_master_add_*(). This leads to problems when the
> > master does further managed allocations on its own. When any
> > participating driver calls component_del(), this leads to immediate
> > release of resources.
[...]
> > the devres group, and by closing the devres group after
> > the master->ops->bind() call is done. This allows devres allocations
> > done by the driver acting as master to be isolated from the binding state
> > of the aggregate driver. This modifies the logic originally introduced in
> > commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")
> > 
> > BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> > Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> What commit does this "fix:"?  And does it need to go to stable
> kernel(s)?

I didn't put a "Fixes" on the original commit 9e1ccb4a7700 
("drivers/base: fix devres handling for master device") as it alone
didn't cause problems. It did open the door for possible devres issues
for anybody calling component_master_add_().

On audio side, this surfaced with the more recent commit 3fcaf24e5dce 
("ALSA: hda: Allocate resources with device-managed APIs"). In theory one 
could have hit issues already before, but this made it very easy to hit
on actual systems.

If I'd have to pick one, it would be 9e1ccb4a7700 ("drivers/base: fix 
devres handling for master device"). And yes, given comments on this 
thread, I'd say this needs to go to stable kernels.

Br, Kai
