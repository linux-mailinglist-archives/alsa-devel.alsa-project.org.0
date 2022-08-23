Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DB59E80D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B84C9167E;
	Tue, 23 Aug 2022 18:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B84C9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661273741;
	bh=p88vJDhjNhP/UYOBR252hX3zvo246PNcPZEo6vSfkQI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4ZKVcFoGGn6ziGc+dwhOHEvP9lc7ZiAdqTwJpj8O1b45PQ1ga0KdiIUQfJ+8pWd+
	 6GMLKu87tt2Vs5hwxUFmAlYsrN69gvktQvso8K3+XarhKam51d4d33lLGFIJ5BDXAn
	 vim9DkgU+j7m9/VGKvmmmRp4fZ9NRkSHMpCLqkxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29EB5F8027B;
	Tue, 23 Aug 2022 18:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4237F8014E; Tue, 23 Aug 2022 18:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F9AAF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9AAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gydzuzv2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 938B7B81F3D;
 Tue, 23 Aug 2022 16:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769E3C433D6;
 Tue, 23 Aug 2022 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661273673;
 bh=p88vJDhjNhP/UYOBR252hX3zvo246PNcPZEo6vSfkQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gydzuzv2SgN9i5w0v/C1Irov18C7R5zy2J67Oa4qbnQtUDhgXPWFYfRS5vXr9tD6I
 SHFsJKJODBTncZsOApYE3ILI2kDQZz06ky+ivm5qe/kLbNZgZHldBuHtGuSci209gZ
 DBQhlPFlNP6TBCQL1jlGQhcBK7yPbfck9YHg31LvyXY8choe/7kLqS4hzWP4E9QQVZ
 QdU/Og8fB4Th+6Ra1f3Rt+n+Y6lgsRCLdxNFya01U//GQH5BNpNPE/4pIGrywDfdMO
 syfmLGPSUIoIonGdTdzZqkfI0CR53NqQFRjzYGrN8MWvjtjy8ewbqvT30FpVs4Kavp
 DRKJyB5PjBHEQ==
Date: Tue, 23 Aug 2022 22:24:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] soundwire: qcom: Update error prints to debug prints
Message-ID: <YwUGRGhDCXbhrHVn@matsya>
References: <1657724067-19004-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657724067-19004-1-git-send-email-quic_srivasam@quicinc.com>
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

On 13-07-22, 20:24, Srinivasa Rao Mandadapu wrote:
> Update error prints to debug prints to avoid redundant logging in kernel
> boot time, as these prints are informative prints in irq handler.

Applied, thanks

-- 
~Vinod
