Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A28682B12
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 12:03:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBD4820;
	Tue, 31 Jan 2023 12:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBD4820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675162994;
	bh=bRqEfY10DI/ElKGgak14w3PjLKkH8pmgrhnheNwGgN4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=djQeXXTLMvXU9+GL5DT1Fp7mu04Rz3PlPem4gUOI9+7ufyRWrZtVf19DfPysVdFV6
	 okfjDC8NN7FbS5O3aBmg+LEqAE2XVkevdVmV1WA4eHu2TKFbW+xoU3vmKohoYpDSdS
	 pzeSbGSlovrWak+Gn4eg1OWlyE6U/f/x3MRKWgD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D768F804C2;
	Tue, 31 Jan 2023 12:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9BAF804C2; Tue, 31 Jan 2023 12:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEAEF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 12:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEAEF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n7zpcfwa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF590614AC;
 Tue, 31 Jan 2023 11:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB567C4339C;
 Tue, 31 Jan 2023 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675162928;
 bh=bRqEfY10DI/ElKGgak14w3PjLKkH8pmgrhnheNwGgN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7zpcfwadDkHKiNV5OrUEOKg6NEgMt/0LZUzqLffFMVlYaRROJJOyfuKkyNSvjqlf
 YWAYmgUgYN3cWvQUtJVphPaknR8sKy3Teghj19R9O8EcNxYVf85MSwoRKC5GfOFcDk
 lHgKCSz2hYTWuErEMWuo8ScdqVR76q82YY5bUyUeRPOd+QoF+Os8PuTooLzTi3bt4j
 nQrXHk5DyxbRieRLp1yfBbfAdzy1R4gHaL51ShopJhO2qxkXYTXrOc8jlKHgYPCtJ+
 /uADFWgkv/CqFEPWNTzOe/8HccTC63ldz0e5F8r+x71ERRz7D159QE4E3F/qpJgpnn
 Jv8Dcd90U7pGg==
Date: Tue, 31 Jan 2023 16:32:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/8] soundwire: stream: Add specific prep/deprep
 commands to port_prep callback
Message-ID: <Y9j1LNjmHxex/HLy@matsya>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127165111.3010960-2-sbinding@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27-01-23, 16:51, Stefan Binding wrote:
> Currently, port_prep callback only has commands for PRE_PREP, PREP,
> and POST_PREP, which doesn't directly say whether this is for a
> prepare or deprepare call. Extend the command list enum to say
> whether the call is for prepare or deprepare aswell.
> 
> Also remove SDW_OPS_PORT_PREP from sdw_port_prep_ops as this is unused,
> and update this enum to be simpler and more consistent with enum
> sdw_clk_stop_type.
> 
> Note: Currently, the only users of SDW_OPS_PORT_POST_PREP are codec
> drivers sound/soc/codecs/wsa881x.c and sound/soc/codecs/wsa883x.c, both
> of which seem to assume that POST_PREP only occurs after a prepare,
> even though it would also have occurred after a deprepare. Since it
> doesn't make sense to mark the port prepared after a deprepare, changing
> the enum to separate PORT_DEPREP from PORT_PREP should make the check
> for PORT_PREP in those drivers be more logical.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
