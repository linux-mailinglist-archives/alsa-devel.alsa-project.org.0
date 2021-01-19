Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2622FB9D3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3800B18AA;
	Tue, 19 Jan 2021 15:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3800B18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068054;
	bh=qxNVJaCd1A2eYCrKmv6RdrjjKvh15c8Zqp3Z6CRJSno=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPoVR0lmmmNIVShMobh2gEoTEW1qrzCx/BgYF0M+4cvbkuL6UBX1fK46bp+NkWSi4
	 tPzteA0ImXePgOZkdQYErjpRhOlR5DY52949GZaT5v7Momth8rszh1T0fxU1amumpL
	 XB2L1xYIeuY/aVghXWc8oSo+G8qkkw37j7s9gm6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E26F80117;
	Tue, 19 Jan 2021 15:53:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DDFAF80272; Tue, 19 Jan 2021 15:53:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41EEEF80255
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41EEEF80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zw6gIJz9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54B7B22241;
 Tue, 19 Jan 2021 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611067977;
 bh=qxNVJaCd1A2eYCrKmv6RdrjjKvh15c8Zqp3Z6CRJSno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zw6gIJz9J8Dkh3C8aPffue9lQz5JRjQ0/BCqd6vB9rfolgW9GNePqh+edfMAuNcQR
 MdwWbXeXbmQEdcWNj2Z9Kmz9ugGvMKrQRbLVaUeXOSkUtfGy2DXtkRg50UG9r2AheR
 p6w6mrBy8zxVTHB1/zcZ2mVES1K3q/8cm1LbGm4tXWOmbKhW1IajL+A841Di8o7OxF
 BtJ7LFF3H0VEHmY2gicHNvFEZ5N+jjmOy8uag+SYQqhiW1mqOkxZJnrd2fJ99LKd/T
 A/nPe0jiIFnNJ8jCa2LIYf7MP2q0ZFz5LyhOpnua0JXYojbCevxtFiV7zm6uXdXWHi
 qXYqf9pKMe5Mg==
Date: Tue, 19 Jan 2021 20:22:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: cadence: reduce timeout on transactions
Message-ID: <20210119145251.GT2771@vkoul-mobl>
References: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
 <20210115061651.9740-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115061651.9740-3-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 15-01-21, 14:16, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Currently the timeout for SoundWire individual transactions is 2s.
> 
> This is too large in comparison with the enumeration and completion
> timeouts used in codec drivers.
> 
> A command will typically be handled in less than 100us, so 500ms for
> the command completion is more than generous.

Applied, thanks

-- 
~Vinod
