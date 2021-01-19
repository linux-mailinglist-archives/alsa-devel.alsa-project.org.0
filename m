Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C420F2FBF51
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 19:46:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD1318D4;
	Tue, 19 Jan 2021 19:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD1318D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611081998;
	bh=wVQok1AIySdpltdtE76sXVNoWXBFVDfBsi3A3CqGwrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p8FvD6bUf2eipH7wIbO6DWhm83dSCPHtgCEwiZrZQ+qK5jNbV96QH9AQoaJQYJ47i
	 6ezEw41y0LPUrf+K60Y+3jaku2FHuLZvxesVAz74jJRkdjx/Ir4efdpI3H+8cqq35u
	 i9gw6yed1PmLNjCTRVG2rkT8Aex/+lbjbAcZRO/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB57F8026A;
	Tue, 19 Jan 2021 19:45:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6160CF80257; Tue, 19 Jan 2021 19:45:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92934F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 19:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92934F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Rpo7nks9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611081896;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=3sjdJm0c7v9cPImEYb6S8hIuTSPyGzqRji6UojT+LWU=;
 b=Rpo7nks9shhBxOfMgFkkxdC5xX4sjf3HgxAO56XDP0w0jF57kGX2FpmVI3WRl2F5Wj
 1ulR4fiaRPL0YzflZyO6Zqh9QWWvuPsjSVigSz/wkH+wtCuuZE2NLm1YgUE60fZCRuqL
 1Net0AB0A2u9j4zaiXLfkSwnUvGoynZjTXus3GP/9FKOA/8PFnVY9EhR307pzLV76Ecr
 uqkqxir28KnajtjMKFACdnb8HQNU5OyuqY+icTaml6DTQn1+DlYcj0yu0zJSA84SFbl7
 +8IrlJ6CrBUX30YXgl6FABKeov19xcTt8k4bObT/eOZUMq0Q0mCukyR/bSrUUGyTo8E8
 8gcA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic3ABg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0JIiuGra
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 19 Jan 2021 19:44:56 +0100 (CET)
Date: Tue, 19 Jan 2021 19:44:49 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY
 and QUATERNARY
Message-ID: <YAcooWUYZkE/Kg8O@gerhold.net>
References: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
 <20210119171527.32145-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119171527.32145-3-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
 Jun Nie <jun.nie@linaro.org>
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

On Tue, Jan 19, 2021 at 05:15:27PM +0000, Srinivas Kandagatla wrote:
> lpass hdmi support patch totally removed support for MI2S TERTIARY
> and QUATERNARY.
> 
> One of the major issue was spotted with the design of having
> separate SoC specific header files for the common lpass driver.
> This design is prone to break as an when new SoC header is added
> as the common DAI ids of other SoCs will be overwritten by the
> new ones.
> 
> Having a common header qcom,lpass.h should fix the issue and any new
> DAI ids should be added to the common header.
> 
> With this change lpass also needs a new of_xlate function to resolve
> dai name.
> 
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
> Reported-by: Jun Nie <jun.nie@linaro.org>
> Reported-by: Stephan Gerhold <stephan@gerhold.net>
> Tested-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This applies fine now and HDMI audio works again on DB410c:

Tested-by: Stephan Gerhold <stephan@gerhold.net>

Thank you!
Stephan
