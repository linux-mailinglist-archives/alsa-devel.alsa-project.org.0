Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314B62523E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCC51651;
	Fri, 11 Nov 2022 05:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCC51651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668139957;
	bh=cEEs+T9qWk3rROxF8lp+RSEHIzLb14TurbQZNI6Tbl4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eUwdR4T4ZZ9shNDGIC0WOVIlvwO2OhHkH5UjeHSEK6s37zRCdIghBWMITiq5gXH1u
	 7DNFkqKWVwvtanpa7lRYoDTEN7qBxwLzj18Wolx1e2CS+CoAUIMHItjafDr1TWH2lF
	 3BYjOMXMBSXAe9nGWE7pojdMpYj+M8sF7GC78ZwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA31F804AB;
	Fri, 11 Nov 2022 05:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1D0F8028D; Fri, 11 Nov 2022 05:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CBBAF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBBAF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rEDTMvM3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6713DB822ED;
 Fri, 11 Nov 2022 04:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88540C433C1;
 Fri, 11 Nov 2022 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668139891;
 bh=cEEs+T9qWk3rROxF8lp+RSEHIzLb14TurbQZNI6Tbl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEDTMvM3UUIKoGN9jTpfqNxfpOkSshWtW/miWmQBJhmXtj9qaQGjTwLIle3BqvZhv
 79pAuSqmcjX2H8WCyuwoBx0RdC2q8BW6NGkokoiomC+p09cQQnYLq01ry1jbpcfWZy
 p4hmM0HvqBIUMY4OXScLLW0CIuriB6NPzEhywrppfPCS5ZB8fGqqcxCACS30aNZH3N
 z9tcgsptxBFjh3+vyKGJ4lauoztk0q3+JRk9YPOkjRlM3awQyJteeql1jqDlVHVvdK
 t/5tdvS0c3yTQxJvSx3v8sF1T6YepdWGV9NFcFmZ/KJrNcPr6U2tU3mPkEyr3nBnz+
 I+XLn+R7lsf9w==
Date: Fri, 11 Nov 2022 09:41:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: Initialize clock stop timeout
Message-ID: <Y23LbSfwWnVS3ZAo@matsya>
References: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
 <Y1u855YZ/B3Q+FiI@matsya>
 <e5acf9e3-20b9-00b3-8d5f-687d47ccd49c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5acf9e3-20b9-00b3-8d5f-687d47ccd49c@linux.intel.com>
Cc: alsa-devel@alsa-project.org, bard.liao@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On 09-11-22, 10:05, Pierre-Louis Bossart wrote:
> 
> 
> On 10/28/22 06:28, Vinod Koul wrote:
> > On 20-10-22, 09:56, Bard Liao wrote:
> >> From: Sjoerd Simons <sjoerd@collabora.com>
> >>
> >> The bus->clk_stop_timeout member is only initialized to a non-zero value
> >> during the codec driver probe. This can lead to corner cases where this
> >> value remains pegged at zero when the bus suspends, which results in an
> >> endless loop in sdw_bus_wait_for_clk_prep_deprep().
> >>
> >> Corner cases include configurations with no codecs described in the
> >> firmware, or delays in probing codec drivers.
> >>
> >> Initializing the default timeout to the smallest non-zero value avoid this
> >> problem and allows for the existing logic to be preserved: the
> >> bus->clk_stop_timeout is set as the maximum required by all codecs
> >> connected on the bus.
> > 
> > Applied to fixes, thanks
> 
> Thanks Vinod, was this sent to Greg/Linus? the last pull request I see
> was for 6.1-rc1.
> Arch Linux cherry-picked this patch but other distros did not, so quite
> a few users are left with no audio card.

https://git.kernel.org/torvalds/c/f014699cca9a9a28fbdc06a9225b54562154fc20


-- 
~Vinod
