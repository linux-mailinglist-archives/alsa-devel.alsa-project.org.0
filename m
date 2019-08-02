Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C57FF41
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2598916DB;
	Fri,  2 Aug 2019 19:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2598916DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564765627;
	bh=ec/fZ8kWo6qoLHR/7tXqo1McrChL4hUxlI9KHx/68SU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLj0HrKyI0TIPVz4lVAT1EfH+tJSTPZe/p5Fnr28EjjcGL5D90pOfYuIeDPU1PdXf
	 KLOelsMqMrbaaqCVAHLfE4l2mi9sJGGFfP+4tKusSaLgRZ4UQiwry/r2DPEbqvBQdL
	 bU69HxtpUmzFowOKn1SMcMcj5rQAS7heuwiAWduU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BCAF8049A;
	Fri,  2 Aug 2019 19:06:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6ACAF8049A; Fri,  2 Aug 2019 19:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 503AEF8048E
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 503AEF8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FZi0aW7h"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0DE220644;
 Fri,  2 Aug 2019 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564765563;
 bh=zyFQjXyh3QHHzXm6u/m7sXjNjCXkfXoAXKp3IdMcjwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZi0aW7hN7atOO49xnVUT7RbRhGIanyxnc5VBG93AS4P3SJ0v/zGLXClQD8S2xJ6z
 PCJDaMZtexuQbRv6gDsfqWaxRMC7juiESX4QHIRZZO3uGxw5lu0D6fVOOTnDdmcOKn
 BbpDXMIhg1sJyGfUHJ+ocJxX/PhdGY9uzxb98+h0=
Date: Fri, 2 Aug 2019 22:34:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802170450.GY12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
 <20190726144325.GH16003@ubuntu>
 <d6268a75-b38c-aee5-0463-af8b602286bb@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6268a75-b38c-aee5-0463-af8b602286bb@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 21/40] soundwire: export helpers to
 find row and column values
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

On 26-07-19, 10:26, Pierre-Louis Bossart wrote:
> 
> 
> On 7/26/19 9:43 AM, Guennadi Liakhovetski wrote:
> > On Thu, Jul 25, 2019 at 06:40:13PM -0500, Pierre-Louis Bossart wrote:
> > > Add a prefix for common tables and export 2 helpers to set the frame
> > > shapes based on row/col values.
> > > 
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   drivers/soundwire/bus.h    |  7 +++++--
> > >   drivers/soundwire/stream.c | 14 ++++++++------
> > >   2 files changed, 13 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> > > index 06ac4adb0074..c57c9c23f6ca 100644
> > > --- a/drivers/soundwire/bus.h
> > > +++ b/drivers/soundwire/bus.h
> > > @@ -73,8 +73,11 @@ struct sdw_msg {
> > >   #define SDW_DOUBLE_RATE_FACTOR		2
> > > -extern int rows[SDW_FRAME_ROWS];
> > > -extern int cols[SDW_FRAME_COLS];
> > > +extern int sdw_rows[SDW_FRAME_ROWS];
> > > +extern int sdw_cols[SDW_FRAME_COLS];
> > 
> > So these arrays actually have to be exported? In the current (5.2) sources they
> > seem to only be used in stream.c, maybe make them static there?
> > 
> > > +
> > > +int sdw_find_row_index(int row);
> > > +int sdw_find_col_index(int col);
> 
> yes, they need to be exported, they are used by the allocation algorithm (in
> Patch 27).
> Others will need this for non-Intel solutions, it's really a part of the
> standard definition and should be shared.
> I can improve the commit message to make this explicit.

Yes that would help! And also move it to before it's usage so it clear
that it is used in next one.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
