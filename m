Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A432A1FF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2AB172A;
	Tue,  2 Mar 2021 15:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2AB172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614694483;
	bh=e2McjVy3y5qr0Wd/WbMZ/AzBg0tg8pRi5+XNX61Qlk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJHhUxFzh1XjUelW33uE3rqszHUMK5Q38QmVSCy89AnNOD7+DU/R9fk4rdd/b2kgj
	 a+YwmJzh0aPIZV8MbNlQntza7fNxC3upK03AF8zfYgD4UvWtSbR/r6SDLqSVDRm/Qq
	 ycx8ZSLzQDLlhpd4V9fI71NGuX0b46OucsJDaIOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 977DCF8025B;
	Tue,  2 Mar 2021 15:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9EEF80273; Tue,  2 Mar 2021 15:13:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB5CF8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB5CF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="clmZ1iLH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D6B264F0A;
 Tue,  2 Mar 2021 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614694415;
 bh=e2McjVy3y5qr0Wd/WbMZ/AzBg0tg8pRi5+XNX61Qlk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=clmZ1iLHGVNPr76eCE04aX8y/sBngA43w2GCHEPEAJrgYy8k/DqLSkOJv+obaDJlg
 4Ttlxnp1SPZ5UXbRDb+RCY6bIwCT0bqIku0hfAjcIjVeowrRHsWZqt2dUr/EXZMRP1
 dUK/xjlOARLck34zcu+WRsrgQpXGRMQVwcPllLL7AkxnrBBnngXVJKj45qfvD513N1
 RewAUA6+kj5GE8c7SOLoE6E2QVLRnQZ6tV+kFBwnN63CzKAw7ELMAEzTEQuOJAnfos
 UhTCDzUbtWGdTF3YTbS5E+V6HxK924VoaKaxRwQOotllA7PSvdGwoMz+mrJtilAnmM
 pIYv8pxwvAOGw==
Date: Tue, 2 Mar 2021 19:43:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
Message-ID: <YD5IChh6Xubim//Q@vkoul-mobl>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <s5htuptfyae.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5htuptfyae.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, arnd@arndb.de
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

On 02-03-21, 15:03, Takashi Iwai wrote:
> On Tue, 02 Mar 2021 01:31:18 +0100,
> Pierre-Louis Bossart wrote:
> > 
> > In January, Intel kbuild bot and Arnd Bergmann reported multiple
> > issues with randconfig. This patchset builds on Arnd's suggestions to
> > 
> > a) expose ACPI and PCI devices in separate modules, while sof-acpi-dev
> > and sof-pci-dev become helpers. This will result in minor changes
> > required for developers/testers, i.e. modprobe snd-sof-pci will no
> > longer result in a probe. The SOF CI was already updated to deal with
> > this module dependency change and introduction of new modules.
> > 
> > b) Fix SOF/SoundWire/DSP_config dependencies by moving the code
> > required to detect SoundWire presence in ACPI tables to sound/hda.
> > 
> > Integration note:
> > This patchset touches directories maintained by Vinod, Takashi and
> > Mark in separate trees, and will impact additional changes to use the
> > auxiliary bus in drivers/soundwire/.
> > I can think of two options, both of which are fine:
> > 1. Mark merges the patches with Vinod and Takashi Acked-by tags, then
> > Mark provides an immutable tag to Vinod.
> > 2. Vinod merges the patches with Mark and Takashi Acked-by tags, then
> > Vinod provides an immutable tag to Mark
> 
> Acked-by: Takashi Iwai <tiwai@suse.de>

Since most of the changes are sound/ it makes sense for this to go thru
sound tree. I have acked the sdw part..

Thanks
-- 
~Vinod
