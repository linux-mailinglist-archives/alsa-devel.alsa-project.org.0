Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FD564CF5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 07:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A7E16D5;
	Mon,  4 Jul 2022 07:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A7E16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656913060;
	bh=AWMVX+RQSTQTEGX1c33ORYkNFmnocumuLpJzoc6tgsU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d50+mPR9VWn0FCFACXOvHF/IwlH0dXP/ln1VXNOfgefMgj7HM2qAtHAMmk37XDFjz
	 rNxJda2Kj6LSMnpZ4Ro+XBal83WstAOs1gZC0/YEjp6R5nSM2SZCSgeseeK4aeW+11
	 ULw7nj39nkT8WTtCGNDJFpCdd0jofoGmxag/SsL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A90F80165;
	Mon,  4 Jul 2022 07:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06370F8014E; Mon,  4 Jul 2022 07:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50632F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 07:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50632F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cmpRAt3Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BAA0B80D1F;
 Mon,  4 Jul 2022 05:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9BEC341CB;
 Mon,  4 Jul 2022 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656912989;
 bh=AWMVX+RQSTQTEGX1c33ORYkNFmnocumuLpJzoc6tgsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmpRAt3YRyvIARLOi1wDwNvirn01XSmWvSZNv+nQg/PAdDCXVa5hVDUF55+7n/7bG
 JTnSOKFNJekGZgekZ1785kN/y8iLkjWf28Xg//Sfap8EfL4UFF4Gssurp07zZyw9tC
 rKO/aXE6XOZpMqTj3jWgdBCuAa6I5pkdEIDbLk3fDNslDqzx4NjkwkuBrMVepkOsK+
 ePDBb7u47LKIwqSJqD9EZv37BEqIul+aggurzAv7OIkPlO/qUq+eH6/UPPxOyni5nL
 7+BvwudXZoISgJTizVhCLhXfC1dDkPM1gJsv24kAI5IfNdsuS656Au+XXfCKhWtg1z
 1MFheJbsWkZqA==
Date: Mon, 4 Jul 2022 11:06:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [RESEND v5 2/2] ASoC: qcom: soundwire: Enable software clock
 gating requirement flag
Message-ID: <YsJ8WHgiybU0cQP/@matsya>
References: <1656659827-27450-1-git-send-email-quic_srivasam@quicinc.com>
 <1656659827-27450-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656659827-27450-3-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
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

On 01-07-22, 12:47, Srinivasa Rao Mandadapu wrote:
> Enable software clock gating flag in private data for SC7280
> based platforms, which are soundwire 1.6.0 version based.

why is this tagged ASoC... ???

I have fixed it up while applying

-- 
~Vinod
