Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE02D2288
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 05:57:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638BD1700;
	Tue,  8 Dec 2020 05:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638BD1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607403471;
	bh=1RiFaYT5sszcYT3rzZ7wK33h9vZoHSV5GWfAX84nrpk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRUwweWhMEpQe0Yuo3cwQxleuhFYOv2q2KuYFeAb4FsJw1EwW+aDQLe23pyu8p6TZ
	 XtEe9qhsXPjm9/skBSPTysdc6wYtKV7G3R5tMkKUss/+yJ3AxClc9S3u2f1YrSPus4
	 t4z876050KMIWGsvjDQ/2k9xATAcKk3+q7sVtXdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87599F80218;
	Tue,  8 Dec 2020 05:56:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE0EF80130; Tue,  8 Dec 2020 05:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29E51F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 05:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E51F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JsaVxd5i"
Date: Tue, 8 Dec 2020 10:26:00 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607403364;
 bh=1RiFaYT5sszcYT3rzZ7wK33h9vZoHSV5GWfAX84nrpk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=JsaVxd5iO6il066W28gWU1l0+3OyFChdHtmkgNKsV/SRsoHYAr+W9iqN3k6/BsuwY
 MuEGN2cmbukxDF56bNvz94mtXuOCLuzlwe9eE5k25W0xYyE0NYvFKK6EWuodyfiATb
 Ua0qLLzG7O4GstPtpxslD6vSnZ3AbvXkraNeglweCzSA4IE6v4/fNl1wrwkEHNjuy+
 SvkiabnoRnfF8/S2usqxo4/3XEcJanoL3UQZyDxYj8OjinAs236rccCpdzsgittcZ0
 9XL6SitN1HnpfwQqaqEQ96C9zhNTWIcOdtSt7/LshVRMFE/OFpsmawixJ1bTpIfvWG
 VAuytt2F626lA==
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/7] soundwire: bus: use sdw_update_no_pm when
 initializing a device
Message-ID: <20201208045600.GE8403@vkoul-mobl>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-2-yung-chuan.liao@linux.intel.com>
 <20201205074508.GQ8403@vkoul-mobl>
 <1db93c2e-3c87-bc5e-ddeb-56424870b897@linux.intel.com>
 <20201207044334.GA8403@vkoul-mobl>
 <668b4d5c-d9eb-0256-ce26-df38e32cc520@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668b4d5c-d9eb-0256-ce26-df38e32cc520@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 07-12-20, 09:31, Pierre-Louis Bossart wrote:
> On 12/6/20 10:43 PM, Vinod Koul wrote:
> > On 05-12-20, 08:59, Pierre-Louis Bossart wrote:
> > > Thanks for the review Vinod.
> > > 
> > > On 12/5/20 1:45 AM, Vinod Koul wrote:
> > > > On 03-12-20, 04:46, Bard Liao wrote:
> > > > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > > > 
> > > > > When a Slave device is resumed, it may resume the bus and restart the
> > > > > enumeration. During that process, we absolutely don't want to call
> > > > > regular read/write routines which will wait for the resume to
> > > > > complete, otherwise a deadlock occurs.
> > > > > 
> > > > > Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of read/write functions')
> > > > 
> > > > Change looks okay, but not sure why this is a fix for adding no pm
> > > > version?
> > > 
> > > when we added the no_pm version, we missed the two cases below where
> > > sdw_update() was used and that creates a deadlock. To me that's a conceptual
> > > bug, we didn't fully use the no_pm versions, hence the Fixes tag.
> > 
> > Documentation says:
> > "A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
> > is used to make it easy to determine where a bug originated, which can help
> > review a bug fix. This tag also assists the stable kernel team in determining
> > which stable kernel versions should receive your fix. This is the preferred
> > method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> > for more details."
> > 
> > I do not this this helps here as this does not help distros etc
> > I would say this is incremental development which improved a case not
> > done properly earlier, unless you would like this to be backported.. In
> > that case it helps folks...
> 
> IMHO the changes in the series are absolutely required to have a reliable
> suspend-resume operation and will need to be back-ported. When I said
> 'conceptual bug', I didn't mean a hypothetical case, I really meant that a
> proven race condition and timeouts will occur. That's not good... We will
> provide the list of this patches to distros that are known to support
> SoundWire as a 'must apply'.
> 
> If you look at the series, we provided Fixes tags for all patches except
> 'cosmetic' ones which don't fundamentally change the behavior (Patch 3,
> patch 7) or when the code has not reached Linus' tree (patch 5).
> 
> That said, 5.10 was the first release where SoundWire started to be
> functional so there's no need to apply these patches to earlier versions of
> the stable tree.
> 
> Does this help?

Yes, that helps, thanks

-- 
~Vinod
