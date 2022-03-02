Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40544CA955
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:44:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AEFA1A46;
	Wed,  2 Mar 2022 16:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AEFA1A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646235850;
	bh=7IYRL+GavLmgyLRpxHba+gbdrurgtbY4Z97aGoux0xQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTy96MO2Lgzt8LLkmeE+17D27DNHWKvxHnEACJUjnBlOYfGqCu0WurdcnBjSc3Sxt
	 Ucs3Bhy0hRQBi1F+L4nQHeeFpUOY8nDJ+tbgB92PL/tEyMkWPcVrsmD79kJRUDakQ2
	 N6HHKqQ6RYw0DwX42XaramIZxs3W6UNw09mWKT2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9768F8027D;
	Wed,  2 Mar 2022 16:43:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 688FCF801D5; Wed,  2 Mar 2022 16:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2423DF80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2423DF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C9bcaRPy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 662646170B;
 Wed,  2 Mar 2022 15:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DD4C004E1;
 Wed,  2 Mar 2022 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646235773;
 bh=7IYRL+GavLmgyLRpxHba+gbdrurgtbY4Z97aGoux0xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C9bcaRPydA5rE7UiWO+AwDn8Dw2XEyrI7axyNYrCDDuYn6BTHy8G+NOeJWrOCyxOc
 pEeY7E2sPPS2gL2hbFbKbhuW4S2l50kkI5DhQAVX2nfFqpsQ4Kq3KEevr2/GLPUiw0
 mxlPRuHI569S7IQdon+YbCxs7++L6f1RrW4qLjxKtXoC+uFyxCITuANeGP0VeJrsy6
 VsJnrzwlcSOlS6Q4VLw6HnrXJesLUbGHkDQBr1vY6T9pr19KulOfAFch1z/G84TXtj
 NOegoTsBZrLhMNRMWK30XpekBE7sYDJh3VXwzTw81fO2yUUCayvYQArluvl3VAFBIa
 VreWrZefN5Lbw==
Date: Wed, 2 Mar 2022 21:12:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/3] soundwire: qcom: add pm runtime support
Message-ID: <Yh+QeWEufbp2JLo+@matsya>
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

On 28-02-22, 17:25, Srinivas Kandagatla wrote:
> This patchset adds pm runtime support to Qualcomm SounWire Controller using
> SoundWire Clock Stop and Wake up using Headset events on supported instances and
> instances like WSA which do not support clock stop a soft reset of controller
> along with full rest of slaves is done to resume from a low power state.
> 
> Tested it on SM8250 MTP and Dragon Board DB845c

Applied, thanks

-- 
~Vinod
