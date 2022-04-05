Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA304F21E3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 06:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030021679;
	Tue,  5 Apr 2022 06:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030021679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649132246;
	bh=WTPtM2b2ZKDKexhibsDpSmeAHFn61p8jAZEY8Se0LHk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSY2FwWJ9GiLMcDn8OGDwRrFJQ3md71ZLc+bl7o8TzYwPvLsSQlSEH7rCO703dFmR
	 R2xJNNS9QZurXiOMn5TNLXXUm43sbxT2qftohFy+lMYYHRvyNrOFmn8rzJ8zdyxWBt
	 zqpA0uTK/v6XJ9mjcWhVMws+8gOAK50qPyX2WUWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6548FF8012C;
	Tue,  5 Apr 2022 06:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D108F8016A; Tue,  5 Apr 2022 06:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82E86F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 06:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E86F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UsaCAE7i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BCAD6141C;
 Tue,  5 Apr 2022 04:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA07C340F0;
 Tue,  5 Apr 2022 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649132179;
 bh=WTPtM2b2ZKDKexhibsDpSmeAHFn61p8jAZEY8Se0LHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UsaCAE7ioMMRJAtVrCYEXXg9XLk1bT7czgRscGZ0P9wH3xsyMBnVmzOeMz49Khzh3
 cBsaNVSJ1w5crxDdMY9000khoqP/fhJVZ2oeOFQkCMH1comYraDYXJDlslDPzqmPnl
 0QNWKs8fCKM/XV1VRpPKSy9/Hibz2DBR/AkXh+DAMn73myhC2R9kDD4iDfcNkmqKJh
 vA4sjricMGXWi28oIOQ+BQk1jsVAkwTn8zvY8ct357InwSV38tdRUYHmeSw3I9B2ge
 NZ8kIGuPWPjsKQr2xcqnvoNLc5XFkerUlQ8vl9Hi8tUYe77/cgSb7L9dYDcTyWj9Ev
 4ofOfLe45g2Pw==
Date: Tue, 5 Apr 2022 09:46:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [RESEND v7 0/2] Add support for SoundWire1.6 audio cgcr register
 control
Message-ID: <YkvCj7LCZfhd92wB@matsya>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, rohitkr@codeaurora.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
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

On 03-03-22, 20:00, Srinivasa Rao Mandadapu wrote:
> This patch series is to add v1.6.0 compatible name for qcom soundwire
> driver and corresponding dt bindings.

Applied, thanks

-- 
~Vinod
