Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169F18CF97
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 14:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAF317E4;
	Fri, 20 Mar 2020 14:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAF317E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584712674;
	bh=bQLfnNJ21tARCpyrrG8kAbYnLEtL50j8Wc8tG/DdL90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlMsAlVnqvbDW+B6yw6CCkyCYJ5UMwGoJaOGGPAlxhdX++S8RhnZzMm5K24lbPef6
	 HFU3F+5Eq7TdUY7AR0Oetw8I9i013Pf5K3nuiGg3LxUq2Is1Z3YLqnm+6v+4he03oP
	 RwwmVjGibGgvKn4lxcGNCziJGcEfQR+ROTO1es9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3DA3F80139;
	Fri, 20 Mar 2020 14:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C7CF8015B; Fri, 20 Mar 2020 14:56:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42AB9F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 14:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42AB9F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NavK74h2"
Received: from localhost (unknown [122.167.82.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D559720709;
 Fri, 20 Mar 2020 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584712566;
 bh=bQLfnNJ21tARCpyrrG8kAbYnLEtL50j8Wc8tG/DdL90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NavK74h2sYbbhdArU4x0jD1mqxNRojoZeiD2Qy9BRwIEIPCfkuC+cttylna7mGG05
 3T+ScfauWK8yJSIU57Kgg7uh7YuKBXjGJzKIjUsdwR+KV3jL0gVuXPAk+tXokSx3AM
 NAtOipTPMM2f+0SYs0ggJCObPHK0GAaWtS0N/pmY=
Date: Fri, 20 Mar 2020 19:26:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] soundwire: stream: Add read_only_wordlength flag to
 port properties
Message-ID: <20200320135602.GF4885@vkoul-mobl>
References: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
 <20200311113545.23773-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311113545.23773-2-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
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

On 11-03-20, 11:35, Srinivas Kandagatla wrote:
> According to SoundWire Specification Version 1.2.
> "A Data Port number X (in the range 0-14) which supports only one
> value of WordLength may implement the WordLength field in the
> DPX_BlockCtrl1 Register as Read-Only, returning the fixed value of
> WordLength in response to reads."
> 
> As WSA881x interfaces in PDM mode making the only field "WordLength"
> in DPX_BlockCtrl1" fixed and read-only. Behaviour of writing to this
> register on WSA881x soundwire slave with Qualcomm Soundwire Controller
> is throwing up an error. Not sure how other controllers deal with
> writing to readonly registers, but this patch provides a way to avoid
> writes to DPN_BlockCtrl1 register by providing a read_only_wordlength
> flag in struct sdw_dpn_prop

Applied, thanks

I will send a tag, so that mark can apply the second patch for asoc

Thanks
-- 
~Vinod
