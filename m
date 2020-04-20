Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884B1B0F4A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 17:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C39168E;
	Mon, 20 Apr 2020 17:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C39168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587395325;
	bh=tZzid1ierjtEP5oKAiqkEpzGVm7IESxd33GM0LkM1m0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/8l1ajb+oGxFXBGzkVcHohQTBkdzGQs0KKBsPI90fQqIbaan/Z/QjcUslghiQ3qw
	 IKlpqyY6ldVsUZ5AV1PvgEMqajRUI61HYxC1qDutRqmfcsMbKH6OLFKHxsu4SFeS9q
	 0apNrI31GtEVsg06wr735AO3ItiZ/cmcAxDxGb3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE8BF8020C;
	Mon, 20 Apr 2020 17:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E979DF801D9; Mon, 20 Apr 2020 17:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30087F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 17:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30087F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PnTrdFjc"
Received: from localhost (unknown [171.61.106.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06EB42074F;
 Mon, 20 Apr 2020 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587395215;
 bh=tZzid1ierjtEP5oKAiqkEpzGVm7IESxd33GM0LkM1m0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnTrdFjcnq66iqPP2QGWZYt9tnu7D9dAyGpj/SvLtzHVPIuLEAu9D479r194q2ohj
 TRMN3EMVnVMBg0eYZZ6ZIOCn8yRza0YCElOnxZOZX93K1Gtji1+vljXGuOeJND71+h
 iH2M799cDaIUUTKrG25z2brBocdlvLyI5fDL806k=
Date: Mon, 20 Apr 2020 20:36:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] soundwire: intel: use asoc_rtd_to_cpu() /
 asoc_rtd_to_codec() macro for DAI pointer
Message-ID: <20200420150651.GZ72691@vkoul-mobl>
References: <87y2qqvdxu.wl-kuninori.morimoto.gx@renesas.com>
 <20200420070816.GU72691@vkoul-mobl>
 <20200420120348.GA6507@sirena.org.uk>
 <20200420121752.GY72691@vkoul-mobl>
 <20200420140135.GD10045@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420140135.GD10045@sirena.org.uk>
Cc: linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 20-04-20, 15:01, Mark Brown wrote:
> On Mon, Apr 20, 2020 at 05:47:52PM +0530, Vinod Koul wrote:
> > On 20-04-20, 13:03, Mark Brown wrote:
> 
> > > > Applied, thanks
> 
> > > This fix is needed in the ASoC tree - are you OK with me applying it
> > > there?
> 
> > Sure..
> 
> > Acked-By: Vinod Koul <vkoul@kernel.org>
> 
> Hrm, actually this doesn't seem to apply against the ASoC tree - looks
> like we might need a cross tree merge if there's still issues in -next.


That seems strange, it applied fine for me on -rc1. Let me know if you
are seeing issues with this...

-- 
~Vinod
