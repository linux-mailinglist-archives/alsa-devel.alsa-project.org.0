Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3F1B50DC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 01:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FB216EF;
	Thu, 23 Apr 2020 01:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FB216EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587597931;
	bh=eQWN3pP46KHM49RJh6DB+rLU7u/InpAf2XNNJk3Uh0A=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X0d1np3r+WEamMpRPEtVGLZCLYjVFg87kb+tevy6hhUATKADwFxbITKr45KuSMeBu
	 6H2VyhdTL//5uo6xqBXBPGhtUpVvK3iRQV5Xk9RLCPQYD/Upy4APLiHya/PtsOmjFz
	 vz0fWRnrn2fIvZjNHIb7mvVnzBgzDOZbX76+3zOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F0CF80108;
	Thu, 23 Apr 2020 01:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05628F8021C; Thu, 23 Apr 2020 01:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A082DF80108
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 01:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A082DF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZlR+o4j/"
Received: from localhost (mobile-166-175-187-227.mycingular.net
 [166.175.187.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 529712076C;
 Wed, 22 Apr 2020 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587597689;
 bh=eQWN3pP46KHM49RJh6DB+rLU7u/InpAf2XNNJk3Uh0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZlR+o4j/dIfsKlG85ZyM/YXf5IjN3j5mL315OQtJva0g0unK7gSvSEvf93zO6/i9D
 RXsaegX5CNyrsxE8zkl9PnrDZXu5bGH8raTLZ40pfFSDEBdGUpy9GmQDya+o6RsQrc
 KS9fX0bRBoDa5BlL1cBbNhSkocIzs8LGohDtrQaQ=
Date: Wed, 22 Apr 2020 18:21:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Unrecoverable AER error when resuming from RAM (hda regression
 in 5.7-rc2)
Message-ID: <20200422232127.GA24666@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h8sinxlfz.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 Roy Spliet <nouveau@spliet.org>
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

On Wed, Apr 22, 2020 at 11:25:04PM +0200, Takashi Iwai wrote:
> On Wed, 22 Apr 2020 22:50:28 +0200,
> Bjorn Helgaas wrote:
> > ...
> > I feel like this UR issue could be a PCI core issue or maybe some sort
> > of misuse of PCI power management, but I can't seem to get traction on
> > it.
> > 
> > > Then the display freezes and the system basically falls apart (can't 
> > > even sudo reboot -f, need to use magic sysrq).
> > > 
> > > I bisected this to "ALSA: hda: Skip controller resume if not needed". 
> > > Setting snd_hda_intel.power_save=0 resolves the issue.
> > 
> > FWIW, the complete citation is c4c8dd6ef807 ("ALSA: hda: Skip
> > controller resume if not needed"),
> > https://git.kernel.org/linus/c4c8dd6ef807, which first appeared in
> > v5.7-rc2.
> 
> Yes, and I posted the fix patch right now:
>   https://lore.kernel.org/r/20200422203744.26299-1-tiwai@suse.de
> 
> The possible cause was the tricky resume code that both HD-audio
> controller (the parent PCI device) and the codec devices used.
> 
> At least the patch above seems working for the reporter's machine.
> Now we need a bit more testing before merging, but it looks promising,
> so far.

Great, I'm glad you figured something out because I sure wasn't
getting anywhere!

Maybe this is a tangent, but I can't figure out what
snd_power_change_state() is doing.  It *looks* like it's supposed to
change the PCI power state, but I gave up trying to figure out where
it actually touches the device.

It seems like sound has more magic in power management than other
device types, which makes me wonder if we're not providing the right
interfaces or something.

Bjorn
