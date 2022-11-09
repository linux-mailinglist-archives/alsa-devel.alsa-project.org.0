Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6A622322
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 05:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D9C857;
	Wed,  9 Nov 2022 05:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D9C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667968319;
	bh=4Rz6wgqWZLPyeSPEWet9jm6iMjiOYPopushiLvtLfiM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajJ7gpZf4FAHaL53zOjb1ceO9kBELhOwgPqNOExmcMPYcdOELGAfqN0fA5TjbCtX0
	 3XEyJNmRLH3XiTLoGO2I8lcZk9ZG5B8oLer1ILVK1WMtSMdoZzNDK48sX6TBZvUc2n
	 mIIrZ+MhMQQVPv6/+h7P3sNsAix4IT4Lmpot5kv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34242F802A0;
	Wed,  9 Nov 2022 05:31:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8AD4F80217; Wed,  9 Nov 2022 05:31:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E14F5F804FB
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 05:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E14F5F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ro7FisNy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 66D62CE1D5D;
 Wed,  9 Nov 2022 04:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4674C433D6;
 Wed,  9 Nov 2022 04:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667968252;
 bh=4Rz6wgqWZLPyeSPEWet9jm6iMjiOYPopushiLvtLfiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ro7FisNy+HJzQoC3cw8P4m76mXxr+ZtPfrgFGObsH9hJuesMl2BXn9cPDD2zj3k8b
 bdBKCwCg2dJWejAQqXx+vV+yxTZvyJ7lledzJ/LIobcffcWSloracw/PxKVyC5If5N
 BttiBKDthhKJhOZJp4wW55VFpmtmtVGAwUbVaKTR39k2a8MzjE97xco2PTtsIDgIkA
 pbrX+l8H3++TjMuj3n1vb4ruQkUQm5k3X41PL2ldnGONLP6OEJ54h7Yy5t14tFhDdE
 2jq9Wu0PoZnQE8ns0YlgG1Bhmaz2L6xLxKsWe6pbvCQzPf+fBu2etP1mS/pITWXNh0
 N2OC2Eap4rwvw==
Date: Wed, 9 Nov 2022 10:00:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: soundwire: Convert text bindings to
 DT Schema
Message-ID: <Y2ss+NN3ZHJ4sIbR@matsya>
References: <1667918763-32445-1-git-send-email-quic_srivasam@quicinc.com>
 <1667918763-32445-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1667918763-32445-5-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dianders@chromium.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_rjendra@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 mka@chromium.org
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

On 08-11-22, 20:16, Srinivasa Rao Mandadapu wrote:
> Convert soundwire text bindings to DT Schema format.
> 
> Update interrupt property items as per device tree, as it is not
> appropriately described in text file.
> Update some of the properties description with minimum and maximum range.
> Update secondary node info which is used to describe slave devices.

Applied, thanks

-- 
~Vinod
