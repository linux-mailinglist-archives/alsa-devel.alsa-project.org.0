Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B7422B27
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 16:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299F71673;
	Tue,  5 Oct 2021 16:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299F71673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633444649;
	bh=WvZ8JLb5v93QBADCd0vUKgm5lhpJbxIW9TwhqZ0TzdM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OikgkdmyzS3CXGUn6zg7YypQS1D1NurrU4KBFrb0cjYKWEHkWImVm2M2UReA1ojcp
	 Rw7JPLvXbzoX1BOHnwNYQOxquuHlUmiy0XqNg7jd8Jct90vSgqB5LyAoa0dLky9shP
	 U1ZrYglxIVn4Vq6nLqUVKc341JiOJkwZH/eWQZbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E51F80154;
	Tue,  5 Oct 2021 16:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0273F8027D; Tue,  5 Oct 2021 16:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C332F80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 16:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C332F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="JjFWcOLG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE7161372;
 Tue,  5 Oct 2021 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633444557;
 bh=WvZ8JLb5v93QBADCd0vUKgm5lhpJbxIW9TwhqZ0TzdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjFWcOLGO1DYCmQLBXXDU7pHE4TCziZiUu68bh6z27RvqRP1ihbXe1Ukc99/QzH78
 JPaz5bk7gVXpoOMDb2UOHjch5c17x6n9GX3+wNanmyCgiKoRGKX7//xQ+umkLA+Hm3
 fWgJx+vTpPM2oJGtjz7bzQFiYgBLKbmxo0CC4XxM=
Date: Tue, 5 Oct 2021 16:35:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
Message-ID: <YVxiyzNrKG8S1GDb@kroah.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, Imre Deak <imre.deak@intel.com>,
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

On Wed, Sep 22, 2021 at 11:54:32AM +0300, Kai Vehmanen wrote:
> In current code, the devres group for aggregate master is left open
> after call to component_master_add_*(). This leads to problems when the
> master does further managed allocations on its own. When any
> participating driver calls component_del(), this leads to immediate
> release of resources.
> 
> This came up when investigating a page fault occurring with i915 DRM
> driver unbind with 5.15-rc1 kernel. The following sequence occurs:
> 
>  i915_pci_remove()
>    -> intel_display_driver_unregister()
>      -> i915_audio_component_cleanup()
>        -> component_del()
>          -> component.c:take_down_master()
>            -> hdac_component_master_unbind() [via master->ops->unbind()]
>            -> devres_release_group(master->parent, NULL)
> 
> With older kernels this has not caused issues, but with audio driver
> moving to use managed interfaces for more of its allocations, this no
> longer works. Devres log shows following to occur:
> 
> component_master_add_with_match()
> [  126.886032] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000323ccdc5 devm_component_match_release (24 bytes)
> [  126.886045] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000865cdb29 grp< (0 bytes)
> [  126.886049] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 grp< (0 bytes)
> 
> audio driver completes its PCI probe()
> [  126.892238] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 pcim_iomap_release (48 bytes)
> 
> component_del() called() at DRM/i915 unbind()
> [  137.579422] i915 0000:00:02.0: DEVRES REL 00000000ef44c293 grp< (0 bytes)
> [  137.579445] snd_hda_intel 0000:00:1f.3: DEVRES REL 00000000865cdb29 grp< (0 bytes)
> [  137.579458] snd_hda_intel 0000:00:1f.3: DEVRES REL 000000001b480725 pcim_iomap_release (48 bytes)
> 
> So the "devres_release_group(master->parent, NULL)" ends up freeing the
> pcim_iomap allocation. Upon next runtime resume, the audio driver will
> cause a page fault as the iomap alloc was released without the driver
> knowing about it.
> 
> Fix this issue by using the "struct master" pointer as identifier for
> the devres group, and by closing the devres group after
> the master->ops->bind() call is done. This allows devres allocations
> done by the driver acting as master to be isolated from the binding state
> of the aggregate driver. This modifies the logic originally introduced in
> commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")
> 
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Acked-by: Imre Deak <imre.deak@intel.com>
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/base/component.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

What commit does this "fix:"?  And does it need to go to stable
kernel(s)?

thanks,

greg k-h
