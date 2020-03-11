Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3C1810F8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C7851669;
	Wed, 11 Mar 2020 07:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C7851669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583909080;
	bh=LI8rbNA8wJc83S2WR1/sE0Ht53AWmB5tHGMzGWEUODg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8XqEzJJ5qHy6G0dJS0m1m83CO75sePnPGDaFu5lCI5Wnrg5RMKwKUpM1xDzaJXFq
	 Nb7bvnz2mzkArPJkqcMkbIbbne70AZpsCNR3yB2Fr4ynRMCTCJHG7KJRB0LtMH09AZ
	 1RpyQ8QVMEKA9yh1q66usPmRt94JZJxL8GT3ZLUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E089F801F7;
	Wed, 11 Mar 2020 07:42:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8FB8F801EB; Wed, 11 Mar 2020 07:42:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB54F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 07:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB54F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M26G4X0U"
Received: from localhost (unknown [106.201.105.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75C1821655;
 Wed, 11 Mar 2020 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583908971;
 bh=LI8rbNA8wJc83S2WR1/sE0Ht53AWmB5tHGMzGWEUODg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M26G4X0UgwEGh4VvB4h8EhSAmXLwIUI3RrvAC1rXFaHYjFSmydS6eC2mH78OUax1D
 NiPWOlTwLO1RKZs61ALXNh6VG6oFv3Xm5RNq3boFdB2WKh7n1h7cBr8fW21JQFkkQ7
 87pnEdS5lWLdqmfV+/o4dTszFH+1ouannbTnzC2Y=
Date: Wed, 11 Mar 2020 12:12:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH] soundwire: bus: Add flag to mark DPN_BlockCtrl1 as
 readonly
Message-ID: <20200311064243.GI4885@vkoul-mobl>
References: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On 09-03-20, 17:37, Srinivas Kandagatla wrote:
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
> writes to DPN_BlockCtrl1 register by providing a ro_blockctrl1_reg
> flag in struct sdw_port_runtime.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> I will send patch for WSA881x to include this change once this patch
> is accepted.
> 
>  drivers/soundwire/bus.h    |  2 ++
>  drivers/soundwire/stream.c | 17 ++++++++++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 204204a26db8..791e8d14093e 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -79,6 +79,7 @@ int sdw_find_col_index(int col);
>   * @num: Port number. For audio streams, valid port number ranges from
>   * [1,14]
>   * @ch_mask: Channel mask
> + * @ro_blockctrl1_reg: Read Only flag for DPN_BlockCtrl1 register
>   * @transport_params: Transport parameters
>   * @port_params: Port parameters
>   * @port_node: List node for Master or Slave port_list
> @@ -89,6 +90,7 @@ int sdw_find_col_index(int col);
>  struct sdw_port_runtime {
>  	int num;
>  	int ch_mask;
> +	bool ro_blockctrl1_reg;

Let us use properties for this so it should be added in struct
sdw_dpn_prop or struct sdw_slave_prop (I dont think that we would have
different properties for each DPn when we are dealing with these simple
codecs)

Also the property should not have mipi tag as this is not in DiSCo spec
(yet), so I would suggest sdw_ro_wordlen for this.

Thanks
-- 
~Vinod
