Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53651ADC99
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 13:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465821663;
	Fri, 17 Apr 2020 13:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465821663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587124675;
	bh=YuE3Ip9k8tEgEerJuZa5XVgrgjhme/xQBUVEpvc0pEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPfdNRtNfT9+zLWtD5ipUo0/u5hZqqP0x4Zh02dSyyL6EWhoGmV+oqJXG/JQ+OKAg
	 /kvDTMkefNQyTkMla5KSmNV0EaYP7NLBr7PBjKx7EJtivl75uDl/ErXraUt3/zcq76
	 2CsK8NnDQ8Z+MDQPKYPq2B/8WBDueHfJwfKNULzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6467AF8025F;
	Fri, 17 Apr 2020 13:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D883EF80245; Fri, 17 Apr 2020 13:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD39F800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 13:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD39F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pnpOPVBd"
Received: from localhost (unknown [223.235.195.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FB722078E;
 Fri, 17 Apr 2020 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587124566;
 bh=YuE3Ip9k8tEgEerJuZa5XVgrgjhme/xQBUVEpvc0pEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pnpOPVBdQcqTXLGxlZCLH3MbjROORZwPIvhJGNOVYJO1Bq1fdweZ4Tzj262yzPTHr
 I7zopQnTuiYTCa08aZQp0jGiX3jNauRKVzXXPyUGGswbXRaXICoWVVYU28Uj9O09X9
 MaG2vLlDwtoYhIDwtbmtvOJveCIM6jN5WnC7U+Vw=
Date: Fri, 17 Apr 2020 17:26:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 2/6] dma: Fix misspelling of "Analog Devices"
Message-ID: <20200417115602.GO72691@vkoul-mobl>
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416103058.15269-3-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jiri Kosina <trivial@kernel.org>,
 Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On 16-04-20, 12:30, Geert Uytterhoeven wrote:
> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".

Applied after updating the subsystem name, thanks

-- 
~Vinod
