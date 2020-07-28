Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79BD23098B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 14:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE381673;
	Tue, 28 Jul 2020 14:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE381673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595937874;
	bh=zq0QFR15LKAQyhej+djI+MUkQdCC1czmdACzur8Ut2k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkgmL2br87CK32tII40G4FYhrK0llyqGnVmUr5RatmefALk2yWP3RL1lx+ewQEVG0
	 AL000cDTJ1OMXyyZdnzV0JT6fe7hrz/TqdCRmesbHUtFugPEJzLtd4C3zm6OY09so8
	 +9lqOm5t38FbSsowdNgtWXVlFx9LuHN3MuR4jtF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC7AF80227;
	Tue, 28 Jul 2020 14:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03585F800AD; Tue, 28 Jul 2020 14:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C364F800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 14:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C364F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B/Dajtog"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 240C9206D7;
 Tue, 28 Jul 2020 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595937762;
 bh=zq0QFR15LKAQyhej+djI+MUkQdCC1czmdACzur8Ut2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/DajtogiCq73EE+MTHxDDTib0zZnQ58tzBIMySb0wXnNa+yXuapmd4ptlifCbhVH
 FamrV9E/fh+I145MiYKVqhxs3v2RbVQcG5K28n2H0TXc8995IBdu1GrrxNvy/sFZ/K
 7u48MEWQIUzwQKrgAaY2Wy8SASnOKPENjxkpsVYA=
Date: Tue, 28 Jul 2020 17:32:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 00/10] ASoC: qdsp6: add gapless compressed audio support
Message-ID: <20200728120237.GZ12965@vkoul-mobl>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org
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

On 27-07-20, 10:37, Srinivas Kandagatla wrote:
> This patchset adds gapless compressed audio support on q6asm.
> Gapless on q6asm is implemented using 2 streams in a single q6asm session.
> 
> First few patches such as stream id per each command, gapless flags
> and silence meta data are for preparedness for adding gapless support.
> Last patch implements copy callback to allow finer control over buffer offsets,
> specially in partial drain cases.
> 
> This patchset is tested on RB3 aka DB845c platform.
> 
> This patchset as it is will support gapless however QDSP can also
> support switching decoders on a single stream. Patches to support such feature
> are send in different patchset which involves adding generic interfaces.

The lgtm so:
Reviewed-by: Vinod Koul <vkoul@kernel.org>

tested on Dragon Board RB3:

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
