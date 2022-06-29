Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCF55F574
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 07:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDA63E8;
	Wed, 29 Jun 2022 07:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDA63E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656478878;
	bh=LzISrZ8nawMpb8hJijKZtkKzjzGJ15T7qX5GvMY7oiQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXJNUjiH1lcxxoW5ud627cVNOMJydu7I9UQbOe5oCfOiyj1/ZuK44AcdvD6XOvO8j
	 dr864lGH2IVwnxOrlaI8if9clqyyiSeYSOPYLOF38MWKZDHRfQHG95EBoFTKe+iJeb
	 rZNYUdVIH8IM9oxKMKboeKeah9IUqWhvKQx6yNeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE2FF80107;
	Wed, 29 Jun 2022 07:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED6BF8020D; Wed, 29 Jun 2022 07:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 807E8F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 07:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 807E8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eVx7YZs4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08AAFB818E2;
 Wed, 29 Jun 2022 05:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7494C34114;
 Wed, 29 Jun 2022 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656478808;
 bh=LzISrZ8nawMpb8hJijKZtkKzjzGJ15T7qX5GvMY7oiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVx7YZs4x7vexbi+1+THxjafiRTSvaILsUm0Sj3CSwUrugrohLYMtolLOwoCdXSL3
 ZqONu9hS7VAlynL84rwny0h2JAI/oWglqHxS6SKs3Js6yzfsUeJt5nKzNVQGRiL1J5
 7HyIm3vGLAnuA8B21Crwe88BJr5Sf+AdIAjMdh7cvSvtRculfhBS2Pp7ZpjCjy3wRx
 fT3SSTUDtAQ6hZvRAJShf8+sszlfwh8IOHwCtixYwnn+l3ZhhpHNiYPGXpfCZCjh2U
 pIwdUTCOT48ANgQ4xGVhgc/ZcoPucxwmVdm71z2GHfMjRA0RRAeuXHWJiNdDy4Rq3y
 gLol19pyRWAKQ==
Date: Wed, 29 Jun 2022 10:30:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v5 0/2] Add software clock gating requirement check
Message-ID: <YrvcVOo+f3+W4aoz@matsya>
References: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
 <YrQfs7HUIOV5x8Ub@matsya>
 <7b532c96-e36b-207e-532c-8b41f7106831@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b532c96-e36b-207e-532c-8b41f7106831@quicinc.com>
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

On 27-06-22, 18:01, Srinivasa Rao Mandadapu wrote:
> 
> On 6/23/2022 1:39 PM, Vinod Koul wrote:
> Thanks for your time Vinod!!!
> > On 10-06-22, 17:53, Srinivasa Rao Mandadapu wrote:
> > > This patch set is to add software clock gating requirement check
> > This fails to apply for me, please rebase on sdw-next and resend
> > 
> > Thanks
> 
> It seems one patch is missing in your branch, which accepted by Mark brown.

Ok. Pls send on -next and if there are conflicts we can coordinate with
Mark.

-- 
~Vinod
