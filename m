Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E586520457
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBC51681;
	Mon,  9 May 2022 20:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBC51681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652120259;
	bh=0esjJrezivP9EYp59dd6OuPM+PGc8UvFALjMsvmFKsw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7QRrlvjrdu/eCtMQrQxrSLzKLuGc+/hgw6R1Ebh5c7m+ybh0pik24r24Dj6fBn74
	 0IPzSZBk7NRV8lJRUDVOKNmkY1pYrwyYH8HYEZeYnHkiz2OX/1OCvdbQp/Abskrxgx
	 cnFb5YVOh9ZQK0C2ZmFN/jOvp7Li7hwHixJgkrGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBEBF80269;
	Mon,  9 May 2022 20:16:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97DFAF8025D; Mon,  9 May 2022 20:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2279DF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2279DF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="mUh3KDx8"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id A1A081F43FBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652120196;
 bh=0esjJrezivP9EYp59dd6OuPM+PGc8UvFALjMsvmFKsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUh3KDx8N16l+rXRuTIRBtKHsGvmr01Muo2U74eUROqwiqIK9TdjItLT2iPA+pFdw
 ZfEWl/b+6xDzqzGV3Z6Ogh7UxvtzVCTDXt7fNxonKzjLDb4w4GmV+S//PNbGOkP2H0
 +ymJQljlQM1pjjU89yEWu9EMflqiwD7Q2U2oUuTaMDWYS+AtJm8okAb00IzpJD3uGx
 4ORjyRbtV1v6k8OoJ+iHNw8ZRI8gENXeoq1K2bTGTpIAIFzNkmYn9e6GH/dMxLCFLm
 KOQLwgDqJcID6J2UAyWB5UAvWDA12sWsTEb4JJmPOHXvBumyYeQLBjHIZEweYrUive
 9rJIooEZD9GfQ==
Date: Mon, 9 May 2022 14:16:29 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] Add missing dt-binding properties for audio
 components on mt8192-asurada
Message-ID: <20220509181629.ettskdxfvwvqaq76@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <165211666198.1065748.1151009730882312510.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <165211666198.1065748.1151009730882312510.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 shane.chien@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Mon, May 09, 2022 at 06:17:41PM +0100, Mark Brown wrote:
> On Fri, 29 Apr 2022 16:30:36 -0400, Nícolas F. R. A. Prado wrote:
> > These patches add properties that were missing on the dt-bindings of the
> > audio components used by mt8192-asurada. Namely the i2s-share
> > properties for the sound platform and the #sound-dai-cells on the
> > rt1015p and rt5682 codecs when they're referenced by the machine sound
> > node.
> > 
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share properties
>       commit: e056cf4341ae3f856f1e38da02b27cb04de4c69b
> [2/3] ASoC: dt-bindings: rt1015p: Add #sound-dai-cells
>       commit: 2f45536587e53a7a22024e12fbe97ef13598e623
> [3/3] ASoC: dt-bindings: rt5682: Add #sound-dai-cells
>       commit: 0adccaf1eac91a2c2ee6a54a6de042affe9860f4

Hi Mark,

this series wasn't supposed to be merged yet, I'm in the process of preparing
and sending a v2. Well, for patch 1 at least, which needs some improvements
still. Patches 2 and 3 weren't going to be changed, so those would be fine to
keep merged if you want. 

Thanks,
Nícolas
