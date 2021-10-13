Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC242C110
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 15:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38B41675;
	Wed, 13 Oct 2021 15:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38B41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634130680;
	bh=7m7EfH/zUZP99e4EZpqOWzO8X2MkRjqzezczEyYF0zI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrJPE8Eqj9q3g5J3PvSBCjN9s6MM0ylqvgQDJ0hkuaYKbS6sAXTu7ijlEYp6Ss7qJ
	 hw8oZTFnngoOfgP9+CN7R+WEiSwk+mi8UYp0G+zuOVOGD0W2Vc+T1PFtApbn0yzpQJ
	 XbUa7KjHSFwjCI2YKYVyHx3q+fnaLQdIMl37eGG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61FBDF8028D;
	Wed, 13 Oct 2021 15:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 392ECF80269; Wed, 13 Oct 2021 15:10:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48F5CF800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 15:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F5CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Wx7I7ej+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 636A1610FC;
 Wed, 13 Oct 2021 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634130592;
 bh=7m7EfH/zUZP99e4EZpqOWzO8X2MkRjqzezczEyYF0zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wx7I7ej+sxeJQCf9x4/LREq2NXMV01Tq8P+tnbeia7QrIxq0cY7L8deG75Z3DXX37
 oNOecuKpLP5egwHkQcgDxvJeu8hEwRzPaWa/k4RFSCKRtiNWfjE71HkGAm9ES6Vyr2
 LJhtwm15yKqYxG/rcAoEIXiE/8bw0Ss9OmlXjktQ=
Date: Wed, 13 Oct 2021 15:09:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
Message-ID: <YWbangk7KAxZFoq3@kroah.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
 <YVxiyzNrKG8S1GDb@kroah.com>
 <alpine.DEB.2.22.394.2110061613520.3554566@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110061613520.3554566@eliteleevi.tm.intel.com>
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Imre Deak <imre.deak@intel.com>,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Russell King <rmk+kernel@armlinux.org.uk>,
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

On Wed, Oct 06, 2021 at 04:47:57PM +0300, Kai Vehmanen wrote:
> Hi,
> 
> On Tue, 5 Oct 2021, Greg KH wrote:
> 
> > On Wed, Sep 22, 2021 at 11:54:32AM +0300, Kai Vehmanen wrote:
> > > In current code, the devres group for aggregate master is left open
> > > after call to component_master_add_*(). This leads to problems when the
> > > master does further managed allocations on its own. When any
> > > participating driver calls component_del(), this leads to immediate
> > > release of resources.
> [...]
> > > the devres group, and by closing the devres group after
> > > the master->ops->bind() call is done. This allows devres allocations
> > > done by the driver acting as master to be isolated from the binding state
> > > of the aggregate driver. This modifies the logic originally introduced in
> > > commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")
> > > 
> > > BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> > > Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > What commit does this "fix:"?  And does it need to go to stable
> > kernel(s)?
> 
> I didn't put a "Fixes" on the original commit 9e1ccb4a7700 
> ("drivers/base: fix devres handling for master device") as it alone
> didn't cause problems. It did open the door for possible devres issues
> for anybody calling component_master_add_().
> 
> On audio side, this surfaced with the more recent commit 3fcaf24e5dce 
> ("ALSA: hda: Allocate resources with device-managed APIs"). In theory one 
> could have hit issues already before, but this made it very easy to hit
> on actual systems.
> 
> If I'd have to pick one, it would be 9e1ccb4a7700 ("drivers/base: fix 
> devres handling for master device"). And yes, given comments on this 
> thread, I'd say this needs to go to stable kernels.

Then please add a fixes: line and a cc: stable line and resend.

thanks,

greg k-h
