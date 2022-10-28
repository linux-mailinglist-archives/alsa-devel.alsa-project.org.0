Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FF610FC3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 13:32:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886351DFF;
	Fri, 28 Oct 2022 13:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886351DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666956761;
	bh=q0lnOSum//LwPg46x156hM2PbLCHWNsC+B5nIs59ccc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hWltVVIkw4ftkW4EAjy5EyhqOhkyp5EmOE9XHahMa0RpsOipvMpaz+0A6OW/LHfQy
	 5ZYA62JPN70Jaymv6Z2ihYpimTzQSViHDryHbYoxFURcUpEnJwcKBBYiXoC23al/Uf
	 QPSkgfHp0eckG6PlWWI1vZRpQbZTDPsUVX/CZSLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17102F80095;
	Fri, 28 Oct 2022 13:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60C59F8024C; Fri, 28 Oct 2022 13:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C03BFF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 13:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03BFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UTDCBsjL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD5A6B82874;
 Fri, 28 Oct 2022 11:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71BBC433D6;
 Fri, 28 Oct 2022 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666956701;
 bh=q0lnOSum//LwPg46x156hM2PbLCHWNsC+B5nIs59ccc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTDCBsjLxk2mBDSl9PMp0X7zrsOmWygSgZcmhoghuTaozDLTyHgrdMh8K8wMiRwH7
 qrs07wSVDSalptihHLru5/QAQeE/o4hF52Ja96bkszWU0cvQ/lx96xbWgZjNZyyl74
 Fe36q1Hct1Z/MWaMzHWr7eqGYbx4fhBd64RAD54s/3n2Yo1QS31hf4kZMKueBvYc2f
 fWn2t8+co9TU53T2z34avoWwtKXAf670oK+dAgB7feY37L/2YJiFADoWI4pSCcHRx6
 POCEDrBTv5gu6xEG4gHLteIIgIV/DGJ3yMDNwLGKneH+SGPKyFdc9X1AHtSlOQLAkh
 Yw3ovsvj0kZTg==
Date: Fri, 28 Oct 2022 17:01:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/6] soundwire: qcom: fixes and support for v1.7
Message-ID: <Y1u9mGL5eELZT3Dw@matsya>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 26-10-22, 12:02, Srinivas Kandagatla wrote:
> This patchset has 2 fixes around fifo handling adds support
> for v1.7.0 controller found in SM8450 SoCs. Also a patch to
> make reset optional for v1.6 as this is not required for sc8280xp.

Applied, thanks

-- 
~Vinod
