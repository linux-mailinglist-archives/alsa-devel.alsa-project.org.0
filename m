Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022BE4CA994
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:50:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F23A1F9D;
	Wed,  2 Mar 2022 16:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F23A1F9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646236212;
	bh=T6WtGOV8QSur6KSw5nWl1mBfGIGN1n9aFmbvLWtyoiw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=upJJyrzoWsK/08KBdHQUtqeFk52uZ7xnudjlgZtKXJIFUfwWB3OgUAm0IckJKAT/A
	 gqcrs6og3mQbSr4evEtzrTlmItzWgWzo4AjwZ8iMNgfBY4IfSRn4+lfEtRqFhPsyU0
	 sW4dk9PNaD3mJ9lpwdQkYrDCxajIweJTOA3EeGJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179F5F80154;
	Wed,  2 Mar 2022 16:49:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7875F804CB; Wed,  2 Mar 2022 16:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 668FCF80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668FCF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SxcqV+I2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A320B8207F;
 Wed,  2 Mar 2022 15:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D87BC340F3;
 Wed,  2 Mar 2022 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236154;
 bh=T6WtGOV8QSur6KSw5nWl1mBfGIGN1n9aFmbvLWtyoiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxcqV+I2z+qdbocu8s7GdZLwYqh/njg0GGAjWRQLwH11bp9gNvjAXGqhKtPJUoK15
 jkVtYwC06Xv/bMriMC+KOa4SthTh7tqNmENjo9xeO4IBdNLlNs8g+yt+92taaSHU2t
 AU2Y1Z7kfwhvrbAMWv4uPAGhFxJIhfk4g1ZTL7yXSxErLh/ZNxm+lqaMuxGVF8UKCJ
 9rFDebRC8Hbf0a8c+FysQ/sA5T0BhdhiO6zKi+tc5YubN8kdJ3ZPAvRoGEIt+Zhg9V
 PwuBE2Nggow9GVh/IRtUo8Kk+zeDelF9UaQYLhFYMUfgEtpQkyfi9Q3QBZJqZVBga7
 5llHZnErtLx7w==
Date: Wed, 2 Mar 2022 21:19:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v6 2/3] soundwire: qcom: constify static struct
 qcom_swrm_data global variables
Message-ID: <Yh+R9kcqytMhhiWU@matsya>
References: <1646224982-3361-1-git-send-email-quic_srivasam@quicinc.com>
 <1646224982-3361-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646224982-3361-3-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, rohitkr@codeaurora.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
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

On 02-03-22, 18:13, Srinivasa Rao Mandadapu wrote:
> The qcom_swrm_data structures is only required for setting soundwire params,
> so make the qcom_swrm_data structure const to allow the compiler
> to put it in read-only memory and avoid unintentional modifications.

Applied, thanks

-- 
~Vinod
