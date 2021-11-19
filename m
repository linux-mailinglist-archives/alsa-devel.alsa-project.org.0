Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1A45718A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 16:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D6917B0;
	Fri, 19 Nov 2021 16:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D6917B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637335158;
	bh=wIOREQVysJbEuluN0QQI/uUfsptQd1+rAS0I6tty3sA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOWkDZjZ9t+ih+3djVQRS0/Tj4jiCG64qaFEgAuDRFJ+76DZmDVhXbYsCQwSSXCQY
	 A+bOYwuEbmJaa0sTOGeo65/Tf9q8Fo6wFl7qNzLIytSh5yHIBZVxPddwAM0VzrbzqU
	 CXqAc2Vxu1S6XSqzPCA3coTH9chaf+xb5TLqBtIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EACD2F8026D;
	Fri, 19 Nov 2021 16:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3F1F80217; Fri, 19 Nov 2021 16:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83B26F800FA
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 16:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B26F800FA
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="234376620"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234376620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 07:17:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="507933158"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 07:17:45 -0800
Date: Fri, 19 Nov 2021 17:10:18 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Warning due to "ALSA: hda: intel: More comprehensive PM runtime
 setup for controller driver"
In-Reply-To: <s5hczmwfe3x.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2111191648590.3554566@eliteleevi.tm.intel.com>
References: <d9d76980-966a-e031-70d1-3254ba5be5eb@gmail.com>
 <s5hczmxgnm2.wl-tiwai@suse.de>
 <bc281416-e28d-4c18-2475-add92d38a554@gmail.com>
 <s5hczmwfe3x.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

On Fri, 19 Nov 2021, Takashi Iwai wrote:

> On Thu, 18 Nov 2021 23:13:50 +0100, Heiner Kallweit wrote:
> > On 18.11.2021 22:28, Takashi Iwai wrote:
> > >> snd_hda_intel 0000:00:1f.3: Unbalanced pm_runtime_enable!
> > >>
> > >> Not sure how this patch was tested because the warning is obvious.
> > >> The patch doesn't consider what the PCI sub-system does with regard to
> > >> RPM. Have a look at pci_pm_init().
[...]
> > > 
> > > Thanks for the notice.  It's been through Intel CI and tests on a few
> > > local machines, maybe we haven't checked carefully those errors but
> > > only concentrated on the other issues, as it seems.

ack on this. This did not go through our full CI, but rather I tested 
with the local setup I used to bisect this problem that was reported with 
linux-next. We specifically got the "Unbalanced pm_runtime" warning on the 
first iteration of the patch, but it was clean in the submitted version.
But yeah, a wider test round would have caught this, sorry about that.

> > Having a look at the commit message of "ALSA: hda: fix general protection
> > fault in azx_runtime_idle" the following sounds weird:
> > 
> >   - pci-driver.c:pm_runtime_put_sync() leads to a call
> >     to rpm_idle() which again calls azx_runtime_idle()
> > 
> > rpm_idle() is only called if usage_count is 1 when entering
[...]
> > This doesn't seem to happen. Maybe for whatever reason 
> > pm_runtime_get_noresume() isn't called in azx_free(), or azx_free()
> > isn't called from remove().
> > I think you should trace the call chain from the PCI core calling
> > remove() to pm_runtime_get_noresume() getting called or not.
> 
> Neither of them, supposedly.  Now I took a deeper look at the code
> around it and dug into the git log, and found that the likely problem
> was the recent PCI core code refactoring (removal of pci->driver, etc)
> that have been already reverted; that was why linux-next-20211109 was
> broken and linux-next-20211110 worked.  With the leftover pci->driver,
> the stale runtime PM callback was called at the pm_runtime_put_sync()
> call in pci_device_remove().

That probably explains it. I specifically saw runtime idle callback 
_after_ the PCI remove driver callback (azx_remove()) was run to 
completion. And this happened within execution of pci_device_remove(). But 
alas I could not hit this problem with post 20211110 linux-next.

> In anyway, I'll drop the invalid calls of pm_runtime_enable() /
> disable() & co.  Maybe keeping pm_runtime_forbid() and
> pm_runtime_dont_use_autosuspend() at remove still makes some sense as
> a counter-part for the probe calls, though.

Hmm, I was about to port this change to the SOF driver as well. But if the 
outcome is that driver can safely assume RPM callbacks are _not_ called 
after remove, then maybe we can keep the SOF implementation of 
remove as is.

Br, Kai
