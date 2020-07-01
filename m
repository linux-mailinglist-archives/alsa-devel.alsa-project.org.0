Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 509EB21035E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 07:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80341685;
	Wed,  1 Jul 2020 07:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80341685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593582258;
	bh=z+2RJZHyQny9rynb3BmYF5r0RdYoLOR7Ccd9JyesxtE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/6L3U9aCx9CqZC2UxlJcV/XqxMasGeg7lPC/eB4MbsbWN4hXVxR143ItDVEa9/Sx
	 Q5gOoRBzYf5wqjyz/Qm36R0rmAAriVM/NeQ2Gk0vW9bF5573tra1N8vzWtED+eyoaK
	 FUE6Q/XHpcwv9BflZtlQJAaT32Ve/fku0CWGVUm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2506BF800C1;
	Wed,  1 Jul 2020 07:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7261BF80217; Wed,  1 Jul 2020 07:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 922B3F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 07:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 922B3F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1/U8k8t8"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D306A20722;
 Wed,  1 Jul 2020 05:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593582149;
 bh=z+2RJZHyQny9rynb3BmYF5r0RdYoLOR7Ccd9JyesxtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1/U8k8t8jnr0MVIBLl3Q8dNbc3WGFzi3WFym1Qi9Ar3/Vh60em4504wWCovTjrtOk
 QV9+Zhq+sW0ax5ylUO6pMiVuzlFkT1A22j3LOkHVKjXF4K4M/pawujPLjz+BKdBd1X
 Eiw3i2HROaC03z20QBbGvpQqsVuVkdlHWAHSf/D0=
Date: Wed, 1 Jul 2020 11:12:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Message-ID: <20200701054224.GV2599@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
 <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 30-06-20, 11:46, Pierre-Louis Bossart wrote:
 
> > Is this called from irq context or irq thread or something else?
> 
> from IRQ thread, hence the name, see pointers above.
> 
> The key part is that we could only make the hardware work as intended by
> using a single thread for all interrupt sources, and that patch is just the
> generalization of what was implemented for HDaudio in mid-2019 after months
> of lost interrupts and IPC errors. See below the code from
> sound/soc/sof/intel/hda.c for interrupt handling.

Sounds good. Now that you are already in irq thread, does it make sense
to spawn a worker thread for this and handle it there? Why not do in the
irq thread itself. Using a thread kind of defeats the whole point behind
concept of irq threads

-- 
~Vinod
