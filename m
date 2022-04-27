Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E451188A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D22561779;
	Wed, 27 Apr 2022 15:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D22561779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651067626;
	bh=6rJ5R+bAMoujECChboIB8YjNH/WySD/JHD3K4qDfQrY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyq6D/wZODpP7uZ3h2LzLKbgL6k/4Ueh3eB9U9dizv1cbYGWMfLujBtEHpwGph4R9
	 4djjLRm4s3FOjFOah4uHbuNNCyF2De84AFWtvyCbq5t151wIHg5uBjr6zIhS3KGOFi
	 ckfAjl4S46XBlxpIEkQlVXUYsiyFgRF/TmJJSaWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB1AF80253;
	Wed, 27 Apr 2022 15:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93665F8016E; Wed, 27 Apr 2022 15:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 69974F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69974F800AE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5CDEED1;
 Wed, 27 Apr 2022 06:52:37 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABDA43F5A1;
 Wed, 27 Apr 2022 06:52:36 -0700 (PDT)
Date: Wed, 27 Apr 2022 14:52:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Message-ID: <20220427145234.3b33a5a4@donnerap.cambridge.arm.com>
In-Reply-To: <YmlF1JlIvY0lTaAD@sirena.org.uk>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
 <YmlF1JlIvY0lTaAD@sirena.org.uk>
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

On Wed, 27 Apr 2022 14:32:04 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Apr 27, 2022 at 12:25:21PM +0100, Andre Przywara wrote:
> 
> > The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
> > a peripheral that provides communication with an audio CODEC.  
> 
> This is a standalone sound device, you should submit this to the main
> ALSA maintainers.

You mean Jaroslav and Takashi? get_maintainers.pl just returned yours and
Liam's name, plus alsa-devel, because sound/arm/aaci.c is not touched.
But I can of course forward the patch to them.

Cheers,
Andre
