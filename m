Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A34435A4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 19:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6750A16A0;
	Tue,  2 Nov 2021 19:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6750A16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635877920;
	bh=1yFmPUSLjQ6coZuPz6HKIjZgNys614LuubH4dIqXbWU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXs+KdIPXILhXLh4rxpqTRH6GUKZvHN/jlMXCMzGnbfOxNrbBYqtlaPMD51HELkmE
	 kD+sMLD2wzMOPfEYqxN9H2C2EgkSq0xJFa+xmGqG8iXGRBsS+9unVvmyQEaDzhzFbP
	 GdGCMc/6uYNcXp7ygjbPkMcdZ8vAG6ZQXdExmxR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAABCF8025D;
	Tue,  2 Nov 2021 19:30:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B52F8025D; Tue,  2 Nov 2021 19:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35650F8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 19:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35650F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="siESjPkS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A6661050;
 Tue,  2 Nov 2021 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635877834;
 bh=1yFmPUSLjQ6coZuPz6HKIjZgNys614LuubH4dIqXbWU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=siESjPkSKl5UHDw6/omsoUlDt0CmvEesN3M5wkcOwGnfcf4wwWFFNnkN13oVZtiMc
 QlagBst37O5BzgWx+qH0UdSGgmM8p5GMqlo7D4660ML+pAy9vG012pdci8tI/Wo39h
 Z54Rr+JowHJ3JyOj7Exeb+Hjj3WIozlHoa0D1Sa4esMB/q3ObBQgeWteLgs/1Jpx8Y
 wmZ1UWKqOraj9ZD81fb1Hr2SWZEbnPKrNHHVi/hv6vi084yrCGd91TZTxSxC0UZ/YA
 Gn/1Ut6c1K8N9Yus/5sPonk1KXqZJ7boRreHh3dV9SvFjS8f7OAd/3nqRExsil0Km5
 aFjwQ+nBNP7wA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 perex@perex.cz, lgirdwood@gmail.com, mikhail_durnev@mentor.com,
 joe@perches.com
In-Reply-To: <4c0e893cbfa21dc76c1ede0b6f4f8cff42209299.1634586167.git.christophe.jaillet@wanadoo.fr>
References: <4c0e893cbfa21dc76c1ede0b6f4f8cff42209299.1634586167.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: rsnd: Fix an error handling path in
 'rsnd_node_count()'
Message-Id: <163587783174.970357.16497711772885268572.b4-ty@kernel.org>
Date: Tue, 02 Nov 2021 18:30:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Mon, 18 Oct 2021 21:44:16 +0200, Christophe JAILLET wrote:
> If we return before the end of the 'for_each_child_of_node()' iterator, the
> reference taken on 'np' must be released.
> 
> Add the missing 'of_node_put()' call.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: Fix an error handling path in 'rsnd_node_count()'
      commit: 173632358fde7a567f28e07c4549b959ee857986

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
