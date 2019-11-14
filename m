Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CDFC5AF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 12:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15AF1616;
	Thu, 14 Nov 2019 12:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15AF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573732338;
	bh=OYm1vGLFjxH0GATtJQUiL7t7t9uG0/mkbzQLtee1sWw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qacGBMO2I4ho2vDJ1VMbYL2v/qwo213uU16CPyEDvpGhjQ0m4uLxAsvMA2PD8Zm9c
	 i1h5RUCINo0yTEd2sYHXhVlkAqJCsZ36Ri6TGC+ArRfD3sHBgy9UQ/0FevNrwPckWO
	 ilNFAA/h9GnN8T613XnrUAZulObZZ1U3vOTnsVUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24343F800CF;
	Thu, 14 Nov 2019 12:50:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8CCF800CF; Thu, 14 Nov 2019 12:50:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E288F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 12:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E288F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CiFuv13Q"
Received: from localhost (unknown [223.226.110.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD4ED206DB;
 Thu, 14 Nov 2019 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573732226;
 bh=7cE8IM/g7fk3rGHkQHrlQziLkAAH6dYps+ysFyhbgXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CiFuv13QJCCG+uwbTVdr6CSXpD69RDtMPZG7sz9vTCKm37pME91VD96YMVYPy7dXU
 TryssRvkb0A97U6cyrLLZ3aOr73hSoNGwnTW2Vn2Tk4z6yn6qq2Vn1Z7lXUWhSrvlv
 iICz4MnaIY0C/BYQVNnvwzcm+7iUxiGnw5HBlG0M=
Date: Thu, 14 Nov 2019 17:20:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191114115020.GU952516@vkoul-mobl>
References: <20191023210657.32440-1-pierre-louis.bossart@linux.intel.com>
 <20191023210657.32440-2-pierre-louis.bossart@linux.intel.com>
 <20191103045604.GE2695@vkoul-mobl.Dlink>
 <f53b28bb-1ec7-a400-54ed-51fd55819ecd@linux.intel.com>
 <20191108042940.GW952516@vkoul-mobl>
 <e3e10c25-84dc-f4e7-e94b-d18493450021@linux.intel.com>
 <20191109111211.GB952516@vkoul-mobl>
 <5a2a40b3-5a3c-f80a-b2a4-33d821d5b0e6@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a2a40b3-5a3c-f80a-b2a4-33d821d5b0e6@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] soundwire: sdw_slave: add new fields
 to track probe status
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11-11-19, 10:34, Pierre-Louis Bossart wrote:
> 
> 
> On 11/9/19 5:12 AM, Vinod Koul wrote:
> > On 08-11-19, 08:55, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > On 11/7/19 10:29 PM, Vinod Koul wrote:
> > > > On 04-11-19, 08:32, Pierre-Louis Bossart wrote:
> > > > > 
> > > > > 
> > > > > On 11/2/19 11:56 PM, Vinod Koul wrote:
> > > > > > On 23-10-19, 16:06, Pierre-Louis Bossart wrote:
> > > > > > > Changes to the sdw_slave structure needed to solve race conditions on
> > > > > > > driver probe.
> > > > > > 
> > > > > > Can you please explain the race you have observed, it would be a very
> > > > > > useful to document it as well
> > > > > 
> > > > > the races are explained in the [PATCH 00/18] soundwire: code hardening and
> > > > > suspend-resume support series.
> > > > 
> > > > It would make sense to explain it here as well to give details to
> > > > reviewers, there is nothing wrong with too much detail!
> > > > 
> > > > > > > 
> > > > > > > The functionality is added in the next patch.
> > > > > > 
> > > > > > which one..?
> > > > > 
> > > > > [PATCH 00/18] soundwire: code hardening and suspend-resume support
> > > > 
> > > > Yeah great! let me play detective with 18 patch series. I asked for a
> > > > patch and got a series!
> > > > 
> > > > Again, please help the maintainer to help you. We would love to see this
> > > > merged as well, but please step up and give more details in cover
> > > > letter and changelogs. I shouldn't need to do guesswork and scan through the
> > > > inbox to find the context!
> > > 
> > > We are clearly not going anywhere.
> > 
> > Correct as you don't seem to provide clear answers, I am asking again
> > which patch implements the new fields added here, how difficult is it to
> > provide the *specific* patch which implements this so that I can compare
> > the implementation and see why this is needed and apply if fine!
> > 
> > But no you will not provide a clear answer and start ranting!
> > 
> > > I partitioned the patches to make your maintainer life easier and help the
> > > integration of SoundWire across two trees. All I get is negative feedback,
> > > grand-standing, and zero comments on actual changes.
> > 
> > No you get asked specific question which you do not like and start off
> > on a tangent!
> > 
> > > For the record, I am mindful of reviewer/maintainer workload, and I did
> > > contact you in September to check your availability and provided a pointer
> > > to initial code changes. I did send a first version a week prior to your
> > > travel/vacation, I resend another version when you were back and waited yet
> > > another two weeks to resend a second version. I also contacted Takashi, Mark
> > > and you to suggest this code partition, and did not get any pushback. It's
> > > not like I am pushing stuff down your throat, I have been patient and
> > > considerate.
> > > 
> > > Please start with the patches "soundwire: code hardening and suspend-resume
> > > support" and come back to this interface description when you have reviewed
> > > these changes. It's not detective work, it's working around the consequences
> > > of having separate trees for Audio and SoundWire.
> > 
> > Again, which patch in the series does implement these new members!
> 
> It's really straightforward...here is the match between headers and
> functionality:
> 
> [PATCH v2 1/5] soundwire: sdw_slave: add new fields to track probe status
> [PATCH v2 02/19] soundwire: fix race between driver probe and update_status
> callback
> 
> [PATCH v2 2/5] soundwire: add enumeration_complete structure
> [PATCH v2 12/19] soundwire: add enumeration_complete signaling
> 
> [PATCH v2 3/5] soundwire: add initialization_complete definition
> [PATCH v2 13/19] soundwire: bus: add initialization_complete signaling
> 
> [PATCH v2 4/5] soundwire: intel: update interfaces between ASoC and
> SoundWire
> [PATCH v2 5/5] soundwire: intel: update stream callbacks for hwparams/free
> stream operations
> [PATCH v2 13/14] soundwire: intel: free all resources on hw_free()

Thanks for the pointers, I will look at these patches and do the needful
for this series

> I suggested an approach that you didn't comment on, and now I am not sure
> what to make of the heated wording and exclamation marks. You did not answer
> to Liam's question on links between ASoC/SoundWire - despite the fact that
> drivers/soundwire cannot be an isolated subsystem, both the Intel and
> Qualcomm solutions have a big fat 'depends on SND_SOC'.
> 
> At this point I am formally asking for your view and guidance on how we are
> going to do the SoundWire/ASoC integration. It's now your time to make
> suggestions on what the flow should be between you and Mark/Takashi. If you
> don't want this initial change to the header files, then what is your
> proposal?

It is going to be as it would be for any other subsystem. Please mention
in the cover letter about required dependency. In case asoc needs this I
will create a immutable tag and in reverse case Mark will do so.

It is not really an issue if we get the information ahead of time

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
