Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635130A5BA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:46:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38051766;
	Mon,  1 Feb 2021 11:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38051766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612176372;
	bh=6Zri/dvqzu0bG22vp3nrZHtLrn++mrpHzb96D2MjSTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d02omIbvJPhLbIJ3G9iegr6kcd4/KWlL2PI2Q4V2le1T5WY6qAhyWT1lE2AcbZL3r
	 JwA+UVXot5BxbYibudSqNjQsT3CTVw3JeB5QFdprmf2h76mMlDZPOBk/mxqqkFyzHZ
	 7S1f65hlEWFz0+6iwXSbV3CWxn7sDXpI0PPNecQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F339FF800E2;
	Mon,  1 Feb 2021 11:44:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A0EF80153; Mon,  1 Feb 2021 11:44:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04029F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04029F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="VoOhD1Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612176272;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=7bR4VDTmdyMmvzyvB2XHGtkNluwna6fZDl+hSGfgDl8=;
 b=VoOhD1TzrXLi+gyJSLmdge457QcJE7mB3mPDemxqiMy520c8vCb0gp7thvPR+gKMK/
 wz83mMtL/N8ECqlqStkn3QWt+UzpGJybOQUsvFIXIjckm0hV2+Mr94R5OVip+19DDBgo
 fjXIlRBLVvvJ5IS5a+Ob3UHQRkpO6e+i5u/sEdamGDnC+Yv2mz3yO3qoCbMKjEX3dOBP
 wgw4gNrPchnp9xGIgibdnPv3viKo+OE4FZeYVD77uBIRcw2DwzAct5fUNqmM2V2SNcGb
 pN81mZ/rf0zW7KstcEPcngDUQVoOvU8u5SxTCFgYbb40eZKEz4QTeZaqJfEKGojBJuMZ
 35CA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/DY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
 with ESMTPSA id j0a9bax11AiVGiL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 1 Feb 2021 11:44:31 +0100 (CET)
Date: Mon, 1 Feb 2021 11:44:25 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass: Fix i2s ctl register bit map
Message-ID: <YBfbiUi/paDDMz0I@gerhold.net>
References: <20210120024955.3911891-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120024955.3911891-1-jun.nie@linaro.org>
Cc: plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org
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

Hi Jun,

On Wed, Jan 20, 2021 at 10:49:55AM +0800, Jun Nie wrote:
> Fix bitwidth mapping in i2s ctl register per APQ8016 document.
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and
> dmactl registers")
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

It looks like you forgot to Cc the ASoC maintainer(s) here, especially
Mark Brown, which might be why this patch has not been applied yet.

Can you re-send this patch with all the maintainers in the Cc?
You can add the Reviewed-by: from me and Srinivas to your patch so
we don't need to send them again.

Thanks!
Stephan
