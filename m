Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2222043E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 07:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771761662;
	Wed, 15 Jul 2020 07:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771761662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594789932;
	bh=RKspWdQUmF4FP5uXe/3l4Ju6t7jIEW6++Ox7QAXw9Qs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRgP5+A4B+KFkR0duO7R5ShJev9Z4rbdEzUVHRgSOPhSk4xvJDuXHUyJ+sT7EE1D4
	 SF3keI1G7JmyMqJahgoyZKqn3xxhGXV6ceB8kTBIP9FBIY85MA9Kp86NfAaYxYNrT1
	 wKGBKHlH7KyST6ookASouEvjtsxlPFTtmzxb81qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6EA2F8014E;
	Wed, 15 Jul 2020 07:10:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 227B9F8021D; Wed, 15 Jul 2020 07:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9166DF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 07:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9166DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KzNUdA0n"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD3BD20657;
 Wed, 15 Jul 2020 04:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594788893;
 bh=RKspWdQUmF4FP5uXe/3l4Ju6t7jIEW6++Ox7QAXw9Qs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzNUdA0n80OlGxwzMG/VZtWvb6RZCZdf/zWgAqITT49Tq22x4Y7JSs1ILoudkOWsc
 yMEntxxBo6ZkyD0QpKWxA8b1aGmWw5uuvMcGBHLUPrKw7ScKfY9IC6HDfdScSvF/M3
 TTsuOqkzNI+C8yHvuzJYNB28v0xyRhNS1Et2aZH8=
Date: Wed, 15 Jul 2020 10:24:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Message-ID: <20200715045449.GP34333@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
 <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
 <20200701054224.GV2599@vkoul-mobl>
 <MN2PR11MB4080CF23D00A3AF817AC1E7CFF6D0@MN2PR11MB4080.namprd11.prod.outlook.com>
 <077d4430-bb76-df2c-2c39-8077998e6fdc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <077d4430-bb76-df2c-2c39-8077998e6fdc@linux.intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Blauciak,
 Slawomir" <slawomir.blauciak@intel.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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

On 02-07-20, 10:01, Pierre-Louis Bossart wrote:
 
> > > Sounds good. Now that you are already in irq thread, does it make sense
> > > to spawn a worker thread for this and handle it there? Why not do in the
> > > irq thread itself. Using a thread kind of defeats the whole point behind
> > > concept of irq threads
> > 
> > Not sure If you are talking about cdns_update_slave_status_work().
> > The reason we need to spawn a worker thread in sdw_cdns_irq() is
> > that we will do sdw transfer which will generate an interrupt when
> > a slave interrupt is triggered. And the handler will not be invoked if the
> > previous handler is not return yet.
> > Please see the scenario below for better explanation.
> > 1. Slave interrupt arrives
> > 	2.1 Try to read Slave register and waiting for the transfer response
> > 	2.2 Get the transfer response interrupt and finish the sdw transfer.
> > 3. Finish the Slave interrupt handling.
> > 
> > Interrupts are triggered in step 1 and 2.2, but step 2.2's handler will not be
> > invoked if step 1's handler is not return yet.
> > What we do is to spawn a worker thread to do step 2 and return from step 1.
> > So the handler can be invoked when the transfer response interrupt arrives.
> 
> To build on Bard's correct answer, the irq thread only takes care of
> 'immediate' actions, such as command completion, parity or bus clash errors.
> The rest of the work can be split in
> a) changes to device state, usually for attachment and enumeration. This is
> rather slow and will entail regmap syncs.
> b) device interrupts - typically only for jack detection which is also
> rather slow.
> 
> Since this irq thread function is actually part of the entire HDaudio
> controller interrupt handling, we have to defer the work for cases a) and b)
> and re-enable the HDaudio interrupts at the end of the irq thread function -
> see the code I shared earlier.
> 
> In addition, both a) and b) will result  in transactions over the bus, which
> will trigger interrupts to signal the command completions. In other words,
> because of the asynchronous nature of the transactions, we need a two-level
> implementation. If you look at the previous solution it was the same, the
> commands were issued in the irq thread and the command completion was
> handled in the handler, since we had to make the handler minimal with a
> global GIE interrupt disable we kept the same hierarchy to deal with
> commands but move it up one level.
> 
> You could argue that maybe a worker thread is not optimal and could be
> replaced by something better/faster. Since the jack detection is typically
> handled with a worker thread in all ASoC codec drivers, we didn't feel the
> need to optimize further. We did not see any performance impact with this
> change.
> 
> Does this answer to your concern?

The point is that we are already in irq_thread which is designed to
handle any bottom half processing and can be given priority, spawning of
worker threads for another bottom half seems unnecessary to me and would
increase the latency for you.

I would have handled everything in irq_thread and returned, after all we
are in bottom half :)

Is there a reason for worker thread here, if so it is not clear to me
atm.

Thanks
-- 
~Vinod
