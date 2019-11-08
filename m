Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC26F3EBF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 05:16:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3B4166A;
	Fri,  8 Nov 2019 05:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3B4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573186596;
	bh=WM9WvrrDLxPOeG8wdv6dheHKkkLkraLRTJkJ5UwwuWk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqsR8NsQAD1ydVQN1mLmPPmmSPvIXAAhdGla4+RGpeb9JkcmJDkBcwuH8ntEx2fYl
	 pZ8LT4Bza5Xchgn++2MOciIbBST5Iq7yMsJJlYh9zFjEDEXr+t+GV7aKUasBbEkqCv
	 OWnFz9cCU82LAVQ54rXKHi01qHAkv2XTVyawSj54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E13F803F4;
	Fri,  8 Nov 2019 05:14:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 502CFF803D0; Fri,  8 Nov 2019 05:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53663F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 05:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53663F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ODir7oPn"
Received: from localhost (unknown [106.200.194.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B1CE2166E;
 Fri,  8 Nov 2019 04:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573186483;
 bh=zOjttgD2pBwUmq+N/FgixVnx02tlYEDPZijO3Al3aMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODir7oPnb77Dpzy0Q3osndcpcCopiWfOU9NLOt1ahdLP+x6JipQBzz30EgOTgSMUr
 +hckTJdPKkZOibSu7HJLmhTbo903xvY9k8JlIHlYzSuO8ly4GbvjjAgdWZEivLZKoW
 juumdGON8icbc8jTJB6dHx0Q1psElet0hLkYxnbE=
Date: Fri, 8 Nov 2019 09:44:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191108041435.GV952516@vkoul-mobl>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-14-pierre-louis.bossart@linux.intel.com>
 <42403ea0-e337-81b6-f11a-2a32c1473750@intel.com>
 <0374d162-2cea-2fca-ec12-a0377130c711@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0374d162-2cea-2fca-ec12-a0377130c711@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 13/14] soundwire: intel: free all resources
 on hw_free()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 04-11-19, 15:46, Pierre-Louis Bossart wrote:
> On 11/4/19 2:08 PM, Cezary Rojewski wrote:
> > On 2019-10-23 23:28, Pierre-Louis Bossart wrote:
> > > @@ -816,6 +835,7 @@ static int
> > > =A0 intel_hw_free(struct snd_pcm_substream *substream, struct
> > > snd_soc_dai *dai)
> > > =A0 {
> > > =A0=A0=A0=A0=A0 struct sdw_cdns *cdns =3D snd_soc_dai_get_drvdata(dai=
);
> > > +=A0=A0=A0 struct sdw_intel *sdw =3D cdns_to_intel(cdns);
> > > =A0=A0=A0=A0=A0 struct sdw_cdns_dma_data *dma;
> > > =A0=A0=A0=A0=A0 int ret;
> > > @@ -823,12 +843,28 @@ intel_hw_free(struct snd_pcm_substream
> > > *substream, struct snd_soc_dai *dai)
> > > =A0=A0=A0=A0=A0 if (!dma)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EIO;
> > > +=A0=A0=A0 ret =3D sdw_deprepare_stream(dma->stream);
> > > +=A0=A0=A0 if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0 dev_err(dai->dev, "sdw_deprepare_stream: faile=
d %d", ret);
> > > +=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > +=A0=A0=A0 }
> > > +
> > =

> > I understand that you want to be transparent to caller with failure
> > reasons via dev_err/_warn. However, sdw_deprepare_stream already dumps
> > all the logs we need. The same applies for most of the other calls (and
> > not just in this patch..).

I think this is a valid concern! In linux we do not do that, for example
we ask people to not log errors on kmalloc as it will be logged on
failures so drivers do not need to do that.

> > Do we really need to be that verbose? Maybe just agree on caller -or-
> > subject being the source for the messaging, align existing usages and
> > thus preventing further duplication?
> > =

> > Not forcing anything, just asking for your opinion on this.
> =

> the sdw_prepare/deprepare_stream calls provide error logs, but they are n=
ot
> mapped to specific devices/dais (pr_err vs. dev_dbg). I found it was easi=
er
> to check for which dai the error was reported.

Well in that case we should fix pr_err, there are only 17 instances of
these in core, and few of them are justified in core (no dev pointer)
and 11 in stream (few of them valid (no stream pointer) but rest can be
converted to use dev_err! Even then they print stream name, so checking
error is not justified argument!

> We are also in the middle of integration with new hardware/boards, and
> erring on the side of more traces will help everyone involved. We can
> revisit later which ones are strictly necessary.

Naah you are having duplicate logs, it does *not* help in debug seems
1000 line logs and few lines conveying duplicate info, I would rather
have each line unique so that I dont have to skip duplicate ones while
debugging!

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
