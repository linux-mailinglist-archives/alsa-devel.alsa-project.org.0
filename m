Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01183874213
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 22:36:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE743E7;
	Wed,  6 Mar 2024 22:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE743E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709760973;
	bh=v3pB09c9hUwQJPj+uWy8bW/89Uoz9ktob+2XRAtRAT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrwDqYGH8/RBSQIsAxx+rTWoHerH9VYO1A94Amf2gvuMCI9YVVnSrrjCfFxm+I2NL
	 GWnOPTEUWFKtzF6v3B13/vPe0iVP+nD7zkmUB/6qJJl2QIjwTUO/nyOPnzcjwNP2cp
	 Xg10FtbTUEIkTID/a3ipwpStKdoSh+R+N6mS/ZDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 457D9F805AA; Wed,  6 Mar 2024 22:35:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46722F80587;
	Wed,  6 Mar 2024 22:35:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEFADF8024E; Wed,  6 Mar 2024 22:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48BE7F8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 22:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BE7F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l0eqKC6x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96963CE2357;
	Wed,  6 Mar 2024 21:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A99C433C7;
	Wed,  6 Mar 2024 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709760922;
	bh=v3pB09c9hUwQJPj+uWy8bW/89Uoz9ktob+2XRAtRAT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0eqKC6xjXVqkBoIiYhxS++3waY6YjEPT2AOIALgqKNgpUZYH0PUKDcYEklPTWHWJ
	 osDfqIfE9ByepPwJP2oyfcagyAoJZT/mSWk+KOZ8XzpZalCi/A81EV2GVxnCxoyJAP
	 cQsrZY0euOp0a+4IOlItQ383Yho+98g8nTadpHbj0Bhd/pPlMs4OO9i14WLvZGIFgJ
	 /nWpypABzc/uXUKkCOQQsR0fbBfj6DiquXwKIUucSJmppaezWy+mSoPMr9/HIGNBW4
	 N+E87L3iPPRKtdms2VD5Sj0X3MkNo4Wq/hAYV9t+siUO1Qk6GCGTfIO/73s7EsFgzT
	 4ruaihdF3p/oQ==
Date: Wed, 6 Mar 2024 15:35:20 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH v1 2/2] ASoC: codecs: ES8326: change support for ES8326
Message-ID: <20240306213520.GA713664-robh@kernel.org>
References: <20240306013414.18708-1-zhangyi@everest-semi.com>
 <20240306013414.18708-3-zhangyi@everest-semi.com>
 <bf4651f8-279c-429a-8337-2211ce0b89ed@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf4651f8-279c-429a-8337-2211ce0b89ed@sirena.org.uk>
Message-ID-Hash: EKJANQDY3DGV3REDCVI4AEBCNU3P7T2O
X-Message-ID-Hash: EKJANQDY3DGV3REDCVI4AEBCNU3P7T2O
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKJANQDY3DGV3REDCVI4AEBCNU3P7T2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 06, 2024 at 12:36:50PM +0000, Mark Brown wrote:
> On Wed, Mar 06, 2024 at 09:34:14AM +0800, Zhang Yi wrote:
> > Removed mic1-src and mic2-src. and changed default value
> > of interrupt-clk
> 
> We could do with a better changelog here.
> 
> > -  everest,mic1-src:
> > -    $ref: /schemas/types.yaml#/definitions/uint8
> > -    description:
> > -      the value of reg 2A when headset plugged.
> > -    minimum: 0x00
> > -    maximum: 0x77
> > -    default: 0x22
> > -
> > -  everest,mic2-src:
> > -    $ref: /schemas/types.yaml#/definitions/uint8
> > -    description:
> > -      the value of reg 2A when headset unplugged.
> > -    minimum: 0x00
> > -    maximum: 0x77
> > -    default: 0x44
> 
> This will make any DTs using the properties instantly buggy.  I believe
> there's a way of marking properties as deprecated, you should use that
> instead.  Or we could just leave the properties there and ignore them at
> runtime.

'deprecated: true' is the way.

Rob
