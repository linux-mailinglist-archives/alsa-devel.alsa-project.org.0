Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE9967CAA6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 13:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C419E73;
	Thu, 26 Jan 2023 13:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C419E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674735155;
	bh=KPkKSD7aWhYpforFO0pJPJv3XA4UUvnD2v1EFugEgqY=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=DVmKQY5OxosqGjqbfKXddGw4rRieIxOAZIjwKyjoGG7nE2mHeB+1QNyuvL2pdJfyr
	 7NA1Cakco+lO/0y2iaY+r8dLxVEwjdSvZe5AWASBdh3WSLEF7Ozo4vjQOT4/10Wk/r
	 bGkMVpPirYJ+ESu6EhOJ+7+rZBX/JOV0GKjTVzs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0869AF802DF;
	Thu, 26 Jan 2023 13:11:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8549BF8027D; Thu, 26 Jan 2023 13:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9931F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 13:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9931F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DsfeXP3M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DA1A6179F;
 Thu, 26 Jan 2023 12:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C397CC433D2;
 Thu, 26 Jan 2023 12:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674735086;
 bh=KPkKSD7aWhYpforFO0pJPJv3XA4UUvnD2v1EFugEgqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DsfeXP3MPywBfapf1j68U2fsYoRWJr1DaPzWi74NDujNgTDyNgQ1iInlpLvOBPWhZ
 dgbjF41INaKWSTmLGbC6hUi2hlVxaE3zeJX6nAjNxaHhzv2MWnLknFBp41TOIT81B2
 ln/BLPiIuK03YBpKim2U/tMG4LCKbrlthnwZlrX9s7FWpYyliW/zSN25yS4zXbq6o1
 oDeL383myENTyDldeQc8KuV4Re3HOXcuwLoBBFx/2jrf/CCCq6GjCcNSUwdCT4iLtw
 qDQ0oKQdF6wfufBEEOLwk+7/zpHzn/jpN3EV9/3fihC2XnpD7F9xiZbGBioLd3EI44
 Yv4H+MnVBlyxQ==
Date: Thu, 26 Jan 2023 06:11:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [REGRESSION] [Bug 216859] New: PCI bridge to bus boot hang at
 enumeration
Message-ID: <20230126121124.GA1258686@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112200819.GA1785077@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Antonino Daplas <adaplas@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 linux-pci@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 "Zeno R.R. Davatz" <zdavatz@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[+cc folks from 145eed48de27 and framebuffer folks, regression list]

On Thu, Jan 12, 2023 at 02:08:19PM -0600, Bjorn Helgaas wrote:
> On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > 
> > >            Summary: PCI bridge to bus boot hang at enumeration
> > >     Kernel Version: 6.1-rc1
> > > ...
> > 
> > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > see attachments.
> > > 
> > > The enumeration works fine with Kernel 6.0 and below.
> > > 
> > > Same problem still exists with v6.1. and v6.2.-rc1

This is a regression between v6.0 and v6.1-rc1.  Console output during
boot freezes after nvidiafb deactivates the VGA console.

It was a lot of work for Zeno, but we finally isolated this console
hang to 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus").

The system actually does continue to boot and is accessible via ssh, 
but the console appears hung, at least for output.  More details in
the bugzilla starting at
https://bugzilla.kernel.org/show_bug.cgi?id=216859#c47 .

Bjorn
