Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D0668381
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 21:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC6599FE;
	Thu, 12 Jan 2023 21:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC6599FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673554166;
	bh=eu6oC6p18svRffUOBN2Wg+o/+IqQkvr+YGuw0J4xmfM=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=shdp0cLg8lTGokHMjztkvaRTn2Zokb8025U1Fb0rD9PkeDh77FPyn+/kZvIuVqrHM
	 ZS9g5hvyR3vXec3tOCN9LSjs6BBDPw1LXJlu/A+8d6f/9TBzFWUhqZ0j8mnmDENKau
	 9VSuhyOT3pKdFisiE47eCvbn0MxgErgkVps8uo2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EADD8F804CA;
	Thu, 12 Jan 2023 21:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F42F804C1; Thu, 12 Jan 2023 21:08:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D9BFF8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 21:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9BFF8013D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sF5xQ/uz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAA9762178;
 Thu, 12 Jan 2023 20:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F103AC433D2;
 Thu, 12 Jan 2023 20:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673554101;
 bh=eu6oC6p18svRffUOBN2Wg+o/+IqQkvr+YGuw0J4xmfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sF5xQ/uzmcOJVRxhFlu/jydAsWM7BSEjNKSGB6h4HCE5xUN62UlOR7oB0AkuGpHr7
 x4YVqxzHVTySi+2OZaOZlBynG79mx5u3FIIEdLH4bWsbYNLgxJNbMyKd/34r7pKKkc
 o+8xt3x9y4o77EDaIlQbyhts7aoAOTX13Qf0fkwtubVbIhJHTA0Sgu/luw9QzrMpf+
 OIZ0spVXkhQQyOCgg/sdgd6aSRBVoGsmyTb3zeu5+hGr8TtjUg+RlzGtodQ5k/umV5
 HDugauVm4LTZszSICHvLcNShCeo9CoP9zUdSx/rAa8F4aMz+VkCICUCKPVWbFPPfR3
 sLZaG0TXA6/PA==
Date: Thu, 12 Jan 2023 14:08:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Zeno R.R. Davatz" <zdavatz@gmail.com>
Subject: Re: [Bug 216859] New: PCI bridge to bus boot hang at enumeration
Message-ID: <20230112200819.GA1785077@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228120248.GA508080@bhelgaas>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[+cc sound folks]

On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> 
> >            Summary: PCI bridge to bus boot hang at enumeration
> >     Kernel Version: 6.1-rc1
> > ...
> 
> > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > see attachments.
> > 
> > The enumeration works fine with Kernel 6.0 and below.
> > 
> > Same problem still exists with v6.1. and v6.2.-rc1
> 
> Thank you very much for your report, Zeno!
> 
> v6.0 works, v6.1-rc1 fails.  Would you mind booting v6.1-rc1 with the
> "ignore_loglevel initcall_debug" kernel parameters and taking a photo
> when it hangs?
> 
> How did you conclude that the hang is related to a PCI bridge?  I see
> recent PCI messages in the photo, but it looks like the last message
> is from NFS, so I'm wondering if I'm missing some context.  The v6.0
> dmesg shows several other ntfs, fuse, JFS, etc messages before more
> PCI-related things.  Anyway, the "initcall_debug" might help us narrow
> it down a bit.

Thanks very much for the bisection (complete log at [1])!

The bisection claims the first bad commit is:

  833477fce7a1 ("Merge tag 'sound-6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound")

with parents:

  7e6739b9336e ("Merge tag 'drm-next-2022-10-05' of git://anongit.freedesktop.org/drm/drm")
  86a4d29e7554 ("Merge tag 'asoc-v6.1' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus")

Both 7e6739b9336e and 86a4d29e7554 tested "good" during the bisection.

There is a minor conflict when merging 86a4d29e7554 into the upstream,
but I can't imagine that being resolved incorrectly.

Would you mind turning off CONFIG_SOUND in your .config and testing
833477fce7a1 again?  I'm a little skeptical that the hang would be
sound-related, but I guess it's a place to start.

Bjorn

[1] https://bugzilla.kernel.org/show_bug.cgi?id=216859#c35
