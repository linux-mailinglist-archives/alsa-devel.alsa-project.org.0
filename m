Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC8258D2F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 986EB17AA;
	Tue,  1 Sep 2020 13:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 986EB17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598958552;
	bh=T0xnxr/y4YBmhu4WiqlJbSgMNsEzKd25ycCTi2mkHEc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnGwbvfC0ukEzmf0K6fCw28TzoqCKtQ8NT6s3Cw2WylD6xHrG40BgQPHegbDd+ZkZ
	 iuaO2bTzpyCdmj3lNSa7JZuzMnxN7NLX5/wxnw4399AtR4nyVQRfcwUCfiDsDrTQoN
	 /QaGojdpf33wZVt3vmELKjD/ASm9HquYHh0yWVeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E35FAF802BC;
	Tue,  1 Sep 2020 13:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECEECF8020D; Tue,  1 Sep 2020 13:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0A4F8020D
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0A4F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZRA07ah7"
Received: from localhost (unknown [122.172.190.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B7DF207BC;
 Tue,  1 Sep 2020 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598958441;
 bh=T0xnxr/y4YBmhu4WiqlJbSgMNsEzKd25ycCTi2mkHEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZRA07ah7oA3Z+zd0ktM3bt0M5XKPWhxnpzJMQOHXOduHfaZN28YoDJGPUnBzi0E+v
 AyngVMf5h4GNdW6sl4hTtnb9k26Bv4i5HriLMbiLPB4WHVW5SDO2Xoz+D4zXbciTUW
 Kso17d+9HqbCZur7G+ClfcGC078yftNnkzmVjEEk=
Date: Tue, 1 Sep 2020 16:37:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
Message-ID: <20200901110716.GA2639@vkoul-mobl>
References: <20200829110047.GC2639@vkoul-mobl>
 <051afb2d-dd2e-0ea4-d8a9-980f5df136b7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <051afb2d-dd2e-0ea4-d8a9-980f5df136b7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
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

On 31-08-20, 10:15, Pierre-Louis Bossart wrote:
> 
> > > > > > > Detect cases where the clock is assumed to be stopped but the IP is
> > > > > > > not in the relevant state, and add a dynamic debug trace.
> > > > > > 
> > > > > > you meant a debug print..and it looks like error print below (also in title).
> > > > > 
> > > > > I don't understand the comment. Is the 'trace' confusing and are you asking
> > > > > to e.g. change the commit message to 'add dynamic debug log'?
> > > > 
> > > > Question is what is dynamic about this?
> > > dev_dbg() is part of the kernel dynamic debug capability...
> > > 
> > > https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
> > > 
> > > Not sure what you are asking here?
> > 
> > :-| where is dev_dbg() ?
> > 
> > See [1]
> 
> > 
> > [1]
> > 
> > > +			dev_err(dev, "%s invalid configuration, clock was not stopped", __func__);
> > 
> >                          ^^^^^^^
> 
> it's still a log using the "dynamic debug" framework.
> 
> Again, what are you asking us to fix?

Ah you are really testing my patience!

The title says "dynamic debug" and then you use a dev_err which is *not*
part of dynamic debug as it is printed always and cannot be dynamically
enabled and disabled!

See Documentation/admin-guide/dynamic-debug-howto.rst:

"Dynamic debug is designed to allow you to dynamically enable/disable
kernel code to obtain additional kernel information.  Currently, if
``CONFIG_DYNAMIC_DEBUG`` is set, then all ``pr_debug()``/``dev_dbg()`` and
``print_hex_dump_debug()``/``print_hex_dump_bytes()`` calls can be dynamically
enabled per-callsite."

No dev_err here!

-- 
~Vinod
