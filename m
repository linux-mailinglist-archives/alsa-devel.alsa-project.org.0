Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AD51F492
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 08:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92F1189F;
	Mon,  9 May 2022 08:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92F1189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652078069;
	bh=+A/eYgl7HZZwEPuWOCcBdPtKm4G+Gnd+d5DfAahMbzA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nsX8n+0St1CR2i5O1PnlDReC/PALpbuh/3GWZgbRlAIxLfujKiW6SGHZlBfaO2xM9
	 0Dfxc/K8ZgapDkPsA0FkbifE3wseH7cI+hqUQu4k5A+OfFJDEL7Kygq/wv6N5/UG98
	 kFhgfbcOvBs+3uMtAWZuXLgNU909NKFzejNrxwrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4114F8025D;
	Mon,  9 May 2022 08:33:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B34BF8047B; Mon,  9 May 2022 08:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB8D1F8025D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 08:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8D1F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IWxZLlR/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4E26611D9;
 Mon,  9 May 2022 06:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B48C385AB;
 Mon,  9 May 2022 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652078007;
 bh=+A/eYgl7HZZwEPuWOCcBdPtKm4G+Gnd+d5DfAahMbzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IWxZLlR/aKi+U2YSTpIf2e/4GefVjQpu8L3OzO2VI/MxzHN5KZ8/h+7QmB5rPbkPU
 xcPjSKhTUmk9hp+IAyQOTOIuabloO1DjxdpbUgEemg8YwEpKrbbzpHnTlBqKIkz3IL
 rvTxjMFsRaJSYpOLwBfIK8ZxYXI1yqFA/lbYQnajVgKBgudwo6opeXl2pRlIeWoEhB
 PnG5BPGbuqrt/KRzGYY1znCk3Y7n7Aun4kLRYcuzfcgZwm4W1A3dr5b3Zbq+f1hDH0
 pqksRnLywYTysgMg6QyMhmzdTFWOItzd/r0TCQHTBIQhRo4BMctcU97jw9DPR2uxR2
 NcmdYBJcuIA/Q==
Date: Mon, 9 May 2022 12:03:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Message-ID: <Yni1sr0R34C+bR6X@matsya>
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 linux-kernel@vger.kernel.org, bard.liao@intel.com,
 pierre-louis.bossart@linux.intel.com
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

On 06-05-22, 09:47, Srinivas Kandagatla wrote:
> Currently timeout for autoenumeration during probe and bus reset is set to
> 2 secs which is really a big value. This can have an adverse effect on
> boot time if the slave device is not ready/reset.
> This was the case with wcd938x which was not reset yet but we spent 2
> secs waiting in the soundwire controller probe. Reduce this time to
> 1/10 of Hz which should be good enough time to finish autoenumeration
> if any slaves are available on the bus.

Applied, thanks

-- 
~Vinod
