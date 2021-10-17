Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27143086D
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 13:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5671877;
	Sun, 17 Oct 2021 13:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5671877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634470845;
	bh=ohuMuYmmuyqyemJ4Qv+2X0qk6HWlk0oTy0Gz89ptlUo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7bW0rIRpOfY7b4QTZOESozvBtX0wo83HVkBNpeldv8avR79egq6QCybCBbD9U/2J
	 aV7iGjJYcray/J8D3zEbsLgZ06eCaib+zhRX8q/fZlR+PCciC2qCw/WLFfWIK2iUXa
	 nNj1UQQB7Q4zIWCvmqzvH+vkeIxuKQ78F209IWRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE12F8026C;
	Sun, 17 Oct 2021 13:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A04AF80256; Sun, 17 Oct 2021 13:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE1EDF800E5
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 13:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1EDF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fv8qMW6b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF72160F56;
 Sun, 17 Oct 2021 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634470760;
 bh=ohuMuYmmuyqyemJ4Qv+2X0qk6HWlk0oTy0Gz89ptlUo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fv8qMW6bkN0agW2c4cNgIEbetZ3JiM7DYltNzcFsbFJvRfmprlEBrODU/Ql3DOYyu
 r24ViDHOEcEdUQKjXHX9T27Pz5tFz8B/S0UhnwvQW/dJdxty4XeOHaG22aNt8BU2FY
 ba7yPcoY3u6ElSA6/JLK3vW1JnPtrCXAHn/m+nQmoswk6SzNrJBFpkX4YFYqc/dRG8
 jJ/BzR4aY9cT9aMqcuZlOdHUNJDJG0olbNfSxB2K3WjVImjJAigQdMEnXeAFTda/Vf
 h+CApieJzBHKu1aNpRdxo0krso6aVAw5UG8HFg+lx/MRymFZ86mWdNqFagWKiPI2Zh
 QCz/N1vr6jmVQ==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
In-Reply-To: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
References: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
Subject: Re: (subset) [PATCH 0/4] Getting rid of the reset controller in
 i2s-tdm
Message-Id: <163447061131.1864024.8259786717418291207.b4-ty@kernel.org>
Date: Sun, 17 Oct 2021 12:36:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
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

On Sat, 16 Oct 2021 12:53:49 +0200, Nicolas Frattaroli wrote:
> after some discussion with Heiko on IRC, he has admitted to me
> that the rockchip,cru property, and its corresponding half a reset
> controller in the driver, is weighing heavily on his mind.
> 
> The background is that if the lrck only uses one clock for both rx
> and tx direction, then according to the downstream driver, the rx
> and tx resets should be asserted at roughly the same time to keep
> things in sync.
> 
> [...]

Applied, thanks!

[1/4] ASoC: rockchip: i2s-tdm: Strip out direct CRU use
      commit: d6365d0f0a03c1feb28d86dfd192972ddc647013
[2/4] ASoC: dt-bindings: rockchip: i2s-tdm: Drop rockchip,cru property
      commit: 4e52cb9e2c22c9d860910794c82461064baadd9f

Best regards,
-- 
Mark Brown <broonie@kernel.org>
