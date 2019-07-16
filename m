Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD236B231
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 01:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07160168D;
	Wed, 17 Jul 2019 01:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07160168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563318301;
	bh=o6UNyhBTsS0ycRCWsPFL2SDUpXpG+RPvZsNa68CJx+A=;
	h=Date:From:To:To:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0H9OOfg5c9EE8653hzPT3zVrlsQl6RcNRwbqoPEKc2uB1XrwrPlHlTEuUS1/vHXK
	 w5bbGVLNW07j4+ft7/jsf7gXdb1UmUF4MPzcFolTC7//qkb2KhVIp0H6HUZ4dJrVDN
	 lghosdHB4pQBSnqEs8ElyEy2OEckk4OtcriPcqsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CA3F80376;
	Wed, 17 Jul 2019 01:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC84F80376; Wed, 17 Jul 2019 01:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9F8F800C6
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 01:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9F8F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lVGDNpcQ"
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E581D21743;
 Tue, 16 Jul 2019 23:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563318188;
 bh=MyaDXyUXqqVwCX2pz9xvaZgr+tnf2doAPue0wFWeh6Y=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=lVGDNpcQamZj1qwQHGy9RLDa3KyLs1AHI+h3n2Ea0FTcP/CQBUr/QhaFshWgWzzTA
 8BYZ7mJuvizjJdp0c2E9unR2INkQeV5hB+vKOHcVWI8EG15jDDl6O+W7CcpjjvN84+
 LyYk6FOlkpje41YXxLAd4LaqvFDxInBKSjZG8W4E=
Date: Tue, 16 Jul 2019 23:03:06 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20190716072134.10009-1-hui.wang@canonical.com>
References: <20190716072134.10009-1-hui.wang@canonical.com>
Message-Id: <20190716230307.E581D21743@mail.kernel.org>
Cc: stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek: apply ALC891 headset
	fixup to one Dell machine
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.2.1, v5.1.18, v4.19.59, v4.14.133, v4.9.185, v4.4.185.

v5.2.1: Build OK!
v5.1.18: Build OK!
v4.19.59: Build OK!
v4.14.133: Build OK!
v4.9.185: Build OK!
v4.4.185: Failed to apply! Possible dependencies:
    78f4f7c2341f ("ALSA: hda/realtek - ALC891 headset mode for Dell")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
