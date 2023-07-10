Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286274CFB5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 10:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF2E7F4;
	Mon, 10 Jul 2023 10:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF2E7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688977121;
	bh=o21HF+UQcS0l3yAQUuKG4zuD/R+bPXKc2OVpaRoiVgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMcz/My7f1EHwRzHWUJCtsCQI/K5gxRHG+Jsu0zFciGxs66IXcMsA5PNMryIvcxp2
	 myElelt7QWcvzW15SsrMxy9fYT+C9QC1t5gUCP0tD3/NvT1jQDIKQFiCBO2JyNaW/T
	 g+H68KFX6/4pWwBJFuwFK3jnpw7dQX6EPs/+BbEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB737F8053B; Mon, 10 Jul 2023 10:17:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 330C0F80153;
	Mon, 10 Jul 2023 10:17:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F08BF80249; Mon, 10 Jul 2023 10:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 470EDF800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 10:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470EDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n40nmwMw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB0060B41;
	Mon, 10 Jul 2023 08:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B392C433C8;
	Mon, 10 Jul 2023 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688977033;
	bh=o21HF+UQcS0l3yAQUuKG4zuD/R+bPXKc2OVpaRoiVgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n40nmwMw1E+wUBhSn66EV2a1HkmIgPT+NPilR6uVX5pfjZPL2n4/pipwhgcYytccu
	 LbRUzBWO8+JndLw3pQw/UEkD0zuG9HVplY4imqP+0pFG1EKcJVLEGMIw5t423kXXzW
	 uSBl7lbDma9jbUlCIv8gsO5tAle78cBiCVl07CeDfTJgjnG5DO+No2rc00ZhO9UxZc
	 TxiHU605qD7qjhd/B3olEmSDQwRoy8RizVGyrVIE+oybl8N/eUpBc6x56DkH1sTT2m
	 4bmotqdAEBfXx9pMdTmAXu020eottw9EV3NZqP+LLCJnVjfrl7NXezK5OqdlF1uUQc
	 vh5IDhxWOUIDg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qIm5T-0007yi-0p;
	Mon, 10 Jul 2023 10:17:39 +0200
Date: Mon, 10 Jul 2023 10:17:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: andersson@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soundwire: qcom: update status correctly with mask
Message-ID: <ZKu-o0GQgh84cxZ0@hovoldconsulting.com>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
 <20230525133812.30841-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525133812.30841-2-srinivas.kandagatla@linaro.org>
Message-ID-Hash: ISVTIMKA566R3OS5J3TU4WVARWHB7V5D
X-Message-ID-Hash: ISVTIMKA566R3OS5J3TU4WVARWHB7V5D
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISVTIMKA566R3OS5J3TU4WVARWHB7V5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 25, 2023 at 02:38:09PM +0100, Srinivas Kandagatla wrote:
> SoundWire device status can be incorrectly updated without
> proper mask, fix this by adding a mask before updating the status.
> 
> Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

When rebasing on 6.5-rc1, I noticed that this one was apparently never
merged along with the rest of the series.

Any idea how this could have happened?

And can we get this one into 6.5 as well?

>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index aad5942e5980..9440787e924b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -515,7 +515,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>  		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>  
>  		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
> -			ctrl->status[dev_num] = status;
> +			ctrl->status[dev_num] = status & SWRM_MCP_SLV_STATUS_MASK;
>  			return dev_num;
>  		}
>  	}

Johan
