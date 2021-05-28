Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D9394213
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 13:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 597FA16E1;
	Fri, 28 May 2021 13:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 597FA16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622202141;
	bh=IIG/SqlnGSo8/uH79gVe6ILIAwTS0svT8pIkcWZfnos=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gp2I8lQBWUMM3FODmTuf77CvSnMO8SiO0DU0e4W8TUlbnug/SBzFNT0CVpESa8elv
	 Xn0XZ4DwDnsYUAqmYoE9bg2+q9DDOyva+7BmCfHhRhIg+HS8OqTSMgJ1f2T/JgDIbn
	 zcAqQLOJWna0vo6yFryAn4MJqkSYMovQf24Y6gv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A427CF804AD;
	Fri, 28 May 2021 13:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E94CEF804AC; Fri, 28 May 2021 13:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86EA7F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 13:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86EA7F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="f+7LYe/4"
ARC-Seal: i=1; a=rsa-sha256; t=1622202043; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=iKtHjZ/rofYuairfVqHRAd4Wg7JbXco3Cm/ai/WlXJ2otA5KCVxugkLGGc9+E6j/9u
 RWXUWl1TlMM3jlf6LjpAe9a2VM1O3qOBTQjdvQs4SUq/cUq3ZroWD4brdTOrZZRpfZR6
 SWNXNYPar19BI3dfkUU6SgVJcTFsF7mc4LbM4wIFoZ1Q7hMHRoFGbbXeFHybB0F670sV
 y68wi6Dr3vi0sqp/sQgfonkzZyLwrw5rOjC97QDEIfVlZXa3AsBrydkZCQRjs+He3WTh
 LVEgRV5vEO4hoOlI28XvpwnwEnHtcpwZRHkr20X0sgQEn45fF5Fo+uUxXfYq5F7AR6ab
 jtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202043;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=fv9ibB0sf+3bWaxRtLUVQh+LAQVhcvJ61+bnxcNARI0=;
 b=M4/IDH3Zs3jZsL1pedVlWNN1kc3F6HfoWjFs8948vpaHb73OJcgcrFYyWtqdi3Kk0H
 rodYl4zU0PiMn/lSAVfzwyxFdBOjlaRNwJLL8cDe+QRL1b7EvFXpSPpNCTTLThOdBMlU
 Zm9R9+6XcYp6JKIXNoR3FZcUm9SvJ+ulYlziEH3hGnrI2Gp8jXtIcZvegmjI1vEZteqB
 WwL2cYuyUq/VFzdQDkBBCXasQwMgJ3cxx5NtaoPDqbV9TbirsRA8DewV4v9KS+WwK5+I
 ksehurSB+u6VFklM5uDi1dR/SxJkqle3JV2kfMhkmQnG5gOfzmeuIB4nAsM+RZQYS/jG
 VAKw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202043;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=fv9ibB0sf+3bWaxRtLUVQh+LAQVhcvJ61+bnxcNARI0=;
 b=f+7LYe/4CP15pC9erHlhpmP0giYpKtUDRceqOcaAWWe0EFiJUdvvoQ4JAVW9mYg5rj
 mk5XGQKbiYhO98vPS9PjtlKVYqciiWWm9x3771OeTazE7Lm06iR5DX/lhZU/AsOgY0Xs
 sUF8OdLTt7jrp2RgVEibGlLqhtyqC02UhfglxuBfKWOK2suxD3aebHvLVPhqeqXpzgV3
 SP9w+MaZtZ5MrCprNlmQOgrQl7jmGlCXpLcTDfC2sj6KxTTgu9/gxMUHYZErbtHJWA7c
 sZx+WDY9UAkJOQhgr/1wOm1cMfmYW2CLbjob+ddizDkX9ZlLH20uhkZBsy7hhn2s1QFF
 irDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
 with ESMTPSA id U0b2c9x4SBeg626
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 May 2021 13:40:42 +0200 (CEST)
Date: Fri, 28 May 2021 13:40:35 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: nxp,tfa989x: Add tfa9897 support
Message-ID: <YLDWs2iz2CWbznkA@gerhold.net>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528105101.508254-1-vincent.knecht@mailoo.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
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

On Fri, May 28, 2021 at 12:50:58PM +0200, Vincent Knecht wrote:
> Document TFA9897 bindings.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> ---
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> index 45db5776550c..46ddc1f3fc0c 100644
> --- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - nxp,tfa9895
> +      - nxp,tfa9897
>  
>    reg:
>      maxItems: 1
> -- 
> 2.31.1
> 
> 
> 
