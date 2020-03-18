Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1C18992D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 11:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E6F1766;
	Wed, 18 Mar 2020 11:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E6F1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584526856;
	bh=/afBSrwIeCYF1hWJ7PqnSZ1Ub3SdFE9BU0+bSH45AjQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvV9A784nndy/WvcXH84woQeZl4J5FTqe5gU6CCAFFGbaMZgZP1p4yZ4xVjBdBQpX
	 sw9NtBnj13Agj8uwa19Rr3aWdhzkToev9wwpd8pcWqs09BTHsMyt14KBAxwldhQjzg
	 RwRsoUQxteGaZDa1uiP/l1AZRIHABvMYj0leGQGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA1AF80058;
	Wed, 18 Mar 2020 11:19:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D5CF80132; Wed, 18 Mar 2020 11:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B9EF800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 11:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B9EF800B7
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 2710F200ADE;
 Wed, 18 Mar 2020 10:19:09 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id CE43220B19; Wed, 18 Mar 2020 11:19:04 +0100 (CET)
Date: Wed, 18 Mar 2020 11:19:04 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200318101904.GA134370@light.dominikbrodowski.net>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <66c719b3-a66e-6a9f-fab8-721ba48d7ad8@intel.com>
 <20200318095745.GA133849@light.dominikbrodowski.net>
 <fafed002-5f7f-dd2b-0787-265da7ec7c7a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fafed002-5f7f-dd2b-0787-265da7ec7c7a@intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On Wed, Mar 18, 2020 at 11:05:21AM +0100, Cezary Rojewski wrote:
> On 2020-03-18 10:57, Dominik Brodowski wrote:
> > > > 
> > > > Unfortunately, I cannot bisect this issue easily -- i915 was broken for
> > > > quite some time on this system[*], prohibiting boot...
> > > 
> > > Hmm, sounds like that issue is quite old. DSP for Haswell and Broadwell is
> > > available for I2S devices only, so this relates directly to legacy HDA
> > > driver. Compared to Skylake+, HDAudio controller for older platforms is
> > > found within GPU. My advice is to notify the DRM guys about this issue.
> > > 
> > > Takashi, are you aware of problems with HDMI on HSW/ BDW or should I just
> > > loop Jani and other DRM peps here?
> > 
> > Well, it works on v5.5, so this issue is not really "quite old" (the "no
> > context buffer need to restore!" message seen there seems harmless).
> > 
> > Thanks again, and best wishes,
> > 	Dominik
> > 
> 
> Was commenting the "i915 was broken for quite some time on this system[*],
> prohibiting boot...". Unless I misunderstood you, this ain't a DSP driver
> issue but HDAudio/iDisp one. Essentially, these are two issues you mentioned
> here.

Ah, sorry for the confusion. That issue was introduced post v5.5 as well,
but fixed for v5.6-rc4 -- meaning that it works now, but that bisecting
between v5.5 and v5.6-rc4 is not working as such.

Thanks,
	Dominik
