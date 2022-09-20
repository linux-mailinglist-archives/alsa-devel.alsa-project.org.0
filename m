Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3265BE74D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294ED886;
	Tue, 20 Sep 2022 15:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294ED886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663681239;
	bh=S9U9WtQXmz4u+HuV8nEv4h9zWNv3NIC7PqUlm/P6jX4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bBWCAN8kZXM90pja5MqNhxIYLLdoDVwqRQeutkUQ5xRFMtSCc2YqgU2reCXk0Kpmk
	 AFoZWiRdZuYIMNoTL0TXRg2ZxtAbx7Ua4xKDSNSQsBV68NspZ2qdRkVIwEQiB56RPW
	 1XUL24gls5c9m9lRizO+EcnSy6ljlXHDmecwL4FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DE7F801D5;
	Tue, 20 Sep 2022 15:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D440AF8012B; Tue, 20 Sep 2022 15:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48CFCF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48CFCF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="RZSS9O3G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=3pIjUlJA919B9lQ4aUcTZDjl/ToQpR3Iu1q2qExlc+0=; b=RZSS9O3GRyd5jXE3KqsVzp/6ja
 w4m8lGQbeA2elwVVGEM4FwtLGj41wsYTWJU01DB3/dGo7oz+mIiJ307vyc0rZZf6FUXW6nV/IK3ih
 pWNCaYVxkQanbkWV34A7U42jndu60DeFADkyspOOmRFIy0w+IJ1b7pPZ9aKgoBWH4Ouk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oadT4-00HH5w-0s; Tue, 20 Sep 2022 15:39:18 +0200
Date: Tue, 20 Sep 2022 15:39:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: kirkwood: enable Kirkwood driver for Armada
 38x platforms
Message-ID: <YynChnIJe3SZUUW5@lunn.ch>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920132648.2008-2-pali@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

> +	if (of_device_is_compatible(np, "marvell,armada-380-audio")) {
> +		err = armada_38x_i2s_init_quirk(pdev, priv, soc_dai);
> +		/* Set initial pll frequency */
> +		if (priv->pll_config)
> +			armada_38x_set_pll(priv->pll_config, 44100);
> +		if (err < 0)
> +			return err;

A nitpick: It would be better to do the test for err before calling
armada_38x_set_pll(), and then there is no need for the NULL check.

      Andrew
