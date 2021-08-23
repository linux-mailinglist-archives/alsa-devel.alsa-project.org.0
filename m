Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B803F5164
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 21:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F06985D;
	Mon, 23 Aug 2021 21:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F06985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629747627;
	bh=SqRIrYdnmF+39rlh/5Zzf3+jCAnIS9B9XKxsYHdCU5E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CK56gTxcTO4j7HY3Op4LxHgOAj2rubZB7B/I4JSAUzidlkckQtk2fAWtmEHW4qOD7
	 ZXmBDC4qBMD1U7Ht7d43IWE1JGYwxQEW7wj0SbQyj/OYrBzDp0OzXgg7Eg+WO66YtD
	 qWwXCujF1+Jo/fvmM2NdshqJzhoc9l67CWNsP0bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 024D8F8020C;
	Mon, 23 Aug 2021 21:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A24F8020D; Mon, 23 Aug 2021 21:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D43BF800AE
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 21:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D43BF800AE
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id bdb2ead6-0449-11ec-b37b-0050568c148b;
 Mon, 23 Aug 2021 19:38:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D09FA194B1F;
 Mon, 23 Aug 2021 21:39:12 +0200 (CEST)
Date: Mon, 23 Aug 2021 21:38:56 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Message-ID: <YSP5UGRATAjuRteM@ravnborg.org>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dillon Min <dillon.minfei@gmail.com>
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

Hi Mark,

On Mon, Aug 23, 2021 at 06:37:55PM +0100, Mark Brown wrote:
> On Thu, 19 Aug 2021 12:10:19 +0200, Krzysztof Kozlowski wrote:
> > Correct indentation warning:
> >   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [2/2] dt-bindings: sound: rt1015p: correct indentation
>       commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

I am confused here.
Did you apply both patches or only the one touching sound?

I will pick up the panel patch otherwise.

	Sam
