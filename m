Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCE7C7811
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 22:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DDF826;
	Thu, 12 Oct 2023 22:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DDF826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697143728;
	bh=aRI71YpV2+d2IfU0eZ+HabZAmiGR+yyp2A4+ZTsQCm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCRX0PFXuO+NC1s+xfAUUfeYumnKxS0H5/ADajUC+EuJ9g4rkFatBSFqR75cHn/6O
	 R/uPDtVXU4tIeIqennU0+wVa3mSv8bMZd6FMAeXdZo/yJiwuPG1qi1mhs1w9/MxvDE
	 4XspDCJFdx0n0a654s3Fde/CLZc1wsx5A2xQKySA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0CF2F802BE; Thu, 12 Oct 2023 22:47:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF4FF8027B;
	Thu, 12 Oct 2023 22:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D219F802BE; Thu, 12 Oct 2023 22:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81173F8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 22:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81173F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jwW6XONp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0DE7AB8270F;
	Thu, 12 Oct 2023 20:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D11C433C7;
	Thu, 12 Oct 2023 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143662;
	bh=aRI71YpV2+d2IfU0eZ+HabZAmiGR+yyp2A4+ZTsQCm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwW6XONp9+IMeAdLC1MyMWFkTL/L1Hr+ur2t+B5NP0UUDc9ONKaqHTzvv0oxqvS9/
	 /jXz/mBCECQ846jut7nzwMpEVmoV4xcaSarxfTXPF9zQUCeLVeXpWbQSGeWElukxpH
	 hmK9Xu879p9WIcxTglg170fsF1NK+WWmRk+1etdS2+gsznWZdx4SghDduB8FUkFTTI
	 D5aLPEDFrX/Ew+4GELA8rAyIl0CXXsS9jBSxEzf4TvcKz0L3tTGLy3DfL+c4iBoH8Y
	 V9I7A1mtfNwuYaOTFpgho6RY5aglBHpgGTC2DZO9Cw9eDAHayKrqnTF0tLqIkf0Fdz
	 OpimIrub0090Q==
Received: (nullmailer pid 1712886 invoked by uid 1000);
	Thu, 12 Oct 2023 20:47:39 -0000
Date: Thu, 12 Oct 2023 15:47:39 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List DAPM
 endpoints ignoring system suspend
Message-ID: <20231012204739.GA1706264-robh@kernel.org>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
 <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
Message-ID-Hash: EUSZ6XTDSMWVV3P6KLFJV6XUD5XQYP2B
X-Message-ID-Hash: EUSZ6XTDSMWVV3P6KLFJV6XUD5XQYP2B
X-MailFrom: rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUSZ6XTDSMWVV3P6KLFJV6XUD5XQYP2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 11, 2023 at 10:21:33PM +0100, Mark Brown wrote:
> On Wed, Oct 11, 2023 at 07:47:58PM +0800, Chancel Liu wrote:
> 
> > +  lpa-widgets:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of DAPM endpoints which mark paths between these endpoints should
> > +      not be disabled when system enters in suspend state. LPA means low power
> > +      audio case. For example on asymmetric multiprocessor, there are Cortex-A
> 
> I suspect that the DT maintainers would prefer that this description be
> workshopped a bit to remove the Linux specifics.

And Cortex A/M specifics if this is a common binding.


>  I think the key thing
> here is that these are endpoints that can be active over suspend of the
> main application processor that the current operating system is running
> (system DT stuff is an interesting corner case here...), and the example
> is probably a bit specific.  Other bindings use "audio sound widgets"
> rather than "DAPM widgets".
> 
> We also shouldn't see that these endpoints "should not be disabled"
> since that implies that they should be left on even if they aren't
> active which isn't quite the case, instead it's that we can continue
> playing an audio stream through them in suspend.

This seems like one of those things that everyone has/does, and everyone 
handles it a bit differently. I applaud trying to do something common, 
but it isn't really common until we have multiple users.

Rob
