Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E203C511865
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752F0175F;
	Wed, 27 Apr 2022 15:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752F0175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651066496;
	bh=GQft7nX1UtigzEOiToPIMgQR/+9GdKWt+4unmWLc7Nk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbIOIW9qECVPpa6LklFMfc95T/oZ1rb9n/2AxrjXGez7VaJ+CKd/4FXjzhfM1VtDQ
	 xYWRYI49TOmt5vuvckIr4Je31+MmeRTap7ma+pV0e+RDV1ArdqrbtQYDdmFKiUENEA
	 olXX09/0xthhEsPh4pZnQ2gOhY19OVfQE/kKJHUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271F4F80155;
	Wed, 27 Apr 2022 15:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C803F80253; Wed, 27 Apr 2022 15:33:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 68FCEF80155
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68FCEF80155
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F38DED1;
 Wed, 27 Apr 2022 06:33:50 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F16D53F5A1;
 Wed, 27 Apr 2022 06:33:48 -0700 (PDT)
Date: Wed, 27 Apr 2022 14:33:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Message-ID: <20220427143345.73d81a91@donnerap.cambridge.arm.com>
In-Reply-To: <Ymkr8dFjbzEonXOO@sirena.org.uk>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
 <Ymkr8dFjbzEonXOO@sirena.org.uk>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, 27 Apr 2022 12:41:37 +0100
Mark Brown <broonie@kernel.org> wrote:

Hi Mark,

> On Wed, Apr 27, 2022 at 12:25:21PM +0100, Andre Przywara wrote:
> > The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
> > a peripheral that provides communication with an audio CODEC.  
> 
> I've got this one individual patch.  What's the story with depenedencies
> and cross tree work?

Sorry, I didn't want to bother you with all the other totally unrelated DT
bindings conversions, as this is the only sound related binding, and it's
self-contained. Also it's just a *binding* *conversion*, so probably only
mildly interesting from a kernel and code perspective.
I was assuming that Rob usually takes those binding patches, or do they go
through the affected subsystem tree?
As mentioned, this patch stands on its own, and there are no
dependencies, so it should be fine either way.
Anyway, this is the whole series, if you are interested:
https://lore.kernel.org/linux-arm-kernel/20220427112528.4097815-1-andre.przywara@arm.com/

Cheers,
Andre
