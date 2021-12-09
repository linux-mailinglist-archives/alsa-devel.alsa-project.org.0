Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2057546E95A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 14:47:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9854821F7;
	Thu,  9 Dec 2021 14:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9854821F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639057631;
	bh=nzHJ+8AUgscYkeKl42+DtprhAE5fDcB0eMN1+c5CDg8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXK6Kd5nmr5tF+t9eScAnGEI/pzTnaawHN6cjWi0n5NsMoEmkGmRU14r7Ffh5hpfD
	 t4A6NOpYicZtjZkIdbiVFD/+utKDL5sB/h+moYJHV5FVrrIdOjpZnz/Jm5KKEefQ4x
	 o2ukxXSFFhzdWqu+pr2GV09RP7ufmEZkdSZxXQ2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0146CF802A9;
	Thu,  9 Dec 2021 14:46:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44A4F8028D; Thu,  9 Dec 2021 14:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFCF9F800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 14:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFCF9F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GjFY2KAg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21627B8245E;
 Thu,  9 Dec 2021 13:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68540C341C7;
 Thu,  9 Dec 2021 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639057546;
 bh=nzHJ+8AUgscYkeKl42+DtprhAE5fDcB0eMN1+c5CDg8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GjFY2KAgxOB3/B5Dv8BE3Zhq+MjQkHI1wBUQUnFyNRttv/4quQ2wtmcxlCyFsdMJP
 yTntvXjxRei4oh5no34BYOXB7Jew3bsdeFZMq1HzjbSih9SGzpX2nnfQl50LBMtGdX
 88MEWAGxPcF8lzpQuRnKuDNOcJDRVDg0uJWENKb3k5/s/LWkZxbLf2q/Y5aYWQVd9m
 LhRc7IeaZZn1f0WIIMu4Duh1//Uc2uU6xKdr3Le5nz153Z6OckyNXb1+S4I+mpJDx4
 Zwyo/+zTp/XsEc5RhsYzBW0FycTj5nqAGdbkbiIhITYhKI8nghVoj32E5CAby30Nvp
 BaMTTcPdQdtfg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, perex@perex.cz,
 kuninori.morimoto.gx@renesas.com, Ameer Hamza <amhamza.mgc@gmail.com>,
 lgirdwood@gmail.com, tiwai@suse.com
In-Reply-To: <20211207142309.222820-1-amhamza.mgc@gmail.com>
References: <Ya9YxoUqkATCOASh@sirena.org.uk>
 <20211207142309.222820-1-amhamza.mgc@gmail.com>
Subject: Re: [PATCH v2] ASoC: test-component: fix null pointer dereference.
Message-Id: <163905754513.1053127.9268237437282458172.b4-ty@kernel.org>
Date: Thu, 09 Dec 2021 13:45:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
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

On Tue, 7 Dec 2021 19:23:09 +0500, Ameer Hamza wrote:
> Dereferncing of_id pointer will result in exception in current
> implementation since of_match_device() will assign it to NULL.
> Adding NULL check for protection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: test-component: fix null pointer dereference.
      commit: c686316ec1210d43653c91e104c1e4cd0156dc89

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
