Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF923060C3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 17:16:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABEB16EB;
	Wed, 27 Jan 2021 17:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABEB16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611763712;
	bh=TBiVdWNTKBxGL5C6wtlgzd2GcCfyPi02KPshb6e+jeM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=deM8xyWxRGfvISACyN7kcxOTyJ7j3b2xeXq0b/VfLTUqReo6/yGSNimNb4Nm1CdBq
	 vj1CMaH4d7LCyvU45TXSTFNMNYb9vS3T8o7wj2JEHFaw8eAdk9WwHYsUjjACQMnN30
	 Sz1HdmrAYuatCqK2kRQfc6rS4xvJUva6D06LQq2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BACCF8025F;
	Wed, 27 Jan 2021 17:07:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92EC2F80259; Wed, 27 Jan 2021 17:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA65F8011C
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 17:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA65F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SwdW0Tkt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB390207CC;
 Wed, 27 Jan 2021 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611763613;
 bh=TBiVdWNTKBxGL5C6wtlgzd2GcCfyPi02KPshb6e+jeM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SwdW0TktI9sBGvj6wz48I+buvaYvvjBOEypEw/ZV2ww9FFDfZxnAGUAOYBsHJaQxp
 uDCXnm7Y+Jlrlc7jPCntfC2SL8P8hVVBCnQoM4Ofm7akEEs7sCb8FDdwizdwt/ZMKk
 mJ5JOz+P/5vXPVkMmhmarNNeAC0/beYCn+jrKBH2g3ywi5AjgVSPW6yiEmS14yEXXF
 e+FcRZYhqDtVorRN4HUjqYEwhBD/3XLdd/3foTCO8RcZevxQOPEG+oI1kzwI9MQneg
 /fw7BNKdhDJQJHg19ZxYWSFIvMzaWoSrEZNtzkkXXfgBoAlg74ErtyHhaKqOvFRoEW
 CT9VTuVNEoEFQ==
Date: Wed, 27 Jan 2021 10:06:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
Message-ID: <20210127160650.GA2991034@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ir4=urUviCR_4N96revWZkHVDyNNUiaJ3jjGzpX8zLVQ@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Jean Delvare <jdelvare@suse.com>,
 acpi4asus-user@lists.sourceforge.net, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Takashi Iwai <tiwai@suse.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-spi <linux-spi@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>
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

On Wed, Jan 27, 2021 at 04:44:02PM +0100, Rafael J. Wysocki wrote:
> On Wed, Jan 27, 2021 at 4:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > >
> > > The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> > > Replace it with "if (ACPI_SUCCESS(status))".
> > >
> > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > ---
> > >
> > > This isn't really an ACPI patch, but I'm sending it to you, Rafael, since
> > > it seems easier to just apply these all at once.  But I'd be happy to split
> > > them up into individual patches if you'd rather.
> >
> > Thanks, everybody.  Rafael, I'll just merge this via my tree to avoid
> > burdening you.
> 
> It may conflict with some janitorial stuff I'm doing, though, so
> unless you've already applied it, I'd prefer to take it via the ACPI
> tree.

No problem, it's all yours!

Bjorn
