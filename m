Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F0407927
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Sep 2021 17:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A461E165E;
	Sat, 11 Sep 2021 17:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A461E165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631374945;
	bh=Hsy+loYT7VzpYbA4E5opp4kgR5qEfGD2+sH78/yYoyg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pX4vYq4plPgpbip0OFORBLwaBky2fJkZ4LJlLlZA+FSt4XQYxUAkObiwW1WkHnjB5
	 RYAZ2zWOiozXpyuZcbnnuQMjvN4WyZetro76T3ABUJyDA5vrfGUEkeUbpdaiX0hVXe
	 UjjIqNjS/KvW4bnHjqGUvwfMAT0bysJFgZBf3Nso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2222EF80217;
	Sat, 11 Sep 2021 17:41:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D7DF80224; Sat, 11 Sep 2021 17:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAEFFF800AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Sep 2021 17:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAEFFF800AE
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1D8161205;
 Sat, 11 Sep 2021 15:40:56 +0000 (UTC)
Date: Sat, 11 Sep 2021 16:44:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 0/7] add internal channels support
Message-ID: <20210911164428.023953c4@jic23-huawei>
In-Reply-To: <20210908155452.25458-1-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 8 Sep 2021 17:54:45 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> This patchset adds support of ADC2 internal channels VDDCORE, VREFINT and VBAT
> on STM32MP15x SoCs. The generic IIO channel bindings is also introduced here
> to provide this feature. The legacy channel binding is kept for backward compatibility.

Before I actually look at the patch, general naming comment.
Please make sure that the driver / device name appears in the cover letter title
and all the patches.  It makes it much easier for people to find the code relevant
to them.

Thank,

Jonathan

> 
> Olivier Moysan (7):
>   dt-bindings: iio: adc: add generic channel binding
>   dt-bindings: iio: adc: add nvmem support for vrefint internal channel
>   iio: adc stm32-adc: split channel init into several routines
>   iio: adc: stm32-adc: add support of generic channels binding
>   iio: adc: stm32-adc: add support of internal channels
>   iio: adc: stm32-adc: add vrefint calibration support
>   iio: adc: stm32-adc: use generic binding for sample-time
> 
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 108 ++++-
>  drivers/iio/adc/stm32-adc-core.h              |   8 +
>  drivers/iio/adc/stm32-adc.c                   | 418 ++++++++++++++++--
>  3 files changed, 482 insertions(+), 52 deletions(-)
> 

