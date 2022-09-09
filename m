Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACA5B3DC1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 19:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD141688;
	Fri,  9 Sep 2022 19:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD141688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662743566;
	bh=eBvCTBpjWiHUubp+Rdm/HEOVL94+yLHs4HcGNForHMI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PEsmSGRBe7j731K6a3N51HRhy6mG6H38ZfG6Yj3+HQwUcB31C+wxk9zt551Z5VR6T
	 +fEwwH5Kzj6nQAUxwoWjHyHAekL19hkMipxlaFw6YRj1/r25/oVONTyAMkTDY6tn0G
	 nalxDsvjRXgRGHDIE2o9vAjZ0cmFghxBwubpNilc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0B8F8032B;
	Fri,  9 Sep 2022 19:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB64F8016C; Fri,  9 Sep 2022 19:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A116EF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 19:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A116EF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="czkgcDme"
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D87C240002;
 Fri,  9 Sep 2022 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662743497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzTczB6munZOD4DwLGAw/A7taonsXXSbVs8d7tpSJ3M=;
 b=czkgcDmevNYuTr84omI64YQ7bf32DFyD3vn9t5gdj9ru9e9w3lYITFnCP81FR2oWOiIGcV
 90THyh7b8kJx7inMaW213VE8lE3bsvtuAktpMsIgl5iWB2KGweR/DZwgzzEEGioTjG3Bc4
 bMYCCaSCIgNncZ0bAbv9wTcKF5QnHtBRSjnDUtm2Y/j6Za9Rm+XMC97wtkGhplR7ufE+uF
 8xf40iVDGPzxYQVrNxJTvY9Wh8N1VsudkoYasIXba+j6YvZ7DaTf5aFtwgmWqPfYWMnE6o
 eIbP+4Y/E1GJ4ct9jDDmsphv8IzVtnkfFQWtFYelErFspv2kVc5nytaKcZP8sg==
Date: Fri, 9 Sep 2022 19:11:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Message-ID: <20220909191132.6920ba09@booty>
In-Reply-To: <YxoX+G5OFVDTX7s3@sirena.org.uk>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
 <YxoX+G5OFVDTX7s3@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
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

Hello Mark,

On Thu, 8 Sep 2022 17:27:36 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Wed, Sep 07, 2022 at 04:21:23PM +0200, luca.ceresoli@bootlin.com wrote:

Thank you for taking the time to review my patch in such detail! This
is my first contribution to ALSA, and it was not clear to me which
parts of the existing vendor driver needed even more cleanups than I
have already done. I will probably get back to you with specific
questions later on, while addressing your comments.

Best regards,
Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
