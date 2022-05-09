Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5B51F48F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 08:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDC921895;
	Mon,  9 May 2022 08:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDC921895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652077955;
	bh=4TIx1E6FlF7YHG/uNt/9l6SCt1BMcj3v5sx2IOZx3Yw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhPkM1E7ehD6eKobkTJaoiJ+7i9wImbVVIHpoVkDjOytM8qgNL5NaKVDseXK4Idfb
	 ypw3pqgKuP25mvleUzHEtrx5ab8uWk71P3ugmEw2PiCFgvA+kZsBdOw8tl6hmpO9ho
	 lYAZLWuiQltwfQiNNvoztd9E+WwRwaPp0XKfieyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83466F802E3;
	Mon,  9 May 2022 08:31:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9789EF80269; Mon,  9 May 2022 08:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32102F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 08:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32102F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H1qvUgiy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB9F06114C;
 Mon,  9 May 2022 06:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED84C385AB;
 Mon,  9 May 2022 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652077898;
 bh=4TIx1E6FlF7YHG/uNt/9l6SCt1BMcj3v5sx2IOZx3Yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H1qvUgiy3z6BACuGLfNCfuvmd14Br6VMFcz9E6HOw0oBZeTaqbLnUe8SC+qj3Akrd
 VVAWT89Zu95U1pp9mxqQN86s3f0bEtgkVn+EfN6ENFIGJ9lMvs+BOq6Q0hhxhuaob7
 fs0CXwiF+pMlkfTp34MMJItBBYnIVLtcvhM3+qBdz9tD6JryGDw+EPbHYHl7MUDU75
 MiZlWPwThCjpVcJEQKJi+MbuF8l7vGfGu7Xjscs46g3E4TQ0rY/jAso79lkmgoOz4J
 CzM80UtZmebacbXuXNlKSVuoUg2hzlY32Y08OBBf8kzpbwuHD6CxfKVvrKCZVjxS2m
 X/mKsbBl84Emw==
Date: Mon, 9 May 2022 12:01:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] soundwire: pm runtime improvements
Message-ID: <Yni1Rc1ONlMH82bt@matsya>
References: <20220420023241.14335-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420023241.14335-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 20-04-22, 10:32, Bard Liao wrote:
> This series provides a solution to solve a corner case issue where the
> manager device may become pm_runtime active, but without ALSA/ASoC
> requesting any functionality from the peripherals. In this case, the
> hardware peripheral device will report as ATTACHED and its initialization
> routine will be executed. If this initialization routine initiates any
> sort of deferred processing, there is a possibility that the manager could
> suspend without the peripheral suspend sequence being invoked: from the
> pm_runtime framework perspective, the peripheral is *already* suspended.

Applied, thanks

-- 
~Vinod
