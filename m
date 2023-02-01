Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152C6870FF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 23:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C8F823;
	Wed,  1 Feb 2023 23:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C8F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675290706;
	bh=zot7qOvxCoMuk3Wa7msvKuV8ZKjBUkCftR+hKbpMvKg=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=GpIW19LcT4pO3OHjdtEEK8qTMOWp1knhsDfY4+E9NNR5nWlqSm3iLwnFuZgNnxW3M
	 b0jSTv96pp0l8PkVbi6LflwzQLsdtUQoapqT9aOVpD7nf4rLeG6tob/nqgwzihtw1R
	 LzWg7MovfrSr9QJ6U06J0TP+h4QqnvpENxGLMHzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730F1F8045D;
	Wed,  1 Feb 2023 23:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA4ACF80423; Wed,  1 Feb 2023 23:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C01DF80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 23:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C01DF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G6BGYj8G
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 375F6B821C8;
 Wed,  1 Feb 2023 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE91C433D2;
 Wed,  1 Feb 2023 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675290633;
 bh=zot7qOvxCoMuk3Wa7msvKuV8ZKjBUkCftR+hKbpMvKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=G6BGYj8GNN1wSIw5qe4+JxQaJlNBaLF4nV7u7LDHOCEUorpic/7/hdux1jfRK8GLi
 A06Jui8y/0k9u7PZfSQ/4XKzZHLAtiOB1JqkI779XfcWpCG16HNN0DcPQuNrfxlFmr
 WNl3b4rzTYeL+opzUO7mcOv4QNbOPwHELFYPCLXUhAMrqrE5HS6jfe2XihaXjeJFiN
 USV4kfR1Pj3w6nETSKBrEIqrKuHhaDYnVD0zdZ4f/T8nOW5TJxh3M5iXjVRjFapoYR
 LrnpN1j+KST+snypzKs/4c7W2iD/v8aP4baRDDE6/pOtKwNLta62Bc1WdWrd8NMcpd
 TgBKkJmvxp3zA==
Date: Wed, 1 Feb 2023 16:30:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [REGRESSION] [Bug 216859] New: PCI bridge to bus boot hang at
 enumeration
Message-ID: <20230201223032.GA1904036@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126121124.GA1258686@bhelgaas>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Zeno R.R. Davatz" <zdavatz@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[+cc Geert]

On Thu, Jan 26, 2023 at 06:11:24AM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 12, 2023 at 02:08:19PM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > 
> > > >            Summary: PCI bridge to bus boot hang at enumeration
> > > >     Kernel Version: 6.1-rc1
> > > > ...
> > > 
> > > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > > see attachments.
> > > > 
> > > > The enumeration works fine with Kernel 6.0 and below.
> > > > 
> > > > Same problem still exists with v6.1. and v6.2.-rc1
> 
> This is a regression between v6.0 and v6.1-rc1.  Console output during
> boot freezes after nvidiafb deactivates the VGA console.
> 
> It was a lot of work for Zeno, but we finally isolated this console
> hang to 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus").
> 
> The system actually does continue to boot and is accessible via ssh, 
> but the console appears hung, at least for output.  More details in
> the bugzilla starting at
> https://bugzilla.kernel.org/show_bug.cgi?id=216859#c47 .

145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") doesn't
say what the benefit is, or what would break if we reverted it.

Does anybody have any clues?  It would be nice to resolve this
regression before v6.2, which will probably be released 2/12 or 2/19.

Bjorn
