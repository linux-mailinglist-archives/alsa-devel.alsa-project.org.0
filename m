Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62935557504
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 10:10:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C48E1B00;
	Thu, 23 Jun 2022 10:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C48E1B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655971835;
	bh=9CPwAY0wWTPEXhM/d0JwDJxAObKhi7qi8HFQ+OM2Lhc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQshGHRZgJC3QJDqnaoOoulyazoC7dN91VuOYvoGkGVcmh+X0xk+vu1SP8/GB5qr9
	 MB0ix5FkjVP5JGs8lqpO99fJoouQt0SWKY5/oQnzVWp7pnAf0xjavlwlaeY/Wf3606
	 1XwuCYLjK7AGTBPFUuqj/b3ocJaHdlAPyqo2erbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F015F804CC;
	Thu, 23 Jun 2022 10:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0239DF800CB; Thu, 23 Jun 2022 10:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B59F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 10:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B59F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TAEGh09A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A4F4B8220A;
 Thu, 23 Jun 2022 08:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4CBC3411B;
 Thu, 23 Jun 2022 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655971768;
 bh=9CPwAY0wWTPEXhM/d0JwDJxAObKhi7qi8HFQ+OM2Lhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAEGh09A7pGRhh6u2YW7tgA1dGGMglaktDv7oZgjNbSjzs62Xk5Rl9W4fzz3dfAUI
 qI8HyVkOlkEyZVlYiXzr7NkP4FcrxCGMncjXqUsjXmSRYAYe2k/f3NmRqOtWU7V0Qy
 tY9p8gkNEKeRI8PUmj1e2m9HkV8ZtF0NuT+RRV22TYHhCzecvhPWySaZ3J/SfR88oG
 YqHEV5Jv/7wPKTFZ1otfCdgNIOy958K49uxHh+z2Tdhdn8rIexkXfY/3Sq9FG3WRDu
 R0ErXdifLSnURsVcJYE9WafPjLNWzoYlahAndCeUQJ755kT0D4968kfW3YferCdTs0
 GSFvuA74CbOjQ==
Date: Thu, 23 Jun 2022 13:39:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v5 0/2] Add software clock gating requirement check
Message-ID: <YrQfs7HUIOV5x8Ub@matsya>
References: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654863815-3970-1-git-send-email-quic_srivasam@quicinc.com>
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

On 10-06-22, 17:53, Srinivasa Rao Mandadapu wrote:
> This patch set is to add software clock gating requirement check

This fails to apply for me, please rebase on sdw-next and resend

Thanks
-- 
~Vinod
