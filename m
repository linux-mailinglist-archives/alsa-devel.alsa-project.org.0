Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4B63622F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E13166F;
	Wed, 23 Nov 2022 15:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E13166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669214781;
	bh=JjSRB1gRJ3pgoS9q4CAE6iiJArcPdfzpnU5eRwNhnY0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRKJ5g62akI58DygJ7WFArBr86/CptYONdsFcHnkAxijQqVG9hh/PFjWiJ9Z4zMaP
	 gXyDZNBU0Qzcb8RA1+pYFM6cElTd8qcBIWIpQZXqHB8mGtQcDahJVMvt7ZQQyVCwxt
	 Thmya5y0jWGJrn8Opvudz1UH54aROxqeknHFKzTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F18BF800BB;
	Wed, 23 Nov 2022 15:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED7D1F8030F; Wed, 23 Nov 2022 15:45:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C550EF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C550EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vFfHdSRc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E01AB8205D;
 Wed, 23 Nov 2022 14:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DACC4314A;
 Wed, 23 Nov 2022 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669214719;
 bh=JjSRB1gRJ3pgoS9q4CAE6iiJArcPdfzpnU5eRwNhnY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vFfHdSRcWdQzPkB2cwZ3QHOx5vyC+jyRcAlJhCs1xBSFFdYViT426ZCJEFG2lb0rh
 puV00JR7xpH20dik1qJAwNT0ox5qVr13YiXOLHX7E5zVH0xNCfsOmksSaY+jy+2nvv
 CQaYDuLY6dnlAKdqu6AWNN7IVO31siNVSuejQ+/+rUmTEQHqAlS3d8IY1tgpF0Af3i
 +pAW69V3i8YWA/PEu25VNL/GiMXYcnyVG1qCzuMKAg8eWxl2Kj+aZ5N8c/U3QLTT7J
 pYTB7JO0XZoJA+rSUmou3cAFUZbJAGBjAkfZK58ZpVWLm6iM6DdqJW1WX6d/ttGqJy
 MVrz3OrpfZlGA==
Date: Wed, 23 Nov 2022 20:15:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: intel_init: remove useless interrupt
 enablement in interrupt thread
Message-ID: <Y34x+0VqQsjaIjoA@matsya>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
 <20221111042653.45520-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111042653.45520-2-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org, bard.liao@intel.com
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

On 11-11-22, 12:26, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> When the code reaches the SoundWire interrupt thread handling, the
> interrupt was enabled already, and there is no code that disables it
> -> this is a no-op sequence.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
