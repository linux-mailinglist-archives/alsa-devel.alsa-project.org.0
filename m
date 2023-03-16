Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E96BCFE2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 13:50:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87458111A;
	Thu, 16 Mar 2023 13:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87458111A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678971020;
	bh=2hIIa27J4OufttFD58aRpuD3JQNUHcSmgwP80p7hQDw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=er3AW1cotgKeitIIMwOD22xUAD0sQnzSed/LiyuIDornAZJqMDuob60jKABuvXG4Z
	 gbmOF0y/k5uVI3gE5et2Ex688lHfHsjXr1Y5o4z4A0X6JCy8vxDxlJjNoRKDBo12OX
	 u883ARjleoLstfvwLFQlCtMFT+5JT+LezoKQKF74=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C23B9F8032D;
	Thu, 16 Mar 2023 13:49:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51ADEF80423; Thu, 16 Mar 2023 13:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2D14F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 13:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D14F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZdGIneuW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A32D8B81FCA;
	Thu, 16 Mar 2023 12:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF12BC433EF;
	Thu, 16 Mar 2023 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678970962;
	bh=2hIIa27J4OufttFD58aRpuD3JQNUHcSmgwP80p7hQDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdGIneuWnom/b6edum2ICmxf9259ZsE/zcc1wnP4XX4bt94xlSUpUokRxEBTgpnYZ
	 dvlD06MCX34+PpBfnp7xcrc86g7kv3zVy09Gut1+RdEnEYmURFLNAdBU3QNFWN9zYi
	 PaWIinxcjc6N6f2VVRl7oCs5TGb54Om9vhaHJ7rE=
Date: Thu, 16 Mar 2023 13:49:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/7] drivers: misc: Add support for the Lantiq PEF2256
 framer
Message-ID: <ZBMQTxFsrKQesd4v@kroah.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316122741.577663-3-herve.codina@bootlin.com>
Message-ID-Hash: NHRY5IAWZNAEXE4D37UIVOQZXQ6Y2K5I
X-Message-ID-Hash: NHRY5IAWZNAEXE4D37UIVOQZXQ6Y2K5I
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHRY5IAWZNAEXE4D37UIVOQZXQ6Y2K5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 16, 2023 at 01:27:36PM +0100, Herve Codina wrote:
> +EXPORT_SYMBOL(pef2256_get_byphandle);

You have a mixture of EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() in the
same file here.  As this one:

> +
> +void pef2256_put(struct pef2256 *pef2256)
> +{
> +	put_device(pef2256->dev);
> +}
> +EXPORT_SYMBOL(pef2256_put);

Is just a wrapper around a EXPORT_SYMBOL_GPL() function, please revisit
and perhaps make them all EXPORT_SYMBOL_GPL() calls?

thanks,

greg k-h
