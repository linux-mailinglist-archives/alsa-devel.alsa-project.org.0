Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1A57E791
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 21:41:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E1218E7;
	Fri, 22 Jul 2022 21:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E1218E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658518883;
	bh=VHs38k86FD8Ipse+90wcagxiXIrg0RPFHyV7c6mJ+64=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvSr00LkcXQKql0cWHju1lhvVLu3VTrNFm9TlwXv/praWYljY+sN00JxuzZRZnjXx
	 8yGSBsSRK1VAUNGzcdmnO/TUN3/l7gCql1X9dcs3tK86Sihu/olJtgpWAP1uPV66GM
	 GFieDqU41FKq5rsjTZVp1RTFx+ng8KNwjcjwzpP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09482F8012A;
	Fri, 22 Jul 2022 21:39:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F828F80537; Fri, 22 Jul 2022 21:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09AAF8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 21:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09AAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rmmlAToJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7B1061E94;
 Fri, 22 Jul 2022 19:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4DDC341C6;
 Fri, 22 Jul 2022 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658518775;
 bh=VHs38k86FD8Ipse+90wcagxiXIrg0RPFHyV7c6mJ+64=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rmmlAToJHxOlSd+lXyzxqoLDHJxLNVXR0jYmTDZOW6dOP1oWf7Kd1b4EgT3/LYuYX
 CKqhNZbCNPsPJnYzq70fkkRfRj6s5fIpWRV851NUzounrBQvNUeIm7yemANusup0pQ
 clYcQJ6LKrd7cq9X7aBQDU9Cg3Gsufj704tzGdccOsEkAKNWlcMvSut9vwNkmpxnd6
 /oRTAnlwNs61jSD40S+5decNTMpJ020WHU4OhkaeQUh2sHRdzvdFeDEV6WNTxv+5Er
 wYw+TTp6+R9bSLmX9lSmNd+7+q9oV91syjwGpJ9LAq2vMt3EN66EpY+TAlwmu+HSlB
 des/itefRM1mA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220722094851.92521-1-ckeepax@opensource.cirrus.com>
References: <20220722094851.92521-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] firmware: cs_dsp: Add pre_stop callback
Message-Id: <165851877383.1163063.17627437769670549231.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 20:39:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Fri, 22 Jul 2022 10:48:50 +0100, Charles Keepax wrote:
> The code already has a post_stop callback, add a matching pre_stop
> callback to the client_ops that is called before execution is stopped.
> This callback provides a convenient place for the client code to
> communicate with the DSP before it is stopped.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] firmware: cs_dsp: Add pre_stop callback
      commit: dea997733575c5793ca77e166bbbf89097987eb4
[2/2] firmware: cs_dsp: Add memory chunk helpers
      commit: a4b976552f122ea851f556769874022cf097741e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
