Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 775DE4F4BA8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 03:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD7B1760;
	Wed,  6 Apr 2022 03:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD7B1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649207158;
	bh=ZRlRd3gKnPMwhHGABcPERiIMz82HdvfvZFULEH0uKeU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gnW98luTKAXZaml7w4+hTMfXYihrbqUpPWQMFTeQ131AJ/PmBh/n37rtdIc8i+haB
	 /pz+TvEa/YpVUdat5SfzQutF63tNZkl5MTKNDedrBcV2AaNVQx9uOrjOUdcRfRhufC
	 g8AIvZC+DLRCWDntEl15UAr+gT37S5OnbJTGAFcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9F6F800D1;
	Wed,  6 Apr 2022 03:05:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F3A6F8016A; Wed,  6 Apr 2022 03:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6176F800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 03:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6176F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m3QUpTq3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C22BB8201E;
 Wed,  6 Apr 2022 01:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEA8C385A1;
 Wed,  6 Apr 2022 01:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649207089;
 bh=ZRlRd3gKnPMwhHGABcPERiIMz82HdvfvZFULEH0uKeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3QUpTq3qLgqgS+okjKB46lmEkQN5K2jrohyioql6n3wK0PaAYfURRz90lv2Jigui
 It7xoI18022b6ndfbDYzk3sOmWLLbwPnvCOrk3P+4YXj48666dLILFHnX9lb49kdJl
 35fnsDWO/AeR69LIyWTIHrgucqpestGuJO3h9H2om6d87AWd+dgjIJ9I8WU9c7k5va
 SO8PGrnXZLwKjEzpQ4g1Pb5+tW6c6CZstX3EbBqXgmD6Io6ZQqEOKnEybcSc1qn3pg
 18y8D2iICLlsqx9F3lFwwiqflmVWdxQcBGXHYqx3DZd+NUszTfOKZa2WwAphykzAQr
 84rTT0ERDFImw==
Date: Wed, 6 Apr 2022 09:04:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Message-ID: <20220406010442.GB129381@dragon>
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski@canonical.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 michael@amarulasolutions.com, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Mar 23, 2022 at 10:56:01AM -0300, Ariel D'Alessandro wrote:
> BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
> tlv320aic31xx family codec.
> 
> The audio card exposes two playback devices, one of them using the EASRC
> (Enhanced Asynchronous Sample Rate Converter) module. Note that this
> would require SDMA and EASRC firmware in order to work.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Applied, thanks!
