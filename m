Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC647202F8A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 07:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A4716CE;
	Mon, 22 Jun 2020 07:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A4716CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592804196;
	bh=buogNVymtxZczQRvv8+g2nbdqd82HeUu7XS5fvcsNUM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huIveXRsNgYw0TlhJiUFSNhokF8fglllM53SkYbX3BOm9A+C9xggNgTSBuocQb9xy
	 pnBLwRt3ge9OGM52u/YdiWjB2jSQtzbwLfptBInoL4ebMVjasQnFIjErL4r2P4RbSR
	 urCBHBefwg3geQfzDngDJGfvu6IPhst6NbXdJr2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A79DEF8010E;
	Mon, 22 Jun 2020 07:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B945F8015B; Mon, 22 Jun 2020 07:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 585FDF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 07:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 585FDF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ixsUV6i0"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AB7A25403;
 Mon, 22 Jun 2020 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592804106;
 bh=buogNVymtxZczQRvv8+g2nbdqd82HeUu7XS5fvcsNUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ixsUV6i006rFSF+BM2wZPMzJv+W3L5HSubsSio34AulKk4MXs2Zb7H+/kNttBvXiM
 SwXB5XtJo87eWhierQ0slWFCy2kP5p+1akvFfW9tEqmefbq2Op1Q90NPSCEHM+tg0R
 vhlfcxdyuaD45ZqJCoRSPauOdqisrQDccUFivVuc=
Date: Mon, 22 Jun 2020 11:05:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] ALSA: compress: fix partial_drain completion state
Message-ID: <20200622053502.GF2324254@vkoul-mobl>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-4-vkoul@kernel.org>
 <0a0fcd4c-40dd-621e-b0ad-51296178aa9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a0fcd4c-40dd-621e-b0ad-51296178aa9e@linaro.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

On 19-06-20, 10:13, Srinivas Kandagatla wrote:
> 
> 
> On 19/06/2020 05:54, Vinod Koul wrote:
> > On partial_drain completion we should be in SNDRV_PCM_STATE_RUNNING
> > state, so set that for partially draining streams in
> > snd_compr_drain_notify() and use a flag for partially draining streams
> > 
> > While at it, add locks for stream state change in
> > snd_compr_drain_notify() as well.
> > 
> > Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other compress functions (v6)")
> > Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for testing Srini

-- 
~Vinod
