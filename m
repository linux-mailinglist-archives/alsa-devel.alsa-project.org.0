Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41537A31F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7DB1742;
	Tue, 11 May 2021 11:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7DB1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724344;
	bh=8ETFwSjmDt2Y1j+GkOW9Fsflzw10+NNdF0YzCalfN2M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWzSaRNhURK15HEX9XNT4e6DrJfl1NWge06q1C4XZhul8TCiRB1AseCthKGMjG9c9
	 pOwL43GUOlWUj8BidmST23YmZhTA74efjbnZ6IL7Ndb9rEVcrTYeAbomXfqlvz6YBB
	 CutcufHgnAI0JjgfMvNa3dY09KwKxnMrbC6nlxcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FECEF804CF;
	Tue, 11 May 2021 11:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFA1F80163; Tue, 11 May 2021 07:30:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 019EAF8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 019EAF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eHO11uYV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24396616EA;
 Tue, 11 May 2021 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620710980;
 bh=8ETFwSjmDt2Y1j+GkOW9Fsflzw10+NNdF0YzCalfN2M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eHO11uYVnlwsFWdw+jd1OuHjTY/Cy8ovEf32Z9e5fCtEWNOCTuMwPegXjA4/0+TuR
 GgaOlIEKAOaymZ8/jaGDJG+TOJNx9+w5YMp0tuXZltgNDmMIslQwERqkDj1vYrTPgm
 DHXnkbjU7O6aeeTYEc36sZWQuShZ9y90CDQx6dxgHHTPyLCynuO5MMiaHfVTp8SAGY
 UCHerWaHHQy/6LwLfYhHLJN6jlEPM4EBS534USL4AP/MJvZy0PBGQ0TdxSjYjcX0bq
 ZZ0pVbbD8w4Xbr9gtZhs/mmpL0dZ9EfgKn3TB8Dn48R3Fl7S056Y7bwwQnrvXGAOBD
 pJ29ACdd5vXEA==
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210510204524.617390-1-robh@kernel.org>
From: Georgi Djakov <djakov@kernel.org>
Message-ID: <be0c7cef-ed94-1178-8b06-ac57175fc638@kernel.org>
Date: Tue, 11 May 2021 08:29:36 +0300
MIME-Version: 1.0
In-Reply-To: <20210510204524.617390-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 11 May 2021 11:08:23 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On 5/10/21 23:45, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. A few new ones slipped in and
> *-names was missed in the last clean-up pass. Drop all the unnecessary
> type references in the tree.
> 
> A meta-schema update to catch these is pending.

Acked-by: Georgi Djakov <djakov@kernel.org>
