Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1CE4F297F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47D417F4;
	Tue,  5 Apr 2022 11:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47D417F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151297;
	bh=A4/cLM5NPo8irk/vpe7YE2iwcgOutJwMOohvACQXNIQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2wq+lLyKPhf4IeCFTk0zzK0zL3ZXffDF/Et+oPuqn5hkSdxi+XXu1SmECrV4EgRM
	 v0/8+fEyncl7YLfqgdVSvSFpJk9eNBRyPcGWLcw+Lv584jwa/ShEEUf9/bWZ2cdlz4
	 7+P3jEkbh9iUG7hy7vbewWNQuTmtrSoFZr4QXj0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E1FF80543;
	Tue,  5 Apr 2022 11:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3103DF8053E; Tue,  5 Apr 2022 11:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40325F8053C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40325F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="le/sBVDl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F24EB81CB5;
 Tue,  5 Apr 2022 09:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8C2C385A2;
 Tue,  5 Apr 2022 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151082;
 bh=A4/cLM5NPo8irk/vpe7YE2iwcgOutJwMOohvACQXNIQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=le/sBVDlea0jPsjUT6cnlIpQm41Q0Zc3AatcaUBcVU/Za1NcXE0f21mYzoladnjrh
 6zY022gpr3oSehDSCgDzKWgbLEhQN/FlWh3rx8TGn9nUdG+PP6v77D2GPp4p8E+0GK
 UFHd+KMCghI3PZ3qZ2vwg7PvRWtzL/WFn0doz+lRqSbRQIccajDNPnUNKhxVev6C8a
 wabnJm+Ecq9n0ZdyizW9frXLeKDd1KFEcRFY+iM3Uze8PEbIDcOkPq4Nf6Plma2On9
 52KcSTQ21iZ8IcEbI8hkqpQvvDokBG6FL+YaRtx17HcypsQfhEYiWcYMkXrr0jARlV
 1VnxuJm7sPoUg==
From: Mark Brown <broonie@kernel.org>
To: xiam0nd.tong@gmail.com, oder_chiou@realtek.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz
In-Reply-To: <20220327081300.12962-1-xiam0nd.tong@gmail.com>
References: <20220327081300.12962-1-xiam0nd.tong@gmail.com>
Subject: Re: [PATCH] codecs: rt5682s: fix an incorrect NULL check on list
 iterator
Message-Id: <164915108018.276574.3161764909349816004.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, derek.fang@realtek.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Sun, 27 Mar 2022 16:13:00 +0800, Xiaomeng Tong wrote:
> The bug is here:
>             if (!dai) {
> 
> The list iterator value 'dai' will *always* be set and non-NULL
> by for_each_component_dais(), so it is incorrect to assume that
> the iterator value will be NULL if the list is empty or no element
> is found (In fact, it will be a bogus pointer to an invalid struct
> object containing the HEAD). Otherwise it will bypass the check
> 'if (!dai) {' (never call dev_err() and never return -ENODEV;)
> and lead to invalid memory access lately when calling
> 'rt5682s_set_bclk1_ratio(dai, factor);'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] codecs: rt5682s: fix an incorrect NULL check on list iterator
      commit: acc72863e0f11cd0bedc888b663700229f9ba5ff

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
